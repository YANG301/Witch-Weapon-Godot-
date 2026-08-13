extends Node

# 这里只控制平台 UI 与窗口兼容行为，不裁剪或停用同人、账号、多语言底层功能。
# Windows 显示完整 UI；macOS/Linux 隐藏未完成入口；Android/iOS 的设置项仅显示音量，致谢页始终保留。
const DEBUG_OVERRIDE_ENV := "WITCHWEAPON_PLATFORM_OVERRIDE"
const PLATFORM_FEATURES: Array[Dictionary] = [
	{"feature": "ww_windows", "name": "Windows"},
	{"feature": "ww_macos", "name": "macOS"},
	{"feature": "ww_linux", "name": "Linux"},
	{"feature": "ww_android", "name": "Android"},
	{"feature": "ww_ios", "name": "iOS"},
	{"feature": "ww_web", "name": "Web"},
]

func current_platform() -> String:
	var debug_override := _get_debug_override()
	if not debug_override.is_empty():
		return debug_override

	for platform_feature in PLATFORM_FEATURES:
		if OS.has_feature(str(platform_feature["feature"])):
			return str(platform_feature["name"])

	return OS.get_name()

func shows_dojin_ui() -> bool:
	return current_platform() == "Windows"

func shows_mod_editor_ui() -> bool:
	return current_platform() == "Windows"

func shows_account_ui() -> bool:
	return current_platform() == "Windows"

func is_mobile() -> bool:
	return current_platform() in ["Android", "iOS"]

func is_web() -> bool:
	return current_platform() == "Web"

func uses_desktop_window_settings() -> bool:
	return not is_mobile() and not is_web()

func shows_language_picker() -> bool:
	return current_platform() == "Windows"

func shows_thanks_page() -> bool:
	return true

func settings_are_audio_only() -> bool:
	return is_mobile()

func _get_debug_override() -> String:
	if not OS.is_debug_build():
		return ""

	match OS.get_environment(DEBUG_OVERRIDE_ENV).strip_edges().to_lower():
		"windows":
			return "Windows"
		"mac", "macos":
			return "macOS"
		"linux":
			return "Linux"
		"android":
			return "Android"
		"ios":
			return "iOS"
		"web":
			return "Web"
		_:
			return ""
