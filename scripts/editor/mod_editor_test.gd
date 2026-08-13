extends "res://scripts/editor/mod_editor.gd"

# 测试版编辑器只替换表现层。旧编辑器节点仍留在继承场景中并隐藏，
# 继续承担 project.json、资源解析、校验与 NovelInterface 预览逻辑。

const TEST_UI_FONT: FontFile = preload("res://assets/gui/font/方正兰亭准黑_GBK.ttf")

const COLOR_CANVAS := Color("0b0f14")
const COLOR_SURFACE := Color("10161d")
const COLOR_SURFACE_ALT := Color("151c24")
const COLOR_INPUT := Color("0e141a")
const COLOR_TEXT := Color("f1f3f5")
const COLOR_TEXT_MUTED := Color("8d97a2")
const COLOR_LINE := Color(0.72, 0.78, 0.84, 0.14)
const COLOR_LINE_STRONG := Color(0.72, 0.78, 0.84, 0.24)
const COLOR_CYAN := Color("48b8d3")
const COLOR_DANGER := Color("d45d65")

const LEFT_DOCK_WIDTH := 288.0
const RIGHT_DOCK_WIDTH := 280.0
const TIMELINE_HEIGHT := 270.0
const TIMELINE_STEP := 92.0
const TIMELINE_START_X := 34.0
const TIMELINE_SURFACE_HEIGHT := 238.0
const TIMELINE_ROW_Y := [34.0, 76.0, 116.0, 158.0, 200.0]
const MAX_VISIBLE_RESOURCES := 36
const RESOURCE_SCROLL_GUTTER := 18.0

class TimelineSurface extends Control:
	var step_count: int = 0
	var playhead_index: int = -1
	var cell_width: float = 92.0
	var start_x: float = 34.0
	var drop_row: int = -1
	var drop_index: int = -1

	func configure(count: int, width: float) -> void:
		step_count = maxi(0, count)
		custom_minimum_size = Vector2(width, 238.0)
		queue_redraw()

	func set_playhead(index: int) -> void:
		playhead_index = index
		queue_redraw()

	func set_drop_target(row: int, index: int) -> void:
		if drop_row == row and drop_index == index:
			return
		drop_row = row
		drop_index = index
		queue_redraw()

	func _draw() -> void:
		draw_rect(Rect2(Vector2.ZERO, size), Color("0d1319"), true)
		var row_lines := [30.0, 72.0, 112.0, 154.0, 196.0, 237.0]
		for row_y in row_lines:
			draw_line(Vector2(0.0, row_y), Vector2(size.x, row_y), Color(0.72, 0.78, 0.84, 0.13), 1.0)
		var visible_steps := maxi(step_count + 1, int(ceil((size.x - start_x) / cell_width)))
		for i in range(visible_steps + 1):
			var x := start_x + float(i) * cell_width
			draw_line(Vector2(x, 0.0), Vector2(x, size.y), Color(0.72, 0.78, 0.84, 0.08), 1.0)
		if playhead_index >= 0:
			var playhead_x := start_x + float(playhead_index) * cell_width + cell_width * 0.5
			draw_line(Vector2(playhead_x, 0.0), Vector2(playhead_x, size.y), Color("35c5df"), 2.0)
			var marker := PackedVector2Array([
				Vector2(playhead_x - 7.0, 0.0),
				Vector2(playhead_x + 7.0, 0.0),
				Vector2(playhead_x, 9.0),
			])
			draw_colored_polygon(marker, Color("35c5df"))
		if drop_row >= 0 and drop_index >= 0:
			var row_bounds := [Vector2(30.0, 72.0), Vector2(72.0, 112.0), Vector2(112.0, 154.0), Vector2(154.0, 196.0), Vector2(196.0, 238.0)]
			var bounds: Vector2 = row_bounds[drop_row]
			draw_rect(Rect2(0.0, bounds.x, size.x, bounds.y - bounds.x), Color(0.28, 0.72, 0.83, 0.10), true)
			var insert_x := start_x + float(drop_index) * cell_width
			draw_line(Vector2(insert_x, bounds.x + 2.0), Vector2(insert_x, bounds.y - 2.0), Color("48b8d3"), 3.0)

class OverlayScrollIndicator extends Control:
	const EDGE_PADDING := 7.0
	const IDLE_THICKNESS := 2.0
	const ACTIVE_THICKNESS := 4.0
	const INDICATOR_WIDTH := 54.0
	const HIT_PADDING := 6.0
	const ACTIVITY_HOLD := 0.80

	var scroll_bar: HScrollBar
	var _hovered := false
	var _dragging := false
	var _drag_offset := 0.0
	var _activity_left := 0.0
	var _visual_alpha := 0.0
	var _visual_thickness := IDLE_THICKNESS
	var _last_scroll_value := 0.0

	func setup(target_scroll_bar: HScrollBar) -> void:
		scroll_bar = target_scroll_bar
		mouse_filter = Control.MOUSE_FILTER_STOP
		mouse_default_cursor_shape = Control.CURSOR_HSIZE
		set_process(true)
		queue_redraw()

	func _has_point(point: Vector2) -> bool:
		if not _is_scrollable():
			return false
		var thumb := _thumb_rect()
		var hit_rect := Rect2(
			thumb.position.x - HIT_PADDING,
			size.y - 10.0,
			thumb.size.x + HIT_PADDING * 2.0,
			10.0
		)
		return hit_rect.has_point(point)

	func _process(delta: float) -> void:
		if scroll_bar == null or not is_instance_valid(scroll_bar):
			visible = false
			return
		visible = _is_scrollable()
		if not visible:
			return
		if _dragging and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_dragging = false
		if not is_equal_approx(scroll_bar.value, _last_scroll_value):
			_last_scroll_value = scroll_bar.value
			_activity_left = ACTIVITY_HOLD
		_activity_left = maxf(0.0, _activity_left - delta)
		var target_alpha := 0.95 if _dragging else (0.72 if _hovered else (0.48 if _activity_left > 0.0 else 0.28))
		var target_thickness := ACTIVE_THICKNESS if _hovered or _dragging else IDLE_THICKNESS
		var response := 1.0 - exp(-18.0 * delta)
		_visual_alpha = lerpf(_visual_alpha, target_alpha, response)
		_visual_thickness = lerpf(_visual_thickness, target_thickness, response)
		queue_redraw()

	func _notification(what: int) -> void:
		if what == NOTIFICATION_MOUSE_ENTER:
			_hovered = true
			_activity_left = ACTIVITY_HOLD
		elif what == NOTIFICATION_MOUSE_EXIT:
			_hovered = false

	func _gui_input(event: InputEvent) -> void:
		if not _is_scrollable():
			return
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var thumb := _thumb_rect()
				_dragging = true
				_drag_offset = clampf(event.position.x - thumb.position.x, 0.0, thumb.size.x)
				_set_scroll_from_pointer(event.position.x)
			else:
				_dragging = false
			_activity_left = ACTIVITY_HOLD
			accept_event()
		elif event is InputEventMouseMotion and _dragging:
			_set_scroll_from_pointer(event.position.x)
			_activity_left = ACTIVITY_HOLD
			accept_event()

	func _draw() -> void:
		if not _is_scrollable() or _visual_alpha <= 0.01:
			return
		var thumb := _thumb_rect()
		var center_y := size.y - 4.0
		thumb.position.y = center_y - _visual_thickness * 0.5
		thumb.size.y = _visual_thickness
		_draw_pill(thumb, Color(0.28, 0.72, 0.83, _visual_alpha))

	func _is_scrollable() -> bool:
		return scroll_bar != null and is_instance_valid(scroll_bar) and scroll_bar.max_value > scroll_bar.page + 0.5

	func _thumb_rect() -> Rect2:
		var track_width := maxf(0.0, size.x - EDGE_PADDING * 2.0)
		if not _is_scrollable() or track_width <= 0.0:
			return Rect2(EDGE_PADDING, size.y - 5.0, track_width, IDLE_THICKNESS)
		var thumb_width := minf(INDICATOR_WIDTH, track_width)
		var available_width := maxf(0.0, track_width - thumb_width)
		var max_scroll := maxf(0.0, scroll_bar.max_value - scroll_bar.page)
		var ratio := 0.0 if max_scroll <= 0.0 else clampf(scroll_bar.value / max_scroll, 0.0, 1.0)
		return Rect2(EDGE_PADDING + available_width * ratio, size.y - 5.0, thumb_width, IDLE_THICKNESS)

	func _set_scroll_from_pointer(pointer_x: float) -> void:
		var thumb := _thumb_rect()
		var track_width := maxf(0.0, size.x - EDGE_PADDING * 2.0)
		var available_width := maxf(0.0, track_width - thumb.size.x)
		if available_width <= 0.0:
			return
		var thumb_x := clampf(pointer_x - _drag_offset - EDGE_PADDING, 0.0, available_width)
		var max_scroll := maxf(0.0, scroll_bar.max_value - scroll_bar.page)
		scroll_bar.value = thumb_x / available_width * max_scroll

	func _draw_pill(rect: Rect2, color: Color) -> void:
		if rect.size.x <= 0.0 or rect.size.y <= 0.0:
			return
		var radius := minf(rect.size.y * 0.5, rect.size.x * 0.5)
		var center_y := rect.position.y + rect.size.y * 0.5
		if rect.size.x > radius * 2.0:
			draw_rect(Rect2(rect.position.x + radius, rect.position.y, rect.size.x - radius * 2.0, rect.size.y), color, true)
		draw_circle(Vector2(rect.position.x + radius, center_y), radius, color)
		draw_circle(Vector2(rect.end.x - radius, center_y), radius, color)

class OverlayVerticalScrollIndicator extends Control:
	const EDGE_PADDING := 6.0
	const IDLE_THICKNESS := 2.0
	const ACTIVE_THICKNESS := 4.0
	const INDICATOR_LENGTH := 44.0
	const HIT_PADDING := 5.0
	const ACTIVITY_HOLD := 0.80

	var scroll_bar: VScrollBar
	var _hovered := false
	var _dragging := false
	var _drag_offset := 0.0
	var _activity_left := 0.0
	var _visual_alpha := 0.28
	var _visual_thickness := IDLE_THICKNESS
	var _last_scroll_value := 0.0

	func setup(target_scroll_bar: VScrollBar) -> void:
		scroll_bar = target_scroll_bar
		mouse_filter = Control.MOUSE_FILTER_STOP
		mouse_default_cursor_shape = Control.CURSOR_VSIZE
		set_process(true)
		queue_redraw()

	func _has_point(point: Vector2) -> bool:
		if not _is_scrollable():
			return false
		var thumb := _thumb_rect()
		var hit_rect := Rect2(
			0.0,
			thumb.position.y - HIT_PADDING,
			size.x,
			thumb.size.y + HIT_PADDING * 2.0
		)
		return hit_rect.has_point(point)

	func _process(delta: float) -> void:
		if scroll_bar == null or not is_instance_valid(scroll_bar):
			visible = false
			return
		visible = _is_scrollable()
		if not visible:
			return
		if _dragging and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_dragging = false
		if not is_equal_approx(scroll_bar.value, _last_scroll_value):
			_last_scroll_value = scroll_bar.value
			_activity_left = ACTIVITY_HOLD
		_activity_left = maxf(0.0, _activity_left - delta)
		var target_alpha := 0.95 if _dragging else (0.72 if _hovered else (0.48 if _activity_left > 0.0 else 0.28))
		var target_thickness := ACTIVE_THICKNESS if _hovered or _dragging else IDLE_THICKNESS
		var response := 1.0 - exp(-18.0 * delta)
		_visual_alpha = lerpf(_visual_alpha, target_alpha, response)
		_visual_thickness = lerpf(_visual_thickness, target_thickness, response)
		queue_redraw()

	func _notification(what: int) -> void:
		if what == NOTIFICATION_MOUSE_ENTER:
			_hovered = true
			_activity_left = ACTIVITY_HOLD
		elif what == NOTIFICATION_MOUSE_EXIT:
			_hovered = false

	func _gui_input(event: InputEvent) -> void:
		if not _is_scrollable():
			return
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var thumb := _thumb_rect()
				_dragging = true
				_drag_offset = clampf(event.position.y - thumb.position.y, 0.0, thumb.size.y)
				_set_scroll_from_pointer(event.position.y)
			else:
				_dragging = false
			_activity_left = ACTIVITY_HOLD
			accept_event()
		elif event is InputEventMouseMotion and _dragging:
			_set_scroll_from_pointer(event.position.y)
			_activity_left = ACTIVITY_HOLD
			accept_event()

	func _draw() -> void:
		if not _is_scrollable() or _visual_alpha <= 0.01:
			return
		var thumb := _thumb_rect()
		var center_x := size.x * 0.5
		thumb.position.x = center_x - _visual_thickness * 0.5
		thumb.size.x = _visual_thickness
		_draw_vertical_pill(thumb, Color(0.28, 0.72, 0.83, _visual_alpha))

	func _is_scrollable() -> bool:
		return scroll_bar != null and is_instance_valid(scroll_bar) and scroll_bar.max_value > scroll_bar.page + 0.5

	func _thumb_rect() -> Rect2:
		var track_height := maxf(0.0, size.y - EDGE_PADDING * 2.0)
		if not _is_scrollable() or track_height <= 0.0:
			return Rect2(size.x * 0.5 - IDLE_THICKNESS * 0.5, EDGE_PADDING, IDLE_THICKNESS, track_height)
		var thumb_height := minf(INDICATOR_LENGTH, track_height)
		var available_height := maxf(0.0, track_height - thumb_height)
		var max_scroll := maxf(0.0, scroll_bar.max_value - scroll_bar.page)
		var ratio := 0.0 if max_scroll <= 0.0 else clampf(scroll_bar.value / max_scroll, 0.0, 1.0)
		return Rect2(size.x * 0.5 - IDLE_THICKNESS * 0.5, EDGE_PADDING + available_height * ratio, IDLE_THICKNESS, thumb_height)

	func _set_scroll_from_pointer(pointer_y: float) -> void:
		var thumb := _thumb_rect()
		var track_height := maxf(0.0, size.y - EDGE_PADDING * 2.0)
		var available_height := maxf(0.0, track_height - thumb.size.y)
		if available_height <= 0.0:
			return
		var thumb_y := clampf(pointer_y - _drag_offset - EDGE_PADDING, 0.0, available_height)
		var max_scroll := maxf(0.0, scroll_bar.max_value - scroll_bar.page)
		scroll_bar.value = thumb_y / available_height * max_scroll

	func _draw_vertical_pill(rect: Rect2, color: Color) -> void:
		if rect.size.x <= 0.0 or rect.size.y <= 0.0:
			return
		var radius := minf(rect.size.x * 0.5, rect.size.y * 0.5)
		var center_x := rect.position.x + rect.size.x * 0.5
		if rect.size.y > radius * 2.0:
			draw_rect(Rect2(rect.position.x, rect.position.y + radius, rect.size.x, rect.size.y - radius * 2.0), color, true)
		draw_circle(Vector2(center_x, rect.position.y + radius), radius, color)
		draw_circle(Vector2(center_x, rect.end.y - radius), radius, color)

var _test_ui: Control
var _test_title: Label
var _save_state_label: Label
var _validation_button: Button
var _test_run_button: Button
var _validation_popup: PopupPanel
var _validation_list: VBoxContainer

var _resource_tab_buttons: Dictionary = {}
var _resource_search: LineEdit
var _resource_header_add_button: Button
var _resource_scroll: ScrollContainer
var _resource_scroll_indicator: OverlayVerticalScrollIndicator
var _resource_grid: GridContainer
var _expression_separator: HSeparator
var _expression_header: Label
var _expression_view: Control
var _expression_scroll: ScrollContainer
var _expression_scroll_indicator: OverlayVerticalScrollIndicator
var _expression_grid: GridContainer
var _active_resource_tab := "character"
var _selected_resource_character := ""
var _character_entries: Array = []
var _background_entries: Array = []
var _music_entries: Array = []

var _preview_texture: TextureRect
var _timeline_surface: TimelineSurface
var _timeline_scroll: ScrollContainer
var _timeline_scroll_indicator: OverlayScrollIndicator
var _timeline_cards: Dictionary = {}
var _selected_test_index := -1

var _property_content: VBoxContainer
var _history_content: VBoxContainer
var _history_entries: Array[Dictionary] = []
var _notice_dialog: AcceptDialog
var _active_property_control: Control = null
var _active_property_block: ScriptBlock = null
var _active_property_key := ""
var _active_property_label := ""
var _active_property_kind := ""

func _ready() -> void:
	super()
	# 旧版依靠可见的 SubViewportContainer 驱动尺寸；隐藏旧 UI 后必须显式固定，
	# 否则 SubViewport 会退回默认正方形尺寸。
	var legacy_preview_container := get_node_or_null("MainContainer/CenterPanel/PreviewPanel/PreviewContainer/PreviewAspect/PreviewArea") as SubViewportContainer
	if legacy_preview_container:
		legacy_preview_container.stretch = false
	preview_viewport.size = Vector2i(960, 540)
	preview_viewport.size_2d_override = Vector2i(1280, 720)
	_hide_legacy_editor_ui()
	_build_test_editor_ui()
	set_process(true)

func _on_back_button_pressed() -> void:
	_commit_active_property_editor()
	super()

func _process(_delta: float) -> void:
	if _test_run_button:
		_test_run_button.text = "停止" if is_previewing else "运行"

func _input(event: InputEvent) -> void:
	super(event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		_clear_timeline_drop_target()
	elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		_clear_timeline_drop_target()

func load_project(path: String) -> void:
	super(path)
	_test_title.text = str(project_config.get("project_name", "未命名剧情节")).replace(" - ", " · ")
	_save_state_label.text = "已保存"
	_collect_resource_entries()
	_populate_resource_grid()
	_rebuild_timeline()
	_refresh_validation_badge()
	_add_history("打开剧情节")
	if not script_blocks.is_empty():
		_select_test_block(0)
	else:
		_refresh_property_panel()

func _hide_legacy_editor_ui() -> void:
	var legacy_top := get_node_or_null("TopBar") as Control
	var legacy_main := get_node_or_null("MainContainer") as Control
	if legacy_top:
		legacy_top.visible = false
		legacy_top.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if legacy_main:
		legacy_main.visible = false
		legacy_main.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var legacy_background := get_node_or_null("Background") as ColorRect
	if legacy_background:
		legacy_background.color = COLOR_CANVAS

func _build_test_editor_ui() -> void:
	_test_ui = MarginContainer.new()
	_test_ui.name = "TestEditorUI"
	_test_ui.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_test_ui.add_theme_constant_override("margin_left", 8)
	_test_ui.add_theme_constant_override("margin_top", 8)
	_test_ui.add_theme_constant_override("margin_right", 8)
	_test_ui.add_theme_constant_override("margin_bottom", 8)
	var test_theme := Theme.new()
	test_theme.default_font = TEST_UI_FONT
	test_theme.default_font_size = 16
	_test_ui.theme = test_theme
	add_child(_test_ui)

	var root_column := VBoxContainer.new()
	root_column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	root_column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root_column.add_theme_constant_override("separation", 8)
	_test_ui.add_child(root_column)

	root_column.add_child(_build_test_top_bar())

	var body := HBoxContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", 8)
	root_column.add_child(body)

	body.add_child(_build_resource_dock())
	body.add_child(_build_workspace())
	body.add_child(_build_right_dock())
	_build_validation_popup()
	_build_notice_dialog()

func _build_test_top_bar() -> Control:
	var panel := _new_panel(COLOR_SURFACE, COLOR_LINE)
	panel.custom_minimum_size = Vector2(0, 52)

	var margin := _new_margin(14, 6, 14, 6)
	panel.add_child(margin)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	margin.add_child(row)

	var back := Button.new()
	back.text = "‹  返回"
	back.custom_minimum_size = Vector2(92, 38)
	_configure_flat_button(back)
	back.pressed.connect(_on_back_button_pressed)
	row.add_child(back)

	var beta_label := Label.new()
	beta_label.text = "测试版"
	beta_label.add_theme_color_override("font_color", COLOR_CYAN)
	beta_label.add_theme_font_size_override("font_size", 13)
	beta_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(beta_label)

	_test_title = Label.new()
	_test_title.text = "未加载剧情节"
	_test_title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_test_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_test_title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_test_title.add_theme_color_override("font_color", COLOR_TEXT)
	_test_title.add_theme_font_size_override("font_size", 21)
	row.add_child(_test_title)

	_save_state_label = Label.new()
	_save_state_label.text = "等待加载"
	_save_state_label.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
	_save_state_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(_save_state_label)

	_validation_button = Button.new()
	_validation_button.text = "0"
	_validation_button.tooltip_text = "查看校验问题"
	_validation_button.custom_minimum_size = Vector2(38, 34)
	_configure_validation_button(_validation_button, false)
	_validation_button.pressed.connect(_show_validation_popup)
	row.add_child(_validation_button)

	_test_run_button = Button.new()
	_test_run_button.text = "运行"
	_test_run_button.custom_minimum_size = Vector2(86, 38)
	_configure_primary_button(_test_run_button)
	_test_run_button.pressed.connect(_on_test_run_pressed)
	row.add_child(_test_run_button)
	return panel

func _build_resource_dock() -> Control:
	var panel := _new_panel(COLOR_SURFACE, COLOR_LINE)
	panel.custom_minimum_size = Vector2(LEFT_DOCK_WIDTH, 0)
	panel.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var margin := _new_margin(12, 10, 12, 10)
	panel.add_child(margin)
	var column := VBoxContainer.new()
	column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	column.add_theme_constant_override("separation", 8)
	margin.add_child(column)

	column.add_child(_section_title("资源"))
	var tabs := HBoxContainer.new()
	tabs.add_theme_constant_override("separation", 0)
	column.add_child(tabs)
	for tab_data in [
		{"key": "character", "text": "角色"},
		{"key": "background", "text": "背景"},
		{"key": "music", "text": "音乐"},
	]:
		var tab := Button.new()
		tab.text = str(tab_data["text"])
		tab.toggle_mode = true
		tab.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		tab.custom_minimum_size = Vector2(0, 36)
		_configure_tab_button(tab)
		tab.pressed.connect(_on_resource_tab_pressed.bind(str(tab_data["key"])))
		tabs.add_child(tab)
		_resource_tab_buttons[str(tab_data["key"])] = tab

	var search_row := HBoxContainer.new()
	search_row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	search_row.add_theme_constant_override("separation", 6)
	column.add_child(search_row)

	_resource_search = LineEdit.new()
	_resource_search.placeholder_text = "搜索资源..."
	_resource_search.clear_button_enabled = true
	_resource_search.custom_minimum_size = Vector2(0, 36)
	_resource_search.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_configure_line_edit(_resource_search)
	_resource_search.text_changed.connect(_on_resource_search_changed)
	search_row.add_child(_resource_search)

	_resource_header_add_button = Button.new()
	_resource_header_add_button.text = "＋"
	_resource_header_add_button.custom_minimum_size = Vector2(36, 36)
	_resource_header_add_button.tooltip_text = "添加角色"
	_resource_header_add_button.add_theme_font_size_override("font_size", 20)
	_configure_flat_button(_resource_header_add_button)
	_resource_header_add_button.add_theme_color_override("font_color", COLOR_CYAN)
	_resource_header_add_button.add_theme_color_override("font_hover_color", COLOR_CYAN.lightened(0.16))
	_resource_header_add_button.pressed.connect(_on_resource_header_add_pressed)
	search_row.add_child(_resource_header_add_button)

	var resource_view := Control.new()
	resource_view.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	resource_view.size_flags_vertical = Control.SIZE_EXPAND_FILL
	column.add_child(resource_view)
	_resource_scroll = ScrollContainer.new()
	_resource_scroll.anchor_right = 1.0
	_resource_scroll.anchor_bottom = 1.0
	_resource_scroll.offset_right = -RESOURCE_SCROLL_GUTTER
	_resource_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_resource_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	resource_view.add_child(_resource_scroll)
	_resource_grid = GridContainer.new()
	_resource_grid.columns = 3
	_resource_grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_resource_grid.add_theme_constant_override("h_separation", 6)
	_resource_grid.add_theme_constant_override("v_separation", 8)
	_resource_scroll.add_child(_resource_grid)
	_resource_scroll_indicator = OverlayVerticalScrollIndicator.new()
	_resource_scroll_indicator.anchor_left = 1.0
	_resource_scroll_indicator.anchor_top = 0.0
	_resource_scroll_indicator.anchor_right = 1.0
	_resource_scroll_indicator.anchor_bottom = 1.0
	_resource_scroll_indicator.offset_left = -RESOURCE_SCROLL_GUTTER
	_resource_scroll_indicator.offset_right = 0.0
	_resource_scroll_indicator.z_index = 20
	_resource_scroll_indicator.setup(_resource_scroll.get_v_scroll_bar())
	resource_view.add_child(_resource_scroll_indicator)

	_expression_separator = HSeparator.new()
	_expression_separator.add_theme_stylebox_override("separator", _line_style())
	column.add_child(_expression_separator)
	_expression_header = Label.new()
	_expression_header.text = "选择角色后显示表情"
	_expression_header.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
	column.add_child(_expression_header)
	_expression_view = Control.new()
	_expression_view.custom_minimum_size = Vector2(0, 200)
	column.add_child(_expression_view)
	_expression_scroll = ScrollContainer.new()
	_expression_scroll.anchor_right = 1.0
	_expression_scroll.anchor_bottom = 1.0
	_expression_scroll.offset_right = -RESOURCE_SCROLL_GUTTER
	_expression_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_expression_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	_expression_view.add_child(_expression_scroll)
	_expression_grid = GridContainer.new()
	_expression_grid.columns = 3
	_expression_grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_expression_grid.add_theme_constant_override("h_separation", 6)
	_expression_grid.add_theme_constant_override("v_separation", 8)
	_expression_scroll.add_child(_expression_grid)
	_expression_scroll_indicator = OverlayVerticalScrollIndicator.new()
	_expression_scroll_indicator.anchor_left = 1.0
	_expression_scroll_indicator.anchor_top = 0.0
	_expression_scroll_indicator.anchor_right = 1.0
	_expression_scroll_indicator.anchor_bottom = 1.0
	_expression_scroll_indicator.offset_left = -RESOURCE_SCROLL_GUTTER
	_expression_scroll_indicator.offset_right = 0.0
	_expression_scroll_indicator.z_index = 20
	_expression_scroll_indicator.setup(_expression_scroll.get_v_scroll_bar())
	_expression_view.add_child(_expression_scroll_indicator)
	_set_expression_area_visible(false)
	_update_resource_tab_visuals()
	return panel

func _build_workspace() -> Control:
	var column := VBoxContainer.new()
	column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	column.add_theme_constant_override("separation", 8)

	var preview_panel := _new_panel(Color("080c10"), COLOR_LINE)
	preview_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	preview_panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var preview_margin := _new_margin(8, 8, 8, 8)
	preview_panel.add_child(preview_margin)
	var preview_aspect := AspectRatioContainer.new()
	preview_aspect.ratio = 16.0 / 9.0
	preview_aspect.stretch_mode = AspectRatioContainer.STRETCH_FIT
	preview_aspect.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	preview_aspect.size_flags_vertical = Control.SIZE_EXPAND_FILL
	preview_margin.add_child(preview_aspect)
	_preview_texture = TextureRect.new()
	_preview_texture.texture = preview_viewport.get_texture()
	_preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_preview_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	_preview_texture.mouse_filter = Control.MOUSE_FILTER_IGNORE
	preview_aspect.add_child(_preview_texture)
	column.add_child(preview_panel)

	column.add_child(_build_timeline_panel())
	return column

func _build_timeline_panel() -> Control:
	var panel := _new_panel(COLOR_SURFACE, COLOR_LINE)
	panel.custom_minimum_size = Vector2(0, TIMELINE_HEIGHT)
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var margin := _new_margin(8, 7, 8, 7)
	panel.add_child(margin)
	var column := VBoxContainer.new()
	column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	column.add_theme_constant_override("separation", 5)
	margin.add_child(column)

	var header := HBoxContainer.new()
	header.custom_minimum_size = Vector2(0, 26)
	column.add_child(header)
	var title := _section_title("脚本序列")
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_child(title)
	var sequence_hint := Label.new()
	sequence_hint.text = "按剧情步骤排列"
	sequence_hint.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
	sequence_hint.add_theme_font_size_override("font_size", 12)
	header.add_child(sequence_hint)

	var timeline_body := HBoxContainer.new()
	timeline_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	timeline_body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	timeline_body.add_theme_constant_override("separation", 0)
	column.add_child(timeline_body)
	timeline_body.add_child(_build_track_labels())

	var timeline_view := Control.new()
	timeline_view.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	timeline_view.size_flags_vertical = Control.SIZE_EXPAND_FILL
	timeline_body.add_child(timeline_view)

	_timeline_scroll = ScrollContainer.new()
	_timeline_scroll.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_timeline_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	_timeline_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	timeline_view.add_child(_timeline_scroll)
	_timeline_surface = TimelineSurface.new()
	_timeline_surface.cell_width = TIMELINE_STEP
	_timeline_surface.start_x = TIMELINE_START_X
	_timeline_surface.custom_minimum_size = Vector2(900, TIMELINE_SURFACE_HEIGHT)
	_bind_timeline_drop_target(_timeline_surface)
	_timeline_scroll.add_child(_timeline_surface)

	_timeline_scroll_indicator = OverlayScrollIndicator.new()
	_timeline_scroll_indicator.anchor_left = 0.0
	_timeline_scroll_indicator.anchor_top = 1.0
	_timeline_scroll_indicator.anchor_right = 1.0
	_timeline_scroll_indicator.anchor_bottom = 1.0
	_timeline_scroll_indicator.offset_top = -10.0
	_timeline_scroll_indicator.offset_bottom = 0.0
	_timeline_scroll_indicator.z_index = 20
	_timeline_scroll_indicator.setup(_timeline_scroll.get_h_scroll_bar())
	timeline_view.add_child(_timeline_scroll_indicator)
	return panel

func _build_track_labels() -> Control:
	var labels := Control.new()
	labels.custom_minimum_size = Vector2(116, TIMELINE_SURFACE_HEIGHT)
	labels.add_theme_stylebox_override("panel", _make_style(Color("0d1319"), COLOR_LINE))
	_add_positioned_label(labels, "对话", Rect2(10, 34, 96, 38), 16, COLOR_TEXT)
	_add_positioned_label(labels, "角色", Rect2(10, 76, 44, 78), 16, COLOR_TEXT)
	_add_positioned_label(labels, "角色1", Rect2(54, 76, 60, 38), 12, COLOR_TEXT_MUTED)
	_add_positioned_label(labels, "角色2", Rect2(54, 116, 60, 38), 12, COLOR_TEXT_MUTED)
	_add_positioned_label(labels, "背景", Rect2(10, 158, 96, 38), 16, COLOR_TEXT)
	_add_positioned_label(labels, "音乐", Rect2(10, 200, 96, 38), 16, COLOR_TEXT)
	for y in [30.0, 72.0, 112.0, 154.0, 196.0, 237.0]:
		var line := ColorRect.new()
		line.color = COLOR_LINE
		line.position = Vector2(0, y)
		line.size = Vector2(116, 1)
		line.mouse_filter = Control.MOUSE_FILTER_IGNORE
		labels.add_child(line)
	return labels

func _build_right_dock() -> Control:
	var column := VBoxContainer.new()
	column.custom_minimum_size = Vector2(RIGHT_DOCK_WIDTH, 0)
	column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	column.add_theme_constant_override("separation", 8)

	var property_panel := _new_panel(COLOR_SURFACE, COLOR_LINE)
	property_panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var property_margin := _new_margin(12, 10, 12, 10)
	property_panel.add_child(property_margin)
	var property_column := VBoxContainer.new()
	property_column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	property_column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	property_column.add_theme_constant_override("separation", 7)
	property_margin.add_child(property_column)
	property_column.add_child(_section_title("属性"))
	var property_scroll := ScrollContainer.new()
	property_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	property_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	property_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	property_column.add_child(property_scroll)
	_property_content = VBoxContainer.new()
	_property_content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_property_content.add_theme_constant_override("separation", 7)
	property_scroll.add_child(_property_content)
	column.add_child(property_panel)

	var history_panel := _new_panel(COLOR_SURFACE, COLOR_LINE)
	history_panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var history_margin := _new_margin(12, 10, 12, 10)
	history_panel.add_child(history_margin)
	var history_column := VBoxContainer.new()
	history_column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	history_column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	history_column.add_theme_constant_override("separation", 7)
	history_margin.add_child(history_column)
	history_column.add_child(_section_title("历史记录"))
	var history_scroll := ScrollContainer.new()
	history_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	history_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	history_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	history_column.add_child(history_scroll)
	_history_content = VBoxContainer.new()
	_history_content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_history_content.add_theme_constant_override("separation", 0)
	history_scroll.add_child(_history_content)
	column.add_child(history_panel)
	return column

func _build_validation_popup() -> void:
	_validation_popup = PopupPanel.new()
	_validation_popup.title = "校验问题"
	add_child(_validation_popup)
	var margin := _new_margin(14, 14, 14, 14)
	margin.custom_minimum_size = Vector2(420, 300)
	_validation_popup.add_child(margin)
	var column := VBoxContainer.new()
	column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	column.size_flags_vertical = Control.SIZE_EXPAND_FILL
	column.add_theme_constant_override("separation", 8)
	margin.add_child(column)
	column.add_child(_section_title("校验问题"))
	var scroll := ScrollContainer.new()
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	column.add_child(scroll)
	_validation_list = VBoxContainer.new()
	_validation_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_validation_list.add_theme_constant_override("separation", 6)
	scroll.add_child(_validation_list)

func _build_notice_dialog() -> void:
	_notice_dialog = AcceptDialog.new()
	_notice_dialog.title = "测试版编辑器"
	_notice_dialog.ok_button_text = "知道了"
	add_child(_notice_dialog)

func _new_panel(background_color: Color, border_color: Color) -> PanelContainer:
	var panel := PanelContainer.new()
	panel.add_theme_stylebox_override("panel", _make_style(background_color, border_color))
	return panel

func _new_margin(left: int, top: int, right: int, bottom: int) -> MarginContainer:
	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", left)
	margin.add_theme_constant_override("margin_top", top)
	margin.add_theme_constant_override("margin_right", right)
	margin.add_theme_constant_override("margin_bottom", bottom)
	return margin

func _make_style(background_color: Color, border_color: Color, radius: int = 5) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = background_color
	style.border_width_left = 1
	style.border_width_top = 1
	style.border_width_right = 1
	style.border_width_bottom = 1
	style.border_color = border_color
	style.corner_radius_top_left = radius
	style.corner_radius_top_right = radius
	style.corner_radius_bottom_left = radius
	style.corner_radius_bottom_right = radius
	style.content_margin_left = 8
	style.content_margin_top = 5
	style.content_margin_right = 8
	style.content_margin_bottom = 5
	return style

func _line_style() -> StyleBoxLine:
	var style := StyleBoxLine.new()
	style.color = COLOR_LINE
	style.thickness = 1
	return style

func _section_title(text: String) -> Label:
	var label := Label.new()
	label.text = text
	label.add_theme_color_override("font_color", COLOR_TEXT)
	label.add_theme_font_size_override("font_size", 17)
	return label

func _configure_flat_button(button: Button) -> void:
	button.add_theme_color_override("font_color", COLOR_TEXT)
	button.add_theme_color_override("font_hover_color", Color.WHITE)
	button.add_theme_stylebox_override("normal", _make_style(Color.TRANSPARENT, Color.TRANSPARENT))
	button.add_theme_stylebox_override("hover", _make_style(COLOR_SURFACE_ALT, COLOR_LINE))
	button.add_theme_stylebox_override("pressed", _make_style(COLOR_INPUT, COLOR_CYAN))
	button.focus_mode = Control.FOCUS_NONE

func _configure_primary_button(button: Button) -> void:
	button.add_theme_color_override("font_color", Color("071014"))
	button.add_theme_color_override("font_hover_color", Color("071014"))
	button.add_theme_stylebox_override("normal", _make_style(Color("48b8d3"), Color("48b8d3")))
	button.add_theme_stylebox_override("hover", _make_style(Color("62c4dc"), Color("62c4dc")))
	button.add_theme_stylebox_override("pressed", _make_style(Color("3aa4bd"), Color("3aa4bd")))
	button.focus_mode = Control.FOCUS_NONE

func _configure_validation_button(button: Button, has_issues: bool) -> void:
	var color := COLOR_DANGER if has_issues else COLOR_TEXT_MUTED
	button.add_theme_color_override("font_color", color)
	button.add_theme_color_override("font_hover_color", color.lightened(0.12))
	button.add_theme_stylebox_override("normal", _make_style(Color.TRANSPARENT, color, 4))
	button.add_theme_stylebox_override("hover", _make_style(Color(color, 0.08), color, 4))
	button.add_theme_stylebox_override("pressed", _make_style(Color(color, 0.14), color, 4))
	button.focus_mode = Control.FOCUS_NONE

func _configure_tab_button(button: Button) -> void:
	button.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
	button.add_theme_color_override("font_hover_color", COLOR_TEXT)
	button.add_theme_color_override("font_pressed_color", COLOR_TEXT)
	button.add_theme_stylebox_override("normal", _make_style(Color.TRANSPARENT, COLOR_LINE, 3))
	button.add_theme_stylebox_override("hover", _make_style(COLOR_SURFACE_ALT, COLOR_LINE_STRONG, 3))
	button.add_theme_stylebox_override("pressed", _make_style(COLOR_INPUT, COLOR_CYAN, 3))
	button.focus_mode = Control.FOCUS_NONE

func _configure_line_edit(line_edit: LineEdit) -> void:
	line_edit.add_theme_color_override("font_color", COLOR_TEXT)
	line_edit.add_theme_color_override("font_placeholder_color", COLOR_TEXT_MUTED)
	line_edit.add_theme_stylebox_override("normal", _make_style(COLOR_INPUT, COLOR_LINE, 4))
	line_edit.add_theme_stylebox_override("focus", _make_style(COLOR_INPUT, COLOR_CYAN, 4))

func _configure_timeline_button(button: Button, selected: bool, compatibility_warning: bool = false) -> void:
	var border := COLOR_CYAN if selected else (COLOR_DANGER if compatibility_warning else COLOR_LINE_STRONG)
	var background := Color("11212a") if selected else COLOR_SURFACE_ALT
	button.add_theme_color_override("font_color", COLOR_TEXT)
	button.add_theme_font_size_override("font_size", 12)
	button.add_theme_stylebox_override("normal", _make_style(background, border, 3))
	button.add_theme_stylebox_override("hover", _make_style(background.lightened(0.05), COLOR_CYAN, 3))
	button.add_theme_stylebox_override("pressed", _make_style(COLOR_INPUT, COLOR_CYAN, 3))
	button.focus_mode = Control.FOCUS_NONE

func _add_positioned_label(parent: Control, text: String, rect: Rect2, font_size: int, color: Color) -> void:
	var label := Label.new()
	label.text = text
	label.position = rect.position
	label.size = rect.size
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", color)
	parent.add_child(label)

func _collect_resource_entries() -> void:
	_character_entries.clear()
	_background_entries.clear()
	_music_entries.clear()

	var character_names: Array[String] = []
	for entry_name: String in DirAccess.get_files_at("res://scenes/character"):
		var normalized := _normalize_listed_file_name(entry_name)
		if normalized.to_lower().ends_with(".tscn"):
			character_names.append(normalized.trim_suffix(".tscn"))
	character_names.sort()
	for character_name in character_names:
		_character_entries.append({"display": character_name, "key": character_name})
	for custom_entry_any in _get_custom_character_entries():
		if typeof(custom_entry_any) == TYPE_DICTIONARY:
			var custom_entry := custom_entry_any as Dictionary
			_character_entries.append({
				"display": str(custom_entry.get("display", "自定义角色")),
				"key": str(custom_entry.get("full_path", "")),
			})

	var index := _get_resource_index()
	var backgrounds_any: Variant = index.get("backgrounds", {})
	if typeof(backgrounds_any) == TYPE_DICTIONARY:
		var backgrounds := backgrounds_any as Dictionary
		var base_dir := str(backgrounds.get("base_dir", "res://assets/images/bg/"))
		for file_any in backgrounds.get("root", []):
			var file_name := str(file_any)
			_background_entries.append({"display": file_name.get_basename(), "key": base_dir + file_name})
		var folders_any: Variant = backgrounds.get("folders", {})
		if typeof(folders_any) == TYPE_DICTIONARY:
			var folders := folders_any as Dictionary
			for folder_any in folders.keys():
				var folder := str(folder_any)
				for file_any in folders.get(folder, []):
					var file_name := str(file_any)
					_background_entries.append({
						"display": file_name.get_basename(),
						"key": base_dir + folder + "/" + file_name,
					})
	for custom_background_any in _get_custom_background_tab_entries():
		if typeof(custom_background_any) == TYPE_DICTIONARY:
			var custom_background := custom_background_any as Dictionary
			_background_entries.append({
				"display": str(custom_background.get("display", "自定义背景")),
				"key": str(custom_background.get("full_path", "")),
			})

	var music_any: Variant = index.get("music", {})
	if typeof(music_any) == TYPE_DICTIONARY:
		var music := music_any as Dictionary
		var music_base := str(music.get("base_dir", "res://assets/audio/music/"))
		for file_any in music.get("files", []):
			var file_name := str(file_any)
			_music_entries.append({"display": file_name.get_basename(), "key": music_base + file_name})
	for custom_music_any in _get_custom_music_entries():
		if typeof(custom_music_any) == TYPE_DICTIONARY:
			var custom_music := custom_music_any as Dictionary
			_music_entries.append({
				"display": str(custom_music.get("display", "自定义音乐")),
				"key": str(custom_music.get("full_path", "")),
			})

func _on_resource_tab_pressed(tab_key: String) -> void:
	if _active_resource_tab == "music" and tab_key != "music":
		_stop_music_preview()
	_active_resource_tab = tab_key
	_resource_search.text = ""
	_selected_resource_character = ""
	_set_expression_area_visible(false)
	_update_resource_tab_visuals()
	_populate_resource_grid()

func _on_resource_search_changed(_text: String) -> void:
	if _active_resource_tab == "music":
		_stop_music_preview()
	_populate_resource_grid()

func _update_resource_tab_visuals() -> void:
	for key_any in _resource_tab_buttons.keys():
		var key := str(key_any)
		var button := _resource_tab_buttons[key] as Button
		if button:
			button.set_pressed_no_signal(key == _active_resource_tab)
			button.add_theme_color_override("font_color", COLOR_TEXT if key == _active_resource_tab else COLOR_TEXT_MUTED)
	if _resource_header_add_button:
		_resource_header_add_button.tooltip_text = "添加" + _resource_kind_name(_active_resource_tab)

func _on_resource_header_add_pressed() -> void:
	_on_add_asset_requested(_active_resource_tab)

func _populate_resource_grid() -> void:
	if _resource_grid == null:
		return
	_music_preview_buttons_by_path.clear()
	_clear_beta_children(_resource_grid)
	var entries: Array = _character_entries
	_resource_grid.columns = 3
	if _active_resource_tab == "background":
		entries = _background_entries
		_resource_grid.columns = 3
	elif _active_resource_tab == "music":
		entries = _music_entries
		_resource_grid.columns = 1

	var query := _resource_search.text.strip_edges().to_lower() if _resource_search else ""
	var visible_count := 0
	for entry_any in entries:
		if typeof(entry_any) != TYPE_DICTIONARY:
			continue
		var entry := entry_any as Dictionary
		var display_name := str(entry.get("display", ""))
		var key := str(entry.get("key", ""))
		if not query.is_empty() and display_name.to_lower().find(query) == -1:
			continue
		var texture: Texture2D = null
		if _active_resource_tab == "character":
			texture = _get_character_thumbnail(key)
		elif _active_resource_tab == "background":
			texture = _get_background_thumbnail(key)
		if _active_resource_tab == "music":
			_resource_grid.add_child(_make_music_resource_row(display_name, key))
		else:
			_resource_grid.add_child(_make_resource_card(display_name, key, _active_resource_tab, texture))
		visible_count += 1
		if visible_count >= MAX_VISIBLE_RESOURCES:
			break
	if _active_resource_tab == "music":
		_update_music_preview_buttons()

func _make_resource_card(display_name: String, key: String, kind: String, texture: Texture2D) -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(74, 92 if kind != "music" else 48)
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var card_style := _make_style(COLOR_INPUT, COLOR_LINE, 4)
	card_style.content_margin_left = 2
	card_style.content_margin_top = 2
	card_style.content_margin_right = 2
	card_style.content_margin_bottom = 2
	panel.add_theme_stylebox_override("panel", card_style)
	_configure_resource_drag_source(panel, kind, key, display_name)
	var column := VBoxContainer.new()
	column.add_theme_constant_override("separation", 2)
	panel.add_child(column)

	var holder := Control.new()
	holder.custom_minimum_size = Vector2(72, 66 if kind != "music" else 22)
	column.add_child(holder)
	var select_button := TextureButton.new()
	select_button.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	select_button.ignore_texture_size = true
	select_button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	select_button.texture_normal = texture
	select_button.tooltip_text = "%s\n拖动到%s轨道" % [display_name, "角色" if kind in ["character", "expression"] else _resource_kind_name(kind)]
	select_button.pressed.connect(_on_resource_selected.bind(kind, key))
	_configure_resource_drag_source(select_button, kind, key, display_name)
	holder.add_child(select_button)
	if texture == null:
		var placeholder := Label.new()
		placeholder.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		placeholder.text = "MUSIC" if kind == "music" else display_name.substr(0, 2).to_upper()
		placeholder.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		placeholder.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		placeholder.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		placeholder.add_theme_font_size_override("font_size", 11)
		placeholder.mouse_filter = Control.MOUSE_FILTER_IGNORE
		holder.add_child(placeholder)

	var label_holder := Control.new()
	label_holder.custom_minimum_size = Vector2(72, 18)
	label_holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	column.add_child(label_holder)
	var label := Label.new()
	label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	label.text = display_name
	label.clip_text = true
	label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.tooltip_text = display_name
	label.add_theme_color_override("font_color", COLOR_TEXT)
	label.add_theme_font_size_override("font_size", 11)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	label_holder.add_child(label)
	return panel

func _make_music_resource_row(display_name: String, key: String) -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(0, 48)
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var row_style := _make_style(COLOR_INPUT, COLOR_LINE, 4)
	row_style.content_margin_left = 4
	row_style.content_margin_top = 3
	row_style.content_margin_right = 4
	row_style.content_margin_bottom = 3
	panel.add_theme_stylebox_override("panel", row_style)
	_configure_resource_drag_source(panel, "music", key, display_name)

	var row := HBoxContainer.new()
	row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_theme_constant_override("separation", 4)
	panel.add_child(row)

	var drag_button := Button.new()
	drag_button.text = "♫  " + display_name
	drag_button.alignment = HORIZONTAL_ALIGNMENT_LEFT
	drag_button.clip_text = true
	drag_button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	drag_button.tooltip_text = "%s\n拖动到音乐轨道" % display_name
	drag_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	drag_button.custom_minimum_size = Vector2(0, 40)
	_configure_flat_button(drag_button)
	_configure_resource_drag_source(drag_button, "music", key, display_name)
	row.add_child(drag_button)

	var preview_button := Button.new()
	preview_button.text = "▶"
	preview_button.tooltip_text = "试听 / 暂停"
	preview_button.custom_minimum_size = Vector2(38, 40)
	preview_button.add_theme_font_size_override("font_size", 15)
	_configure_flat_button(preview_button)
	preview_button.pressed.connect(_toggle_test_music_preview.bind(key))
	row.add_child(preview_button)
	_music_preview_buttons_by_path[key] = preview_button
	return panel

func _toggle_test_music_preview(full_path: String) -> void:
	_ensure_music_preview_player()
	if _music_preview_player == null:
		return
	if _music_preview_current_path != full_path:
		_music_preview_player.stop()
		_music_preview_player.stream_paused = false
		var stream := _load_audio_stream_any(full_path)
		if stream == null:
			_music_preview_current_path = ""
			_update_music_preview_buttons()
			_show_notice("无法加载音乐资源：\n" + full_path)
			return
		_music_preview_player.stream = stream
		_music_preview_player.play()
		_music_preview_current_path = full_path
	else:
		if _music_preview_player.playing:
			_music_preview_player.stream_paused = not _music_preview_player.stream_paused
		else:
			_music_preview_player.stream_paused = false
			_music_preview_player.play()
	_update_music_preview_buttons()

func _configure_resource_drag_source(control: Control, kind: String, key: String, display_name: String) -> void:
	var character_key := _selected_resource_character if kind == "expression" else ""
	control.mouse_default_cursor_shape = Control.CURSOR_DRAG
	control.set_drag_forwarding(
		Callable(self, "_get_drag_data_for_resource").bind(control, kind, key, display_name, character_key),
		Callable(self, "_can_drop_data_on_resource"),
		Callable(self, "_drop_data_on_resource")
	)

func _get_drag_data_for_resource(_at_position: Vector2, source_control: Control, kind: String, key: String, display_name: String, character_key: String) -> Variant:
	if is_previewing or key.is_empty():
		return null
	var preview := Label.new()
	preview.text = "  %s  " % display_name
	preview.custom_minimum_size = Vector2(132, 34)
	preview.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	preview.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	preview.add_theme_color_override("font_color", COLOR_TEXT)
	preview.add_theme_stylebox_override("normal", _make_style(COLOR_SURFACE_ALT, COLOR_CYAN, 4))
	preview.mouse_filter = Control.MOUSE_FILTER_IGNORE
	source_control.set_drag_preview(preview)
	return {
		"drag_type": "beta_editor_resource",
		"kind": kind,
		"key": key,
		"display": display_name,
		"character_key": character_key,
	}

func _can_drop_data_on_resource(_at_position: Vector2, _data: Variant) -> bool:
	_clear_timeline_drop_target()
	return false

func _drop_data_on_resource(_at_position: Vector2, _data: Variant) -> void:
	_clear_timeline_drop_target()

func _on_resource_selected(kind: String, key: String) -> void:
	if kind == "character":
		_selected_resource_character = key
		_populate_expression_grid(key)

func _populate_expression_grid(character_key: String) -> void:
	_clear_beta_children(_expression_grid)
	var expressions := _get_character_expressions(character_key)
	_expression_header.text = character_key.get_file().get_basename() + " · 表情"
	_set_expression_area_visible(true)
	var count := 0
	for expression_name in expressions:
		var texture := _get_expression_thumbnail(character_key, expression_name)
		_expression_grid.add_child(_make_resource_card(expression_name, expression_name, "expression", texture))
		count += 1
		if count >= 18:
			break

func _set_expression_area_visible(visible_flag: bool) -> void:
	if _expression_separator:
		_expression_separator.visible = visible_flag
	if _expression_header:
		_expression_header.visible = visible_flag
	if _expression_view:
		_expression_view.visible = visible_flag

func _on_add_asset_requested(kind: String) -> void:
	_notice_dialog.dialog_text = "%s素材请从工程管理器的“导入自定义素材”进入。\n这里的按钮先保留为新版资源栏入口。" % _resource_kind_name(kind)
	_notice_dialog.popup_centered(Vector2i(500, 190))

func _resource_kind_name(kind: String) -> String:
	match kind:
		"character": return "角色"
		"expression": return "表情"
		"background": return "背景"
		"music": return "音乐"
	return "资源"

func _append_test_block(block_type: int, params: Dictionary, history_text: String) -> void:
	_insert_test_block(block_type, params, history_text, script_blocks.size())

func _insert_test_block(block_type: int, params: Dictionary, history_text: String, insert_index: int) -> void:
	_commit_active_property_editor()
	insert_index = clampi(insert_index, 0, script_blocks.size())
	var block := ScriptBlock.new(block_type)
	block.params = params.duplicate(true)
	script_blocks.insert(insert_index, block)
	_create_simplified_block_ui(block, false)
	if is_instance_valid(block.ui_node) and block.ui_node.get_parent() == script_sequence:
		script_sequence.move_child(block.ui_node, mini(insert_index, script_sequence.get_child_count() - 1))
	_refresh_all_block_numbers()
	_save_project()
	_validate_all_blocks()
	_save_state_label.text = "已保存"
	_add_history(history_text)
	_rebuild_timeline()
	_refresh_validation_badge()
	_select_test_block(insert_index)

func _bind_timeline_drop_target(control: Control) -> void:
	control.set_drag_forwarding(
		Callable(self, "_get_timeline_drag_data_noop"),
		Callable(self, "_can_drop_resource_on_timeline").bind(control),
		Callable(self, "_drop_resource_on_timeline").bind(control)
	)

func _get_timeline_drag_data_noop(_at_position: Vector2) -> Variant:
	return null

func _can_drop_resource_on_timeline(at_position: Vector2, data: Variant, target_control: Control) -> bool:
	if is_previewing or typeof(data) != TYPE_DICTIONARY:
		_clear_timeline_drop_target()
		return false
	var payload := data as Dictionary
	if str(payload.get("drag_type", "")) != "beta_editor_resource" or str(payload.get("key", "")).is_empty():
		_clear_timeline_drop_target()
		return false
	var local_position := _timeline_local_position(target_control, at_position)
	var row := _timeline_row_at_y(local_position.y)
	var insert_index := _timeline_insert_index_at_x(local_position.x)
	var kind := str(payload.get("kind", ""))
	var accepts_kind := (
		(kind == "character" and row in [1, 2])
		or (kind == "expression" and row in [1, 2])
		or (kind == "background" and row == 3)
		or (kind == "music" and row == 4)
	)
	if accepts_kind and kind == "expression":
		var character_key := str(payload.get("character_key", ""))
		accepts_kind = not character_key.is_empty() and _active_character_name_before_index(row, insert_index) == character_key
	if not accepts_kind:
		_clear_timeline_drop_target()
		return false
	_timeline_surface.set_drop_target(row, insert_index)
	return true

func _drop_resource_on_timeline(at_position: Vector2, data: Variant, target_control: Control) -> void:
	if not _can_drop_resource_on_timeline(at_position, data, target_control):
		return
	var payload := data as Dictionary
	var local_position := _timeline_local_position(target_control, at_position)
	var row := _timeline_row_at_y(local_position.y)
	var insert_index := _timeline_insert_index_at_x(local_position.x)
	var kind := str(payload.get("kind", ""))
	var key := str(payload.get("key", ""))
	var display_name := str(payload.get("display", key.get_file().get_basename()))
	_clear_timeline_drop_target()
	match kind:
		"character":
			var expressions := _get_character_expressions(key)
			var default_expression := "" if expressions.is_empty() else str(expressions[0])
			var block_type := BlockType.SHOW_CHARACTER_1 if row == 1 else BlockType.SHOW_CHARACTER_2
			_insert_test_block(block_type, {
				"character_name": key,
				"expression": default_expression,
				"x_position": 0.28 if row == 1 else 0.72,
			}, "拖入角色%d：%s" % [row, display_name], insert_index)
		"expression":
			var block_type := BlockType.CHANGE_EXPRESSION_1 if row == 1 else BlockType.CHANGE_EXPRESSION_2
			_insert_test_block(block_type, {"expression": key}, "角色%d切换表情：%s" % [row, display_name], insert_index)
		"background":
			_insert_test_block(BlockType.SHOW_BACKGROUND, {"background_path": key, "fade_time": 0.3}, "拖入背景：" + display_name, insert_index)
		"music":
			_insert_test_block(BlockType.CHANGE_MUSIC, {"music_path": key}, "拖入音乐：" + display_name, insert_index)

func _timeline_local_position(target_control: Control, at_position: Vector2) -> Vector2:
	if target_control == _timeline_surface:
		return at_position
	return target_control.get_global_rect().position + at_position - _timeline_surface.get_global_rect().position

func _timeline_row_at_y(local_y: float) -> int:
	if local_y >= 30.0 and local_y < 72.0:
		return 0
	if local_y >= 72.0 and local_y < 112.0:
		return 1
	if local_y >= 112.0 and local_y < 154.0:
		return 2
	if local_y >= 154.0 and local_y < 196.0:
		return 3
	if local_y >= 196.0 and local_y <= TIMELINE_SURFACE_HEIGHT:
		return 4
	return -1

func _timeline_insert_index_at_x(local_x: float) -> int:
	return clampi(int(round((local_x - TIMELINE_START_X) / TIMELINE_STEP)), 0, script_blocks.size())

func _active_character_name_before_index(slot: int, insert_index: int) -> String:
	var active_name := ""
	for index in range(clampi(insert_index, 0, script_blocks.size())):
		var block: ScriptBlock = script_blocks[index]
		if block.block_type == BlockType.HIDE_ALL_CHARACTERS:
			active_name = ""
		elif slot == 1:
			if block.block_type == BlockType.SHOW_CHARACTER_1:
				active_name = str(block.params.get("character_name", ""))
			elif block.block_type == BlockType.HIDE_CHARACTER_1:
				active_name = ""
		elif slot == 2:
			if block.block_type == BlockType.SHOW_CHARACTER_2:
				active_name = str(block.params.get("character_name", ""))
			elif block.block_type == BlockType.HIDE_CHARACTER_2:
				active_name = ""
	return active_name

func _clear_timeline_drop_target() -> void:
	if _timeline_surface:
		_timeline_surface.set_drop_target(-1, -1)

func _rebuild_timeline() -> void:
	if _timeline_surface == null:
		return
	_clear_beta_children(_timeline_surface)
	_timeline_cards.clear()
	var content_width := maxf(900.0, TIMELINE_START_X + float(script_blocks.size() + 1) * TIMELINE_STEP + 54.0)
	_timeline_surface.configure(script_blocks.size(), content_width)

	for index in range(script_blocks.size()):
		var number := Label.new()
		number.text = "%03d" % (index + 1)
		number.position = Vector2(TIMELINE_START_X + float(index) * TIMELINE_STEP + 22.0, 4.0)
		number.size = Vector2(54, 24)
		number.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		number.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		number.add_theme_font_size_override("font_size", 11)
		number.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_timeline_surface.add_child(number)

		var block = script_blocks[index]
		var row := _timeline_row_for_block(block.block_type)
		var card := Button.new()
		card.text = _timeline_card_text(index, block)
		card.tooltip_text = block.get_summary()
		card.clip_text = true
		card.position = Vector2(TIMELINE_START_X + float(index) * TIMELINE_STEP + 4.0, TIMELINE_ROW_Y[row] + 4.0)
		card.size = Vector2(TIMELINE_STEP - 8.0, 34.0)
		card.pressed.connect(_select_test_block.bind(index))
		card.set_meta("compatibility_warning", _is_role_three_type(block.block_type))
		_configure_timeline_button(card, index == _selected_test_index, bool(card.get_meta("compatibility_warning")))
		_bind_timeline_drop_target(card)
		_timeline_surface.add_child(card)
		_timeline_cards[index] = card

	var add_x := TIMELINE_START_X + float(script_blocks.size()) * TIMELINE_STEP + 8.0
	for row in range(TIMELINE_ROW_Y.size()):
		var add_button := Button.new()
		add_button.text = "+"
		add_button.tooltip_text = "在%s轨道末尾添加事件" % _track_name_for_row(row)
		add_button.position = Vector2(add_x, TIMELINE_ROW_Y[row] + 6.0)
		add_button.size = Vector2(30, 30)
		_configure_flat_button(add_button)
		add_button.pressed.connect(_on_timeline_add_pressed.bind(row))
		_bind_timeline_drop_target(add_button)
		_timeline_surface.add_child(add_button)
	_timeline_surface.set_playhead(_selected_test_index)

func _timeline_row_for_block(block_type: int) -> int:
	match block_type:
		BlockType.TEXT_ONLY, BlockType.DIALOG:
			return 0
		BlockType.SHOW_CHARACTER_1, BlockType.HIDE_CHARACTER_1, BlockType.EXPRESSION, BlockType.MOVE_CHARACTER_1_LEFT, BlockType.CHANGE_EXPRESSION_1, BlockType.CHARACTER_LIGHT_1, BlockType.CHARACTER_DARK_1, BlockType.HIDE_ALL_CHARACTERS:
			return 1
		BlockType.SHOW_CHARACTER_2, BlockType.HIDE_CHARACTER_2, BlockType.MOVE_CHARACTER_2_LEFT, BlockType.CHANGE_EXPRESSION_2, BlockType.CHARACTER_LIGHT_2, BlockType.CHARACTER_DARK_2:
			return 2
		BlockType.SHOW_CHARACTER_3, BlockType.HIDE_CHARACTER_3, BlockType.MOVE_CHARACTER_3_LEFT, BlockType.CHANGE_EXPRESSION_3, BlockType.CHARACTER_LIGHT_3, BlockType.CHARACTER_DARK_3:
			return 2
		BlockType.BACKGROUND, BlockType.SHOW_BACKGROUND, BlockType.HIDE_BACKGROUND, BlockType.HIDE_BACKGROUND_FADE:
			return 3
		BlockType.MUSIC, BlockType.CHANGE_MUSIC, BlockType.STOP_MUSIC:
			return 4
	return 0

func _is_role_three_type(block_type: int) -> bool:
	return block_type in [
		BlockType.SHOW_CHARACTER_3,
		BlockType.HIDE_CHARACTER_3,
		BlockType.MOVE_CHARACTER_3_LEFT,
		BlockType.CHANGE_EXPRESSION_3,
		BlockType.CHARACTER_LIGHT_3,
		BlockType.CHARACTER_DARK_3,
	]

func _timeline_card_text(index: int, block: ScriptBlock) -> String:
	var short_name := _get_block_type_name(block.block_type)
	if _is_role_three_type(block.block_type):
		short_name = "兼容·" + short_name
	return "%03d %s" % [index + 1, short_name]

func _track_name_for_row(row: int) -> String:
	return ["对话", "角色1", "角色2", "背景", "音乐"][row]

func _on_timeline_add_pressed(row: int) -> void:
	match row:
		0:
			_append_test_block(BlockType.DIALOG, {"speaker": "旁白", "text": "新对话"}, "添加对话")
		1, 2:
			if _character_entries.is_empty():
				_show_notice("没有可用角色资源")
				return
			var entry := _character_entries[0] as Dictionary
			var character_key := str(entry.get("key", ""))
			var block_type := BlockType.SHOW_CHARACTER_1 if row == 1 else BlockType.SHOW_CHARACTER_2
			_append_test_block(block_type, {
				"character_name": character_key,
				"expression": "",
				"x_position": 0.28 if row == 1 else 0.72,
			}, "添加角色%d" % row)
		3:
			if _background_entries.is_empty():
				_show_notice("没有可用背景资源")
				return
			var entry := _background_entries[0] as Dictionary
			_append_test_block(BlockType.SHOW_BACKGROUND, {"background_path": str(entry.get("key", "")), "fade_time": 0.3}, "添加背景")
		4:
			if _music_entries.is_empty():
				_show_notice("没有可用音乐资源")
				return
			var entry := _music_entries[0] as Dictionary
			_append_test_block(BlockType.CHANGE_MUSIC, {"music_path": str(entry.get("key", ""))}, "添加音乐")

func _select_test_block(index: int) -> void:
	if index < 0 or index >= script_blocks.size() or is_previewing:
		return
	_commit_active_property_editor()
	_selected_test_index = index
	var block: ScriptBlock = script_blocks[index]
	_on_block_clicked(block)
	for card_index_any in _timeline_cards.keys():
		var card_index := int(card_index_any)
		var card := _timeline_cards[card_index] as Button
		if card:
			_configure_timeline_button(card, card_index == index, bool(card.get_meta("compatibility_warning", false)))
	_timeline_surface.set_playhead(index)
	_refresh_property_panel()

func _refresh_property_panel() -> void:
	if _property_content == null:
		return
	_clear_active_property_editor()
	_clear_beta_children(_property_content)
	if _selected_test_index < 0 or _selected_test_index >= script_blocks.size():
		var empty := Label.new()
		empty.text = "选择时间线事件后显示属性"
		empty.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		empty.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		_property_content.add_child(empty)
		return

	var block: ScriptBlock = script_blocks[_selected_test_index]
	var event_label := Label.new()
	event_label.text = "事件 %03d" % (_selected_test_index + 1)
	event_label.add_theme_color_override("font_color", COLOR_CYAN)
	event_label.add_theme_font_size_override("font_size", 12)
	_property_content.add_child(event_label)
	_add_readonly_property("类型", _get_block_type_name(block.block_type))

	var specs := _property_specs_for_block(block)
	if specs.is_empty():
		var hint := Label.new()
		hint.text = "此事件无需额外属性"
		hint.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		_property_content.add_child(hint)
		return
	for spec_any in specs:
		var spec := spec_any as Dictionary
		_add_editable_property(block, str(spec.get("key", "")), str(spec.get("label", "")), bool(spec.get("multiline", false)))

func _property_specs_for_block(block: ScriptBlock) -> Array:
	match block.block_type:
		BlockType.TEXT_ONLY:
			return [{"key": "text", "label": "内容", "multiline": true}]
		BlockType.DIALOG:
			return [
				{"key": "speaker", "label": "说话人"},
				{"key": "text", "label": "内容", "multiline": true},
			]
		BlockType.SHOW_CHARACTER_1, BlockType.SHOW_CHARACTER_2, BlockType.SHOW_CHARACTER_3:
			return [
				{"key": "character_name", "label": "角色"},
				{"key": "expression", "label": "表情"},
				{"key": "x_position", "label": "位置"},
			]
		BlockType.MOVE_CHARACTER_1_LEFT, BlockType.MOVE_CHARACTER_2_LEFT, BlockType.MOVE_CHARACTER_3_LEFT:
			return [
				{"key": "to_xalign", "label": "目标位置"},
				{"key": "duration", "label": "持续时间"},
				{"key": "expression", "label": "表情"},
			]
		BlockType.EXPRESSION, BlockType.CHANGE_EXPRESSION_1, BlockType.CHANGE_EXPRESSION_2, BlockType.CHANGE_EXPRESSION_3:
			return [{"key": "expression", "label": "表情"}]
		BlockType.CHARACTER_LIGHT_1, BlockType.CHARACTER_LIGHT_2, BlockType.CHARACTER_LIGHT_3:
			return [
				{"key": "duration", "label": "持续时间"},
				{"key": "expression", "label": "表情"},
			]
		BlockType.BACKGROUND, BlockType.SHOW_BACKGROUND:
			return [
				{"key": "background_path", "label": "背景"},
				{"key": "fade_time", "label": "渐变时间"},
			]
		BlockType.MUSIC, BlockType.CHANGE_MUSIC:
			return [{"key": "music_path", "label": "音乐"}]
	return []

func _add_readonly_property(label_text: String, value_text: String) -> void:
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	_property_content.add_child(row)
	var label := Label.new()
	label.text = label_text
	label.custom_minimum_size = Vector2(68, 34)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
	row.add_child(label)
	var value := Label.new()
	value.text = value_text
	value.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	value.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	value.add_theme_color_override("font_color", COLOR_TEXT)
	row.add_child(value)
	_property_content.add_child(_make_separator())

func _add_editable_property(block: ScriptBlock, key: String, label_text: String, multiline: bool) -> void:
	var label := Label.new()
	label.text = label_text
	label.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
	label.add_theme_font_size_override("font_size", 13)
	_property_content.add_child(label)
	var value: Variant = block.params.get(key, "")
	if multiline:
		var text_edit := TextEdit.new()
		text_edit.text = str(value)
		text_edit.custom_minimum_size = Vector2(0, 72)
		text_edit.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
		text_edit.add_theme_color_override("font_color", COLOR_TEXT)
		text_edit.add_theme_stylebox_override("normal", _make_style(COLOR_INPUT, COLOR_LINE, 4))
		text_edit.add_theme_stylebox_override("focus", _make_style(COLOR_INPUT, COLOR_CYAN, 4))
		text_edit.focus_entered.connect(_on_property_focus_entered.bind(text_edit, block, key, label_text, "text"))
		text_edit.focus_exited.connect(_on_property_focus_exited.bind(text_edit, block, key, label_text, "text"))
		_property_content.add_child(text_edit)
	elif _is_numeric_property(key, value):
		var spin_box := SpinBox.new()
		spin_box.custom_minimum_size = Vector2(0, 34)
		spin_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_configure_numeric_property(spin_box, key, value)
		var spin_line_edit := spin_box.get_line_edit()
		_configure_line_edit(spin_line_edit)
		spin_line_edit.focus_entered.connect(_on_property_focus_entered.bind(spin_box, block, key, label_text, "number"))
		spin_line_edit.focus_exited.connect(_on_property_focus_exited.bind(spin_box, block, key, label_text, "number"))
		spin_box.value_changed.connect(_on_numeric_property_value_changed.bind(spin_box, block, key, label_text))
		_property_content.add_child(spin_box)
	else:
		var line_edit := LineEdit.new()
		line_edit.text = str(value)
		line_edit.custom_minimum_size = Vector2(0, 34)
		_configure_line_edit(line_edit)
		line_edit.focus_entered.connect(_on_property_focus_entered.bind(line_edit, block, key, label_text, "text"))
		line_edit.focus_exited.connect(_on_property_focus_exited.bind(line_edit, block, key, label_text, "text"))
		line_edit.text_submitted.connect(_on_property_text_submitted.bind(line_edit))
		_property_content.add_child(line_edit)
	_property_content.add_child(_make_separator())

func _is_numeric_property(key: String, value: Variant) -> bool:
	return typeof(value) in [TYPE_FLOAT, TYPE_INT] or key in ["x_position", "to_xalign", "duration", "fade_time"]

func _configure_numeric_property(spin_box: SpinBox, key: String, value: Variant) -> void:
	spin_box.allow_greater = false
	spin_box.allow_lesser = false
	spin_box.suffix = ""
	match key:
		"x_position":
			spin_box.min_value = 0.0
			spin_box.max_value = 1.0
			spin_box.step = 0.01
		"to_xalign":
			spin_box.min_value = -1000.0
			spin_box.max_value = 1000.0
			spin_box.step = 0.01
		"duration", "fade_time":
			spin_box.min_value = 0.0
			spin_box.max_value = 86400.0
			spin_box.step = 0.05
		_:
			spin_box.min_value = -100000.0
			spin_box.max_value = 100000.0
			spin_box.step = 1.0 if typeof(value) == TYPE_INT else 0.01
	spin_box.value = float(value) if str(value).is_valid_float() else spin_box.min_value

func _on_property_focus_entered(control: Control, block: ScriptBlock, key: String, label_text: String, kind: String) -> void:
	if _active_property_control != null and _active_property_control != control:
		_commit_active_property_editor()
	_active_property_control = control
	_active_property_block = block
	_active_property_key = key
	_active_property_label = label_text
	_active_property_kind = kind
	if control is LineEdit:
		control.set_meta("initial_text", (control as LineEdit).text)
	elif control is TextEdit:
		control.set_meta("initial_text", (control as TextEdit).text)
	elif control is SpinBox:
		control.set_meta("initial_value", (control as SpinBox).value)
	_save_state_label.text = "编辑中"

func _on_numeric_property_value_changed(_value: float, spin_box: SpinBox, block: ScriptBlock, key: String, label_text: String) -> void:
	if _active_property_control != spin_box:
		if _active_property_control != null:
			_commit_active_property_editor()
		_active_property_control = spin_box
		_active_property_block = block
		_active_property_key = key
		_active_property_label = label_text
		_active_property_kind = "number"
		spin_box.set_meta("initial_value", block.params.get(key, spin_box.value))
	_save_state_label.text = "编辑中"

func _on_property_focus_exited(control: Control, block: ScriptBlock, key: String, label_text: String, kind: String) -> void:
	if kind == "number" and control is SpinBox:
		_commit_property_number(control as SpinBox, block, key, label_text)
	else:
		_commit_property_text(control, block, key, label_text)
	_clear_active_property_editor(control)

func _on_property_text_submitted(_submitted_text: String, line_edit: LineEdit) -> void:
	line_edit.release_focus()

func _commit_property_text(control: Control, block: ScriptBlock, key: String, label_text: String) -> void:
	if block == null or not script_blocks.has(block):
		return
	var text_value := ""
	if control is LineEdit:
		text_value = (control as LineEdit).text
	elif control is TextEdit:
		text_value = (control as TextEdit).text
	var original_text := str(control.get_meta("initial_text", str(block.params.get(key, ""))))
	if text_value == original_text:
		_save_state_label.text = "已保存"
		return
	var old_value: Variant = block.params.get(key, "")
	var new_value: Variant = text_value
	if typeof(old_value) == TYPE_BOOL:
		new_value = text_value.to_lower() in ["true", "1", "是", "开启"]
	block.params[key] = new_value
	_finish_property_commit(control, block, key, label_text, text_value)

func _commit_property_number(spin_box: SpinBox, block: ScriptBlock, key: String, label_text: String) -> void:
	if block == null or not script_blocks.has(block):
		return
	var initial_value := float(spin_box.get_meta("initial_value", block.params.get(key, 0.0)))
	if is_equal_approx(initial_value, spin_box.value):
		_save_state_label.text = "已保存"
		return
	var old_value: Variant = block.params.get(key, 0.0)
	block.params[key] = int(round(spin_box.value)) if typeof(old_value) == TYPE_INT else spin_box.value
	spin_box.set_meta("initial_value", spin_box.value)
	_finish_property_commit(spin_box, block, key, label_text, str(spin_box.value))

func _finish_property_commit(control: Control, _block: ScriptBlock, _key: String, label_text: String, committed_text: String) -> void:
	_save_state_label.text = "保存中"
	_save_project()
	_validate_all_blocks()
	_save_state_label.text = "已保存"
	if control is LineEdit or control is TextEdit:
		control.set_meta("initial_text", committed_text)
	_add_history("修改%s" % label_text)
	_rebuild_timeline()
	_refresh_validation_badge()

func _commit_active_property_editor() -> void:
	if _active_property_control == null or not is_instance_valid(_active_property_control):
		_clear_active_property_editor()
		return
	var control_keeps_focus := _active_property_control.has_focus()
	if _active_property_control is SpinBox:
		control_keeps_focus = (_active_property_control as SpinBox).get_line_edit().has_focus()
	if _active_property_kind == "number" and _active_property_control is SpinBox:
		_commit_property_number(
			_active_property_control as SpinBox,
			_active_property_block,
			_active_property_key,
			_active_property_label
		)
	else:
		_commit_property_text(
			_active_property_control,
			_active_property_block,
			_active_property_key,
			_active_property_label
		)
	if not control_keeps_focus:
		_clear_active_property_editor()

func _clear_active_property_editor(control: Control = null) -> void:
	if control != null and control != _active_property_control:
		return
	_active_property_control = null
	_active_property_block = null
	_active_property_key = ""
	_active_property_label = ""
	_active_property_kind = ""

func _make_separator() -> HSeparator:
	var separator := HSeparator.new()
	separator.add_theme_stylebox_override("separator", _line_style())
	return separator

func _add_history(text: String) -> void:
	_history_entries.push_front({
		"time": Time.get_time_string_from_system(),
		"text": text,
	})
	if _history_entries.size() > 30:
		_history_entries.resize(30)
	_refresh_history()

func _refresh_history() -> void:
	if _history_content == null:
		return
	_clear_beta_children(_history_content)
	if _history_entries.is_empty():
		var empty := Label.new()
		empty.text = "本次会话还没有编辑记录"
		empty.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		_history_content.add_child(empty)
		return
	for index in range(_history_entries.size()):
		var entry := _history_entries[index]
		var row := HBoxContainer.new()
		row.custom_minimum_size = Vector2(0, 42)
		row.add_theme_constant_override("separation", 10)
		if index == 0:
			var marker := ColorRect.new()
			marker.color = COLOR_CYAN
			marker.custom_minimum_size = Vector2(2, 0)
			row.add_child(marker)
		var time_label := Label.new()
		time_label.text = str(entry.get("time", ""))
		time_label.custom_minimum_size = Vector2(56, 0)
		time_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		time_label.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		time_label.add_theme_font_size_override("font_size", 12)
		row.add_child(time_label)
		var text_label := Label.new()
		text_label.text = str(entry.get("text", ""))
		text_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		text_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		text_label.clip_text = true
		text_label.add_theme_color_override("font_color", COLOR_TEXT)
		text_label.add_theme_font_size_override("font_size", 13)
		row.add_child(text_label)
		_history_content.add_child(row)
		_history_content.add_child(_make_separator())

func _refresh_validation_badge() -> void:
	if _validation_button == null:
		return
	_validate_all_blocks()
	var issue_count := 0
	for block in script_blocks:
		if block.has_error:
			issue_count += 1
		if _is_role_three_type(block.block_type):
			issue_count += 1
	_validation_button.text = str(issue_count)
	_validation_button.tooltip_text = "发现%d个校验或兼容问题" % issue_count if issue_count > 0 else "没有校验问题"
	_configure_validation_button(_validation_button, issue_count > 0)
	_test_run_button.disabled = has_validation_errors

func _show_validation_popup() -> void:
	_commit_active_property_editor()
	_refresh_validation_badge()
	_clear_beta_children(_validation_list)
	var issue_count := 0
	for index in range(script_blocks.size()):
		var block: ScriptBlock = script_blocks[index]
		if block.has_error:
			_add_validation_issue(index, block.error_message, true)
			issue_count += 1
		if _is_role_three_type(block.block_type):
			_add_validation_issue(index, "角色3事件在双角色时间线中以兼容标记显示", false)
			issue_count += 1
	if issue_count == 0:
		var ok := Label.new()
		ok.text = "没有发现问题"
		ok.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		ok.add_theme_color_override("font_color", COLOR_TEXT_MUTED)
		_validation_list.add_child(ok)
	_validation_popup.popup_centered(Vector2i(440, 320))

func _add_validation_issue(index: int, message: String, is_error: bool) -> void:
	var button := Button.new()
	button.text = "第%03d块 · %s" % [index + 1, message]
	button.alignment = HORIZONTAL_ALIGNMENT_LEFT
	button.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	button.custom_minimum_size = Vector2(390, 44)
	button.add_theme_color_override("font_color", COLOR_DANGER if is_error else Color("d6a94b"))
	button.add_theme_stylebox_override("normal", _make_style(COLOR_INPUT, COLOR_LINE, 4))
	button.add_theme_stylebox_override("hover", _make_style(COLOR_SURFACE_ALT, COLOR_CYAN, 4))
	button.pressed.connect(_on_validation_issue_pressed.bind(index))
	_validation_list.add_child(button)

func _on_validation_issue_pressed(index: int) -> void:
	_validation_popup.hide()
	_select_test_block(index)

func _on_test_run_pressed() -> void:
	_commit_active_property_editor()
	_stop_music_preview()
	_on_run_button_pressed()
	_refresh_validation_badge()

func _show_notice(message: String) -> void:
	_notice_dialog.dialog_text = message
	_notice_dialog.popup_centered(Vector2i(460, 170))

func _clear_beta_children(parent: Node) -> void:
	if parent == null:
		return
	for child in parent.get_children():
		parent.remove_child(child)
		child.queue_free()
