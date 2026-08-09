extends Control

class LyricsParser:
	extends RefCounted

	## 轻量级标准 LRC 解析器。
	##
	## 每条歌词使用以下结构：
	##     {"time": 12.34, "text": "歌词内容"}
	##
	## 支持：
	## - [mm:ss]、[mm:ss.xx]、[mm:ss.xxx]
	## - 一行多个时间戳
	## - [offset:+/-毫秒]
	## - UTF-8 BOM、CRLF
	## - 忽略网易云 JSON 元信息和普通 LRC 元数据标签

	const TIME_KEY := "time"
	const TEXT_KEY := "text"

	const _TIMESTAMP_PATTERN := "\\[(\\d{1,3}):(\\d{2})(?:[\\.,](\\d{1,3}))?\\]"
	const _OFFSET_PATTERN := "(?i)^\\[offset\\s*:\\s*([+-]?\\d+)\\]\\s*$"


	static func parse_file(path: String) -> Array[Dictionary]:
		var file := FileAccess.open(path, FileAccess.READ)
		if file == null:
			push_warning("无法读取 LRC 文件：%s（错误码 %s）" % [path, FileAccess.get_open_error()])
			return []

		return parse_text(file.get_as_text())


	static func parse_text(content: String) -> Array[Dictionary]:
		var timestamp_regex := RegEx.new()
		if timestamp_regex.compile(_TIMESTAMP_PATTERN) != OK:
			push_error("LRC 时间戳正则表达式编译失败")
			return []

		var offset_regex := RegEx.new()
		if offset_regex.compile(_OFFSET_PATTERN) != OK:
			push_error("LRC offset 正则表达式编译失败")
			return []

		var entries: Array[Dictionary] = []
		var offset_seconds := 0.0
		var source_order := 0

		for raw_line in content.split("\n"):
			var line := str(raw_line).trim_prefix("\ufeff").strip_edges()
			if line.is_empty() or _is_json_metadata(line):
				continue

			var offset_match := offset_regex.search(line)
			if offset_match != null:
				offset_seconds = float(offset_match.get_string(1)) / 1000.0
				continue

			var timestamp_matches := timestamp_regex.search_all(line)
			if timestamp_matches.is_empty():
				# [ar:]、[ti:]、[al:] 等元数据没有时间戳，会在这里被忽略。
				continue

			var lyric_text := timestamp_regex.sub(line, "", true).strip_edges()
			for timestamp_match in timestamp_matches:
				var minute := int(timestamp_match.get_string(1))
				var second := int(timestamp_match.get_string(2))
				var fraction_text := timestamp_match.get_string(3)
				var fraction_seconds := _parse_fraction_seconds(fraction_text)

				entries.append({
					TIME_KEY: float(minute * 60 + second) + fraction_seconds,
					TEXT_KEY: lyric_text,
					"_source_order": source_order,
				})
				source_order += 1

		for entry in entries:
			entry[TIME_KEY] = maxf(0.0, float(entry[TIME_KEY]) + offset_seconds)

		entries.sort_custom(_sort_entries)
		for entry in entries:
			entry.erase("_source_order")

		return entries


	static func find_current_index(entries: Array[Dictionary], playback_seconds: float) -> int:
		## 返回播放位置对应的最后一条歌词索引；第一条歌词开始前返回 -1。
		if entries.is_empty():
			return -1

		var low := 0
		var high := entries.size() - 1
		var result := -1

		while low <= high:
			var middle := low + floori(float(high - low) * 0.5)
			var timestamp := float(entries[middle].get(TIME_KEY, INF))
			if timestamp <= playback_seconds:
				result = middle
				low = middle + 1
			else:
				high = middle - 1

		return result


	static func get_current_line(entries: Array[Dictionary], playback_seconds: float) -> String:
		var current_index := find_current_index(entries, playback_seconds)
		if current_index < 0:
			return ""
		return str(entries[current_index].get(TEXT_KEY, ""))


	static func get_three_lines(entries: Array[Dictionary], playback_seconds: float) -> Array[String]:
		## 返回“上一行、当前行、下一行”。第一条开始前会把首行放在下一行位置。
		var lines: Array[String] = ["", "", ""]
		if entries.is_empty():
			return lines

		var current_index := find_current_index(entries, playback_seconds)
		if current_index < 0:
			lines[2] = str(entries[0].get(TEXT_KEY, ""))
			return lines

		if current_index > 0:
			lines[0] = str(entries[current_index - 1].get(TEXT_KEY, ""))
		lines[1] = str(entries[current_index].get(TEXT_KEY, ""))
		if current_index + 1 < entries.size():
			lines[2] = str(entries[current_index + 1].get(TEXT_KEY, ""))

		return lines


	static func _parse_fraction_seconds(fraction_text: String) -> float:
		if fraction_text.is_empty():
			return 0.0
		return float(fraction_text) / pow(10.0, fraction_text.length())


	static func _sort_entries(left: Dictionary, right: Dictionary) -> bool:
		var left_time := float(left.get(TIME_KEY, 0.0))
		var right_time := float(right.get(TIME_KEY, 0.0))
		if not is_equal_approx(left_time, right_time):
			return left_time < right_time
		return int(left.get("_source_order", 0)) < int(right.get("_source_order", 0))


	static func _is_json_metadata(line: String) -> bool:
		return (line.begins_with("{") and line.ends_with("}")) \
			or (line.begins_with("[{\"") and line.ends_with("}]"))


class PlaybackController:
	extends Node

	signal track_changed(album_index: int, track_index: int, track: Dictionary)
	signal playback_state_changed(state: PlaybackState)
	signal play_mode_changed(mode: PlayMode)
	signal position_changed(position_seconds: float, duration_seconds: float)
	signal queue_changed(album_index: int)
	signal playback_error(message: String)
	signal exclusive_playback_changed(active: bool)

	enum PlaybackState {
		IDLE,
		PLAYING,
		PAUSING,
		PAUSED,
		TRANSITIONING,
		STOPPING,
		ERROR,
	}

	enum PlayMode {
		LOOP_ALL,
		SHUFFLE,
		REPEAT_ONE,
	}

	const PLAYER_BUS := &"MusicPlayer"
	const SILENT_DB := -80.0
	const CROSSFADE_DURATION := 0.42
	const PAUSE_FADE_DURATION := 0.45
	const RESUME_FADE_EDGE_SECONDS := 3.0
	const POSITION_UPDATE_INTERVAL := 0.04

	var albums: Array = []
	var current_album_index := 0
	var current_track_index := -1
	var state := PlaybackState.IDLE
	var play_mode := PlayMode.LOOP_ALL

	var _player_a: AudioStreamPlayer
	var _player_b: AudioStreamPlayer
	var _active_player: AudioStreamPlayer
	var _transition_tween: Tween
	var _transition_token := 0
	var _position_accumulator := 0.0
	var _duration := 0.0
	var _shuffle_bag: Array[int] = []
	var _shuffle_history: Array[int] = []
	var _exclusive_active := false
	var _is_stopping := false
	var _paused_at_end := false
	var _album_states: Array[Dictionary] = []


	func _ready() -> void:
		_player_a = _create_player("PlayerA")
		_player_b = _create_player("PlayerB")
		set_process(true)


	func _create_player(player_name: String) -> AudioStreamPlayer:
		var player := AudioStreamPlayer.new()
		player.name = player_name
		player.bus = PLAYER_BUS
		player.volume_db = SILENT_DB
		add_child(player)
		player.finished.connect(_on_player_finished.bind(player))
		return player


	func configure(catalog_albums: Array) -> void:
		albums = catalog_albums
		_album_states.clear()
		for album in albums:
			_album_states.append({
				"initialized": false,
				"track_index": 0,
				"position": 0.0,
			})
		current_album_index = clampi(current_album_index, 0, maxi(albums.size() - 1, 0))
		_reset_shuffle_state()
		queue_changed.emit(current_album_index)


	func set_queue(album_index: int) -> void:
		if not _is_valid_album(album_index):
			return
		if current_album_index == album_index:
			return
		if current_track_index >= 0 or is_instance_valid(_active_player):
			stop(false)
		current_album_index = album_index
		current_track_index = -1
		_reset_shuffle_state()
		queue_changed.emit(current_album_index)


	func play_album(album_index: int) -> void:
		if not _is_valid_album(album_index):
			return
		var saved_state := get_album_state(album_index)
		var track_index := int(saved_state.get("track_index", 0))
		var restore_position := float(saved_state.get("position", 0.0))
		if not bool(saved_state.get("initialized", false)) or not _is_valid_track(album_index, track_index):
			track_index = 0
			restore_position = 0.0
		play_track(album_index, track_index, restore_position)


	func get_album_state(album_index: int) -> Dictionary:
		if album_index < 0 or album_index >= _album_states.size():
			return {
				"initialized": false,
				"track_index": 0,
				"position": 0.0,
			}
		return _album_states[album_index].duplicate(true)


	func set_album_resume_position(album_index: int, track_index: int, position: float) -> bool:
		if not _is_valid_track(album_index, track_index):
			return false
		var track: Dictionary = albums[album_index]["tracks"][track_index]
		var duration := maxf(float(track.get("duration", 0.0)), 0.0)
		var target := clampf(position, 0.0, duration if duration > 0.0 else maxf(position, 0.0))
		_update_album_state(album_index, track_index, target)
		return true


	func play_track(album_index: int, track_index: int, start_position := 0.0) -> void:
		if not _is_valid_track(album_index, track_index):
			_fail("音乐索引无效：专辑 %d，曲目 %d" % [album_index, track_index])
			return

		var track: Dictionary = albums[album_index]["tracks"][track_index]
		var audio_path := str(track.get("audio", ""))
		if audio_path.is_empty() or not ResourceLoader.exists(audio_path):
			_fail("音乐资源不存在：%s" % audio_path)
			return

		var stream := ResourceLoader.load(audio_path) as AudioStream
		if stream == null:
			_fail("音乐资源加载失败：%s" % audio_path)
			return

		_remember_current_album_state()
		_is_stopping = false
		_paused_at_end = false
		_cancel_transition(true, false)
		_transition_token += 1
		var token := _transition_token
		var outgoing := _active_player
		var outgoing_was_paused := is_instance_valid(outgoing) and outgoing.stream_paused
		var incoming := _player_a if outgoing != _player_a else _player_b

		if incoming == outgoing:
			incoming = _player_b
		_stop_and_release(incoming)
		incoming.stream = stream
		incoming.stream_paused = false
		incoming.volume_db = SILENT_DB
		incoming.play()

		var album_changed := current_album_index != album_index
		current_album_index = album_index
		current_track_index = track_index
		_active_player = incoming
		_duration = _resolve_duration(stream, track)
		var safe_start_position := _sanitize_restore_position(float(start_position), _duration)
		if safe_start_position > 0.0:
			incoming.seek(safe_start_position)
		_update_album_state(album_index, track_index, safe_start_position)
		if album_changed:
			_reset_shuffle_state()
		else:
			_remove_from_shuffle_bag(track_index)

		track_changed.emit(album_index, track_index, track)
		position_changed.emit(safe_start_position, _duration)
		queue_changed.emit(album_index)
		_set_exclusive_active(true)
		_set_state(PlaybackState.TRANSITIONING)

		_transition_tween = create_tween()
		_transition_tween.set_parallel(true)
		_transition_tween.set_trans(Tween.TRANS_CUBIC)
		_transition_tween.set_ease(Tween.EASE_IN_OUT)
		_transition_tween.tween_property(incoming, "volume_db", 0.0, CROSSFADE_DURATION)
		if outgoing_was_paused:
			_stop_and_release(outgoing)
		elif is_instance_valid(outgoing) and outgoing != incoming and outgoing.playing:
			outgoing.stream_paused = false
			_transition_tween.tween_property(outgoing, "volume_db", SILENT_DB, CROSSFADE_DURATION)
		_transition_tween.chain().tween_callback(_complete_transition.bind(token, outgoing, incoming))


	func toggle_pause() -> void:
		if current_track_index < 0 or not is_instance_valid(_active_player):
			play_track(current_album_index, 0)
			return

		if state in [PlaybackState.PAUSED, PlaybackState.PAUSING]:
			_resume_playback()
		elif state in [PlaybackState.PLAYING, PlaybackState.TRANSITIONING]:
			_pause_playback()


	func pause() -> void:
		# Album browsing and other one-way pause requests must never reuse
		# toggle_pause(), because receiving the same request while PAUSING would
		# otherwise resume the music. Remember the exact cursor before starting the
		# fade so the album can later continue from the same track and position.
		if current_track_index < 0 or not is_instance_valid(_active_player):
			return
		if state not in [PlaybackState.PLAYING, PlaybackState.TRANSITIONING]:
			return
		_remember_current_album_state()
		_pause_playback()


	func next(automatic := false) -> void:
		if albums.is_empty() or state == PlaybackState.STOPPING:
			return
		if current_track_index < 0:
			play_track(current_album_index, 0)
			return

		if automatic and play_mode == PlayMode.REPEAT_ONE:
			play_track(current_album_index, current_track_index)
			return

		var next_index := _get_next_track_index()
		play_track(current_album_index, next_index)


	func previous() -> void:
		if state == PlaybackState.STOPPING:
			return
		if current_track_index < 0:
			play_track(current_album_index, 0)
			return

		var previous_index: int
		if play_mode == PlayMode.SHUFFLE and not _shuffle_history.is_empty():
			previous_index = _shuffle_history.pop_back()
		else:
			var count := _track_count(current_album_index)
			previous_index = posmod(current_track_index - 1, count)
		play_track(current_album_index, previous_index)


	func cycle_play_mode() -> PlayMode:
		play_mode = (play_mode + 1) % PlayMode.size() as PlayMode
		_reset_shuffle_state()
		play_mode_changed.emit(play_mode)
		return play_mode


	func seek(seconds: float) -> void:
		if not is_instance_valid(_active_player) or current_track_index < 0 or state == PlaybackState.STOPPING:
			return
		var target := clampf(seconds, 0.0, maxf(_duration - 0.02, 0.0))
		if state == PlaybackState.PAUSED:
			if _active_player.stream_paused:
				# Godot does not move a stream-paused AudioStreamPlayer reliably via
				# seek(). The player is already silent here, so briefly unpause it,
				# move the cursor, and pause it again before the next audio mix.
				_active_player.stream_paused = false
				_active_player.seek(target)
				_active_player.stream_paused = true
			else:
				# A track paused exactly at its end has no live playback cursor.
				# Recreate a silent paused cursor at the requested position.
				_active_player.play(target)
				_active_player.stream_paused = true
			_paused_at_end = false
		else:
			_active_player.seek(target)
		_update_album_state(current_album_index, current_track_index, target)
		position_changed.emit(target, _duration)


	func stop(fade := true) -> void:
		_remember_current_album_state()
		_transition_token += 1
		_is_stopping = true
		_paused_at_end = false
		_set_state(PlaybackState.STOPPING)
		if is_instance_valid(_transition_tween):
			_transition_tween.kill()
			_transition_tween = null

		if not fade:
			_finish_stop()
			return

		var token := _transition_token
		_transition_tween = create_tween()
		_transition_tween.set_parallel(true)
		_transition_tween.set_trans(Tween.TRANS_CUBIC)
		_transition_tween.set_ease(Tween.EASE_OUT)
		var has_audible_player := false
		for player in [_player_a, _player_b]:
			if is_instance_valid(player) and player.playing and not player.stream_paused:
				has_audible_player = true
				_transition_tween.tween_property(player, "volume_db", SILENT_DB, 0.25)
		if not has_audible_player:
			_finish_stop()
			return
		_transition_tween.chain().tween_callback(func() -> void:
			if token == _transition_token:
				_finish_stop()
		)


	func set_player_volume(linear: float) -> void:
		var value := clampf(linear, 0.0, 1.0)
		var bus_index := AudioServer.get_bus_index(PLAYER_BUS)
		if bus_index < 0:
			return
		AudioServer.set_bus_mute(bus_index, value <= 0.0001)
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(maxf(value, 0.0001)))


	func get_position() -> float:
		if not is_instance_valid(_active_player) or current_track_index < 0:
			return 0.0
		return clampf(_active_player.get_playback_position(), 0.0, maxf(_duration, 0.0))


	func get_duration() -> float:
		return _duration


	func is_playing_or_paused() -> bool:
		return state in [PlaybackState.PLAYING, PlaybackState.PAUSING, PlaybackState.PAUSED, PlaybackState.TRANSITIONING]


	func _process(delta: float) -> void:
		_position_accumulator += delta
		if _position_accumulator < POSITION_UPDATE_INTERVAL:
			return
		_position_accumulator = 0.0
		if current_track_index >= 0:
			var position := get_position()
			_update_album_state(current_album_index, current_track_index, position)
			position_changed.emit(position, _duration)


	func _pause_playback() -> void:
		_is_stopping = false
		_kill_transition_tween()
		_transition_token += 1
		var token := _transition_token
		var pausing_player := _active_player
		var fading_players: Array[AudioStreamPlayer] = []
		for player in [_player_a, _player_b]:
			if (
				is_instance_valid(player)
				and player.stream != null
				and player.playing
				and not player.stream_paused
			):
				fading_players.append(player)
		_set_state(PlaybackState.PAUSING)
		if fading_players.is_empty():
			_paused_at_end = true
			_release_inactive_players(pausing_player)
			_set_state(PlaybackState.PAUSED)
			return

		_transition_tween = create_tween()
		_transition_tween.set_parallel(true)
		_transition_tween.set_trans(Tween.TRANS_LINEAR)
		for player in fading_players:
			var starting_gain := _get_player_linear_gain(player)
			if starting_gain <= 0.0001:
				_set_player_linear_gain(0.0, player)
				continue
			# All players fade at the same linear-gain rate. A fully audible stable
			# player therefore still takes exactly PAUSE_FADE_DURATION (0.45 s).
			_transition_tween.tween_method(
				_set_player_linear_gain.bind(player),
				starting_gain,
				0.0,
				PAUSE_FADE_DURATION * starting_gain
			)
		_transition_tween.chain().tween_callback(
			_complete_pause.bind(token, pausing_player)
		)


	func _resume_playback() -> void:
		_is_stopping = false
		var resuming_player := _active_player
		var was_pausing := state == PlaybackState.PAUSING
		var was_stream_paused := resuming_player.stream_paused
		var starting_gain := _get_player_linear_gain(resuming_player)
		var retreating_players: Array[AudioStreamPlayer] = []
		if was_pausing:
			for player in [_player_a, _player_b]:
				if (
					player != resuming_player
					and is_instance_valid(player)
					and player.stream != null
					and player.playing
					and not player.stream_paused
				):
					retreating_players.append(player)
			_kill_transition_tween()
		else:
			_cancel_transition(true, false)
		_transition_token += 1
		var token := _transition_token
		if was_stream_paused:
			# AudioStreamPlayer may report playing == false while stream_paused is true.
			# Unpausing preserves the playback cursor; calling play() here would restart it.
			resuming_player.stream_paused = false
			_paused_at_end = false
			starting_gain = 0.0
		elif _paused_at_end:
			resuming_player.play()
			starting_gain = 0.0
			_paused_at_end = false
		elif not resuming_player.playing:
			resuming_player.play()
			starting_gain = 0.0
		else:
			resuming_player.stream_paused = false
		_set_exclusive_active(true)
		_set_state(PlaybackState.PLAYING)
		if was_pausing:
			_resume_during_pause_fade(
				token,
				resuming_player,
				starting_gain,
				retreating_players
			)
			return
		if not _should_fade_resume():
			resuming_player.volume_db = 0.0
			return
		_set_player_linear_gain(starting_gain, resuming_player)
		var fade_duration := PAUSE_FADE_DURATION * (1.0 - starting_gain)
		_transition_tween = create_tween()
		_transition_tween.set_trans(Tween.TRANS_LINEAR)
		_transition_tween.tween_method(
			_set_player_linear_gain.bind(resuming_player),
			starting_gain,
			1.0,
			fade_duration
		)


	func _resume_during_pause_fade(
		token: int,
		resuming_player: AudioStreamPlayer,
		starting_gain: float,
		retreating_players: Array[AudioStreamPlayer]
	) -> void:
		_set_player_linear_gain(starting_gain, resuming_player)
		_transition_tween = create_tween()
		_transition_tween.set_parallel(true)
		_transition_tween.set_trans(Tween.TRANS_LINEAR)
		var active_fade_duration := PAUSE_FADE_DURATION * (1.0 - starting_gain)
		if active_fade_duration > 0.0001:
			_transition_tween.tween_method(
				_set_player_linear_gain.bind(resuming_player),
				starting_gain,
				1.0,
				active_fade_duration
			)
		else:
			resuming_player.volume_db = 0.0
		for player in retreating_players:
			var retreating_gain := _get_player_linear_gain(player)
			if retreating_gain <= 0.0001:
				_set_player_linear_gain(0.0, player)
				continue
			_transition_tween.tween_method(
				_set_player_linear_gain.bind(player),
				retreating_gain,
				0.0,
				PAUSE_FADE_DURATION * retreating_gain
			)
		_transition_tween.chain().tween_callback(func() -> void:
			if token != _transition_token or resuming_player != _active_player:
				return
			for player in retreating_players:
				_stop_and_release(player)
			if is_instance_valid(resuming_player):
				resuming_player.volume_db = 0.0
			_transition_tween = null
		)


	func _complete_pause(token: int, pausing_player: AudioStreamPlayer) -> void:
		if token != _transition_token or pausing_player != _active_player:
			return
		_release_inactive_players(pausing_player)
		if is_instance_valid(pausing_player):
			_set_player_linear_gain(0.0, pausing_player)
			if pausing_player.playing:
				pausing_player.stream_paused = true
			else:
				_paused_at_end = true
		_transition_tween = null
		_set_state(PlaybackState.PAUSED)


	func _release_inactive_players(active_player: AudioStreamPlayer) -> void:
		for player in [_player_a, _player_b]:
			if player != active_player:
				_stop_and_release(player)


	func _kill_transition_tween() -> void:
		if is_instance_valid(_transition_tween):
			_transition_tween.kill()
		_transition_tween = null


	func _complete_transition(token: int, outgoing: AudioStreamPlayer, incoming: AudioStreamPlayer) -> void:
		if token != _transition_token:
			return
		if is_instance_valid(outgoing) and outgoing != incoming:
			_stop_and_release(outgoing)
		if is_instance_valid(incoming):
			incoming.volume_db = 0.0
		_set_state(PlaybackState.PLAYING)
		_transition_tween = null


	func _cancel_transition(keep_active: bool, normalize_active := false) -> void:
		if is_instance_valid(_transition_tween):
			_transition_tween.kill()
		_transition_tween = null
		if not keep_active:
			return
		for player in [_player_a, _player_b]:
			if not is_instance_valid(player):
				continue
			if player == _active_player:
				if normalize_active:
					player.volume_db = 0.0
			else:
				_stop_and_release(player)


	func _finish_stop() -> void:
		_cancel_transition(false)
		_stop_and_release(_player_a)
		_stop_and_release(_player_b)
		_active_player = null
		_duration = 0.0
		current_track_index = -1
		_is_stopping = false
		_paused_at_end = false
		_set_state(PlaybackState.IDLE)
		_set_exclusive_active(false)
		position_changed.emit(0.0, 0.0)


	func _stop_and_release(player: AudioStreamPlayer) -> void:
		if not is_instance_valid(player):
			return
		player.stop()
		player.stream_paused = false
		player.volume_db = SILENT_DB
		player.stream = null


	func _on_player_finished(player: AudioStreamPlayer) -> void:
		if player != _active_player or _is_stopping or state in [PlaybackState.IDLE, PlaybackState.STOPPING, PlaybackState.ERROR, PlaybackState.PAUSED]:
			return
		if state == PlaybackState.PAUSING:
			_transition_token += 1
			_kill_transition_tween()
			_paused_at_end = true
			_set_player_linear_gain(0.0, player)
			_release_inactive_players(player)
			_set_state(PlaybackState.PAUSED)
			position_changed.emit(_duration, _duration)
			return
		if state == PlaybackState.TRANSITIONING:
			_transition_token += 1
			_cancel_transition(true, false)
		next(true)


	func _get_next_track_index() -> int:
		var count := _track_count(current_album_index)
		if count <= 1:
			return 0
		if play_mode != PlayMode.SHUFFLE:
			return (current_track_index + 1) % count

		if _shuffle_bag.is_empty():
			_refill_shuffle_bag()
		if _shuffle_bag.is_empty():
			return current_track_index
		_shuffle_history.append(current_track_index)
		return _shuffle_bag.pop_back()


	func _reset_shuffle_state() -> void:
		_shuffle_history.clear()
		_refill_shuffle_bag()


	func _refill_shuffle_bag() -> void:
		_shuffle_bag.clear()
		var count := _track_count(current_album_index)
		for index in range(count):
			if index != current_track_index:
				_shuffle_bag.append(index)
		_shuffle_bag.shuffle()


	func _remove_from_shuffle_bag(track_index: int) -> void:
		var bag_position := _shuffle_bag.find(track_index)
		if bag_position >= 0:
			_shuffle_bag.remove_at(bag_position)


	func _resolve_duration(stream: AudioStream, track: Dictionary) -> float:
		var stream_duration := stream.get_length()
		if stream_duration > 0.0:
			return stream_duration
		return maxf(float(track.get("duration", 0.0)), 0.0)


	func _update_album_state(album_index: int, track_index: int, position: float) -> void:
		if album_index < 0 or album_index >= _album_states.size() or not _is_valid_track(album_index, track_index):
			return
		var track: Dictionary = albums[album_index]["tracks"][track_index]
		var duration := maxf(float(track.get("duration", 0.0)), 0.0)
		_album_states[album_index] = {
			"initialized": true,
			"track_index": track_index,
			"position": clampf(position, 0.0, duration if duration > 0.0 else maxf(position, 0.0)),
		}


	func _remember_current_album_state() -> void:
		if current_track_index < 0 or not _is_valid_track(current_album_index, current_track_index):
			return
		_update_album_state(current_album_index, current_track_index, get_position())


	func _sanitize_restore_position(position: float, duration: float) -> float:
		if duration <= 0.0:
			return maxf(position, 0.0)
		var safe_position := clampf(position, 0.0, duration)
		if duration - safe_position <= 0.75:
			return 0.0
		return safe_position


	func _get_player_linear_gain(player: AudioStreamPlayer) -> float:
		if not is_instance_valid(player) or player.volume_db <= SILENT_DB + 0.01:
			return 0.0
		return clampf(db_to_linear(player.volume_db), 0.0, 1.0)


	func _set_player_linear_gain(gain: float, player: AudioStreamPlayer) -> void:
		if not is_instance_valid(player):
			return
		var safe_gain := clampf(gain, 0.0, 1.0)
		player.volume_db = SILENT_DB if safe_gain <= 0.0001 else linear_to_db(safe_gain)


	func _should_fade_resume() -> bool:
		var position := get_position()
		return position > RESUME_FADE_EDGE_SECONDS and _duration - position > RESUME_FADE_EDGE_SECONDS


	func _set_state(new_state: PlaybackState) -> void:
		if state == new_state:
			return
		state = new_state
		playback_state_changed.emit(state)


	func _set_exclusive_active(active: bool) -> void:
		if _exclusive_active == active:
			return
		_exclusive_active = active
		exclusive_playback_changed.emit(active)


	func _fail(message: String) -> void:
		var has_active_playback := (
			is_instance_valid(_active_player)
			and current_track_index >= 0
			and (_active_player.playing or _active_player.stream_paused)
		)
		if has_active_playback:
			push_warning(message)
		else:
			push_error(message)
			_set_state(PlaybackState.ERROR)
		playback_error.emit(message)


	func _is_valid_album(album_index: int) -> bool:
		return album_index >= 0 and album_index < albums.size()


	func _is_valid_track(album_index: int, track_index: int) -> bool:
		return _is_valid_album(album_index) and track_index >= 0 and track_index < _track_count(album_index)


	func _track_count(album_index: int) -> int:
		if not _is_valid_album(album_index):
			return 0
		return (albums[album_index].get("tracks", []) as Array).size()


class SpectrumVisualizer:
	extends Control

	## 在一个 Control 中自绘点阵频谱，避免为每个圆点创建节点。
	## 默认读取 MusicPlayer 总线上的 AudioEffectSpectrumAnalyzer。

	@export var bus_name: StringName = &"MusicPlayer":
		set(value):
			bus_name = value
			_analyzer_instance = null
			_resolve_retry_seconds = 0.0

	@export_range(8, 64, 1) var band_count := 28:
		set(value):
			band_count = value
			_resize_magnitude_buffers()

	@export_range(10.0, 200.0, 1.0) var minimum_frequency := 40.0
	@export_range(2000.0, 22000.0, 100.0) var maximum_frequency := 16000.0
	@export_range(1.0, 60.0, 1.0) var update_hz := 30.0
	@export_range(-100.0, -20.0, 1.0) var minimum_db := -60.0
	@export_range(-20.0, 0.0, 1.0) var maximum_db := -6.0
	@export_range(1.0, 50.0, 0.5) var attack_speed := 18.0
	@export_range(1.0, 30.0, 0.5) var release_speed := 6.0
	@export_range(0.0, 0.5, 0.005) var activity_threshold := 0.025
	@export_range(0.0, 0.5, 0.005) var release_activity_threshold := 0.012
	@export_range(0.0, 0.5, 0.01) var activation_hold_seconds := 0.10
	@export_range(0.0, 0.5, 0.01) var silence_hold_seconds := 0.14
	@export_range(0.5, 20.0, 0.5) var fade_in_speed := 7.0
	@export_range(0.5, 20.0, 0.5) var fade_out_speed := 2.8

	@export_group("点阵外观")
	@export_range(1.0, 8.0, 0.25) var dot_radius := 2.25
	@export_range(3.0, 20.0, 0.5) var dot_spacing := 8.0
	@export_range(1, 24, 1) var maximum_dots_per_side := 12
	@export_range(0.0, 32.0, 1.0) var horizontal_padding := 8.0
	@export_range(0.0, 32.0, 1.0) var vertical_padding := 8.0
	@export_range(0.0, 1.0, 0.01) var inactive_alpha := 0.08
	@export var active_color := Color(0.82, 0.80, 0.76, 0.72)
	@export var mirror_horizontally := true

	var _analyzer_instance: AudioEffectSpectrumAnalyzerInstance
	var _display_magnitudes: PackedFloat32Array = PackedFloat32Array()
	var _target_magnitudes: PackedFloat32Array = PackedFloat32Array()
	var _update_accumulator := 0.0
	var _resolve_retry_seconds := 0.0
	var _playback_active := false
	var _presentation_alpha := 0.0
	var _presentation_latched := false
	var _activity_seconds := 0.0
	var _silence_seconds := 0.0


	func _ready() -> void:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		clip_contents = false
		_resize_magnitude_buffers()
		_resolve_analyzer()
		visibility_changed.connect(_on_visibility_changed)
		_on_visibility_changed()


	func _process(delta: float) -> void:
		var interval := 1.0 / maxf(update_hz, 1.0)
		_update_accumulator += delta
		if _update_accumulator < interval:
			return

		var update_delta := _update_accumulator
		_update_accumulator = fmod(_update_accumulator, interval)
		_update_spectrum(update_delta)
		_update_presentation(update_delta)
		queue_redraw()


	func _draw() -> void:
		if band_count <= 0 or size.x <= 0.0 or size.y <= 0.0 or _presentation_alpha <= 0.001:
			return

		var half_height := maxf(0.0, size.y * 0.5 - vertical_padding)
		var fitting_dots := int(floor(half_height / maxf(dot_spacing, 1.0)))
		var dots_per_side := mini(maximum_dots_per_side, fitting_dots)
		if dots_per_side <= 0:
			return

		var center_y := size.y * 0.5

		for band_index in band_count:
			var magnitude := _display_magnitudes[band_index] if band_index < _display_magnitudes.size() else 0.0
			if mirror_horizontally:
				var positions := _get_mirrored_band_positions(band_index)
				_draw_band_column(positions.x, center_y, magnitude, dots_per_side)
				_draw_band_column(positions.y, center_y, magnitude, dots_per_side)
			else:
				var usable_width := maxf(0.0, size.x - horizontal_padding * 2.0)
				var horizontal_step := usable_width / maxf(float(band_count - 1), 1.0)
				var x := horizontal_padding + horizontal_step * band_index
				_draw_band_column(x, center_y, magnitude, dots_per_side)


	func _get_mirrored_band_positions(band_index: int) -> Vector2:
		var center_x := size.x * 0.5
		var half_width := maxf(0.0, center_x - horizontal_padding)
		var step := half_width / maxf(float(band_count), 1.0)
		# Low frequencies start at the outer edges and move inward. The opaque album
		# cover hides the middle of the visualizer, so this keeps the strongest bands
		# visible on both sides instead of leaving only the high-frequency side faint.
		var offset := half_width - step * (clampf(float(band_index), 0.0, maxf(float(band_count - 1), 0.0)) + 0.5)
		return Vector2(center_x - offset, center_x + offset)


	func _draw_band_column(x: float, center_y: float, magnitude: float, dots_per_side: int) -> void:
		var active_dots := int(round(magnitude * dots_per_side))
		for dot_index in range(1, dots_per_side + 1):
			var is_active := dot_index <= active_dots
			if not is_active and inactive_alpha <= 0.001:
				continue
			var color := active_color
			color.a *= _presentation_alpha
			if not is_active:
				color.a *= inactive_alpha

			var offset_y := float(dot_index) * dot_spacing
			draw_circle(Vector2(x, center_y - offset_y), dot_radius, color)
			draw_circle(Vector2(x, center_y + offset_y), dot_radius, color)


	func _notification(what: int) -> void:
		if what == NOTIFICATION_RESIZED:
			queue_redraw()


	func _update_spectrum(delta: float) -> void:
		if _display_magnitudes.size() != band_count:
			_resize_magnitude_buffers()

		if not is_instance_valid(_analyzer_instance):
			_resolve_retry_seconds -= delta
			if _resolve_retry_seconds <= 0.0:
				_resolve_analyzer()

		if _playback_active and is_instance_valid(_analyzer_instance):
			_sample_analyzer()
		else:
			for index in band_count:
				_target_magnitudes[index] = 0.0

		for index in band_count:
			var current := _display_magnitudes[index]
			var target := _target_magnitudes[index]
			var smoothing_speed := attack_speed if target > current else release_speed
			_display_magnitudes[index] = move_toward(current, target, smoothing_speed * delta)


	func _update_presentation(delta: float) -> void:
		var peak := 0.0
		for magnitude in _display_magnitudes:
			peak = maxf(peak, magnitude)
		if not _playback_active:
			_presentation_latched = false
			_activity_seconds = 0.0
			_silence_seconds = 0.0
		elif peak >= activity_threshold:
			_activity_seconds += delta
			_silence_seconds = 0.0
			if _activity_seconds >= activation_hold_seconds:
				_presentation_latched = true
		elif peak <= minf(release_activity_threshold, activity_threshold):
			_activity_seconds = 0.0
			if _presentation_latched:
				_silence_seconds += delta
				if _silence_seconds >= silence_hold_seconds:
					_presentation_latched = false
			else:
				_silence_seconds = 0.0
		else:
			# 阈值之间作为迟滞区：已显示时保持，尚未显示时重新等待稳定信号。
			_silence_seconds = 0.0
			if not _presentation_latched:
				_activity_seconds = 0.0
		var target_alpha := 1.0 if _presentation_latched else 0.0
		var speed := fade_in_speed if target_alpha > _presentation_alpha else fade_out_speed
		_presentation_alpha = move_toward(_presentation_alpha, target_alpha, speed * delta)
		if not _playback_active and peak <= 0.001 and _presentation_alpha <= 0.001:
			visible = false


	func set_playback_active(value: bool, immediate := false) -> void:
		_playback_active = value
		if value:
			if not visible:
				_reset_magnitudes()
				_presentation_alpha = 0.0
				visible = true
			set_process(true)
		elif immediate:
			_reset_magnitudes()
			_presentation_alpha = 0.0
			_reset_activity_gate()
			visible = false
		elif visible:
			set_process(true)
		queue_redraw()


	func _sample_analyzer() -> void:
		var safe_minimum := maxf(minimum_frequency, 1.0)
		var safe_maximum := maxf(maximum_frequency, safe_minimum + 1.0)
		var frequency_ratio := safe_maximum / safe_minimum
		var denominator := maxf(float(band_count), 1.0)

		for index in band_count:
			var low_frequency := safe_minimum * pow(frequency_ratio, float(index) / denominator)
			var high_frequency := safe_minimum * pow(frequency_ratio, float(index + 1) / denominator)
			var magnitude := _analyzer_instance.get_magnitude_for_frequency_range(
				low_frequency,
				high_frequency,
				AudioEffectSpectrumAnalyzerInstance.MAGNITUDE_AVERAGE
			)
			var linear_magnitude := maxf(magnitude.x, magnitude.y)
			var magnitude_db := linear_to_db(maxf(linear_magnitude, 0.000001))
			_target_magnitudes[index] = clampf(
				inverse_lerp(minimum_db, maximum_db, magnitude_db),
				0.0,
				1.0
			)


	func _resolve_analyzer() -> void:
		_analyzer_instance = null
		_resolve_retry_seconds = 1.0

		var bus_index := AudioServer.get_bus_index(bus_name)
		if bus_index < 0:
			return

		for effect_index in AudioServer.get_bus_effect_count(bus_index):
			var effect := AudioServer.get_bus_effect(bus_index, effect_index)
			if not effect is AudioEffectSpectrumAnalyzer:
				continue

			var effect_instance := AudioServer.get_bus_effect_instance(bus_index, effect_index)
			if effect_instance is AudioEffectSpectrumAnalyzerInstance:
				_analyzer_instance = effect_instance
				return


	func _resize_magnitude_buffers() -> void:
		if band_count <= 0:
			return

		_display_magnitudes.resize(band_count)
		_target_magnitudes.resize(band_count)
		for index in band_count:
			_display_magnitudes[index] = 0.0
			_target_magnitudes[index] = 0.0
		queue_redraw()


	func _reset_magnitudes() -> void:
		for index in _display_magnitudes.size():
			_display_magnitudes[index] = 0.0
		for index in _target_magnitudes.size():
			_target_magnitudes[index] = 0.0
		_reset_activity_gate()


	func _reset_activity_gate() -> void:
		_presentation_latched = false
		_activity_seconds = 0.0
		_silence_seconds = 0.0


	func _on_visibility_changed() -> void:
		set_process(is_visible_in_tree() and (visible or _playback_active))
		if is_visible_in_tree():
			_resolve_retry_seconds = 0.0
		queue_redraw()


class PlayerIconButton:
	extends Button

	## 轻量、无位图依赖的播放器图标按钮。
	## 图标全部以 1280x720 逻辑画布中的矢量线条实时绘制，缩放时不会失真。

	enum IconType {
		LOOP_ALL,
		SHUFFLE,
		REPEAT_ONE,
		PREVIOUS,
		PLAY,
		PAUSE,
		NEXT,
		VOLUME,
		PLAYLIST,
		CLOSE,
		EXTERNAL,
	}

	@export_enum(
		"Loop All",
		"Shuffle",
		"Repeat One",
		"Previous",
		"Play",
		"Pause",
		"Next",
		"Volume",
		"Playlist",
		"Close",
		"External"
	) var icon_type: int = IconType.PLAY:
		set(value):
			icon_type = clampi(value, IconType.LOOP_ALL, IconType.EXTERNAL)
			queue_redraw()

	@export var active: bool = false:
		set(value):
			active = value
			queue_redraw()

	@export var show_ring: bool = false:
		set(value):
			show_ring = value
			queue_redraw()

	@export_range(0.25, 0.8, 0.01) var icon_scale: float = 0.48:
		set(value):
			icon_scale = clampf(value, 0.25, 0.8)
			queue_redraw()

	@export_range(1.0, 5.0, 0.25) var line_width: float = 2.25:
		set(value):
			line_width = maxf(value, 1.0)
			queue_redraw()

	@export var foreground_color := Color(0.94, 0.93, 0.89, 1.0):
		set(value):
			foreground_color = value
			queue_redraw()

	@export var active_color := Color(0.72, 0.66, 0.55, 1.0):
		set(value):
			active_color = value
			queue_redraw()

	@export var hover_background_color := Color(0.72, 0.66, 0.55, 0.11):
		set(value):
			hover_background_color = value
			queue_redraw()

	@export var pressed_background_color := Color(0.72, 0.66, 0.55, 0.2):
		set(value):
			pressed_background_color = value
			queue_redraw()


	func _init() -> void:
		custom_minimum_size = Vector2(52.0, 52.0)
		flat = true
		text = ""
		focus_mode = Control.FOCUS_NONE
		mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


	func _ready() -> void:
		flat = true
		text = ""
		if not mouse_entered.is_connected(_queue_visual_refresh):
			mouse_entered.connect(_queue_visual_refresh)
		if not mouse_exited.is_connected(_queue_visual_refresh):
			mouse_exited.connect(_queue_visual_refresh)
		if not button_down.is_connected(_queue_visual_refresh):
			button_down.connect(_queue_visual_refresh)
		if not button_up.is_connected(_queue_visual_refresh):
			button_up.connect(_queue_visual_refresh)
		queue_redraw()


	func set_icon(value: int) -> void:
		icon_type = value


	func set_active(value: bool) -> void:
		active = value


	func _queue_visual_refresh() -> void:
		queue_redraw()


	func _notification(what: int) -> void:
		if what == NOTIFICATION_RESIZED or what == NOTIFICATION_THEME_CHANGED:
			queue_redraw()


	func _draw() -> void:
		if size.x <= 0.0 or size.y <= 0.0:
			return

		var center := size * 0.5
		var button_radius := minf(size.x, size.y) * 0.43
		var draw_mode := get_draw_mode()
		var button_pressed_state := draw_mode == BaseButton.DRAW_PRESSED or draw_mode == BaseButton.DRAW_HOVER_PRESSED
		var button_hovered_state := draw_mode == BaseButton.DRAW_HOVER or draw_mode == BaseButton.DRAW_HOVER_PRESSED

		if button_pressed_state:
			draw_circle(center, button_radius, pressed_background_color, true, -1.0, true)
		elif button_hovered_state:
			draw_circle(center, button_radius, hover_background_color, true, -1.0, true)

		var color := active_color if active else foreground_color
		if disabled:
			color.a *= 0.34

		if show_ring:
			var ring_color := color
			ring_color.a *= 0.9 if active else 0.76
			draw_arc(center, button_radius, 0.0, TAU, 64, ring_color, maxf(1.5, line_width), true)

		var unit := minf(size.x, size.y) * icon_scale * 0.5
		match icon_type:
			IconType.LOOP_ALL:
				_draw_loop(center, unit, color, false)
			IconType.SHUFFLE:
				_draw_shuffle(center, unit, color)
			IconType.REPEAT_ONE:
				_draw_loop(center, unit, color, true)
			IconType.PREVIOUS:
				_draw_previous(center, unit, color)
			IconType.PLAY:
				_draw_play(center, unit, color)
			IconType.PAUSE:
				_draw_pause(center, unit, color)
			IconType.NEXT:
				_draw_next(center, unit, color)
			IconType.VOLUME:
				_draw_volume(center, unit, color)
			IconType.PLAYLIST:
				_draw_playlist(center, unit, color)
			IconType.CLOSE:
				_draw_close(center, unit, color)
			IconType.EXTERNAL:
				_draw_external(center, unit, color)


	func _stroke(points: PackedVector2Array, color: Color, width_multiplier: float = 1.0) -> void:
		if points.size() < 2:
			return
		draw_polyline(points, color, line_width * width_multiplier, true)


	func _draw_arrow_head(tip: Vector2, direction: Vector2, unit: float, color: Color) -> void:
		var normalized_direction := direction.normalized()
		var perpendicular := Vector2(-normalized_direction.y, normalized_direction.x)
		var back := tip - normalized_direction * unit * 0.32
		_stroke(PackedVector2Array([
			back + perpendicular * unit * 0.22,
			tip,
			back - perpendicular * unit * 0.22,
		]), color)


	func _draw_loop(center: Vector2, unit: float, color: Color, show_one: bool) -> void:
		var left := center.x - unit * 0.78
		var right := center.x + unit * 0.78
		var top := center.y - unit * 0.42
		var bottom := center.y + unit * 0.42
		var corner := unit * 0.34

		# 两条开放式圆角回路比完整圆环更轻，状态切换时也更容易辨认。
		draw_arc(Vector2(left + corner, center.y), corner, PI, PI * 1.5, 10, color, line_width, true)
		_stroke(PackedVector2Array([
			Vector2(left + corner, top),
			Vector2(right, top),
		]), color)
		_draw_arrow_head(Vector2(right, top), Vector2.RIGHT, unit, color)

		draw_arc(Vector2(right - corner, center.y), corner, 0.0, PI * 0.5, 10, color, line_width, true)
		_stroke(PackedVector2Array([
			Vector2(right - corner, bottom),
			Vector2(left, bottom),
		]), color)
		_draw_arrow_head(Vector2(left, bottom), Vector2.LEFT, unit, color)

		if show_one:
			_stroke(PackedVector2Array([
				center + Vector2(-unit * 0.12, -unit * 0.18),
				center + Vector2(unit * 0.08, -unit * 0.32),
				center + Vector2(unit * 0.08, unit * 0.32),
			]), color, 0.86)


	func _draw_shuffle(center: Vector2, unit: float, color: Color) -> void:
		var left_x := center.x - unit * 0.82
		var right_x := center.x + unit * 0.78
		var upper_y := center.y - unit * 0.48
		var lower_y := center.y + unit * 0.48

		_stroke(PackedVector2Array([
			Vector2(left_x, upper_y),
			center + Vector2(-unit * 0.22, -unit * 0.42),
			center + Vector2(unit * 0.2, unit * 0.38),
			Vector2(right_x, lower_y),
		]), color)
		_draw_arrow_head(Vector2(right_x, lower_y), Vector2(1.0, 0.0), unit, color)

		_stroke(PackedVector2Array([
			Vector2(left_x, lower_y),
			center + Vector2(-unit * 0.2, unit * 0.38),
			center + Vector2(unit * 0.22, -unit * 0.42),
			Vector2(right_x, upper_y),
		]), color)
		_draw_arrow_head(Vector2(right_x, upper_y), Vector2(1.0, 0.0), unit, color)


	func _draw_previous(center: Vector2, unit: float, color: Color) -> void:
		var bar_x := center.x - unit * 0.68
		_stroke(PackedVector2Array([
			Vector2(bar_x, center.y - unit * 0.68),
			Vector2(bar_x, center.y + unit * 0.68),
		]), color)
		draw_colored_polygon(PackedVector2Array([
			center + Vector2(-unit * 0.45, 0.0),
			center + Vector2(unit * 0.55, -unit * 0.7),
			center + Vector2(unit * 0.55, unit * 0.7),
		]), color)


	func _draw_play(center: Vector2, unit: float, color: Color) -> void:
		draw_colored_polygon(PackedVector2Array([
			center + Vector2(-unit * 0.48, -unit * 0.76),
			center + Vector2(unit * 0.72, 0.0),
			center + Vector2(-unit * 0.48, unit * 0.76),
		]), color)


	func _draw_pause(center: Vector2, unit: float, color: Color) -> void:
		var bar_width := unit * 0.32
		var bar_height := unit * 1.46
		_draw_rounded_bar(Rect2(
			center + Vector2(-unit * 0.48, -bar_height * 0.5),
			Vector2(bar_width, bar_height)
		), color)
		_draw_rounded_bar(Rect2(
			center + Vector2(unit * 0.16, -bar_height * 0.5),
			Vector2(bar_width, bar_height)
		), color)


	func _draw_rounded_bar(rect: Rect2, color: Color) -> void:
		var radius := rect.size.x * 0.5
		draw_rect(Rect2(rect.position + Vector2(0.0, radius), Vector2(rect.size.x, rect.size.y - radius * 2.0)), color, true)
		draw_circle(rect.position + Vector2(radius, radius), radius, color, true, -1.0, true)
		draw_circle(rect.position + Vector2(radius, rect.size.y - radius), radius, color, true, -1.0, true)


	func _draw_next(center: Vector2, unit: float, color: Color) -> void:
		var bar_x := center.x + unit * 0.68
		_stroke(PackedVector2Array([
			Vector2(bar_x, center.y - unit * 0.68),
			Vector2(bar_x, center.y + unit * 0.68),
		]), color)
		draw_colored_polygon(PackedVector2Array([
			center + Vector2(unit * 0.45, 0.0),
			center + Vector2(-unit * 0.55, -unit * 0.7),
			center + Vector2(-unit * 0.55, unit * 0.7),
		]), color)


	func _draw_volume(center: Vector2, unit: float, color: Color) -> void:
		draw_colored_polygon(PackedVector2Array([
			center + Vector2(-unit * 0.84, -unit * 0.28),
			center + Vector2(-unit * 0.48, -unit * 0.28),
			center + Vector2(-unit * 0.08, -unit * 0.68),
			center + Vector2(-unit * 0.08, unit * 0.68),
			center + Vector2(-unit * 0.48, unit * 0.28),
			center + Vector2(-unit * 0.84, unit * 0.28),
		]), color)
		draw_arc(center + Vector2(-unit * 0.15, 0.0), unit * 0.52, -0.82, 0.82, 14, color, line_width, true)
		draw_arc(center + Vector2(-unit * 0.15, 0.0), unit * 0.84, -0.72, 0.72, 18, color, line_width, true)


	func _draw_playlist(center: Vector2, unit: float, color: Color) -> void:
		for row_index in 3:
			var y := center.y + (float(row_index) - 1.0) * unit * 0.55
			draw_circle(Vector2(center.x - unit * 0.72, y), maxf(1.4, line_width * 0.68), color, true, -1.0, true)
			_stroke(PackedVector2Array([
				Vector2(center.x - unit * 0.38, y),
				Vector2(center.x + unit * 0.76, y),
			]), color)


	func _draw_close(center: Vector2, unit: float, color: Color) -> void:
		_stroke(PackedVector2Array([
			center + Vector2(-unit * 0.62, -unit * 0.62),
			center + Vector2(unit * 0.62, unit * 0.62),
		]), color)
		_stroke(PackedVector2Array([
			center + Vector2(unit * 0.62, -unit * 0.62),
			center + Vector2(-unit * 0.62, unit * 0.62),
		]), color)


	func _draw_external(center: Vector2, unit: float, color: Color) -> void:
		_stroke(PackedVector2Array([
			center + Vector2(unit * 0.1, -unit * 0.65),
			center + Vector2(-unit * 0.62, -unit * 0.65),
			center + Vector2(-unit * 0.62, unit * 0.62),
			center + Vector2(unit * 0.62, unit * 0.62),
			center + Vector2(unit * 0.62, -unit * 0.08),
		]), color)
		_stroke(PackedVector2Array([
			center + Vector2(-unit * 0.08, unit * 0.08),
			center + Vector2(unit * 0.72, -unit * 0.72),
		]), color)
		_stroke(PackedVector2Array([
			center + Vector2(unit * 0.15, -unit * 0.72),
			center + Vector2(unit * 0.72, -unit * 0.72),
			center + Vector2(unit * 0.72, -unit * 0.15),
		]), color)


class AlbumCard:
	extends Control

	## 维持严格正六边形比例的专辑封面卡片。
	## 封面由运行时 CanvasItem Shader 裁切，描边与交互态由父 Control 自绘。

	signal activated(album_index: int)

	const SQRT_THREE := 1.7320508075688772
	const CLICK_DRAG_THRESHOLD := 12.0
	const COVER_INSET_PX := 5.5
	const COVER_SHADER_SOURCE := """
	shader_type canvas_item;
	render_mode unshaded;

	uniform vec4 tint : source_color = vec4(1.0);
	uniform vec2 rect_size_px = vec2(230.94, 200.0);
	uniform float cover_inset_px = 5.5;

	const float SQRT_THREE = 1.7320508075688772;
	varying vec2 local_position_px;
	varying float inherited_alpha;

	void vertex() {
		// TextureRect may crop the texture UV for KEEP_ASPECT_COVERED. VERTEX is
		// the quad's uncropped local position, so it remains true geometry space.
		local_position_px = VERTEX;
		// Preserve the CanvasItem/parent alpha before fragment() replaces COLOR.
		inherited_alpha = COLOR.a;
	}

	void fragment() {
		// Keep geometry masking independent from the texture sampling UV. All three
		// square album covers are vertically cropped by TextureRect, so using UV for
		// this calculation lets pixels leak across the diagonal border.
		vec2 safe_size = max(rect_size_px, vec2(1.0));
		vec2 p = abs(local_position_px - safe_size * 0.5);
		float half_width = safe_size.x * 0.5;
		float half_height = safe_size.y * 0.5;
		float horizontal_distance = half_height - p.y;
		float diagonal_distance = (half_width - p.x - p.y / SQRT_THREE) * (SQRT_THREE * 0.5);
		float edge_distance = min(horizontal_distance, diagonal_distance);

		// Keep the full AA transition inside the border's inner edge. fwidth keeps
		// the transition close to one physical pixel after card/canvas scaling.
		float antialias_width = min(max(fwidth(edge_distance), 0.35), 1.0);
		float mask = smoothstep(
			cover_inset_px - antialias_width,
			cover_inset_px + antialias_width,
			edge_distance
		);
		vec4 texel = texture(TEXTURE, UV);
		COLOR = vec4(texel.rgb * tint.rgb, texel.a * tint.a * mask * inherited_alpha);
	}
	"""

	@export var album_index: int = -1
	@export var album_title: String = "":
		set(value):
			album_title = value
			tooltip_text = album_title

	@export var cover_path: String = "":
		set(value):
			cover_path = value
			_load_cover_texture()

	var _selected := false
	var _side := true

	@export var selected: bool:
		get:
			return _selected
		set(value):
			_selected = value
			if value:
				_side = false
			_update_visual_state()

	@export var side: bool:
		get:
			return _side
		set(value):
			_side = value
			if value:
				_selected = false
			_update_visual_state()

	@export var selected_border_color := Color(0.96, 0.95, 0.91, 1.0):
		set(value):
			selected_border_color = value
			queue_redraw()

	@export var accent_border_color := Color(0.71, 0.65, 0.54, 0.88):
		set(value):
			accent_border_color = value
			queue_redraw()

	@export var side_border_color := Color(0.64, 0.61, 0.56, 0.72):
		set(value):
			side_border_color = value
			queue_redraw()

	@export var placeholder_color := Color(0.055, 0.07, 0.095, 1.0):
		set(value):
			placeholder_color = value
			queue_redraw()

	var _cover: TextureRect
	var _cover_material: ShaderMaterial
	var _cover_texture: Texture2D
	var _hovered := false
	var _press_active := false
	var _press_cancelled := false
	var _press_pointer_index := -2
	var _press_origin := Vector2.ZERO


	func _init() -> void:
		# 230.94 x 200 是水平尖角正六边形的精确外接矩形比例 2/sqrt(3)。
		custom_minimum_size = Vector2(230.94, 200.0)
		mouse_filter = Control.MOUSE_FILTER_STOP
		focus_mode = Control.FOCUS_NONE
		mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


	func _ready() -> void:
		_ensure_cover_node()
		_sync_cover_rect()
		_load_cover_texture()
		_update_visual_state()
		if not mouse_entered.is_connected(_on_mouse_entered):
			mouse_entered.connect(_on_mouse_entered)
		if not mouse_exited.is_connected(_on_mouse_exited):
			mouse_exited.connect(_on_mouse_exited)


	func set_album(index: int, title: String, path: String) -> void:
		album_index = index
		album_title = title
		cover_path = path


	func set_selected(value: bool) -> void:
		selected = value


	func set_side(value: bool) -> void:
		side = value


	func set_visual_state(is_selected: bool, is_side: bool) -> void:
		_selected = is_selected
		_side = is_side and not is_selected
		_update_visual_state()


	func get_cover_texture() -> Texture2D:
		return _cover_texture


	func cancel_pending_activation() -> void:
		if _press_active:
			_press_cancelled = true


	func _notification(what: int) -> void:
		if what == NOTIFICATION_RESIZED:
			_sync_cover_rect()
			queue_redraw()
		elif what == NOTIFICATION_THEME_CHANGED:
			queue_redraw()


	func _ensure_cover_node() -> void:
		if is_instance_valid(_cover):
			return

		_cover = TextureRect.new()
		_cover.name = "Cover"
		_cover.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_cover.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		_cover.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		_cover.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
		_cover.show_behind_parent = true
		_cover.z_index = -1

		var shader := Shader.new()
		shader.code = COVER_SHADER_SOURCE
		_cover_material = ShaderMaterial.new()
		_cover_material.shader = shader
		_cover.material = _cover_material
		add_child(_cover)


	func _load_cover_texture() -> void:
		_cover_texture = null
		if not cover_path.strip_edges().is_empty() and ResourceLoader.exists(cover_path):
			var resource := ResourceLoader.load(cover_path)
			if resource is Texture2D:
				_cover_texture = resource as Texture2D

		if is_instance_valid(_cover):
			_cover.texture = _cover_texture
		_update_visual_state()


	func _sync_cover_rect() -> void:
		if not is_instance_valid(_cover):
			return
		var hex_rect := _get_regular_hex_rect()
		_cover.position = hex_rect.position
		_cover.size = hex_rect.size
		if is_instance_valid(_cover_material):
			_cover_material.set_shader_parameter("rect_size_px", hex_rect.size)
			_cover_material.set_shader_parameter("cover_inset_px", COVER_INSET_PX)


	func _get_regular_hex_rect() -> Rect2:
		if size.x <= 0.0 or size.y <= 0.0:
			return Rect2(Vector2.ZERO, custom_minimum_size)

		var hex_width := size.x
		var hex_height := hex_width * SQRT_THREE * 0.5
		if hex_height > size.y:
			hex_height = size.y
			hex_width = hex_height * 2.0 / SQRT_THREE

		var hex_size := Vector2(hex_width, hex_height)
		return Rect2((size - hex_size) * 0.5, hex_size)


	func _get_hex_points() -> PackedVector2Array:
		var rect := _get_regular_hex_rect()
		var x := rect.position.x
		var y := rect.position.y
		var width := rect.size.x
		var height := rect.size.y
		return PackedVector2Array([
			Vector2(x + width * 0.25, y),
			Vector2(x + width * 0.75, y),
			Vector2(x + width, y + height * 0.5),
			Vector2(x + width * 0.75, y + height),
			Vector2(x + width * 0.25, y + height),
			Vector2(x, y + height * 0.5),
		])


	func _closed_hex_points(points: PackedVector2Array) -> PackedVector2Array:
		var closed := PackedVector2Array(points)
		if points.size() > 0:
			closed.append(points[0])
		return closed


	func _update_visual_state() -> void:
		if is_instance_valid(_cover_material):
			var tint := Color.WHITE
			if _side:
				tint = Color(0.58, 0.6, 0.64, 0.82)
			elif not _selected:
				tint = Color(0.82, 0.82, 0.8, 0.94)
			if _hovered:
				tint = tint.lightened(0.09)
			_cover_material.set_shader_parameter("tint", tint)
		queue_redraw()


	func _draw() -> void:
		var points := _get_hex_points()
		if points.size() != 6:
			return

		if _cover_texture == null:
			draw_colored_polygon(points, placeholder_color)

		if _side:
			draw_colored_polygon(points, Color(0.01, 0.015, 0.025, 0.2))
		elif _hovered:
			draw_colored_polygon(points, Color(0.86, 0.82, 0.72, 0.045))

		var closed_points := _closed_hex_points(points)
		if _selected:
			var glow_color := accent_border_color
			glow_color.a *= 0.24
			draw_polyline(closed_points, glow_color, 7.0, true)
			draw_polyline(closed_points, selected_border_color, 2.5, true)
			draw_polyline(closed_points, accent_border_color, 1.0, true)
		else:
			var border_color := side_border_color
			if _hovered:
				border_color = border_color.lightened(0.2)
				border_color.a = minf(1.0, border_color.a + 0.16)
			draw_polyline(closed_points, border_color, 1.5, true)


	func _gui_input(event: InputEvent) -> void:
		if event is InputEventMouseButton:
			var mouse_event := event as InputEventMouseButton
			if mouse_event.button_index != MOUSE_BUTTON_LEFT:
				return
			if mouse_event.pressed:
				_begin_press(-1, mouse_event.position)
			else:
				_end_press(-1, mouse_event.position)
			accept_event()
		elif event is InputEventMouseMotion and _press_active and _press_pointer_index == -1:
			var motion_event := event as InputEventMouseMotion
			_update_press_motion(motion_event.position)
		elif event is InputEventScreenTouch:
			var touch_event := event as InputEventScreenTouch
			if touch_event.pressed:
				_begin_press(touch_event.index, touch_event.position)
			else:
				_end_press(touch_event.index, touch_event.position)
			accept_event()
		elif event is InputEventScreenDrag and _press_active:
			var drag_event := event as InputEventScreenDrag
			if drag_event.index == _press_pointer_index:
				_update_press_motion(drag_event.position)


	func _begin_press(pointer_index: int, pointer_position: Vector2) -> void:
		if _press_active:
			return
		_press_active = true
		_press_cancelled = false
		_press_pointer_index = pointer_index
		_press_origin = pointer_position
		queue_redraw()


	func _update_press_motion(pointer_position: Vector2) -> void:
		if pointer_position.distance_to(_press_origin) > CLICK_DRAG_THRESHOLD:
			_press_cancelled = true


	func _end_press(pointer_index: int, pointer_position: Vector2) -> void:
		if not _press_active or pointer_index != _press_pointer_index:
			return
		var should_activate := (
			not _press_cancelled
			and pointer_position.distance_to(_press_origin) <= CLICK_DRAG_THRESHOLD
			and Rect2(Vector2.ZERO, size).has_point(pointer_position)
		)
		_press_active = false
		_press_cancelled = false
		_press_pointer_index = -2
		queue_redraw()
		if should_activate:
			activated.emit(album_index)


	func _on_mouse_entered() -> void:
		_hovered = true
		_update_visual_state()


	func _on_mouse_exited() -> void:
		_hovered = false
		_update_visual_state()


signal exclusive_playback_changed(active: bool)

const CATALOG_PATH := "res://assets/audio/music_player/music_catalog.json"
const PAGE_TOP := 61.0
const CAROUSEL_DURATION := 0.42
const CAROUSEL_DRAG_DISTANCE := 320.0
const CAROUSEL_COMMIT_PROGRESS := 0.18
const CAROUSEL_CENTER := Vector2(640.0, 245.0)
const SPECTRUM_SIZE := Vector2(456.0, 340.0)
const PANEL_X := 900.0
const PANEL_HIDDEN_X := 1288.0
const HANDLE_CLOSED_X := 1244.0
const HANDLE_OPEN_X := 864.0

const FALLBACK_FONT = preload("res://assets/gui/font/SourceHanSansLite.ttf")

const COLOR_PANEL := Color("0d131e")
const COLOR_PANEL_HOVER := Color("171e29")
const COLOR_TEXT := Color("f1f0ec")
const COLOR_MUTED := Color("9c968d")
const COLOR_DIM := Color("6e6a64")
const COLOR_ACCENT := Color("b5a58a")

var albums: Array = []
var selected_album_index := 0
var _playback: PlaybackController
var _spectrum: Control

var _cards: Array[Control] = []
var _carousel_tween: Tween
var _carousel_locked := false
var _queued_carousel_direction := 0
var _gesture_tracking := false
var _gesture_start := Vector2.ZERO
var _gesture_progress := 0.0
var _gesture_direction := 0
var _gesture_pointer := -2

var _track_title_label: Label
var _album_title_label: Label
var _composer_button: Button
var _composer_external_button
var _composer_url := ""
var _progress_slider: HSlider
var _current_time_label: Label
var _duration_label: Label
var _displayed_track_index := 0
var _is_dragging_progress := false
var _progress_drag_album_index := -1
var _progress_drag_track_index := -1

var _mode_button
var _previous_button
var _play_pause_button
var _play_pause_tween: Tween
var _play_pause_visual_active := false
var _next_button
var _volume_button
var _playlist_handle: Button

var _lyrics_previous: Label
var _lyrics_current: Label
var _lyrics_next: Label
var _lyrics_entries: Array[Dictionary] = []

var _volume_layer: Control
var _volume_panel: PanelContainer
var _volume_slider: VSlider
var _volume_tween: Tween

var _playlist_layer: Control
var _playlist_panel: PanelContainer
var _playlist_title: Label
var _playlist_count: Label
var _playlist_rows_container: VBoxContainer
var _playlist_rows: Array[Dictionary] = []
var _playlist_tween: Tween

var _status_label: Label
var _status_token := 0
var _slider_grabber: Texture2D


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_load_catalog()
	_build_interface()
	_build_playback_controller()
	if not albums.is_empty():
		_refresh_album_selection(true)
	visibility_changed.connect(_on_visibility_changed)
	set_process(true)


func _exit_tree() -> void:
	if is_instance_valid(_playback):
		_playback.stop(false)


func _load_catalog() -> void:
	var file := FileAccess.open(CATALOG_PATH, FileAccess.READ)
	if file == null:
		push_error("无法读取音乐清单：%s" % CATALOG_PATH)
		return
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	if typeof(parsed) != TYPE_DICTIONARY:
		push_error("音乐清单格式错误：%s" % CATALOG_PATH)
		return
	var raw_albums: Variant = parsed.get("albums", [])
	if typeof(raw_albums) != TYPE_ARRAY:
		push_error("音乐清单缺少 albums 数组")
		return
	albums = (raw_albums as Array).duplicate(true)
	if albums.size() != 3:
		push_warning("音乐转盘设计为 3 张专辑，当前清单包含 %d 张" % albums.size())


func _build_playback_controller() -> void:
	_playback = PlaybackController.new()
	_playback.name = "PlaybackController"
	add_child(_playback)
	_playback.configure(albums)
	_playback.track_changed.connect(_on_track_changed)
	_playback.playback_state_changed.connect(_on_playback_state_changed)
	_playback.play_mode_changed.connect(_on_play_mode_changed)
	_playback.position_changed.connect(_on_position_changed)
	_playback.playback_error.connect(_show_status)
	_playback.exclusive_playback_changed.connect(_on_exclusive_playback_changed)

	var saved_volume := 1.0
	var game_config := get_node_or_null("/root/GameConfig")
	if game_config != null:
		saved_volume = clampf(float(game_config.music_player_volume) / 100.0, 0.0, 1.0)
	_volume_slider.set_value_no_signal(saved_volume * 100.0)
	_playback.set_player_volume(saved_volume)


func _build_interface() -> void:
	_slider_grabber = _create_circle_texture(16, COLOR_TEXT)

	var background := ColorRect.new()
	background.name = "PageBackground"
	background.color = Color.TRANSPARENT
	background.mouse_filter = Control.MOUSE_FILTER_STOP
	_full_rect(background)
	background.offset_top = PAGE_TOP
	add_child(background)

	_spectrum = SpectrumVisualizer.new()
	_spectrum.name = "SpectrumVisualizer"
	_spectrum.size = SPECTRUM_SIZE
	_spectrum.position = CAROUSEL_CENTER - SPECTRUM_SIZE * 0.5
	_spectrum.mirror_horizontally = true
	_spectrum.maximum_dots_per_side = 16
	_spectrum.horizontal_padding = 10.0
	_spectrum.active_color = Color(0.70, 0.68, 0.64, 0.56)
	_spectrum.inactive_alpha = 0.0
	_spectrum.z_index = 1
	_spectrum.visible = false
	add_child(_spectrum)

	_build_album_carousel()
	_build_track_information()
	_build_seek_area()
	_build_controls()
	_build_lyrics()
	_build_volume_popup()
	_build_playlist_panel()
	_build_status_label()


func _build_album_carousel() -> void:
	for album_index in albums.size():
		var album: Dictionary = albums[album_index]
		var card: Control = AlbumCard.new()
		card.name = "AlbumCard%d" % (album_index + 1)
		card.size = Vector2(277.13, 240.0)
		card.pivot_offset = card.size * 0.5
		card.set_album(album_index, str(album.get("title", "")), str(album.get("cover", "")))
		card.activated.connect(_on_album_card_activated)
		add_child(card)
		_cards.append(card)


func _build_track_information() -> void:
	_album_title_label = _create_label("", 22, COLOR_TEXT, HORIZONTAL_ALIGNMENT_CENTER)
	_album_title_label.name = "AlbumTitle"
	_album_title_label.position = Vector2(220.0, 70.0)
	_album_title_label.size = Vector2(840.0, 38.0)
	_album_title_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	add_child(_album_title_label)

	_track_title_label = _create_label("", 34, COLOR_TEXT, HORIZONTAL_ALIGNMENT_CENTER)
	_track_title_label.name = "TrackTitle"
	_track_title_label.position = Vector2(220.0, 385.0)
	_track_title_label.size = Vector2(840.0, 46.0)
	_track_title_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	add_child(_track_title_label)

	var composer_row := HBoxContainer.new()
	composer_row.name = "ComposerRow"
	composer_row.position = Vector2(300.0, 454.0)
	composer_row.size = Vector2(680.0, 31.0)
	composer_row.alignment = BoxContainer.ALIGNMENT_CENTER
	composer_row.add_theme_constant_override("separation", 2)
	add_child(composer_row)

	_composer_button = Button.new()
	_composer_button.name = "ComposerLink"
	_composer_button.flat = true
	_composer_button.focus_mode = Control.FOCUS_NONE
	_composer_button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	_composer_button.add_theme_font_override("font", FALLBACK_FONT)
	_composer_button.add_theme_font_size_override("font_size", 17)
	_composer_button.add_theme_color_override("font_color", COLOR_ACCENT)
	_composer_button.add_theme_color_override("font_disabled_color", COLOR_ACCENT)
	_composer_button.add_theme_color_override("font_hover_color", COLOR_TEXT)
	_composer_button.add_theme_color_override("font_pressed_color", COLOR_ACCENT.lightened(0.15))
	_composer_button.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	_composer_button.pressed.connect(_open_composer_link)
	composer_row.add_child(_composer_button)

	_composer_external_button = PlayerIconButton.new()
	_composer_external_button.name = "ComposerExternal"
	_composer_external_button.set_icon(PlayerIconButton.IconType.EXTERNAL)
	_composer_external_button.custom_minimum_size = Vector2(24.0, 24.0)
	_composer_external_button.icon_scale = 0.52
	_composer_external_button.line_width = 1.5
	_composer_external_button.pressed.connect(_open_composer_link)
	composer_row.add_child(_composer_external_button)


func _build_seek_area() -> void:
	_current_time_label = _create_label("00:00", 15, COLOR_MUTED, HORIZONTAL_ALIGNMENT_RIGHT)
	_current_time_label.position = Vector2(329.0, 488.0)
	_current_time_label.size = Vector2(67.0, 25.0)
	add_child(_current_time_label)

	_progress_slider = HSlider.new()
	_progress_slider.name = "ProgressSlider"
	_progress_slider.position = Vector2(410.0, 482.0)
	_progress_slider.size = Vector2(460.0, 40.0)
	_progress_slider.min_value = 0.0
	_progress_slider.max_value = 1.0
	_progress_slider.step = 0.01
	_progress_slider.value = 0.0
	_progress_slider.scrollable = false
	_progress_slider.focus_mode = Control.FOCUS_NONE
	_progress_slider.mouse_filter = Control.MOUSE_FILTER_STOP
	_progress_slider.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	_style_slider(_progress_slider, 2.0)
	_progress_slider.drag_started.connect(_on_progress_drag_started)
	_progress_slider.drag_ended.connect(_on_progress_drag_ended)
	_progress_slider.value_changed.connect(_on_progress_value_changed)
	add_child(_progress_slider)

	_duration_label = _create_label("00:00", 15, COLOR_MUTED, HORIZONTAL_ALIGNMENT_LEFT)
	_duration_label.position = Vector2(884.0, 488.0)
	_duration_label.size = Vector2(67.0, 25.0)
	add_child(_duration_label)


func _build_controls() -> void:
	var controls := HBoxContainer.new()
	controls.name = "PlaybackControls"
	controls.position = Vector2(315.0, 523.0)
	controls.size = Vector2(650.0, 84.0)
	controls.alignment = BoxContainer.ALIGNMENT_CENTER
	controls.add_theme_constant_override("separation", 36)
	add_child(controls)

	_mode_button = _create_icon_button("PlayMode", PlayerIconButton.IconType.LOOP_ALL, Vector2(58.0, 58.0))
	_mode_button.tooltip_text = "列表循环"
	_mode_button.pressed.connect(_on_mode_pressed)
	controls.add_child(_mode_button)

	_previous_button = _create_icon_button("Previous", PlayerIconButton.IconType.PREVIOUS, Vector2(58.0, 58.0))
	_previous_button.tooltip_text = "上一首"
	_previous_button.pressed.connect(_on_previous_pressed)
	controls.add_child(_previous_button)

	_play_pause_button = _create_icon_button("PlayPause", PlayerIconButton.IconType.PLAY, Vector2(78.0, 78.0))
	_play_pause_button.show_ring = true
	_play_pause_button.icon_scale = 0.42
	_play_pause_button.pivot_offset = Vector2(39.0, 39.0)
	_play_pause_button.tooltip_text = "播放"
	_play_pause_button.pressed.connect(_on_play_pause_pressed)
	controls.add_child(_play_pause_button)

	_next_button = _create_icon_button("Next", PlayerIconButton.IconType.NEXT, Vector2(58.0, 58.0))
	_next_button.tooltip_text = "下一首"
	_next_button.pressed.connect(_on_next_pressed)
	controls.add_child(_next_button)

	_volume_button = _create_icon_button("Volume", PlayerIconButton.IconType.VOLUME, Vector2(58.0, 58.0))
	_volume_button.tooltip_text = "播放器音量"
	_volume_button.pressed.connect(_toggle_volume_popup)
	controls.add_child(_volume_button)


func _build_lyrics() -> void:
	_lyrics_previous = _create_label("", 17, COLOR_DIM, HORIZONTAL_ALIGNMENT_CENTER)
	_lyrics_previous.position = Vector2(250.0, 619.0)
	_lyrics_previous.size = Vector2(780.0, 27.0)
	_lyrics_previous.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	add_child(_lyrics_previous)

	_lyrics_current = _create_label("纯音乐，请欣赏", 22, COLOR_TEXT, HORIZONTAL_ALIGNMENT_CENTER)
	_lyrics_current.position = Vector2(220.0, 648.0)
	_lyrics_current.size = Vector2(840.0, 34.0)
	_lyrics_current.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	add_child(_lyrics_current)

	_lyrics_next = _create_label("", 17, COLOR_DIM, HORIZONTAL_ALIGNMENT_CENTER)
	_lyrics_next.position = Vector2(250.0, 683.0)
	_lyrics_next.size = Vector2(780.0, 27.0)
	_lyrics_next.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	add_child(_lyrics_next)


func _build_volume_popup() -> void:
	_volume_layer = Control.new()
	_volume_layer.name = "VolumeOverlay"
	_full_rect(_volume_layer)
	_volume_layer.z_index = 80
	_volume_layer.visible = false
	_volume_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_volume_layer)

	_volume_panel = PanelContainer.new()
	_volume_panel.name = "VolumePanel"
	_volume_panel.position = Vector2(819.0, 344.0)
	_volume_panel.size = Vector2(38.0, 134.0)
	_volume_panel.pivot_offset = Vector2(19.0, 134.0)
	_volume_panel.mouse_filter = Control.MOUSE_FILTER_STOP
	var volume_style := _panel_style(Color(0.055, 0.075, 0.105, 0.97), 15.0)
	volume_style.shadow_color = Color(0.0, 0.0, 0.0, 0.42)
	volume_style.shadow_size = 9
	volume_style.shadow_offset = Vector2(0.0, 4.0)
	_volume_panel.add_theme_stylebox_override("panel", volume_style)
	_volume_layer.add_child(_volume_panel)

	var margin := MarginContainer.new()
	_set_margins(margin, 5, 12, 5, 12)
	_volume_panel.add_child(margin)

	_volume_slider = VSlider.new()
	_volume_slider.name = "VolumeSlider"
	_volume_slider.custom_minimum_size = Vector2(28.0, 110.0)
	_volume_slider.min_value = 0.0
	_volume_slider.max_value = 100.0
	_volume_slider.step = 1.0
	_volume_slider.value = 100.0
	_volume_slider.focus_mode = Control.FOCUS_NONE
	_volume_slider.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	_style_volume_slider(_volume_slider)
	_volume_slider.value_changed.connect(_on_volume_changed)
	_volume_slider.drag_ended.connect(_on_volume_drag_ended)
	margin.add_child(_volume_slider)


func _build_playlist_panel() -> void:
	_playlist_layer = Control.new()
	_playlist_layer.name = "PlaylistOverlay"
	_full_rect(_playlist_layer)
	_playlist_layer.z_index = 90
	_playlist_layer.visible = false
	_playlist_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_playlist_layer)

	_playlist_panel = PanelContainer.new()
	_playlist_panel.name = "PlaylistPanel"
	_playlist_panel.position = Vector2(PANEL_X, 89.0)
	_playlist_panel.size = Vector2(352.0, 542.0)
	_playlist_panel.mouse_filter = Control.MOUSE_FILTER_STOP
	var playlist_style := _panel_style(Color("0b111b"), 18.0)
	playlist_style.shadow_color = Color(0.0, 0.0, 0.0, 0.52)
	playlist_style.shadow_size = 12
	playlist_style.shadow_offset = Vector2(-4.0, 4.0)
	_playlist_panel.add_theme_stylebox_override("panel", playlist_style)
	_playlist_layer.add_child(_playlist_panel)

	var margin := MarginContainer.new()
	_set_margins(margin, 14, 17, 10, 14)
	_playlist_panel.add_child(margin)

	var content := VBoxContainer.new()
	content.add_theme_constant_override("separation", 8)
	margin.add_child(content)

	var header := HBoxContainer.new()
	header.custom_minimum_size.y = 48.0
	header.add_theme_constant_override("separation", 5)
	content.add_child(header)

	_playlist_title = _create_label("播放列表", 23, COLOR_TEXT, HORIZONTAL_ALIGNMENT_LEFT)
	_playlist_title.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	header.add_child(_playlist_title)

	_playlist_count = _create_label("0", 13, COLOR_MUTED, HORIZONTAL_ALIGNMENT_LEFT)
	_playlist_count.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	header.add_child(_playlist_count)

	var spacer := Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_child(spacer)

	var close_button = _create_icon_button("ClosePlaylist", PlayerIconButton.IconType.CLOSE, Vector2(44.0, 44.0))
	close_button.icon_scale = 0.38
	close_button.line_width = 1.6
	close_button.tooltip_text = "关闭列表"
	close_button.pressed.connect(_close_playlist)
	header.add_child(close_button)

	var scroll := ScrollContainer.new()
	scroll.name = "TrackScroll"
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	content.add_child(scroll)
	_style_playlist_scrollbar(scroll.get_v_scroll_bar())

	_playlist_rows_container = VBoxContainer.new()
	_playlist_rows_container.name = "TrackRows"
	_playlist_rows_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_playlist_rows_container.add_theme_constant_override("separation", 3)
	scroll.add_child(_playlist_rows_container)

	_playlist_handle = Button.new()
	_playlist_handle.name = "PlaylistHandle"
	_playlist_handle.position = Vector2(HANDLE_CLOSED_X, 286.0)
	_playlist_handle.size = Vector2(36.0, 116.0)
	_playlist_handle.z_index = 95
	_playlist_handle.text = "‹"
	_playlist_handle.tooltip_text = "展开播放列表"
	_playlist_handle.focus_mode = Control.FOCUS_NONE
	_playlist_handle.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	_playlist_handle.add_theme_font_override("font", FALLBACK_FONT)
	_playlist_handle.add_theme_font_size_override("font_size", 34)
	_playlist_handle.add_theme_color_override("font_color", COLOR_TEXT)
	_playlist_handle.add_theme_color_override("font_hover_color", COLOR_ACCENT.lightened(0.12))
	_playlist_handle.add_theme_color_override("font_pressed_color", COLOR_ACCENT)
	_playlist_handle.add_theme_stylebox_override("normal", _panel_style(Color(0.045, 0.065, 0.095, 0.82), 15.0))
	_playlist_handle.add_theme_stylebox_override("hover", _panel_style(Color(0.075, 0.10, 0.14, 0.96), 15.0))
	_playlist_handle.add_theme_stylebox_override("pressed", _panel_style(Color(0.11, 0.13, 0.16, 0.98), 15.0))
	_playlist_handle.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	_playlist_handle.pressed.connect(_toggle_playlist)
	add_child(_playlist_handle)


func _build_status_label() -> void:
	_status_label = _create_label("", 15, Color("e7b4ad"), HORIZONTAL_ALIGNMENT_CENTER)
	_status_label.position = Vector2(250.0, 605.0)
	_status_label.size = Vector2(780.0, 25.0)
	_status_label.visible = false
	_status_label.z_index = 20
	add_child(_status_label)


func _create_icon_button(button_name: String, icon: int, minimum_size: Vector2):
	var button = PlayerIconButton.new()
	button.name = button_name
	button.set_icon(icon)
	button.custom_minimum_size = minimum_size
	return button


func _create_label(text_value: String, font_size: int, color: Color, alignment: HorizontalAlignment) -> Label:
	var label := Label.new()
	label.text = text_value
	label.add_theme_font_override("font", FALLBACK_FONT)
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", color)
	label.horizontal_alignment = alignment
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return label


func _refresh_album_selection(rebuild_playlist := true) -> void:
	if albums.is_empty():
		return
	selected_album_index = posmod(selected_album_index, albums.size())
	_apply_carousel_layout(true)
	var album: Dictionary = albums[selected_album_index]
	var tracks: Array = album.get("tracks", [])
	if not tracks.is_empty():
		var display_index := 0
		var display_position := 0.0
		var displays_active_track: bool = (
			is_instance_valid(_playback)
			and _playback.current_album_index == selected_album_index
			and _playback.current_track_index >= 0
		)
		if displays_active_track:
			display_index = _playback.current_track_index
			display_position = _playback.get_position()
		elif is_instance_valid(_playback):
			var saved_state: Dictionary = _playback.get_album_state(selected_album_index)
			if bool(saved_state.get("initialized", false)):
				display_index = clampi(int(saved_state.get("track_index", 0)), 0, tracks.size() - 1)
				display_position = maxf(float(saved_state.get("position", 0.0)), 0.0)
		_display_track_info(selected_album_index, display_index)
		var display_track: Dictionary = tracks[display_index]
		var display_duration: float = (
			_playback.get_duration()
			if displays_active_track
			else float(display_track.get("duration", 0.0))
		)
		display_position = clampf(display_position, 0.0, maxf(display_duration, 0.0))
		_progress_slider.max_value = maxf(display_duration, 1.0)
		_progress_slider.set_value_no_signal(display_position)
		_current_time_label.text = _format_time(display_position)
		_duration_label.text = _format_time(display_duration)
		_load_track_lyrics(str(display_track.get("lyrics", "")))
		_update_lyrics(display_position)
		_progress_slider.editable = true
	else:
		_progress_slider.editable = false
	if rebuild_playlist:
		_rebuild_playlist()


func _apply_carousel_layout(immediate: bool) -> void:
	if _cards.is_empty():
		return
	for card in _cards:
		var slot := _get_card_slot(card.album_index, selected_album_index)
		var target_position: Vector2 = _slot_position(slot) - card.size * 0.5
		var target_scale := Vector2.ONE if slot == 0 else Vector2.ONE * 0.68
		var target_modulate := Color.WHITE if slot == 0 else Color(0.72, 0.73, 0.76, 0.88)
		card.z_index = 12 if slot == 0 else 8
		card.set_visual_state(slot == 0, slot != 0)
		if immediate:
			card.position = target_position
			card.scale = target_scale
			card.modulate = target_modulate


func _on_album_card_activated(album_index: int) -> void:
	if not _is_page_interactive() or albums.size() < 2 or album_index == selected_album_index:
		return
	var direction := 1 if album_index == posmod(selected_album_index + 1, albums.size()) else -1
	_rotate_carousel(direction)


func _rotate_carousel(direction: int) -> void:
	if albums.size() < 2:
		return
	direction = signi(direction)
	if direction == 0:
		return
	if _carousel_locked:
		_queued_carousel_direction = direction
		return

	_close_volume_popup(true)
	_carousel_locked = true
	_animate_carousel_progress(direction, 0.0, 1.0, true)


func _animate_carousel_progress(direction: int, from_progress: float, to_progress: float, commit: bool) -> void:
	if is_instance_valid(_carousel_tween):
		_carousel_tween.kill()
	# A committed album change is browsing, not an implicit play command. Pause
	# the current album as soon as the switch is accepted, keep its saved cursor,
	# and let the newly selected album wait for an explicit Play press.
	if commit and is_instance_valid(_playback):
		_playback.pause()
	var distance := absf(to_progress - from_progress)
	if distance <= 0.001:
		if commit:
			_finish_carousel_rotation(posmod(selected_album_index + direction, albums.size()))
		else:
			_finish_carousel_snapback()
		return

	_carousel_tween = create_tween()
	_carousel_tween.set_trans(Tween.TRANS_CUBIC)
	_carousel_tween.set_ease(Tween.EASE_OUT if from_progress > 0.0 else Tween.EASE_IN_OUT)
	_carousel_tween.tween_method(
		_apply_carousel_drag.bind(direction),
		from_progress,
		to_progress,
		maxf(CAROUSEL_DURATION * distance, 0.1)
	)
	if commit:
		var new_selected := posmod(selected_album_index + direction, albums.size())
		_carousel_tween.tween_callback(_finish_carousel_rotation.bind(new_selected))
	else:
		_carousel_tween.tween_callback(_finish_carousel_snapback)


func _apply_carousel_drag(progress: float, direction: int) -> void:
	progress = clampf(progress, 0.0, 1.0)
	direction = signi(direction)
	if direction == 0:
		return
	var old_selected := selected_album_index
	var new_selected := posmod(old_selected + direction, albums.size())
	var wrap_album := posmod(old_selected - 1, albums.size()) if direction > 0 else posmod(old_selected + 1, albums.size())
	var visual_center := new_selected if progress >= 0.5 else old_selected

	for card in _cards:
		var start_slot := _get_card_slot(card.album_index, old_selected)
		var target_slot := _get_card_slot(card.album_index, new_selected)
		var start_position: Vector2 = _slot_position(start_slot) - card.size * 0.5
		var target_position: Vector2 = _slot_position(target_slot) - card.size * 0.5
		var start_scale := Vector2.ONE if start_slot == 0 else Vector2.ONE * 0.68
		var target_scale := Vector2.ONE if target_slot == 0 else Vector2.ONE * 0.68
		var start_modulate := Color.WHITE if start_slot == 0 else Color(0.72, 0.73, 0.76, 0.88)
		var target_modulate := Color.WHITE if target_slot == 0 else Color(0.72, 0.73, 0.76, 0.88)

		if card.album_index == wrap_album:
			var control_position := Vector2(
				lerpf(start_position.x, target_position.x, 0.5),
				minf(start_position.y, target_position.y) - 92.0
			)
			var inverse := 1.0 - progress
			card.position = (
				start_position * inverse * inverse
				+ control_position * 2.0 * inverse * progress
				+ target_position * progress * progress
			)
			var behind_amount := sin(PI * progress)
			card.scale = start_scale.lerp(target_scale, progress) * (1.0 - behind_amount * 0.18)
			card.modulate = start_modulate.lerp(target_modulate, progress)
			card.modulate.a *= 1.0 - behind_amount * 0.42
			card.z_index = 5
		else:
			card.position = start_position.lerp(target_position, progress)
			card.scale = start_scale.lerp(target_scale, progress)
			card.modulate = start_modulate.lerp(target_modulate, progress)
			var owns_center := (
				(start_slot == 0 and progress < 0.5)
				or (target_slot == 0 and progress >= 0.5)
			)
			card.z_index = 13 if owns_center else 8
		var visual_slot := _get_card_slot(card.album_index, visual_center)
		card.set_visual_state(visual_slot == 0, visual_slot != 0)


func _finish_carousel_snapback() -> void:
	_carousel_locked = false
	_gesture_progress = 0.0
	_gesture_direction = 0
	_apply_carousel_layout(true)
	_consume_queued_carousel()


func _finish_carousel_rotation(new_selected: int) -> void:
	# Keep album switching a hard pause boundary even if another input or signal
	# changed playback while the carousel animation was running.
	if is_instance_valid(_playback):
		_playback.pause()
	selected_album_index = new_selected
	_carousel_locked = false
	_gesture_progress = 0.0
	_gesture_direction = 0
	_apply_carousel_layout(true)
	_refresh_album_selection(true)
	_consume_queued_carousel()


func _consume_queued_carousel() -> void:
	if _queued_carousel_direction != 0:
		var queued := _queued_carousel_direction
		_queued_carousel_direction = 0
		if _is_page_interactive():
			_rotate_carousel(queued)


func _get_card_slot(album_index: int, center_album: int) -> int:
	if album_index == center_album:
		return 0
	if album_index == posmod(center_album + 1, albums.size()):
		return 1
	return -1


func _slot_position(slot: int) -> Vector2:
	match slot:
		-1:
			return Vector2(320.0, 250.0)
		1:
			return Vector2(960.0, 250.0)
		_:
			return CAROUSEL_CENTER


func _display_track_info(album_index: int, track_index: int) -> void:
	if album_index < 0 or album_index >= albums.size():
		return
	var album: Dictionary = albums[album_index]
	var tracks: Array = album.get("tracks", [])
	if track_index < 0 or track_index >= tracks.size():
		return
	_displayed_track_index = track_index
	var track: Dictionary = tracks[track_index]
	_track_title_label.text = str(track.get("title", ""))
	_track_title_label.tooltip_text = _track_title_label.text
	_album_title_label.text = str(album.get("title", ""))
	_album_title_label.tooltip_text = _album_title_label.text
	_composer_button.text = str(track.get("composer", "未知作曲者"))
	_composer_button.tooltip_text = str(track.get("composer_description", ""))
	_composer_url = str(track.get("composer_url", ""))
	var has_link := _is_safe_web_url(_composer_url)
	_composer_button.disabled = not has_link
	_composer_external_button.visible = has_link
	_duration_label.text = _format_time(float(track.get("duration", 0.0)))


func _on_track_changed(album_index: int, track_index: int, track: Dictionary) -> void:
	if selected_album_index != album_index:
		selected_album_index = album_index
		_apply_carousel_layout(true)
	_progress_slider.editable = true
	_display_track_info(album_index, track_index)
	_load_track_lyrics(str(track.get("lyrics", "")))
	_refresh_playlist_highlight()


func _on_playback_state_changed(new_state: int) -> void:
	var is_active: bool = new_state in [
		PlaybackController.PlaybackState.PLAYING,
		PlaybackController.PlaybackState.TRANSITIONING,
	]
	if is_instance_valid(_spectrum):
		_spectrum.set_playback_active(is_active)
	_animate_play_pause_state(is_active)
	_play_pause_button.tooltip_text = "暂停" if is_active else "播放"
	_refresh_playlist_highlight()
	if new_state == PlaybackController.PlaybackState.IDLE:
		_refresh_album_selection(false)


func _animate_play_pause_state(is_active: bool) -> void:
	if _play_pause_visual_active == is_active:
		return
	_play_pause_visual_active = is_active
	if is_instance_valid(_play_pause_tween):
		_play_pause_tween.kill()
	_play_pause_button.scale = Vector2.ONE
	_play_pause_tween = create_tween()
	_play_pause_tween.set_trans(Tween.TRANS_SINE)
	_play_pause_tween.set_ease(Tween.EASE_IN_OUT)
	_play_pause_tween.tween_property(_play_pause_button, "modulate:a", 0.0, 0.12)
	_play_pause_tween.chain().tween_callback(func() -> void:
		_play_pause_button.set_icon(PlayerIconButton.IconType.PAUSE if is_active else PlayerIconButton.IconType.PLAY)
		_play_pause_button.set_active(is_active)
	)
	_play_pause_tween.chain().tween_property(_play_pause_button, "modulate:a", 1.0, 0.14)


func _on_play_mode_changed(mode: int) -> void:
	match mode:
		PlaybackController.PlayMode.SHUFFLE:
			_mode_button.set_icon(PlayerIconButton.IconType.SHUFFLE)
			_mode_button.tooltip_text = "随机播放"
		PlaybackController.PlayMode.REPEAT_ONE:
			_mode_button.set_icon(PlayerIconButton.IconType.REPEAT_ONE)
			_mode_button.tooltip_text = "单曲循环"
		_:
			_mode_button.set_icon(PlayerIconButton.IconType.LOOP_ALL)
			_mode_button.tooltip_text = "列表循环"


func _on_mode_pressed() -> void:
	if not _is_page_interactive():
		return
	_playback.cycle_play_mode()
	_mode_button.set_active(true)
	var tween := create_tween()
	tween.tween_interval(0.16)
	tween.tween_callback(func() -> void: _mode_button.set_active(false))


func _on_play_pause_pressed() -> void:
	if not _is_page_interactive() or _carousel_locked:
		return
	if _playback.current_track_index < 0 or _playback.current_album_index != selected_album_index:
		_playback.play_album(selected_album_index)
		return
	_playback.toggle_pause()


func _on_previous_pressed() -> void:
	if not _is_page_interactive() or _carousel_locked:
		return
	if _playback.current_track_index < 0 or _playback.current_album_index != selected_album_index:
		_play_displayed_track_offset(-1)
		return
	_playback.previous()


func _on_next_pressed() -> void:
	if not _is_page_interactive() or _carousel_locked:
		return
	if _playback.current_track_index < 0 or _playback.current_album_index != selected_album_index:
		_play_displayed_track_offset(1)
		return
	_playback.next()


func _play_displayed_track_offset(offset: int) -> void:
	if albums.is_empty() or selected_album_index < 0 or selected_album_index >= albums.size():
		return
	var tracks: Array = albums[selected_album_index].get("tracks", [])
	if tracks.is_empty():
		return
	var base_index := clampi(_displayed_track_index, 0, tracks.size() - 1)
	var target_index := posmod(base_index + offset, tracks.size())
	_playback.play_track(selected_album_index, target_index)


func _on_position_changed(position_seconds: float, duration_seconds: float) -> void:
	if not is_instance_valid(_playback):
		return
	if _playback.current_album_index != selected_album_index:
		return
	if _playback.current_track_index < 0:
		_refresh_album_selection(false)
		return
	var safe_duration := maxf(duration_seconds, 0.0)
	if not _is_dragging_progress:
		_progress_slider.max_value = maxf(safe_duration, 1.0)
		_progress_slider.set_value_no_signal(clampf(position_seconds, 0.0, _progress_slider.max_value))
		_current_time_label.text = _format_time(position_seconds)
		_update_lyrics(position_seconds)
	_duration_label.text = _format_time(safe_duration)


func _on_progress_drag_started() -> void:
	_is_dragging_progress = true
	_progress_drag_album_index = selected_album_index
	_progress_drag_track_index = _displayed_track_index


func _on_progress_drag_ended(value_changed: bool) -> void:
	_is_dragging_progress = false
	var controls_active_track: bool = (
		is_instance_valid(_playback)
		and _playback.current_track_index >= 0
		and _playback.current_album_index == selected_album_index
		and _playback.current_album_index == _progress_drag_album_index
		and _playback.current_track_index == _progress_drag_track_index
	)
	var controls_displayed_track: bool = (
		selected_album_index == _progress_drag_album_index
		and _displayed_track_index == _progress_drag_track_index
	)
	var stores_preview_position: bool = (
		is_instance_valid(_playback)
		and controls_displayed_track
		and not controls_active_track
	)
	var dragged_album_index := _progress_drag_album_index
	var dragged_track_index := _progress_drag_track_index
	_progress_drag_album_index = -1
	_progress_drag_track_index = -1
	if value_changed and controls_active_track:
		_playback.seek(float(_progress_slider.value))
	elif value_changed and stores_preview_position:
		_playback.set_album_resume_position(
			dragged_album_index,
			dragged_track_index,
			float(_progress_slider.value)
		)
		_current_time_label.text = _format_time(float(_progress_slider.value))
		_update_lyrics(float(_progress_slider.value))
	elif not controls_active_track:
		_refresh_album_selection(false)


func _on_progress_value_changed(value: float) -> void:
	if not _is_dragging_progress:
		return
	_current_time_label.text = _format_time(value)
	_update_lyrics(value)


func _load_track_lyrics(path: String) -> void:
	_lyrics_entries.clear()
	if not path.is_empty():
		_lyrics_entries = LyricsParser.parse_file(path)
	_update_lyrics(0.0)


func _update_lyrics(position_seconds: float) -> void:
	if _lyrics_entries.is_empty():
		_lyrics_previous.text = ""
		_lyrics_current.text = "纯音乐，请欣赏"
		_lyrics_next.text = ""
		return
	var lines: Array[String] = LyricsParser.get_three_lines(_lyrics_entries, position_seconds)
	_lyrics_previous.text = lines[0]
	_lyrics_current.text = lines[1]
	_lyrics_next.text = lines[2]


func _toggle_volume_popup() -> void:
	if not _is_page_interactive():
		return
	if _volume_layer.visible:
		_close_volume_popup()
	else:
		_open_volume_popup()


func _open_volume_popup() -> void:
	_close_playlist(true)
	if is_instance_valid(_volume_tween):
		_volume_tween.kill()
	_volume_layer.visible = true
	_volume_panel.modulate.a = 0.0
	_volume_panel.scale = Vector2(0.94, 0.94)
	_volume_tween = create_tween()
	_volume_tween.set_parallel(true)
	_volume_tween.set_trans(Tween.TRANS_QUART)
	_volume_tween.set_ease(Tween.EASE_OUT)
	_volume_tween.tween_property(_volume_panel, "modulate:a", 1.0, 0.16)
	_volume_tween.tween_property(_volume_panel, "scale", Vector2.ONE, 0.16)
	_volume_button.set_active(true)


func _close_volume_popup(immediate := false) -> void:
	if not _volume_layer.visible:
		return
	_save_player_volume()
	_volume_button.set_active(false)
	if is_instance_valid(_volume_tween):
		_volume_tween.kill()
	if immediate:
		_volume_layer.visible = false
		_volume_panel.modulate.a = 1.0
		_volume_panel.scale = Vector2.ONE
		return
	_volume_tween = create_tween()
	_volume_tween.set_parallel(true)
	_volume_tween.set_trans(Tween.TRANS_QUART)
	_volume_tween.set_ease(Tween.EASE_IN)
	_volume_tween.tween_property(_volume_panel, "modulate:a", 0.0, 0.12)
	_volume_tween.tween_property(_volume_panel, "scale", Vector2(0.94, 0.94), 0.12)
	_volume_tween.chain().tween_callback(func() -> void: _volume_layer.visible = false)


func _on_volume_changed(value: float) -> void:
	if is_instance_valid(_playback):
		_playback.set_player_volume(value / 100.0)


func _on_volume_drag_ended(_changed: bool) -> void:
	_save_player_volume()


func _save_player_volume() -> void:
	var game_config := get_node_or_null("/root/GameConfig")
	if game_config == null:
		return
	game_config.music_player_volume = float(_volume_slider.value)
	game_config.save()


func _toggle_playlist() -> void:
	if not _is_page_interactive():
		return
	if _playlist_layer.visible:
		_close_playlist()
	else:
		_open_playlist()


func _open_playlist() -> void:
	_close_volume_popup(true)
	_rebuild_playlist()
	if is_instance_valid(_playlist_tween):
		_playlist_tween.kill()
	_playlist_layer.visible = true
	_playlist_panel.position.x = PANEL_HIDDEN_X
	_playlist_panel.modulate.a = 0.65
	_playlist_tween = create_tween()
	_playlist_tween.set_parallel(true)
	_playlist_tween.set_trans(Tween.TRANS_QUART)
	_playlist_tween.set_ease(Tween.EASE_OUT)
	_playlist_tween.tween_property(_playlist_panel, "position:x", PANEL_X, 0.22)
	_playlist_tween.tween_property(_playlist_panel, "modulate:a", 1.0, 0.18)
	_playlist_tween.tween_property(_playlist_handle, "position:x", HANDLE_OPEN_X, 0.22)
	_playlist_handle.text = "›"
	_playlist_handle.tooltip_text = "收起播放列表"


func _close_playlist(immediate := false) -> void:
	if not _playlist_layer.visible:
		return
	_playlist_handle.text = "‹"
	_playlist_handle.tooltip_text = "展开播放列表"
	if is_instance_valid(_playlist_tween):
		_playlist_tween.kill()
	if immediate:
		_playlist_layer.visible = false
		_playlist_panel.position.x = PANEL_X
		_playlist_panel.modulate.a = 1.0
		_playlist_handle.position.x = HANDLE_CLOSED_X
		return
	_playlist_tween = create_tween()
	_playlist_tween.set_parallel(true)
	_playlist_tween.set_trans(Tween.TRANS_QUART)
	_playlist_tween.set_ease(Tween.EASE_IN)
	_playlist_tween.tween_property(_playlist_panel, "position:x", PANEL_HIDDEN_X, 0.18)
	_playlist_tween.tween_property(_playlist_panel, "modulate:a", 0.55, 0.16)
	_playlist_tween.tween_property(_playlist_handle, "position:x", HANDLE_CLOSED_X, 0.18)
	_playlist_tween.chain().tween_callback(func() -> void: _playlist_layer.visible = false)


func _rebuild_playlist() -> void:
	if not is_instance_valid(_playlist_rows_container) or albums.is_empty():
		return
	for child in _playlist_rows_container.get_children():
		child.queue_free()
	_playlist_rows.clear()

	var album: Dictionary = albums[selected_album_index]
	var tracks: Array = album.get("tracks", [])
	_playlist_count.text = str(tracks.size())
	_playlist_title.tooltip_text = str(album.get("title", ""))
	var cover := str(album.get("cover", ""))
	for track_index in tracks.size():
		var track: Dictionary = tracks[track_index]
		var row := _create_playlist_row(selected_album_index, track_index, track, cover)
		_playlist_rows_container.add_child(row["button"])
		_playlist_rows.append(row)
	_refresh_playlist_highlight()


func _create_playlist_row(album_index: int, track_index: int, track: Dictionary, cover_path: String) -> Dictionary:
	var button := Button.new()
	button.name = "Track%02d" % (track_index + 1)
	button.custom_minimum_size = Vector2(0.0, 72.0)
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.flat = true
	button.focus_mode = Control.FOCUS_NONE
	button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	button.add_theme_stylebox_override("normal", _panel_style(Color.TRANSPARENT, 10.0))
	button.add_theme_stylebox_override("hover", _panel_style(COLOR_PANEL_HOVER, 10.0))
	button.add_theme_stylebox_override("pressed", _panel_style(Color(0.17, 0.18, 0.18, 0.9), 10.0))
	button.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	button.pressed.connect(_on_playlist_track_pressed.bind(album_index, track_index))

	var row := HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 10.0
	row.offset_right = -10.0
	row.add_theme_constant_override("separation", 9)
	button.add_child(row)

	var indicator := _create_equalizer_indicator()
	row.add_child(indicator)

	var cover := TextureRect.new()
	cover.custom_minimum_size = Vector2(48.0, 48.0)
	cover.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cover.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	cover.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	cover.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	cover.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if ResourceLoader.exists(cover_path):
		cover.texture = ResourceLoader.load(cover_path) as Texture2D
	row.add_child(cover)

	var text_column := VBoxContainer.new()
	text_column.mouse_filter = Control.MOUSE_FILTER_IGNORE
	text_column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	text_column.alignment = BoxContainer.ALIGNMENT_CENTER
	text_column.add_theme_constant_override("separation", 0)
	row.add_child(text_column)

	var title := _create_label(str(track.get("title", "")), 16, COLOR_TEXT, HORIZONTAL_ALIGNMENT_LEFT)
	title.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.tooltip_text = title.text
	text_column.add_child(title)

	var composer := _create_label(str(track.get("composer", "")), 13, COLOR_MUTED, HORIZONTAL_ALIGNMENT_LEFT)
	composer.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	composer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	text_column.add_child(composer)

	var duration := _create_label(_format_time(float(track.get("duration", 0.0))), 13, COLOR_MUTED, HORIZONTAL_ALIGNMENT_RIGHT)
	duration.custom_minimum_size.x = 43.0
	row.add_child(duration)

	return {
		"button": button,
		"indicator": indicator,
		"album_index": album_index,
		"track_index": track_index,
	}


func _create_equalizer_indicator() -> Control:
	var indicator := Control.new()
	indicator.custom_minimum_size = Vector2(18.0, 48.0)
	indicator.mouse_filter = Control.MOUSE_FILTER_IGNORE
	indicator.visible = false
	var heights := [10.0, 20.0, 14.0]
	for index in 3:
		var bar := ColorRect.new()
		bar.color = COLOR_ACCENT
		bar.position = Vector2(2.0 + index * 5.0, 24.0 - heights[index] * 0.5)
		bar.size = Vector2(2.0, heights[index])
		bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
		indicator.add_child(bar)
	return indicator


func _on_playlist_track_pressed(album_index: int, track_index: int) -> void:
	if not _is_page_interactive() or _carousel_locked:
		return
	selected_album_index = album_index
	_playback.play_track(album_index, track_index)
	_refresh_playlist_highlight()


func _refresh_playlist_highlight() -> void:
	if not is_instance_valid(_playback):
		return
	for row_data in _playlist_rows:
		var button := row_data["button"] as Button
		var indicator := row_data["indicator"] as Control
		var selected: bool = (
			int(row_data["album_index"]) == _playback.current_album_index
			and int(row_data["track_index"]) == _playback.current_track_index
		)
		button.add_theme_stylebox_override(
			"normal",
			_panel_style(Color(0.12, 0.14, 0.17, 0.96), 10.0, Color(0.44, 0.40, 0.34, 0.65), 1.0) if selected else _panel_style(Color.TRANSPARENT, 10.0)
		)
		indicator.visible = selected


func _open_composer_link() -> void:
	if not _is_page_interactive() or not _is_safe_web_url(_composer_url):
		return
	var error := OS.shell_open(_composer_url)
	if error != OK:
		_show_status("无法打开作曲家链接")


func _on_exclusive_playback_changed(active: bool) -> void:
	exclusive_playback_changed.emit(active)


func _show_status(message: String) -> void:
	_status_token += 1
	var token := _status_token
	_status_label.text = message
	_status_label.visible = true
	_status_label.modulate.a = 1.0
	_set_lyrics_visible(false)
	var tween := create_tween()
	tween.tween_interval(2.2)
	tween.tween_property(_status_label, "modulate:a", 0.0, 0.3)
	tween.tween_callback(func() -> void:
		if token == _status_token:
			_status_label.visible = false
			_set_lyrics_visible(true)
	)


func _set_lyrics_visible(value: bool) -> void:
	_lyrics_previous.visible = value
	_lyrics_current.visible = value
	_lyrics_next.visible = value


func _on_visibility_changed() -> void:
	if visible:
		return
	_is_dragging_progress = false
	_progress_drag_album_index = -1
	_progress_drag_track_index = -1
	_gesture_tracking = false
	_gesture_pointer = -2
	_gesture_progress = 0.0
	_gesture_direction = 0
	_queued_carousel_direction = 0
	if is_instance_valid(_carousel_tween):
		_carousel_tween.kill()
	_carousel_locked = false
	_apply_carousel_layout(true)
	if is_instance_valid(_spectrum):
		_spectrum.set_playback_active(false, true)
	_close_volume_popup(true)
	_close_playlist(true)
	if is_instance_valid(_playback):
		_playback.stop(true)


func _unhandled_key_input(event: InputEvent) -> void:
	if not visible or not event.is_action_pressed("ui_cancel"):
		return
	if _playlist_layer.visible:
		_close_playlist()
		get_viewport().set_input_as_handled()
	elif _volume_layer.visible:
		_close_volume_popup()
		get_viewport().set_input_as_handled()


func _input(event: InputEvent) -> void:
	if not _is_page_interactive():
		return
	var carousel_rect := Rect2(180.0, 72.0, 920.0, 320.0)
	if event is InputEventMouseButton:
		var mouse_event := event as InputEventMouseButton
		if mouse_event.button_index != MOUSE_BUTTON_LEFT:
			return
		if mouse_event.pressed:
			_dismiss_popovers_outside(mouse_event.position)
			if not _playlist_layer.visible and not _volume_layer.visible and carousel_rect.has_point(mouse_event.position):
				_begin_carousel_gesture(-1, mouse_event.position)
		elif not mouse_event.pressed:
			_end_carousel_gesture(-1, mouse_event.position)
	elif event is InputEventMouseMotion:
		var motion_event := event as InputEventMouseMotion
		_update_carousel_gesture(-1, motion_event.position)
	elif event is InputEventScreenTouch:
		var touch_event := event as InputEventScreenTouch
		if touch_event.pressed:
			_dismiss_popovers_outside(touch_event.position)
			if not _playlist_layer.visible and not _volume_layer.visible and carousel_rect.has_point(touch_event.position):
				_begin_carousel_gesture(touch_event.index, touch_event.position)
		elif not touch_event.pressed:
			_end_carousel_gesture(touch_event.index, touch_event.position)
	elif event is InputEventScreenDrag:
		var drag_event := event as InputEventScreenDrag
		_update_carousel_gesture(drag_event.index, drag_event.position)


func _dismiss_popovers_outside(pointer_position: Vector2) -> void:
	if (
		_volume_layer.visible
		and not _volume_panel.get_global_rect().has_point(pointer_position)
		and not _volume_button.get_global_rect().has_point(pointer_position)
	):
		_close_volume_popup(true)
	if (
		_playlist_layer.visible
		and not _playlist_panel.get_global_rect().has_point(pointer_position)
		and not _playlist_handle.get_global_rect().has_point(pointer_position)
	):
		_close_playlist(true)


func _begin_carousel_gesture(pointer_index: int, pointer_position: Vector2) -> void:
	if _gesture_tracking or _carousel_locked:
		return
	_carousel_locked = true
	_gesture_tracking = true
	_gesture_pointer = pointer_index
	_gesture_start = pointer_position
	_gesture_progress = 0.0
	_gesture_direction = 0
	_apply_carousel_layout(true)


func _update_carousel_gesture(pointer_index: int, pointer_position: Vector2) -> void:
	if not _gesture_tracking or pointer_index != _gesture_pointer:
		return
	var delta := pointer_position - _gesture_start
	if absf(delta.x) < 1.0:
		_gesture_direction = 0
		_gesture_progress = 0.0
		_apply_carousel_layout(true)
		return
	_gesture_direction = 1 if delta.x < 0.0 else -1
	_gesture_progress = clampf(absf(delta.x) / CAROUSEL_DRAG_DISTANCE, 0.0, 1.0)
	if absf(delta.x) > 12.0:
		for card in _cards:
			card.cancel_pending_activation()
	_apply_carousel_drag(_gesture_progress, _gesture_direction)


func _end_carousel_gesture(pointer_index: int, pointer_position: Vector2) -> void:
	if not _gesture_tracking or pointer_index != _gesture_pointer:
		return
	var delta := pointer_position - _gesture_start
	_update_carousel_gesture(pointer_index, pointer_position)
	var direction := _gesture_direction
	var progress := _gesture_progress
	_gesture_tracking = false
	_gesture_pointer = -2
	if direction == 0:
		_carousel_locked = false
		return
	var commit := progress >= CAROUSEL_COMMIT_PROGRESS and absf(delta.x) > absf(delta.y) * 1.05
	_animate_carousel_progress(direction, progress, 1.0 if commit else 0.0, commit)


func _style_slider(slider: Slider, thickness: float) -> void:
	var track := StyleBoxFlat.new()
	track.bg_color = Color(0.50, 0.49, 0.47, 0.55)
	track.content_margin_top = thickness
	track.content_margin_bottom = thickness
	track.corner_radius_top_left = int(thickness)
	track.corner_radius_top_right = int(thickness)
	track.corner_radius_bottom_left = int(thickness)
	track.corner_radius_bottom_right = int(thickness)
	var fill := track.duplicate() as StyleBoxFlat
	fill.bg_color = COLOR_ACCENT
	slider.add_theme_stylebox_override("slider", track)
	slider.add_theme_stylebox_override("grabber_area", fill)
	slider.add_theme_stylebox_override("grabber_area_highlight", fill)
	slider.add_theme_icon_override("grabber", _slider_grabber)
	slider.add_theme_icon_override("grabber_highlight", _slider_grabber)
	slider.add_theme_icon_override("grabber_disabled", _slider_grabber)


func _style_volume_slider(slider: VSlider) -> void:
	var track := StyleBoxLine.new()
	track.color = Color(0.55, 0.56, 0.58, 0.78)
	track.thickness = 4
	track.vertical = true
	track.grow_begin = 0.0
	track.grow_end = 0.0
	var fill := track.duplicate() as StyleBoxLine
	fill.color = COLOR_ACCENT.lightened(0.12)
	fill.thickness = 5
	var grabber := _create_circle_texture(18, COLOR_TEXT)
	# The default Slider theme shortens the usable travel by half the grabber
	# texture at both ends. The popup already provides 12 px outer margins, so
	# center the grabber on the real 0/100 endpoints and keep the track equally
	# long instead of leaving a visible gap above and below it.
	slider.add_theme_constant_override("center_grabber", 1)
	slider.add_theme_constant_override("grabber_offset", 0)
	slider.add_theme_stylebox_override("slider", track)
	slider.add_theme_stylebox_override("grabber_area", fill)
	slider.add_theme_stylebox_override("grabber_area_highlight", fill)
	slider.add_theme_icon_override("grabber", grabber)
	slider.add_theme_icon_override("grabber_highlight", grabber)
	slider.add_theme_icon_override("grabber_disabled", grabber)


func _style_playlist_scrollbar(scrollbar: VScrollBar) -> void:
	if scrollbar == null:
		return
	scrollbar.custom_minimum_size.x = 6.0
	var track := _panel_style(Color(0.25, 0.26, 0.27, 0.18), 3.0)
	var grabber := _panel_style(Color(0.58, 0.55, 0.49, 0.58), 3.0)
	var grabber_hover := _panel_style(Color(0.72, 0.68, 0.60, 0.78), 3.0)
	scrollbar.add_theme_stylebox_override("scroll", track)
	scrollbar.add_theme_stylebox_override("grabber", grabber)
	scrollbar.add_theme_stylebox_override("grabber_highlight", grabber_hover)
	scrollbar.add_theme_stylebox_override("grabber_pressed", grabber_hover)


func _is_page_interactive() -> bool:
	if not is_visible_in_tree() or modulate.a < 0.98:
		return false
	var main_menu := get_parent()
	if main_menu == null:
		return true
	if main_menu.has_method("is_settings_open"):
		if bool(main_menu.call("is_settings_open")):
			return false
		var switching_value: Variant = main_menu.get("_is_switching")
		if typeof(switching_value) == TYPE_BOOL and bool(switching_value):
			return false
	return true


func _create_circle_texture(texture_size: int, color: Color) -> Texture2D:
	var image := Image.create(texture_size, texture_size, false, Image.FORMAT_RGBA8)
	image.fill(Color.TRANSPARENT)
	var center := Vector2(texture_size - 1, texture_size - 1) * 0.5
	var radius := float(texture_size) * 0.38
	for y in texture_size:
		for x in texture_size:
			if Vector2(x, y).distance_to(center) <= radius:
				image.set_pixel(x, y, color)
	return ImageTexture.create_from_image(image)


func _panel_style(background: Color, radius: float, border_color := Color.TRANSPARENT, border_width := 0.0) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = background
	style.corner_radius_top_left = int(radius)
	style.corner_radius_top_right = int(radius)
	style.corner_radius_bottom_left = int(radius)
	style.corner_radius_bottom_right = int(radius)
	if border_width > 0.0:
		style.border_color = border_color
		style.border_width_left = int(border_width)
		style.border_width_top = int(border_width)
		style.border_width_right = int(border_width)
		style.border_width_bottom = int(border_width)
	return style


func _set_margins(container: MarginContainer, left: int, top: int, right: int, bottom: int) -> void:
	container.add_theme_constant_override("margin_left", left)
	container.add_theme_constant_override("margin_top", top)
	container.add_theme_constant_override("margin_right", right)
	container.add_theme_constant_override("margin_bottom", bottom)


func _full_rect(control: Control) -> void:
	control.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)


func _format_time(seconds: float) -> String:
	var total_seconds := maxi(int(floor(maxf(seconds, 0.0))), 0)
	return "%02d:%02d" % [floori(float(total_seconds) / 60.0), total_seconds % 60]


func _is_safe_web_url(url: String) -> bool:
	var normalized := url.strip_edges().to_lower()
	return normalized.begins_with("https://") or normalized.begins_with("http://")
