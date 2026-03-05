extends Control

signal confirmed(avatar_id: int, avatar_background_id: int)
signal canceled

const USER_MENU_BG_PATH: String = "res://assets/gui/settings/Menu.png"
const USER_AVATAR_BACKGROUND_DIR: String = "res://assets/gui/useravatar/background"
const USER_AVATAR_ICON_DIR: String = "res://assets/gui/useravatar/icon"
const USER_AVATAR_MAX_ID: int = 47
const USER_AVATAR_BG_MAX_ID: int = 20
const UI_FONT_PATH: String = "res://assets/gui/font/方正粗圆_GBK.ttf"

enum Mode { AVATAR, BACKGROUND }

@onready var overlay: ColorRect = $"Overlay"
@onready var window_panel: PanelContainer = $"WindowPanel"
@onready var title_label: Label = $"WindowPanel/Margin/Root/Header/TitleLabel"
@onready var close_button: Button = $"WindowPanel/Margin/Root/Header/CloseButton"
@onready var preview_panel: PanelContainer = $"WindowPanel/Margin/Root/Body/PreviewPanel"
@onready var preview_button: TextureButton = $"WindowPanel/Margin/Root/Body/PreviewPanel/PreviewButton"
@onready var preview_bg: TextureRect = $"WindowPanel/Margin/Root/Body/PreviewPanel/PreviewButton/AvatarBackground"
@onready var preview_icon: TextureRect = $"WindowPanel/Margin/Root/Body/PreviewPanel/PreviewButton/AvatarIcon"
@onready var avatar_tab: Button = $"WindowPanel/Margin/Root/Body/RightPanel/Tabs/AvatarTab"
@onready var bg_tab: Button = $"WindowPanel/Margin/Root/Body/RightPanel/Tabs/BackgroundTab"
@onready var grid: ItemList = $"WindowPanel/Margin/Root/Body/RightPanel/GridScroll/Grid"
@onready var hint_label: Label = $"WindowPanel/Margin/Root/Footer/HintLabel"
@onready var cancel_button: Button = $"WindowPanel/Margin/Root/Footer/Buttons/CancelButton"
@onready var confirm_button: Button = $"WindowPanel/Margin/Root/Footer/Buttons/ConfirmButton"

var _ui_font: FontFile = null
var _mode: int = Mode.AVATAR
var _avatar_ids: Array[int] = []
var _bg_ids: Array[int] = []
var _icon_cache: Dictionary = {}
var _bg_cache: Dictionary = {}

var _selected_avatar_id: int = 1
var _selected_bg_id: int = 1

func _ready() -> void:
	_ui_font = load(UI_FONT_PATH)
	_apply_fonts()
	_apply_styles()
	_layout_preview()

	overlay.gui_input.connect(_on_overlay_gui_input)
	close_button.pressed.connect(_close)
	cancel_button.pressed.connect(func():
		canceled.emit()
		_close()
	)
	confirm_button.pressed.connect(func():
		confirm_button.disabled = true
		cancel_button.disabled = true
		close_button.disabled = true
		confirmed.emit(_selected_avatar_id, _selected_bg_id)
	)

	avatar_tab.toggle_mode = true
	bg_tab.toggle_mode = true
	avatar_tab.pressed.connect(func(): _set_mode(Mode.AVATAR))
	bg_tab.pressed.connect(func(): _set_mode(Mode.BACKGROUND))
	grid.item_selected.connect(_on_grid_item_selected)

	# Use a square preview card (closer to the reference screenshot).
	preview_button.texture_normal = null
	preview_button.texture_hover = null
	preview_button.texture_pressed = null

	_avatar_ids = _load_local_ids(USER_AVATAR_ICON_DIR, USER_AVATAR_MAX_ID)
	_bg_ids = _load_local_ids(USER_AVATAR_BACKGROUND_DIR, USER_AVATAR_BG_MAX_ID)

	_set_mode(Mode.AVATAR)
	_refresh_preview()

func setup(initial_avatar_id: int, initial_bg_id: int) -> void:
	_selected_avatar_id = clampi(initial_avatar_id, 1, USER_AVATAR_MAX_ID)
	_selected_bg_id = clampi(initial_bg_id, 1, USER_AVATAR_BG_MAX_ID)
	if is_node_ready():
		_set_mode(_mode)
		_refresh_preview()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_close()
		get_viewport().set_input_as_handled()

func _on_overlay_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_close()

func _close() -> void:
	queue_free()

func _apply_fonts() -> void:
	if _ui_font == null:
		return
	title_label.add_theme_font_override("font", _ui_font)
	title_label.add_theme_font_size_override("font_size", 24)
	title_label.add_theme_color_override("font_color", Color(1, 1, 1, 1))

	close_button.add_theme_font_override("font", _ui_font)
	close_button.add_theme_font_size_override("font_size", 18)
	cancel_button.add_theme_font_override("font", _ui_font)
	cancel_button.add_theme_font_size_override("font_size", 18)
	confirm_button.add_theme_font_override("font", _ui_font)
	confirm_button.add_theme_font_size_override("font_size", 18)

	avatar_tab.add_theme_font_override("font", _ui_font)
	avatar_tab.add_theme_font_size_override("font_size", 18)
	bg_tab.add_theme_font_override("font", _ui_font)
	bg_tab.add_theme_font_size_override("font_size", 18)

	hint_label.add_theme_font_override("font", _ui_font)
	hint_label.add_theme_font_size_override("font_size", 16)
	hint_label.add_theme_color_override("font_color", Color(1, 1, 1, 0.7))

	grid.add_theme_font_override("font", _ui_font)
	grid.add_theme_font_size_override("font_size", 14)
	grid.add_theme_color_override("font_color", Color(1, 1, 1, 0.9))
	grid.add_theme_color_override("font_selected_color", Color(1, 1, 1, 1))
	grid.add_theme_color_override("selection_color", Color(0.25, 0.5, 0.9, 0.55))

func _apply_styles() -> void:
	# Panel border for the preview card.
	if preview_panel != null:
		var s: StyleBoxFlat = StyleBoxFlat.new()
		s.bg_color = Color(0.11, 0.11, 0.11, 1.0)
		s.border_width_left = 1
		s.border_width_top = 1
		s.border_width_right = 1
		s.border_width_bottom = 1
		s.border_color = Color(1, 1, 1, 0.12)
		s.corner_radius_top_left = 10
		s.corner_radius_top_right = 10
		s.corner_radius_bottom_right = 10
		s.corner_radius_bottom_left = 10
		preview_panel.add_theme_stylebox_override("panel", s)

	# Confirm button (yellow, like the reference).
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

	# Cancel/close buttons (dark).
	var dark_normal: StyleBoxFlat = StyleBoxFlat.new()
	dark_normal.bg_color = Color(0.22, 0.22, 0.22, 1.0)
	dark_normal.corner_radius_top_left = 10
	dark_normal.corner_radius_top_right = 10
	dark_normal.corner_radius_bottom_right = 10
	dark_normal.corner_radius_bottom_left = 10
	cancel_button.add_theme_stylebox_override("normal", dark_normal)
	close_button.add_theme_stylebox_override("normal", dark_normal)

	var dark_hover: StyleBoxFlat = dark_normal.duplicate()
	dark_hover.bg_color = Color(0.28, 0.28, 0.28, 1.0)
	cancel_button.add_theme_stylebox_override("hover", dark_hover)
	close_button.add_theme_stylebox_override("hover", dark_hover)

	var dark_pressed: StyleBoxFlat = dark_normal.duplicate()
	dark_pressed.bg_color = Color(0.18, 0.18, 0.18, 1.0)
	cancel_button.add_theme_stylebox_override("pressed", dark_pressed)
	close_button.add_theme_stylebox_override("pressed", dark_pressed)

	_update_tab_styles()

func _update_tab_styles() -> void:
	# Simple segmented-control look using styleboxes.
	var inactive: StyleBoxFlat = StyleBoxFlat.new()
	inactive.bg_color = Color(0.18, 0.18, 0.18, 1.0)
	inactive.border_width_left = 1
	inactive.border_width_top = 1
	inactive.border_width_right = 1
	inactive.border_width_bottom = 1
	inactive.border_color = Color(1, 1, 1, 0.12)
	inactive.corner_radius_top_left = 10
	inactive.corner_radius_top_right = 10
	inactive.corner_radius_bottom_right = 10
	inactive.corner_radius_bottom_left = 10

	var active: StyleBoxFlat = inactive.duplicate()
	active.bg_color = Color(0.22, 0.26, 0.32, 1.0)
	active.border_color = Color(0.25, 0.6, 1.0, 0.55)

	avatar_tab.add_theme_stylebox_override("normal", active if _mode == Mode.AVATAR else inactive)
	bg_tab.add_theme_stylebox_override("normal", active if _mode == Mode.BACKGROUND else inactive)

func _layout_preview() -> void:
	# Make the preview feel like a card with a large icon, similar to the reference screenshot.
	var preview_size: Vector2 = Vector2(240, 240)
	preview_button.custom_minimum_size = preview_size
	preview_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_bg.position = Vector2.ZERO
	preview_bg.size = preview_size
	preview_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_icon.position = Vector2.ZERO
	preview_icon.size = preview_size
	preview_bg.stretch_mode = TextureRect.STRETCH_SCALE
	preview_icon.stretch_mode = TextureRect.STRETCH_SCALE

func _set_mode(mode: int) -> void:
	_mode = mode
	avatar_tab.button_pressed = (_mode == Mode.AVATAR)
	bg_tab.button_pressed = (_mode == Mode.BACKGROUND)
	_update_tab_styles()

	if _mode == Mode.AVATAR:
		hint_label.text = "选择头像后点击“确认”保存（Esc/点空白关闭）"
		_populate_grid(_avatar_ids, true)
		_select_grid_by_id(_selected_avatar_id)
	else:
		hint_label.text = "选择头像背景后点击“确认”保存（Esc/点空白关闭）"
		_populate_grid(_bg_ids, false)
		_select_grid_by_id(_selected_bg_id)

func _populate_grid(ids: Array[int], is_avatar: bool) -> void:
	grid.clear()
	for id_value in ids:
		var tex: Texture2D = _get_icon_tex(id_value) if is_avatar else _get_bg_tex(id_value)
		grid.add_item("", tex)
		grid.set_item_metadata(grid.get_item_count() - 1, id_value)

func _select_grid_by_id(target_id: int) -> void:
	for i in range(grid.get_item_count()):
		if int(grid.get_item_metadata(i)) == target_id:
			grid.select(i)
			grid.ensure_current_is_visible()
			return

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
				if id_value >= 1 and id_value <= max_count and not ids.has(id_value):
					ids.append(id_value)
		file_name = dir.get_next()
	dir.list_dir_end()
	ids.sort()
	if ids.is_empty():
		return _default_id_list(max_count)
	return ids

func _default_id_list(max_count: int) -> Array[int]:
	var out: Array[int] = []
	for i in range(1, max_count + 1):
		out.append(i)
	return out
