extends Control

signal mods_changed

const MODS_FOLDER_PATH: String = "user://mods"
const MOD_CONFIG_FILENAME: String = "mod_config.json"
const PLATFORM_MODS_LIST_PATH: String = "/api/mods"
const PLATFORM_MOD_DOWNLOAD_PATH_FORMAT: String = "/api/mods/%d/download"
const PLATFORM_MOD_DELETE_PATH_FORMAT: String = "/api/mods/%d"
const PLATFORM_MY_MODS_PATH: String = "/api/user/mods"
const PLATFORM_ADMIN_MODS_PATH: String = "/api/admin/mods"
const PLATFORM_ADMIN_MOD_REVIEW_PATH_FORMAT: String = "/api/admin/mods/%d/review"
const PLATFORM_ADMIN_MOD_DELETE_PATH_FORMAT: String = "/api/admin/mods/%d"

const ENTER_ANIMATION_DURATION: float = 0.22
const EXIT_ANIMATION_DURATION: float = 0.18
const ONLINE_CACHE_TTL_SECONDS: int = 45
const ONLINE_CACHE_PAGE_SIZE: int = 50
const ONLINE_CACHE_FILE_PATH: String = "user://cache/online_mods_cache.json"
const ONLINE_CACHE_FILE_VERSION: int = 1

static var _cached_public_mods_by_sort: Dictionary = {}
static var _cached_public_mods_ts_by_sort: Dictionary = {}
static var _cache_warmup_inflight_by_sort: Dictionary = {}
static var _cached_online_mods_by_key: Dictionary = {}
static var _cached_online_mods_ts_by_key: Dictionary = {}
static var _disk_cache_loaded: bool = false

@onready var backdrop: ColorRect = $"Backdrop"
@onready var window_panel: Control = $"Window"
@onready var close_button: Button = $"Window/Margin/Root/Header/CloseButton"
@onready var window_root: VBoxContainer = $"Window/Margin/Root"
@onready var message_dialog: AcceptDialog = $"MessageDialog"

var _online_status_label: Label = null

var _mods_dirty: bool = false
var _online_http: HTTPRequest = null
var _online_public_list: ItemList = null
var _online_list: ItemList = null
var _online_admin_tabs: TabContainer = null
var _online_admin_pending_list: ItemList = null
var _online_admin_reviewed_list: ItemList = null
var _online_sort: OptionButton = null
var _online_refresh_button: Button = null
var _online_download_button: Button = null
var _online_delete_button: Button = null
var _online_admin_approve_button: Button = null
var _online_admin_reject_button: Button = null
var _online_delete_confirm_dialog: ConfirmationDialog = null
var _online_all_mods: Array[Dictionary] = []
var _online_mods: Array[Dictionary] = []
var _online_admin_pending_mods: Array[Dictionary] = []
var _online_admin_reviewed_mods: Array[Dictionary] = []
var _online_busy: bool = false
var _online_is_admin: bool = false
var _online_pending_delete_item: Dictionary = {}
var _is_quitting: bool = false
var _is_exiting: bool = false

static func _normalize_online_sort(sort_key: String) -> String:
	match sort_key:
		"downloads", "rating":
			return sort_key
		_:
			return "new"

static func _cache_timestamp_now() -> int:
	return int(Time.get_unix_time_from_system())

static func _clone_mods_for_cache(mods: Array[Dictionary]) -> Array[Dictionary]:
	var copy: Array[Dictionary] = []
	for item in mods:
		copy.append(item.duplicate(true))
	return copy

static func _sanitize_cached_mods_map(value: Variant) -> Dictionary:
	var out: Dictionary = {}
	if typeof(value) != TYPE_DICTIONARY:
		return out
	var source: Dictionary = value as Dictionary
	for key_any in source.keys():
		var key: String = str(key_any)
		var mods_any: Variant = source.get(key_any, [])
		if typeof(mods_any) != TYPE_ARRAY:
			continue
		var mods_out: Array[Dictionary] = []
		for item_any in mods_any:
			if typeof(item_any) != TYPE_DICTIONARY:
				continue
			mods_out.append((item_any as Dictionary).duplicate(true))
		out[key] = mods_out
	return out

static func _sanitize_cached_ts_map(value: Variant) -> Dictionary:
	var out: Dictionary = {}
	if typeof(value) != TYPE_DICTIONARY:
		return out
	var source: Dictionary = value as Dictionary
	for key_any in source.keys():
		var key: String = str(key_any)
		var ts: int = int(source.get(key_any, 0))
		if ts > 0:
			out[key] = ts
	return out

static func _load_cache_from_disk() -> void:
	if _disk_cache_loaded:
		return
	_disk_cache_loaded = true
	if not FileAccess.file_exists(ONLINE_CACHE_FILE_PATH):
		return

	var file: FileAccess = FileAccess.open(ONLINE_CACHE_FILE_PATH, FileAccess.READ)
	if file == null:
		return
	var raw: String = file.get_as_text()
	file.close()

	var parsed: Variant = JSON.parse_string(raw)
	if typeof(parsed) != TYPE_DICTIONARY:
		return
	var root: Dictionary = parsed as Dictionary
	var version: int = int(root.get("version", ONLINE_CACHE_FILE_VERSION))
	if version != ONLINE_CACHE_FILE_VERSION:
		return

	_cached_public_mods_by_sort = _sanitize_cached_mods_map(root.get("public_mods_by_sort", {}))
	_cached_public_mods_ts_by_sort = _sanitize_cached_ts_map(root.get("public_ts_by_sort", {}))
	_cached_online_mods_by_key = _sanitize_cached_mods_map(root.get("online_mods_by_key", {}))
	_cached_online_mods_ts_by_key = _sanitize_cached_ts_map(root.get("online_ts_by_key", {}))

static func _save_cache_to_disk() -> void:
	var user_dir: DirAccess = DirAccess.open("user://")
	if user_dir == null:
		return
	if not user_dir.dir_exists("cache"):
		var mk_err: int = user_dir.make_dir_recursive("cache")
		if mk_err != OK and not user_dir.dir_exists("cache"):
			return

	var payload_public_mods: Dictionary = {}
	for key_any in _cached_public_mods_by_sort.keys():
		var key: String = str(key_any)
		var mods_any: Variant = _cached_public_mods_by_sort.get(key_any, [])
		if typeof(mods_any) != TYPE_ARRAY:
			continue
		var mods_copy: Array[Dictionary] = []
		for item_any in mods_any:
			if typeof(item_any) != TYPE_DICTIONARY:
				continue
			mods_copy.append((item_any as Dictionary).duplicate(true))
		payload_public_mods[key] = mods_copy

	var payload_online_mods: Dictionary = {}
	for key_any in _cached_online_mods_by_key.keys():
		var key: String = str(key_any)
		var mods_any: Variant = _cached_online_mods_by_key.get(key_any, [])
		if typeof(mods_any) != TYPE_ARRAY:
			continue
		var mods_copy: Array[Dictionary] = []
		for item_any in mods_any:
			if typeof(item_any) != TYPE_DICTIONARY:
				continue
			mods_copy.append((item_any as Dictionary).duplicate(true))
		payload_online_mods[key] = mods_copy

	var payload_public_ts: Dictionary = {}
	for key_any in _cached_public_mods_ts_by_sort.keys():
		payload_public_ts[str(key_any)] = int(_cached_public_mods_ts_by_sort.get(key_any, 0))

	var payload_online_ts: Dictionary = {}
	for key_any in _cached_online_mods_ts_by_key.keys():
		payload_online_ts[str(key_any)] = int(_cached_online_mods_ts_by_key.get(key_any, 0))

	var payload: Dictionary = {
		"version": ONLINE_CACHE_FILE_VERSION,
		"saved_at": _cache_timestamp_now(),
		"public_mods_by_sort": payload_public_mods,
		"public_ts_by_sort": payload_public_ts,
		"online_mods_by_key": payload_online_mods,
		"online_ts_by_key": payload_online_ts,
	}

	var file: FileAccess = FileAccess.open(ONLINE_CACHE_FILE_PATH, FileAccess.WRITE)
	if file == null:
		return
	file.store_string(JSON.stringify(payload))
	file.close()

static func _set_cached_online_mods_static(cache_key: String, mods: Array[Dictionary]) -> void:
	_load_cache_from_disk()
	_cached_online_mods_by_key[cache_key] = _clone_mods_for_cache(mods)
	_cached_online_mods_ts_by_key[cache_key] = _cache_timestamp_now()
	_save_cache_to_disk()

static func has_fresh_public_mod_cache(sort_key: String = "new") -> bool:
	_load_cache_from_disk()
	var key: String = _normalize_online_sort(sort_key)
	if not _cached_public_mods_ts_by_sort.has(key):
		return false
	var ts: int = int(_cached_public_mods_ts_by_sort.get(key, 0))
	if ts <= 0:
		return false
	return (_cache_timestamp_now() - ts) <= ONLINE_CACHE_TTL_SECONDS

static func get_cached_public_mods(sort_key: String = "new") -> Array[Dictionary]:
	_load_cache_from_disk()
	var key: String = _normalize_online_sort(sort_key)
	var cached_any: Variant = _cached_public_mods_by_sort.get(key, [])
	var out: Array[Dictionary] = []
	if typeof(cached_any) != TYPE_ARRAY:
		return out
	for item_any in cached_any:
		if typeof(item_any) != TYPE_DICTIONARY:
			continue
		out.append((item_any as Dictionary).duplicate(true))
	return out

static func set_cached_public_mods(sort_key: String, mods: Array[Dictionary]) -> void:
	_load_cache_from_disk()
	var key: String = _normalize_online_sort(sort_key)
	_cached_public_mods_by_sort[key] = _clone_mods_for_cache(mods)
	_cached_public_mods_ts_by_sort[key] = _cache_timestamp_now()
	_save_cache_to_disk()

static func _extract_mods_from_parsed_payload(parsed: Variant) -> Array[Dictionary]:
	var payload: Dictionary = {}
	if typeof(parsed) == TYPE_DICTIONARY:
		var parsed_dict: Dictionary = parsed as Dictionary
		if typeof(parsed_dict.get("data")) == TYPE_DICTIONARY:
			payload = parsed_dict.get("data") as Dictionary
		else:
			payload = parsed_dict

	var output: Array[Dictionary] = []
	var mods_any: Variant = payload.get("mods", [])
	if typeof(mods_any) != TYPE_ARRAY:
		return output

	for item_any in mods_any:
		if typeof(item_any) != TYPE_DICTIONARY:
			continue
		output.append(item_any as Dictionary)
	return output

static func warmup_public_mods(host_node: Node, sort_key: String = "new") -> void:
	if host_node == null or not is_instance_valid(host_node):
		return
	if host_node.get_node_or_null("/root/AuthManager") == null:
		return

	var key: String = _normalize_online_sort(sort_key)
	if bool(_cache_warmup_inflight_by_sort.get(key, false)):
		return

	_cache_warmup_inflight_by_sort[key] = true
	if not await AuthManager.ensure_valid_token():
		_cache_warmup_inflight_by_sort.erase(key)
		return

	var is_admin: bool = false
	if AuthManager.has_method("is_admin"):
		is_admin = bool(AuthManager.is_admin())

	var request: HTTPRequest = HTTPRequest.new()
	request.use_threads = false
	host_node.add_child(request)

	var headers := PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
	var path: String = "%s?page=1&limit=%d&sort=%s" % [PLATFORM_ADMIN_MODS_PATH if is_admin else PLATFORM_MODS_LIST_PATH, ONLINE_CACHE_PAGE_SIZE, key]
	var url: String = AuthManager.BASE_URL + path
	var err: int = request.request(url, headers, HTTPClient.METHOD_GET)
	if err != OK:
		_cache_warmup_inflight_by_sort.erase(key)
		request.queue_free()
		return

	var completed: Array = await request.request_completed
	var result_code: int = int(completed[0])
	var status_code: int = int(completed[1])
	var body: PackedByteArray = completed[3]

	# Admin list may be unavailable on some deployments; fallback to public list.
	if is_admin and (result_code != HTTPRequest.RESULT_SUCCESS or status_code < 200 or status_code >= 300):
		path = "%s?page=1&limit=%d&sort=%s" % [PLATFORM_MODS_LIST_PATH, ONLINE_CACHE_PAGE_SIZE, key]
		url = AuthManager.BASE_URL + path
		err = request.request(url, headers, HTTPClient.METHOD_GET)
		if err == OK:
			completed = await request.request_completed
			result_code = int(completed[0])
			status_code = int(completed[1])
			body = completed[3]

	_cache_warmup_inflight_by_sort.erase(key)
	request.queue_free()

	if result_code != HTTPRequest.RESULT_SUCCESS or status_code < 200 or status_code >= 300:
		return

	var raw: String = body.get_string_from_utf8()
	var parsed: Variant = JSON.parse_string(raw.strip_edges())
	var mods: Array[Dictionary] = _extract_mods_from_parsed_payload(parsed)
	if mods.is_empty():
		return

	var role_key: String = "admin" if is_admin else "public"
	var cache_key: String = "%s|%s" % [role_key, key]
	_set_cached_online_mods_static(cache_key, mods)

	if not is_admin:
		set_cached_public_mods(key, mods)

func _current_online_cache_key() -> String:
	var role_key: String = "admin" if _online_is_admin else "public"
	return "%s|%s" % [role_key, _current_sort_key()]

func _has_fresh_online_cache(cache_key: String) -> bool:
	_load_cache_from_disk()
	if not _cached_online_mods_ts_by_key.has(cache_key):
		return false
	var ts: int = int(_cached_online_mods_ts_by_key.get(cache_key, 0))
	if ts <= 0:
		return false
	return (_cache_timestamp_now() - ts) <= ONLINE_CACHE_TTL_SECONDS

func _get_cached_online_mods(cache_key: String) -> Array[Dictionary]:
	_load_cache_from_disk()
	var cached_any: Variant = _cached_online_mods_by_key.get(cache_key, [])
	var out: Array[Dictionary] = []
	if typeof(cached_any) != TYPE_ARRAY:
		return out
	for item_any in cached_any:
		if typeof(item_any) != TYPE_DICTIONARY:
			continue
		out.append((item_any as Dictionary).duplicate(true))
	return out

func _set_cached_online_mods(cache_key: String, mods: Array[Dictionary]) -> void:
	_set_cached_online_mods_static(cache_key, mods)

func _ready() -> void:
	_load_cache_from_disk()
	if message_dialog:
		message_dialog.exclusive = false
	if backdrop and not backdrop.gui_input.is_connected(_on_backdrop_gui_input):
		backdrop.gui_input.connect(_on_backdrop_gui_input)
	if close_button and not close_button.pressed.is_connected(_close):
		close_button.pressed.connect(_close)

	_online_http = HTTPRequest.new()
	_online_http.use_threads = false
	add_child(_online_http)

	var root_window: Window = get_tree().root
	if root_window != null and root_window.has_signal("close_requested") and not root_window.close_requested.is_connected(_on_root_close_requested):
		root_window.close_requested.connect(_on_root_close_requested)

	_play_enter_animation()
	call_deferred("_open_online_dialog")

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_viewport().set_input_as_handled()
		_close()

func _on_backdrop_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_close()

func _play_enter_animation() -> void:
	if backdrop:
		backdrop.modulate.a = 0.0
	if window_panel:
		window_panel.modulate.a = 0.0
		window_panel.scale = Vector2(0.98, 0.98)

	var tween := create_tween()
	tween.set_parallel(true)
	if backdrop:
		tween.tween_property(backdrop, "modulate:a", 1.0, ENTER_ANIMATION_DURATION).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	if window_panel:
		tween.tween_property(window_panel, "modulate:a", 1.0, ENTER_ANIMATION_DURATION).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property(window_panel, "scale", Vector2.ONE, ENTER_ANIMATION_DURATION).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)

func _close() -> void:
	if _is_exiting:
		return
	_is_exiting = true
	if _online_http != null:
		_online_http.cancel_request()
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	if backdrop:
		backdrop.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if window_panel:
		window_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var tween := create_tween()
	tween.set_parallel(true)
	if backdrop:
		tween.tween_property(backdrop, "modulate:a", 0.0, EXIT_ANIMATION_DURATION).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
	if window_panel:
		tween.tween_property(window_panel, "modulate:a", 0.0, EXIT_ANIMATION_DURATION).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
		tween.tween_property(window_panel, "scale", Vector2(0.97, 0.97), EXIT_ANIMATION_DURATION).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
	tween.finished.connect(func() -> void:
		if _mods_dirty:
			mods_changed.emit()
		queue_free()
	)

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_request_game_quit()

func _on_root_close_requested() -> void:
	_request_game_quit()

func _show_message(title: String, text: String) -> void:
	if _is_quitting:
		return
	if message_dialog == null:
		return
	message_dialog.exclusive = false
	message_dialog.title = title
	message_dialog.dialog_text = text
	if message_dialog.visible:
		return
	message_dialog.popup_centered()

func _request_game_quit() -> void:
	if _is_quitting:
		return
	_is_quitting = true
	if _online_http != null:
		_online_http.cancel_request()
	if _online_delete_confirm_dialog != null:
		_online_delete_confirm_dialog.hide()
	if message_dialog != null:
		message_dialog.hide()
	get_tree().quit()

func _exit_tree() -> void:
	if _online_http != null:
		_online_http.cancel_request()
	if _online_delete_confirm_dialog != null:
		_online_delete_confirm_dialog.hide()
	if message_dialog != null:
		message_dialog.hide()

func _open_online_dialog() -> void:
	if not has_node("/root/AuthManager"):
		_show_message("Notice", "AuthManager is missing.")
		return

	_ensure_online_dialog()
	if _online_list == null:
		return

	_refresh_online_admin_mode()
	if _apply_cached_mods_for_current_sort():
		_set_online_status("Ready")
		return

	await _sync_online_after_open(true)

func _sync_online_after_open(load_now: bool) -> void:
	if not await AuthManager.ensure_valid_token():
		if _online_all_mods.is_empty():
			_set_online_status("Login required")
			_show_message("Notice", "Please login before downloading online mods.")
		else:
			_set_online_status("Showing cached data")
		return

	_refresh_online_admin_mode()

	if load_now:
		await _load_online_mods()

func _refresh_online_admin_mode() -> void:
	_online_is_admin = false
	if has_node("/root/AuthManager") and AuthManager.has_method("is_admin"):
		_online_is_admin = bool(AuthManager.is_admin())

	if _online_public_list != null:
		_online_public_list.visible = not _online_is_admin
	if _online_admin_tabs != null:
		_online_admin_tabs.visible = _online_is_admin

	if _online_is_admin:
		_apply_admin_online_view(false)
	else:
		_online_list = _online_public_list
		_replace_online_mods(_online_all_mods, false)

	_update_online_admin_actions_state()

func _ensure_online_dialog() -> void:
	if _online_list != null and is_instance_valid(_online_list):
		return

	if window_root == null:
		return

	var root := VBoxContainer.new()
	root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_theme_constant_override("separation", 10)
	window_root.add_child(root)

	var toolbar := HBoxContainer.new()
	toolbar.add_theme_constant_override("separation", 8)
	root.add_child(toolbar)

	var sort_label := Label.new()
	sort_label.text = "Sort"
	toolbar.add_child(sort_label)

	var sort_option := OptionButton.new()
	sort_option.add_item("Newest", 0)
	sort_option.add_item("Downloads", 1)
	sort_option.add_item("Rating", 2)
	sort_option.item_selected.connect(func(_idx: int):
		if _apply_cached_mods_for_current_sort():
			_set_online_status("Ready")
			return
		_load_online_mods()
	)
	toolbar.add_child(sort_option)
	_online_sort = sort_option

	var spacer := Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	toolbar.add_child(spacer)

	var status_label := Label.new()
	status_label.custom_minimum_size = Vector2(220, 0)
	status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	status_label.modulate = Color(1, 1, 1, 0.72)
	status_label.text = ""
	toolbar.add_child(status_label)
	_online_status_label = status_label

	var refresh_btn := Button.new()
	refresh_btn.text = "Refresh"
	refresh_btn.pressed.connect(_on_online_refresh_pressed)
	toolbar.add_child(refresh_btn)
	_online_refresh_button = refresh_btn

	var public_list := ItemList.new()
	public_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	public_list.size_flags_vertical = Control.SIZE_EXPAND_FILL
	public_list.select_mode = ItemList.SELECT_SINGLE
	public_list.item_selected.connect(_on_online_item_selected)
	root.add_child(public_list)
	_online_public_list = public_list
	_online_list = public_list

	var admin_tabs := TabContainer.new()
	admin_tabs.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	admin_tabs.size_flags_vertical = Control.SIZE_EXPAND_FILL
	admin_tabs.tab_alignment = TabBar.ALIGNMENT_LEFT
	admin_tabs.visible = false
	admin_tabs.tab_changed.connect(_on_online_admin_tab_changed)
	root.add_child(admin_tabs)
	_online_admin_tabs = admin_tabs

	var pending_tab := VBoxContainer.new()
	pending_tab.name = "Pending"
	pending_tab.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pending_tab.size_flags_vertical = Control.SIZE_EXPAND_FILL
	admin_tabs.add_child(pending_tab)

	var pending_list := ItemList.new()
	pending_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pending_list.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pending_list.select_mode = ItemList.SELECT_SINGLE
	pending_list.item_selected.connect(_on_online_item_selected)
	pending_tab.add_child(pending_list)
	_online_admin_pending_list = pending_list

	var reviewed_tab := VBoxContainer.new()
	reviewed_tab.name = "Reviewed"
	reviewed_tab.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	reviewed_tab.size_flags_vertical = Control.SIZE_EXPAND_FILL
	admin_tabs.add_child(reviewed_tab)

	var reviewed_list := ItemList.new()
	reviewed_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	reviewed_list.size_flags_vertical = Control.SIZE_EXPAND_FILL
	reviewed_list.select_mode = ItemList.SELECT_SINGLE
	reviewed_list.item_selected.connect(_on_online_item_selected)
	reviewed_tab.add_child(reviewed_list)
	_online_admin_reviewed_list = reviewed_list

	var footer := HBoxContainer.new()
	footer.add_theme_constant_override("separation", 8)
	root.add_child(footer)

	var approve_btn := Button.new()
	approve_btn.text = "Approve"
	approve_btn.pressed.connect(_on_online_approve_pressed)
	footer.add_child(approve_btn)
	_online_admin_approve_button = approve_btn

	var reject_btn := Button.new()
	reject_btn.text = "Reject"
	reject_btn.pressed.connect(_on_online_reject_pressed)
	footer.add_child(reject_btn)
	_online_admin_reject_button = reject_btn

	var delete_btn := Button.new()
	delete_btn.text = "Delete Upload"
	delete_btn.pressed.connect(_on_online_delete_pressed)
	footer.add_child(delete_btn)
	_online_delete_button = delete_btn

	var footer_spacer := Control.new()
	footer_spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	footer.add_child(footer_spacer)

	var download_btn := Button.new()
	download_btn.text = "Download & Install"
	download_btn.pressed.connect(_on_online_download_pressed)
	footer.add_child(download_btn)
	_online_download_button = download_btn

	var delete_confirm := ConfirmationDialog.new()
	delete_confirm.exclusive = false
	delete_confirm.title = "Delete Upload"
	delete_confirm.confirmed.connect(_on_online_delete_confirmed)
	add_child(delete_confirm)
	_online_delete_confirm_dialog = delete_confirm

	_update_online_admin_actions_state()

func _set_online_busy(busy: bool) -> void:
	_online_busy = busy
	if _online_refresh_button:
		_online_refresh_button.disabled = busy
	if _online_download_button:
		_online_download_button.disabled = busy
	if _online_sort:
		_online_sort.disabled = busy
	if busy:
		_set_online_status("Syncing...")
	_update_online_admin_actions_state()

func _set_online_status(text: String) -> void:
	if _online_status_label == null:
		return
	_online_status_label.text = text

func _capture_online_list_state() -> Dictionary:
	var state: Dictionary = {
		"selected_id": 0,
		"scroll": 0.0,
	}
	if _online_list == null:
		return state

	var selected_item: Dictionary = _get_selected_online_item()
	state["selected_id"] = int(selected_item.get("id", 0))

	var scrollbar: VScrollBar = _online_list.get_v_scroll_bar()
	if scrollbar != null:
		state["scroll"] = float(scrollbar.value)
	return state

func _restore_online_list_state(state: Dictionary) -> void:
	if _online_list == null:
		return
	var selected_id: int = int(state.get("selected_id", 0))
	if selected_id > 0:
		for i in range(_online_mods.size()):
			var item: Dictionary = _online_mods[i]
			if int(item.get("id", 0)) == selected_id:
				_online_list.select(i)
				break

	var scrollbar: VScrollBar = _online_list.get_v_scroll_bar()
	if scrollbar != null:
		var scroll_value: float = float(state.get("scroll", 0.0))
		scrollbar.value = clampf(scroll_value, scrollbar.min_value, scrollbar.max_value)

func _clone_online_mods_array(source: Array[Dictionary]) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for item in source:
		out.append(item.duplicate(true))
	return out

func _replace_online_mods(new_mods: Array[Dictionary], preserve_ui_state: bool = true) -> void:
	var state: Dictionary = {}
	if preserve_ui_state:
		state = _capture_online_list_state()
	_online_mods = _clone_online_mods_array(new_mods)
	_refresh_online_list_rows()
	if preserve_ui_state:
		_restore_online_list_state(state)

func _set_online_all_mods(new_mods: Array[Dictionary], preserve_ui_state: bool = true) -> void:
	_online_all_mods = _clone_online_mods_array(new_mods)
	if _online_is_admin:
		_rebuild_admin_online_groups()
		_apply_admin_online_view(preserve_ui_state)
	else:
		_online_list = _online_public_list
		_replace_online_mods(_online_all_mods, preserve_ui_state)

func _rebuild_admin_online_groups() -> void:
	_online_admin_pending_mods.clear()
	_online_admin_reviewed_mods.clear()
	for item in _online_all_mods:
		var status: int = int(item.get("status", 1))
		var has_pending_update: bool = typeof(item.get("pending_update")) == TYPE_DICTIONARY
		if status == 0 or has_pending_update:
			_online_admin_pending_mods.append(item.duplicate(true))
		else:
			_online_admin_reviewed_mods.append(item.duplicate(true))

func _apply_admin_online_view(preserve_ui_state: bool = true) -> void:
	if _online_admin_tabs == null:
		return

	var tab_index: int = _online_admin_tabs.current_tab
	if tab_index < 0:
		tab_index = 0

	if tab_index == 0:
		_online_list = _online_admin_pending_list
		_replace_online_mods(_online_admin_pending_mods, preserve_ui_state)
	else:
		_online_list = _online_admin_reviewed_list
		_replace_online_mods(_online_admin_reviewed_mods, preserve_ui_state)

func _on_online_admin_tab_changed(_tab: int) -> void:
	if not _online_is_admin:
		return
	_apply_admin_online_view(false)
	_update_online_admin_actions_state()

func _apply_cached_mods_for_current_sort() -> bool:
	var cache_key: String = _current_online_cache_key()
	var cached: Array[Dictionary] = _get_cached_online_mods(cache_key)
	if cached.is_empty() and not _online_is_admin:
		var sort_key: String = _current_sort_key()
		cached = get_cached_public_mods(sort_key)
		if not cached.is_empty():
			_set_cached_online_mods(cache_key, cached)

	if cached.is_empty():
		return false
	_set_online_all_mods(cached, false)
	_set_online_status("Loaded from cache")
	return true


func _update_online_admin_actions_state() -> void:
	var can_show: bool = _online_is_admin
	if _online_admin_approve_button:
		_online_admin_approve_button.visible = can_show
	if _online_admin_reject_button:
		_online_admin_reject_button.visible = can_show

	var selected_item: Dictionary = _get_selected_online_item()
	var can_delete: bool = (not _online_busy) and _can_delete_online_item(selected_item)
	if _online_delete_button:
		_online_delete_button.disabled = not can_delete

	if not can_show:
		if _online_admin_approve_button:
			_online_admin_approve_button.disabled = true
		if _online_admin_reject_button:
			_online_admin_reject_button.disabled = true
		return

	var can_review: bool = (not _online_busy) and _is_online_item_reviewable(selected_item)
	if _online_admin_approve_button:
		_online_admin_approve_button.disabled = not can_review
	if _online_admin_reject_button:
		_online_admin_reject_button.disabled = not can_review

func _get_selected_online_item() -> Dictionary:
	if _online_list == null:
		return {}
	var selected: PackedInt32Array = _online_list.get_selected_items()
	if selected.is_empty():
		return {}
	var index: int = int(selected[0])
	if index < 0 or index >= _online_mods.size():
		return {}
	return _online_mods[index]

func _on_online_item_selected(_index: int) -> void:
	_update_online_admin_actions_state()

func _is_online_item_reviewable(item: Dictionary) -> bool:
	if item.is_empty():
		return false
	var status: int = int(item.get("status", 1))
	if status == 0:
		return true
	return typeof(item.get("pending_update")) == TYPE_DICTIONARY

func _is_online_item_owned_by_current_user(item: Dictionary) -> bool:
	if item.is_empty():
		return false
	if bool(item.get("__mine", false)):
		return true
	var item_user_id: int = int(item.get("user_id", 0))
	var profile_id: int = 0
	if has_node("/root/AuthManager"):
		profile_id = int(AuthManager.profile.get("id", 0))
	return item_user_id > 0 and profile_id > 0 and item_user_id == profile_id

func _can_delete_online_item(item: Dictionary) -> bool:
	if item.is_empty():
		return false
	if _online_is_admin:
		return true
	return _is_online_item_owned_by_current_user(item)

func _on_online_approve_pressed() -> void:
	if not _online_is_admin:
		return
	var item: Dictionary = _get_selected_online_item()
	if not _is_online_item_reviewable(item):
		_show_message("Notice", "Please select a pending mod or pending update.")
		return
	await _review_online_mod(item, true)

func _on_online_reject_pressed() -> void:
	if not _online_is_admin:
		return
	var item: Dictionary = _get_selected_online_item()
	if not _is_online_item_reviewable(item):
		_show_message("Notice", "Please select a pending mod or pending update.")
		return
	await _review_online_mod(item, false)

func _review_online_mod(item: Dictionary, approve: bool) -> void:
	var mod_id: int = int(item.get("id", 0))
	if mod_id <= 0:
		_show_message("Failed", "Invalid mod id.")
		return

	var has_pending_update: bool = typeof(item.get("pending_update")) == TYPE_DICTIONARY
	var next_status: int = 1 if approve else 3
	var review_note: String = "审核通过" if approve else "审核拒绝"
	var payload: Dictionary = {
		"status": next_status,
		"review_note": review_note,
	}
	if has_pending_update:
		var pending: Dictionary = item.get("pending_update", {}) as Dictionary
		var pending_id: int = int(pending.get("id", 0))
		if pending_id > 0:
			payload["pending_update_id"] = pending_id

	_set_online_busy(true)
	var path: String = PLATFORM_ADMIN_MOD_REVIEW_PATH_FORMAT % mod_id
	var response: Dictionary = await _api_post_json_with_auth(path, payload)
	_set_online_busy(false)

	if bool(response.get("ok", false)):
		_show_message("Done", "Review submitted.")
		await _load_online_mods()
	else:
		_show_message("Failed", _extract_api_error(response))

func _on_online_delete_pressed() -> void:
	if _online_busy:
		return
	var item: Dictionary = _get_selected_online_item()
	if item.is_empty():
		_show_message("Notice", "Please select one online mod first.")
		return
	if not _can_delete_online_item(item):
		_show_message("Notice", "You can only delete your own uploads.")
		return
	_online_pending_delete_item = item.duplicate(true)
	var title: String = str(item.get("mod_name", ""))
	var mod_id: int = int(item.get("id", 0))
	if _online_delete_confirm_dialog:
		_online_delete_confirm_dialog.dialog_text = "Delete online mod \"%s\" (ID:%d)?\n\nThis action cannot be undone." % [title, mod_id]
		_online_delete_confirm_dialog.popup_centered()
	else:
		await _delete_online_mod(_online_pending_delete_item)

func _on_online_delete_confirmed() -> void:
	await _delete_online_mod(_online_pending_delete_item)

func _delete_online_mod(item: Dictionary) -> void:
	if item.is_empty():
		return
	var mod_id: int = int(item.get("id", 0))
	if mod_id <= 0:
		_show_message("Failed", "Invalid mod id.")
		return
	if not _can_delete_online_item(item):
		_show_message("Failed", "Permission denied for this mod.")
		return

	var delete_paths: Array[String] = []
	if _online_is_admin:
		delete_paths.append(PLATFORM_ADMIN_MOD_DELETE_PATH_FORMAT % mod_id)
	delete_paths.append(PLATFORM_MOD_DELETE_PATH_FORMAT % mod_id)

	_set_online_busy(true)
	var response: Dictionary = {}
	for path in delete_paths:
		response = await _api_delete_with_auth(path)
		if bool(response.get("ok", false)):
			break
		if not _is_api_path_not_found(response):
			break
	_set_online_busy(false)
	_online_pending_delete_item.clear()

	if bool(response.get("ok", false)):
		_show_message("Done", "Mod deleted.")
		await _load_online_mods()
	elif _is_api_path_not_found(response):
		_show_message("Failed", "Server API path not found. Please deploy the latest auth worker routes.")
	else:
		_show_message("Failed", _extract_api_error(response))

func _on_online_refresh_pressed() -> void:
	if _online_busy:
		return
	await _load_online_mods()

func _on_online_download_pressed() -> void:
	if _online_busy or _online_list == null:
		return

	var selected: PackedInt32Array = _online_list.get_selected_items()
	if selected.is_empty():
		_show_message("Notice", "Please select one online mod first.")
		return

	var index: int = int(selected[0])
	if index < 0 or index >= _online_mods.size():
		return

	var item: Dictionary = _online_mods[index]
	var mod_id: int = int(item.get("id", 0))
	var mod_name: String = str(item.get("mod_name", ""))
	var status: int = int(item.get("status", 1))
	if mod_id <= 0:
		_show_message("Notice", "Mod data is invalid (missing id).")
		return
	if status != 1 and not _online_is_admin:
		_show_message("Notice", "This mod is not published yet and cannot be downloaded.")
		return

	_set_online_busy(true)
	var result: Dictionary = await _download_online_mod(mod_id)
	_set_online_busy(false)

	if bool(result.get("ok", false)):
		_mods_dirty = true

		_show_message("Done", "Installed online mod: %s" % (mod_name if not mod_name.is_empty() else str(mod_id)))
	else:
		_show_message("Failed", str(result.get("message", "Unknown error")))

func _current_sort_key() -> String:
	if _online_sort == null:
		return "new"
	match _online_sort.get_selected_id():
		1:
			return "downloads"
		2:
			return "rating"
		_:
			return "new"

func _load_online_mods() -> void:
	if _online_list == null:
		return
	if _online_busy:
		return

	_set_online_busy(true)
	var response: Dictionary = await _request_online_mods()
	_set_online_busy(false)

	if not bool(response.get("ok", false)):
		if _online_mods.is_empty():
			_set_online_status("Sync failed")
			_show_message("Load Failed", _extract_api_error(response))
		else:
			_set_online_status("Sync failed, showing cached data")
		_update_online_admin_actions_state()
		return

	var new_mods_any: Variant = response.get("mods", [])
	var new_mods: Array[Dictionary] = []
	if typeof(new_mods_any) == TYPE_ARRAY:
		for item_any in new_mods_any:
			if typeof(item_any) != TYPE_DICTIONARY:
				continue
			new_mods.append(item_any as Dictionary)

	_set_online_all_mods(new_mods, true)
	var cache_key: String = _current_online_cache_key()
	_set_cached_online_mods(cache_key, _online_all_mods)
	if not _online_is_admin:
		set_cached_public_mods(_current_sort_key(), _online_all_mods)
	_set_online_status("Updated just now")
	_update_online_admin_actions_state()

func _request_online_mods() -> Dictionary:
	var admin_mods: Array[Dictionary] = []
	if _online_is_admin:
		var admin_path: String = "%s?page=1&limit=50&sort=%s" % [PLATFORM_ADMIN_MODS_PATH, _current_sort_key()]
		var admin_response: Dictionary = await _api_get_json_with_auth(admin_path)
		if bool(admin_response.get("ok", false)):
			admin_mods = _extract_mods_from_response(admin_response)
		elif not _is_api_path_not_found(admin_response):
			return admin_response

	var path: String = "%s?page=1&limit=50&sort=%s" % [PLATFORM_MODS_LIST_PATH, _current_sort_key()]
	var response: Dictionary = await _api_get_json_with_auth(path)
	if not bool(response.get("ok", false)):
		if _online_is_admin and not admin_mods.is_empty():
			return {"ok": true, "mods": admin_mods}
		return response

	var next_mods: Array[Dictionary] = []
	var existing_ids: Dictionary = {}
	var id_to_index: Dictionary = {}
	var my_mod_ids: Dictionary = {}
	var public_mods: Array[Dictionary] = _extract_mods_from_response(response)
	for item in public_mods:
		var row: Dictionary = item.duplicate(true)
		next_mods.append(row)
		var mod_id: int = int(row.get("id", 0))
		if mod_id > 0:
			existing_ids[mod_id] = true
			id_to_index[mod_id] = next_mods.size() - 1

	if _online_is_admin and not admin_mods.is_empty():
		for admin_item in admin_mods:
			var admin_copy: Dictionary = admin_item.duplicate(true)
			var admin_id: int = int(admin_copy.get("id", 0))
			if admin_id > 0 and id_to_index.has(admin_id):
				var idx: int = int(id_to_index[admin_id])
				var existing: Dictionary = next_mods[idx]
				if bool(existing.get("__mine", false)):
					admin_copy["__mine"] = true
				next_mods[idx] = admin_copy
				continue
			next_mods.append(admin_copy)
			if admin_id > 0:
				existing_ids[admin_id] = true
				id_to_index[admin_id] = next_mods.size() - 1

	# Also append my own unpublished uploads so uploader can see review status.
	var my_response: Dictionary = await _api_get_json_with_auth("%s?page=1&limit=50" % PLATFORM_MY_MODS_PATH)
	if bool(my_response.get("ok", false)):
		var my_mods: Array[Dictionary] = _extract_mods_from_response(my_response)
		for mine in my_mods:
			var mine_id: int = int(mine.get("id", 0))
			if mine_id > 0:
				my_mod_ids[mine_id] = true
			if mine_id > 0 and existing_ids.has(mine_id):
				continue
			var mine_copy: Dictionary = mine.duplicate(true)
			mine_copy["__mine"] = true
			next_mods.append(mine_copy)
			if mine_id > 0:
				existing_ids[mine_id] = true
				id_to_index[mine_id] = next_mods.size() - 1

	if not my_mod_ids.is_empty():
		for i in range(next_mods.size()):
			var row: Dictionary = next_mods[i]
			var row_id: int = int(row.get("id", 0))
			if row_id > 0 and my_mod_ids.has(row_id):
				row["__mine"] = true
				next_mods[i] = row

	return {"ok": true, "mods": next_mods}

func _extract_mods_from_response(response: Dictionary) -> Array[Dictionary]:
	return _extract_mods_from_parsed_payload(response.get("data"))

func _refresh_online_list_rows() -> void:
	if _online_list == null:
		return
	_online_list.clear()
	for item in _online_mods:
		var title: String = str(item.get("mod_name", "untitled"))
		var author: String = str(item.get("author_name", ""))
		var version: String = str(item.get("version", ""))
		var downloads: int = int(item.get("download_count", 0))
		var status: int = int(item.get("status", 1))
		var is_mine: bool = bool(item.get("__mine", false))
		var has_pending_update: bool = typeof(item.get("pending_update")) == TYPE_DICTIONARY
		var prefix: String = ""

		if _online_is_admin:
			if status == 0:
				prefix = "[Review New] "
			elif has_pending_update:
				prefix = "[Review Update] "
		elif is_mine and status != 1:
			prefix = "[Mine %s] " % _status_text(status)
		elif status != 1:
			prefix = "[%s] " % _status_text(status)

		var row := "%s%s  v%s  |  %s  |  DL:%d" % [prefix, title, version, author, downloads]
		_online_list.add_item(row)

func _status_text(status: int) -> String:
	match status:
		0:
			return "Pending"
		1:
			return "Published"
		2:
			return "Taken Down"
		3:
			return "Rejected"
		_:
			return "Status %d" % status

func _download_online_mod(mod_id: int) -> Dictionary:
	if not await AuthManager.ensure_valid_token():
		return {"ok": false, "message": "Please login first."}

	var path := PLATFORM_MOD_DOWNLOAD_PATH_FORMAT % mod_id
	var response: Dictionary = await _api_get_binary_with_auth(path)
	if not bool(response.get("ok", false)):
		return {"ok": false, "message": _extract_api_error(response)}

	var bytes: PackedByteArray = response.get("bytes", PackedByteArray())
	if bytes.is_empty():
		return {"ok": false, "message": "Server returned empty file."}

	var user_dir: DirAccess = DirAccess.open("user://")
	if user_dir == null:
		return {"ok": false, "message": "Cannot access user directory."}
	if not user_dir.dir_exists("__mod_download_cache"):
		var mk_err: int = user_dir.make_dir("__mod_download_cache")
		if mk_err != OK and not user_dir.dir_exists("__mod_download_cache"):
			return {"ok": false, "message": "Cannot create cache directory."}

	var zip_path := "user://__mod_download_cache/mod_%d.zip" % mod_id
	var out: FileAccess = FileAccess.open(zip_path, FileAccess.WRITE)
	if out == null:
		return {"ok": false, "message": "Cannot write downloaded file."}
	out.store_buffer(bytes)
	out.close()

	var install_result: Dictionary = _import_zip(zip_path)
	var abs_zip: String = ProjectSettings.globalize_path(zip_path)
	if FileAccess.file_exists(zip_path):
		DirAccess.remove_absolute(abs_zip)

	if not bool(install_result.get("ok", false)):
		return {"ok": false, "message": str(install_result.get("message", "Install failed"))}

	return {"ok": true}

func _api_get_json_with_auth(path: String) -> Dictionary:
	if _online_http == null:
		return {"ok": false, "status": 0, "error": "http_unavailable"}

	if not await AuthManager.ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}

	var headers := PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
	var result: Dictionary = await _http_get(path, headers)
	if int(result.get("status", 0)) == 401:
		var refreshed: Dictionary = await AuthManager.refresh_access_token()
		if bool(refreshed.get("ok", false)):
			headers = PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
			result = await _http_get(path, headers)
	return result

func _api_get_binary_with_auth(path: String) -> Dictionary:
	if _online_http == null:
		return {"ok": false, "status": 0, "error": "http_unavailable"}

	if not await AuthManager.ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}

	var headers := PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
	var result: Dictionary = await _http_get_binary(path, headers)
	if int(result.get("status", 0)) == 401:
		var refreshed: Dictionary = await AuthManager.refresh_access_token()
		if bool(refreshed.get("ok", false)):
			headers = PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
			result = await _http_get_binary(path, headers)
	return result

func _api_post_json_with_auth(path: String, payload: Dictionary) -> Dictionary:
	if _online_http == null:
		return {"ok": false, "status": 0, "error": "http_unavailable"}

	if not await AuthManager.ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}

	var headers := PackedStringArray([
		"Authorization: Bearer %s" % AuthManager.access_token,
		"Content-Type: application/json",
	])
	var result: Dictionary = await _http_json_request(path, HTTPClient.METHOD_POST, headers, JSON.stringify(payload))
	if int(result.get("status", 0)) == 401:
		var refreshed: Dictionary = await AuthManager.refresh_access_token()
		if bool(refreshed.get("ok", false)):
			headers = PackedStringArray([
				"Authorization: Bearer %s" % AuthManager.access_token,
				"Content-Type: application/json",
			])
			result = await _http_json_request(path, HTTPClient.METHOD_POST, headers, JSON.stringify(payload))
	return result

func _api_delete_with_auth(path: String) -> Dictionary:
	if _online_http == null:
		return {"ok": false, "status": 0, "error": "http_unavailable"}

	if not await AuthManager.ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}

	var headers := PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
	var result: Dictionary = await _http_json_request(path, HTTPClient.METHOD_DELETE, headers, "")
	if int(result.get("status", 0)) == 401:
		var refreshed: Dictionary = await AuthManager.refresh_access_token()
		if bool(refreshed.get("ok", false)):
			headers = PackedStringArray(["Authorization: Bearer %s" % AuthManager.access_token])
			result = await _http_json_request(path, HTTPClient.METHOD_DELETE, headers, "")
	return result

func _is_api_path_not_found(response: Dictionary) -> bool:
	if int(response.get("status", 0)) != 404:
		return false
	var msg: String = _extract_api_error(response).to_lower()
	return msg.find("api path not found") != -1

func _http_json_request(path: String, method: int, headers: PackedStringArray, body: String = "") -> Dictionary:
	var url := AuthManager.BASE_URL + path
	var err: int = _online_http.request(url, headers, method, body)
	if err != OK:
		return {"ok": false, "status": 0, "error": "request_failed_%s" % err, "bytes": PackedByteArray()}

	var completed: Array = await _online_http.request_completed
	var result_code: int = int(completed[0])
	var status_code: int = int(completed[1])
	var response_body: PackedByteArray = completed[3]
	var raw: String = response_body.get_string_from_utf8()
	var parsed: Variant = _try_parse_json(raw)
	var ok: bool = (result_code == HTTPRequest.RESULT_SUCCESS) and status_code >= 200 and status_code < 300

	return {
		"ok": ok,
		"status": status_code,
		"result": result_code,
		"data": parsed,
		"raw": raw,
		"bytes": response_body,
	}

func _http_get(path: String, headers: PackedStringArray) -> Dictionary:
	var url := AuthManager.BASE_URL + path
	var err: int = _online_http.request(url, headers, HTTPClient.METHOD_GET)
	if err != OK:
		return {"ok": false, "status": 0, "error": "request_failed_%s" % err, "bytes": PackedByteArray()}

	var completed: Array = await _online_http.request_completed
	var result_code: int = int(completed[0])
	var status_code: int = int(completed[1])
	var body: PackedByteArray = completed[3]
	var raw: String = body.get_string_from_utf8()
	var parsed: Variant = _try_parse_json(raw)
	var ok: bool = (result_code == HTTPRequest.RESULT_SUCCESS) and status_code >= 200 and status_code < 300

	return {
		"ok": ok,
		"status": status_code,
		"result": result_code,
		"data": parsed,
		"raw": raw,
		"bytes": body,
	}

func _http_get_binary(path: String, headers: PackedStringArray) -> Dictionary:
	var url := AuthManager.BASE_URL + path
	var err: int = _online_http.request(url, headers, HTTPClient.METHOD_GET)
	if err != OK:
		return {"ok": false, "status": 0, "error": "request_failed_%s" % err, "bytes": PackedByteArray()}

	var completed: Array = await _online_http.request_completed
	var result_code: int = int(completed[0])
	var status_code: int = int(completed[1])
	var body: PackedByteArray = completed[3]
	var raw: String = body.get_string_from_utf8()
	var parsed: Variant = _try_parse_json(raw)
	var ok: bool = (result_code == HTTPRequest.RESULT_SUCCESS) and status_code >= 200 and status_code < 300

	return {
		"ok": ok,
		"status": status_code,
		"result": result_code,
		"data": parsed,
		"raw": raw,
		"bytes": body,
	}

func _try_parse_json(raw: String) -> Variant:
	var trimmed: String = raw.strip_edges()
	if trimmed.is_empty():
		return null
	var first_char: String = trimmed.substr(0, 1)
	if first_char != "{" and first_char != "[":
		return null
	return JSON.parse_string(trimmed)

func _extract_api_error(response: Dictionary) -> String:
	if response.has("error"):
		return str(response["error"])
	var parsed: Variant = response.get("data")
	if typeof(parsed) == TYPE_DICTIONARY:
		var root: Dictionary = parsed
		if root.has("error"):
			return str(root["error"])
		if root.has("message") and str(root["message"]).strip_edges() != "":
			return str(root["message"])
		if typeof(root.get("data")) == TYPE_DICTIONARY:
			var payload: Dictionary = root["data"]
			if payload.has("error"):
				return str(payload["error"])
			if payload.has("message") and str(payload["message"]).strip_edges() != "":
				return str(payload["message"])
	return str(response.get("raw", "request_failed"))

func _import_zip(zip_path: String) -> Dictionary:
	if not FileAccess.file_exists(zip_path):
		return {"ok": false, "message": "找不到 ZIP 文件。"}

	var zip: ZIPReader = ZIPReader.new()
	var err_open: int = zip.open(zip_path)
	if err_open != OK:
		return {"ok": false, "message": "无法打开 ZIP（错误码 %d）。" % err_open}

	var entries: PackedStringArray = zip.get_files()
	if entries.is_empty():
		return {"ok": false, "message": "ZIP 内没有任何文件。"}

	var config_entry: String = ""
	for entry in entries:
		var entry_norm: String = entry.replace("\\", "/")
		if entry_norm.ends_with("/") or entry_norm.is_empty():
			continue
		if entry_norm.get_file() == MOD_CONFIG_FILENAME:
			if not config_entry.is_empty():
				return {"ok": false, "message": "ZIP ????? %s???????????" % MOD_CONFIG_FILENAME}
			config_entry = entry_norm

	if config_entry.is_empty():
		return {"ok": false, "message": "ZIP 内缺少 %s。" % MOD_CONFIG_FILENAME}

	# 仅允许：mod_config.json 或 <folder>/mod_config.json
	var config_parts: PackedStringArray = config_entry.split("/", false)
	if config_parts.size() > 2:
		return {"ok": false, "message": "%s 必须位于压缩包根目录或根目录下唯一文件夹中。" % MOD_CONFIG_FILENAME}

	var top_folder: String = ""
	if config_parts.size() == 2:
		top_folder = config_parts[0]

	var raw_folder_name: String = top_folder if not top_folder.is_empty() else zip_path.get_file().get_basename()
	var folder_name: String = _sanitize_folder_name(raw_folder_name)
	if folder_name.is_empty():
		var timestamp: int = int(Time.get_unix_time_from_system())
		folder_name = "mod_%d" % timestamp

	var dest_mod_path: String = MODS_FOLDER_PATH + "/" + folder_name
	if _dir_exists(dest_mod_path):
		return {"ok": false, "message": "已存在同名模组文件夹：%s\n请先删除或更换 ZIP 文件名后重试。" % folder_name}

	# 安全校验：禁止路径穿越
	for entry in entries:
		if not _is_safe_zip_entry(entry):
			return {"ok": false, "message": "ZIP 内包含非法路径，已拒绝导入。"}

	var user_dir: DirAccess = DirAccess.open("user://")
	if not user_dir:
		return {"ok": false, "message": "无法访问 user:// 目录。"}

	var err_mkdir: int = user_dir.make_dir_recursive("mods/" + folder_name)
	if err_mkdir != OK:
		return {"ok": false, "message": "无法创建目标目录（错误码 %d）。" % err_mkdir}

	var extracted_any: bool = false
	var prefix: String = top_folder + "/" if not top_folder.is_empty() else ""

	for entry in entries:
		var entry_norm: String = entry.replace("\\", "/")
		if entry_norm.is_empty():
			continue
		if not prefix.is_empty() and not entry_norm.begins_with(prefix):
			continue

		var rel: String = entry_norm
		if not prefix.is_empty():
			rel = entry_norm.substr(prefix.length())

		if rel.is_empty():
			continue

		var dest_path: String = dest_mod_path + "/" + rel
		var base_dir: String = dest_path.get_base_dir()
		var rel_dir: String = base_dir.replace("user://", "")
		if not rel_dir.is_empty():
			var err_dir: int = user_dir.make_dir_recursive(rel_dir)
			if err_dir != OK:
				_delete_directory_recursive(dest_mod_path)
				return {"ok": false, "message": "?????????? %d??" % err_dir}

		if entry_norm.ends_with("/"):
			continue

		var data: PackedByteArray = zip.read_file(entry)
		var out: FileAccess = FileAccess.open(dest_path, FileAccess.WRITE)
		if not out:
			_delete_directory_recursive(dest_mod_path)
			return {"ok": false, "message": "???????%s" % rel}
		out.store_buffer(data)
		out.close()
		extracted_any = true


	if not extracted_any:
		_delete_directory_recursive(dest_mod_path)
		return {"ok": false, "message": "没有可导入的文件。"}

	var dest_config_path: String = dest_mod_path + "/" + MOD_CONFIG_FILENAME
	var cfg_check: Dictionary = _try_load_mod_config(dest_config_path)
	if not bool(cfg_check.get("ok", false)):
		_delete_directory_recursive(dest_mod_path)
		return {"ok": false, "message": "导入后的配置文件无效：%s" % str(cfg_check.get("error", ""))}

	_repair_story_scene_script_paths(dest_mod_path, cfg_check.get("data", {}) as Dictionary)
	return {"ok": true, "message": "已导入到：%s" % dest_mod_path}

func _repair_story_scene_script_paths(mod_root: String, mod_config: Dictionary) -> void:
	var episodes_any: Variant = mod_config.get("episodes", {})
	if typeof(episodes_any) != TYPE_DICTIONARY:
		return

	var episodes: Dictionary = episodes_any as Dictionary
	for key_any in episodes.keys():
		var scene_rel: String = str(episodes.get(key_any, "")).strip_edges().replace("\\", "/")
		if scene_rel.is_empty() or not _is_safe_relative_mod_path(scene_rel):
			continue
		var scene_abs: String = mod_root + "/" + scene_rel
		if not FileAccess.file_exists(scene_abs):
			continue
		var expected_script_rel: String = scene_rel.get_file().get_basename() + ".gd"
		if expected_script_rel.is_empty():
			continue
		_rewrite_story_scene_script_path(scene_abs, expected_script_rel)

func _is_safe_relative_mod_path(path: String) -> bool:
	var normalized: String = path.strip_edges().replace("\\", "/")
	if normalized.is_empty():
		return false
	if normalized.begins_with("/") or normalized.find(":") != -1:
		return false
	var parts: PackedStringArray = normalized.split("/", false)
	for part in parts:
		if part.is_empty() or part == "..":
			return false
	return true

func _rewrite_story_scene_script_path(scene_path: String, expected_script_rel: String) -> void:
	var file: FileAccess = FileAccess.open(scene_path, FileAccess.READ)
	if file == null:
		return
	var text: String = file.get_as_text()
	file.close()

	var marker := "[ext_resource type=\"Script\""
	var marker_pos: int = text.find(marker)
	if marker_pos == -1:
		return

	var path_key := "path=\""
	var path_pos: int = text.find(path_key, marker_pos)
	if path_pos == -1:
		return

	var path_start: int = path_pos + path_key.length()
	var path_end: int = text.find("\"", path_start)
	if path_end == -1:
		return

	var current_path: String = text.substr(path_start, path_end - path_start)
	if current_path == expected_script_rel:
		return

	var rewritten: String = text.substr(0, path_start) + expected_script_rel + text.substr(path_end)
	var out: FileAccess = FileAccess.open(scene_path, FileAccess.WRITE)
	if out == null:
		return
	out.store_string(rewritten)
	out.close()

func _is_safe_zip_entry(entry: String) -> bool:
	var normalized: String = entry.strip_edges().replace("\\", "/")
	if normalized.is_empty():
		return false
	if normalized.begins_with("/") or normalized.find(":") != -1:
		return false
	var parts: PackedStringArray = normalized.split("/", false)
	for part in parts:
		if part.is_empty() or part == "..":
			return false
	return true

func _sanitize_folder_name(raw_name: String) -> String:
	var stripped: String = raw_name.strip_edges()
	if stripped.is_empty():
		return ""

	var out := PackedStringArray()
	for i in range(stripped.length()):
		var ch: String = stripped.substr(i, 1)
		var code: int = ch.unicode_at(0)
		var is_digit: bool = code >= 48 and code <= 57
		var is_upper: bool = code >= 65 and code <= 90
		var is_lower: bool = code >= 97 and code <= 122
		if is_digit or is_upper or is_lower or ch == "_" or ch == "-":
			out.append(ch)
		else:
			out.append("_")

	var joined: String = "".join(out)
	while joined.find("__") != -1:
		joined = joined.replace("__", "_")
	joined = joined.strip_edges()
	joined = joined.trim_prefix("_").trim_suffix("_")

	if joined.length() > 32:
		joined = joined.substr(0, 32)

	return joined

func _dir_exists(path: String) -> bool:
	var abs_path: String = ProjectSettings.globalize_path(path)
	return DirAccess.open(abs_path) != null

func _delete_directory_recursive(path: String) -> int:
	var absolute_path: String = ProjectSettings.globalize_path(path)
	var dir: DirAccess = DirAccess.open(absolute_path)
	if not dir:
		return ERR_CANT_OPEN

	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if file_name == "." or file_name == "..":
			file_name = dir.get_next()
			continue

		var file_path: String = absolute_path + "/" + file_name
		if dir.current_is_dir():
			var err_sub: int = _delete_directory_recursive(file_path)
			if err_sub != OK:
				dir.list_dir_end()
				return err_sub
		else:
			var err_remove: int = DirAccess.remove_absolute(file_path)
			if err_remove != OK:
				dir.list_dir_end()
				return err_remove
		file_name = dir.get_next()
	dir.list_dir_end()

	return DirAccess.remove_absolute(absolute_path)

func _try_load_mod_config(config_path: String) -> Dictionary:
	if not FileAccess.file_exists(config_path):
		return {"ok": false, "data": {}, "error": "缺少 %s" % MOD_CONFIG_FILENAME}

	var file: FileAccess = FileAccess.open(config_path, FileAccess.READ)
	if not file:
		return {"ok": false, "data": {}, "error": "无法读取配置文件"}

	var json_string: String = file.get_as_text()
	file.close()

	var json: JSON = JSON.new()
	var parse_err: int = json.parse(json_string)
	if parse_err != OK:
		return {"ok": false, "data": {}, "error": "JSON 解析失败"}

	if typeof(json.data) != TYPE_DICTIONARY:
		return {"ok": false, "data": {}, "error": "配置内容不是对象(JSON Dictionary)"}

	return {"ok": true, "data": json.data as Dictionary, "error": ""}

