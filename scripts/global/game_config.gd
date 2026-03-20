extends Node

# 配置文件路径
const CONFIG_FILE_PATH = "user://game_config.cfg"
const DEFAULT_LANGUAGE_CODE := "zh"
const SUPPORTED_LANGUAGE_CODES := [
	"zh", "tc", "en", "jp", "kr", "de", "es", "fr", "it", "pt", "ru", "th", "vi"
]

# ConfigFile 实例
var config = ConfigFile.new()

# ==================== 默认配置 ====================
var default_config = {
	"player": {
		"name": "樱天澈"
	},
	"audio": {
		"master_volume": 100,
		"music_volume": 100,
		"sfx_volume": 100
	},
	"display": {
		"borderless": false,
		"screen": 0,
		"resolution_x": 1280,
		"resolution_y": 720
	},
	"language": {
		"current": DEFAULT_LANGUAGE_CODE
	},
	"gameplay": {
		# 未来的游戏设置可以在这里添加
	}
}

# ==================== 玩家设置 ====================
var player_name: String:
	get:
		return config.get_value("player", "name", default_config["player"]["name"])
	set(value):
		config.set_value("player", "name", value)

# ==================== 音频设置 ====================
var master_volume: float:
	get:
		return config.get_value("audio", "master_volume", default_config["audio"]["master_volume"])
	set(value):
		config.set_value("audio", "master_volume", clamp(value, 0.0, 100.0))

var music_volume: float:
	get:
		return config.get_value("audio", "music_volume", default_config["audio"]["music_volume"])
	set(value):
		config.set_value("audio", "music_volume", clamp(value, 0.0, 100.0))

var sfx_volume: float:
	get:
		return config.get_value("audio", "sfx_volume", default_config["audio"]["sfx_volume"])
	set(value):
		config.set_value("audio", "sfx_volume", clamp(value, 0.0, 100.0))

# ==================== 显示设置 ====================
var borderless: bool:
	get:
		return config.get_value("display", "borderless", default_config["display"]["borderless"])
	set(value):
		config.set_value("display", "borderless", value)

var screen: int:
	get:
		return config.get_value("display", "screen", default_config["display"]["screen"])
	set(value):
		config.set_value("display", "screen", value)

var resolution_x: int:
	get:
		return config.get_value("display", "resolution_x", default_config["display"]["resolution_x"])
	set(value):
		config.set_value("display", "resolution_x", value)

var resolution_y: int:
	get:
		return config.get_value("display", "resolution_y", default_config["display"]["resolution_y"])
	set(value):
		config.set_value("display", "resolution_y", value)

# ==================== 语言设置 ====================
var current_language: String:
	get:
		return _normalize_language_code(config.get_value("language", "current", default_config["language"]["current"]))
	set(value):
		config.set_value("language", "current", _normalize_language_code(value))

# ==================== 核心方法 ====================
func _ready():
	load_settings()
	# 启动时立即应用窗口设置
	apply_display_settings()

# 加载配置文件
func load_settings():
	var err = config.load(CONFIG_FILE_PATH)
	if err != OK:
		print("配置文件不存在，创建默认配置")
		reset_to_default()
		save()
	else:
		_ensure_default_config_values()
		config.set_value("language", "current", current_language)
		print("配置文件加载成功: ", CONFIG_FILE_PATH)

# 保存配置到文件
func save():
	var err = config.save(CONFIG_FILE_PATH)
	if err == OK:
		print("配置已保存")
	else:
		print("配置保存失败: ", err)

# 应用显示设置（窗口模式、屏幕、分辨率）
func apply_display_settings():
	# 加载显示设置
	var saved_screen = config.get_value("display", "screen", 0)
	var saved_borderless = config.get_value("display", "borderless", false)
	var saved_width = config.get_value("display", "resolution_x", 1280)
	var saved_height = config.get_value("display", "resolution_y", 720)
	var saved_size = Vector2i(saved_width, saved_height)

	# 验证屏幕索引
	var screen_count = DisplayServer.get_screen_count()
	var target_screen = saved_screen if (saved_screen >= 0 and saved_screen < screen_count) else 0

	# 应用窗口设置
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, saved_borderless)
	DisplayServer.window_set_current_screen(target_screen)

	# 获取屏幕信息
	var screen_position = DisplayServer.screen_get_position(target_screen)
	var screen_size = DisplayServer.screen_get_size(target_screen)

	if saved_borderless:
		# 无边框全屏模式，窗口大小等于屏幕大小
		DisplayServer.window_set_size(screen_size)
		DisplayServer.window_set_position(screen_position)
	else:
		# 窗口模式，使用保存的分辨率并居中到屏幕
		DisplayServer.window_set_size(saved_size)
		var window_pos = _center_window_to_screen(saved_size, target_screen)
		DisplayServer.window_set_position(window_pos)

	print("显示设置已应用: 屏幕=", target_screen, ", 无边框=", saved_borderless, ", 分辨率=", saved_size)

# 辅助函数：安全地居中窗口到屏幕（确保标题栏可见）
func _center_window_to_screen(window_size: Vector2i, screen_index: int) -> Vector2i:
	const MIN_TOP_MARGIN = 50
	var screen_size = DisplayServer.screen_get_size(screen_index)
	var screen_position = DisplayServer.screen_get_position(screen_index)

	# 计算居中位置
	var center_x = screen_position.x + (screen_size.x - window_size.x) / 2
	var center_y = screen_position.y + (screen_size.y - window_size.y) / 2

	# 确保窗口顶部至少距离屏幕顶部MIN_TOP_MARGIN像素
	if center_y < screen_position.y + MIN_TOP_MARGIN:
		center_y = screen_position.y + MIN_TOP_MARGIN

	return Vector2i(center_x, center_y)

# 重置为默认配置
func reset_to_default():
	config.clear()
	for section in default_config.keys():
		for key in default_config[section].keys():
			config.set_value(section, key, default_config[section][key])

	# 首次运行时，使用系统用户名作为玩家名
	var system_username = get_system_username()
	config.set_value("player", "name", system_username)
	print("配置已重置为默认值（玩家名: ", system_username, "）")

func _ensure_default_config_values() -> void:
	for section in default_config.keys():
		if not config.has_section(section):
			for key in default_config[section].keys():
				config.set_value(section, key, default_config[section][key])
			continue

		for key in default_config[section].keys():
			if not config.has_section_key(section, key):
				config.set_value(section, key, default_config[section][key])

func _normalize_language_code(value: Variant) -> String:
	var language_code := str(value).strip_edges().to_lower()

	match language_code:
		"ja":
			language_code = "jp"
		"ko":
			language_code = "kr"

	if SUPPORTED_LANGUAGE_CODES.has(language_code):
		return language_code

	return DEFAULT_LANGUAGE_CODE

# ==================== 辅助方法 ====================
# 获取系统用户名（类似《心跳文学社》的功能）
func get_system_username() -> String:
	var username = ""

	# Windows
	if OS.get_name() == "Windows":
		username = OS.get_environment("USERNAME")
		if username == "":
			# 备用方案：从 USERPROFILE 提取
			var user_profile = OS.get_environment("USERPROFILE")
			if user_profile != "":
				username = user_profile.get_file()

	# Linux / macOS / BSD 系列
	elif OS.get_name() in ["Linux", "macOS", "FreeBSD", "NetBSD", "OpenBSD", "BSD"]:
		username = OS.get_environment("USER")
		if username == "":
			# 备用方案：从 HOME 提取
			var home = OS.get_environment("HOME")
			if home != "":
				username = home.get_file()

	# 验证用户名是否符合规则
	if not _validate_username(username):
		print("系统用户名 '", username, "' 不符合规则，使用默认名称")
		username = "樱天澈"

	return username

# 验证用户名（与 NovelInterface 的验证规则一致）
func _validate_username(input_name: String) -> bool:
	"""验证用户名，返回 true 表示验证通过"""
	# 检查长度
	if input_name.length() == 0:
		return false

	if input_name.length() < 2:
		return false

	if input_name.length() > 6:
		return false

	# 检查是否包含特殊符号（只允许中文、英文、数字）
	var regex = RegEx.new()
	regex.compile("^[a-zA-Z0-9\u4e00-\u9fa5]+$")
	if not regex.search(input_name):
		return false

	return true  # 验证通过

# 通用的 getter（如果需要访问未定义的配置项）
func get_setting(section: String, key: String, default = null):
	return config.get_value(section, key, default)

# 通用的 setter（如果需要设置未定义的配置项）
func set_setting(section: String, key: String, value):
	config.set_value(section, key, value)

# 打印当前所有配置（调试用）
func print_all_settings():
	print("========== 当前配置 ==========")
	for section in config.get_sections():
		print("[", section, "]")
		for key in config.get_section_keys(section):
			print("  ", key, " = ", config.get_value(section, key))
	print("==============================")
