extends Control
## 故事列表界面控制器
## 管理故事列表的显示、动画和交互功能

#region 节点引用
@onready var move_part := $MovePart
@onready var story_list_bottom_ui := $StoryListBottomui
@onready var story_list := $StoryList
@onready var story_list_container := $StoryList/StoryListContainer
@onready var episode_name_label := $MovePart/EpisodeName
@onready var story_list_connect := $StoryListConnect  # 新增：连接节点引用
#endregion

#region 导出变量
@export_group("动画设置")
@export var animation_duration := 0.5
@export var exit_animation_duration := 0.4  # 新增：退出动画时长
@export var move_offset := 100.0
@export var bottom_offset := 100.0
@export var item_animation_delay := 0.05  # 每个item的动画延迟
@export var item_slide_distance := 800.0   # item滑入的距离
@export var item_exit_delay := 0.03  # 新增：退出动画中每个item的延迟

@export_group("滚动设置")
@export var scroll_speed := 50.0
@export var drag_sensitivity := 1.0
@export var inertia_friction := 0.88
@export var inertia_multiplier := 8.0
@export var min_velocity := 0.5
@export var max_velocity := 30.0

@export_group("资源设置")
@export var button_textures: Dictionary = {
	"normal": preload("res://assets/gui/main_menu/story_btn_idle.png"),
	"hover": preload("res://assets/gui/main_menu/story_btn_hover.png"),
	"disabled": preload("res://assets/gui/main_menu/story_btn_insensitive.png")
}
@export var label_settings: LabelSettings = preload("res://scripts/set/list_font.tres")
#endregion

#region 常量
const STORY_CONFIG_PATH := "res://scripts/set/story_config.json"
const DEFAULT_LANGUAGE_CODE := "zh"
const SUPPORTED_LANGUAGE_CODES := [
	"zh", "tc", "en", "jp", "kr", "de", "es", "fr", "it", "pt", "ru", "th", "vi"
]
const VELOCITY_SAMPLE_SIZE := 5
const SMOOTH_SCROLL_TIME := 0.15
const PHYSICS_DELTA_MULTIPLIER := 60.0
#endregion

#region 信号
signal exit_animation_completed  # 新增：退出动画完成信号
signal exit_animation_started  # 新增：退出动画开始信号
#endregion

#region 变量
var current_story_id := ""
var story_config: Dictionary = {}
var list_items: Array[MarginContainer] = []  # 存储所有列表项的引用
var is_exiting := false  # 新增：标记是否正在退出
var mobile_pressed_visual: TextureRect = null
var mobile_pressed_episode_data: Dictionary = {}
var mobile_pressed_touch_index := -1
var mobile_press_start_pos := Vector2.ZERO
var mobile_press_moved := false
var mobile_press_uses_mouse := false

# 滚动状态
var scroll_state := {
	"is_dragging": false,
	"last_pos": Vector2.ZERO,
	"velocity": 0.0,
	"velocity_samples": [],
	"drag_start_pos": Vector2.ZERO,  # 记录拖拽起始位置
	"has_moved": false  # 标记是否发生了实际移动
}

# 拖拽阈值（像素）- 超过此距离才算真正的拖拽
const DRAG_THRESHOLD := 5.0
#endregion

#region 生命周期
func _ready() -> void:
	_load_story_config()
	_setup_scroll_container()
	_setup_initial_positions()
	_animate_entrance()

func _physics_process(delta: float) -> void:
	_process_inertia_scroll(delta)

func _input(event: InputEvent) -> void:
	# 检查设置界面是否打开
	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if main_menu and main_menu.has_method("is_settings_open") and main_menu.is_settings_open():
		if scroll_state.is_dragging:
			_end_drag()
		_clear_mobile_press()
		return

	if _is_mobile_platform():
		_handle_mobile_input(event, main_menu)
		return

	# 处理鼠标左键松开事件（无论鼠标在哪里）
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and main_menu.story_scene_layer.get_child_count() == 0:
		if scroll_state.is_dragging:
			_end_drag()
			# 如果发生了拖拽，阻止按钮点击
			if scroll_state.velocity_samples.size() > 0:
				get_viewport().set_input_as_handled()
			return

	# 检查事件是否在滚动区域内
	if story_list.get_global_rect().has_point(get_global_mouse_position()) and main_menu.story_scene_layer.get_child_count() == 0:
		# 只处理滚动相关的事件，不处理按钮点击
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				_handle_mouse_button(event)
				get_viewport().set_input_as_handled()
			elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				# 处理拖拽开始
				_start_drag(event.position)
		elif event is InputEventMouseMotion and scroll_state.is_dragging:
			_handle_drag_motion(event.position)
			# 拖拽时标记为已处理，防止其他控件响应
			get_viewport().set_input_as_handled()
#endregion

#region 初始化
## 加载故事配置文件
func _load_story_config() -> void:
	var file := FileAccess.open(STORY_CONFIG_PATH, FileAccess.READ)
	if not file:
		push_error("无法加载故事配置文件: " + STORY_CONFIG_PATH)
		return
	
	var json_text := file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var parse_result := json.parse(json_text)
	if parse_result != OK:
		push_error("解析故事配置失败: " + json.get_error_message())
		return

	story_config.clear()
	for story_id_variant in json.data.keys():
		var story_id := str(story_id_variant)
		var raw_story: Dictionary = json.data[story_id_variant]
		story_config[story_id] = {
			"title": str(raw_story.get("title", "")),
			"title_i18n": _normalize_i18n_map(raw_story.get("title_i18n", {})),
			"episodes": _normalize_episode_collection(raw_story.get("episodes", {}))
		}

func _normalize_episode_collection(raw_episodes: Variant) -> Array[Dictionary]:
	var normalized_episodes: Array[Dictionary] = []
	if typeof(raw_episodes) != TYPE_DICTIONARY:
		return normalized_episodes

	var episodes: Dictionary = raw_episodes
	for display_name_variant in episodes.keys():
		var episode_data := _normalize_episode_data(str(display_name_variant), episodes[display_name_variant])
		if episode_data.is_empty():
			push_warning("跳过无效剧情配置: " + str(display_name_variant))
			continue
		normalized_episodes.append(episode_data)

	return normalized_episodes

func _normalize_episode_data(display_name: String, raw_episode: Variant) -> Dictionary:
	var scene_path := ""
	var script_paths: Dictionary = {}
	var name_i18n: Dictionary = {}

	if typeof(raw_episode) == TYPE_STRING:
		scene_path = str(raw_episode).strip_edges()
	elif typeof(raw_episode) == TYPE_DICTIONARY:
		var episode_dict: Dictionary = raw_episode
		scene_path = str(episode_dict.get("scene", "")).strip_edges()
		name_i18n = _normalize_i18n_map(episode_dict.get("name_i18n", {}))
		script_paths = _normalize_script_paths(episode_dict.get("scripts", {}))

	if scene_path.is_empty():
		return {}

	if script_paths.is_empty():
		script_paths = _derive_script_paths(scene_path)

	return {
		"display_name": display_name,
		"name_i18n": name_i18n,
		"scene_path": scene_path,
		"script_paths": script_paths
	}

func _normalize_i18n_map(raw_i18n: Variant) -> Dictionary:
	var normalized_i18n: Dictionary = {}
	if typeof(raw_i18n) != TYPE_DICTIONARY:
		return normalized_i18n

	var i18n_map: Dictionary = raw_i18n
	for language_code_variant in i18n_map.keys():
		var language_code := _normalize_language_code(str(language_code_variant))
		var localized_text := str(i18n_map[language_code_variant]).strip_edges()
		if language_code.is_empty() or localized_text.is_empty():
			continue
		normalized_i18n[language_code] = localized_text

	return normalized_i18n

func _normalize_script_paths(raw_script_paths: Variant) -> Dictionary:
	var normalized_paths: Dictionary = {}
	if typeof(raw_script_paths) != TYPE_DICTIONARY:
		return normalized_paths

	var script_paths: Dictionary = raw_script_paths
	for language_code_variant in script_paths.keys():
		var language_code := _normalize_language_code(str(language_code_variant))
		var script_path := str(script_paths[language_code_variant]).strip_edges()
		if language_code.is_empty() or script_path.is_empty():
			continue
		normalized_paths[language_code] = script_path

	return normalized_paths

func _derive_script_paths(scene_path: String) -> Dictionary:
	var script_paths: Dictionary = {}
	if not scene_path.begins_with("res://scenes/story/"):
		return script_paths

	var base_script_path := scene_path.replace("res://scenes/story/", "res://scripts/story/").replace(".tscn", ".gd")
	if not ResourceLoader.exists(base_script_path):
		return script_paths

	script_paths[DEFAULT_LANGUAGE_CODE] = base_script_path
	var base_script_stem := base_script_path.trim_suffix(".gd")
	for language_code in SUPPORTED_LANGUAGE_CODES:
		if language_code == DEFAULT_LANGUAGE_CODE:
			continue

		var localized_script_path := "%s_%s.gd" % [base_script_stem, language_code]
		if ResourceLoader.exists(localized_script_path):
			script_paths[language_code] = localized_script_path

	return script_paths

func _normalize_language_code(language_code: String) -> String:
	var normalized_code := language_code.strip_edges().to_lower()

	match normalized_code:
		"ja":
			normalized_code = "jp"
		"ko":
			normalized_code = "kr"

	if SUPPORTED_LANGUAGE_CODES.has(normalized_code):
		return normalized_code

	return ""

func _get_current_language_code() -> String:
	var current_language := DEFAULT_LANGUAGE_CODE
	if GameConfig != null:
		current_language = GameConfig.current_language

	return _fallback_language_code(current_language)

func _fallback_language_code(language_code: String) -> String:
	var normalized_code := _normalize_language_code(language_code)
	return DEFAULT_LANGUAGE_CODE if normalized_code.is_empty() else normalized_code

func _resolve_localized_text(i18n_map: Dictionary, fallback_text: String) -> String:
	var current_language := _get_current_language_code()
	var localized_text := str(i18n_map.get(current_language, "")).strip_edges()
	if not localized_text.is_empty():
		return localized_text

	localized_text = str(i18n_map.get(DEFAULT_LANGUAGE_CODE, "")).strip_edges()
	if not localized_text.is_empty():
		return localized_text

	return fallback_text

func _resolve_script_override_path(episode_data: Dictionary) -> String:
	var script_paths: Dictionary = episode_data.get("script_paths", {})
	if script_paths.is_empty():
		return ""

	var current_language := _get_current_language_code()
	if script_paths.has(current_language):
		return str(script_paths[current_language])

	if script_paths.has(DEFAULT_LANGUAGE_CODE):
		return str(script_paths[DEFAULT_LANGUAGE_CODE])

	return ""

## 设置滚动容器
func _setup_scroll_container() -> void:
	story_list.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	story_list.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	# 移除 gui_input 连接，改用 _unhandled_input
	# story_list.gui_input.connect(_on_scroll_input)
	# 确保ScrollContainer会裁剪超出边界的内容
	story_list.clip_contents = true
	# 连接鼠标离开信号，确保鼠标移出区域时结束拖拽
	story_list.mouse_exited.connect(_on_mouse_exited_scroll_area)

## 设置初始位置（屏幕外）
func _setup_initial_positions() -> void:
	var viewport_size := get_viewport_rect().size
	
	# MovePart从右侧进入
	move_part.position.x = viewport_size.x + move_offset
	
	# 底部UI从下方进入
	story_list_bottom_ui.set_meta("target_y", story_list_bottom_ui.position.y)
	story_list_bottom_ui.position.y = viewport_size.y + bottom_offset

func _is_mobile_platform() -> bool:
	return OS.get_name() == "Android" or OS.get_name() == "iOS"

func _is_story_scene_open(main_menu: Node) -> bool:
	return main_menu != null and main_menu.story_scene_layer.get_child_count() > 0

func _set_mobile_press_visual(visual: TextureRect, pressed: bool) -> void:
	if not is_instance_valid(visual):
		return
	visual.texture = button_textures["hover"] if pressed else button_textures["normal"]

func _clear_mobile_press() -> void:
	if is_instance_valid(mobile_pressed_visual):
		_set_mobile_press_visual(mobile_pressed_visual, false)
	mobile_pressed_visual = null
	mobile_pressed_episode_data.clear()
	mobile_pressed_touch_index = -1
	mobile_press_start_pos = Vector2.ZERO
	mobile_press_moved = false
	mobile_press_uses_mouse = false

func _begin_mobile_press(visual: TextureRect, episode_data: Dictionary, touch_index: int, pos: Vector2, uses_mouse: bool) -> void:
	_clear_mobile_press()
	mobile_pressed_visual = visual
	mobile_pressed_episode_data = episode_data.duplicate(true)
	mobile_pressed_touch_index = touch_index
	mobile_press_start_pos = pos
	mobile_press_moved = false
	mobile_press_uses_mouse = uses_mouse
	_set_mobile_press_visual(visual, true)

func _handle_mobile_input(event: InputEvent, main_menu: Node) -> void:
	if _is_story_scene_open(main_menu):
		_clear_mobile_press()
		return

	if mobile_pressed_visual == null:
		return

	if mobile_press_uses_mouse:
		if event is InputEventMouseMotion:
			if event.position.distance_to(mobile_press_start_pos) > DRAG_THRESHOLD:
				mobile_press_moved = true
				_clear_mobile_press()
		elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			var episode_data := mobile_pressed_episode_data.duplicate(true)
			var should_activate := not mobile_press_moved
			_clear_mobile_press()
			if should_activate:
				_activate_episode(episode_data)
	else:
		if event is InputEventScreenDrag and event.index == mobile_pressed_touch_index:
			if event.position.distance_to(mobile_press_start_pos) > DRAG_THRESHOLD:
				mobile_press_moved = true
				_clear_mobile_press()
		elif event is InputEventScreenTouch and not event.pressed and event.index == mobile_pressed_touch_index:
			var episode_data := mobile_pressed_episode_data.duplicate(true)
			var should_activate := not mobile_press_moved
			_clear_mobile_press()
			if should_activate:
				_activate_episode(episode_data)
#endregion

#region 动画
## 播放入场动画
func _animate_entrance() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	
	# MovePart滑入
	tween.tween_property(move_part, "position:x", 0.0, animation_duration)
	
	# 底部UI上升
	tween.parallel().tween_property(
		story_list_bottom_ui, 
		"position:y", 
		story_list_bottom_ui.get_meta("target_y"), 
		animation_duration
	)

## 播放列表项入场动画
func _animate_list_items_entrance() -> void:
	# 为每个列表项创建入场动画
	for i in range(list_items.size()):
		var item := list_items[i]
		# 第一个item的延迟与MovePart相同，后续每个增加延迟
		var delay := i * item_animation_delay

		# 设置初始位置（在右侧屏幕外）
		item.position.x = item_slide_distance
		# 恢复透明度，使其可见
		item.modulate.a = 1.0

		# 创建单独的tween以避免动画冲突
		var item_tween := create_tween()
		item_tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

		# 延迟后播放动画
		if delay > 0:
			item_tween.tween_interval(delay)
		item_tween.tween_property(item, "position:x", 0.0, animation_duration)
		
## 播放退出动画
func play_exit_animation() -> void:
	if is_exiting:
		return
	
	is_exiting = true
	
	# 发出动画开始信号
	exit_animation_started.emit()
	
	# 立即隐藏StoryListConnect节点
	if story_list_connect:
		story_list_connect.visible = false
	
	# 创建主退出动画
	var main_tween := create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	main_tween.set_parallel()
	
	# MovePart向右滑出
	var viewport_size := get_viewport_rect().size
	main_tween.tween_property(
		move_part, 
		"position:x", 
		viewport_size.x + move_offset, 
		exit_animation_duration
	)
	
	# 底部UI向下滑出
	main_tween.tween_property(
		story_list_bottom_ui, 
		"position:y", 
		viewport_size.y + bottom_offset, 
		exit_animation_duration
	)
	
	# 播放列表项的退出动画
	_animate_list_items_exit()
	
	# 计算总动画时间并在完成后销毁
	var total_time = exit_animation_duration
	if list_items.size() > 0:
		total_time = max(total_time, (list_items.size() - 1) * item_exit_delay + exit_animation_duration)
	
	await get_tree().create_timer(total_time).timeout
	queue_free()

## 播放列表项退出动画
func _animate_list_items_exit() -> void:
	# 计算第一个可见item的索引
	var first_visible_index := _get_first_visible_item_index()
	
	# 从第一个可见item开始播放退出动画
	for i in range(list_items.size()):
		var item = list_items[i]
		# 计算相对于第一个可见item的延迟
		var relative_delay: float = max(0, i - first_visible_index) * item_exit_delay
		
		# 创建单独的tween
		var item_tween := create_tween()
		item_tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		
		# 延迟
		if relative_delay > 0:
			item_tween.tween_interval(relative_delay)
		
		# 向右滑出
		item_tween.tween_property(
			item, 
			"position:x", 
			item_slide_distance, 
			exit_animation_duration
		)

## 获取第一个可见item的索引
func _get_first_visible_item_index() -> int:
	# 获取ScrollContainer的全局位置和大小
	var scroll_rect: Rect2 = story_list.get_global_rect()
	
	# 遍历所有item，找到第一个与ScrollContainer相交的item
	for i in range(list_items.size()):
		var item := list_items[i]
		var item_rect := Rect2(
			item.global_position,
			item.get_rect().size
		)
		
		# 检查item是否与可见区域相交
		if scroll_rect.intersects(item_rect):
			return i
	
	# 如果没有找到可见item，返回0
	return 0

## 退出动画完成回调
func _on_exit_animation_finished() -> void:
	exit_animation_completed.emit()
	queue_free()
#endregion

#region 滚动处理
## 鼠标离开滚动区域时的处理
func _on_mouse_exited_scroll_area() -> void:
	# 如果正在拖拽，结束拖拽状态
	if scroll_state.is_dragging:
		_end_drag()

## 处理滚动输入
func _on_scroll_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_handle_mouse_button(event)
	elif event is InputEventMouseMotion and scroll_state.is_dragging:
		_handle_drag_motion(event.position)

## 处理鼠标按钮事件
func _handle_mouse_button(event: InputEventMouseButton) -> void:
	match event.button_index:
		MOUSE_BUTTON_WHEEL_UP:
			_scroll_by(-scroll_speed)
		MOUSE_BUTTON_WHEEL_DOWN:
			_scroll_by(scroll_speed)
		MOUSE_BUTTON_LEFT:
			if event.pressed:
				_start_drag(event.position)
			else:
				_end_drag()

## 开始拖拽
func _start_drag(pos: Vector2) -> void:
	scroll_state.is_dragging = true
	scroll_state.last_pos = pos
	scroll_state.drag_start_pos = pos
	scroll_state.has_moved = false
	scroll_state.velocity = 0.0
	scroll_state.velocity_samples.clear()

## 处理拖拽移动
func _handle_drag_motion(pos: Vector2) -> void:
	# 检查是否超过拖拽阈值
	if not scroll_state.has_moved:
		var distance := pos.distance_to(scroll_state.drag_start_pos)
		if distance > DRAG_THRESHOLD:
			scroll_state.has_moved = true

	var delta: float = (pos.y - scroll_state.last_pos.y) * drag_sensitivity
	story_list.scroll_vertical -= delta

	# 记录速度样本用于惯性计算
	_add_velocity_sample(-delta)
	scroll_state.last_pos = pos

## 结束拖拽
func _end_drag() -> void:
	scroll_state.is_dragging = false
	
	# 计算惯性初速度
	if scroll_state.velocity_samples.size() > 0:
		var avg_velocity := _calculate_average_velocity()
		scroll_state.velocity = clamp(
			avg_velocity * inertia_multiplier,
			-max_velocity,
			max_velocity
		)

## 添加速度样本
func _add_velocity_sample(velocity: float) -> void:
	scroll_state.velocity_samples.append(velocity)
	if scroll_state.velocity_samples.size() > VELOCITY_SAMPLE_SIZE:
		scroll_state.velocity_samples.pop_front()

## 计算平均速度
func _calculate_average_velocity() -> float:
	var sum := 0.0
	for v in scroll_state.velocity_samples:
		sum += v
	return sum / scroll_state.velocity_samples.size()

## 滚动指定距离
func _scroll_by(amount: float) -> void:
	scroll_state.velocity = 0.0  # 停止惯性
	
	var tween := create_tween()
	tween.tween_property(
		story_list,
		"scroll_vertical",
		story_list.scroll_vertical + amount,
		SMOOTH_SCROLL_TIME
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

## 处理惯性滚动
func _process_inertia_scroll(delta: float) -> void:
	if scroll_state.is_dragging or abs(scroll_state.velocity) < min_velocity:
		return
	
	# 应用惯性
	story_list.scroll_vertical += scroll_state.velocity * delta * PHYSICS_DELTA_MULTIPLIER
	
	# 应用摩擦力
	scroll_state.velocity *= inertia_friction
	
	# 速度过小时停止
	if abs(scroll_state.velocity) < min_velocity:
		scroll_state.velocity = 0.0
#endregion

#region 故事管理
## 设置要显示的故事
func set_story(story_id: String) -> void:
	if not story_config.has(story_id):
		push_error("未找到故事ID: " + story_id)
		return

	current_story_id = story_id
	var story_data: Dictionary = story_config[story_id]

	# 更新标题
	if episode_name_label:
		episode_name_label.text = _resolve_localized_text(
			story_data.get("title_i18n", {}),
			str(story_data.get("title", ""))
		)

	# 更新剧集列表
	_update_episode_list(story_data["episodes"])

## 设置mod故事（用于同人mod）
func set_mod_story(mod_title: String, episodes: Dictionary, mod_path: String) -> void:
	current_story_id = "mod_" + mod_path.get_file()

	# 更新标题
	if episode_name_label:
		episode_name_label.text = mod_title

	# 更新剧集列表（需要处理mod路径）
	var full_path_episodes: Array[Dictionary] = []
	for episode_name in episodes:
		var relative_path: String = str(episodes[episode_name]).strip_edges().replace("\\", "/")
		if not _is_safe_mod_episode_rel_path(relative_path):
			push_warning("非法mod剧情路径: %s" % relative_path)
			continue
		var full_path := mod_path + "/" + relative_path
		full_path_episodes.append({
			"display_name": str(episode_name),
			"scene_path": full_path,
			"script_paths": {}
		})

	_update_episode_list(full_path_episodes)

## 更新剧集列表

func _is_safe_mod_episode_rel_path(path: String) -> bool:
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

func _update_episode_list(episodes: Array[Dictionary]) -> void:
	# 清空现有列表
	for child in story_list_container.get_children():
		child.queue_free()
	list_items.clear()

	# 创建新的列表项
	for episode_data in episodes:
		var list_item := _create_list_item(episode_data)
		# 立即设置为完全透明，避免第一帧闪现
		list_item.modulate.a = 0.0
		story_list_container.add_child(list_item)
		list_items.append(list_item)

	# 添加底部占位节点
	var spacer := Control.new()
	spacer.custom_minimum_size = Vector2(0, 360)
	spacer.mouse_filter = Control.MOUSE_FILTER_IGNORE  # 忽略鼠标事件
	story_list_container.add_child(spacer)

	# 重置滚动
	scroll_to_top()

	# 播放列表项动画
	# 等待一帧确保节点已经添加到场景树
	await get_tree().process_frame
	_animate_list_items_entrance()

## 创建列表项
func _create_list_item(episode_data: Dictionary) -> MarginContainer:
	var episode_name := _resolve_localized_text(
		episode_data.get("name_i18n", {}),
		str(episode_data.get("display_name", ""))
	)

	# 主容器
	var container := MarginContainer.new()
	container.add_theme_constant_override("margin_top", 11)
	container.add_theme_constant_override("margin_bottom", -4)

	if _is_mobile_platform():
		container.custom_minimum_size = Vector2(538, 114)

		var visual := TextureRect.new()
		visual.name = "ItemVisual"
		visual.texture = button_textures["normal"]
		visual.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		visual.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		visual.mouse_filter = Control.MOUSE_FILTER_IGNORE
		visual.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		container.add_child(visual)

		var hit_area := Control.new()
		hit_area.name = "HitArea"
		hit_area.mouse_filter = Control.MOUSE_FILTER_PASS
		hit_area.custom_minimum_size = Vector2(538, 114)
		hit_area.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		hit_area.gui_input.connect(_on_mobile_item_gui_input.bind(visual, episode_data))
		container.add_child(hit_area)

		var center := CenterContainer.new()
		center.custom_minimum_size = Vector2(538, 114)
		center.mouse_filter = Control.MOUSE_FILTER_IGNORE
		center.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

		var label := Label.new()
		label.text = episode_name
		label.label_settings = label_settings
		label.mouse_filter = Control.MOUSE_FILTER_IGNORE

		center.add_child(label)
		container.add_child(center)
	else:
		# 按钮
		var button := TextureButton.new()
		button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		button.texture_normal = button_textures["normal"]
		button.texture_hover = button_textures["hover"]
		button.texture_disabled = button_textures["disabled"]
		button.mouse_filter = Control.MOUSE_FILTER_PASS
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(_on_episode_selected.bind(episode_data))

		# 标签容器
		var center := CenterContainer.new()
		center.custom_minimum_size = Vector2(538, 114)
		center.mouse_filter = Control.MOUSE_FILTER_PASS

		# 标签
		var label := Label.new()
		label.text = episode_name
		label.label_settings = label_settings
		label.mouse_filter = Control.MOUSE_FILTER_PASS

		# 组装节点
		center.add_child(label)
		button.add_child(center)
		container.add_child(button)

	return container

func _on_mobile_item_gui_input(event: InputEvent, visual: TextureRect, episode_data: Dictionary) -> void:
	if event is InputEventScreenTouch and event.pressed:
		_begin_mobile_press(visual, episode_data, event.index, event.position, false)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_begin_mobile_press(visual, episode_data, -1, event.position, true)

## 处理剧集选择
func _on_episode_selected(episode_data: Dictionary) -> void:
	# 防止拖拽时误触发 - 检查是否正在拖拽或已经发生了拖拽移动
	if scroll_state.is_dragging or scroll_state.has_moved:
		return

	_activate_episode(episode_data)

func _activate_episode(episode_data: Dictionary) -> void:
	var episode_name := _resolve_localized_text(
		episode_data.get("name_i18n", {}),
		str(episode_data.get("display_name", ""))
	)
	var scene_path := str(episode_data.get("scene_path", ""))
	var script_override_path := _resolve_script_override_path(episode_data)
	print("选择剧集: %s -> %s" % [episode_name, scene_path])

	# 获取主菜单场景
	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if not main_menu:
		# 如果找不到主菜单，尝试通过根节点获取
		var root = get_tree().current_scene
		if root.has_method("load_story_scene"):
			main_menu = root

	if main_menu and main_menu.has_method("load_story_scene"):
		# 使用主菜单的方法加载剧情到CanvasLayer
		var success = await main_menu.load_story_scene(scene_path, script_override_path)
		if success:
			print("成功加载剧情场景到CanvasLayer")
		else:
			print("加载剧情场景失败，使用传统场景切换")
			get_tree().change_scene_to_file(scene_path)
	else:
		print("未找到主菜单引用，使用传统场景切换")
		get_tree().change_scene_to_file(scene_path)
#endregion

#region 公共接口
## 滚动到顶部
func scroll_to_top() -> void:
	_scroll_to_position(0)

## 滚动到底部  
func scroll_to_bottom() -> void:
	var max_scroll: float = story_list.get_v_scroll_bar().max_value
	_scroll_to_position(max_scroll)

## 滚动到指定位置
func _scroll_to_position(scroll_position: float) -> void:
	scroll_state.velocity = 0.0
	
	var tween := create_tween()
	tween.tween_property(
		story_list,
		"scroll_vertical", 
		scroll_position,
		0.3
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

## 获取当前故事ID
func get_current_story_id() -> String:
	return current_story_id

## 获取所有可用的故事ID
func get_available_stories() -> Array:
	return story_config.keys()
#endregion
