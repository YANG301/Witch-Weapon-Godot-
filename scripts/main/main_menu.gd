extends Control

# 按钮组件引用
@onready var main_story_button: TextureButton = $"MainStoryButton"  # 主线按钮
@onready var side_story_button: TextureButton = $"SideStoryButton"  # 支线按钮
@onready var dojin_button: TextureButton = $"DojinButton"  # 同人按钮
@onready var settings_button: TextureButton = $"SettingsButton"  # 设置按钮

# 主线按钮UI元素
@onready var main_icon_light: Sprite2D = $"MainStoryButton/IconLight"     # 主线高亮图标
@onready var main_label_light: Label = $"MainStoryButton/IconLight/LabelLight"  # 主线高亮文字
@onready var main_icon_gray: Sprite2D = $"MainStoryButton/IconGray"      # 主线灰色图标
@onready var main_label_gray: Label = $"MainStoryButton/IconGray/LabelGray"   # 主线灰色文字

# 支线按钮UI元素
@onready var side_icon_light: Sprite2D = $"SideStoryButton/IconLight"    # 支线高亮图标
@onready var side_label_light: Label = $"SideStoryButton/IconLight/LabelLight" # 支线高亮文字
@onready var side_icon_gray: Sprite2D = $"SideStoryButton/IconGray"     # 支线灰色图标
@onready var side_label_gray: Label = $"SideStoryButton/IconGray/LabelGray"  # 支线灰色文字

# 同人按钮UI元素
@onready var dojin_icon_light: Sprite2D = $"DojinButton/IconLight"    # 同人高亮图标
@onready var dojin_label_light: Label = $"DojinButton/IconLight/LabelLight" # 同人高亮文字
@onready var dojin_icon_gray: Sprite2D = $"DojinButton/IconGray"     # 同人灰色图标
@onready var dojin_label_gray: Label = $"DojinButton/IconGray/LabelGray"  # 同人灰色文字

# 同人按钮点击代理（用于覆盖 Sprite2D/Label 组合可能产生的“点不到缝隙”区域）
var _dojin_hit_proxy: Control = null
const DOJIN_HIT_PADDING := 6.0

# 故事列表容器
@onready var main_story_list: Control = $"MainStoryList"  # 主线故事列表
@onready var side_story_list: Control = $"SideStoryList"  # 支线故事列表
@onready var dojin_story_list: Control = $"DojinStoryList"  # 同人故事列表

# 设置面板
@onready var settings_panel: Control = $"SettingsPanel"  # 设置面板

# 背景元素
@onready var story_bg_01: Sprite2D = $"StoryBg1"  # 背景层1
@onready var story_bg_02: Sprite2D = $"StoryBg2"  # 背景层2

# 剧情场景容器
@onready var story_scene_layer: CanvasLayer = $"StorySceneLayer"  # 剧情场景层

# 黑色遮罩（用于进入剧情的渐变动画）
@onready var black_overlay: ColorRect = $"BlackOverlay"  # 黑色遮罩层

# 背景音乐播放器
@onready var bgm_player: AudioStreamPlayer = $"BGMPlayer"

# 故事列表位置范围常量
const STORY_MIN_X: float = 0.0      # 列表最左边位置
const STORY_MAX_X: float = -2500.0  # 列表最右边位置

# 背景视差效果配置
const BG_INITIAL_X: float = 720.0       # 两个背景层的初始X位置
const BG1_MAX_OFFSET: float = 420.0     # 背景层1最大移动距离
const BG2_MAX_OFFSET: float = 320.0     # 背景层2最大移动距离
const BG1_PARALLAX_FACTOR: float = 0.3  # 背景层1视差因子(移动速度30%)
const BG2_PARALLAX_FACTOR: float = 0.5  # 背景层2视差因子(移动速度50%)

# 动画配置
const SWITCH_DURATION: float = 0.3  # 列表切换动画持续时间
const FADE_TO_BLACK_DURATION: float = 0.2  # 渐变到黑色的动画时长
const MUSIC_FADE_DURATION: float = 0.5  # 音乐渐变时长

# 状态变量
var _tween: Tween         # 动画控制器
var _is_switching: bool = false  # 是否正在切换中
var _music_tween: Tween   # 音乐渐变控制器
var _is_settings_open: bool = false  # 设置界面是否打开

func _ready() -> void:
	"""初始化主菜单，设置默认状态和背景位置"""
	# 将自己添加到main_menu组
	add_to_group("main_menu")
	
	_initialize_backgrounds()
	_initialize_story_lists()
	_initialize_black_overlay()
	_setup_bgm_loop()
	_ensure_dojin_hit_proxy()
	_update_dojin_hit_proxy_rect()
	_update_backgrounds_position()

func _input(event: InputEvent) -> void:
	"""处理输入事件，包括退出剧情场景"""
	# 检查是否有剧情场景正在显示
	if story_scene_layer.get_child_count() > 0:
		# 检查ESC键或返回键
		if event.is_action_pressed("ui_cancel"):
			clear_story_scene()
			get_viewport().set_input_as_handled()

func _initialize_backgrounds():
	"""初始化背景位置"""
	story_bg_01.position.x = BG_INITIAL_X
	story_bg_02.position.x = BG_INITIAL_X

func _initialize_story_lists():
	"""初始化故事列表的显示状态，默认显示主线"""
	main_story_list.modulate.a = 1.0  # 主线完全显示
	side_story_list.modulate.a = 0.0  # 支线完全隐藏
	side_story_list.visible = false   # 支线不可见
	dojin_story_list.modulate.a = 0.0  # 同人完全隐藏
	dojin_story_list.visible = false   # 同人不可见

func _initialize_black_overlay():
	"""初始化黑色遮罩"""
	if black_overlay:
		black_overlay.color = Color.BLACK
		black_overlay.modulate.a = 0.0  # 初始完全透明
		black_overlay.visible = false   # 初始不可见（编辑器中也不可见）
		black_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE  # 不接收鼠标事件

func _setup_bgm_loop() -> void:
	if not bgm_player:
		return

	if not bgm_player.finished.is_connected(_on_bgm_player_finished):
		bgm_player.finished.connect(_on_bgm_player_finished)

	var stream := bgm_player.stream
	if stream is AudioStreamOggVorbis or stream is AudioStreamMP3:
		stream.loop = true
	elif stream is AudioStreamWAV:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD

func _on_bgm_player_finished() -> void:
	if not bgm_player:
		return

	# 剧情场景播放期间不自动重启主菜单BGM
	if story_scene_layer and story_scene_layer.get_child_count() > 0:
		return

	bgm_player.play()

func _process(_delta):
	"""每帧更新，仅在非切换状态时更新背景视差效果"""
	if not _is_switching:
		_update_backgrounds_position()
	_update_dojin_hit_proxy_rect()

func _update_backgrounds_position():
	"""根据当前可见的故事列表更新背景视差位置"""
	var active_list = _get_active_story_list()
	if active_list:
		_update_backgrounds_for_list(active_list)

func _get_active_story_list() -> Control:
	"""获取当前活跃(可见且不透明)的故事列表"""
	if main_story_list.visible and main_story_list.modulate.a > 0.5:
		return main_story_list
	elif side_story_list.visible and side_story_list.modulate.a > 0.5:
		return side_story_list
	elif dojin_story_list.visible and dojin_story_list.modulate.a > 0.5:
		return dojin_story_list
	return null

func _update_backgrounds_for_list(list_node: Control):
	"""根据指定列表的滚动位置更新背景视差效果"""
	var first_story = _get_first_story_node(list_node)
	if not first_story:
		return
	
	# 计算滚动进度(0-1)
	var scroll_progress = _calculate_scroll_progress(first_story.position.x)
	
	# 应用视差偏移
	_apply_parallax_offset(scroll_progress)

func _get_first_story_node(list_node: Control) -> Node:
	"""获取列表中的第一个故事节点"""
	return list_node.get_child(0) if list_node.get_child_count() > 0 else null

func _calculate_scroll_progress(story_x: float) -> float:
	"""根据故事节点X位置计算滚动进度(0-1)"""
	var progress = (story_x - STORY_MIN_X) / (STORY_MAX_X - STORY_MIN_X)
	return clamp(progress, 0.0, 1.0)

func _apply_parallax_offset(progress: float):
	"""根据进度应用背景视差偏移效果"""
	# 计算偏移量(方向相反)
	var bg1_offset = -progress * BG1_MAX_OFFSET * BG1_PARALLAX_FACTOR
	var bg2_offset = -progress * BG2_MAX_OFFSET * BG2_PARALLAX_FACTOR
	
	# 更新背景位置并限制边界
	story_bg_01.position.x = clamp(
		BG_INITIAL_X + bg1_offset,
		BG_INITIAL_X - BG1_MAX_OFFSET,
		BG_INITIAL_X + BG1_MAX_OFFSET
	)
	story_bg_02.position.x = clamp(
		BG_INITIAL_X + bg2_offset,
		BG_INITIAL_X - BG2_MAX_OFFSET,
		BG_INITIAL_X + BG2_MAX_OFFSET
	)

func _switch_to_list(show_list: Control, hide_list: Control):
	"""平滑切换故事列表显示，包含淡入淡出和背景视差动画"""
	if _is_switching:
		return
	
	_is_switching = true
	
	# 准备动画：确保两个列表都可见
	show_list.visible = true
	hide_list.visible = true
	
	# 创建并行动画
	_create_switch_animation(show_list, hide_list)

func _create_switch_animation(show_list: Control, hide_list: Control):
	"""创建列表切换动画，包含透明度和背景视差"""
	_kill_existing_tween()
	_tween = create_tween()
	_tween.set_parallel(true)
	
	# 透明度动画
	_tween.tween_property(hide_list, "modulate:a", 0.0, SWITCH_DURATION)
	_tween.tween_property(show_list, "modulate:a", 1.0, SWITCH_DURATION)
	
	# 背景视差动画
	_animate_backgrounds_for_list(show_list)
	
	# 动画完成回调
	_tween.chain().tween_callback(_on_switch_complete.bind(hide_list))

func _kill_existing_tween():
	"""安全地终止现有动画"""
	if _tween:
		_tween.kill()

func _animate_backgrounds_for_list(target_list: Control):
	"""为目标列表创建背景视差动画"""
	var first_story = _get_first_story_node(target_list)
	if not first_story:
		return
	
	var progress = _calculate_scroll_progress(first_story.position.x)
	var bg1_target = BG_INITIAL_X - (progress * BG1_MAX_OFFSET * BG1_PARALLAX_FACTOR)
	var bg2_target = BG_INITIAL_X - (progress * BG2_MAX_OFFSET * BG2_PARALLAX_FACTOR)
	
	_tween.tween_property(story_bg_01, "position:x", bg1_target, SWITCH_DURATION)
	_tween.tween_property(story_bg_02, "position:x", bg2_target, SWITCH_DURATION)

func _on_switch_complete(hide_list: Control):
	"""切换动画完成后的清理工作"""
	hide_list.visible = false
	_is_switching = false


func _try_close_active_story_overlay() -> bool:
	# If the active list is expanded (or has an episode list open), treat top button clicks as "back" first.
	var active_list: Control = _get_current_active_list()
	if not is_instance_valid(active_list):
		return false

	# These variables exist on main_story_list.gd / side_story_list.gd / dojin_story_list.gd
	var expanded_flag = active_list.get("is_expanded")
	var episode_instance = active_list.get("episode_list_instance")
	var is_expanded: bool = (typeof(expanded_flag) == TYPE_BOOL) and expanded_flag
	var has_episode_list: bool = is_instance_valid(episode_instance)

	if not (is_expanded or has_episode_list):
		return false

	if active_list.has_method("_on_back_area_pressed"):
		active_list.call("_on_back_area_pressed")
		return true

	return false

func _on_main_story_button_pressed() -> void:
	"""处理主线按钮点击事件"""
	if _try_close_active_story_overlay():
		return
	if _is_switching or _is_main_story_active():
		return

	_update_button_states(0)  # 0表示激活主线
	_switch_to_list(main_story_list, _get_current_active_list())

func _is_main_story_active() -> bool:
	"""检查主线是否已经激活"""
	return main_story_list.visible and main_story_list.modulate.a > 0.5

func _on_side_story_button_pressed() -> void:
	"""处理支线按钮点击事件"""
	if _try_close_active_story_overlay():
		return
	if _is_switching or _is_side_story_active():
		return

	_update_button_states(1)  # 1表示激活支线
	_switch_to_list(side_story_list, _get_current_active_list())

func _on_dojin_button_pressed() -> void:
	"""处理同人按钮点击事件"""
	if _try_close_active_story_overlay():
		return
	if _is_switching or _is_dojin_story_active():
		return

	_update_button_states(2)  # 2表示激活同人
	_switch_to_list(dojin_story_list, _get_current_active_list())

func _is_side_story_active() -> bool:
	"""检查支线是否已经激活"""
	return side_story_list.visible and side_story_list.modulate.a > 0.5

func _is_dojin_story_active() -> bool:
	"""检查同人是否已经激活"""
	return dojin_story_list.visible and dojin_story_list.modulate.a > 0.5

func _get_current_active_list() -> Control:
	"""获取当前激活的列表，用于切换"""
	if main_story_list.visible and main_story_list.modulate.a > 0.5:
		return main_story_list
	elif side_story_list.visible and side_story_list.modulate.a > 0.5:
		return side_story_list
	elif dojin_story_list.visible and dojin_story_list.modulate.a > 0.5:
		return dojin_story_list
	return main_story_list  # 默认返回主线

func _update_button_states(active_index: int):
	"""更新按钮的高亮/灰色状态
	active_index: 0=主线, 1=支线, 2=同人"""
	_set_button_active(main_icon_light, main_label_light, main_icon_gray, main_label_gray, active_index == 0)
	_set_button_active(side_icon_light, side_label_light, side_icon_gray, side_label_gray, active_index == 1)
	_set_button_active(dojin_icon_light, dojin_label_light, dojin_icon_gray, dojin_label_gray, active_index == 2)
	_update_dojin_hit_proxy_rect()

func _set_button_active(icon_light: Sprite2D, label_light: Label, icon_gray: Sprite2D, label_gray: Label, active: bool):
	"""设置单个按钮的激活状态"""
	icon_light.visible = active
	label_light.visible = active
	icon_gray.visible = not active
	label_gray.visible = not active

func _ensure_dojin_hit_proxy() -> void:
	if is_instance_valid(_dojin_hit_proxy):
		return

	_dojin_hit_proxy = Control.new()
	_dojin_hit_proxy.name = "DojinHitProxy"
	_dojin_hit_proxy.mouse_filter = Control.MOUSE_FILTER_STOP
	_dojin_hit_proxy.modulate = Color(1, 1, 1, 0)
	_dojin_hit_proxy.z_index = 100
	add_child(_dojin_hit_proxy)

	_dojin_hit_proxy.gui_input.connect(_on_dojin_hit_proxy_gui_input)

func _on_dojin_hit_proxy_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_on_dojin_button_pressed()
		get_viewport().set_input_as_handled()

func _get_sprite2d_global_rect(sprite: Sprite2D) -> Rect2:
	if not is_instance_valid(sprite) or not sprite.texture:
		return Rect2()

	var texture_size: Vector2 = sprite.texture.get_size()
	var sprite_scale: Vector2 = Vector2(abs(sprite.scale.x), abs(sprite.scale.y))
	var rect_size: Vector2 = texture_size * sprite_scale

	var top_left := sprite.global_position
	if sprite.centered:
		top_left -= rect_size * 0.5

	return Rect2(top_left, rect_size)

func _update_dojin_hit_proxy_rect() -> void:
	if not is_instance_valid(_dojin_hit_proxy):
		return

	var icon := dojin_icon_light if dojin_icon_light.visible else dojin_icon_gray
	var label := dojin_label_light if dojin_label_light.visible else dojin_label_gray

	var rect := _get_sprite2d_global_rect(icon)
	if rect.size == Vector2.ZERO:
		_dojin_hit_proxy.visible = false
		return

	if is_instance_valid(label) and label.visible:
		rect = rect.merge(label.get_global_rect())

	rect.position -= Vector2(DOJIN_HIT_PADDING, DOJIN_HIT_PADDING)
	rect.size += Vector2(DOJIN_HIT_PADDING * 2.0, DOJIN_HIT_PADDING * 2.0)

	_dojin_hit_proxy.global_position = rect.position
	_dojin_hit_proxy.size = rect.size
	_dojin_hit_proxy.visible = true

func load_story_scene(scene_path: String, script_override_path: String = "") -> bool:
	"""加载剧情场景到CanvasLayer中，带有渐变动画"""
	# 隐藏设置按钮
	settings_button.visible = false

	# 并行执行音乐渐变和黑色遮罩动画，立即开始场景切换
	_fade_out_music()  # 音乐在后台渐变
	await _fade_to_black()  # 等待黑色遮罩完成即可进入剧情

	# 清除现有的剧情场景（不重新播放音乐）
	_clear_story_scene_without_music()

	# 加载新场景（处理mod路径）
	var story_scene = null
	if scene_path.begins_with("user://mods/"):
		# mod场景需要特殊处理路径
		story_scene = _load_mod_scene(scene_path)
	else:
		# 普通场景直接加载
		story_scene = load(scene_path)

	if not story_scene:
		push_error("无法加载剧情场景: " + scene_path)
		return false

	# 实例化并添加到CanvasLayer
	var story_instance = story_scene.instantiate()
	_apply_story_script_override(story_instance, script_override_path)
	story_scene_layer.add_child(story_instance)

	# 剧情场景加载完成后，清除主菜单的黑色遮罩，让NovelInterface接管后续动画
	_clear_black_overlay()

	return true

func _apply_story_script_override(story_instance: Node, script_override_path: String) -> void:
	if story_instance == null or script_override_path.is_empty():
		return

	if not ResourceLoader.exists(script_override_path):
		push_warning("语言脚本不存在，保留原始脚本: " + script_override_path)
		return

	var loaded_script: Variant = load(script_override_path)
	if loaded_script is Script:
		story_instance.set_script(loaded_script)
	else:
		push_warning("语言脚本加载失败，保留原始脚本: " + script_override_path)

func _load_mod_scene(scene_path: String) -> PackedScene:
	"""加载mod场景，处理路径引用问题
	mod场景文件中的资源引用使用res://mods/路径，需要转换为user://mods/"""

	# 读取原始场景文件
	var file = FileAccess.open(scene_path, FileAccess.READ)
	if not file:
		push_error("无法打开mod场景文件: " + scene_path)
		return null

	var original_content = file.get_as_text()
	file.close()

	# New mod exports use relative script paths (for example: ep01.gd).
	# If no legacy res://mods or res://export references exist, load directly.
	var needs_rewrite: bool = original_content.find("res://mods/") != -1 or original_content.find("res://export/") != -1
	if not needs_rewrite:
		return load(scene_path)

	# 替换所有res://mods/为user://mods/
	var modified_content: String = original_content.replace("res://mods/", "user://mods/")

	# Legacy export remap: res://export/* -> current mod export folder
	if scene_path.begins_with("user://mods/"):
		var rest: String = scene_path.substr("user://mods/".length())
		var parts: PackedStringArray = rest.split("/")
		if parts.size() >= 1 and not parts[0].is_empty():
			var mod_folder: String = parts[0]
			if modified_content.find("res://export/") != -1:
				modified_content = modified_content.replace("res://export/", "user://mods/%s/export/" % mod_folder)
			# Normalize hardcoded old mod folder to the current mod folder
			var re := RegEx.new()
			if re.compile("user://mods/[^/]+/") == OK:
				modified_content = re.sub(modified_content, "user://mods/%s/" % mod_folder, true)

	# 创建临时文件
	var temp_path = "user://temp_mod_scene.tscn"
	var temp_file = FileAccess.open(temp_path, FileAccess.WRITE)
	if not temp_file:
		push_error("无法创建临时场景文件")
		return null

	temp_file.store_string(modified_content)
	temp_file.close()

	# 加载临时文件
	var scene = load(temp_path)

	# 删除临时文件
	DirAccess.remove_absolute(ProjectSettings.globalize_path(temp_path))

	return scene

func clear_story_scene():
	"""清除当前的剧情场景"""
	# 显示设置按钮
	if not _is_settings_open:
		settings_button.visible = true

	# 渐变播放背景音乐
	_fade_in_music()

	_clear_story_scene_without_music()

func _clear_story_scene_without_music():
	"""清除剧情场景但不播放音乐"""
	# 显示黑色遮罩
	if black_overlay:
		black_overlay.visible = true
		black_overlay.modulate.a = 1.0
	
	# 直接移除所有剧情场景
	for child in story_scene_layer.get_children():
		child.queue_free()
	
	# 黑色遮罩渐渐消失动画
	if black_overlay:
		var fade_tween = create_tween()
		fade_tween.tween_property(black_overlay, "modulate:a", 0.0, 0.3)
		fade_tween.tween_callback(func(): black_overlay.visible = false)

func get_story_scene_layer() -> CanvasLayer:
	"""获取剧情场景层引用，供其他脚本调用"""
	return story_scene_layer

func is_story_scene_loaded() -> bool:
	"""检查是否有剧情场景正在显示"""
	return story_scene_layer.get_child_count() > 0

func is_settings_open() -> bool:
	"""检查设置界面是否打开"""
	return _is_settings_open

func _fade_to_black() -> void:
	"""渐变到黑色的动画"""
	if not black_overlay:
		push_error("黑色遮罩节点未找到")
		return
	
	black_overlay.visible = true
	black_overlay.modulate.a = 0.0
	
	var fade_tween = create_tween()
	fade_tween.tween_property(black_overlay, "modulate:a", 1.0, FADE_TO_BLACK_DURATION)
	fade_tween.set_trans(Tween.TRANS_CUBIC)
	fade_tween.set_ease(Tween.EASE_OUT)
	
	await fade_tween.finished
	print("主菜单渐变到黑色完成")

func _clear_black_overlay() -> void:
	"""清除黑色遮罩（让NovelInterface接管）"""
	if black_overlay:
		black_overlay.visible = false
		black_overlay.modulate.a = 0.0
		print("主菜单黑色遮罩已清除")

func _fade_out_music() -> void:
	"""渐变停止音乐"""
	if not bgm_player or not bgm_player.playing:
		return
	
	if _music_tween:
		_music_tween.kill()
	
	_music_tween = create_tween()
	_music_tween.tween_property(bgm_player, "volume_db", -80.0, MUSIC_FADE_DURATION)
	_music_tween.set_trans(Tween.TRANS_CUBIC)
	_music_tween.set_ease(Tween.EASE_OUT)
	
	await _music_tween.finished
	bgm_player.stop()
	print("背景音乐已渐变停止")

func _fade_in_music() -> void:
	"""渐变播放音乐"""
	if not bgm_player:
		return
	
	if _music_tween:
		_music_tween.kill()
	
	# 从-80db开始播放
	bgm_player.volume_db = -80.0
	bgm_player.play()
	
	_music_tween = create_tween()
	_music_tween.tween_property(bgm_player, "volume_db", 0.0, MUSIC_FADE_DURATION)
	_music_tween.set_trans(Tween.TRANS_CUBIC)
	_music_tween.set_ease(Tween.EASE_IN)
	
	print("背景音乐开始渐变播放")

# 设置按钮点击回调
func _on_settings_button_pressed() -> void:
	"""处理设置按钮点击，显示设置面板"""
	if _is_settings_open:
		return

	_is_settings_open = true
	settings_panel.show_settings()

# 设置面板返回按钮回调
func _on_settings_back_pressed() -> void:
	"""处理设置面板返回按钮，隐藏设置面板"""
	if not _is_settings_open:
		return

	await settings_panel.hide_settings()
	_is_settings_open = false
