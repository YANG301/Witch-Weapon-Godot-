# =============================================================================
# 同人故事列表控制器 (DojinStoryList Controller)
# =============================================================================
#
# 功能概述：
# 这个脚本控制游戏主菜单的同人(Mod)故事选择界面，提供以下核心功能：
# 1. 动态扫描并加载游戏根目录下的mods文件夹中的mod
# 2. 故事缩略图的横向拖拽浏览（支持惯性滑动和边界回弹）
# 3. 故事点击后的展开动画效果（选中故事放大，其他故事收缩变暗）
# 4. 剧集列表的动态加载和显示
# 5. 平滑的UI过渡动画和视觉反馈
#
# 主要组件说明：
# - 动态生成的Dojin01~DojinN节点，每个包含BackNet/TextureRect/TextureButton结构
# - BackgroundColor: 展开时的背景遮罩
# - BackArea: 用户点击返回的区域
#
# Mod文件结构：
# mods/
#   └── mod_name/
#       ├── icon.png              # mod图标
#       ├── mod_config.json       # mod配置文件
#       ├── music/                # 自定义音乐
#       ├── images/               # 自定义图片
#       │   ├── bg/              # 背景图片
#       │   └── role/            # 角色图片
#       ├── characters/           # 自定义角色场景和脚本
#       └── story/                # 故事场景和脚本
#
# 作者: [项目团队]
# 版本: 1.0
# 最后修改: 2025年12月
# =============================================================================

extends Control

# ==================== 信号定义 ====================

# ==================== 节点引用 ====================
@onready var background_color: ColorRect = $"BackgroundColor"
@onready var back_area: Control = $"BackgroundColor/BackArea"
@onready var editor_button: Button = $"EditorButton"
@onready var manage_mods_button: Button = get_node_or_null("ManageModsButton") as Button
@onready var online_mods_button: Button = get_node_or_null("OnlineModsButton") as Button
@onready var login_button: Button = get_node_or_null("LoginButton") as Button

# ==================== 常量配置 ====================
# Mod文件夹路径（相对于游戏根目录）
const MODS_FOLDER_PATH: String = "user://mods"
const MOD_CONFIG_FILENAME: String = "mod_config.json"
const MOD_ICON_FILENAME: String = "icon.png"
const MOD_PROJECTS_PATH: String = "user://mod_projects"  # mod工程文件夹

# 剧集列表场景的文件路径
const EPISODE_LIST_SCENE_PATH: String = "res://scenes/main/episode_story_list.tscn"
const PROJECT_MANAGER_SCENE_PATH: String = "res://scenes/editor/project_manager.tscn"  # 工程管理器场景
const MOD_MANAGER_SCENE_PATH: String = "res://scenes/main/mod_manager.tscn"  # 模组管理器场景
const ONLINE_MODS_MANAGER_SCENE_PATH: String = "res://scenes/main/online_mods_manager.tscn"  # 在线模组场景
const AUTH_DIALOG_SCENE_PATH: String = "res://scenes/main/auth_dialog.tscn"
const ONLINE_MODS_MANAGER_SCRIPT: Script = preload("res://scripts/main/online_mods_manager.gd")

# 故事节点间距
const STORY_SPACING: float = 346.0
const FIRST_STORY_X: float = 0.0

# ==================== 预加载资源 ====================
var black_transition_shader = preload("res://scripts/shader/black_transition.gdshader")
var storyui_connect_texture = preload("res://assets/gui/main_menu/storyui_connect.png")
var line_contect_texture = preload("res://assets/gui/main_menu/line_contect.png")
var storyui_back_texture = preload("res://assets/gui/main_menu/storyui_back.png")
var juqing_bottm_xian_texture = preload("res://assets/gui/main_menu/juqing_bottm_xian.png")

# ==================== 动态mod数据 ====================
var loaded_mods: Array = []  # 存储加载的mod信息 {folder_name, config, icon_texture}
var story_nodes: Array = []  # 存储动态创建的故事节点

# ==================== 拖拽物理参数 ====================
var is_dragging: bool = false
var drag_velocity: float = 0.0
var drag_start_pos: Vector2
const CLICK_THRESHOLD: float = 5.0
const FRICTION: float = 0.985
const BOUNDARY_SPRING: float = 0.1

# ==================== 动画控制参数 ====================
const ANIMATION_DURATION: float = 1.0
const BLACK_TRANSITION_DURATION: float = 0.6
const BACK_BUTTON_DELAY: float = 0.2
const BUTTON_FADE_START: float = 0.5

const TARGET_POSITION: Vector2 = Vector2(106, 38)
const TARGET_SCALE: float = 1.9
const TARGET_MODULATE_ALPHA: float = 1.0
const NUM_LEFT_OFFSET: float = 90.0
const NUM_ANIMATION_DELAY: float = 0.0

const OTHER_STORY_SHRINK_FACTOR: float = 0.1
const OTHER_STORY_FOLLOW_FACTOR: float = 1.0

# ==================== 动画状态变量 ====================
var selected_back_net: Control = null
var selected_texture_rect: Control = null
var selected_num_node: Control = null
var selected_story_node: Control = null
var episode_list_instance: Control = null

var is_animating: bool = false
var is_expanded: bool = false
var back_button_enabled: bool = false
var animation_timer: float = 0.0

var other_stories_data: Array = []
var selected_story_motion_vector: Vector2 = Vector2.ZERO
var other_stories_materials: Array = []
var other_stories_buttons: Array = []
var button_press_pos: Vector2

var _is_project_manager_open: bool = false
var _is_mod_manager_open: bool = false
var _is_online_mods_manager_open: bool = false
var _is_auth_dialog_open: bool = false

var animation_cache = {
	"original_position": Vector2.ZERO,
	"original_scale": Vector2.ONE,
	"original_modulate_alpha": 0.0,
	"background_modulate_alpha": 0.0,
	"is_returning": false,
	"true_original_position": Vector2.ZERO,
	"true_original_scale": Vector2.ONE,
	"original_z_index": 0,
	"original_num_z_index": 0,
	"original_num_position": Vector2.ZERO,
	"true_original_num_position": Vector2.ZERO
}

# ==================== 主生命周期函数 ====================
func _ready():
	_setup_back_area()
	_setup_editor_button()
	_setup_manage_mods_button()
	_setup_online_mods_button()
	_setup_login_button()
	_init_background()
	_load_mods()
	_create_story_nodes()
	_setup_auth_manager()
	call_deferred("_warmup_online_mods_cache")

func _process(delta):
	if not _is_list_active() or _is_project_manager_open or _is_mod_manager_open or _is_online_mods_manager_open or _is_auth_dialog_open:
		is_dragging = false
		drag_velocity = 0.0
		return

	if is_animating:
		_update_animation(delta)
		_update_other_stories_animation(delta)
		_update_black_transition(delta)
		_update_button_fade(delta)
	elif not is_expanded:
		_update_drag_physics()

func _input(event):
	if not _is_list_active() or _is_project_manager_open or _is_mod_manager_open or _is_online_mods_manager_open or _is_auth_dialog_open:
		is_dragging = false
		drag_velocity = 0.0
		return

	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if main_menu and main_menu.has_method("is_settings_open") and main_menu.is_settings_open():
		is_dragging = false
		drag_velocity = 0.0
		return

	if is_animating or is_expanded:
		is_dragging = false
		drag_velocity = 0.0
		return
	_handle_drag_input(event)

func _is_list_active() -> bool:
	if not visible or modulate.a < 0.5:
		return false

	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if main_menu and main_menu.get("_is_switching"):
		return false

	return true

# ==================== Mod加载函数 ====================
func _load_mods():
	"""扫描并加载mods文件夹中的所有mod"""
	loaded_mods.clear()

	# 确保mods文件夹存在
	var dir = DirAccess.open("user://")
	if not dir.dir_exists("mods"):
		dir.make_dir("mods")
		print("创建mods文件夹: user://mods")
		return

	# 打开mods文件夹
	dir = DirAccess.open(MODS_FOLDER_PATH)
	if not dir:
		push_error("无法打开mods文件夹: " + MODS_FOLDER_PATH)
		return

	# 遍历所有子文件夹
	dir.list_dir_begin()
	var folder_name = dir.get_next()
	while folder_name != "":
		if dir.current_is_dir() and not folder_name.begins_with("."):
			_load_single_mod(folder_name)
		folder_name = dir.get_next()
	dir.list_dir_end()

	print("加载了 %d 个mod" % loaded_mods.size())

func _load_single_mod(folder_name: String):
	"""加载单个mod"""
	var mod_path = MODS_FOLDER_PATH + "/" + folder_name
	var config_path = mod_path + "/" + MOD_CONFIG_FILENAME
	var icon_path = mod_path + "/" + MOD_ICON_FILENAME

	# 读取配置文件
	var config_data = _load_mod_config(config_path)
	if not config_data:
		print("跳过mod（配置文件无效）: " + folder_name)
		return

	# 加载图标
	# Repair legacy scene script paths so mods still run after folder rename
	_repair_story_scene_script_paths(mod_path, config_data)

	var icon_texture = _load_mod_icon(icon_path)

	# 存储mod数据
	loaded_mods.append({
		"folder_name": folder_name,
		"config": config_data,
		"icon_texture": icon_texture,
		"mod_path": mod_path
	})

	print("成功加载mod: " + folder_name + " - " + str(config_data.get("title", "未命名")))

func _load_mod_config(config_path: String) -> Dictionary:
	"""加载mod配置文件"""
	var file = FileAccess.open(config_path, FileAccess.READ)
	if not file:
		return {}

	var json_string = file.get_as_text()
	file.close()

	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		push_error("解析mod配置失败: " + config_path)
		return {}

	return json.data

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

	var marker: String = "[ext_resource type=\"Script\""
	var marker_pos: int = text.find(marker)
	if marker_pos == -1:
		return

	var path_key: String = "path=\""
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

func _load_mod_icon(icon_path: String) -> Texture2D:
	"""加载mod图标"""
	if not FileAccess.file_exists(icon_path):
		return null
	var image = Image.new()
	var err: int = image.load(icon_path)
	if err != OK:
		print("无法加载mod图标: " + icon_path + "，使用默认图标")
		return null

	var texture = ImageTexture.create_from_image(image)
	return texture

# ==================== 故事节点创建函数 ====================
func _create_story_nodes():
	"""根据加载的mod动态创建故事节点"""
	story_nodes.clear()

	for i in range(loaded_mods.size()):
		var mod_data = loaded_mods[i]
		var story_node = _create_single_story_node(i + 1, mod_data)
		if story_node:
			add_child(story_node)
			# 移动到BackgroundColor之前
			if background_color:
				var bg_index = background_color.get_index()
				move_child(story_node, bg_index)
			story_nodes.append(story_node)

func _create_single_story_node(index: int, mod_data: Dictionary) -> Control:
	"""创建单个故事节点"""
	var story = Control.new()
	story.name = "Dojin%02d" % index
	story.set_anchors_preset(Control.PRESET_TOP_LEFT)
	story.position.x = FIRST_STORY_X + (index - 1) * STORY_SPACING
	story.position.y = 0
	story.size = Vector2(40, 40)

	# 创建BackNet
	var back_net = TextureRect.new()
	back_net.name = "BackNet"
	back_net.self_modulate.a = 0.0
	back_net.z_index = -1
	back_net.layout_mode = 1
	back_net.set_anchors_preset(Control.PRESET_TOP_LEFT)
	back_net.anchor_left = 8.78
	back_net.anchor_top = 9.3
	back_net.anchor_right = 8.78
	back_net.anchor_bottom = 9.3
	back_net.offset_left = -376.2
	back_net.offset_top = -324.0
	back_net.offset_right = 406.8
	back_net.offset_bottom = 351.0
	back_net.scale = Vector2(0.96, 0.96)
	back_net.mouse_filter = Control.MOUSE_FILTER_IGNORE
	back_net.texture = juqing_bottm_xian_texture
	story.add_child(back_net)

	# 创建Num节点（编号显示）
	var num = TextureRect.new()
	num.name = "Num"
	num.z_index = 0
	num.layout_mode = 0
	num.offset_left = 154.167
	num.offset_top = 285.417
	num.offset_right = 291.167
	num.offset_bottom = 367.417
	num.texture = storyui_connect_texture
	back_net.add_child(num)

	var label = Label.new()
	label.layout_mode = 0
	label.offset_left = 61.4583
	label.offset_top = 25.0
	label.offset_right = 97.4583
	label.offset_bottom = 61.0
	label.text = "%02d" % index
	# 创建并设置LabelSettings
	var label_settings = LabelSettings.new()
	var font_variation = FontVariation.new()
	font_variation.base_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	font_variation.variation_embolden = 0.8
	label_settings.font = font_variation
	label_settings.font_size = 29
	label.label_settings = label_settings
	num.add_child(label)

	# 创建TextureRect（显示mod图标）
	var texture_rect = TextureRect.new()
	texture_rect.name = "TextureRect"
	texture_rect.layout_mode = 0
	texture_rect.offset_left = 287.542
	texture_rect.offset_top = 249.583
	texture_rect.offset_right = 494.542
	texture_rect.offset_bottom = 427.583
	texture_rect.pivot_offset = Vector2(102.215, 91.565)

	# 使用mod图标或默认图标
	if mod_data.icon_texture:
		texture_rect.texture = mod_data.icon_texture
	else:
		# 使用默认图标（可以是一个占位符）
		pass

	back_net.add_child(texture_rect)

	# 创建TextureButton（点击按钮）
	var button = TextureButton.new()
	button.name = "TextureButton"
	button.show_behind_parent = true
	button.layout_mode = 0
	button.offset_left = -14.9999
	button.offset_top = -9.99997
	button.offset_right = 206.0
	button.offset_bottom = 204.0
	button.texture_normal = storyui_back_texture
	button.gui_input.connect(_on_button_input.bind(story))
	texture_rect.add_child(button)

	return story

# ==================== 初始化函数组 ====================
func _setup_back_area():
	if back_area and back_area is TextureButton:
		back_area.pressed.connect(_on_back_area_pressed)

func _setup_editor_button():
	if editor_button:
		var editor_enabled := PlatformCapabilities.shows_mod_editor_ui()
		editor_button.visible = editor_enabled
		editor_button.disabled = not editor_enabled
		if not editor_enabled:
			return
		editor_button.pressed.connect(_on_editor_button_pressed)

func _setup_manage_mods_button():
	if manage_mods_button:
		manage_mods_button.pressed.connect(_on_manage_mods_button_pressed)

func _setup_online_mods_button():
	if online_mods_button:
		online_mods_button.pressed.connect(_on_online_mods_button_pressed)

func _setup_login_button():
	if login_button:
		login_button.pressed.connect(_on_login_button_pressed)
		login_button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS

func _setup_auth_manager():
	if not has_node("/root/AuthManager"):
		return
	AuthManager.auth_state_changed.connect(_on_auth_state_changed)
	AuthManager.profile_changed.connect(_on_auth_profile_changed)
	_update_login_button()

func _init_background():
	if background_color:
		background_color.modulate.a = 0.0
		background_color.visible = false

# ==================== 输入事件处理组 ====================
func _on_editor_button_pressed():
	"""打开mod编辑器工程管理器"""
	if not PlatformCapabilities.shows_mod_editor_ui():
		return
	_open_project_manager()

func _on_manage_mods_button_pressed():
	"""打开模组管理器"""
	if _is_mod_manager_open or _is_online_mods_manager_open:
		return
	if is_animating or is_expanded:
		push_error("请先退出当前同人故事详情页，再打开“管理模组”。")
		return
	_open_mod_manager()

func _on_online_mods_button_pressed():
	"""打开在线模组下载窗口"""
	if _is_mod_manager_open or _is_online_mods_manager_open:
		return
	if is_animating or is_expanded:
		push_error("请先退出当前同人故事详情页，再打开“在线模组”。")
		return
	_open_online_mods_manager()

func _on_login_button_pressed():
	"""打开账号登录/注册窗口"""
	_open_auth_dialog()

func _open_auth_dialog():
	if _is_auth_dialog_open:
		return
	if is_animating or is_expanded:
		push_error("请先退出当前同人故事详情页，再打开“登录”。")
		return

	var auth_scene = load(AUTH_DIALOG_SCENE_PATH)
	if not auth_scene:
		push_error("无法加载登录窗口场景: " + AUTH_DIALOG_SCENE_PATH)
		return

	var auth_dialog = auth_scene.instantiate()
	_is_auth_dialog_open = true
	is_dragging = false
	drag_velocity = 0.0

	auth_dialog.tree_exited.connect(func():
		_is_auth_dialog_open = false
		_update_login_button()
	)

	if auth_dialog is Control:
		auth_dialog.z_index = 2000
		auth_dialog.mouse_filter = Control.MOUSE_FILTER_STOP

	get_parent().add_child(auth_dialog)
	get_parent().move_child(auth_dialog, get_parent().get_child_count() - 1)

func _on_auth_state_changed(_is_logged_in: bool) -> void:
	_update_login_button()
	_warmup_online_mods_cache()

func _on_auth_profile_changed(_profile: Dictionary) -> void:
	_update_login_button()
	_warmup_online_mods_cache()

func _warmup_online_mods_cache() -> void:
	if not has_node("/root/AuthManager"):
		return
	# Let warmup_public_mods handle token refresh/login state internally.
	ONLINE_MODS_MANAGER_SCRIPT.warmup_public_mods(self, "new")

func _update_login_button() -> void:
	if not login_button:
		return
	if not has_node("/root/AuthManager"):
		login_button.text = "登录"
		return

	if AuthManager.is_logged_in():
		var mail := str(AuthManager.email)
		login_button.text = mail if mail != "" else "已登录"
	else:
		login_button.text = "登录"

func _open_project_manager():
	"""加载并显示工程管理器"""
	if _is_project_manager_open:
		return

	# 确保mod工程文件夹存在
	var dir = DirAccess.open("user://")
	if not dir.dir_exists("mod_projects"):
		dir.make_dir("mod_projects")
		print("创建mod工程文件夹: user://mod_projects")

	# 加载工程管理器场景
	var project_manager_scene = load(PROJECT_MANAGER_SCENE_PATH)
	if not project_manager_scene:
		push_error("无法加载工程管理器场景: " + PROJECT_MANAGER_SCENE_PATH)
		return

	# 实例化并添加到场景树
	var project_manager = project_manager_scene.instantiate()
	_is_project_manager_open = true
	is_dragging = false
	drag_velocity = 0.0
	project_manager.tree_exited.connect(func():
		_is_project_manager_open = false
		_reload_mods_and_story_nodes()
	)
	if project_manager is Control:
		project_manager.z_index = 2000
		project_manager.mouse_filter = Control.MOUSE_FILTER_STOP
	get_parent().add_child(project_manager)
	get_parent().move_child(project_manager, get_parent().get_child_count() - 1)

func _open_mod_manager():
	"""加载并显示模组管理器"""
	var mod_manager_scene = load(MOD_MANAGER_SCENE_PATH)
	if not mod_manager_scene:
		push_error("无法加载模组管理器场景: " + MOD_MANAGER_SCENE_PATH)
		return

	var mod_manager = mod_manager_scene.instantiate()
	_is_mod_manager_open = true
	is_dragging = false
	drag_velocity = 0.0

	mod_manager.tree_exited.connect(func():
		_is_mod_manager_open = false
		_reload_mods_and_story_nodes()
	)

	if mod_manager is Control:
		mod_manager.z_index = 2000
		mod_manager.mouse_filter = Control.MOUSE_FILTER_STOP

	get_parent().add_child(mod_manager)
	get_parent().move_child(mod_manager, get_parent().get_child_count() - 1)


func _open_online_mods_manager():
	"""加载并显示在线模组管理器"""
	var online_scene = load(ONLINE_MODS_MANAGER_SCENE_PATH)
	if not online_scene:
		push_error("无法加载在线模组场景: " + ONLINE_MODS_MANAGER_SCENE_PATH)
		return

	var online_manager = online_scene.instantiate()
	_is_online_mods_manager_open = true
	is_dragging = false
	drag_velocity = 0.0

	online_manager.tree_exited.connect(func():
		_is_online_mods_manager_open = false
		_reload_mods_and_story_nodes()
	)

	if online_manager is Control:
		online_manager.z_index = 2000
		online_manager.mouse_filter = Control.MOUSE_FILTER_STOP

	get_parent().add_child(online_manager)
	get_parent().move_child(online_manager, get_parent().get_child_count() - 1)

func _reload_mods_and_story_nodes():
	# 管理模组关闭后刷新同人列表
	if is_animating or is_expanded:
		return

	for node in story_nodes:
		if is_instance_valid(node):
			node.queue_free()
	story_nodes.clear()
	loaded_mods.clear()
	_load_mods()
	_create_story_nodes()

func _on_back_area_pressed():
	if not (is_expanded and not is_animating and back_button_enabled):
		return

	if episode_list_instance:
		_start_concurrent_exit_animations()
	else:
		restore_selected_story()

func _start_concurrent_exit_animations():
	if not episode_list_instance:
		return

	if not episode_list_instance.is_connected("exit_animation_started", _on_episode_exit_started):
		episode_list_instance.exit_animation_started.connect(_on_episode_exit_started)

	if episode_list_instance.has_method("play_exit_animation"):
		episode_list_instance.play_exit_animation()
	restore_selected_story()

func _on_episode_exit_started():
	episode_list_instance = null
	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if main_menu and main_menu.has_node("SettingsButton"):
		main_menu.get_node("SettingsButton").disabled = false

func _handle_drag_input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			drag_start_pos = event.position
			drag_velocity = 0.0
		else:
			is_dragging = false
	elif event is InputEventMouseMotion and is_dragging:
		if event.position.distance_to(drag_start_pos) > CLICK_THRESHOLD:
			drag_velocity = event.relative.x
			_move_all_stories(drag_velocity)

func _on_button_input(event: InputEvent, story_node: Control):
	if is_expanded or is_animating:
		return

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			button_press_pos = event.position
		elif not event.pressed:
			if event.position.distance_to(button_press_pos) < CLICK_THRESHOLD:
				_start_expand_animation(story_node)

# ==================== 核心动画系统 ====================
func _start_expand_animation(story_node: Control):
	if is_animating or is_expanded:
		return

	var nodes = _get_story_nodes(story_node)
	if not nodes:
		return

	_set_selected_nodes(nodes, story_node)
	_init_animation_state()
	_cache_original_states(nodes)
	_prepare_animation_environment(story_node, nodes)
	_start_related_animations(story_node)

func _get_story_nodes(story_node: Control) -> Dictionary:
	var back_net = story_node.get_node_or_null("BackNet")
	var texture_rect = back_net.get_node_or_null("TextureRect") if back_net else null
	var num_node = back_net.get_node_or_null("Num") if back_net else null

	if not back_net or not texture_rect:
		push_error("无法找到故事节点的关键组件: " + story_node.name)
		return {}

	return {
		"back_net": back_net,
		"texture_rect": texture_rect,
		"num_node": num_node
	}

func _set_selected_nodes(nodes: Dictionary, story_node: Control):
	selected_back_net = nodes.back_net
	selected_texture_rect = nodes.texture_rect
	selected_num_node = nodes.num_node
	selected_story_node = story_node

func _init_animation_state():
	back_button_enabled = false
	is_animating = true
	is_dragging = false
	drag_velocity = 0.0
	animation_timer = 0.0

func _cache_original_states(nodes: Dictionary):
	var back_net = nodes.back_net
	var texture_rect = nodes.texture_rect
	var num_node = nodes.num_node

	animation_cache.original_position = back_net.global_position
	animation_cache.original_scale = texture_rect.scale
	animation_cache.original_modulate_alpha = back_net.self_modulate.a
	animation_cache.background_modulate_alpha = background_color.modulate.a if background_color else 0.0
	animation_cache.is_returning = false
	animation_cache.original_z_index = back_net.z_index

	animation_cache.true_original_position = back_net.global_position
	animation_cache.true_original_scale = texture_rect.scale

	if num_node:
		animation_cache.original_num_z_index = num_node.z_index
		animation_cache.original_num_position = num_node.position
		animation_cache.true_original_num_position = num_node.position

func _prepare_animation_environment(story_node: Control, nodes: Dictionary):
	var back_net = nodes.back_net
	var num_node = nodes.num_node

	selected_story_motion_vector = TARGET_POSITION - back_net.global_position

	if background_color:
		background_color.visible = true

	back_net.z_index = 2
	if num_node:
		num_node.z_index = 2

	var bg_index = background_color.get_index() if background_color else get_child_count()
	move_child(story_node, bg_index - 1)

func _start_related_animations(story_node: Control):
	_prepare_other_stories_animation(story_node)
	_start_black_transition_for_others(story_node)
	_collect_other_buttons(story_node)

# ==================== 其他故事动画管理 ====================
func _prepare_other_stories_animation(selected_story: Control):
	other_stories_data.clear()

	var current_back_net = selected_story.get_node("BackNet")
	var selected_pos = current_back_net.global_position

	for story_node in story_nodes:
		if story_node == selected_story:
			continue

		var back_net = story_node.get_node_or_null("BackNet")
		if back_net:
			var story_data = {
				"node": back_net,
				"original_position": back_net.global_position,
				"true_original_position": back_net.global_position,
				"to_selected_vector": selected_pos - back_net.global_position
			}
			other_stories_data.append(story_data)

func _update_other_stories_animation(_delta: float):
	var progress = animation_timer / ANIMATION_DURATION

	if not animation_cache.is_returning:
		var eased_progress = _ease_out_cubic(progress)

		for story_data in other_stories_data:
			var back_net = story_data.node
			if not back_net:
				continue

			var original_pos = story_data.original_position
			var shrink_movement = story_data.to_selected_vector * OTHER_STORY_SHRINK_FACTOR
			var follow_movement = selected_story_motion_vector * OTHER_STORY_FOLLOW_FACTOR
			var target_pos = original_pos + shrink_movement + follow_movement

			back_net.global_position = original_pos.lerp(target_pos, eased_progress)
	else:
		var eased_progress = _ease_out_cubic(progress)

		for story_data in other_stories_data:
			var back_net = story_data.node
			if not back_net:
				continue

			var current_pos = story_data.get("current_position", back_net.global_position)
			var original_pos = story_data.true_original_position
			back_net.global_position = current_pos.lerp(original_pos, eased_progress)

func _prepare_other_stories_return_animation():
	for story_data in other_stories_data:
		if story_data.node:
			story_data["current_position"] = story_data.node.global_position

func restore_selected_story():
	if not selected_back_net or not selected_texture_rect or is_animating:
		return

	back_button_enabled = false
	animation_cache.is_returning = true
	is_animating = true
	animation_timer = 0.0

	_cache_current_state_for_return()
	_prepare_other_stories_return_animation()
	_restore_other_stories_material()

func _cache_current_state_for_return():
	animation_cache.original_position = selected_back_net.global_position
	animation_cache.original_scale = selected_texture_rect.scale
	animation_cache.original_modulate_alpha = selected_back_net.self_modulate.a
	animation_cache.background_modulate_alpha = background_color.modulate.a if background_color else 0.0

	if selected_num_node:
		animation_cache.original_num_position = selected_num_node.position

# ==================== UI元素动画管理 ====================
func _collect_other_buttons(selected_story: Control):
	other_stories_buttons.clear()

	for story_node in story_nodes:
		if story_node != selected_story:
			var button = story_node.get_node_or_null("BackNet/TextureRect/TextureButton")
			if button:
				other_stories_buttons.append(button)

func _start_black_transition_for_others(selected_story: Control):
	other_stories_materials.clear()

	for story_node in story_nodes:
		if story_node != selected_story:
			var texture_rect = story_node.get_node_or_null("BackNet/TextureRect")
			if texture_rect:
				var shader_material = ShaderMaterial.new()
				shader_material.shader = black_transition_shader
				shader_material.set_shader_parameter("transition_progress", 0.0)
				shader_material.set_shader_parameter("edge_sharpness", 5.0)
				texture_rect.material = shader_material
				other_stories_materials.append(shader_material)

func _update_button_fade(_delta: float):
	var progress = animation_timer / ANIMATION_DURATION

	if not animation_cache.is_returning:
		if progress >= BUTTON_FADE_START:
			var fade_progress = (progress - BUTTON_FADE_START) / (1.0 - BUTTON_FADE_START)
			var fade_alpha = 1.0 - _ease_out_quad(fade_progress)
			_update_buttons_alpha(fade_alpha)
	else:
		var restore_alpha = _ease_out_quad(progress)
		_update_buttons_alpha(restore_alpha)

func _update_buttons_alpha(alpha: float):
	for button in other_stories_buttons:
		if button:
			button.visible = alpha > 0.01
			button.modulate.a = alpha

func _update_black_transition(_delta: float):
	var progress = animation_timer / ANIMATION_DURATION

	if not animation_cache.is_returning:
		var eased_progress = _ease_out_quad(progress)
		for shader_mat in other_stories_materials:
			if shader_mat:
				shader_mat.set_shader_parameter("transition_progress", eased_progress)

# ==================== 主动画更新系统 ====================
func _update_animation(delta: float):
	if not selected_back_net or not selected_texture_rect:
		return

	animation_timer += delta
	var anim_params = _get_animation_parameters()

	if animation_timer < ANIMATION_DURATION:
		_apply_animation_interpolation(anim_params)
	else:
		_finalize_animation(anim_params)

func _get_animation_parameters() -> Dictionary:
	return {
		"from_pos": animation_cache.original_position,
		"to_pos": TARGET_POSITION if not animation_cache.is_returning else animation_cache.true_original_position,
		"from_scale": animation_cache.original_scale,
		"to_scale": Vector2(TARGET_SCALE, TARGET_SCALE) if not animation_cache.is_returning else animation_cache.true_original_scale,
		"from_alpha": animation_cache.original_modulate_alpha,
		"to_alpha": TARGET_MODULATE_ALPHA if not animation_cache.is_returning else 0.0,
		"from_bg_alpha": animation_cache.background_modulate_alpha,
		"to_bg_alpha": TARGET_MODULATE_ALPHA if not animation_cache.is_returning else 0.0,
		"from_num_pos": animation_cache.original_num_position,
		"to_num_pos": animation_cache.true_original_num_position + Vector2(-NUM_LEFT_OFFSET, 0) if not animation_cache.is_returning else animation_cache.true_original_num_position
	}

func _apply_animation_interpolation(params: Dictionary):
	var progress = animation_timer / ANIMATION_DURATION
	var eased_cubic = _ease_out_cubic(progress)
	var eased_quad = _ease_out_quad(progress)

	selected_back_net.global_position = params.from_pos.lerp(params.to_pos, eased_cubic)
	selected_texture_rect.scale = params.from_scale.lerp(params.to_scale, eased_quad)
	selected_back_net.self_modulate.a = lerpf(params.from_alpha, params.to_alpha, eased_cubic)

	if selected_num_node:
		var num_progress = clamp(progress - NUM_ANIMATION_DELAY, 0, 1) / (1 - NUM_ANIMATION_DELAY) if NUM_ANIMATION_DELAY < 1 else progress
		var num_eased = _ease_out_cubic(num_progress)
		selected_num_node.position = params.from_num_pos.lerp(params.to_num_pos, num_eased)

	if background_color:
		background_color.modulate.a = lerpf(params.from_bg_alpha, params.to_bg_alpha, eased_quad)

func _finalize_animation(params: Dictionary):
	selected_back_net.global_position = params.to_pos
	selected_texture_rect.scale = params.to_scale
	selected_back_net.self_modulate.a = params.to_alpha

	if selected_num_node:
		selected_num_node.position = params.to_num_pos

	if animation_cache.is_returning:
		_cleanup_return_animation()

	if background_color:
		background_color.modulate.a = params.to_bg_alpha
		if animation_cache.is_returning and params.to_bg_alpha == 0.0:
			background_color.visible = false

	is_animating = false
	is_expanded = not animation_cache.is_returning
	_on_animation_complete()

func _cleanup_return_animation():
	selected_back_net.z_index = -1

	if selected_num_node:
		selected_num_node.z_index = animation_cache.original_num_z_index

	_restore_all_buttons()

func _restore_all_buttons():
	for button in other_stories_buttons:
		if button:
			button.visible = true
			button.modulate.a = 1.0

func _restore_other_stories_material():
	for story_node in story_nodes:
		if story_node != selected_story_node:
			var texture_rect = story_node.get_node_or_null("BackNet/TextureRect")
			if texture_rect:
				var shader_material = texture_rect.material
				if shader_material and shader_material is ShaderMaterial:
					var tween = get_tree().create_tween()
					tween.tween_method(
						func(value): shader_material.set_shader_parameter("transition_progress", value),
						shader_material.get_shader_parameter("transition_progress"),
						0.0,
						ANIMATION_DURATION
					)
					tween.finished.connect(func(): texture_rect.material = null)

# ==================== 物理模拟 ====================
func _update_drag_physics():
	if not is_dragging:
		if abs(drag_velocity) > 0.1:
			drag_velocity *= FRICTION
			_move_all_stories(drag_velocity)

		# 边界检测和回弹
		if story_nodes.size() > 0:
			var first_story = story_nodes[0]
			var max_offset = -(story_nodes.size() - 1) * STORY_SPACING

			if first_story.position.x > 0:
				_move_all_stories(-first_story.position.x * BOUNDARY_SPRING)
			elif story_nodes.size() > 1 and first_story.position.x < max_offset:
				_move_all_stories((max_offset - first_story.position.x) * BOUNDARY_SPRING)

func _move_all_stories(offset: float):
	for story_node in story_nodes:
		story_node.position.x += offset

# ==================== 工具函数 ====================
func _ease_out_quad(t: float) -> float:
	return 1.0 - pow(1.0 - t, 2.0)

func _ease_out_cubic(t: float) -> float:
	return 1.0 - pow(1.0 - t, 3.0)

func _on_animation_complete():
	print("Dojin动画完成")
	print("Is expanded: ", is_expanded)

	if not animation_cache.is_returning and is_expanded:
		_load_episode_list()
		get_tree().create_timer(BACK_BUTTON_DELAY).timeout.connect(func(): back_button_enabled = true)
	else:
		back_button_enabled = false

# ==================== 场景加载 ====================
func _load_episode_list():
	if not selected_story_node:
		return

	# 获取mod索引
	var story_index = story_nodes.find(selected_story_node)
	if story_index < 0 or story_index >= loaded_mods.size():
		push_error("无法找到对应的mod数据")
		return

	var mod_data = loaded_mods[story_index]
	print("加载mod剧集列表: " + mod_data.folder_name)

	# 加载剧集列表场景
	var episode_scene = load(EPISODE_LIST_SCENE_PATH)
	if not episode_scene:
		push_error("无法加载场景: " + EPISODE_LIST_SCENE_PATH)
		return

	# 实例化场景
	episode_list_instance = episode_scene.instantiate()
	episode_list_instance.z_index = max(10, (background_color.z_index + 2) if background_color else 10)
	episode_list_instance.mouse_filter = Control.MOUSE_FILTER_STOP

	# 将场景添加到当前场景树（确保在最上层）
	add_child(episode_list_instance)
	move_child(episode_list_instance, get_child_count() - 1)

	# 使用set_mod_story方法设置mod数据
	var mod_title = mod_data.config.get("title", "未命名mod")
	var episodes = mod_data.config.get("episodes", {})
	var mod_path = mod_data.mod_path

	if episode_list_instance.has_method("set_mod_story"):
		episode_list_instance.set_mod_story(mod_title, episodes, mod_path)
	else:
		push_error("episode_list没有set_mod_story方法")

	# 禁用设置按钮
	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if main_menu and main_menu.has_node("SettingsButton"):
		main_menu.get_node("SettingsButton").disabled = true

	print("成功加载mod剧集列表: ", mod_title)
