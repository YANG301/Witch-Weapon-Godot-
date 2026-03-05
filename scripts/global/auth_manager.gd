extends Node

signal auth_state_changed(is_logged_in: bool)
signal profile_changed(profile: Dictionary)

const BASE_URL := "https://auth.witchweapon.wiki"

var _http: HTTPRequest

var access_token: String = ""
var refresh_token: String = ""
var expires_at_unix: int = 0
var email: String = ""
var profile: Dictionary = {}

func _ready() -> void:
	_http = HTTPRequest.new()
	_http.use_threads = true
	add_child(_http)
	_load_from_config()

func is_logged_in() -> bool:
	return access_token != "" and Time.get_unix_time_from_system() < expires_at_unix

func is_admin() -> bool:
	var role_any: Variant = profile.get("role", "")
	if typeof(role_any) == TYPE_STRING:
		return str(role_any).to_lower() == "admin"
	if typeof(role_any) == TYPE_INT:
		return int(role_any) == 1
	return false

func logout() -> void:
	access_token = ""
	refresh_token = ""
	expires_at_unix = 0
	email = ""
	profile = {}
	_save_to_config()
	auth_state_changed.emit(false)
	profile_changed.emit(profile)

func send_code(email_in: String, password_in: String, is_register: bool) -> Dictionary:
	var path := "/api/auth/register/send-code" if is_register else "/api/auth/login/send-code"
	var payload := {
		"email": email_in,
		"password": password_in,
		"type": "register" if is_register else "login",
	}
	return await _request_json(path, HTTPClient.METHOD_POST, payload, PackedStringArray())

func verify_code(email_in: String, code: String) -> Dictionary:
	var payload := {"email": email_in, "code": code}
	var res := await _request_json("/api/auth/verify", HTTPClient.METHOD_POST, payload, PackedStringArray())
	if not res.get("ok", false):
		return res

	var parsed: Variant = res.get("data")
	var token_payload: Dictionary = {}
	if typeof(parsed) == TYPE_DICTIONARY:
		# Platform worker returns: { success, message, data: { access_token, refresh_token, expires_in } }
		if typeof(parsed.get("data")) == TYPE_DICTIONARY:
			token_payload = parsed["data"]
		else:
			token_payload = parsed

	if not token_payload.is_empty():
		access_token = str(token_payload.get("access_token", ""))
		refresh_token = str(token_payload.get("refresh_token", ""))
		var expires_in := int(token_payload.get("expires_in", 0))
		expires_at_unix = int(Time.get_unix_time_from_system()) + max(expires_in, 0)
		email = email_in
		_save_to_config()
		auth_state_changed.emit(is_logged_in())
	return res

func ensure_valid_token() -> bool:
	if is_logged_in():
		return true
	if refresh_token.strip_edges().is_empty():
		return false
	var refresh_res: Dictionary = await refresh_access_token()
	return bool(refresh_res.get("ok", false)) and is_logged_in()

func refresh_access_token() -> Dictionary:
	if refresh_token.strip_edges().is_empty():
		return {"ok": false, "status": 401, "error": "refresh_token_missing"}

	var payload := {"refresh_token": refresh_token}
	var res := await _request_json("/api/auth/refresh", HTTPClient.METHOD_POST, payload, PackedStringArray())
	if not res.get("ok", false):
		if int(res.get("status", 0)) == 401:
			logout()
		return res

	var parsed: Variant = res.get("data")
	var token_payload: Dictionary = {}
	if typeof(parsed) == TYPE_DICTIONARY:
		if typeof(parsed.get("data")) == TYPE_DICTIONARY:
			token_payload = parsed["data"]
		else:
			token_payload = parsed

	var new_access_token: String = str(token_payload.get("access_token", ""))
	if new_access_token.is_empty():
		return {"ok": false, "status": 500, "error": "refresh_response_missing_access_token", "data": parsed}

	access_token = new_access_token
	var new_refresh_token: String = str(token_payload.get("refresh_token", "")).strip_edges()
	if not new_refresh_token.is_empty():
		refresh_token = new_refresh_token
	var expires_in: int = int(token_payload.get("expires_in", 0))
	expires_at_unix = int(Time.get_unix_time_from_system()) + max(expires_in, 0)
	_save_to_config()
	auth_state_changed.emit(is_logged_in())
	return res

func _unwrap_api_payload(parsed: Variant) -> Dictionary:
	if typeof(parsed) != TYPE_DICTIONARY:
		return {}
	var payload: Dictionary = parsed as Dictionary
	if typeof(payload.get("data", null)) == TYPE_DICTIONARY:
		payload = payload.get("data", {}) as Dictionary
	if typeof(payload.get("profile", null)) == TYPE_DICTIONARY:
		payload = payload.get("profile", {}) as Dictionary
	return payload

func fetch_profile() -> Dictionary:
	if not await ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}
	var headers := PackedStringArray([
		"Authorization: Bearer %s" % access_token,
	])
	var res := await _request_json("/api/user/profile", HTTPClient.METHOD_GET, {}, headers)
	var parsed: Variant = res.get("data")
	var profile_payload: Dictionary = _unwrap_api_payload(parsed)

	if bool(res.get("ok", false)):
		# Some API variants wrap the payload or return partial fields; keep existing profile if payload is empty.
		if not profile_payload.is_empty():
			profile = profile_payload
		_save_to_config()
		profile_changed.emit(profile)
	return res

func update_profile_avatar(avatar_id: int, avatar_background_id: int) -> Dictionary:
	if not await ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}

	var headers := PackedStringArray([
		"Authorization: Bearer %s" % access_token,
	])
	var payload: Dictionary = {
		"avatar_id": avatar_id,
		"avatar_background_id": avatar_background_id,
	}
	var res: Dictionary = await _request_json("/api/user/profile", HTTPClient.METHOD_PUT, payload, headers)
	if int(res.get("status", 0)) == 401:
		var refreshed: Dictionary = await refresh_access_token()
		if bool(refreshed.get("ok", false)):
			headers = PackedStringArray([
				"Authorization: Bearer %s" % access_token,
			])
			res = await _request_json("/api/user/profile", HTTPClient.METHOD_PUT, payload, headers)

	if bool(res.get("ok", false)):
		var parsed: Variant = res.get("data")
		var profile_payload: Dictionary = _unwrap_api_payload(parsed)
		if not profile_payload.is_empty():
			profile = profile_payload
		else:
			# Keep local cache in sync even if the server returns no payload.
			if typeof(profile.get("profile_data", null)) == TYPE_DICTIONARY:
				var profile_data: Dictionary = profile.get("profile_data", {}) as Dictionary
				profile_data["avatar_id"] = avatar_id
				profile_data["avatar_background_id"] = avatar_background_id
				profile["profile_data"] = profile_data
			else:
				profile["avatar_id"] = avatar_id
				profile["avatar_background_id"] = avatar_background_id
		_save_to_config()
		profile_changed.emit(profile)
	return res

func fetch_avatar_options() -> Dictionary:
	if not await ensure_valid_token():
		return {"ok": false, "status": 401, "error": "not_logged_in"}

	var headers := PackedStringArray([
		"Authorization: Bearer %s" % access_token,
	])
	var res: Dictionary = await _request_json("/api/user/profile/avatar-options", HTTPClient.METHOD_GET, {}, headers)
	if int(res.get("status", 0)) == 401:
		var refreshed: Dictionary = await refresh_access_token()
		if bool(refreshed.get("ok", false)):
			headers = PackedStringArray([
				"Authorization: Bearer %s" % access_token,
			])
			res = await _request_json("/api/user/profile/avatar-options", HTTPClient.METHOD_GET, {}, headers)
	return res

func _request_json(path: String, method: int, payload: Dictionary, extra_headers: PackedStringArray) -> Dictionary:
	var url := BASE_URL + path
	var headers := PackedStringArray(["Content-Type: application/json"])
	for h in extra_headers:
		headers.append(h)

	var body := ""
	if method != HTTPClient.METHOD_GET:
		body = JSON.stringify(payload)

	var err := _http.request(url, headers, method, body)
	if err != OK:
		return {"ok": false, "status": 0, "error": "request_failed_%s" % err}

	var completed: Array = await _http.request_completed
	var result := int(completed[0])
	var response_code := int(completed[1])
	var response_body: PackedByteArray = completed[3]

	var raw: String = response_body.get_string_from_utf8()
	var parsed: Variant = JSON.parse_string(raw)
	var ok := (result == HTTPRequest.RESULT_SUCCESS) and response_code >= 200 and response_code < 300

	return {
		"ok": ok,
		"result": result,
		"status": response_code,
		"data": parsed,
		"raw": raw,
	}

func _load_from_config() -> void:
	access_token = str(GameConfig.get_setting("auth", "access_token", ""))
	refresh_token = str(GameConfig.get_setting("auth", "refresh_token", ""))
	expires_at_unix = int(GameConfig.get_setting("auth", "expires_at_unix", 0))
	email = str(GameConfig.get_setting("auth", "email", ""))
	profile = GameConfig.get_setting("auth", "profile", {})
	auth_state_changed.emit(is_logged_in())
	profile_changed.emit(profile)

func _save_to_config() -> void:
	GameConfig.set_setting("auth", "access_token", access_token)
	GameConfig.set_setting("auth", "refresh_token", refresh_token)
	GameConfig.set_setting("auth", "expires_at_unix", expires_at_unix)
	GameConfig.set_setting("auth", "email", email)
	GameConfig.set_setting("auth", "profile", profile)
	GameConfig.save()
