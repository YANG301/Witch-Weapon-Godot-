# NovelInterface.gd - 基于场景状态的统一剧情接口
extends Node2D

# 场景状态枚举
enum StoryState {
	TEXT_ONLY,        # 纯文本展示
	DIALOG,           # 对话场景
	SCENE_CHANGE,     # 场景变换
	CHARACTER_CHANGE, # 人物切换
	EXPRESSION_CHANGE,# 表情切换
	BACKGROUND_CHANGE,# 背景切换
	MUSIC_CHANGE,     # 音乐切换
	COMBINED          # 组合操作
}

# 通用数据结构
class StoryData:
	var story_state: StoryState
	var text: String = ""
	var speaker: String = ""
	var character_name: String = ""
	var character_expression: String = ""
	var background_path: String = ""
	var music_path: String = ""
	var transition_type: String = ""
	var wait_for_input: bool = true

	func _init(state: StoryState = StoryState.TEXT_ONLY):
		story_state = state

# 节点引用
@onready var show_text_label: Label = $Dialog/ShowText
@onready var dialog_bg: TextureRect = $Dialog/TextBoxBG
@onready var name_box: Control = $NameBox
@onready var name_box_bg: TextureRect = $NameBox/NameBoxBackground
@onready var name_label: Label = $NameBox/NameBoxBackground/Name
@onready var bg_sprite: Sprite2D = $BG
@onready var audio_player: AudioStreamPlayer = $AudioPlayer  # 音频播放器
@onready var skip_button: TextureButton = $SkipButton
@onready var log_button: TextureButton = $Dialog/LogButton
@onready var log_interface: Control = $LogInterface
@onready var log_mask: ColorRect = $LogInterface/LogMask
@onready var log_scroll_container: ScrollContainer = $LogInterface/LogScrollContainer
@onready var log_content: VBoxContainer = $LogInterface/LogScrollContainer/LogContent
@onready var next_button: TextureButton = $Dialog/NextButton

# 滚动条图片节点（动态创建）
var log_scrollbar_texture: TextureRect = null

# 入场动画遮罩
@onready var entrance_overlay: ColorRect = $EntranceOverlay  # 初次进入时的黑色遮罩

# 信号
signal scene_completed
signal text_continue_pressed
signal center_performance_completed  # 中心演出模式完成信号
signal briefing_performance_completed  # 简报演出模式完成信号
signal video_performance_completed  # 视频演出模式完成信号
signal name_input_completed(player_name: String)  # 姓名输入完成信号
signal interface_initialized

# 状态变量
var waiting_for_input: bool = false
var current_character: String = ""
var current_background: String = ""
var current_music: String = ""
var current_character_node: CharacterNode = null  # 当前显示的角色节点
var current_2nd_character: String = ""  # 第二个角色名称
var current_2nd_character_node: CharacterNode = null  # 第二个角色节点
var current_3rd_character: String = ""  # 第三个角色名称
var current_3rd_character_node: CharacterNode = null  # 第三个角色节点

# 自动播放相关变量
var is_auto_play: bool = false
var auto_play_timer: Timer = null
var original_normal_texture: Texture2D = null
var original_hover_texture: Texture2D = null
var pending_texture_swap: bool = false  # 等待材质切换标记

# 动画配置
const ENTRANCE_FADE_DURATION: float = 0.5  # 入场遮罩淡出时长

# 历史记录
static var dialog_history: Array[Dictionary] = []

# 独立的Tween实例 - 避免动画冲突
var background_tween: Tween
var character_tween: Tween
var character2_tween: Tween
var character3_tween: Tween
var entrance_tween: Tween
var special_image_tween: Tween  # 特殊图片展示动画

# 特殊居中图片的引用
var current_special_image: Sprite2D = null

# 中心文字演出模式相关
var is_center_performance_mode: bool = false  # 是否处于中心文字演出模式
var center_text_label: Label = null  # 中心文字Label
var center_performance_texts: Array[String] = []  # 中心演出的文字列表
var center_performance_current_index: int = 0  # 当前显示的文字索引
var center_performance_tween: Tween = null  # 中心演出的动画
var background_filter: ColorRect = null  # 背景滤镜（用于中心演出模式）
var center_use_typewriter: bool = true  # 是否使用打字机效果
var center_previous_background: String = ""  # 进入中心演出模式前的背景路径
var center_has_custom_background: bool = false  # 是否设置了自定义背景

# 简报演出模式相关（COD4风格）
var is_briefing_performance_mode: bool = false  # 是否处于简报演出模式
var briefing_line1_label: Label = null  # 简报第一行Label
var briefing_line2_label: Label = null  # 简报第二行Label
var briefing_tween: Tween = null  # 简报演出的动画
var briefing_current_line: int = 0  # 当前显示到第几行（0=未开始，1=第一行，2=第二行完成）
var briefing_line1_text: String = ""  # 第一行完整文字
var briefing_line2_text: String = ""  # 第二行完整文字

# 视频演出模式相关
var is_video_performance_mode: bool = false  # 是否处于视频演出模式
var video_player = null  # 视频播放器（已改为 Godot 原生 VideoStreamPlayer）
var video_texture_rect: TextureRect = null  # 视频纹理显示
var skip_progress_bar: ProgressBar = null  # 跳过进度条
var skip_progress_container: Control = null  # 跳过进度条容器
var skip_text_button: Button = null  # 跳过文字按钮
var is_mouse_pressed: bool = false  # 鼠标是否按下
var skip_progress: float = 0.0  # 跳过进度（0.0-1.0）
var skip_progress_tween: Tween = null  # 跳过进度条的动画
var skip_ui_fade_tween: Tween = null  # 跳过UI渐显/渐隐动画
var skip_ui_hide_timer: Timer = null  # 跳过UI延迟隐藏计时器
var video_was_playing: bool = false  # 视频是否曾经在播放（用于检测播放结束）
var video_playlist: Array[String] = []  # 视频播放列表
var current_video_index: int = 0  # 当前播放的视频索引
const SKIP_FILL_TIME: float = 2.0  # 充满进度条需要的时间（秒）
const SKIP_DRAIN_TIME: float = 1.5  # 进度条排空的时间（秒）
const SKIP_UI_FADE_DURATION: float = 0.3  # UI渐显/渐隐时间（秒）
const SKIP_UI_HIDE_DELAY: float = 1.0  # UI延迟消失时间（秒）

# 姓名输入模式相关
var is_name_input_mode: bool = false  # 是否处于姓名输入模式
var name_input_background: Sprite2D = null  # 姓名输入背景（AEGIS.png）
var name_input_box_bg: Sprite2D = null  # 输入框背景图片（input.png）
var name_input_field: LineEdit = null  # 输入框
var name_confirm_button: TextureButton = null  # 确认按钮
var name_confirm_label: Label = null  # 确认按钮上的文字
var name_error_label: Label = null  # 错误提示文字
var name_shake_tween: Tween = null  # 晃动动画
var current_player_name: String = ""  # 当前输入的玩家姓名

var _interface_initialized: bool = false
var _log_dragging := false
var _drag_position := Vector2(0, 0)

func wait_until_initialized() -> void:
	if _interface_initialized:
		return
	await interface_initialized

func _ready():
	await get_tree().process_frame
	_initialize_interface()
	_setup_entrance_overlay()
	await _play_entrance_animation()  # 播放入场动画
	print("NovelInterface 统一接口初始化完成")

	# 连接信号
	if show_text_label and show_text_label.has_signal("typing_finished"):
		show_text_label.typing_finished.connect(_on_typing_finished)

	if dialog_bg:
		dialog_bg.gui_input.connect(_on_dialog_bg_input)

	if name_box_bg:
		name_box_bg.gui_input.connect(_on_name_box_input)

	# 连接跳过按钮信号
	if skip_button:
		skip_button.pressed.connect(_on_skip_button_pressed)

	# 连接下一步按钮信号并初始化自动播放功能
	if next_button:
		next_button.pressed.connect(_on_next_button_pressed)
		next_button.mouse_exited.connect(_on_next_button_mouse_exited)
		_init_auto_play_system()

	# 连接Log按钮信号
	if log_button:
		log_button.pressed.connect(_on_log_button_pressed)

	# 连接LogMask点击信号
	if log_mask:
		log_mask.gui_input.connect(_on_log_mask_input)

	# 连接LogScrollContainer滚动信号
	if log_scroll_container:
		log_scroll_container.gui_input.connect(_on_log_scroll_container_input)

	# 初始化跳过UI延迟隐藏计时器
	_init_skip_ui_hide_timer()

func _process(delta: float):
	# 处理视频跳过输入
	_process_video_skip_input(delta)

func _initialize_interface():
	"""初始化界面状态"""
	_hide_all_elements()
	# 初始化音频系统
	if audio_player:
		audio_player.volume_db = linear_to_db(0.25)  # 设置默认音量为25%
		audio_player.autoplay = false
	# 预留：初始化角色显示系统
	# 预留：初始化背景系统
	if not _interface_initialized:
		_interface_initialized = true
		interface_initialized.emit()

func _setup_entrance_overlay():
	"""设置入场遮罩"""
	if entrance_overlay:
		entrance_overlay.color = Color.BLACK
		entrance_overlay.modulate.a = 1.0  # 初始完全不透明（黑色）
		entrance_overlay.visible = true    # 初始可见
		entrance_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
		# 确保遮罩在最上层
		entrance_overlay.z_index = 1000
		print("入场遮罩设置完成")

func _play_entrance_animation() -> void:
	"""播放入场动画 - 黑色遮罩渐变消失"""
	if not entrance_overlay:
		push_error("入场遮罩节点未找到")
		return

	print("开始播放入场动画")

	# 等待一小段时间确保场景完全加载
	await get_tree().create_timer(0.2).timeout

	# 遮罩淡出动画
	if entrance_tween:
		entrance_tween.kill()
	entrance_tween = create_tween()
	entrance_tween.tween_property(entrance_overlay, "modulate:a", 0.0, ENTRANCE_FADE_DURATION)
	entrance_tween.set_trans(Tween.TRANS_CUBIC)
	entrance_tween.set_ease(Tween.EASE_OUT)

	await entrance_tween.finished

	# 动画完成后隐藏遮罩
	entrance_overlay.visible = false
	print("入场动画完成 - 黑色遮罩已消失")

func _input(event: InputEvent):
	# 处理ESC键关闭Log界面
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		if log_interface and log_interface.visible:
			# Log界面关闭功能已移除，将由用户自己重写
			toggle_log_interface()
			get_viewport().set_input_as_handled()

	# 处理视频模式下的鼠标输入
	if is_video_performance_mode:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_mouse_pressed = true
			else:
				is_mouse_pressed = false
		return  # 在视频模式下，不处理其他输入

	if event.is_action_pressed("dialog_next") and event.pressed and not log_interface.visible:
		# 如果处于中心文字演出模式，处理点击事件
		if is_center_performance_mode:
			_on_center_performance_clicked()
			return

		# 如果处于简报演出模式，忽略点击事件
		if is_briefing_performance_mode:
			return

		# 只要在等待输入状态，就允许点击背景跳过对话，不依赖背景可见性
		if waiting_for_input and event is InputEventMouseButton:
			var dialog_rect = Rect2(Vector2(13, 559), Vector2(1298, 157))
			var name_rect = Rect2(Vector2(254, 512), Vector2(362, 68))
			var skip_rect = Rect2(Vector2(1134, 11), Vector2(126, 60))
			var next_button_rect = Rect2(Vector2(1209, 659), Vector2(35, 28))  # NextButton区域

			# 只有当namebox可见时，才排除namebox区域的点击
			var exclude_name_area = name_box and name_box.visible and name_rect.has_point(event.position)

			if not dialog_rect.has_point(event.position) and \
			   not exclude_name_area and \
			   not skip_rect.has_point(event.position) and \
			   not next_button_rect.has_point(event.position):
				_on_continue_pressed()

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		if log_interface and not log_interface.visible:
			print("显示Log界面")
			toggle_log_interface()

	# 处理鼠标左键松开事件（无论鼠标在哪里）
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		if _log_dragging:
			_end_drag()
			# 如果发生了拖拽，阻止按钮点击
			if _drag_position != event.position:
				get_viewport().set_input_as_handled()

func _on_dialog_bg_input(event: InputEvent):
	if event.is_action_pressed("dialog_next") and event.pressed:
		_on_continue_pressed()

func _on_name_box_input(event: InputEvent):
	if event.is_action_pressed("dialog_next") and event.pressed:
		_on_continue_pressed()

# ==================== 万能函数接口 ====================

## 万能场景处理函数 - 根据场景状态执行不同逻辑
func execute_scene(data: StoryData) -> void:
	"""根据场景状态执行相应的处理逻辑"""
	print("执行场景操作: ", StoryState.keys()[data.story_state])

	match data.story_state:
		StoryState.TEXT_ONLY:
			await _handle_text_only(data)
		StoryState.DIALOG:
			await _handle_dialog(data)
		StoryState.SCENE_CHANGE:
			_handle_scene_change(data)
		StoryState.CHARACTER_CHANGE:
			_handle_character_change(data)
		StoryState.EXPRESSION_CHANGE:
			_handle_expression_change(data)
		StoryState.BACKGROUND_CHANGE:
			_handle_background_change(data)
		StoryState.MUSIC_CHANGE:
			_handle_music_change(data)
		StoryState.COMBINED:
			_handle_combined(data)
		_:
			print("警告: 未处理的场景状态")

	scene_completed.emit()

## 便捷接口函数
func show_text_only(text: String) -> void:
	"""显示纯文本"""
	var data = StoryData.new(StoryState.TEXT_ONLY)
	data.text = text
	await execute_scene(data)

func show_dialog(text: String, speaker: String) -> void:
	"""显示对话"""
	var data = StoryData.new(StoryState.DIALOG)
	data.text = text
	data.speaker = speaker
	await execute_scene(data)

func change_character(character_name: String, expression: String = "") -> void:
	"""切换角色"""
	var data = StoryData.new(StoryState.CHARACTER_CHANGE)
	data.character_name = character_name
	data.character_expression = expression
	data.wait_for_input = false
	await execute_scene(data)

func change_expression(expression: String, animated: bool = true) -> void:
	"""切换当前角色表情"""
	if not current_character_node:
		push_warning("没有当前角色，无法切换表情")
		return

	if not current_character_node.has_method("set_expression") and not current_character_node.has_method("set_expression_animated"):
		push_warning("当前角色不支持表情切换")
		return

	if animated and current_character_node.has_method("set_expression_animated"):
		current_character_node.set_expression_animated(expression)
		print("角色表情已切换（带动画）: ", expression)
	elif current_character_node.has_method("set_expression"):
		current_character_node.set_expression(expression)
		print("角色表情已切换: ", expression)
	else:
		push_error("角色节点不支持表情切换方法")

func change_background(bg_path: String, _transition: String = "fade") -> void:
	"""切换背景"""
	if bg_sprite and bg_path != "":
		var texture := _load_texture_any(bg_path)
		if texture:
			# 立即停止当前的背景切换动画并清理
			if background_tween:
				background_tween.kill()
				background_tween = null

			# 清理可能存在的旧的过渡背景精灵
			for child in get_children():
				if child is Sprite2D and child != bg_sprite and child.z_index > bg_sprite.z_index:
					child.queue_free()

			# 创建新的背景精灵用于叠加
			var new_bg = Sprite2D.new()
			new_bg.texture = texture
			new_bg.position = bg_sprite.position
			new_bg.scale = bg_sprite.scale
			new_bg.modulate.a = 0.0
			new_bg.z_index = bg_sprite.z_index + 1
			add_child(new_bg)

			# 开始淡入新背景
			background_tween = create_tween()
			background_tween.tween_property(new_bg, "modulate:a", 1.0, 0.5)
			background_tween.set_trans(Tween.TRANS_CUBIC)
			background_tween.set_ease(Tween.EASE_OUT)

			# 不使用await，让动画在后台完成
			background_tween.finished.connect(_on_background_transition_finished.bind(new_bg, texture, bg_path))

			print("背景切换开始: ", bg_path)

func _on_background_transition_finished(new_bg: Sprite2D, texture: Texture2D, bg_path: String):
	"""背景切换动画完成回调"""
	if is_instance_valid(new_bg):
		# 替换背景并清理，确保背景精灵可见
		bg_sprite.texture = texture
		bg_sprite.modulate.a = 1.0
		bg_sprite.visible = true
		new_bg.queue_free()
		current_background = bg_path

		print("背景已切换完成: ", bg_path)

func show_special_centered_image(image_path: String, initial_y: float = -1.0, initial_scale: float = 0.5, final_scale: float = 1.0, duration: float = 0.5) -> void:
	"""特殊剧情方法：在屏幕中心展示图片，带渐变显示和缩放动画
	参数:
	- image_path: 图片路径
	- initial_y: 初始Y轴位置（-1.0表示使用屏幕中心，否则使用指定的Y坐标）
	- initial_scale: 初始缩放大小（默认0.5，即50%）
	- final_scale: 最终缩放大小（默认1.0，即100%）
	- duration: 动画时长（默认0.5秒）
	"""
	# 加载图片纹理
	var texture := _load_texture_any(image_path)
	if not texture:
		push_error("无法加载图片: " + image_path)
		return

	# 如果已有特殊图片，先清除
	if current_special_image:
		current_special_image.queue_free()
		current_special_image = null

	# 创建新的精灵用于展示
	var special_image = Sprite2D.new()
	special_image.texture = texture

	# 获取屏幕中心位置
	var screen_size = get_viewport().get_visible_rect().size
	var center_x = screen_size.x / 2.0
	var center_y = screen_size.y / 2.0 if initial_y < 0.0 else initial_y
	special_image.position = Vector2(center_x, center_y)
	print("DEBUG - 屏幕尺寸: ", screen_size, " initial_y参数: ", initial_y, " 实际Y位置: ", center_y)

	# 设置初始状态
	special_image.modulate.a = 0.0  # 初始透明
	special_image.scale = Vector2(initial_scale, initial_scale)  # 初始缩放
	special_image.z_index = 1  # 和背景同级

	add_child(special_image)

	# 保存引用
	current_special_image = special_image

	# 停止之前的特殊图片动画
	if special_image_tween:
		special_image_tween.kill()

	# 创建并行动画：渐变显示 + 缩放
	special_image_tween = create_tween()
	special_image_tween.set_parallel(true)  # 设置为并行模式

	# 渐变显示动画
	special_image_tween.tween_property(special_image, "modulate:a", 1.0, duration)

	# 缩放动画
	special_image_tween.tween_property(special_image, "scale", Vector2(final_scale, final_scale), duration)

	# 设置动画曲线
	special_image_tween.set_trans(Tween.TRANS_CUBIC)
	special_image_tween.set_ease(Tween.EASE_OUT)

	await special_image_tween.finished

	print("特殊图片已展示: ", image_path, " Y位置: ", center_y, " 初始缩放: ", initial_scale, " 最终缩放: ", final_scale, " 动画时长: ", duration, "秒")

func hide_special_centered_image(fade_duration: float = 0.5) -> void:
	"""隐藏特殊居中图片 - 带渐变效果
	参数:
	- fade_duration: 淡出动画时长（默认0.5秒）
	"""
	if not current_special_image or not is_instance_valid(current_special_image):
		print("特殊图片不存在或已隐藏")
		return

	print("开始隐藏特殊图片，渐变时长: ", fade_duration)

	# 停止之前的特殊图片动画
	if special_image_tween:
		special_image_tween.kill()

	# 创建渐变动画
	special_image_tween = create_tween()
	special_image_tween.tween_property(current_special_image, "modulate:a", 0.0, fade_duration)
	special_image_tween.set_trans(Tween.TRANS_CUBIC)
	special_image_tween.set_ease(Tween.EASE_OUT)

	await special_image_tween.finished

	# 动画完成后清理节点
	if current_special_image and is_instance_valid(current_special_image):
		current_special_image.queue_free()
		current_special_image = null

	print("特殊图片已隐藏 (渐变", fade_duration, "秒)")

func change_music(music_path: String) -> void:
	"""切换音乐"""
	var data = StoryData.new(StoryState.MUSIC_CHANGE)
	data.music_path = music_path
	data.wait_for_input = false
	await execute_scene(data)

func play_music(music_path: String) -> void:
	"""直接播放音乐 - 便捷接口"""
	_play_music_internal(music_path)
	current_music = music_path

func _resolve_character_scene_path(character_key: String) -> String:
	var raw := character_key.strip_edges()
	if raw.is_empty():
		return ""
	if raw.begins_with("res://") or raw.begins_with("user://"):
		return raw
	if raw.find("/") != -1:
		# 允许直接传入路径（例如 mods 或工程目录下的 user:// 绝对路径）
		return raw
	return "res://scenes/character/" + raw + ".tscn"

func _character_scene_exists(path: String) -> bool:
	var p := path.strip_edges()
	if p.is_empty():
		return false
	if p.begins_with("res://"):
		return ResourceLoader.exists(p) or ResourceLoader.exists(p + ".remap")
	if p.begins_with("user://"):
		return FileAccess.file_exists(p) or FileAccess.file_exists(p + ".remap")
	return FileAccess.file_exists(p)

func show_character(character_name: String, expression: String = "", initial_position: float = -1.0) -> void:
	"""显示角色 - 带有0.35秒的渐变效果"""
	var character_scene_path := _resolve_character_scene_path(character_name)

	# 检查角色场景是否存在
	if not _character_scene_exists(character_scene_path):
		push_error("角色场景不存在: " + character_scene_path)
		return

	# 如果当前有角色，直接移除
	if current_character_node:
		current_character_node.queue_free()
		current_character_node = null

	# 加载并实例化新角色
	var character_scene = load(character_scene_path)
	if character_scene == null and not character_scene_path.ends_with(".remap"):
		character_scene = load(character_scene_path + ".remap")
	if not character_scene:
		push_error("无法加载角色场景: " + character_scene_path)
		return

	var new_character_node = character_scene.instantiate()
	new_character_node.z_index = 3  # 设置角色的z_index为3，确保在背景之上
	add_child(new_character_node)

	# 如果指定了表情，设置表情
	if expression != "" and new_character_node.has_method("set_expression"):
		new_character_node.set_expression(expression)

	# 新角色初始透明度为0，准备渐变显示
	new_character_node.set_alpha(0.0)

	# 设置当前角色引用
	current_character_node = new_character_node
	current_character = character_name

	# 如果指定了初始位置，移动到该位置
	if initial_position >= 0.0:
		var screen_width = get_viewport().get_visible_rect().size.x
		var target_x = screen_width * initial_position
		new_character_node.position.x = target_x
		print("角色初始位置设置为: ", initial_position, " (", target_x, "px)")

	# 角色渐变显示
	if character_tween:
		character_tween.kill()
	character_tween = create_tween()
	character_tween.tween_method(new_character_node.set_alpha, 0.0, 1.0, 0.35)
	character_tween.set_trans(Tween.TRANS_CUBIC)
	character_tween.set_ease(Tween.EASE_OUT)

	await character_tween.finished

	print("角色已显示: ", character_name, " 表情: ", expression, " 初始位置: ", initial_position, " (渐变0.35秒)")

func show_2nd_character(character_name: String, expression: String = "", initial_position: float = -1.0) -> void:
	"""显示第二个角色 - 带有0.35秒的渐变效果"""
	var character_scene_path := _resolve_character_scene_path(character_name)

	# 检查角色场景是否存在
	if not _character_scene_exists(character_scene_path):
		push_error("角色场景不存在: " + character_scene_path)
		return

	# 如果当前有第二个角色，直接移除
	if current_2nd_character_node:
		current_2nd_character_node.queue_free()
		current_2nd_character_node = null

	# 加载并实例化新角色
	var character_scene = load(character_scene_path)
	if character_scene == null and not character_scene_path.ends_with(".remap"):
		character_scene = load(character_scene_path + ".remap")
	if not character_scene:
		push_error("无法加载角色场景: " + character_scene_path)
		return

	var new_character_node = character_scene.instantiate()
	new_character_node.z_index = 3 # 设置角色的z_index为3，确保在背景之上
	add_child(new_character_node)

	# 如果指定了表情，设置表情
	if expression != "" and new_character_node.has_method("set_expression"):
		new_character_node.set_expression(expression)

	# 新角色初始透明度为0，准备渐变显示
	new_character_node.set_alpha(0.0)

	# 设置第二个角色引用
	current_2nd_character_node = new_character_node
	current_2nd_character = character_name

	# 如果指定了初始位置，移动到该位置
	if initial_position >= 0.0:
		var screen_width = get_viewport().get_visible_rect().size.x
		var target_x = screen_width * initial_position
		new_character_node.position.x = target_x
		print("第二个角色初始位置设置为: ", initial_position, " (", target_x, "px)")

	# 角色渐变显示
	if character2_tween:
		character2_tween.kill()
	character2_tween = create_tween()
	character2_tween.tween_method(new_character_node.set_alpha, 0.0, 1.0, 0.35)
	character2_tween.set_trans(Tween.TRANS_CUBIC)
	character2_tween.set_ease(Tween.EASE_OUT)

	await character2_tween.finished

	print("第二个角色已显示: ", character_name, " 表情: ", expression, " 初始位置: ", initial_position, " (渐变0.35秒)")

func show_3rd_character(character_name: String, expression: String = "", initial_position: float = -1.0) -> void:
	"""显示第三个角色 - 带有0.35秒的渐变效果"""
	var character_scene_path := _resolve_character_scene_path(character_name)

	# 检查角色场景是否存在
	if not _character_scene_exists(character_scene_path):
		push_error("角色场景不存在: " + character_scene_path)
		return

	# 如果当前有第三个角色，直接移除
	if current_3rd_character_node:
		current_3rd_character_node.queue_free()
		current_3rd_character_node = null

	# 加载并实例化新角色
	var character_scene = load(character_scene_path)
	if character_scene == null and not character_scene_path.ends_with(".remap"):
		character_scene = load(character_scene_path + ".remap")
	if not character_scene:
		push_error("无法加载角色场景: " + character_scene_path)
		return

	var new_character_node = character_scene.instantiate()
	new_character_node.z_index = 3  # 设置角色的z_index为3，确保在背景之上
	add_child(new_character_node)

	# 如果指定了表情，设置表情
	if expression != "" and new_character_node.has_method("set_expression"):
		new_character_node.set_expression(expression)

	# 新角色初始透明度为0，准备渐变显示
	new_character_node.set_alpha(0.0)

	# 设置第三个角色引用
	current_3rd_character_node = new_character_node
	current_3rd_character = character_name

	# 如果指定了初始位置，移动到该位置
	if initial_position >= 0.0:
		var screen_width = get_viewport().get_visible_rect().size.x
		var target_x = screen_width * initial_position
		new_character_node.position.x = target_x
		print("第三个角色初始位置设置为: ", initial_position, " (", target_x, "px)")

	# 角色渐变显示
	if character3_tween:
		character3_tween.kill()
	character3_tween = create_tween()
	character3_tween.tween_method(new_character_node.set_alpha, 0.0, 1.0, 0.35)
	character3_tween.set_trans(Tween.TRANS_CUBIC)
	character3_tween.set_ease(Tween.EASE_OUT)

	await character3_tween.finished

	print("第三个角色已显示: ", character_name, " 表情: ", expression, " 初始位置: ", initial_position, " (渐变0.35秒)")

func show_character_with_fade(character_name: String, expression: String = "", fade_duration: float = 0.5) -> void:
	"""显示角色并带有淡入效果"""
	show_character(character_name, expression)
	if current_character_node and current_character_node.has_method("fade_in"):
		await current_character_node.fade_in(fade_duration).finished

func hide_character_with_fade(fade_duration: float = 0.5) -> void:
	"""隐藏当前角色并带有淡出效果"""
	if current_character_node and current_character_node.has_method("fade_out"):
		await current_character_node.fade_out(fade_duration).finished
		current_character_node.queue_free()
		current_character_node = null
		current_character = ""
		print("角色已淡出隐藏")
	else:
		hide_character()

func set_character_alpha(alpha: float) -> void:
	"""设置当前角色的透明度"""
	if current_character_node and current_character_node.has_method("set_alpha"):
		current_character_node.set_alpha(alpha)

func get_character_alpha() -> float:
	"""获取当前角色的透明度"""
	if current_character_node and current_character_node.has_method("get_alpha"):
		return current_character_node.get_alpha()
	return 1.0

func set_character_modulate(color: Color) -> void:
	"""设置当前角色的颜色调制"""
	if current_character_node and current_character_node.has_method("set_character_modulate"):
		current_character_node.set_character_modulate(color)

# ==================== 第二个角色控制接口 ====================

func change_2nd_expression(expression: String, animated: bool = true) -> void:
	"""切换第二个角色表情"""
	if not current_2nd_character_node:
		push_warning("没有第二个角色，无法切换表情")
		return

	if not current_2nd_character_node.has_method("set_expression") and not current_2nd_character_node.has_method("set_expression_animated"):
		push_warning("第二个角色不支持表情切换")
		return

	if animated and current_2nd_character_node.has_method("set_expression_animated"):
		current_2nd_character_node.set_expression_animated(expression)
		print("第二个角色表情已切换（带动画）: ", expression)
	elif current_2nd_character_node.has_method("set_expression"):
		current_2nd_character_node.set_expression(expression)
		print("第二个角色表情已切换: ", expression)
	else:
		push_error("第二个角色节点不支持表情切换方法")

func set_2nd_character_alpha(alpha: float) -> void:
	"""设置第二个角色的透明度"""
	if current_2nd_character_node and current_2nd_character_node.has_method("set_alpha"):
		current_2nd_character_node.set_alpha(alpha)

func get_2nd_character_alpha() -> float:
	"""获取第二个角色的透明度"""
	if current_2nd_character_node and current_2nd_character_node.has_method("get_alpha"):
		return current_2nd_character_node.get_alpha()
	return 1.0

func set_2nd_character_modulate(color: Color) -> void:
	"""设置第二个角色的颜色调制"""
	if current_2nd_character_node and current_2nd_character_node.has_method("set_character_modulate"):
		current_2nd_character_node.set_character_modulate(color)

# ==================== 第三个角色控制接口 ====================

func change_3rd_expression(expression: String, animated: bool = true) -> void:
	"""切换第三个角色表情"""
	if not current_3rd_character_node:
		push_warning("没有第三个角色，无法切换表情")
		return

	if not current_3rd_character_node.has_method("set_expression") and not current_3rd_character_node.has_method("set_expression_animated"):
		push_warning("第三个角色不支持表情切换")
		return

	if animated and current_3rd_character_node.has_method("set_expression_animated"):
		current_3rd_character_node.set_expression_animated(expression)
		print("第三个角色表情已切换（带动画）: ", expression)
	elif current_3rd_character_node.has_method("set_expression"):
		current_3rd_character_node.set_expression(expression)
		print("第三个角色表情已切换: ", expression)
	else:
		push_error("第三个角色节点不支持表情切换方法")

func set_3rd_character_alpha(alpha: float) -> void:
	"""设置第三个角色的透明度"""
	if current_3rd_character_node and current_3rd_character_node.has_method("set_alpha"):
		current_3rd_character_node.set_alpha(alpha)

func get_3rd_character_alpha() -> float:
	"""获取第三个角色的透明度"""
	if current_3rd_character_node and current_3rd_character_node.has_method("get_alpha"):
		return current_3rd_character_node.get_alpha()
	return 1.0

func set_3rd_character_modulate(color: Color) -> void:
	"""设置第三个角色的颜色调制"""
	if current_3rd_character_node and current_3rd_character_node.has_method("set_character_modulate"):
		current_3rd_character_node.set_character_modulate(color)

# ==================== 角色颜色变化接口 ====================

func character_light(duration: float = 0.35, expression: String = "") -> void:
	"""使当前角色从背景暗色状态恢复到正常说话状态，可选择同时切换表情"""
	if current_character_node and current_character_node.has_method("character_light"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_expression(expression, false)  # 不使用动画以保持同步
		await current_character_node.character_light(duration).finished
		print("角色已变亮（说话状态）")
	else:
		push_warning("没有当前角色或角色不支持颜色变化")

func character_dark(duration: float = 0.35) -> void:
	"""使当前角色从正常说话状态变成背景暗色状态"""
	if current_character_node and current_character_node.has_method("character_dark"):
		await current_character_node.character_dark(duration).finished
		print("角色已变暗（背景状态）")
	else:
		push_warning("没有当前角色或角色不支持颜色变化")

# ==================== 第二个角色颜色变化接口 ====================

func character_2nd_light(duration: float = 0.35, expression: String = "") -> void:
	"""使第二个角色从背景暗色状态恢复到正常说话状态，可选择同时切换表情"""
	if current_2nd_character_node and current_2nd_character_node.has_method("character_light"):
		# 如果提供了表情参数，同时切换第二个角色的表情
		if expression != "":
			# 需要临时切换到第二个角色来更改表情
			var temp_character = current_character_node
			current_character_node = current_2nd_character_node
			change_expression(expression, false)  # 不使用动画以保持同步
			current_character_node = temp_character
		await current_2nd_character_node.character_light(duration).finished
		print("第二个角色已变亮（说话状态）")
	else:
		push_warning("没有第二个角色或第二个角色不支持颜色变化")

func character_2nd_dark(duration: float = 0.35) -> void:
	"""使第二个角色从正常说话状态变成背景暗色状态"""
	if current_2nd_character_node and current_2nd_character_node.has_method("character_dark"):
		await current_2nd_character_node.character_dark(duration).finished
		print("第二个角色已变暗（背景状态）")
	else:
		push_warning("没有第二个角色或第二个角色不支持颜色变化")

# ==================== 第三个角色颜色变化接口 ====================

func character_3rd_light(duration: float = 0.35, expression: String = "") -> void:
	"""使第三个角色从背景暗色状态恢复到正常说话状态，可选择同时切换表情"""
	if current_3rd_character_node and current_3rd_character_node.has_method("character_light"):
		# 如果提供了表情参数，同时切换第三个角色的表情
		if expression != "":
			change_3rd_expression(expression, false)  # 不使用动画以保持同步
		await current_3rd_character_node.character_light(duration).finished
		print("第三个角色已变亮（说话状态）")
	else:
		push_warning("没有第三个角色或第三个角色不支持颜色变化")

func character_3rd_dark(duration: float = 0.35) -> void:
	"""使第三个角色从正常说话状态变成背景暗色状态"""
	if current_3rd_character_node and current_3rd_character_node.has_method("character_dark"):
		await current_3rd_character_node.character_dark(duration).finished
		print("第三个角色已变暗（背景状态）")
	else:
		push_warning("没有第三个角色或第三个角色不支持颜色变化")

# ==================== 角色移动接口 ====================

func character_move_left(to_xalign: float, duration: float = 0.3, enable_brightness_change: bool = true, expression: String = "") -> void:
	"""使当前角色向左移动并变暗，类似RenPy的move_left transform
	参数:
	- to_xalign: 目标X位置（百分比，0.0-1.0，如0.2表示屏幕宽度的20%位置）
	- duration: 动画时长（默认0.3秒）
	- enable_brightness_change: 是否启用变暗动画（默认true）
	- expression: 可选的表情参数，在移动的同时切换表情
	"""
	if current_character_node and current_character_node.has_method("move_left"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_expression(expression, false)  # 不使用动画以保持同步
		await current_character_node.move_left(to_xalign, duration, enable_brightness_change).finished
		print("角色已向左移动到位置: ", to_xalign, " (", to_xalign * 100, "%)")
	else:
		push_warning("没有当前角色或角色不支持移动功能")

func character_2nd_move_left(to_xalign: float, duration: float = 0.3, enable_brightness_change: bool = true, expression: String = "") -> void:
	"""使第二个角色向左移动并变暗，类似RenPy的move_left transform
	参数:
	- to_xalign: 目标X位置（百分比，0.0-1.0，如0.2表示屏幕宽度的20%位置）
	- duration: 动画时长（默认0.3秒）
	- enable_brightness_change: 是否启用变暗动画（默认true）
	- expression: 可选的表情参数，在移动的同时切换表情
	"""
	if current_2nd_character_node and current_2nd_character_node.has_method("move_left"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_2nd_expression(expression, false)  # 不使用动画以保持同步
		await current_2nd_character_node.move_left(to_xalign, duration, enable_brightness_change).finished
		print("第二个角色已向左移动到位置: ", to_xalign, " (", to_xalign * 100, "%)")
	else:
		push_warning("没有第二个角色或第二个角色不支持移动功能")

func character_move_right(to_xalign: float, duration: float = 0.3, enable_brightness_change: bool = true, expression: String = "") -> void:
	"""使当前角色向右移动并变亮，类似RenPy的move_right transform
	参数:
	- to_xalign: 目标X位置（百分比，0.0-1.0，如0.8表示屏幕宽度的80%位置）
	- duration: 动画时长（默认0.3秒）
	- enable_brightness_change: 是否启用变亮动画（默认true）
	- expression: 可选的表情参数，在移动的同时切换表情
	"""
	if current_character_node and current_character_node.has_method("move_right"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_expression(expression, false)  # 不使用动画以保持同步
		await current_character_node.move_right(to_xalign, duration, enable_brightness_change).finished
		print("角色已向右移动到位置: ", to_xalign, " (", to_xalign * 100, "%)")
	else:
		push_warning("没有当前角色或角色不支持移动功能")

func character_2nd_move_right(to_xalign: float, duration: float = 0.3, enable_brightness_change: bool = true, expression: String = "") -> void:
	"""使第二个角色向右移动并变亮，类似RenPy的move_right transform
	参数:
	- to_xalign: 目标X位置（百分比，0.0-1.0，如0.8表示屏幕宽度的80%位置）
	- duration: 动画时长（默认0.3秒）
	- enable_brightness_change: 是否启用变亮动画（默认true）
	- expression: 可选的表情参数，在移动的同时切换表情
	"""
	if current_2nd_character_node and current_2nd_character_node.has_method("move_right"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_2nd_expression(expression, false)  # 不使用动画以保持同步
		await current_2nd_character_node.move_right(to_xalign, duration, enable_brightness_change).finished
		print("第二个角色已向右移动到位置: ", to_xalign, " (", to_xalign * 100, "%)")
	else:
		push_warning("没有第二个角色或第二个角色不支持移动功能")

func character_3rd_move_left(to_xalign: float, duration: float = 0.3, enable_brightness_change: bool = true, expression: String = "") -> void:
	"""使第三个角色向左移动并变暗，类似RenPy的move_left transform
	参数:
	- to_xalign: 目标X位置（百分比，0.0-1.0，如0.2表示屏幕宽度的20%位置）
	- duration: 动画时长（默认0.3秒）
	- enable_brightness_change: 是否启用变暗动画（默认true）
	- expression: 可选的表情参数，在移动的同时切换表情
	"""
	if current_3rd_character_node and current_3rd_character_node.has_method("move_left"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_3rd_expression(expression, false)  # 不使用动画以保持同步
		await current_3rd_character_node.move_left(to_xalign, duration, enable_brightness_change).finished
		print("第三个角色已向左移动到位置: ", to_xalign, " (", to_xalign * 100, "%)")
	else:
		push_warning("没有第三个角色或第三个角色不支持移动功能")

func character_3rd_move_right(to_xalign: float, duration: float = 0.3, enable_brightness_change: bool = true, expression: String = "") -> void:
	"""使第三个角色向右移动并变亮，类似RenPy的move_right transform
	参数:
	- to_xalign: 目标X位置（百分比，0.0-1.0，如0.8表示屏幕宽度的80%位置）
	- duration: 动画时长（默认0.3秒）
	- enable_brightness_change: 是否启用变亮动画（默认true）
	- expression: 可选的表情参数，在移动的同时切换表情
	"""
	if current_3rd_character_node and current_3rd_character_node.has_method("move_right"):
		# 如果提供了表情参数，同时切换表情
		if expression != "":
			change_3rd_expression(expression, false)  # 不使用动画以保持同步
		await current_3rd_character_node.move_right(to_xalign, duration, enable_brightness_change).finished
		print("第三个角色已向右移动到位置: ", to_xalign, " (", to_xalign * 100, "%)")
	else:
		push_warning("没有第三个角色或第三个角色不支持移动功能")

func hide_character() -> void:
	"""隐藏当前角色 - 带有0.1秒的渐变效果"""
	if current_character_node:
		# 角色渐变隐藏
		if character_tween:
			character_tween.kill()
		character_tween = create_tween()
		character_tween.tween_method(current_character_node.set_alpha, current_character_node.get_alpha(), 0.0, 0.1)
		character_tween.set_trans(Tween.TRANS_CUBIC)
		character_tween.set_ease(Tween.EASE_OUT)

		await character_tween.finished

		current_character_node.queue_free()
		current_character_node = null
		current_character = ""
		print("角色已隐藏 (渐变0.1秒)")

func hide_2nd_character() -> void:
	"""隐藏第二个角色 - 带有0.1秒的渐变效果"""
	if current_2nd_character_node:
		# 角色渐变隐藏
		if character2_tween:
			character2_tween.kill()
		character2_tween = create_tween()
		character2_tween.tween_method(current_2nd_character_node.set_alpha, current_2nd_character_node.get_alpha(), 0.0, 0.1)
		character2_tween.set_trans(Tween.TRANS_CUBIC)
		character2_tween.set_ease(Tween.EASE_OUT)

		await character2_tween.finished

		current_2nd_character_node.queue_free()
		current_2nd_character_node = null
		current_2nd_character = ""
		print("第二个角色已隐藏 (渐变0.1秒)")

func hide_3rd_character() -> void:
	"""隐藏第三个角色 - 带有0.1秒的渐变效果"""
	if current_3rd_character_node:
		# 角色渐变隐藏
		if character3_tween:
			character3_tween.kill()
		character3_tween = create_tween()
		character3_tween.tween_method(current_3rd_character_node.set_alpha, current_3rd_character_node.get_alpha(), 0.0, 0.1)
		character3_tween.set_trans(Tween.TRANS_CUBIC)
		character3_tween.set_ease(Tween.EASE_OUT)

		await character3_tween.finished

		current_3rd_character_node.queue_free()
		current_3rd_character_node = null
		current_3rd_character = ""
		print("第三个角色已隐藏 (渐变0.1秒)")

func hide_all_character() -> void:
	"""兼容旧脚本：hide_all_character() -> hide_all_characters()"""
	await hide_all_characters()

func hide_all_characters() -> void:
	"""同时隐藏所有角色 - 带有0.1秒的渐变效果"""
	var hide_tasks = []

	# 第一个角色的隐藏任务
	if current_character_node:
		if character_tween:
			character_tween.kill()
		character_tween = create_tween()
		character_tween.tween_method(current_character_node.set_alpha, current_character_node.get_alpha(), 0.0, 0.1)
		character_tween.set_trans(Tween.TRANS_CUBIC)
		character_tween.set_ease(Tween.EASE_OUT)
		hide_tasks.append(character_tween.finished)

	# 第二个角色的隐藏任务
	if current_2nd_character_node:
		if character2_tween:
			character2_tween.kill()
		character2_tween = create_tween()
		character2_tween.tween_method(current_2nd_character_node.set_alpha, current_2nd_character_node.get_alpha(), 0.0, 0.1)
		character2_tween.set_trans(Tween.TRANS_CUBIC)
		character2_tween.set_ease(Tween.EASE_OUT)
		hide_tasks.append(character2_tween.finished)

	# 第三个角色的隐藏任务
	if current_3rd_character_node:
		if character3_tween:
			character3_tween.kill()
		character3_tween = create_tween()
		character3_tween.tween_method(current_3rd_character_node.set_alpha, current_3rd_character_node.get_alpha(), 0.0, 0.1)
		character3_tween.set_trans(Tween.TRANS_CUBIC)
		character3_tween.set_ease(Tween.EASE_OUT)
		hide_tasks.append(character3_tween.finished)

	# 等待所有动画完成
	for task in hide_tasks:
		await task

	# 清理角色节点
	if current_character_node:
		current_character_node.queue_free()
		current_character_node = null
		current_character = ""

	if current_2nd_character_node:
		current_2nd_character_node.queue_free()
		current_2nd_character_node = null
		current_2nd_character = ""

	if current_3rd_character_node:
		current_3rd_character_node.queue_free()
		current_3rd_character_node = null
		current_3rd_character = ""

	print("所有角色已隐藏 (渐变0.1秒)")

func combined_scene(text: String, speaker: String, character: String, bg_path: String, music_path: String = "") -> void:
	"""组合场景操作"""
	var data = StoryData.new(StoryState.COMBINED)
	data.text = text
	data.speaker = speaker
	data.character_name = character
	data.background_path = bg_path
	data.music_path = music_path
	await execute_scene(data)

# ==================== 场景状态处理函数 ====================

func _handle_text_only(data: StoryData) -> void:
	"""处理纯文本显示"""
	print("处理纯文本: ", data.text)
	# 预留：实现纯文本显示逻辑
	_show_text_content(data.text)

	if data.wait_for_input:
		await _wait_for_user_input()

func _handle_dialog(data: StoryData) -> void:
	"""处理对话场景"""
	print("处理对话 - 说话人: ", data.speaker, ", 内容: ", data.text)
	# 预留：实现对话显示逻辑
	_show_dialog_content(data.text, data.speaker)

	if data.wait_for_input:
		await _wait_for_user_input()

func _handle_scene_change(_data: StoryData) -> void:
	"""处理场景变换"""
	print("处理场景变换")
	# 预留：实现场景切换逻辑
	# 可能包含背景、角色、音乐的组合切换
	pass

func _handle_character_change(data: StoryData) -> void:
	"""处理角色切换"""
	print("处理角色切换: ", data.character_name)
	current_character = data.character_name
	show_character(data.character_name, data.character_expression)

func _handle_expression_change(data: StoryData) -> void:
	"""处理表情切换"""
	print("处理表情切换: ", data.character_expression)
	if current_character_node and current_character_node.has_method("set_expression"):
		current_character_node.set_expression(data.character_expression)

func _handle_background_change(data: StoryData) -> void:
	"""处理背景切换"""
	print("处理背景切换: ", data.background_path, ", 转场: ", data.transition_type)
	# 预留：实现背景切换逻辑
	current_background = data.background_path
	_change_background_internal(data.background_path, data.transition_type)

func _handle_music_change(data: StoryData) -> void:
	"""处理音乐切换"""
	print("处理音乐切换: ", data.music_path)
	current_music = data.music_path
	_play_music_internal(data.music_path)

func _handle_combined(data: StoryData) -> void:
	"""处理组合操作"""
	print("处理组合操作")
	# 预留：按顺序执行多种操作
	# 1. 背景切换
	if data.background_path != "":
		_change_background_internal(data.background_path, data.transition_type)

	# 2. 音乐切换
	if data.music_path != "":
		current_music = data.music_path
		_play_music_internal(data.music_path)

	# 3. 角色切换
	if data.character_name != "":
		current_character = data.character_name
		show_character(data.character_name, data.character_expression)

	# 4. 显示对话
	if data.text != "":
		_show_dialog_content(data.text, data.speaker)

	if data.wait_for_input:
		await _wait_for_user_input()

# ==================== 底层实现函数 ====================

func _hide_all_elements():
	"""隐藏所有界面元素"""
	waiting_for_input = false

	if show_text_label:
		show_text_label.text = ""

	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false

func _show_text_content(content: String):
	"""显示文本内容"""
	# 添加到历史记录
	add_dialog_record(content, "")

	# 隐藏名字框，只显示文本
	if name_box:
		name_box.visible = false

	# 显示必要的UI元素
	if dialog_bg:
		dialog_bg.visible = true
	if show_text_label:
		show_text_label.visible = true
		if show_text_label.has_method("start_typewriter"):
			show_text_label.start_typewriter(content)
		else:
			show_text_label.text = content
	if log_button:
		log_button.visible = true
	if next_button:
		next_button.visible = true
	if skip_button:
		skip_button.visible = true

func _show_dialog_content(content: String, speaker: String):
	"""显示对话内容"""
	# 添加到历史记录
	add_dialog_record(content, speaker)

	# 显示必要的UI元素
	if dialog_bg:
		dialog_bg.visible = true
	if log_button:
		log_button.visible = true
	if next_button:
		next_button.visible = true
	if skip_button:
		skip_button.visible = true
	if show_text_label:
		show_text_label.visible = true

	if speaker != "":
		if name_box and name_label:
			name_label.text = speaker
			name_box.visible = true
	else:
		if name_box:
			name_box.visible = false

	if show_text_label:
		if show_text_label.has_method("start_typewriter"):
			show_text_label.start_typewriter(content)
		else:
			show_text_label.text = content

func _change_background_internal(bg_path: String, _transition: String):
	"""内部背景切换实现"""
	if bg_sprite and bg_path != "":
		var texture := _load_texture_any(bg_path)
		if texture:
			bg_sprite.texture = texture
			bg_sprite.visible = true
			print("背景已切换: ", bg_path)

func _play_music_internal(music_path: String):
	"""内部音乐播放实现"""
	if not audio_player:
		push_error("音频播放器未初始化")
		return

	if music_path == "":
		# 停止当前音乐
		audio_player.stop()
		print("音乐已停止")
		return

	# 加载音频资源
	var audio_resource := _load_audio_stream_any(music_path)
	if not audio_resource:
		push_error("无法加载音频文件: " + music_path)
		return

	# 设置音频流并播放
	audio_player.stream = audio_resource

	# 检查音频资源类型并设置循环
	if audio_resource is AudioStreamOggVorbis:
		audio_resource.loop = true
	elif audio_resource is AudioStreamMP3:
		audio_resource.loop = true
	elif audio_resource is AudioStreamWAV:
		audio_resource.loop_mode = AudioStreamWAV.LOOP_FORWARD

	audio_player.play()
	print("音乐开始循环播放: ", music_path)

func stop_music():
	"""停止当前音乐"""
	if audio_player:
		audio_player.stop()
		current_music = ""
		print("音乐已停止")

func set_music_volume(volume: float):
	"""设置音乐音量 (0.0 - 1.0)"""
	if audio_player:
		audio_player.volume_db = linear_to_db(volume)
		print("音乐音量设置为: ", volume)

func _wait_for_user_input() -> void:
	"""等待用户输入"""
	waiting_for_input = true

	# 如果打字机效果正在进行，先等待它完成
	if show_text_label and show_text_label.has_method("skip_typewriter") and show_text_label.get("is_typing"):
		await show_text_label.typing_finished

	await text_continue_pressed
	waiting_for_input = false

func restore_entrance_overlay(fade_duration: float = 0.5) -> void:
	"""恢复入场黑色遮罩的渐变动画"""
	if not entrance_overlay:
		push_error("入场遮罩节点未找到")
		return

	print("开始恢复入场黑色遮罩")

	# 先显示遮罩并设置为透明
	entrance_overlay.visible = true
	entrance_overlay.modulate.a = 0.0
	entrance_overlay.z_index = 1000  # 确保在最上层

	# 遮罩淡入动画
	if entrance_tween:
		entrance_tween.kill()
	entrance_tween = create_tween()
	entrance_tween.tween_property(entrance_overlay, "modulate:a", 1.0, fade_duration)
	entrance_tween.set_trans(Tween.TRANS_CUBIC)
	entrance_tween.set_ease(Tween.EASE_OUT)

	await entrance_tween.finished

	print("入场黑色遮罩恢复完成")

# ==================== 兼容性接口 ====================

func set_background(texture_path: String):
	"""兼容旧接口 - 设置背景"""
	change_background(texture_path)

func hide_background():
	"""兼容旧接口 - 隐藏背景"""
	# 如果有正在运行的背景切换动画，先等待完成
	if background_tween and background_tween.is_running():
		await background_tween.finished

	if bg_sprite:
		bg_sprite.visible = false

func hide_background_with_fade(fade_duration: float = 0.5) -> void:
	"""隐藏背景 - 带渐变效果，类似change_background的淡出效果"""
	if not bg_sprite or not bg_sprite.visible:
		print("背景不存在或已隐藏")
		return

	print("开始隐藏背景，渐变时长: ", fade_duration)

	# 创建渐变动画
	if background_tween:
		background_tween.kill()
	background_tween = create_tween()
	background_tween.tween_property(bg_sprite, "modulate:a", 0.0, fade_duration)
	background_tween.set_trans(Tween.TRANS_CUBIC)
	background_tween.set_ease(Tween.EASE_OUT)

	await background_tween.finished

	# 动画完成后隐藏背景
	bg_sprite.visible = false
	current_background = ""

	print("背景已隐藏 (渐变", fade_duration, "秒)")

func play_background_flash_effect(
	flash_color: Color = Color.WHITE,
	flash_count: int = 3,
	flash_duration: float = 0.05,
	flash_alpha: float = 1.0,
	end_colors: Array = [],
	hide_bg_after: bool = false
) -> void:
	"""通用背景闪烁效果 - 使用遮罩层覆盖背景
	参数:
	- flash_color: 闪烁的颜色（默认白色）
	- flash_count: 闪烁次数（默认3次）
	- flash_duration: 每次闪烁的持续时间（默认0.05秒）
	- flash_alpha: 闪烁时的透明度（默认1.0完全不透明，可设置0.6等半透明效果）
	- end_colors: 闪烁结束后依次变化的颜色数组（例如[Color.RED, Color.BLACK]表示先变红再变黑）
	- hide_bg_after: 效果结束后是否隐藏背景（默认false）

	使用示例:
	# 致命击中效果（白色闪3次后变红变黑，隐藏背景）
	await play_background_flash_effect(Color.WHITE, 3, 0.05, 1.0, [Color.RED, Color.BLACK], true)

	# 主角受击效果（红色闪3次，半透明，不隐藏背景）
	await play_background_flash_effect(Color.RED, 3, 0.1, 0.6, [], false)

	# 死亡效果（白色显示后变红变黑，隐藏背景）
	await play_background_flash_effect(Color.WHITE, 0, 0.1, 1.0, [Color.RED, Color.BLACK], true)
	"""
	print("=== 开始播放背景闪烁效果 ===")

	# 创建临时的闪烁遮罩层
	var flash_overlay = ColorRect.new()
	flash_overlay.color = flash_color
	flash_overlay.modulate.a = 0.0  # 初始透明
	flash_overlay.z_index = 2  # 在背景之上(z_index=1)，在角色(z_index=3)和Dialog UI之下
	flash_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# 设置遮罩覆盖整个屏幕
	var screen_size = get_viewport().get_visible_rect().size
	flash_overlay.position = Vector2.ZERO
	flash_overlay.size = screen_size

	add_child(flash_overlay)

	# 创建Tween动画序列
	var flash_tween = create_tween()

	# 闪烁循环
	for i in range(flash_count):
		# 显示颜色
		flash_tween.tween_property(flash_overlay, "modulate:a", flash_alpha, flash_duration)
		# 隐藏（变回原背景）
		flash_tween.tween_property(flash_overlay, "modulate:a", 0.0, flash_duration)

	# 如果有结束颜色序列
	if not end_colors.is_empty():
		# 先确保遮罩完全显示
		flash_tween.tween_property(flash_overlay, "modulate:a", 1.0, flash_duration)

		# 依次变化到每个颜色
		for color in end_colors:
			flash_tween.tween_property(flash_overlay, "color", color, flash_duration)

	# 设置动画曲线
	flash_tween.set_trans(Tween.TRANS_LINEAR)
	flash_tween.set_ease(Tween.EASE_IN_OUT)

	# 等待动画完成
	await flash_tween.finished

	# 清理遮罩层
	if flash_overlay and is_instance_valid(flash_overlay):
		flash_overlay.queue_free()

	# 如果需要隐藏背景
	if hide_bg_after:
		hide_background()

	print("=== 背景闪烁效果播放完成 ===")

func show_background(image_path: String, fade_time: float = 0.0):
	"""显示背景图片 - 支持可选的渐变效果"""
	if not bg_sprite:
		push_error("背景精灵节点未找到")
		return

	# 加载新的背景纹理
	var texture := _load_texture_any(image_path)
	if not texture:
		push_error("无法加载背景图片: " + image_path)
		return

	# 设置新的背景纹理
	bg_sprite.texture = texture
	bg_sprite.visible = true

	# 如果指定了渐变时间，执行渐变效果
	if fade_time > 0.0:
		# 开始时设置为透明
		bg_sprite.modulate.a = 0.0

		# 创建渐变动画
		if background_tween:
			background_tween.kill()
		background_tween = create_tween()
		background_tween.tween_property(bg_sprite, "modulate:a", 1.0, fade_time)
		background_tween.set_trans(Tween.TRANS_CUBIC)
		background_tween.set_ease(Tween.EASE_OUT)

		await background_tween.finished
	else:
		# 没有渐变时间，直接显示
		bg_sprite.modulate.a = 1.0

	current_background = image_path
	print("背景已显示: ", image_path, " 渐变时间: ", fade_time)


func _load_texture_any(path: String) -> Texture2D:
	if path.strip_edges().is_empty():
		return null

	# user:// 下通常没有 import/.remap，避免 ResourceLoader.load 报错
	if path.begins_with("user://") or (not path.begins_with("res://") and FileAccess.file_exists(path)):
		var raw := path.trim_suffix(".remap")
		if not FileAccess.file_exists(raw):
			return null
		var img := Image.new()
		if img.load(raw) != OK or img.is_empty():
			return null
		return ImageTexture.create_from_image(img)

	var tex := load(path) as Texture2D
	if tex == null and not path.ends_with(".remap"):
		tex = load(path + ".remap") as Texture2D
	return tex


func _load_audio_stream_any(path: String) -> AudioStream:
	var p := path.strip_edges()
	if p.is_empty():
		return null

	if p.begins_with("res://"):
		var stream := load(p) as AudioStream
		if stream == null and not p.ends_with(".remap"):
			stream = load(p + ".remap") as AudioStream
		return stream

	if not FileAccess.file_exists(p):
		return null
	var ext := p.get_extension().to_lower()
	if ext == "ogg" and ClassDB.class_exists("AudioStreamOggVorbis"):
		return AudioStreamOggVorbis.load_from_file(p)
	if ext == "mp3" and ClassDB.class_exists("AudioStreamMP3"):
		return AudioStreamMP3.load_from_file(p)
	if ext == "wav" and ClassDB.class_exists("AudioStreamWAV"):
		return AudioStreamWAV.load_from_file(p)
	return null

func show_text(content: String, speaker: String = ""):
	"""兼容旧接口 - 显示文本"""
	if speaker != "":
		await show_dialog(content, speaker)
	else:
		await show_text_only(content)

# ==================== 事件处理 ====================

func _on_continue_pressed():
	# 取消自动播放
	_cancel_auto_play()

	# 如果打字机效果正在进行，先跳过打字机效果
	if show_text_label and show_text_label.has_method("skip_typewriter") and show_text_label.get("is_typing"):
		show_text_label.skip_typewriter()
		return

	# 如果正在等待用户输入，继续剧情
	if waiting_for_input:
		text_continue_pressed.emit()

func _on_typing_finished():
	# 如果启用了自动播放，开始计时
	if is_auto_play and waiting_for_input:
		_start_auto_play_timer()

func _on_next_button_pressed():
	"""处理NextButton点击事件"""
	if is_auto_play:
		# 如果当前是自动播放状态，关闭自动播放
		_disable_auto_play_immediate()
	else:
		# 如果当前不是自动播放状态，开启自动播放
		_enable_auto_play_immediate()

func _on_next_button_mouse_exited():
	"""处理NextButton鼠标移出事件"""
	if pending_texture_swap:
		_execute_pending_texture_swap()
		pending_texture_swap = false

func _on_log_button_pressed():
	"""处理Log按钮点击事件"""
	toggle_log_interface()

func _on_log_mask_input(event: InputEvent):
	"""处理LogMask点击事件"""
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# 只响应点击，不响应拖拽
		toggle_log_interface()

func _on_log_scroll_container_input(event: InputEvent):
	"""处理LogScrollContainer滚动事件"""
	# 只处理滚动相关的事件，不处理按钮点击
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# 处理拖拽开始
		_start_drag(event.position)
	elif event is InputEventMouseMotion and _log_dragging:
		_handle_drag_motion(event.position)
		# 拖拽时标记为已处理，防止其他控件响应
		get_viewport().set_input_as_handled()

func _init_skip_ui_hide_timer():
	"""初始化跳过UI延迟隐藏计时器"""
	skip_ui_hide_timer = Timer.new()
	skip_ui_hide_timer.wait_time = SKIP_UI_HIDE_DELAY
	skip_ui_hide_timer.one_shot = true
	skip_ui_hide_timer.timeout.connect(_on_skip_ui_hide_timer_timeout)
	add_child(skip_ui_hide_timer)
	print("跳过UI延迟隐藏计时器初始化完成")

func _on_skip_ui_hide_timer_timeout():
	"""跳过UI延迟隐藏计时器超时回调 - 执行渐隐动画"""
	if not is_video_performance_mode or is_mouse_pressed:
		return

	# 渐隐跳过UI
	if skip_progress_container and skip_progress_container.visible and skip_progress_container.modulate.a > 0.0:
		if skip_ui_fade_tween:
			skip_ui_fade_tween.kill()

		skip_ui_fade_tween = create_tween()
		skip_ui_fade_tween.tween_property(skip_progress_container, "modulate:a", 0.0, SKIP_UI_FADE_DURATION)
		skip_ui_fade_tween.set_trans(Tween.TRANS_CUBIC)
		skip_ui_fade_tween.set_ease(Tween.EASE_OUT)

		await skip_ui_fade_tween.finished

		# 动画完成后隐藏UI
		if skip_progress_container and is_instance_valid(skip_progress_container):
			skip_progress_container.visible = false

		print("跳过UI已渐隐")

func _init_auto_play_system():
	"""初始化自动播放系统"""
	if not next_button:
		return

	# 保存原始材质
	original_normal_texture = next_button.texture_normal
	original_hover_texture = next_button.texture_hover

	# 创建自动播放计时器
	auto_play_timer = Timer.new()
	auto_play_timer.wait_time = 1.0
	auto_play_timer.one_shot = true
	auto_play_timer.timeout.connect(_on_auto_play_timeout)
	add_child(auto_play_timer)

	print("自动播放系统初始化完成")

func _enable_auto_play():
	"""启用自动播放"""
	is_auto_play = true
	_swap_button_textures()
	print("自动播放已启用")

	# 如果当前正在等待输入且文本显示完成，立即开始计时
	if waiting_for_input and show_text_label and not show_text_label.get("is_typing"):
		_start_auto_play_timer()

func _enable_auto_play_immediate():
	"""立即启用自动播放（点击时调用）"""
	is_auto_play = true
	pending_texture_swap = true  # 标记需要切换材质，等待鼠标移出
	print("自动播放已启用")

	# 如果当前正在等待输入且文本显示完成，立即开始计时
	if waiting_for_input and show_text_label and not show_text_label.get("is_typing"):
		_start_auto_play_timer()

func _disable_auto_play():
	"""禁用自动播放"""
	is_auto_play = false
	_stop_auto_play_timer()
	_restore_button_textures()
	print("自动播放已禁用")

func _disable_auto_play_immediate():
	"""立即禁用自动播放（点击时调用）"""
	is_auto_play = false
	_stop_auto_play_timer()
	pending_texture_swap = true  # 标记需要切换材质，等待鼠标移出
	print("自动播放已禁用")

func _cancel_auto_play():
	"""取消自动播放（用户交互时调用）"""
	if is_auto_play:
		_disable_auto_play()

func _swap_button_textures():
	"""交换按钮材质（启用自动播放时）"""
	if not next_button or not original_normal_texture or not original_hover_texture:
		return

	next_button.texture_normal = original_hover_texture
	next_button.texture_hover = original_normal_texture

func _restore_button_textures():
	"""恢复按钮材质（禁用自动播放时）"""
	if not next_button or not original_normal_texture or not original_hover_texture:
		return

	next_button.texture_normal = original_normal_texture
	next_button.texture_hover = original_hover_texture

func _execute_pending_texture_swap():
	"""执行待定的材质切换"""
	if is_auto_play:
		_swap_button_textures()
	else:
		_restore_button_textures()

func _start_auto_play_timer():
	"""开始自动播放计时"""
	if not auto_play_timer or not show_text_label:
		return

	# 根据文本长度计算等待时间
	var text_length = show_text_label.text.length()
	var base_time = max(text_length * 0.15, 2.0)  # 每个字符0.15秒，最少2秒
	var wait_time = base_time + 4.0  # 加上4秒冗余时间

	auto_play_timer.wait_time = wait_time
	auto_play_timer.start()
	print("自动播放计时开始，等待时间: ", wait_time, "秒 (文本长度: ", text_length, ")")

func _stop_auto_play_timer():
	"""停止自动播放计时"""
	if auto_play_timer and not auto_play_timer.is_stopped():
		auto_play_timer.stop()

func _on_auto_play_timeout():
	"""自动播放计时器超时回调"""
	if is_auto_play and waiting_for_input:
		print("自动播放触发，继续对话")
		text_continue_pressed.emit()

func _on_skip_button_pressed():
	"""处理跳过按钮点击事件"""
	print("跳过按钮被点击，结束当前剧情章节")
	end_story_episode()

func _start_drag(pos: Vector2) -> void:
	_log_dragging = true
	_drag_position = pos

func _handle_drag_motion(pos: Vector2) -> void:
	var delta: float = (pos.y - _drag_position.y)
	log_scroll_container.get_v_scroll_bar().value -= delta
	_drag_position = pos

func _end_drag() -> void:
	_log_dragging = false

func toggle_log_interface():
	"""切换Log界面显示状态"""
	if not log_interface:
		return

	if log_interface.visible:
		log_interface.visible = false
		# 关闭log界面时清理滚动条图片
		if log_scrollbar_texture:
			log_scrollbar_texture.queue_free()
			log_scrollbar_texture = null
	else:
		_populate_log_content()  # 显示log界面前先加载历史记录
		log_interface.visible = true

func _populate_log_content():
	"""填充log内容显示历史记录"""
	if not log_content:
		return

	# 清空现有内容
	for child in log_content.get_children():
		child.queue_free()

	# 加载方正兰亭准黑字体
	var custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")

	# 添加历史记录
	for record in dialog_history:
		var label = RichTextLabel.new()
		label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		label.bbcode_enabled = true
		label.text = record.text
		label.fit_content = true
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		label.size_flags_vertical = Control.SIZE_SHRINK_CENTER

		# 设置renpy风格的文本样式
		label.add_theme_color_override("default_color", Color("#f7f7f7"))  # 字体颜色
		label.add_theme_font_size_override("normal_font_size", 28)  # 字体大小28

		# 应用自定义字体（如果加载成功）
		if custom_font:
			label.add_theme_font_override("normal_font", custom_font)

		# 设置对齐方式为左对齐（xalign 0）
		label.text = "[left]" + record.text + "[/left]"

		log_content.add_child(label)

		# 添加行距间距（line_spacing 79的效果）
		var spacer = Control.new()
		spacer.mouse_filter = Control.MOUSE_FILTER_IGNORE
		spacer.custom_minimum_size = Vector2(0, 79)
		log_content.add_child(spacer)

	# 等待一帧以确保内容已添加，然后滚动到底部
	await get_tree().process_frame
	if log_scroll_container:
		log_scroll_container.scroll_vertical = int(log_scroll_container.get_v_scroll_bar().max_value)

func _manage_scrollbar_display():
	"""管理滚动条图片的显示"""
	if not log_interface:
		return

	# 滚动条图片创建功能已移除
	pass

# ==================== 调试和状态查询 ====================

func get_current_state() -> Dictionary:
	"""获取当前状态信息"""
	var state = {
		"current_character": current_character,
		"current_2nd_character": current_2nd_character,
		"current_3rd_character": current_3rd_character,
		"current_background": current_background,
		"current_music": current_music,
		"waiting_for_input": waiting_for_input,
		"character_node_exists": current_character_node != null,
		"2nd_character_node_exists": current_2nd_character_node != null,
		"3rd_character_node_exists": current_3rd_character_node != null
	}

	# 如果有第一个角色节点，添加角色相关状态
	if current_character_node:
		if current_character_node.has_method("get_alpha"):
			state["character_alpha"] = current_character_node.get_alpha()
		if current_character_node.has_method("get_current_expression"):
			state["character_expression"] = current_character_node.get_current_expression()
		if current_character_node.has_method("is_character_visible"):
			state["character_visible"] = current_character_node.is_character_visible()
		if current_character_node.has_method("get_character_modulate"):
			state["character_modulate"] = current_character_node.get_character_modulate()

	# 如果有第二个角色节点，添加第二个角色相关状态
	if current_2nd_character_node:
		if current_2nd_character_node.has_method("get_alpha"):
			state["2nd_character_alpha"] = current_2nd_character_node.get_alpha()
		if current_2nd_character_node.has_method("get_current_expression"):
			state["2nd_character_expression"] = current_2nd_character_node.get_current_expression()
		if current_2nd_character_node.has_method("is_character_visible"):
			state["2nd_character_visible"] = current_2nd_character_node.is_character_visible()
		if current_2nd_character_node.has_method("get_character_modulate"):
			state["2nd_character_modulate"] = current_2nd_character_node.get_character_modulate()

	# 如果有第三个角色节点，添加第三个角色相关状态
	if current_3rd_character_node:
		if current_3rd_character_node.has_method("get_alpha"):
			state["3rd_character_alpha"] = current_3rd_character_node.get_alpha()
		if current_3rd_character_node.has_method("get_current_expression"):
			state["3rd_character_expression"] = current_3rd_character_node.get_current_expression()
		if current_3rd_character_node.has_method("is_character_visible"):
			state["3rd_character_visible"] = current_3rd_character_node.is_character_visible()
		if current_3rd_character_node.has_method("get_character_modulate"):
			state["3rd_character_modulate"] = current_3rd_character_node.get_character_modulate()

	return state

func debug_print_state():
	"""调试输出当前状态"""
	var state = get_current_state()
	print("=== NovelInterface 当前状态 ===")
	for key in state.keys():
		print(key, ": ", state[key])

# ==================== 历史记录相关函数 ====================

func clear_dialog_history():
	"""清空对话历史记录"""
	clear_dialog_history_static()

func get_dialog_history_count() -> int:
	"""获取历史记录数量"""
	return get_dialog_history_count_static()

# ==================== 剧情结束相关函数 ====================

func end_story_episode(fade_duration: float = 0.5) -> void:
	"""结束剧情章节并返回主菜单"""
	print("=== 剧情章节结束 ===")

	"""清空所有历史记录"""
	clear_dialog_history_static()

	# 隐藏所有界面元素
	hide_all_story_elements()

	# 恢复黑色遮罩
	await restore_entrance_overlay(fade_duration)

	# 退回主菜单并重新播放背景音乐
	var main_menu = get_tree().get_first_node_in_group("main_menu")
	if main_menu:
		main_menu.clear_story_scene()

func hide_all_story_elements() -> void:
	"""隐藏所有剧情界面元素"""
	# 清理自动播放状态
	_disable_auto_play()
	pending_texture_swap = false

	# 清理滚动条图片
	if log_scrollbar_texture:
		log_scrollbar_texture.queue_free()
		log_scrollbar_texture = null

	# 清理特殊居中图片
	if current_special_image and is_instance_valid(current_special_image):
		current_special_image.queue_free()
		current_special_image = null

	# 清理背景滤镜
	_remove_background_filter()

	# 重置中心演出模式标志
	center_has_custom_background = false

	# Log界面关闭代码已移除

	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false
	if skip_button:
		skip_button.visible = false
	if show_text_label:
		show_text_label.visible = false
	if name_label:
		name_label.visible = false
	if log_button:
		log_button.visible = false
	if next_button:
		next_button.visible = false

	# 隐藏角色
	if current_character_node:
		current_character_node.queue_free()
		current_character_node = null
		current_character = ""

	if current_2nd_character_node:
		current_2nd_character_node.queue_free()
		current_2nd_character_node = null
		current_2nd_character = ""

	if current_3rd_character_node:
		current_3rd_character_node.queue_free()
		current_3rd_character_node = null
		current_3rd_character = ""

	print("所有剧情界面元素已隐藏")

# ==================== 中心文字演出模式 ====================

func enter_center_performance_mode(texts: Array, text_position: Vector2 = Vector2(-1, -1), font_path: String = "", font_size: int = 32, background_image: String = "", outline_size: int = 0, outline_color: Color = Color.BLACK, filter_color: Color = Color(0, 0, 0, 0), use_typewriter: bool = true, text_color: Color = Color.WHITE) -> void:
	"""进入中心文字演出模式
	参数:
	- texts: 需要依次显示的文字列表
	- text_position: 文本位置（Vector2(-1, -1)表示使用默认位置：左边距100，垂直居中）
	- font_path: 字体文件路径（空字符串表示使用默认字体：方正兰亭准黑）
	- font_size: 字体大小（默认32）
	- background_image: 背景图片路径（空字符串表示不显示背景图片）
	- outline_size: 文字边缘线粗细（0表示无边缘线）
	- outline_color: 文字边缘线颜色（默认黑色）
	- filter_color: 图片滤镜颜色（alpha为0表示无滤镜）
	- use_typewriter: 是否使用打字机效果（默认true）
	- text_color: 文字颜色（默认白色）
	"""
	if texts.is_empty():
		push_error("中心演出文字列表为空")
		return

	print("=== 进入中心文字演出模式 ===")

	# 保存文字列表
	center_performance_texts.clear()
	for text in texts:
		center_performance_texts.append(str(text))
	center_performance_current_index = 0
	is_center_performance_mode = true
	center_use_typewriter = use_typewriter  # 保存打字机效果设置

	# 隐藏所有UI元素
	_hide_ui_for_center_performance()

	# 如果指定了背景图片，显示背景图片
	if background_image != "":
		# 标记使用了自定义背景
		center_has_custom_background = true
		change_background(background_image)
		# 如果指定了滤镜颜色，添加滤镜
		if filter_color.a > 0:
			_apply_background_filter(filter_color)
	else:
		# 没有指定背景图片
		center_has_custom_background = false

	# 创建中心文字Label（每次都重新创建以避免字体更新问题）
	if center_text_label:
		if center_text_label.get_parent():
			center_text_label.get_parent().remove_child(center_text_label)
		center_text_label.free()
		center_text_label = null
	_create_center_text_label(text_position, font_path, font_size, outline_size, outline_color, text_color)

	# 显示第一行文字（不等待动画完成）
	_show_center_text(center_performance_texts[0])

	# 等待所有文字显示完毕并点击完成
	await center_performance_completed

func exit_center_performance_mode() -> void:
	"""退出中心文字演出模式（不自动恢复UI）
	注意：如果需要恢复UI，请手动调用 restore_ui_after_performance()
	"""
	print("=== 退出中心文字演出模式 ===")

	is_center_performance_mode = false
	center_performance_texts.clear()
	center_performance_current_index = 0
	center_use_typewriter = true  # 重置为默认值

	# 隐藏并清理中心文字Label
	if center_text_label and is_instance_valid(center_text_label):
		center_text_label.visible = false
		center_text_label.text = ""

	# 移除背景滤镜
	_remove_background_filter()

	# 直接隐藏背景（如果设置了自定义背景）
	if center_has_custom_background:
		# 停止背景切换动画，防止动画完成后重新显示背景
		if background_tween:
			background_tween.kill()
			background_tween = null

		# 清理可能存在的过渡背景精灵
		for child in get_children():
			if child is Sprite2D and child != bg_sprite and child.z_index > bg_sprite.z_index:
				child.queue_free()

		# 隐藏背景
		hide_background()
		center_has_custom_background = false
		print("背景已隐藏")

	# 不再自动恢复UI，需要手动调用 restore_ui_after_performance()

func restore_ui_after_performance() -> void:
	"""手动恢复中心演出模式后的UI元素
	在退出center performance mode后，如果需要恢复UI，手动调用此函数
	"""
	print("=== 恢复UI元素 ===")
	_restore_ui_after_center_performance()

func show_dialog_ui() -> void:
	"""显示对话UI（文本框、名字框、Log按钮、Next按钮）"""
	if dialog_bg:
		dialog_bg.visible = true
	if log_button:
		log_button.visible = true
	if next_button:
		next_button.visible = true
	if show_text_label:
		show_text_label.visible = true

func hide_dialog_ui() -> void:
	"""隐藏对话UI（文本框、名字框、Log按钮、Next按钮）"""
	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false
	if log_button:
		log_button.visible = false
	if next_button:
		next_button.visible = false
	if show_text_label:
		show_text_label.visible = false

func show_skip_button_ui() -> void:
	"""显示跳过按钮"""
	if skip_button:
		skip_button.visible = true

func hide_skip_button_ui() -> void:
	"""隐藏跳过按钮"""
	if skip_button:
		skip_button.visible = false

func _hide_ui_for_center_performance() -> void:
	"""为中心演出模式隐藏UI元素"""
	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false
	if skip_button:
		skip_button.visible = false
	if log_button:
		log_button.visible = false
	if next_button:
		next_button.visible = false
	if show_text_label:
		show_text_label.visible = false

func _restore_ui_after_center_performance() -> void:
	"""中心演出模式结束后恢复UI元素"""
	if dialog_bg:
		dialog_bg.visible = true
	if skip_button:
		skip_button.visible = true
	if log_button:
		log_button.visible = true
	if next_button:
		next_button.visible = true
	if show_text_label:
		show_text_label.visible = true

func _create_center_text_label(text_position: Vector2 = Vector2(-1, -1), font_path: String = "", font_size: int = 32, outline_size: int = 0, outline_color: Color = Color.BLACK, text_color: Color = Color.WHITE) -> void:
	"""创建中心文字Label
	参数:
	- text_position: 文本位置（Vector2(-1, -1)表示使用默认位置）
	- font_path: 字体文件路径（空字符串表示使用默认字体）
	- font_size: 字体大小（默认32）
	- outline_size: 文字边缘线粗细（0表示无边缘线）
	- outline_color: 文字边缘线颜色（默认黑色）
	- text_color: 文字颜色（默认白色）
	"""
	center_text_label = Label.new()

	# 获取屏幕尺寸
	var screen_size = get_viewport().get_visible_rect().size

	# 设置Label属性 - 左对齐，垂直居中
	center_text_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	center_text_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	center_text_label.autowrap_mode = TextServer.AUTOWRAP_OFF  # 不自动换行

	# 设置位置和尺寸
	if text_position == Vector2(-1, -1):
		# 使用默认位置：左边距100，右边距100，垂直居中
		var left_margin = 100.0
		var right_margin = 100.0
		center_text_label.position = Vector2(left_margin, 0)
		center_text_label.size = Vector2(screen_size.x - left_margin - right_margin, screen_size.y)
	else:
		# 使用指定位置
		center_text_label.position = text_position
		center_text_label.size = Vector2(screen_size.x - text_position.x - 100.0, screen_size.y)

	# 设置字体样式
	var custom_font = null
	if font_path != "":
		custom_font = load(font_path)
		if not custom_font:
			push_error("无法加载字体文件: " + font_path + "，将使用默认字体")
			custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	else:
		# 使用默认字体：方正兰亭准黑
		custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")

	# 只有在成功加载字体且类型正确时才设置
	if custom_font and custom_font is FontFile:
		center_text_label.add_theme_font_override("font", custom_font)
	else:
		if custom_font:
			push_error("字体文件类型不正确: " + str(custom_font))
		else:
			push_error("无法加载任何字体文件，将使用系统默认字体")
	center_text_label.add_theme_font_size_override("font_size", font_size)
	center_text_label.add_theme_color_override("font_color", text_color)

	# 设置文字边缘线
	if outline_size > 0:
		center_text_label.add_theme_constant_override("outline_size", outline_size)
		center_text_label.add_theme_color_override("font_outline_color", outline_color)

	# 设置z_index确保在最上层
	center_text_label.z_index = 100

	# 设置缩放为96%
	center_text_label.scale = Vector2(0.96, 0.96)

	add_child(center_text_label)

	print("中心文字Label已创建（位置: ", center_text_label.position, ", 字体大小: ", font_size, ", 字体: ", font_path if font_path != "" else "默认", ", 边缘线: ", outline_size, ", 缩放: 96%)")

func _update_center_text_label(text_position: Vector2 = Vector2(-1, -1), font_path: String = "", font_size: int = 32, outline_size: int = 0, outline_color: Color = Color.BLACK, text_color: Color = Color.WHITE) -> void:
	"""更新已存在的中心文字Label
	参数:
	- text_position: 文本位置（Vector2(-1, -1)表示使用默认位置）
	- font_path: 字体文件路径（空字符串表示使用默认字体）
	- font_size: 字体大小（默认32）
	- outline_size: 文字边缘线粗细（0表示无边缘线）
	- outline_color: 文字边缘线颜色（默认黑色）
	- text_color: 文字颜色（默认白色）
	"""
	if not center_text_label:
		return

	# 获取屏幕尺寸
	var screen_size = get_viewport().get_visible_rect().size

	# 更新位置和尺寸
	if text_position == Vector2(-1, -1):
		# 使用默认位置：左边距100，右边距100，垂直居中
		var left_margin = 100.0
		var right_margin = 100.0
		center_text_label.position = Vector2(left_margin, 0)
		center_text_label.size = Vector2(screen_size.x - left_margin - right_margin, screen_size.y)
	else:
		# 使用指定位置
		center_text_label.position = text_position
		center_text_label.size = Vector2(screen_size.x - text_position.x - 100.0, screen_size.y)

	# 更新字体
	var custom_font = null
	if font_path != "":
		custom_font = load(font_path)
		if not custom_font:
			push_error("无法加载字体文件: " + font_path + "，将使用默认字体")
			custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	else:
		# 使用默认字体：方正兰亭准黑
		custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")

	# 确保我们有一个有效的字体才进行更新
	if custom_font and custom_font is FontFile:
		center_text_label.add_theme_font_override("font", custom_font)
	else:
		# 如果加载失败，不进行字体更新，保持原有字体
		if custom_font:
			push_error("字体文件类型不正确: " + str(custom_font))
		else:
			push_error("无法加载任何字体文件，保持原有字体")

	# 更新字体大小
	center_text_label.add_theme_font_size_override("font_size", font_size)

	# 更新文字颜色
	center_text_label.add_theme_color_override("font_color", text_color)

	# 更新文字边缘线
	if outline_size > 0:
		center_text_label.add_theme_constant_override("outline_size", outline_size)
		center_text_label.add_theme_color_override("font_outline_color", outline_color)
	else:
		# 移除边缘线
		center_text_label.remove_theme_constant_override("outline_size")
		center_text_label.remove_theme_color_override("font_outline_color")

	# 设置缩放为96%
	center_text_label.scale = Vector2(0.96, 0.96)

	print("中心文字Label已更新（位置: ", center_text_label.position, ", 字体大小: ", font_size, ", 字体: ", font_path if font_path != "" else "默认", ", 边缘线: ", outline_size, ", 缩放: 96%)")


func _show_center_text(text: String) -> void:
	"""显示中心文字，可选打字机效果
	根据 center_use_typewriter 变量决定是否使用打字机效果
	"""
	if not center_text_label:
		push_error("中心文字Label不存在")
		return

	center_text_label.visible = true

	# 停止之前的动画
	if center_performance_tween:
		center_performance_tween.kill()

	if center_use_typewriter:
		# 使用打字机效果
		center_text_label.text = ""

		# 打字机效果
		var char_count = text.length()

		center_performance_tween = create_tween()

		# 逐字显示文字
		for i in range(char_count + 1):
			var partial_text = text.substr(0, i)
			center_performance_tween.tween_callback(func(): center_text_label.text = partial_text)
			if i < char_count:
				center_performance_tween.tween_interval(0.05)

		print("中心文字开始显示（打字机效果）: ", text)
	else:
		# 直接显示完整文字，无打字机效果
		center_text_label.text = text
		print("中心文字直接显示: ", text)

func _apply_background_filter(filter_color: Color) -> void:
	"""应用背景滤镜
	参数:
	- filter_color: 滤镜颜色（带alpha通道）
	"""
	# 如果已有滤镜，先移除
	if background_filter and is_instance_valid(background_filter):
		background_filter.queue_free()
		background_filter = null

	# 创建新的滤镜层
	background_filter = ColorRect.new()
	background_filter.color = filter_color
	background_filter.z_index = 2  # 在背景之上（bg_sprite z_index为1），在角色之下（角色z_index为3）
	background_filter.mouse_filter = Control.MOUSE_FILTER_IGNORE  # 不拦截鼠标事件

	# 设置滤镜覆盖整个屏幕
	var screen_size = get_viewport().get_visible_rect().size
	background_filter.position = Vector2.ZERO
	background_filter.size = screen_size

	add_child(background_filter)

	print("背景滤镜已应用（颜色: ", filter_color, "）")

func _remove_background_filter() -> void:
	"""移除背景滤镜"""
	if background_filter and is_instance_valid(background_filter):
		background_filter.queue_free()
		background_filter = null
		print("背景滤镜已移除")


func _on_center_performance_clicked() -> void:
	"""处理中心演出模式下的点击事件"""
	# 如果使用打字机效果且打字机效果正在进行，跳过打字机效果
	if center_use_typewriter and center_performance_tween and center_performance_tween.is_running():
		center_performance_tween.kill()
		# 立即显示完整文字
		if center_performance_current_index < center_performance_texts.size():
			center_text_label.text = center_performance_texts[center_performance_current_index]
		return  # 停在当前行，等待下一次点击

	# 打字机效果已完成（或已被跳过，或不使用打字机效果），切换到下一行
	center_performance_current_index += 1

	if center_performance_current_index < center_performance_texts.size():
		# 还有下一行，显示下一行
		_show_center_text(center_performance_texts[center_performance_current_index])
	else:
		# 没有下一行了，退出中心演出模式（但不恢复UI）
		exit_center_performance_mode()
		# 发出完成信号
		center_performance_completed.emit()
		print("=== 中心演出模式完成，发出信号 ===")

# ==================== 简报演出模式（COD4风格）====================

func enter_briefing_performance_mode(line1: String, line2: String, line1_font_size: int = 48, line2_font_size: int = 32, text_position: Vector2 = Vector2(-1, -1), font_path: String = "", line_spacing: float = 70.0) -> void:
	"""进入简报演出模式（COD4风格）
	参数:
	- line1: 第一行文字（通常是大标题）
	- line2: 第二行文字（通常是副标题）
	- line1_font_size: 第一行字体大小（默认48）
	- line2_font_size: 第二行字体大小（默认32）
	- text_position: 文本位置（Vector2(-1, -1)表示使用默认位置：右对齐，垂直居中）
	- font_path: 字体文件路径（空字符串表示使用默认字体：方正兰亭准黑）
	- line_spacing: 两行文字之间的距离（默认70）
	"""
	print("=== 进入简报演出模式（COD4风格）===")

	# 保存文字内容
	briefing_line1_text = line1
	briefing_line2_text = line2
	briefing_current_line = 0
	is_briefing_performance_mode = true

	# 隐藏所有UI元素
	_hide_ui_for_briefing_performance()

	# 创建简报Label（如果还没有）
	if not briefing_line1_label:
		_create_briefing_labels(line1_font_size, line2_font_size, text_position, font_path, line_spacing)
	else:
		# 如果已存在，更新字体大小、位置和字体
		_update_briefing_labels(line1_font_size, line2_font_size, text_position, font_path, line_spacing)

	# 自动播放：显示第一行，等待2秒，显示第二行，等待5秒
	await _show_briefing_line(1)
	await get_tree().create_timer(2.0).timeout
	await _show_briefing_line(2)
	await get_tree().create_timer(5.0).timeout

	# 两行都播放完成，退出简报模式
	exit_briefing_performance_mode()
	# 发出完成信号
	briefing_performance_completed.emit()
	print("=== 简报演出模式完成，发出信号 ===")

func exit_briefing_performance_mode() -> void:
	"""退出简报演出模式"""
	print("=== 退出简报演出模式 ===")

	is_briefing_performance_mode = false
	briefing_current_line = 0
	briefing_line1_text = ""
	briefing_line2_text = ""

	# 隐藏并清理简报Label
	if briefing_line1_label and is_instance_valid(briefing_line1_label):
		briefing_line1_label.visible = false
		briefing_line1_label.text = ""

	if briefing_line2_label and is_instance_valid(briefing_line2_label):
		briefing_line2_label.visible = false
		briefing_line2_label.text = ""

func restore_ui_after_briefing() -> void:
	"""手动恢复简报演出模式后的UI元素"""
	print("=== 恢复UI元素（简报模式后）===")
	_restore_ui_after_briefing_performance()

func _hide_ui_for_briefing_performance() -> void:
	"""为简报演出模式隐藏UI元素"""
	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false
	if skip_button:
		skip_button.visible = false
	if log_button:
		log_button.visible = false
	if next_button:
		next_button.visible = false
	if show_text_label:
		show_text_label.visible = false

func _restore_ui_after_briefing_performance() -> void:
	"""简报演出模式结束后恢复UI元素"""
	if dialog_bg:
		dialog_bg.visible = true
	if skip_button:
		skip_button.visible = true
	if log_button:
		log_button.visible = true
	if next_button:
		next_button.visible = true
	if show_text_label:
		show_text_label.visible = true

func _create_briefing_labels(line1_font_size: int, line2_font_size: int, text_position: Vector2 = Vector2(-1, -1), font_path: String = "", line_spacing: float = 70.0) -> void:
	"""创建简报Label（两行，右对齐）
	参数:
	- line1_font_size: 第一行字体大小
	- line2_font_size: 第二行字体大小
	- text_position: 文本位置（Vector2(-1, -1)表示使用默认位置：右对齐，垂直居中）
	- font_path: 字体文件路径（空字符串表示使用默认字体：方正兰亭准黑）
	- line_spacing: 两行文字之间的距离（默认70）
	"""
	var screen_size = get_viewport().get_visible_rect().size

	# 加载字体
	var custom_font = null
	if font_path != "":
		custom_font = load(font_path)
	else:
		# 使用默认字体：方正兰亭准黑
		custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")

	# 第一行Label（大字体）
	briefing_line1_label = Label.new()
	briefing_line1_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	briefing_line1_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	briefing_line1_label.autowrap_mode = TextServer.AUTOWRAP_OFF

	# 设置位置和尺寸
	if text_position == Vector2(-1, -1):
		# 使用默认位置 - 右侧，垂直居中偏上
		var right_margin = 20.0  # 右边距改为20，更靠近边框
		briefing_line1_label.position = Vector2(0, screen_size.y / 2.0 - 50)
		briefing_line1_label.size = Vector2(screen_size.x - right_margin, 100)
	else:
		# 使用指定位置
		# text_position.x 直接作为右边距（距离右边框的距离）
		# text_position.y 作为垂直位置
		var right_margin = text_position.x
		briefing_line1_label.position = Vector2(0, text_position.y)
		briefing_line1_label.size = Vector2(screen_size.x - right_margin, 100)

	# 设置字体样式
	if custom_font:
		briefing_line1_label.add_theme_font_override("font", custom_font)
	briefing_line1_label.add_theme_font_size_override("font_size", line1_font_size)
	briefing_line1_label.add_theme_color_override("font_color", Color.WHITE)
	briefing_line1_label.z_index = 100
	briefing_line1_label.visible = false

	add_child(briefing_line1_label)

	# 第二行Label（小字体）
	briefing_line2_label = Label.new()
	briefing_line2_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	briefing_line2_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	briefing_line2_label.autowrap_mode = TextServer.AUTOWRAP_OFF

	# 设置位置和尺寸 - 第一行下方，使用 line_spacing 参数
	if text_position == Vector2(-1, -1):
		# 使用默认位置 - 右侧，第一行下方
		var right_margin = 20.0  # 右边距改为20，更靠近边框
		briefing_line2_label.position = Vector2(0, screen_size.y / 2.0 - 50 + line_spacing)
		briefing_line2_label.size = Vector2(screen_size.x - right_margin, 80)
	else:
		# 使用指定位置（第二行在第一行下方 line_spacing 像素）
		# text_position.x 直接作为右边距（距离右边框的距离，可以为负数让文字更靠右）
		var right_margin = text_position.x
		briefing_line2_label.position = Vector2(0, text_position.y + line_spacing)
		briefing_line2_label.size = Vector2(screen_size.x - right_margin, 80)

	# 设置字体样式
	if custom_font:
		briefing_line2_label.add_theme_font_override("font", custom_font)
	briefing_line2_label.add_theme_font_size_override("font_size", line2_font_size)
	briefing_line2_label.add_theme_color_override("font_color", Color.WHITE)
	briefing_line2_label.z_index = 100
	briefing_line2_label.visible = false

	add_child(briefing_line2_label)

	print("简报Label已创建（位置: ", briefing_line1_label.position, ", 第一行字体大小: ", line1_font_size, ", 第二行字体大小: ", line2_font_size, ", 字体: ", font_path if font_path != "" else "默认", ", 行间距: ", line_spacing, ")")

func _update_briefing_labels(line1_font_size: int, line2_font_size: int, text_position: Vector2 = Vector2(-1, -1), font_path: String = "", line_spacing: float = 70.0) -> void:
	"""更新已存在的简报Label
	参数:
	- line1_font_size: 第一行字体大小
	- line2_font_size: 第二行字体大小
	- text_position: 文本位置（Vector2(-1, -1)表示使用默认位置：右对齐，垂直居中）
	- font_path: 字体文件路径（空字符串表示使用默认字体：方正兰亭准黑）
	- line_spacing: 两行文字之间的距离（默认70）
	"""
	if not briefing_line1_label or not briefing_line2_label:
		return

	var screen_size = get_viewport().get_visible_rect().size

	# 加载字体
	var custom_font = null
	if font_path != "":
		custom_font = load(font_path)
	else:
		# 使用默认字体：方正兰亭准黑
		custom_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")

	# 更新第一行Label的位置和字体
	if text_position == Vector2(-1, -1):
		# 使用默认位置 - 右侧，垂直居中偏上
		var right_margin = 20.0  # 右边距改为20，更靠近边框
		briefing_line1_label.position = Vector2(0, screen_size.y / 2.0 - 50)
		briefing_line1_label.size = Vector2(screen_size.x - right_margin, 100)
	else:
		# 使用指定位置
		# text_position.x 直接作为右边距（距离右边框的距离，可以为负数让文字更靠右）
		var right_margin = text_position.x
		briefing_line1_label.position = Vector2(0, text_position.y)
		briefing_line1_label.size = Vector2(screen_size.x - right_margin, 100)

	if custom_font:
		briefing_line1_label.add_theme_font_override("font", custom_font)
	briefing_line1_label.add_theme_font_size_override("font_size", line1_font_size)

	# 更新第二行Label的位置和字体，使用 line_spacing 参数
	if text_position == Vector2(-1, -1):
		# 使用默认位置 - 右侧，第一行下方
		var right_margin = 20.0  # 右边距改为20，更靠近边框
		briefing_line2_label.position = Vector2(0, screen_size.y / 2.0 - 50 + line_spacing)
		briefing_line2_label.size = Vector2(screen_size.x - right_margin, 80)
	else:
		# 使用指定位置（第二行在第一行下方 line_spacing 像素）
		# text_position.x 直接作为右边距（距离右边框的距离，可以为负数让文字更靠右）
		var right_margin = text_position.x
		briefing_line2_label.position = Vector2(0, text_position.y + line_spacing)
		briefing_line2_label.size = Vector2(screen_size.x - right_margin, 80)

	if custom_font:
		briefing_line2_label.add_theme_font_override("font", custom_font)
	briefing_line2_label.add_theme_font_size_override("font_size", line2_font_size)

	print("简报Label已更新（位置: ", briefing_line1_label.position, ", 第一行字体大小: ", line1_font_size, ", 第二行字体大小: ", line2_font_size, ", 字体: ", font_path if font_path != "" else "默认", ", 行间距: ", line_spacing, ")")


func _show_briefing_line(line_number: int) -> void:
	"""显示简报的某一行，带打字机效果
	参数:
	- line_number: 行号（1或2）
	"""
	var label: Label = null
	var text: String = ""

	if line_number == 1:
		label = briefing_line1_label
		text = briefing_line1_text
	elif line_number == 2:
		label = briefing_line2_label
		text = briefing_line2_text
	else:
		push_error("无效的行号: " + str(line_number))
		return

	if not label:
		push_error("简报Label不存在")
		return

	label.visible = true
	label.text = ""
	label.modulate.a = 1.0

	# 停止之前的动画
	if briefing_tween:
		briefing_tween.kill()

	# 创建打字机效果
	var char_count = text.length()
	briefing_tween = create_tween()

	# 逐字显示文字
	for i in range(char_count + 1):
		var partial_text = text.substr(0, i)
		briefing_tween.tween_callback(func(): label.text = partial_text)
		if i < char_count:
			briefing_tween.tween_interval(0.05)

	print("简报第", line_number, "行开始显示: ", text)

	# 等待打字机动画完成
	await briefing_tween.finished

# ==================== 视频演出模式 ====================

func enter_video_performance_mode(video_paths) -> void:
	"""进入视频演出模式
	参数:
	- video_paths: 视频文件路径（String）或视频文件路径数组（Array）
	"""
	print("=== 进入视频演出模式 ===")

	# 检查是否为 Web 平台
	if OS.get_name() == "Web":
		push_warning("Web 平台不支持视频演出模式（VLC插件不可用），自动跳过")
		# 直接发出完成信号，跳过视频播放
		video_performance_completed.emit()
		return

	is_video_performance_mode = true
	skip_progress = 0.0
	is_mouse_pressed = false
	video_was_playing = false  # 重置播放状态

	# 处理输入参数：单个视频或视频列表
	video_playlist.clear()
	if video_paths is String:
		# 单个视频路径
		video_playlist.append(video_paths)
	elif video_paths is Array:
		# 视频路径数组
		for path in video_paths:
			video_playlist.append(str(path))
	else:
		push_error("video_paths 参数类型错误，应该是 String 或 Array")
		exit_video_performance_mode()
		video_performance_completed.emit()
		return

	if video_playlist.is_empty():
		push_error("视频列表为空")
		exit_video_performance_mode()
		video_performance_completed.emit()
		return

	current_video_index = 0
	print("视频播放列表包含 ", video_playlist.size(), " 个视频")

	# 隐藏所有UI元素
	_hide_ui_for_video_performance()

	# 清理旧的视频播放器（如果存在）
	if video_player and is_instance_valid(video_player):
		# 原生 VideoStreamPlayer
		if video_player.has_method("stop"):
			video_player.stop()
		if video_player.has_signal("finished") and video_player.finished.is_connected(_on_video_finished):
			video_player.finished.disconnect(_on_video_finished)
		if video_player.get_parent():
			video_player.get_parent().remove_child(video_player)
		video_player.queue_free()
		video_player = null

	if video_texture_rect and is_instance_valid(video_texture_rect):
		if video_texture_rect.get_parent():
			video_texture_rect.get_parent().remove_child(video_texture_rect)
		video_texture_rect.free()
		video_texture_rect = null

	if skip_progress_container and is_instance_valid(skip_progress_container):
		if skip_progress_container.get_parent():
			skip_progress_container.get_parent().remove_child(skip_progress_container)
		skip_progress_container.free()
		skip_progress_container = null

	if skip_text_button and is_instance_valid(skip_text_button):
		if skip_text_button.get_parent():
			skip_text_button.get_parent().remove_child(skip_text_button)
		skip_text_button.free()
		skip_text_button = null

	# 每次都重新创建视频播放器和UI
	_create_video_player()
	_create_skip_progress_bar()

	# 检查 Godot 原生视频播放类是否可用
	if not ClassDB.class_exists("VideoStreamPlayer"):
		push_error("未找到 VideoStreamPlayer（Godot 原生视频播放不可用）。")
		# 为了不阻塞剧情，直接跳过视频演出
		exit_video_performance_mode()
		video_performance_completed.emit()
		return

	# 播放第一个视频
	_play_video_at_index(current_video_index)

	# 等待所有视频播放完成或被跳过
	await video_performance_completed

func exit_video_performance_mode() -> void:
	"""退出视频演出模式"""
	print("=== 退出视频演出模式 ===")

	is_video_performance_mode = false
	skip_progress = 0.0
	is_mouse_pressed = false
	video_was_playing = false  # 重置播放状态标志
	video_playlist.clear()  # 清空播放列表
	current_video_index = 0  # 重置索引

	# 停止延迟隐藏计时器
	if skip_ui_hide_timer and not skip_ui_hide_timer.is_stopped():
		skip_ui_hide_timer.stop()

	# 停止渐显/渐隐动画
	if skip_ui_fade_tween:
		skip_ui_fade_tween.kill()

	# 停止并清理视频播放器
	if video_player and is_instance_valid(video_player):
		if video_player.has_method("stop"):
			video_player.stop()
		if video_player.has_method("set"):
			video_player.set("stream", null)
		# 断开信号连接
		if video_player.has_signal("finished") and video_player.finished.is_connected(_on_video_finished):
			video_player.finished.disconnect(_on_video_finished)

	# 隐藏视频纹理
	if video_texture_rect and is_instance_valid(video_texture_rect):
		video_texture_rect.visible = false
		video_texture_rect.texture = null

	# 隐藏跳过进度条并重置透明度
	if skip_progress_container and is_instance_valid(skip_progress_container):
		skip_progress_container.visible = false
		skip_progress_container.modulate.a = 0.0

	# 隐藏跳过文字按钮
	if skip_text_button and is_instance_valid(skip_text_button):
		skip_text_button.visible = false

	# 停止进度条动画
	if skip_progress_tween:
		skip_progress_tween.kill()

func _resolve_video_path_compatible(path: String) -> String:
	"""兼容旧脚本用法：
	- chapter 脚本里仍然传 .mp4 路径，但资源已替换为 .ogv
	- 这里自动尝试将 .mp4/.webm/.mkv 等替换为 .ogv
	返回：可用的 res:// 路径；若找不到则返回空字符串
	"""
	var p := path.strip_edges()
	if p.is_empty():
		return ""

	# 1) 原路径存在
	if ResourceLoader.exists(p) or ResourceLoader.exists(p + ".remap"):
		return p

	# 2) 尝试替换为 .ogv
	var base := p
	var dot := p.rfind(".")
	if dot != -1:
		base = p.substr(0, dot)
	var ogv := base + ".ogv"
	if ResourceLoader.exists(ogv) or ResourceLoader.exists(ogv + ".remap"):
		return ogv

	# 3) 兜底：如果本来没扩展名，也尝试直接加 .ogv
	if dot == -1:
		ogv = p + ".ogv"
		if ResourceLoader.exists(ogv) or ResourceLoader.exists(ogv + ".remap"):
			return ogv

	return ""

func _play_video_at_index(index: int) -> void:
	"""播放指定索引的视频
	参数:
	- index: 视频在播放列表中的索引
	"""
	if index < 0 or index >= video_playlist.size():
		push_error("视频索引越界: ", index)
		return

	var requested_path: String = video_playlist[index]
	var resolved_path := _resolve_video_path_compatible(requested_path)
	print("开始播放视频 [", index + 1, "/", video_playlist.size(), "]: ", requested_path, " -> ", resolved_path)

	# 重置播放状态
	video_was_playing = false
	skip_progress = 0.0

	if resolved_path.is_empty():
		push_error("无法找到可用的视频文件（已尝试 .ogv 替换）: " + requested_path)
		_on_single_video_finished()
		return

	# 加载视频流资源
	var stream_res = load(resolved_path)
	if not stream_res:
		push_error("无法加载视频文件: " + resolved_path)
		_on_single_video_finished()
		return

	# 设置流并播放（原生 VideoStreamPlayer）
	if not (video_player and is_instance_valid(video_player)):
		push_error("视频播放器未创建")
		_on_single_video_finished()
		return

	video_player.set("stream", stream_res)
	if video_player.has_method("play"):
		video_player.play()

func _on_single_video_finished() -> void:
	"""单个视频播放完成，播放下一个或结束"""
	print("视频 [", current_video_index + 1, "/", video_playlist.size(), "] 播放完成")

	current_video_index += 1

	if current_video_index < video_playlist.size():
		# 还有下一个视频，继续播放
		print("准备播放下一个视频...")
		_play_video_at_index(current_video_index)
	else:
		# 所有视频播放完成
		print("所有视频播放完成")
		exit_video_performance_mode()
		video_performance_completed.emit()

func restore_ui_after_video() -> void:
	"""手动恢复视频演出模式后的UI元素"""
	print("=== 恢复UI元素（视频模式后）===")
	_restore_ui_after_video_performance()

func _hide_ui_for_video_performance() -> void:
	"""为视频演出模式隐藏UI元素"""
	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false
	if skip_button:
		skip_button.visible = false
	if log_button:
		log_button.visible = false
	if next_button:
		next_button.visible = false
	if show_text_label:
		show_text_label.visible = false

func _restore_ui_after_video_performance() -> void:
	"""视频演出模式结束后恢复UI元素"""
	if dialog_bg:
		dialog_bg.visible = true
	if skip_button:
		skip_button.visible = true
	if log_button:
		log_button.visible = true
	if next_button:
		next_button.visible = true
	if show_text_label:
		show_text_label.visible = true

func _create_video_player() -> void:
	"""创建 Godot 原生视频播放器"""
	# Web 平台通常不支持该项目的视频播放链路，保持原逻辑：自动跳过
	if OS.get_name() == "Web":
		push_warning("Web 平台不支持视频演出模式，自动跳过")
		return

	# 检查原生播放器类是否存在
	if not ClassDB.class_exists("VideoStreamPlayer"):
		push_error("VideoStreamPlayer 类不存在（当前 Godot 构建未包含原生视频播放）")
		return

	# 创建原生 VideoStreamPlayer
	video_player = VideoStreamPlayer.new()
	add_child(video_player)

	# 以全屏方式显示
	if video_player is Control:
		video_player.set_anchors_preset(Control.PRESET_FULL_RECT)
		video_player.offset_left = 0
		video_player.offset_top = 0
		video_player.offset_right = 0
		video_player.offset_bottom = 0
		# 常见属性：保持比例居中（若属性不存在也不报错）
		if video_player.has_method("set"):
			video_player.set("stretch_mode", 1) # STRETCH_KEEP_ASPECT_CENTERED（尽量）
	else:
		# 如果不是 Control，就尽量放到左上角（多数情况下 VideoStreamPlayer 是 Control）
		video_player.position = Vector2.ZERO

	# 置于背景之上、UI之下（尽量复用你原来的层级）
	if video_player is CanvasItem:
		video_player.z_index = 99

	# 原生播放结束信号
	if video_player.has_signal("finished"):
		video_player.finished.connect(_on_video_finished)

	# 不再需要 VLC 的 TextureRect 输出
	if video_texture_rect and is_instance_valid(video_texture_rect):
		video_texture_rect.queue_free()
	video_texture_rect = null

	print("原生视频播放器已创建 (VideoStreamPlayer)")


func _create_skip_progress_bar() -> void:
	"""创建跳过进度条UI（右上角白色长条）"""
	# 创建容器
	skip_progress_container = Control.new()
	skip_progress_container.z_index = 101  # 在最上层

	# 设置容器位置（右上角）
	var screen_size = get_viewport().get_visible_rect().size
	var bar_width = 200.0
	var bar_height = 8.0
	var margin_right = 50.0
	var margin_top = 30.0

	skip_progress_container.position = Vector2(screen_size.x - bar_width - margin_right, margin_top)
	skip_progress_container.size = Vector2(bar_width, bar_height)

	add_child(skip_progress_container)

	# 创建进度条
	skip_progress_bar = ProgressBar.new()
	skip_progress_bar.min_value = 0.0
	skip_progress_bar.max_value = 1.0
	skip_progress_bar.value = 0.0
	skip_progress_bar.show_percentage = false
	skip_progress_bar.size = Vector2(bar_width, bar_height)

	# 设置进度条样式（白色简约风格）
	var stylebox_bg = StyleBoxFlat.new()
	stylebox_bg.bg_color = Color(1.0, 1.0, 1.0, 0.2)  # 半透明白色背景
	stylebox_bg.corner_radius_top_left = 4
	stylebox_bg.corner_radius_top_right = 4
	stylebox_bg.corner_radius_bottom_left = 4
	stylebox_bg.corner_radius_bottom_right = 4

	var stylebox_fill = StyleBoxFlat.new()
	stylebox_fill.bg_color = Color(1.0, 1.0, 1.0, 1.0)  # 纯白色填充
	stylebox_fill.corner_radius_top_left = 4
	stylebox_fill.corner_radius_top_right = 4
	stylebox_fill.corner_radius_bottom_left = 4
	stylebox_fill.corner_radius_bottom_right = 4

	skip_progress_bar.add_theme_stylebox_override("background", stylebox_bg)
	skip_progress_bar.add_theme_stylebox_override("fill", stylebox_fill)

	skip_progress_container.add_child(skip_progress_bar)
	skip_progress_container.visible = false
	skip_progress_container.modulate.a = 0.0  # 初始透明度为0

	print("跳过进度条已创建（右上角白色长条，初始隐藏）")

	# 创建跳过文字按钮（右下角）
	_create_skip_text_button()

func _create_skip_text_button() -> void:
	"""创建跳过文字按钮（右下角）"""
	skip_text_button = Button.new()
	skip_text_button.text = "Skip>"
	skip_text_button.z_index = 101  # 在最上层

	# 加载方正兰亭准黑字体并设置斜体
	var base_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	if base_font:
		# 创建字体变体以添加斜体效果
		var font_variation = FontVariation.new()
		font_variation.base_font = base_font
		# 使用Transform2D创建斜体倾斜效果：x轴向右上倾斜（顶部向右），y轴保持垂直
		font_variation.variation_transform = Transform2D(Vector2(1.0, 0.2), Vector2(0.0, 1.0), Vector2.ZERO)
		skip_text_button.add_theme_font_override("font", font_variation)

	# 设置字体样式：白色，字体缩小
	skip_text_button.add_theme_font_size_override("font_size", 24)
	skip_text_button.add_theme_color_override("font_color", Color.WHITE)
	skip_text_button.add_theme_color_override("font_hover_color", Color(1.0, 1.0, 1.0, 0.8))  # 鼠标悬停时稍微半透明
	skip_text_button.add_theme_color_override("font_pressed_color", Color(1.0, 1.0, 1.0, 0.6))  # 按下时更透明

	# 创建空的StyleBox以隐藏按钮的背景和边框
	var empty_stylebox = StyleBoxEmpty.new()
	skip_text_button.add_theme_stylebox_override("normal", empty_stylebox)
	skip_text_button.add_theme_stylebox_override("hover", empty_stylebox)
	skip_text_button.add_theme_stylebox_override("pressed", empty_stylebox)
	skip_text_button.add_theme_stylebox_override("focus", empty_stylebox)

	# 设置位置（更靠近右下角）
	var screen_size = get_viewport().get_visible_rect().size
	var margin_right = 30.0
	var margin_bottom = 10.0
	skip_text_button.position = Vector2(screen_size.x - 100.0 - margin_right, screen_size.y - 40.0 - margin_bottom)
	skip_text_button.size = Vector2(100.0, 40.0)

	# 连接点击信号
	skip_text_button.pressed.connect(_on_skip_text_button_pressed)

	add_child(skip_text_button)

	print("跳过文字按钮已创建（右下角，白色斜体 Skip>）")

func _on_skip_text_button_pressed() -> void:
	"""处理跳过文字按钮点击事件"""
	print("跳过文字按钮被点击，直接跳过所有剩余视频")
	exit_video_performance_mode()
	video_performance_completed.emit()

func _on_video_finished() -> void:
	"""视频播放完成回调（原生 finished 信号）"""
	print("收到视频播放完成信号")
	_on_single_video_finished()

func _process_video_skip_input(delta: float) -> void:
	"""处理视频跳过输入（在_process中调用）"""
	if not is_video_performance_mode:
		return

	# 检查视频是否播放完成（原生播放器优先走 finished 信号；这里做兜底检测）
	if video_player and is_instance_valid(video_player):
		var is_playing := false
		if video_player.has_method("is_playing"):
			is_playing = video_player.is_playing()

		# 如果视频正在播放，标记为已播放
		if is_playing:
			video_was_playing = true

		# 如果视频曾经播放过，但现在停止了，认为播放结束
		# （避免某些情况下 finished 信号未触发）
		if video_was_playing and not is_playing:
			print("!!! 兜底检测到视频播放结束（is_playing=false）")
			_on_single_video_finished()
			return

	if is_mouse_pressed:
		# 停止延迟隐藏计时器
		if skip_ui_hide_timer and not skip_ui_hide_timer.is_stopped():
			skip_ui_hide_timer.stop()

		# 如果UI未显示或不完全显示，执行渐显动画
		if skip_progress_container and (not skip_progress_container.visible or skip_progress_container.modulate.a < 1.0):
			# 停止之前的渐隐动画
			if skip_ui_fade_tween:
				skip_ui_fade_tween.kill()

			# 显示UI并开始渐显
			skip_progress_container.visible = true

			skip_ui_fade_tween = create_tween()
			skip_ui_fade_tween.tween_property(skip_progress_container, "modulate:a", 1.0, SKIP_UI_FADE_DURATION)
			skip_ui_fade_tween.set_trans(Tween.TRANS_CUBIC)
			skip_ui_fade_tween.set_ease(Tween.EASE_OUT)

			print("跳过UI开始渐显")

		# 鼠标按下，线性增加进度
		skip_progress += delta / SKIP_FILL_TIME
		skip_progress = clamp(skip_progress, 0.0, 1.0)

		# 更新进度条
		if skip_progress_bar:
			skip_progress_bar.value = skip_progress

		# 如果进度条充满，跳过所有剩余视频
		if skip_progress >= 1.0:
			print("跳过进度条已充满，跳过所有剩余视频")
			exit_video_performance_mode()
			video_performance_completed.emit()
	else:
		# 鼠标松开，启动延迟隐藏计时器
		if skip_ui_hide_timer and skip_ui_hide_timer.is_stopped() and skip_progress_container and skip_progress_container.visible:
			skip_ui_hide_timer.start()

		# 鼠标松开，非线性减少进度（带阻尼感）
		if skip_progress > 0.0:
			# 使用指数衰减实现阻尼效果
			var drain_speed = skip_progress / SKIP_DRAIN_TIME
			skip_progress -= drain_speed * delta * 2.0  # 乘以2.0加快初始衰减
			skip_progress = max(skip_progress, 0.0)

			# 更新进度条
			if skip_progress_bar:
				skip_progress_bar.value = skip_progress

# ==================== 历史记录管理（原Log.gd的静态方法） ====================

## 添加对话记录到历史
static func add_dialog_record(text: String, _speaker: String = ""):
	"""添加对话记录到历史记录 - 只记录文字内容，不记录人名"""
	var record = {
		"text": text,
		"timestamp": Time.get_ticks_msec()
	}
	dialog_history.append(record)
	print("历史记录已添加: ", text.substr(0, min(20, text.length())))

## 清空历史记录
static func clear_dialog_history_static():
	"""清空所有历史记录"""
	dialog_history.clear()
	print("历史记录已清空")

## 获取历史记录数量
static func get_dialog_history_count_static() -> int:
	"""获取历史记录数量"""
	return dialog_history.size()

## 获取历史记录（用于调试或导出）
static func get_dialog_history() -> Array[Dictionary]:
	"""获取完整历史记录数组"""
	return dialog_history

# ==================== 姓名输入模式 ====================

func enter_name_input_mode() -> String:
	"""进入姓名输入模式，返回玩家输入的姓名"""
	print("=== 进入姓名输入模式 ===")

	is_name_input_mode = true
	current_player_name = ""

	# 隐藏所有UI元素
	_hide_ui_for_name_input()

	# 创建姓名输入界面
	_create_name_input_ui()

	# 等待玩家输入完成
	await name_input_completed

	# 退出姓名输入模式
	exit_name_input_mode()

	print("=== 姓名输入完成：", current_player_name, " ===")
	return current_player_name

func exit_name_input_mode() -> void:
	"""退出姓名输入模式"""
	print("=== 退出姓名输入模式 ===")

	is_name_input_mode = false

	# 清理UI元素
	if name_input_background and is_instance_valid(name_input_background):
		name_input_background.queue_free()
		name_input_background = null

	if name_input_box_bg and is_instance_valid(name_input_box_bg):
		name_input_box_bg.queue_free()
		name_input_box_bg = null

	if name_input_field and is_instance_valid(name_input_field):
		name_input_field.queue_free()
		name_input_field = null

	if name_confirm_button and is_instance_valid(name_confirm_button):
		name_confirm_button.queue_free()
		name_confirm_button = null

	if name_confirm_label and is_instance_valid(name_confirm_label):
		name_confirm_label.queue_free()
		name_confirm_label = null

	if name_error_label and is_instance_valid(name_error_label):
		name_error_label.queue_free()
		name_error_label = null

func _hide_ui_for_name_input() -> void:
	"""为姓名输入模式隐藏UI元素"""
	if dialog_bg:
		dialog_bg.visible = false
	if name_box:
		name_box.visible = false
	if skip_button:
		skip_button.visible = false
	if log_button:
		log_button.visible = false
	if next_button:
		next_button.visible = false
	if show_text_label:
		show_text_label.visible = false
	if bg_sprite:
		bg_sprite.visible = false

func _create_name_input_ui() -> void:
	"""创建姓名输入UI"""
	var screen_size = get_viewport().get_visible_rect().size

	# 1. 创建背景（AEGIS.png，720p）
	name_input_background = Sprite2D.new()
	var bg_texture = load("res://assets/gui/namebox/AEGIS.png")
	if bg_texture:
		name_input_background.texture = bg_texture
		# 720p图片居中显示
		name_input_background.position = screen_size / 2.0
		name_input_background.z_index = 98
		add_child(name_input_background)
		print("姓名输入背景已创建")
	else:
		push_error("无法加载背景图片: res://assets/gui/namebox/AEGIS.png")

	# 2. 创建输入框背景（input.png，居中偏下）
	name_input_box_bg = Sprite2D.new()
	var input_bg_texture = load("res://assets/gui/namebox/input.png")
	if input_bg_texture:
		name_input_box_bg.texture = input_bg_texture
		# 居中偏下位置（向下移动更多）
		name_input_box_bg.position = Vector2(screen_size.x / 2.0, screen_size.y / 2.0 + 150)
		name_input_box_bg.z_index = 99
		add_child(name_input_box_bg)
		print("输入框背景已创建")
	else:
		push_error("无法加载输入框背景: res://assets/gui/namebox/input.png")

	# 3. 创建输入框（LineEdit）
	name_input_field = LineEdit.new()
	name_input_field.placeholder_text = "请输入姓名(2-6字符)"
	name_input_field.max_length = 6
	name_input_field.alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_input_field.z_index = 100

	# 设置输入框样式
	var input_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	if input_font:
		name_input_field.add_theme_font_override("font", input_font)
	name_input_field.add_theme_font_size_override("font_size", 28)
	name_input_field.add_theme_color_override("font_color", Color.BLACK)  # 输入的文字为黑色
	name_input_field.add_theme_color_override("font_placeholder_color", Color(0.5, 0.5, 0.5, 0.7))  # 提示文字为灰色

	# 设置输入框位置和大小（与背景图对齐，向下移动）
	var input_width = 400.0
	var input_height = 50.0
	name_input_field.position = Vector2(screen_size.x / 2.0 - input_width / 2.0, screen_size.y / 2.0 + 150 - input_height / 2.0)
	name_input_field.size = Vector2(input_width, input_height)

	# 创建透明背景样式（不改变input背景颜色）
	var input_stylebox = StyleBoxFlat.new()
	input_stylebox.bg_color = Color(0, 0, 0, 0)  # 完全透明
	input_stylebox.border_width_left = 0
	input_stylebox.border_width_right = 0
	input_stylebox.border_width_top = 0
	input_stylebox.border_width_bottom = 0
	name_input_field.add_theme_stylebox_override("normal", input_stylebox)
	name_input_field.add_theme_stylebox_override("focus", input_stylebox)

	# 连接输入变化信号
	name_input_field.text_changed.connect(_on_name_input_changed)

	add_child(name_input_field)
	print("输入框已创建")

	# 4. 创建错误提示文字（在输入框上方）
	name_error_label = Label.new()
	name_error_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_error_label.z_index = 100
	var error_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	if error_font:
		name_error_label.add_theme_font_override("font", error_font)
	name_error_label.add_theme_font_size_override("font_size", 20)
	name_error_label.add_theme_color_override("font_color", Color(1.0, 0.3, 0.3))  # 红色
	name_error_label.position = Vector2(screen_size.x / 2.0 - 200, screen_size.y / 2.0 + 100)
	name_error_label.size = Vector2(400, 30)
	name_error_label.text = ""
	name_error_label.visible = false
	add_child(name_error_label)
	print("错误提示文字已创建")

	# 5. 创建确认按钮
	name_confirm_button = TextureButton.new()
	var confirm_btn_texture = load("res://assets/gui/namebox/confirmbtn.png")
	if confirm_btn_texture:
		name_confirm_button.texture_normal = confirm_btn_texture
		# 按钮位置（输入框下方）并居中对齐
		var btn_size = confirm_btn_texture.get_size()
		var scale_factor = 1.3
		# 计算缩放后的中心点，确保居中
		var scaled_btn_width = btn_size.x * scale_factor
		name_confirm_button.position = Vector2(screen_size.x / 2.0 - scaled_btn_width / 2.0, screen_size.y / 2.0 + 220)
		name_confirm_button.scale = Vector2(scale_factor, scale_factor)  # 放大30%
		name_confirm_button.z_index = 100

		# 初始状态：灰色禁用
		name_confirm_button.modulate = Color(0.5, 0.5, 0.5)
		name_confirm_button.disabled = true

		# 连接点击信号
		name_confirm_button.pressed.connect(_on_name_confirm_pressed)

		add_child(name_confirm_button)
		print("确认按钮已创建，缩放: ", scale_factor)
	else:
		push_error("无法加载确认按钮: res://assets/gui/namebox/confirmbtn.png")

	# 6. 创建确认按钮上的文字（"确认角色"）
	name_confirm_label = Label.new()
	name_confirm_label.text = "确认角色"
	name_confirm_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_confirm_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_confirm_label.z_index = 101
	var label_font = load("res://assets/gui/font/方正兰亭准黑_GBK.ttf")
	if label_font:
		name_confirm_label.add_theme_font_override("font", label_font)
	name_confirm_label.add_theme_font_size_override("font_size", 22)  # 字体缩小
	name_confirm_label.add_theme_color_override("font_color", Color(0.25, 0.25, 0.25))  # 初始更深的灰色文字

	if confirm_btn_texture:
		var btn_size = confirm_btn_texture.get_size()
		var scale_factor = 1.3
		# Label的位置和大小与按钮一致，居中对齐，并稍微往下移动
		var scaled_btn_width = btn_size.x * scale_factor
		name_confirm_label.position = Vector2(screen_size.x / 2.0 - scaled_btn_width / 2.0, screen_size.y / 2.0 + 223)
		name_confirm_label.size = btn_size
		name_confirm_label.scale = Vector2(scale_factor, scale_factor)

	add_child(name_confirm_label)
	print("确认按钮文字已创建")

func _on_name_input_changed(new_text: String) -> void:
	"""处理姓名输入变化"""
	var validation_result = _validate_name(new_text)

	if validation_result == "":
		# 验证通过
		name_error_label.visible = false
		name_confirm_button.disabled = false
		name_confirm_button.modulate = Color.WHITE  # 恢复原色
		if name_confirm_label:
			# 验证通过后文字颜色改为 #443814（深棕色）
			name_confirm_label.add_theme_color_override("font_color", Color("#443814"))
	else:
		# 验证失败
		name_error_label.text = validation_result
		name_error_label.visible = true
		name_confirm_button.disabled = true
		name_confirm_button.modulate = Color(0.5, 0.5, 0.5)  # 灰色
		if name_confirm_label:
			name_confirm_label.add_theme_color_override("font_color", Color(0.25, 0.25, 0.25))  # 文字更深的灰色

func _validate_name(input_name: String) -> String:
	"""验证姓名，返回错误信息（空字符串表示验证通过）"""
	# 检查长度
	if input_name.length() == 0:
		return "请输入姓名"  # 空文本返回错误

	if input_name.length() < 2:
		return "姓名至少需要2个字符"

	if input_name.length() > 6:
		return "姓名最多6个字符"

	# 检查是否包含特殊符号（只允许中文、英文、数字）
	var regex = RegEx.new()
	regex.compile("^[a-zA-Z0-9\u4e00-\u9fa5]+$")
	if not regex.search(input_name):
		return "姓名只能包含中文、英文或数字"

	return ""  # 验证通过

func _on_name_confirm_pressed() -> void:
	"""处理确认按钮点击"""
	var input_text = name_input_field.text
	var validation_result = _validate_name(input_text)

	if validation_result == "":
		# 验证通过，保存姓名到配置并发出完成信号
		current_player_name = input_text

		# 保存到配置文件
		_save_player_name_to_config(current_player_name)

		name_input_completed.emit(current_player_name)
	else:
		# 验证失败，显示错误并晃动提示文字
		name_error_label.text = validation_result
		name_error_label.visible = true
		_shake_error_label()

func _save_player_name_to_config(player_name_value: String) -> void:
	"""保存玩家姓名到配置文件"""
	# 使用 GameConfig 单例更新玩家名字
	GameConfig.player_name = player_name_value
	GameConfig.save()
	print("玩家姓名已保存到配置: ", player_name_value)

func _shake_error_label() -> void:
	"""晃动错误提示文字"""
	if name_shake_tween:
		name_shake_tween.kill()

	var original_pos = name_error_label.position
	name_shake_tween = create_tween()

	# 左右晃动3次
	for i in range(3):
		name_shake_tween.tween_property(name_error_label, "position:x", original_pos.x - 10, 0.05)
		name_shake_tween.tween_property(name_error_label, "position:x", original_pos.x + 10, 0.05)

	name_shake_tween.tween_property(name_error_label, "position:x", original_pos.x, 0.05)

	print("错误提示晃动")
