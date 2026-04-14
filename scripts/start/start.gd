extends Control

# UI 节点引用
@onready var logo: Sprite2D = $LaunchLogo
@onready var bg: Sprite2D = $LoadingBg
@onready var button: TextureButton = $StartButton
@onready var start_button_text: Label = $StartButton/StartButtonText

# 资源配置
const BASE_PATH := "res://assets/images/load/Loading_Bg_"
const BG_IMAGE_COUNT := 27

# 动画时长
const LOGO_FADE_TIME := 1.0
const LOGO_DISPLAY_TIME := 2.0
const BG_SCALE_TIME := 0.2
const BG_INITIAL_SCALE := 1.1

# 多语言
const DEFAULT_LANGUAGE_CODE := "zh"
const START_BUTTON_TEXTS := {
	"zh": "进入游戏",
	"tc": "進入遊戲",
	"en": "Start",
	"jp": "ゲーム開始",
	"kr": "게임 시작",
	"de": "Starten",
	"es": "Empezar",
	"fr": "Jouer",
	"it": "Avvia",
	"pt": "Iniciar",
	"ru": "Начать",
	"th": "เริ่มเกม",
	"vi": "Bắt đầu"
}

func _ready() -> void:
	"""初始化场景，设置初始状态并播放启动动画"""
	_refresh_localized_texts()
	_initialize_components()
	await _play_startup_sequence()

func _refresh_localized_texts() -> void:
	"""刷新当前场景中的本地化文本"""
	if start_button_text == null:
		return

	start_button_text.set_anchors_preset(Control.PRESET_FULL_RECT)
	start_button_text.offset_left = 0.0
	start_button_text.offset_top = 0.0
	start_button_text.offset_right = 0.0
	start_button_text.offset_bottom = 0.0
	start_button_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	start_button_text.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	start_button_text.text = _resolve_localized_text(START_BUTTON_TEXTS)

func _initialize_components() -> void:
	"""初始化 UI 组件的初始状态"""
	logo.modulate.a = 0.0
	button.disabled = true

func _play_startup_sequence() -> void:
	"""播放完整的启动动画序列"""
	await _animate_logo()
	_setup_background()
	_animate_background()

func _animate_logo() -> void:
	"""播放 Logo 动画：淡入、显示、淡出"""
	var tween := _create_smooth_tween()

	tween.tween_property(logo, "modulate:a", 1.0, LOGO_FADE_TIME)
	tween.tween_interval(LOGO_DISPLAY_TIME)
	tween.tween_property(logo, "modulate:a", 0.0, LOGO_FADE_TIME)

	await tween.finished

func _setup_background() -> void:
	"""设置随机背景并启用开始按钮"""
	bg.texture = load(_get_random_bg_path())
	button.z_index = 1
	button.disabled = false

func _get_random_bg_path() -> String:
	"""生成随机背景图片路径"""
	var random_index := randi_range(0, BG_IMAGE_COUNT - 1)
	return BASE_PATH + str(random_index) + ".png"

func _animate_background() -> void:
	"""播放背景缩放动画，从略微放大缩放到正常大小"""
	bg.scale = Vector2(BG_INITIAL_SCALE, BG_INITIAL_SCALE)

	var tween := create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(bg, "scale", Vector2.ONE, BG_SCALE_TIME)

func _create_smooth_tween() -> Tween:
	"""创建带有平滑过渡效果的 Tween 对象"""
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	return tween

func _resolve_localized_text(text_map: Dictionary) -> String:
	var language_code := _get_current_language_code()

	if text_map.has(language_code):
		return text_map[language_code]

	return text_map.get(DEFAULT_LANGUAGE_CODE, "")

func _get_current_language_code() -> String:
	var game_config := get_node_or_null("/root/GameConfig")
	var language_code := DEFAULT_LANGUAGE_CODE

	if game_config != null:
		language_code = str(game_config.current_language).strip_edges().to_lower()

	match language_code:
		"ja":
			language_code = "jp"
		"ko":
			language_code = "kr"

	if START_BUTTON_TEXTS.has(language_code):
		return language_code

	return DEFAULT_LANGUAGE_CODE
