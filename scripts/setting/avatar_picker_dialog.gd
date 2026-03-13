extends Control

signal confirmed(avatar_id: int, avatar_background_id: int)
signal canceled

const USER_AVATAR_BACKGROUND_DIR: String = "res://assets/gui/useravatar/background"
const USER_AVATAR_ICON_DIR: String = "res://assets/gui/useravatar/icon"
const USER_AVATAR_MAX_ID: int = 47
const USER_AVATAR_BG_MAX_ID: int = 20
const UI_FONT_PATH: String = "res://assets/gui/font/方正粗圆_GBK.ttf"
const PREVIEW_BASE_SIZE: Vector2 = Vector2(192, 132)
const PREVIEW_AVATAR_OFFSET: Vector2 = Vector2(11, 11)
const PREVIEW_AVATAR_SIZE: Vector2 = Vector2(110, 110)
const PREVIEW_SCALE: float = 0.7
const AVATAR_GRID_ICON_SIZE: Vector2i = Vector2i(76, 76)
const AVATAR_GRID_COLUMNS: int = 6

enum Mode { AVATAR, BACKGROUND }

@onready var overlay: ColorRect = $"Overlay"
@onready var window_panel: PanelContainer = $"WindowPanel"
@onready var title_label: Label = $"WindowPanel/Margin/Root/Header/TitleLabel"
@onready var close_button: Button = $"WindowPanel/Margin/Root/Header/CloseButton"
@onready var preview_panel: Control = $"WindowPanel/Margin/Root/Body/PreviewPanel"
@onready var preview_button: TextureButton = $"WindowPanel/Margin/Root/Body/PreviewPanel/PreviewButton"
@onready var preview_bg: TextureRect = $"WindowPanel/Margin/Root/Body/PreviewPanel/PreviewButton/AvatarBackground"
@onready var preview_icon: TextureRect = $"WindowPanel/Margin/Root/Body/PreviewPanel/PreviewButton/AvatarIcon"
@onready var avatar_tab: Button = $"WindowPanel/Margin/Root/Footer/Tabs/AvatarTab"
@onready var bg_tab: Button = $"WindowPanel/Margin/Root/Footer/Tabs/BackgroundTab"
@onready var grid: ItemList = $"WindowPanel/Margin/Root/Body/RightPanel/GridScroll/Grid"
@onready var hint_label: Label = $"WindowPanel/Margin/Root/Footer/HintLabel"
@onready var confirm_button: Button = $"WindowPanel/Margin/Root/Footer/ConfirmButton"

var _ui_font: FontFile = null
var _mode: int = Mode.AVATAR
var _avatar_ids: Array[int] = []
var _bg_ids: Array[int] = []
var _icon_cache: Dictionary = {}
var _bg_cache: Dictionary = {}
var _selected_avatar_id: int = 1
var _selected_bg_id: int = 1
var _is_confirming: bool = false

func _ready() -> void:
	_ui_font = load(UI_FONT_PATH)
	_apply_texts()
	_apply_fonts()
	_apply_styles()
	_layout_preview()

	overlay.gui_input.connect(_on_overlay_gui_input)
	close_button.pressed.connect(_close)
	confirm_button.pressed.connect(_on_confirm_pressed)

	avatar_tab.toggle_mode = true
	bg_tab.toggle_mode = true
	avatar_tab.pressed.connect(func(): _set_mode(Mode.AVATAR))
	bg_tab.pressed.connect(func(): _set_mode(Mode.BACKGROUND))
	grid.item_selected.connect(_on_grid_item_selected)

	_avatar_ids = _load_local_ids(USER_AVATAR_ICON_DIR, USER_AVATAR_MAX_ID)
	_bg_ids = _load_local_ids(USER_AVATAR_BACKGROUND_DIR, USER_AVATAR_BG_MAX_ID)
	_normalize_selected_ids()
	_set_mode(Mode.AVATAR)
	_refresh_preview()

func setup(initial_avatar_id: int, initial_bg_id: int) -> void:
	_selected_avatar_id = clampi(initial_avatar_id, 1, USER_AVATAR_MAX_ID)
	_selected_bg_id = clampi(initial_bg_id, 1, USER_AVATAR_BG_MAX_ID)
	if is_node_ready():
		_normalize_selected_ids()
		_set_mode(_mode)
		_refresh_preview()

func _unhandled_input(event: InputEvent) -> void:
	if _is_confirming:
		return
	if event.is_action_pressed("ui_cancel"):
		_close()
		get_viewport().set_input_as_handled()

func _on_overlay_gui_input(event: InputEvent) -> void:
	if _is_confirming:
		return
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_close()

func _close() -> void:
	if _is_confirming:
		return
	canceled.emit()
	queue_free()

func _on_confirm_pressed() -> void:
	if _is_confirming:
		return
	_is_confirming = true
	confirm_button.disabled = true
	close_button.disabled = true
	avatar_tab.disabled = true
	bg_tab.disabled = true
	confirmed.emit(_selected_avatar_id, _selected_bg_id)

func _apply_texts() -> void:
	title_label.text = "更换头像与背景"
	close_button.text = "关闭"
	confirm_button.text = "确认保存"
	avatar_tab.text = "头像"
	bg_tab.text = "头像背景"

func _apply_fonts() -> void:
	if _ui_font == null:
		return
	title_label.add_theme_font_override("font", _ui_font)
	title_label.add_theme_font_size_override("font_size", 24)
	title_label.add_theme_color_override("font_color", Color(1, 1, 1, 1))

	close_button.add_theme_font_override("font", _ui_font)
	close_button.add_theme_font_size_override("font_size", 16)
	confirm_button.add_theme_font_override("font", _ui_font)
	confirm_button.add_theme_font_size_override("font_size", 18)
	avatar_tab.add_theme_font_override("font", _ui_font)
	avatar_tab.add_theme_font_size_override("font_size", 17)
	bg_tab.add_theme_font_override("font", _ui_font)
	bg_tab.add_theme_font_size_override("font_size", 17)

	hint_label.add_theme_font_override("font", _ui_font)
	hint_label.add_theme_font_size_override("font_size", 15)
	hint_label.add_theme_color_override("font_color", Color(1, 1, 1, 0.72))

	grid.add_theme_font_override("font", _ui_font)
	grid.add_theme_font_size_override("font_size", 14)
	grid.add_theme_color_override("font_color", Color(1, 1, 1, 0.9))
	grid.add_theme_color_override("font_selected_color", Color(1, 1, 1, 1))
	grid.add_theme_color_override("selection_color", Color(0.95, 0.77, 0.18, 0.30))
	grid.add_theme_color_override("guide_color", Color(1, 1, 1, 0.0))
	grid.fixed_icon_size = AVATAR_GRID_ICON_SIZE
	grid.max_columns = AVATAR_GRID_COLUMNS
	grid.same_column_width = true

func _apply_styles() -> void:
	var empty_style: StyleBoxEmpty = StyleBoxEmpty.new()
	preview_panel.add_theme_stylebox_override("panel", empty_style)
	grid.add_theme_stylebox_override("panel", empty_style)
	grid.add_theme_stylebox_override("focus", empty_style)

	var ok_normal: StyleBoxFlat = StyleBoxFlat.new()
	ok_normal.bg_color = Color(0.96, 0.78, 0.18, 1.0)
	ok_normal.corner_radius_top_left = 10
	ok_normal.corner_radius_top_right = 10
	ok_normal.corner_radius_bottom_right = 10
	ok_normal.corner_radius_bottom_left = 10
	confirm_button.add_theme_stylebox_override("normal", ok_normal)

	var ok_hover: StyleBoxFlat = ok_normal.duplicate()
	ok_hover.bg_color = Color(1.0, 0.84, 0.28, 1.0)
	confirm_button.add_theme_stylebox_override("hover", ok_hover)

	var ok_pressed: StyleBoxFlat = ok_normal.duplicate()
	ok_pressed.bg_color = Color(0.88, 0.70, 0.14, 1.0)
	confirm_button.add_theme_stylebox_override("pressed", ok_pressed)
	confirm_button.add_theme_color_override("font_color", Color(0.08, 0.08, 0.08, 1.0))

	var dark_normal: StyleBoxFlat = StyleBoxFlat.new()
	dark_normal.bg_color = Color(1, 1, 1, 0.08)
	dark_normal.corner_radius_top_left = 10
	dark_normal.corner_radius_top_right = 10
	dark_normal.corner_radius_bottom_right = 10
	dark_normal.corner_radius_bottom_left = 10
	close_button.add_theme_stylebox_override("normal", dark_normal)

	var dark_hover: StyleBoxFlat = dark_normal.duplicate()
	dark_hover.bg_color = Color(1, 1, 1, 0.14)
	close_button.add_theme_stylebox_override("hover", dark_hover)

	var dark_pressed: StyleBoxFlat = dark_normal.duplicate()
	dark_pressed.bg_color = Color(1, 1, 1, 0.05)
	close_button.add_theme_stylebox_override("pressed", dark_pressed)

	_update_tab_styles()

func _update_tab_styles() -> void:
	var inactive: StyleBoxFlat = StyleBoxFlat.new()
	inactive.bg_color = Color(1, 1, 1, 0.08)
	inactive.corner_radius_top_left = 10
	inactive.corner_radius_top_right = 10
	inactive.corner_radius_bottom_right = 10
	inactive.corner_radius_bottom_left = 10

	var active: StyleBoxFlat = inactive.duplicate()
	active.bg_color = Color(0.96, 0.78, 0.18, 0.92)

	avatar_tab.add_theme_stylebox_override("normal", active if _mode == Mode.AVATAR else inactive)
	avatar_tab.add_theme_stylebox_override("hover", active if _mode == Mode.AVATAR else inactive)
	avatar_tab.add_theme_stylebox_override("pressed", active if _mode == Mode.AVATAR else inactive)
	bg_tab.add_theme_stylebox_override("normal", active if _mode == Mode.BACKGROUND else inactive)
	bg_tab.add_theme_stylebox_override("hover", active if _mode == Mode.BACKGROUND else inactive)
	bg_tab.add_theme_stylebox_override("pressed", active if _mode == Mode.BACKGROUND else inactive)

	var active_font_color := Color(0.08, 0.08, 0.08, 1)
	var inactive_font_color := Color(1, 1, 1, 0.92)
	avatar_tab.add_theme_color_override("font_color", active_font_color if _mode == Mode.AVATAR else inactive_font_color)
	bg_tab.add_theme_color_override("font_color", active_font_color if _mode == Mode.BACKGROUND else inactive_font_color)

func _layout_preview() -> void:
	var preview_size: Vector2 = PREVIEW_BASE_SIZE * PREVIEW_SCALE
	var avatar_offset: Vector2 = PREVIEW_AVATAR_OFFSET * PREVIEW_SCALE
	var avatar_size: Vector2 = PREVIEW_AVATAR_SIZE * PREVIEW_SCALE

	preview_panel.custom_minimum_size = Vector2(preview_size.x + 18.0, preview_size.y)
	preview_button.custom_minimum_size = preview_size
	preview_button.focus_mode = Control.FOCUS_NONE
	preview_button.mouse_filter = Control.MOUSE_FILTER_IGNORE
	preview_button.texture_hover = preview_button.texture_normal
	preview_button.texture_pressed = preview_button.texture_normal
	preview_button.texture_disabled = preview_button.texture_normal

	preview_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_bg.position = avatar_offset
	preview_bg.size = avatar_size
	preview_bg.stretch_mode = TextureRect.STRETCH_SCALE
	preview_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE

	preview_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_icon.position = avatar_offset
	preview_icon.size = avatar_size
	preview_icon.stretch_mode = TextureRect.STRETCH_SCALE
	preview_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _set_mode(mode: int) -> void:
	_mode = mode
	avatar_tab.button_pressed = (_mode == Mode.AVATAR)
	bg_tab.button_pressed = (_mode == Mode.BACKGROUND)
	_update_tab_styles()
	_apply_grid_layout()

	if _mode == Mode.AVATAR:
		hint_label.text = ""
		_populate_grid(_avatar_ids, true)
		_select_grid_by_id(_selected_avatar_id)
	else:
		hint_label.text = ""
		_populate_grid(_bg_ids, false)
		_select_grid_by_id(_selected_bg_id)

func _apply_grid_layout() -> void:
	grid.fixed_icon_size = AVATAR_GRID_ICON_SIZE
	grid.max_columns = AVATAR_GRID_COLUMNS
	grid.add_theme_constant_override("h_separation", 18)
	grid.add_theme_constant_override("v_separation", 18)
	grid.add_theme_constant_override("icon_margin", 10)
	grid.add_theme_constant_override("line_separation", 0)

func _populate_grid(ids: Array[int], is_avatar: bool) -> void:
	grid.clear()
	for id_value in ids:
		var tex: Texture2D = _get_icon_tex(id_value) if is_avatar else _get_bg_tex(id_value)
		if tex == null:
			continue
		grid.add_item("", tex)
		grid.set_item_metadata(grid.get_item_count() - 1, id_value)

func _select_grid_by_id(target_id: int) -> void:
	for index in range(grid.get_item_count()):
		if int(grid.get_item_metadata(index)) == target_id:
			grid.select(index)
			grid.ensure_current_is_visible()
			return
	grid.deselect_all()

func _on_grid_item_selected(index: int) -> void:
	var id_value: int = int(grid.get_item_metadata(index))
	if _mode == Mode.AVATAR:
		_selected_avatar_id = id_value
	else:
		_selected_bg_id = id_value
	_refresh_preview()

func _refresh_preview() -> void:
	preview_bg.texture = _get_bg_tex(_selected_bg_id)
	preview_icon.texture = _get_icon_tex(_selected_avatar_id)

func _normalize_selected_ids() -> void:
	if not _avatar_ids.has(_selected_avatar_id) and not _avatar_ids.is_empty():
		_selected_avatar_id = _avatar_ids[0]
	if not _bg_ids.has(_selected_bg_id) and not _bg_ids.is_empty():
		_selected_bg_id = _bg_ids[0]

func _id_to_name(id_value: int) -> String:
	return "%03d" % id_value

func _get_bg_tex(id_value: int) -> Texture2D:
	if _bg_cache.has(id_value):
		return _bg_cache[id_value]
	var path: String = "%s/%s.png" % [USER_AVATAR_BACKGROUND_DIR, _id_to_name(id_value)]
	var tex: Texture2D = _load_tex(path)
	_bg_cache[id_value] = tex
	return tex

func _get_icon_tex(id_value: int) -> Texture2D:
	if _icon_cache.has(id_value):
		return _icon_cache[id_value]
	var path: String = "%s/%s.png" % [USER_AVATAR_ICON_DIR, _id_to_name(id_value)]
	var tex: Texture2D = _load_tex(path)
	_icon_cache[id_value] = tex
	return tex

func _load_tex(path: String) -> Texture2D:
	var res_any: Variant = load(path)
	if res_any is Texture2D:
		return res_any as Texture2D
	if not FileAccess.file_exists(path):
		return null
	var image: Image = Image.load_from_file(path)
	if image == null or image.is_empty():
		return null
	return ImageTexture.create_from_image(image)

func _load_local_ids(dir_path: String, max_count: int) -> Array[int]:
	var ids: Array[int] = []
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		return _default_id_list(max_count)
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir() and file_name.to_lower().ends_with(".png"):
			var base: String = file_name.get_basename()
			if base.is_valid_int():
				var id_value: int = int(base)
				if id_value >= 2 and id_value <= max_count and not ids.has(id_value):
					ids.append(id_value)
		file_name = dir.get_next()
	dir.list_dir_end()
	ids.sort()
	if ids.is_empty():
		return _default_id_list(max_count)
	return ids

func _default_id_list(max_count: int) -> Array[int]:
	var output: Array[int] = []
	for id_value in range(2, max_count + 1):
		output.append(id_value)
	return output
