extends Control

signal back_pressed

# 分辨率列表（16:9比例）
const RESOLUTIONS_16_9 = [
	Vector2i(1920, 1080),
	Vector2i(1680, 945),
	Vector2i(1600, 900),
	Vector2i(1366, 768),
	Vector2i(1280, 720),
	Vector2i(960, 540),
	Vector2i(854, 480)
]

@onready var borderless_btn = $MainPanel/ContentArea/SettingsContent/HBoxContainer/DisplaySettings/ModeButtons/BorderlessBtn
@onready var windowed_btn = $MainPanel/ContentArea/SettingsContent/HBoxContainer/DisplaySettings/ModeButtons/WindowedBtn
@onready var screen_list = $MainPanel/ContentArea/SettingsContent/HBoxContainer/DisplaySettings/ScreenList
@onready var resolution_list = $MainPanel/ContentArea/SettingsContent/HBoxContainer/DisplaySettings/ResolutionList
@onready var master_volume_slider = $MainPanel/ContentArea/SettingsContent/HBoxContainer/AudioSettings/MasterVolumeSlider
@onready var music_volume_slider = $MainPanel/ContentArea/SettingsContent/HBoxContainer/AudioSettings/MusicVolumeSlider
@onready var sfx_volume_slider = $MainPanel/ContentArea/SettingsContent/HBoxContainer/AudioSettings/SFXVolumeSlider

# 面板节点
@onready var settings_content = $MainPanel/ContentArea/SettingsContent
@onready var thanks_content = $MainPanel/ContentArea/ThanksContent

@onready var credits_contributors_grid: HBoxContainer = $MainPanel/ContentArea/ThanksContent/VBoxContainer/ContributorsGrid
@onready var credits_thanks_grid: HBoxContainer = $MainPanel/ContentArea/ThanksContent/VBoxContainer/ThanksGrid
@onready var credit_card_template: VBoxContainer = $CreditCardTemplate
@onready var qq_group_label: Label = $MainPanel/ContentArea/ThanksContent/VBoxContainer/QQGroupLabel

# 按钮节点
@onready var setting_button = $MainPanel/SidePanel/VBoxContainer/SettingButton
@onready var thanks_button = $MainPanel/SidePanel/VBoxContainer/ThanksButton
@onready var user_menu_button: TextureButton = $UserMenuButton
@onready var user_menu_bg: TextureRect = $UserMenuButton/AvatarBackground
@onready var user_menu_icon: TextureRect = $UserMenuButton/AvatarIcon

# 按钮纹理资源
var setting_idle_texture: Texture2D
var setting_clicked_texture: Texture2D
var thanks_idle_texture: Texture2D
var thanks_clicked_texture: Texture2D

var _avatar_runtime_override_enabled: bool = false
var _avatar_runtime_icon_id: int = 1
var _avatar_runtime_bg_id: int = 1

var _avatar_picker_overlay: ColorRect = null
var _avatar_picker_panel: PanelContainer = null
var _avatar_picker_bg_option: ItemList = null
var _avatar_picker_icon_option: ItemList = null
var _avatar_picker_preview_bg: TextureRect = null
var _avatar_picker_preview_icon: TextureRect = null
var _avatar_picker_apply_button: Button = null
var _avatar_picker_cancel_button: Button = null
var _avatar_picker_selected_bg_id: int = 1
var _avatar_picker_selected_icon_id: int = 1
var _avatar_picker_bg_ids: Array[int] = []
var _avatar_picker_icon_ids: Array[int] = []
var _is_auth_dialog_open: bool = false
var _avatar_picker_options_loading: bool = false
var _profile_refresh_in_flight: bool = false
var _avatar_picker_dialog_open: bool = false
var _ui_font: FontFile = null

# 当前选择的屏幕索引
var current_screen: int = 0
# 窗口模式下的分辨率（不包括无边框全屏）
var windowed_resolution: Vector2i = Vector2i(1280, 720)
# 窗口顶部最小边距（确保标题栏可见）
const MIN_TOP_MARGIN: int = 50
const USER_MENU_BG_PATH: String = "res://assets/gui/settings/Menu.png"
const USER_AVATAR_BACKGROUND_DIR: String = "res://assets/gui/useravatar/background"
const USER_AVATAR_ICON_DIR: String = "res://assets/gui/useravatar/icon"
const USER_AVATAR_DEFAULT_ID: int = 1
const USER_AVATAR_DEFAULT_BG_ID: int = 1
const USER_AVATAR_MAX_ID: int = 47
const USER_AVATAR_BG_MAX_ID: int = 20
const USER_AVATAR_SLOT_CENTER: Vector2 = Vector2(42, 42)
const USER_AVATAR_BG_BASE_SIZE: Vector2 = Vector2(44, 44)
const USER_AVATAR_BG_SCALE: float = 1.575
const USER_AVATAR_ICON_SCALE: float = 1.575
const AUTH_DIALOG_SCENE_PATH: String = "res://scenes/main/auth_dialog.tscn"
const AVATAR_PICKER_DIALOG_SCENE_PATH: String = "res://scenes/setting/avatar_picker_dialog.tscn"
const USER_UI_FONT_PATH: String = "res://assets/gui/font/方正粗圆_GBK.ttf"

# 致谢页数据（数据驱动生成）
const CREDITS_CONTRIBUTORS: Array[Dictionary] = [
	{"id": "yang", "name": "YANG-301", "desc": "游戏主程序", "texture": "res://assets/gui/settings/credits/YANG-301.webp", "url": "https://space.bilibili.com/157725171"},
	{"id": "fusu", "name": "不死扶苏233", "desc": "测试与脚本编写", "texture": "res://assets/gui/settings/credits/不死扶苏233.webp", "url": "https://space.bilibili.com/364706064"},
	{"id": "projektming", "name": "ProjektMing", "desc": "Github贡献", "texture": "res://assets/gui/settings/credits/projektming.jpg", "url": "https://github.com/ProjektMing"},
	{"id": "basket_ball", "name": "basket_ball", "desc": "安全性测试", "texture": "res://assets/gui/settings/credits/basket_ball.png", "url": "https://github.com/basket-ball"},
	{"id": "baizhu", "name": "白烛Official", "desc": "多语言支持", "texture": "res://assets/gui/settings/credits/baizhu_official.jpg", "url": "https://space.bilibili.com/3546683193428662"},
]

const CREDITS_SPECIAL_THANKS: Array[Dictionary] = [
	{"id": "sakura", "name": "樱天澈", "desc": "", "texture": "res://assets/gui/settings/credits/樱天澈.webp", "url": "https://space.bilibili.com/28626"},
	{"id": "snow", "name": "雪凌殇", "desc": "", "texture": "res://assets/gui/settings/credits/雪凌殇.webp", "url": "https://space.bilibili.com/6105216"},
	{"id": "lazy", "name": "见习食神懒羊羊", "desc": "", "texture": "res://assets/gui/settings/credits/见习食神懒羊羊.webp", "url": "https://space.bilibili.com/274983449"},
]


func _ready():
	# 加载按钮纹理资源
	setting_idle_texture = load("res://assets/gui/settings/setting_idle.png")
	setting_clicked_texture = load("res://assets/gui/settings/setting_clicked.png")
	thanks_idle_texture = load("res://assets/gui/settings/thanks_idle.png")
	thanks_clicked_texture = load("res://assets/gui/settings/thanks_clicked.png")
	_ui_font = load(USER_UI_FONT_PATH)
	_apply_user_menu_base_texture()
	_refresh_user_menu_avatar_preview()
	call_deferred("_apply_user_avatar_icon_layout")
	if user_menu_button != null and not user_menu_button.resized.is_connected(_on_user_menu_button_resized):
		user_menu_button.resized.connect(_on_user_menu_button_resized)
	if not resized.is_connected(_on_settings_resized):
		resized.connect(_on_settings_resized)
	if user_menu_bg != null:
		user_menu_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if user_menu_icon != null:
		user_menu_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# 初始化屏幕列表
	_populate_screen_list()

	# 加载保存的设置（包括屏幕、分辨率等）
	_load_settings()

	# 初始化分辨率列表（需要在加载设置后，因为要知道保存的窗口分辨率）
	_populate_resolution_list()

	# 设置初始窗口模式按钮状态
	_update_window_mode_buttons()

	# 默认显示设置页面
	_show_settings_page()
	if qq_group_label != null:
		qq_group_label.text = "QQ群：1078249413  魔女兵器编辑器测试群"
	if has_node("/root/AuthManager") and not AuthManager.profile_changed.is_connected(_on_auth_profile_changed):
		AuthManager.profile_changed.connect(_on_auth_profile_changed)
	if has_node("/root/AuthManager") and not AuthManager.auth_state_changed.is_connected(_on_auth_state_changed):
		AuthManager.auth_state_changed.connect(_on_auth_state_changed)
	if user_menu_button != null and not user_menu_button.gui_input.is_connected(_on_user_menu_button_gui_input):
		user_menu_button.gui_input.connect(_on_user_menu_button_gui_input)

	_rebuild_credits_ui()

func _unhandled_input(event: InputEvent) -> void:
	if _avatar_picker_overlay == null or not _avatar_picker_overlay.visible:
		return
	if event.is_action_pressed("ui_cancel"):
		_avatar_picker_overlay.visible = false
		get_viewport().set_input_as_handled()

func _apply_user_menu_base_texture() -> void:
	if user_menu_button == null:
		return
	var menu_texture: Texture2D = _load_image_texture(USER_MENU_BG_PATH)
	if menu_texture == null:
		return
	user_menu_button.texture_normal = menu_texture
	user_menu_button.texture_hover = menu_texture
	user_menu_button.texture_pressed = menu_texture

func _on_user_menu_button_resized() -> void:
	_apply_user_avatar_icon_layout()

func _apply_user_avatar_icon_layout() -> void:
	if user_menu_bg == null or user_menu_icon == null:
		return

	var bg_size: Vector2 = USER_AVATAR_BG_BASE_SIZE * USER_AVATAR_BG_SCALE
	var bg_pos: Vector2 = USER_AVATAR_SLOT_CENTER - bg_size * 0.5
	user_menu_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	user_menu_bg.size = bg_size
	user_menu_bg.position = bg_pos

	var icon_size: Vector2 = USER_AVATAR_BG_BASE_SIZE * USER_AVATAR_ICON_SCALE
	user_menu_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	user_menu_icon.size = icon_size
	user_menu_icon.position = USER_AVATAR_SLOT_CENTER - icon_size * 0.5

func _refresh_user_menu_avatar_preview() -> void:
	if user_menu_button == null:
		return

	var avatar_id: int = _read_profile_int("avatar_id", USER_AVATAR_DEFAULT_ID, 1, USER_AVATAR_MAX_ID)
	var avatar_bg_id: int = _read_profile_int("avatar_background_id", USER_AVATAR_DEFAULT_BG_ID, 1, USER_AVATAR_BG_MAX_ID)

	var bg_path: String = "%s/%s.png" % [USER_AVATAR_BACKGROUND_DIR, _avatar_id_to_name(avatar_bg_id)]
	var icon_path: String = "%s/%s.png" % [USER_AVATAR_ICON_DIR, _avatar_id_to_name(avatar_id)]

	var bg_texture: Texture2D = _load_image_texture(bg_path)
	if user_menu_bg != null:
		user_menu_bg.texture = bg_texture

	if user_menu_icon == null:
		return

	var icon_texture: Texture2D = _load_image_texture(icon_path)
	user_menu_icon.texture = icon_texture
	_apply_user_avatar_icon_layout()

func _read_profile_int(key: String, fallback: int, min_value: int, max_value: int) -> int:
	if _avatar_runtime_override_enabled:
		if key == "avatar_id":
			return clampi(_avatar_runtime_icon_id, min_value, max_value)
		if key == "avatar_background_id":
			return clampi(_avatar_runtime_bg_id, min_value, max_value)

	if has_node("/root/AuthManager") and AuthManager.has_method("is_logged_in") and not AuthManager.is_logged_in():
		# If a refresh token exists, keep showing cached profile values while auto-refresh runs.
		if not (AuthManager.has_method("has_session") and AuthManager.has_session()):
			return clampi(fallback, min_value, max_value)

	var profile_dict: Dictionary = {}
	if has_node("/root/AuthManager"):
		profile_dict = AuthManager.profile

	var value_any: Variant = profile_dict.get(key, null)
	if typeof(value_any) == TYPE_NIL and typeof(profile_dict.get("profile_data", null)) == TYPE_DICTIONARY:
		var profile_data: Dictionary = profile_dict.get("profile_data", {}) as Dictionary
		value_any = profile_data.get(key, null)
	if typeof(value_any) == TYPE_NIL:
		value_any = fallback

	var value: int = int(value_any)
	return clampi(value, min_value, max_value)

func _avatar_id_to_name(id: int) -> String:
	return "%03d" % id

func _load_image_texture(path: String) -> Texture2D:
	var res_any: Variant = load(path)
	if res_any is Texture2D:
		return res_any as Texture2D

	if not FileAccess.file_exists(path):
		return null
	var image: Image = Image.load_from_file(path)
	if image == null or image.is_empty():
		return null
	return ImageTexture.create_from_image(image)

func _on_auth_profile_changed(_profile: Dictionary) -> void:
	_avatar_runtime_override_enabled = false
	_refresh_user_menu_avatar_preview()

func _on_auth_state_changed(is_logged_in: bool) -> void:
	if not is_logged_in:
		_avatar_runtime_override_enabled = false
		_refresh_user_menu_avatar_preview()
		return
	call_deferred("_fetch_profile_and_refresh_avatar")

func _fetch_profile_and_refresh_avatar() -> void:
	if _profile_refresh_in_flight:
		return
	_profile_refresh_in_flight = true
	if has_node("/root/AuthManager") and AuthManager.has_method("fetch_profile"):
		await AuthManager.fetch_profile()
	_profile_refresh_in_flight = false
	_refresh_user_menu_avatar_preview()

func _ensure_avatar_picker_ui() -> void:
	if _avatar_picker_overlay != null:
		return

	_avatar_picker_overlay = ColorRect.new()
	_avatar_picker_overlay.visible = false
	_avatar_picker_overlay.anchors_preset = PRESET_FULL_RECT
	_avatar_picker_overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	_avatar_picker_overlay.color = Color(0, 0, 0, 0.55)
	_avatar_picker_overlay.z_index = 2300
	_avatar_picker_overlay.gui_input.connect(_on_avatar_picker_overlay_gui_input)
	add_child(_avatar_picker_overlay)

	_avatar_picker_panel = PanelContainer.new()
	_avatar_picker_panel.custom_minimum_size = Vector2(620, 340)
	_avatar_picker_panel.anchors_preset = PRESET_TOP_LEFT
	_avatar_picker_panel.size = _avatar_picker_panel.custom_minimum_size
	_avatar_picker_panel.clip_contents = true
	var panel_style: StyleBoxFlat = StyleBoxFlat.new()
	panel_style.bg_color = Color(0.16, 0.16, 0.16, 0.95)
	panel_style.border_width_left = 1
	panel_style.border_width_top = 1
	panel_style.border_width_right = 1
	panel_style.border_width_bottom = 1
	panel_style.border_color = Color(1, 1, 1, 0.1)
	panel_style.corner_radius_top_left = 14
	panel_style.corner_radius_top_right = 14
	panel_style.corner_radius_bottom_right = 14
	panel_style.corner_radius_bottom_left = 14
	_avatar_picker_panel.add_theme_stylebox_override("panel", panel_style)
	_avatar_picker_overlay.add_child(_avatar_picker_panel)

	var margin: MarginContainer = MarginContainer.new()
	margin.anchors_preset = PRESET_FULL_RECT
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_top", 16)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_bottom", 16)
	_avatar_picker_panel.add_child(margin)

	var root: VBoxContainer = VBoxContainer.new()
	root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_theme_constant_override("separation", 12)
	margin.add_child(root)

	var header: HBoxContainer = HBoxContainer.new()
	header.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_theme_constant_override("separation", 8)
	root.add_child(header)

	var title: Label = Label.new()
	title.text = "切换头像与背景"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.add_theme_font_override("font", _ui_font)
	title.add_theme_font_size_override("font_size", 24)
	title.add_theme_color_override("font_color", Color(1, 1, 1, 1))
	header.add_child(title)

	var close_button: Button = Button.new()
	close_button.text = "关闭"
	close_button.custom_minimum_size = Vector2(96, 34)
	close_button.add_theme_font_override("font", _ui_font)
	close_button.add_theme_font_size_override("font_size", 18)
	close_button.size_flags_horizontal = Control.SIZE_SHRINK_END
	close_button.pressed.connect(func():
		if _avatar_picker_overlay != null:
			_avatar_picker_overlay.visible = false
	)
	header.add_child(close_button)

	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)

	var content: HBoxContainer = HBoxContainer.new()
	content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	content.size_flags_vertical = Control.SIZE_EXPAND_FILL
	content.add_theme_constant_override("separation", 18)
	scroll.add_child(content)

	var preview_wrap: CenterContainer = CenterContainer.new()
	preview_wrap.custom_minimum_size = Vector2(190, 0)
	content.add_child(preview_wrap)

	var preview_button: TextureButton = TextureButton.new()
	preview_button.custom_minimum_size = Vector2(122, 84)
	preview_button.texture_normal = _load_image_texture(USER_MENU_BG_PATH)
	preview_button.texture_hover = preview_button.texture_normal
	preview_button.texture_pressed = preview_button.texture_normal
	preview_wrap.add_child(preview_button)

	_avatar_picker_preview_bg = TextureRect.new()
	_avatar_picker_preview_bg.position = Vector2(7.35, 7.35)
	_avatar_picker_preview_bg.size = Vector2(69.3, 69.3)
	_avatar_picker_preview_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_avatar_picker_preview_bg.stretch_mode = TextureRect.STRETCH_SCALE
	preview_button.add_child(_avatar_picker_preview_bg)

	_avatar_picker_preview_icon = TextureRect.new()
	_avatar_picker_preview_icon.position = Vector2(7.35, 7.35)
	_avatar_picker_preview_icon.size = Vector2(69.3, 69.3)
	_avatar_picker_preview_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_avatar_picker_preview_icon.stretch_mode = TextureRect.STRETCH_SCALE
	preview_button.add_child(_avatar_picker_preview_icon)

	var form: VBoxContainer = VBoxContainer.new()
	form.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	form.size_flags_vertical = Control.SIZE_EXPAND_FILL
	form.add_theme_constant_override("separation", 12)
	content.add_child(form)

	var bg_label: Label = Label.new()
	bg_label.text = "背景列表"
	bg_label.add_theme_font_override("font", _ui_font)
	bg_label.add_theme_font_size_override("font_size", 18)
	bg_label.add_theme_color_override("font_color", Color(1, 1, 1, 0.9))
	form.add_child(bg_label)

	_avatar_picker_bg_option = ItemList.new()
	_avatar_picker_bg_option.icon_mode = ItemList.ICON_MODE_TOP
	_avatar_picker_bg_option.fixed_icon_size = Vector2i(48, 48)
	_avatar_picker_bg_option.max_columns = 10
	_avatar_picker_bg_option.same_column_width = true
	_avatar_picker_bg_option.select_mode = ItemList.SELECT_SINGLE
	_avatar_picker_bg_option.custom_minimum_size = Vector2(0, 90)
	_avatar_picker_bg_option.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	_avatar_picker_bg_option.add_theme_font_override("font", _ui_font)
	_avatar_picker_bg_option.add_theme_font_size_override("font_size", 14)
	_avatar_picker_bg_option.add_theme_color_override("font_color", Color(1, 1, 1, 0.9))
	_avatar_picker_bg_option.add_theme_color_override("font_selected_color", Color(1, 1, 1, 1))
	_avatar_picker_bg_option.add_theme_color_override("selection_color", Color(0.25, 0.5, 0.9, 0.55))
	_avatar_picker_bg_option.item_selected.connect(_on_avatar_picker_bg_selected)
	form.add_child(_avatar_picker_bg_option)

	var icon_label: Label = Label.new()
	icon_label.text = "头像列表"
	icon_label.add_theme_font_override("font", _ui_font)
	icon_label.add_theme_font_size_override("font_size", 18)
	icon_label.add_theme_color_override("font_color", Color(1, 1, 1, 0.9))
	form.add_child(icon_label)

	_avatar_picker_icon_option = ItemList.new()
	_avatar_picker_icon_option.icon_mode = ItemList.ICON_MODE_TOP
	_avatar_picker_icon_option.fixed_icon_size = Vector2i(48, 48)
	_avatar_picker_icon_option.max_columns = 10
	_avatar_picker_icon_option.same_column_width = true
	_avatar_picker_icon_option.select_mode = ItemList.SELECT_SINGLE
	_avatar_picker_icon_option.custom_minimum_size = Vector2(0, 90)
	_avatar_picker_icon_option.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	_avatar_picker_icon_option.add_theme_font_override("font", _ui_font)
	_avatar_picker_icon_option.add_theme_font_size_override("font_size", 14)
	_avatar_picker_icon_option.add_theme_color_override("font_color", Color(1, 1, 1, 0.9))
	_avatar_picker_icon_option.add_theme_color_override("font_selected_color", Color(1, 1, 1, 1))
	_avatar_picker_icon_option.add_theme_color_override("selection_color", Color(0.25, 0.5, 0.9, 0.55))
	_avatar_picker_icon_option.item_selected.connect(_on_avatar_picker_icon_selected)
	form.add_child(_avatar_picker_icon_option)

	var hint: Label = Label.new()
	hint.text = "点击图标预览，点“保存”生效（Esc/点空白关闭）"
	hint.add_theme_font_override("font", _ui_font)
	hint.add_theme_font_size_override("font_size", 16)
	hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.7))
	hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	hint.modulate = Color(1, 1, 1, 0.7)
	form.add_child(hint)

	var footer: HBoxContainer = HBoxContainer.new()
	footer.add_theme_constant_override("separation", 10)
	footer.size_flags_vertical = Control.SIZE_SHRINK_END
	root.add_child(footer)

	var spacer: Control = Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	footer.add_child(spacer)

	_avatar_picker_cancel_button = Button.new()
	_avatar_picker_cancel_button.text = "取消"
	_avatar_picker_cancel_button.custom_minimum_size = Vector2(120, 34)
	_avatar_picker_cancel_button.add_theme_font_override("font", _ui_font)
	_avatar_picker_cancel_button.add_theme_font_size_override("font_size", 18)
	_avatar_picker_cancel_button.pressed.connect(_on_avatar_picker_cancel_pressed)
	footer.add_child(_avatar_picker_cancel_button)

	_avatar_picker_apply_button = Button.new()
	_avatar_picker_apply_button.text = "保存"
	_avatar_picker_apply_button.custom_minimum_size = Vector2(120, 34)
	_avatar_picker_apply_button.add_theme_font_override("font", _ui_font)
	_avatar_picker_apply_button.add_theme_font_size_override("font_size", 18)
	_avatar_picker_apply_button.pressed.connect(_on_avatar_picker_apply_pressed)
	footer.add_child(_avatar_picker_apply_button)

	_avatar_picker_bg_ids = _load_local_avatar_ids(USER_AVATAR_BACKGROUND_DIR, USER_AVATAR_BG_MAX_ID)
	_avatar_picker_icon_ids = _load_local_avatar_ids(USER_AVATAR_ICON_DIR, USER_AVATAR_MAX_ID)
	_populate_avatar_picker_options()
	call_deferred("_center_avatar_picker_panel")

func _build_default_id_list(max_count: int) -> Array[int]:
	var out: Array[int] = []
	for i in range(1, max_count + 1):
		out.append(i)
	return out

func _load_local_avatar_ids(dir_path: String, max_count: int) -> Array[int]:
	var ids: Array[int] = []
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		return _build_default_id_list(max_count)
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir() and file_name.to_lower().ends_with(".png"):
			var base: String = file_name.get_basename()
			if base.is_valid_int():
				var id_value: int = int(base)
				if id_value >= 1 and id_value <= max_count and not ids.has(id_value):
					ids.append(id_value)
		file_name = dir.get_next()
	dir.list_dir_end()
	ids.sort()
	if ids.is_empty():
		return _build_default_id_list(max_count)
	return ids

func _populate_avatar_picker_options() -> void:
	if _avatar_picker_bg_option == null or _avatar_picker_icon_option == null:
		return

	_avatar_picker_bg_option.clear()
	for id_value in _avatar_picker_bg_ids:
		var bg_path: String = "%s/%s.png" % [USER_AVATAR_BACKGROUND_DIR, _avatar_id_to_name(id_value)]
		var bg_tex: Texture2D = _load_image_texture(bg_path)
		var label_text: String = "背景 %d" % id_value
		_avatar_picker_bg_option.add_item(label_text, bg_tex)
		_avatar_picker_bg_option.set_item_metadata(_avatar_picker_bg_option.get_item_count() - 1, id_value)

	_avatar_picker_icon_option.clear()
	for id_value in _avatar_picker_icon_ids:
		var icon_path: String = "%s/%s.png" % [USER_AVATAR_ICON_DIR, _avatar_id_to_name(id_value)]
		var icon_tex: Texture2D = _load_image_texture(icon_path)
		var label_text: String = "头像 %d" % id_value
		_avatar_picker_icon_option.add_item(label_text, icon_tex)
		_avatar_picker_icon_option.set_item_metadata(_avatar_picker_icon_option.get_item_count() - 1, id_value)

func _on_user_menu_button_gui_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton):
		return
	var mouse_event: InputEventMouseButton = event as InputEventMouseButton
	if not mouse_event.pressed or mouse_event.button_index != MOUSE_BUTTON_LEFT:
		return

	if not _is_user_logged_in():
		_open_auth_dialog_from_settings()
		get_viewport().set_input_as_handled()
		return

	var local_pos: Vector2 = mouse_event.position
	var avatar_rect: Rect2 = Rect2(Vector2.ZERO, Vector2.ZERO)
	if user_menu_bg != null:
		avatar_rect = Rect2(user_menu_bg.position, user_menu_bg.size)

	if avatar_rect.has_point(local_pos):
		_on_user_menu_button_pressed()
	else:
		_open_auth_dialog_from_settings()

	get_viewport().set_input_as_handled()

func _is_user_logged_in() -> bool:
	if not has_node("/root/AuthManager"):
		return false
	if AuthManager.has_method("is_logged_in") and AuthManager.is_logged_in():
		return true
	return AuthManager.has_method("has_session") and AuthManager.has_session()

func _open_auth_dialog_from_settings() -> void:
	if _is_auth_dialog_open:
		return

	var auth_scene: PackedScene = load(AUTH_DIALOG_SCENE_PATH)
	if auth_scene == null:
		push_error("无法加载登录窗口场景: " + AUTH_DIALOG_SCENE_PATH)
		return

	var auth_dialog: Node = auth_scene.instantiate()
	_is_auth_dialog_open = true
	auth_dialog.tree_exited.connect(func():
		_is_auth_dialog_open = false
		_refresh_user_menu_avatar_preview()
	)
	if auth_dialog is Control:
		(auth_dialog as Control).z_index = 2500
		(auth_dialog as Control).mouse_filter = Control.MOUSE_FILTER_STOP

	var host: Node = get_parent() if get_parent() != null else self
	host.add_child(auth_dialog)
	host.move_child(auth_dialog, host.get_child_count() - 1)

func _on_settings_resized() -> void:
	_center_avatar_picker_panel()

func _center_avatar_picker_panel() -> void:
	if _avatar_picker_overlay == null or _avatar_picker_panel == null:
		return
	var overlay_size: Vector2 = _avatar_picker_overlay.size
	if overlay_size == Vector2.ZERO:
		overlay_size = get_viewport().get_visible_rect().size
	if overlay_size == Vector2.ZERO:
		overlay_size = size

	var margin_px: float = 16.0
	var max_size: Vector2 = overlay_size - Vector2(margin_px * 2.0, margin_px * 2.0)
	var desired: Vector2 = _avatar_picker_panel.custom_minimum_size
	var final_size: Vector2 = Vector2(min(desired.x, max_size.x), min(desired.y, max_size.y))
	final_size.x = max(final_size.x, 240.0)
	final_size.y = max(final_size.y, 180.0)
	_avatar_picker_panel.size = final_size

	var pos: Vector2 = (overlay_size - final_size) * 0.5
	pos.x = clamp(pos.x, margin_px, overlay_size.x - final_size.x - margin_px)
	pos.y = clamp(pos.y, margin_px, overlay_size.y - final_size.y - margin_px)
	_avatar_picker_panel.position = pos

func _refresh_avatar_picker_options_async() -> void:
	if _avatar_picker_options_loading or not _is_user_logged_in():
		return
	if not has_node("/root/AuthManager") or not AuthManager.has_method("fetch_avatar_options"):
		return
	_avatar_picker_options_loading = true
	var result: Dictionary = await AuthManager.fetch_avatar_options()
	_avatar_picker_options_loading = false
	if not bool(result.get("ok", false)):
		return

	var parsed: Variant = result.get("data")
	if typeof(parsed) != TYPE_DICTIONARY:
		return
	var payload: Dictionary = parsed as Dictionary
	if typeof(payload.get("data", null)) == TYPE_DICTIONARY:
		payload = payload.get("data", {}) as Dictionary

	var new_bg_ids: Array[int] = _extract_avatar_ids(payload.get("avatar_background_ids", []), USER_AVATAR_BG_MAX_ID)
	var new_icon_ids: Array[int] = _extract_avatar_ids(payload.get("avatar_ids", []), USER_AVATAR_MAX_ID)
	if new_bg_ids.is_empty() or new_icon_ids.is_empty():
		return

	_avatar_picker_bg_ids = new_bg_ids
	_avatar_picker_icon_ids = new_icon_ids
	_populate_avatar_picker_options()
	_select_avatar_picker_option(_avatar_picker_bg_option, _avatar_picker_selected_bg_id)
	_select_avatar_picker_option(_avatar_picker_icon_option, _avatar_picker_selected_icon_id)
	_update_avatar_picker_preview()

func _extract_avatar_ids(values: Variant, max_id: int) -> Array[int]:
	var output: Array[int] = []
	if typeof(values) != TYPE_ARRAY:
		return output
	for value in values:
		var id_value: int = int(value)
		if id_value >= 1 and id_value <= max_id:
			output.append(id_value)
	if output.is_empty():
		return _build_default_id_list(max_id)
	return output

func _on_user_menu_button_pressed() -> void:
	if not _is_user_logged_in():
		_open_auth_dialog_from_settings()
		return

	if _avatar_picker_dialog_open:
		return

	var scene_any: Variant = load(AVATAR_PICKER_DIALOG_SCENE_PATH)
	if not (scene_any is PackedScene):
		push_error("无法加载头像编辑窗口场景: " + AVATAR_PICKER_DIALOG_SCENE_PATH)
		return

	var dialog: Node = (scene_any as PackedScene).instantiate()
	_avatar_picker_dialog_open = true
	dialog.tree_exited.connect(func():
		_avatar_picker_dialog_open = false
		_refresh_user_menu_avatar_preview()
	)

	var avatar_id: int = _read_profile_int("avatar_id", USER_AVATAR_DEFAULT_ID, 1, USER_AVATAR_MAX_ID)
	var bg_id: int = _read_profile_int("avatar_background_id", USER_AVATAR_DEFAULT_BG_ID, 1, USER_AVATAR_BG_MAX_ID)
	if dialog.has_method("setup"):
		dialog.call("setup", avatar_id, bg_id)

	if dialog.has_signal("confirmed"):
		dialog.connect("confirmed", func(new_avatar_id: int, new_bg_id: int):
			await _save_profile_avatar_and_refresh(new_avatar_id, new_bg_id)
			dialog.queue_free()
		)
	if dialog.has_signal("canceled"):
		dialog.connect("canceled", func():
			dialog.queue_free()
		)

	if dialog is Control:
		(dialog as Control).z_index = 2600
		(dialog as Control).mouse_filter = Control.MOUSE_FILTER_STOP

	var host: Node = get_parent() if get_parent() != null else self
	host.add_child(dialog)
	host.move_child(dialog, host.get_child_count() - 1)

func _save_profile_avatar_and_refresh(avatar_id: int, avatar_background_id: int) -> void:
	if not _is_user_logged_in():
		_open_auth_dialog_from_settings()
		return
	if has_node("/root/AuthManager") and AuthManager.has_method("update_profile_avatar"):
		var result: Dictionary = await AuthManager.update_profile_avatar(avatar_id, avatar_background_id)
		if not bool(result.get("ok", false)):
			print("Update avatar failed: %s" % str(result.get("raw", result.get("error", "unknown"))))
	_refresh_user_menu_avatar_preview()

func _select_avatar_picker_option(option: ItemList, target_id: int) -> void:
	if option == null:
		return
	for i in range(option.get_item_count()):
		if int(option.get_item_metadata(i)) == target_id:
			option.select(i)
			return

func _on_avatar_picker_bg_selected(index: int) -> void:
	if _avatar_picker_bg_option == null:
		return
	_avatar_picker_selected_bg_id = int(_avatar_picker_bg_option.get_item_metadata(index))
	_update_avatar_picker_preview()

func _on_avatar_picker_icon_selected(index: int) -> void:
	if _avatar_picker_icon_option == null:
		return
	_avatar_picker_selected_icon_id = int(_avatar_picker_icon_option.get_item_metadata(index))
	_update_avatar_picker_preview()

func _update_avatar_picker_preview() -> void:
	if _avatar_picker_preview_bg == null or _avatar_picker_preview_icon == null:
		return

	var bg_path: String = "%s/%s.png" % [USER_AVATAR_BACKGROUND_DIR, _avatar_id_to_name(_avatar_picker_selected_bg_id)]
	var icon_path: String = "%s/%s.png" % [USER_AVATAR_ICON_DIR, _avatar_id_to_name(_avatar_picker_selected_icon_id)]
	_avatar_picker_preview_bg.texture = _load_image_texture(bg_path)
	_avatar_picker_preview_icon.texture = _load_image_texture(icon_path)

func _on_avatar_picker_cancel_pressed() -> void:
	if _avatar_picker_overlay != null:
		_avatar_picker_overlay.visible = false

func _on_avatar_picker_apply_pressed() -> void:
	if _avatar_picker_apply_button != null:
		_avatar_picker_apply_button.disabled = true

	if has_node("/root/AuthManager") and AuthManager.has_method("is_logged_in") and AuthManager.is_logged_in() and AuthManager.has_method("update_profile_avatar"):
		var result: Dictionary = await AuthManager.update_profile_avatar(_avatar_picker_selected_icon_id, _avatar_picker_selected_bg_id)
		if not bool(result.get("ok", false)):
			print("Update avatar failed: %s" % str(result.get("raw", result.get("error", "unknown"))))
		else:
			_avatar_runtime_override_enabled = false
	else:
		if _avatar_picker_overlay != null:
			_avatar_picker_overlay.visible = false
		if _avatar_picker_apply_button != null:
			_avatar_picker_apply_button.disabled = false
		_open_auth_dialog_from_settings()
		return

	_refresh_user_menu_avatar_preview()
	if _avatar_picker_overlay != null:
		_avatar_picker_overlay.visible = false
	if _avatar_picker_apply_button != null:
		_avatar_picker_apply_button.disabled = false

func _on_avatar_picker_overlay_gui_input(event: InputEvent) -> void:
	if _avatar_picker_overlay == null or not _avatar_picker_overlay.visible:
		return
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var pos: Vector2 = _avatar_picker_overlay.get_local_mouse_position()
		if _avatar_picker_panel != null:
			var rect := Rect2(_avatar_picker_panel.position, _avatar_picker_panel.size)
			if not rect.has_point(pos):
				_avatar_picker_overlay.visible = false

func _populate_screen_list():
	screen_list.clear()
	var screen_count = DisplayServer.get_screen_count()

	for i in range(screen_count):
		var screen_size = DisplayServer.screen_get_size(i)
		var screen_name = "显示器 %d (%dx%d)" % [i + 1, screen_size.x, screen_size.y]
		screen_list.add_item(screen_name)
		screen_list.set_item_metadata(i, i)

	# 获取当前窗口所在的屏幕
	current_screen = DisplayServer.window_get_current_screen()
	screen_list.selected = current_screen

func _populate_resolution_list():
	# 获取当前屏幕尺寸
	var screen_size = DisplayServer.screen_get_size(current_screen)
	var is_borderless = DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS)

	# 用于比较的分辨率（无边框模式下使用保存的窗口分辨率，否则使用当前窗口大小）
	var compare_resolution = windowed_resolution if is_borderless else DisplayServer.window_get_size()

	resolution_list.clear()

	# 添加16:9的分辨率选项（不超过当前屏幕尺寸）
	for res in RESOLUTIONS_16_9:
		if res.x <= screen_size.x and res.y <= screen_size.y:
			var text = str(res.x) + " x " + str(res.y)
			resolution_list.add_item(text)
			resolution_list.set_item_metadata(resolution_list.get_item_count() - 1, res)

	# 选中当前分辨率
	for i in range(resolution_list.get_item_count()):
		var res = resolution_list.get_item_metadata(i)
		if res == compare_resolution:
			resolution_list.selected = i
			break

func _update_window_mode_buttons():
	var is_borderless = DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS)

	# 重置所有按钮
	borderless_btn.button_pressed = false
	windowed_btn.button_pressed = false

	# 设置当前模式按钮（只看是否无边框）
	if is_borderless:
		borderless_btn.button_pressed = true
	else:
		windowed_btn.button_pressed = true

# 辅助函数：安全地居中窗口到屏幕（确保标题栏可见）
func _center_window_to_screen(window_size: Vector2i, screen_index: int) -> Vector2i:
	var screen_size = DisplayServer.screen_get_size(screen_index)
	var screen_position = DisplayServer.screen_get_position(screen_index)

	# 计算居中位置
	var center_x = screen_position.x + (screen_size.x - window_size.x) / 2
	var center_y = screen_position.y + (screen_size.y - window_size.y) / 2

	# 确保窗口顶部至少距离屏幕顶部MIN_TOP_MARGIN像素
	if center_y < screen_position.y + MIN_TOP_MARGIN:
		center_y = screen_position.y + MIN_TOP_MARGIN

	return Vector2i(center_x, center_y)

func _load_settings():
	# 从GameConfig加载设置
	var config = ConfigFile.new()
	var err = config.load(GameConfig.CONFIG_FILE_PATH)

	if err == OK:
		# 加载音量设置
		master_volume_slider.value = config.get_value("audio", "master_volume", 100)
		music_volume_slider.value = config.get_value("audio", "music_volume", 100)
		sfx_volume_slider.value = config.get_value("audio", "sfx_volume", 100)

		# 应用音量设置
		_apply_audio_settings()

		# 加载屏幕设置
		var saved_screen = config.get_value("display", "screen", 0)
		# 确保屏幕索引有效
		var screen_count = DisplayServer.get_screen_count()
		if saved_screen >= 0 and saved_screen < screen_count:
			current_screen = saved_screen
			screen_list.selected = current_screen
		else:
			current_screen = 0
			screen_list.selected = 0

		# 加载窗口模式（始终为窗口模式）
		var saved_borderless = config.get_value("display", "borderless", false)

		# 加载分辨率
		var saved_width = config.get_value("display", "resolution_x", 1280)
		var saved_height = config.get_value("display", "resolution_y", 720)
		var saved_size = Vector2i(saved_width, saved_height)
		windowed_resolution = saved_size  # 保存到变量

		# 应用窗口设置
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, saved_borderless)
		DisplayServer.window_set_current_screen(current_screen)

		# 根据窗口模式设置位置和大小到指定屏幕
		var screen_position = DisplayServer.screen_get_position(current_screen)
		var screen_size = DisplayServer.screen_get_size(current_screen)

		if saved_borderless:
			# 无边框全屏模式，窗口大小等于屏幕大小
			DisplayServer.window_set_size(screen_size)
			DisplayServer.window_set_position(screen_position)
		else:
			# 窗口模式，使用保存的分辨率并居中到屏幕（确保顶部可见）
			DisplayServer.window_set_size(saved_size)
			var window_pos = _center_window_to_screen(saved_size, current_screen)
			DisplayServer.window_set_position(window_pos)

func _save_settings():
	var config = ConfigFile.new()
	config.load(GameConfig.CONFIG_FILE_PATH)  # 先加载现有配置

	# 保存音量设置
	config.set_value("audio", "master_volume", master_volume_slider.value)
	config.set_value("audio", "music_volume", music_volume_slider.value)
	config.set_value("audio", "sfx_volume", sfx_volume_slider.value)

	# 保存窗口模式
	var mode = DisplayServer.window_get_mode()
	var is_borderless = DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS)
	config.set_value("display", "window_mode", mode)
	config.set_value("display", "borderless", is_borderless)

	# 保存屏幕
	config.set_value("display", "screen", current_screen)

	# 保存分辨率（只保存窗口模式下的分辨率，无边框全屏不保存）
	if not is_borderless:
		windowed_resolution = DisplayServer.window_get_size()

	config.set_value("display", "resolution_x", windowed_resolution.x)
	config.set_value("display", "resolution_y", windowed_resolution.y)

	config.save(GameConfig.CONFIG_FILE_PATH)

func _apply_audio_settings():
	# 设置音频总线音量
	var master_db = linear_to_db(master_volume_slider.value / 100.0)
	var music_db = linear_to_db(music_volume_slider.value / 100.0)
	var sfx_db = linear_to_db(sfx_volume_slider.value / 100.0)

	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), master_db)

	# 如果有音乐和音效总线，也设置它们
	var music_bus = AudioServer.get_bus_index("Music")
	if music_bus != -1:
		AudioServer.set_bus_volume_db(music_bus, music_db)

	var sfx_bus = AudioServer.get_bus_index("SFX")
	if sfx_bus != -1:
		AudioServer.set_bus_volume_db(sfx_bus, sfx_db)

# 窗口模式按钮回调
func _on_borderless_btn_pressed():
	# 检查是否已经是无边框模式，避免重复触发
	if DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS):
		return

	# 确保窗口在正确的屏幕上
	DisplayServer.window_set_current_screen(current_screen)

	# 获取屏幕信息
	var screen_size = DisplayServer.screen_get_size(current_screen)
	var screen_position = DisplayServer.screen_get_position(current_screen)

	# 设置窗口模式和大小
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_size(screen_size)
	DisplayServer.window_set_position(screen_position)

	# 最后设置无边框标志（确保窗口已经在正确位置和大小）
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

	_update_window_mode_buttons()
	_populate_resolution_list()  # 刷新分辨率列表以匹配新模式
	_save_settings()

func _on_windowed_btn_pressed():
	# 检查是否已经是窗口模式，避免重复触发
	if not DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS):
		return

	# 先取消无边框标志
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)

	# 确保窗口在正确的屏幕上
	DisplayServer.window_set_current_screen(current_screen)

	# 设置窗口模式和大小
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_size(windowed_resolution)

	# 居中窗口到当前屏幕（确保顶部可见）
	var window_pos = _center_window_to_screen(windowed_resolution, current_screen)
	DisplayServer.window_set_position(window_pos)

	_update_window_mode_buttons()
	_populate_resolution_list()  # 刷新分辨率列表以匹配新模式
	_save_settings()

# 屏幕选择回调
func _on_screen_selected(index: int):
	current_screen = index
	# 刷新分辨率列表（不同屏幕可能有不同的最大分辨率）
	_populate_resolution_list()
	# 移动窗口到新屏幕
	_move_window_to_current_screen()
	_save_settings()

func _move_window_to_current_screen():
	var is_borderless = DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS)
	var screen_position = DisplayServer.screen_get_position(current_screen)
	var screen_size = DisplayServer.screen_get_size(current_screen)

	if is_borderless:
		# 无边框全屏模式，设置窗口大小为屏幕大小
		DisplayServer.window_set_size(screen_size)
		DisplayServer.window_set_position(screen_position)
	else:
		# 窗口模式，使用保存的窗口分辨率并居中到屏幕（确保顶部可见）
		DisplayServer.window_set_size(windowed_resolution)
		var window_pos = _center_window_to_screen(windowed_resolution, current_screen)
		DisplayServer.window_set_position(window_pos)

	# 确保窗口在正确的屏幕上
	DisplayServer.window_set_current_screen(current_screen)

# 分辨率选择回调
func _on_resolution_selected(index: int):
	var selected_res = resolution_list.get_item_metadata(index)
	if selected_res:
		var is_borderless = DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS)

		# 更新窗口分辨率变量
		windowed_resolution = selected_res

		if is_borderless:
			# 无边框全屏模式下，只保存分辨率设置，不改变当前窗口
			# （切换到窗口模式时会使用这个分辨率）
			_save_settings()
		else:
			# 窗口模式下，立即应用新分辨率
			DisplayServer.window_set_size(selected_res)

			# 居中窗口到当前屏幕（确保顶部可见）
			var window_pos = _center_window_to_screen(selected_res, current_screen)
			DisplayServer.window_set_position(window_pos)

			# 确保窗口在正确的屏幕上
			DisplayServer.window_set_current_screen(current_screen)
			_save_settings()

# 音量滑块回调
func _on_master_volume_changed(_value: float):
	_apply_audio_settings()
	_save_settings()

func _on_music_volume_changed(_value: float):
	_apply_audio_settings()
	_save_settings()

func _on_sfx_volume_changed(_value: float):
	_apply_audio_settings()
	_save_settings()

# 返回按钮回调
func _on_back_button_pressed():
	back_pressed.emit()

# 页面切换
func _on_setting_button_pressed():
	_show_settings_page()

func _on_thanks_button_pressed():
	_show_thanks_page()

func _show_settings_page():
	settings_content.visible = true
	thanks_content.visible = false
	setting_button.texture_normal = setting_clicked_texture
	thanks_button.texture_normal = thanks_idle_texture

func _show_thanks_page():
	settings_content.visible = false
	thanks_content.visible = true
	setting_button.texture_normal = setting_idle_texture
	thanks_button.texture_normal = thanks_clicked_texture

# B站链接点击处理
func _open_external_url(url: String) -> void:
	if url.strip_edges().is_empty():
		return
	OS.shell_open(url)

func _on_credit_avatar_pressed(url: String) -> void:
	_open_external_url(url)

func _on_credit_avatar_entered(avatar_container: Control) -> void:
	_float_avatar_up(avatar_container)

func _on_credit_avatar_exited(avatar_container: Control) -> void:
	_float_avatar_down(avatar_container)

func _rebuild_credits_ui() -> void:
	if credits_contributors_grid == null or credits_thanks_grid == null or credit_card_template == null:
		return

	_clear_container_children(credits_contributors_grid)
	_clear_container_children(credits_thanks_grid)

	for entry in CREDITS_CONTRIBUTORS:
		var card := _instantiate_credit_card(entry)
		credits_contributors_grid.add_child(card)

	for entry in CREDITS_SPECIAL_THANKS:
		var card := _instantiate_credit_card(entry)
		credits_thanks_grid.add_child(card)

func _clear_container_children(container: Node) -> void:
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

func _instantiate_credit_card(entry: Dictionary) -> VBoxContainer:
	var card := credit_card_template.duplicate() as VBoxContainer
	card.visible = true
	card.process_mode = Node.PROCESS_MODE_INHERIT
	if entry.has("id"):
		card.name = "CreditCard_%s" % str(entry["id"])

	var avatar_container := card.get_node("AvatarContainer") as Control
	var avatar_button := card.get_node("AvatarContainer/AvatarButton") as TextureButton
	var name_label := card.get_node("Name") as Label
	var desc_label := card.get_node("Description") as Label

	name_label.text = str(entry.get("name", ""))
	var desc := str(entry.get("desc", ""))
	desc_label.text = desc
	desc_label.visible = not desc.strip_edges().is_empty()

	var texture_path := str(entry.get("texture", ""))
	if not texture_path.is_empty() and ResourceLoader.exists(texture_path):
		avatar_button.texture_normal = load(texture_path)

	avatar_button.focus_mode = Control.FOCUS_NONE
	avatar_button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	avatar_button.mouse_entered.connect(_on_credit_avatar_entered.bind(avatar_container))
	avatar_button.mouse_exited.connect(_on_credit_avatar_exited.bind(avatar_container))

	var url := str(entry.get("url", ""))
	if url.strip_edges().is_empty():
		avatar_button.disabled = true
		avatar_button.mouse_default_cursor_shape = Control.CURSOR_ARROW
	else:
		avatar_button.pressed.connect(_on_credit_avatar_pressed.bind(url))

	return card

# 头像浮动动画辅助函数
func _float_avatar_up(avatar_container: Control):
	"""向上浮动动画"""
	if not avatar_container:
		return

	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)

	# 向上浮动8像素
	tween.tween_property(avatar_container, "position:y", -8.0, 0.3)
	# 轻微放大
	tween.tween_property(avatar_container, "scale", Vector2(1.05, 1.05), 0.3)

func _float_avatar_down(avatar_container: Control):
	"""恢复原位动画"""
	if not avatar_container:
		return

	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)

	# 恢复原始位置
	tween.tween_property(avatar_container, "position:y", 0.0, 0.3)
	# 恢复原始大小
	tween.tween_property(avatar_container, "scale", Vector2(1.0, 1.0), 0.3)

# 显示设置界面（带淡入动画）
func show_settings():
	visible = true
	modulate.a = 0

	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.3)

# 隐藏设置界面（带淡出动画）
func hide_settings():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)

	await tween.finished
	visible = false
