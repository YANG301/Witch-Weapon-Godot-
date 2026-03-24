extends CanvasLayer

const TOGGLE_ACTION: StringName = &"debug_console_toggle"
const OVERLAY_HEIGHT_RATIO: float = 0.5
const OVERLAY_ALPHA: float = 0.56
const OVERLAY_BOTTOM_FADE_HEIGHT: float = 0.045
const PROMPT_TEXT: String = ">"
const STORY_SCENES_DIR: String = "res://scenes/story"

const SUPPORTED_LANGUAGE_CODES: Array[String] = [
	"zh", "tc", "en", "jp", "kr", "de", "es", "fr", "it", "pt", "ru", "th", "vi"
]

const ROOT_COMMANDS: Array[String] = ["help", "clear", "lang", "scene", "story", "config"]
const LANG_SUB_COMMANDS: Array[String] = ["list", "set", "cycle"]
const SCENE_SUB_COMMANDS: Array[String] = ["reload", "goto"]
const STORY_SUB_COMMANDS: Array[String] = ["goto"]
const CONFIG_SUB_COMMANDS: Array[String] = ["get", "set"]

const LANGUAGE_REFRESH_METHODS: Array[StringName] = [
	&"_refresh_localized_texts",
	&"refresh_localized_texts",
	&"_apply_localization",
	&"apply_localization",
	&"refresh_language"
]

const CONFIG_SET_ALLOWLIST: Dictionary = {
	"player.name": true,
	"audio.master_volume": true,
	"audio.music_volume": true,
	"audio.sfx_volume": true,
	"display.borderless": true,
	"display.screen": true,
	"display.resolution_x": true,
	"display.resolution_y": true,
	"language.current": true,
}

const CONSOLE_TEXT_TRANSLATIONS: Dictionary = {
	"jp": {
		"Debug console ready. Type help for commands.": "デバッグコンソールの準備ができました。help でコマンド一覧を表示します。",
		"Candidates:": "候補:",
		"Unknown command: %s (type help for commands)": "不明なコマンド: %s（help でコマンド一覧）",
		"Available commands:": "利用可能なコマンド:",
		"Usage: lang <list|set|cycle>": "使い方: lang <list|set|cycle>",
		"Supported languages:": "対応言語:",
		"Current language:": "現在の言語:",
		"Usage: lang set <code>": "使い方: lang set <code>",
		"Unsupported language code: %s": "未対応の言語コード: %s",
		"Language switched to %s (refreshed nodes: %d)": "言語を %s に切り替えました（更新ノード: %d）",
		"Unknown subcommand: lang %s": "不明なサブコマンド: lang %s",
		"Usage: scene <reload|goto>": "使い方: scene <reload|goto>",
		"No scene available to reload": "リロード可能なシーンがありません",
		"Current scene has no scene_file_path": "現在のシーンに scene_file_path がありません",
		"Reloading scene: %s": "シーンを再読み込み中: %s",
		"Usage: scene goto <res://...tscn>": "使い方: scene goto <res://...tscn>",
		"Scene path must start with res://": "シーンパスは res:// で始める必要があります",
		"Scene not found: %s": "シーンが見つかりません: %s",
		"Switching scene: %s": "シーン切替中: %s",
		"Unknown subcommand: scene %s": "不明なサブコマンド: scene %s",
		"Usage: story goto <chapter> <episode>": "使い方: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "不明なサブコマンド: story %s",
		"Story scene not found: chapter=%s episode=%s": "ストーリーシーンが見つかりません: chapter=%s episode=%s",
		"Story jump: %s": "ストーリーへジャンプ: %s",
		"Usage: config <get|set> <section.key> [value]": "使い方: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "キー形式が不正です。section.key 形式で入力してください",
		"Usage: config set <section.key> <value>": "使い方: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "このキーの設定は許可されていません: %s",
		"%s set to %s (refreshed nodes: %d)": "%s を %s に設定しました（更新ノード: %d）",
		"%s set to %s": "%s を %s に設定しました",
		"Unknown subcommand: config %s": "不明なサブコマンド: config %s"
	},
	"kr": {
		"Debug console ready. Type help for commands.": "디버그 콘솔이 준비되었습니다. help로 명령어를 확인하세요.",
		"Candidates:": "후보:",
		"Unknown command: %s (type help for commands)": "알 수 없는 명령어: %s (help로 명령어 확인)",
		"Available commands:": "사용 가능한 명령어:",
		"Usage: lang <list|set|cycle>": "사용법: lang <list|set|cycle>",
		"Supported languages:": "지원 언어:",
		"Current language:": "현재 언어:",
		"Usage: lang set <code>": "사용법: lang set <code>",
		"Unsupported language code: %s": "지원하지 않는 언어 코드: %s",
		"Language switched to %s (refreshed nodes: %d)": "언어가 %s(으)로 변경되었습니다 (새로고침 노드: %d)",
		"Unknown subcommand: lang %s": "알 수 없는 하위 명령어: lang %s",
		"Usage: scene <reload|goto>": "사용법: scene <reload|goto>",
		"No scene available to reload": "새로고침할 수 있는 씬이 없습니다",
		"Current scene has no scene_file_path": "현재 씬에 scene_file_path가 없습니다",
		"Reloading scene: %s": "씬 다시 불러오는 중: %s",
		"Usage: scene goto <res://...tscn>": "사용법: scene goto <res://...tscn>",
		"Scene path must start with res://": "씬 경로는 res://로 시작해야 합니다",
		"Scene not found: %s": "씬을 찾을 수 없습니다: %s",
		"Switching scene: %s": "씬 전환 중: %s",
		"Unknown subcommand: scene %s": "알 수 없는 하위 명령어: scene %s",
		"Usage: story goto <chapter> <episode>": "사용법: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "알 수 없는 하위 명령어: story %s",
		"Story scene not found: chapter=%s episode=%s": "스토리 씬을 찾을 수 없습니다: chapter=%s episode=%s",
		"Story jump: %s": "스토리 점프: %s",
		"Usage: config <get|set> <section.key> [value]": "사용법: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "키 형식 오류: section.key 형식이어야 합니다",
		"Usage: config set <section.key> <value>": "사용법: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "이 키는 설정할 수 없습니다: %s",
		"%s set to %s (refreshed nodes: %d)": "%s 값이 %s(으)로 설정되었습니다 (새로고침 노드: %d)",
		"%s set to %s": "%s 값이 %s(으)로 설정되었습니다",
		"Unknown subcommand: config %s": "알 수 없는 하위 명령어: config %s"
	},
	"de": {
		"Debug console ready. Type help for commands.": "Debug-Konsole bereit. Tippe help für Befehle.",
		"Candidates:": "Vorschläge:",
		"Unknown command: %s (type help for commands)": "Unbekannter Befehl: %s (help für Befehle)",
		"Available commands:": "Verfügbare Befehle:",
		"Usage: lang <list|set|cycle>": "Verwendung: lang <list|set|cycle>",
		"Supported languages:": "Unterstützte Sprachen:",
		"Current language:": "Aktuelle Sprache:",
		"Usage: lang set <code>": "Verwendung: lang set <code>",
		"Unsupported language code: %s": "Nicht unterstützter Sprachcode: %s",
		"Language switched to %s (refreshed nodes: %d)": "Sprache auf %s gewechselt (aktualisierte Knoten: %d)",
		"Unknown subcommand: lang %s": "Unbekannter Unterbefehl: lang %s",
		"Usage: scene <reload|goto>": "Verwendung: scene <reload|goto>",
		"No scene available to reload": "Keine Szene zum Neuladen verfügbar",
		"Current scene has no scene_file_path": "Aktuelle Szene hat keinen scene_file_path",
		"Reloading scene: %s": "Szene wird neu geladen: %s",
		"Usage: scene goto <res://...tscn>": "Verwendung: scene goto <res://...tscn>",
		"Scene path must start with res://": "Szenenpfad muss mit res:// beginnen",
		"Scene not found: %s": "Szene nicht gefunden: %s",
		"Switching scene: %s": "Wechsle Szene: %s",
		"Unknown subcommand: scene %s": "Unbekannter Unterbefehl: scene %s",
		"Usage: story goto <chapter> <episode>": "Verwendung: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Unbekannter Unterbefehl: story %s",
		"Story scene not found: chapter=%s episode=%s": "Story-Szene nicht gefunden: chapter=%s episode=%s",
		"Story jump: %s": "Story-Sprung: %s",
		"Usage: config <get|set> <section.key> [value]": "Verwendung: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Ungültiges Schlüsselformat, erwartet section.key",
		"Usage: config set <section.key> <value>": "Verwendung: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "Dieser Schlüssel darf nicht gesetzt werden: %s",
		"%s set to %s (refreshed nodes: %d)": "%s auf %s gesetzt (aktualisierte Knoten: %d)",
		"%s set to %s": "%s auf %s gesetzt",
		"Unknown subcommand: config %s": "Unbekannter Unterbefehl: config %s"
	},
	"es": {
		"Debug console ready. Type help for commands.": "Consola de depuración lista. Escribe help para ver comandos.",
		"Candidates:": "Candidatos:",
		"Unknown command: %s (type help for commands)": "Comando desconocido: %s (usa help para ver comandos)",
		"Available commands:": "Comandos disponibles:",
		"Usage: lang <list|set|cycle>": "Uso: lang <list|set|cycle>",
		"Supported languages:": "Idiomas compatibles:",
		"Current language:": "Idioma actual:",
		"Usage: lang set <code>": "Uso: lang set <code>",
		"Unsupported language code: %s": "Código de idioma no compatible: %s",
		"Language switched to %s (refreshed nodes: %d)": "Idioma cambiado a %s (nodos actualizados: %d)",
		"Unknown subcommand: lang %s": "Subcomando desconocido: lang %s",
		"Usage: scene <reload|goto>": "Uso: scene <reload|goto>",
		"No scene available to reload": "No hay escena disponible para recargar",
		"Current scene has no scene_file_path": "La escena actual no tiene scene_file_path",
		"Reloading scene: %s": "Recargando escena: %s",
		"Usage: scene goto <res://...tscn>": "Uso: scene goto <res://...tscn>",
		"Scene path must start with res://": "La ruta de escena debe comenzar con res://",
		"Scene not found: %s": "Escena no encontrada: %s",
		"Switching scene: %s": "Cambiando escena: %s",
		"Unknown subcommand: scene %s": "Subcomando desconocido: scene %s",
		"Usage: story goto <chapter> <episode>": "Uso: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Subcomando desconocido: story %s",
		"Story scene not found: chapter=%s episode=%s": "Escena de historia no encontrada: chapter=%s episode=%s",
		"Story jump: %s": "Salto de historia: %s",
		"Usage: config <get|set> <section.key> [value]": "Uso: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Formato de clave no válido, se espera section.key",
		"Usage: config set <section.key> <value>": "Uso: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "No se permite configurar esta clave: %s",
		"%s set to %s (refreshed nodes: %d)": "%s establecido en %s (nodos actualizados: %d)",
		"%s set to %s": "%s establecido en %s",
		"Unknown subcommand: config %s": "Subcomando desconocido: config %s"
	},
	"fr": {
		"Debug console ready. Type help for commands.": "Console de débogage prête. Tapez help pour voir les commandes.",
		"Candidates:": "Suggestions :",
		"Unknown command: %s (type help for commands)": "Commande inconnue : %s (tapez help pour les commandes)",
		"Available commands:": "Commandes disponibles :",
		"Usage: lang <list|set|cycle>": "Utilisation : lang <list|set|cycle>",
		"Supported languages:": "Langues prises en charge :",
		"Current language:": "Langue actuelle :",
		"Usage: lang set <code>": "Utilisation : lang set <code>",
		"Unsupported language code: %s": "Code langue non pris en charge : %s",
		"Language switched to %s (refreshed nodes: %d)": "Langue changée en %s (nœuds actualisés : %d)",
		"Unknown subcommand: lang %s": "Sous-commande inconnue : lang %s",
		"Usage: scene <reload|goto>": "Utilisation : scene <reload|goto>",
		"No scene available to reload": "Aucune scène disponible à recharger",
		"Current scene has no scene_file_path": "La scène actuelle n'a pas de scene_file_path",
		"Reloading scene: %s": "Rechargement de la scène : %s",
		"Usage: scene goto <res://...tscn>": "Utilisation : scene goto <res://...tscn>",
		"Scene path must start with res://": "Le chemin de scène doit commencer par res://",
		"Scene not found: %s": "Scène introuvable : %s",
		"Switching scene: %s": "Changement de scène : %s",
		"Unknown subcommand: scene %s": "Sous-commande inconnue : scene %s",
		"Usage: story goto <chapter> <episode>": "Utilisation : story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Sous-commande inconnue : story %s",
		"Story scene not found: chapter=%s episode=%s": "Scène d'histoire introuvable : chapter=%s episode=%s",
		"Story jump: %s": "Saut d'histoire : %s",
		"Usage: config <get|set> <section.key> [value]": "Utilisation : config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Format de clé invalide, section.key attendu",
		"Usage: config set <section.key> <value>": "Utilisation : config set <section.key> <value>",
		"Setting this key is not allowed: %s": "Cette clé ne peut pas être modifiée : %s",
		"%s set to %s (refreshed nodes: %d)": "%s défini sur %s (nœuds actualisés : %d)",
		"%s set to %s": "%s défini sur %s",
		"Unknown subcommand: config %s": "Sous-commande inconnue : config %s"
	},
	"it": {
		"Debug console ready. Type help for commands.": "Console di debug pronta. Digita help per i comandi.",
		"Candidates:": "Candidati:",
		"Unknown command: %s (type help for commands)": "Comando sconosciuto: %s (digita help per i comandi)",
		"Available commands:": "Comandi disponibili:",
		"Usage: lang <list|set|cycle>": "Uso: lang <list|set|cycle>",
		"Supported languages:": "Lingue supportate:",
		"Current language:": "Lingua corrente:",
		"Usage: lang set <code>": "Uso: lang set <code>",
		"Unsupported language code: %s": "Codice lingua non supportato: %s",
		"Language switched to %s (refreshed nodes: %d)": "Lingua cambiata in %s (nodi aggiornati: %d)",
		"Unknown subcommand: lang %s": "Sottocomando sconosciuto: lang %s",
		"Usage: scene <reload|goto>": "Uso: scene <reload|goto>",
		"No scene available to reload": "Nessuna scena disponibile da ricaricare",
		"Current scene has no scene_file_path": "La scena corrente non ha scene_file_path",
		"Reloading scene: %s": "Ricaricamento scena: %s",
		"Usage: scene goto <res://...tscn>": "Uso: scene goto <res://...tscn>",
		"Scene path must start with res://": "Il percorso scena deve iniziare con res://",
		"Scene not found: %s": "Scena non trovata: %s",
		"Switching scene: %s": "Cambio scena: %s",
		"Unknown subcommand: scene %s": "Sottocomando sconosciuto: scene %s",
		"Usage: story goto <chapter> <episode>": "Uso: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Sottocomando sconosciuto: story %s",
		"Story scene not found: chapter=%s episode=%s": "Scena storia non trovata: chapter=%s episode=%s",
		"Story jump: %s": "Salto storia: %s",
		"Usage: config <get|set> <section.key> [value]": "Uso: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Formato chiave non valido, atteso section.key",
		"Usage: config set <section.key> <value>": "Uso: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "Questa chiave non può essere modificata: %s",
		"%s set to %s (refreshed nodes: %d)": "%s impostato su %s (nodi aggiornati: %d)",
		"%s set to %s": "%s impostato su %s",
		"Unknown subcommand: config %s": "Sottocomando sconosciuto: config %s"
	},
	"pt": {
		"Debug console ready. Type help for commands.": "Console de depuração pronta. Digite help para ver os comandos.",
		"Candidates:": "Sugestões:",
		"Unknown command: %s (type help for commands)": "Comando desconhecido: %s (digite help para comandos)",
		"Available commands:": "Comandos disponíveis:",
		"Usage: lang <list|set|cycle>": "Uso: lang <list|set|cycle>",
		"Supported languages:": "Idiomas suportados:",
		"Current language:": "Idioma atual:",
		"Usage: lang set <code>": "Uso: lang set <code>",
		"Unsupported language code: %s": "Código de idioma não suportado: %s",
		"Language switched to %s (refreshed nodes: %d)": "Idioma alterado para %s (nós atualizados: %d)",
		"Unknown subcommand: lang %s": "Subcomando desconhecido: lang %s",
		"Usage: scene <reload|goto>": "Uso: scene <reload|goto>",
		"No scene available to reload": "Nenhuma cena disponível para recarregar",
		"Current scene has no scene_file_path": "A cena atual não possui scene_file_path",
		"Reloading scene: %s": "Recarregando cena: %s",
		"Usage: scene goto <res://...tscn>": "Uso: scene goto <res://...tscn>",
		"Scene path must start with res://": "O caminho da cena deve começar com res://",
		"Scene not found: %s": "Cena não encontrada: %s",
		"Switching scene: %s": "Trocando cena: %s",
		"Unknown subcommand: scene %s": "Subcomando desconhecido: scene %s",
		"Usage: story goto <chapter> <episode>": "Uso: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Subcomando desconhecido: story %s",
		"Story scene not found: chapter=%s episode=%s": "Cena de história não encontrada: chapter=%s episode=%s",
		"Story jump: %s": "Salto de história: %s",
		"Usage: config <get|set> <section.key> [value]": "Uso: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Formato de chave inválido, esperado section.key",
		"Usage: config set <section.key> <value>": "Uso: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "Não é permitido alterar esta chave: %s",
		"%s set to %s (refreshed nodes: %d)": "%s definido para %s (nós atualizados: %d)",
		"%s set to %s": "%s definido para %s",
		"Unknown subcommand: config %s": "Subcomando desconhecido: config %s"
	},
	"ru": {
		"Debug console ready. Type help for commands.": "Консоль отладки готова. Введите help для списка команд.",
		"Candidates:": "Варианты:",
		"Unknown command: %s (type help for commands)": "Неизвестная команда: %s (введите help для списка команд)",
		"Available commands:": "Доступные команды:",
		"Usage: lang <list|set|cycle>": "Использование: lang <list|set|cycle>",
		"Supported languages:": "Поддерживаемые языки:",
		"Current language:": "Текущий язык:",
		"Usage: lang set <code>": "Использование: lang set <code>",
		"Unsupported language code: %s": "Неподдерживаемый код языка: %s",
		"Language switched to %s (refreshed nodes: %d)": "Язык переключен на %s (обновлено узлов: %d)",
		"Unknown subcommand: lang %s": "Неизвестная подкоманда: lang %s",
		"Usage: scene <reload|goto>": "Использование: scene <reload|goto>",
		"No scene available to reload": "Нет сцены для перезагрузки",
		"Current scene has no scene_file_path": "У текущей сцены нет scene_file_path",
		"Reloading scene: %s": "Перезагрузка сцены: %s",
		"Usage: scene goto <res://...tscn>": "Использование: scene goto <res://...tscn>",
		"Scene path must start with res://": "Путь сцены должен начинаться с res://",
		"Scene not found: %s": "Сцена не найдена: %s",
		"Switching scene: %s": "Переключение сцены: %s",
		"Unknown subcommand: scene %s": "Неизвестная подкоманда: scene %s",
		"Usage: story goto <chapter> <episode>": "Использование: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Неизвестная подкоманда: story %s",
		"Story scene not found: chapter=%s episode=%s": "Сцена истории не найдена: chapter=%s episode=%s",
		"Story jump: %s": "Переход к истории: %s",
		"Usage: config <get|set> <section.key> [value]": "Использование: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Неверный формат ключа, ожидается section.key",
		"Usage: config set <section.key> <value>": "Использование: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "Изменение этого ключа запрещено: %s",
		"%s set to %s (refreshed nodes: %d)": "%s установлен в %s (обновлено узлов: %d)",
		"%s set to %s": "%s установлен в %s",
		"Unknown subcommand: config %s": "Неизвестная подкоманда: config %s"
	},
	"th": {
		"Debug console ready. Type help for commands.": "คอนโซลดีบักพร้อมใช้งาน พิมพ์ help เพื่อดูคำสั่ง",
		"Candidates:": "ตัวเลือก:",
		"Unknown command: %s (type help for commands)": "ไม่รู้จักคำสั่ง: %s (พิมพ์ help เพื่อดูคำสั่ง)",
		"Available commands:": "คำสั่งที่ใช้ได้:",
		"Usage: lang <list|set|cycle>": "วิธีใช้: lang <list|set|cycle>",
		"Supported languages:": "ภาษาที่รองรับ:",
		"Current language:": "ภาษาปัจจุบัน:",
		"Usage: lang set <code>": "วิธีใช้: lang set <code>",
		"Unsupported language code: %s": "ไม่รองรับรหัสภาษา: %s",
		"Language switched to %s (refreshed nodes: %d)": "เปลี่ยนภาษาเป็น %s แล้ว (รีเฟรชโหนด: %d)",
		"Unknown subcommand: lang %s": "ไม่รู้จักคำสั่งย่อย: lang %s",
		"Usage: scene <reload|goto>": "วิธีใช้: scene <reload|goto>",
		"No scene available to reload": "ไม่มีฉากให้รีโหลด",
		"Current scene has no scene_file_path": "ฉากปัจจุบันไม่มี scene_file_path",
		"Reloading scene: %s": "กำลังรีโหลดฉาก: %s",
		"Usage: scene goto <res://...tscn>": "วิธีใช้: scene goto <res://...tscn>",
		"Scene path must start with res://": "พาธฉากต้องขึ้นต้นด้วย res://",
		"Scene not found: %s": "ไม่พบฉาก: %s",
		"Switching scene: %s": "กำลังสลับฉาก: %s",
		"Unknown subcommand: scene %s": "ไม่รู้จักคำสั่งย่อย: scene %s",
		"Usage: story goto <chapter> <episode>": "วิธีใช้: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "ไม่รู้จักคำสั่งย่อย: story %s",
		"Story scene not found: chapter=%s episode=%s": "ไม่พบฉากเนื้อเรื่อง: chapter=%s episode=%s",
		"Story jump: %s": "กระโดดไปเนื้อเรื่อง: %s",
		"Usage: config <get|set> <section.key> [value]": "วิธีใช้: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "รูปแบบคีย์ไม่ถูกต้อง ควรเป็น section.key",
		"Usage: config set <section.key> <value>": "วิธีใช้: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "ไม่อนุญาตให้ตั้งค่าคีย์นี้: %s",
		"%s set to %s (refreshed nodes: %d)": "ตั้งค่า %s เป็น %s แล้ว (รีเฟรชโหนด: %d)",
		"%s set to %s": "ตั้งค่า %s เป็น %s แล้ว",
		"Unknown subcommand: config %s": "ไม่รู้จักคำสั่งย่อย: config %s"
	},
	"vi": {
		"Debug console ready. Type help for commands.": "Bảng điều khiển debug đã sẵn sàng. Gõ help để xem lệnh.",
		"Candidates:": "Gợi ý:",
		"Unknown command: %s (type help for commands)": "Lệnh không hợp lệ: %s (gõ help để xem lệnh)",
		"Available commands:": "Các lệnh khả dụng:",
		"Usage: lang <list|set|cycle>": "Cách dùng: lang <list|set|cycle>",
		"Supported languages:": "Ngôn ngữ hỗ trợ:",
		"Current language:": "Ngôn ngữ hiện tại:",
		"Usage: lang set <code>": "Cách dùng: lang set <code>",
		"Unsupported language code: %s": "Mã ngôn ngữ không hỗ trợ: %s",
		"Language switched to %s (refreshed nodes: %d)": "Đã chuyển ngôn ngữ sang %s (nút làm mới: %d)",
		"Unknown subcommand: lang %s": "Lệnh con không hợp lệ: lang %s",
		"Usage: scene <reload|goto>": "Cách dùng: scene <reload|goto>",
		"No scene available to reload": "Không có scene để tải lại",
		"Current scene has no scene_file_path": "Scene hiện tại không có scene_file_path",
		"Reloading scene: %s": "Đang tải lại scene: %s",
		"Usage: scene goto <res://...tscn>": "Cách dùng: scene goto <res://...tscn>",
		"Scene path must start with res://": "Đường dẫn scene phải bắt đầu bằng res://",
		"Scene not found: %s": "Không tìm thấy scene: %s",
		"Switching scene: %s": "Đang chuyển scene: %s",
		"Unknown subcommand: scene %s": "Lệnh con không hợp lệ: scene %s",
		"Usage: story goto <chapter> <episode>": "Cách dùng: story goto <chapter> <episode>",
		"Unknown subcommand: story %s": "Lệnh con không hợp lệ: story %s",
		"Story scene not found: chapter=%s episode=%s": "Không tìm thấy scene truyện: chapter=%s episode=%s",
		"Story jump: %s": "Nhảy tới truyện: %s",
		"Usage: config <get|set> <section.key> [value]": "Cách dùng: config <get|set> <section.key> [value]",
		"Invalid key format, expected section.key": "Định dạng khóa không hợp lệ, cần section.key",
		"Usage: config set <section.key> <value>": "Cách dùng: config set <section.key> <value>",
		"Setting this key is not allowed: %s": "Không được phép đặt khóa này: %s",
		"%s set to %s (refreshed nodes: %d)": "%s đã đặt thành %s (nút làm mới: %d)",
		"%s set to %s": "%s đã đặt thành %s",
		"Unknown subcommand: config %s": "Lệnh con không hợp lệ: config %s"
	}
}

@onready var root: Control = $Root
@onready var top_gradient: ColorRect = $Root/TopGradient
@onready var margin_container: MarginContainer = $Root/Margin
@onready var output_label: RichTextLabel = $Root/Margin/VBox/Output
@onready var prompt_label: Label = $Root/Margin/VBox/InputRow/Prompt
@onready var input_line: LineEdit = $Root/Margin/VBox/InputRow/Input
@onready var hint_label: Label = $Root/Margin/VBox/Hint

var _is_open: bool = false
var _history: Array[String] = []
var _history_index: int = 0
var _mono_font: Font = null
var _scene_path_cache: Array[String] = []
var _story_chapter_cache: Array[String] = []
var _story_episode_cache: Dictionary = {}
var _last_console_language: String = "en"

func _ready() -> void:
	_ensure_toggle_action()
	_configure_layout()
	_setup_visual_style()
	_apply_monospace_font()
	_setup_input_style()
	input_line.text_submitted.connect(_on_input_submitted)
	input_line.focus_exited.connect(_on_input_focus_exited)
	_last_console_language = _console_language()
	_set_console_visible(false)
	_append_info(_tr(
		"调试控制台已就绪。输入 help 查看命令。",
		"除錯主控台已就緒。輸入 help 查看命令。",
		"Debug console ready. Type help for commands."
	))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(TOGGLE_ACTION):
		_set_console_visible(not _is_open)
		get_viewport().set_input_as_handled()
		return

	if not _is_open:
		return

	if event is InputEventKey:
		var key_event: InputEventKey = event as InputEventKey
		if not key_event.pressed or key_event.echo:
			return

		if key_event.keycode == KEY_ESCAPE:
			_set_console_visible(false)
			get_viewport().set_input_as_handled()
			return

		if key_event.keycode == KEY_UP:
			_navigate_history(-1)
			get_viewport().set_input_as_handled()
			return

		if key_event.keycode == KEY_DOWN:
			_navigate_history(1)
			get_viewport().set_input_as_handled()
			return

		if key_event.keycode == KEY_TAB:
			_handle_tab_completion()
			get_viewport().set_input_as_handled()
			return

func _unhandled_input(_event: InputEvent) -> void:
	if _is_open:
		get_viewport().set_input_as_handled()

func _ensure_toggle_action() -> void:
	if not InputMap.has_action(TOGGLE_ACTION):
		InputMap.add_action(TOGGLE_ACTION)

	var has_toggle_key: bool = false
	var action_events: Array[InputEvent] = InputMap.action_get_events(TOGGLE_ACTION)
	for action_event in action_events:
		if action_event is InputEventKey:
			var key_event: InputEventKey = action_event as InputEventKey
			if key_event.keycode == KEY_QUOTELEFT or key_event.physical_keycode == KEY_QUOTELEFT:
				has_toggle_key = true
				break

	if not has_toggle_key:
		var toggle_key_event: InputEventKey = InputEventKey.new()
		toggle_key_event.keycode = KEY_QUOTELEFT
		toggle_key_event.physical_keycode = KEY_QUOTELEFT
		InputMap.action_add_event(TOGGLE_ACTION, toggle_key_event)

func _configure_layout() -> void:
	top_gradient.anchor_left = 0.0
	top_gradient.anchor_top = 0.0
	top_gradient.anchor_right = 1.0
	top_gradient.anchor_bottom = 1.0
	margin_container.anchor_bottom = OVERLAY_HEIGHT_RATIO

func _setup_visual_style() -> void:
	var overlay_shader: Shader = Shader.new()
	overlay_shader.code = """
shader_type canvas_item;

uniform float panel_height = 0.5;
uniform float panel_alpha = 0.56;
uniform float bottom_fade = 0.045;

void fragment() {
	vec2 uv = UV;
	float in_panel = 1.0 - step(panel_height, uv.y);
	float fade_to_bottom = 1.0 - clamp((uv.y - panel_height) / max(bottom_fade, 0.0001), 0.0, 1.0);
	float alpha_mask = max(in_panel, fade_to_bottom);

	float alpha = panel_alpha * alpha_mask;
	COLOR = vec4(0.0, 0.0, 0.0, alpha);
}
"""

	var overlay_material: ShaderMaterial = ShaderMaterial.new()
	overlay_material.shader = overlay_shader
	overlay_material.set_shader_parameter("panel_height", OVERLAY_HEIGHT_RATIO)
	overlay_material.set_shader_parameter("panel_alpha", OVERLAY_ALPHA)
	overlay_material.set_shader_parameter("bottom_fade", OVERLAY_BOTTOM_FADE_HEIGHT)
	top_gradient.material = overlay_material

	prompt_label.text = PROMPT_TEXT
	prompt_label.modulate = Color(0.95, 0.95, 0.95, 1.0)
	hint_label.text = ""
	hint_label.visible = false

func _apply_monospace_font() -> void:
	var mono_font: SystemFont = SystemFont.new()
	mono_font.font_names = PackedStringArray([
		"Consolas",
		"Cascadia Mono",
		"Courier New",
		"Noto Sans Mono CJK SC",
		"Noto Sans Mono CJK TC",
		"Source Code Pro",
		"Monospace"
	])
	_mono_font = mono_font

	output_label.add_theme_font_override("normal_font", _mono_font)
	output_label.add_theme_font_size_override("normal_font_size", 18)
	output_label.add_theme_color_override("default_color", Color(0.95, 0.95, 0.95, 1.0))

	input_line.add_theme_font_override("font", _mono_font)
	input_line.add_theme_font_size_override("font_size", 19)
	input_line.add_theme_color_override("font_color", Color(0.96, 0.96, 0.96, 1.0))
	input_line.add_theme_color_override("font_placeholder_color", Color(0.0, 0.0, 0.0, 0.0))

	prompt_label.add_theme_font_override("font", _mono_font)
	prompt_label.add_theme_font_size_override("font_size", 20)

func _setup_input_style() -> void:
	input_line.placeholder_text = ""
	input_line.clear_button_enabled = false

	var transparent_style: StyleBoxFlat = StyleBoxFlat.new()
	transparent_style.bg_color = Color(0, 0, 0, 0)
	transparent_style.draw_center = true
	transparent_style.border_width_left = 0
	transparent_style.border_width_top = 0
	transparent_style.border_width_right = 0
	transparent_style.border_width_bottom = 0
	transparent_style.content_margin_left = 0
	transparent_style.content_margin_top = 0
	transparent_style.content_margin_right = 0
	transparent_style.content_margin_bottom = 0

	input_line.add_theme_stylebox_override("normal", transparent_style)
	input_line.add_theme_stylebox_override("focus", transparent_style)
	input_line.add_theme_stylebox_override("read_only", transparent_style)

func _set_console_visible(opened: bool) -> void:
	_is_open = opened
	root.visible = opened
	root.mouse_filter = Control.MOUSE_FILTER_STOP if opened else Control.MOUSE_FILTER_IGNORE

	if opened:
		_history_index = _history.size()
		var current_console_language: String = _console_language()
		if current_console_language != _last_console_language:
			_last_console_language = current_console_language
			_on_console_language_changed()
		_refocus_input_line(true)
	else:
		input_line.release_focus()

func _process(_delta: float) -> void:
	var current_console_language: String = _console_language()
	if current_console_language != _last_console_language:
		_last_console_language = current_console_language
		_on_console_language_changed()

	if _is_open and root.visible and not input_line.has_focus():
		_refocus_input_line(false)

func _on_input_focus_exited() -> void:
	if _is_open and root.visible:
		call_deferred("_refocus_input_line", false)

func _refocus_input_line(select_all: bool = false) -> void:
	if not _is_open or not root.visible:
		return
	input_line.grab_focus()
	if select_all:
		input_line.select_all()
	else:
		input_line.caret_column = input_line.text.length()

func _on_console_language_changed() -> void:
	if not _is_open:
		return
	output_label.clear()
	_handle_help(false)
	_refocus_input_line(false)

func _on_input_submitted(command_text: String) -> void:
	var trimmed: String = command_text.strip_edges()
	input_line.text = ""

	if trimmed.is_empty():
		input_line.grab_focus()
		return

	_append_command(trimmed)

	if _history.is_empty() or _history[_history.size() - 1] != trimmed:
		_history.append(trimmed)
	_history_index = _history.size()

	_execute_command(trimmed)
	input_line.grab_focus()

func _navigate_history(step: int) -> void:
	if _history.is_empty():
		return

	_history_index = clampi(_history_index + step, 0, _history.size())
	if _history_index >= _history.size():
		input_line.text = ""
	else:
		input_line.text = _history[_history_index]
	input_line.caret_column = input_line.text.length()

func _handle_tab_completion() -> void:
	var full_text: String = input_line.text
	var caret: int = input_line.caret_column
	var before: String = full_text.substr(0, caret)
	var after: String = full_text.substr(caret)
	var ends_with_space: bool = before.ends_with(" ")

	var tokens: Array[String] = _tokenize_command(before)
	var current_token: String = ""
	if not ends_with_space and not tokens.is_empty():
		current_token = tokens[tokens.size() - 1]

	var options: Array[String] = _get_completion_options(tokens, ends_with_space)
	if options.is_empty():
		return
	options.sort()

	if options.size() == 1:
		_apply_completion(before, after, ends_with_space, options[0], true)
		return

	var common_prefix: String = _longest_common_prefix(options)
	if not common_prefix.is_empty() and common_prefix.length() > current_token.length():
		_apply_completion(before, after, ends_with_space, common_prefix, false)
		return

	_append_plain("%s %s" % [_tr("候选:", "候選:", "Candidates:"), ", ".join(PackedStringArray(options))])

func _apply_completion(before: String, after: String, ends_with_space: bool, completion_text: String, append_space: bool) -> void:
	var new_before: String = before
	if ends_with_space:
		new_before = before + completion_text
	else:
		var replace_start: int = before.length()
		while replace_start > 0:
			var prev_char: String = before.substr(replace_start - 1, 1)
			if prev_char == " ":
				break
			replace_start -= 1
		new_before = before.substr(0, replace_start) + completion_text

	if append_space:
		new_before += " "

	input_line.text = new_before + after
	input_line.caret_column = new_before.length()

func _get_completion_options(tokens: Array[String], ends_with_space: bool) -> Array[String]:
	if tokens.is_empty():
		return ROOT_COMMANDS.duplicate()

	if tokens.size() == 1 and not ends_with_space:
		return _filter_by_prefix(ROOT_COMMANDS, tokens[0])

	var root_command: String = tokens[0].to_lower()
	match root_command:
		"lang":
			return _get_lang_completions(tokens, ends_with_space)
		"scene":
			return _get_scene_completions(tokens, ends_with_space)
		"story":
			return _get_story_completions(tokens, ends_with_space)
		"config":
			return _get_config_completions(tokens, ends_with_space)
		_:
			if tokens.size() == 1 and ends_with_space:
				return ROOT_COMMANDS.duplicate()
			return []

func _get_lang_completions(tokens: Array[String], ends_with_space: bool) -> Array[String]:
	if tokens.size() == 1 and ends_with_space:
		return LANG_SUB_COMMANDS.duplicate()
	if tokens.size() == 2 and not ends_with_space:
		return _filter_by_prefix(LANG_SUB_COMMANDS, tokens[1])

	if tokens.size() >= 2 and tokens[1].to_lower() == "set":
		if tokens.size() == 2 and ends_with_space:
			return SUPPORTED_LANGUAGE_CODES.duplicate()
		if tokens.size() == 3 and not ends_with_space:
			return _filter_by_prefix(SUPPORTED_LANGUAGE_CODES, tokens[2])

	return []

func _get_scene_completions(tokens: Array[String], ends_with_space: bool) -> Array[String]:
	if tokens.size() == 1 and ends_with_space:
		return SCENE_SUB_COMMANDS.duplicate()
	if tokens.size() == 2 and not ends_with_space:
		return _filter_by_prefix(SCENE_SUB_COMMANDS, tokens[1])

	if tokens.size() >= 2 and tokens[1].to_lower() == "goto":
		if tokens.size() == 2 and ends_with_space:
			return _list_scene_paths()
		if tokens.size() == 3 and not ends_with_space:
			return _filter_by_prefix(_list_scene_paths(), tokens[2])

	return []

func _get_story_completions(tokens: Array[String], ends_with_space: bool) -> Array[String]:
	if tokens.size() == 1 and ends_with_space:
		return STORY_SUB_COMMANDS.duplicate()
	if tokens.size() == 2 and not ends_with_space:
		return _filter_by_prefix(STORY_SUB_COMMANDS, tokens[1])

	if tokens.size() >= 2 and tokens[1].to_lower() == "goto":
		if tokens.size() == 2 and ends_with_space:
			return _list_story_chapters()
		if tokens.size() == 3 and not ends_with_space:
			return _filter_by_prefix(_list_story_chapters(), tokens[2])
		if tokens.size() == 3 and ends_with_space:
			return _list_story_episode_tokens(tokens[2])
		if tokens.size() == 4 and not ends_with_space:
			return _filter_by_prefix(_list_story_episode_tokens(tokens[2]), tokens[3])

	return []

func _get_config_completions(tokens: Array[String], ends_with_space: bool) -> Array[String]:
	if tokens.size() == 1 and ends_with_space:
		return CONFIG_SUB_COMMANDS.duplicate()
	if tokens.size() == 2 and not ends_with_space:
		return _filter_by_prefix(CONFIG_SUB_COMMANDS, tokens[1])

	var keys: Array[String] = _get_config_key_candidates()
	if tokens.size() == 2 and ends_with_space:
		return keys
	if tokens.size() == 3 and not ends_with_space:
		return _filter_by_prefix(keys, tokens[2])

	if tokens.size() == 4 and not ends_with_space and tokens[1].to_lower() == "set":
		var key_name: String = tokens[2]
		if key_name == "display.borderless":
			var bool_candidates: Array[String] = ["true", "false"]
			return _filter_by_prefix(bool_candidates, tokens[3])

	return []

func _filter_by_prefix(candidates: Array[String], prefix: String) -> Array[String]:
	var normalized_prefix: String = prefix.to_lower()
	var result: Array[String] = []
	for candidate in candidates:
		if candidate.to_lower().begins_with(normalized_prefix):
			result.append(candidate)
	return result

func _longest_common_prefix(values: Array[String]) -> String:
	if values.is_empty():
		return ""

	var prefix: String = values[0]
	for i in range(1, values.size()):
		var value: String = values[i]
		while not value.begins_with(prefix) and not prefix.is_empty():
			prefix = prefix.substr(0, prefix.length() - 1)
		if prefix.is_empty():
			break
	return prefix

func _list_scene_paths() -> Array[String]:
	if not _scene_path_cache.is_empty():
		return _scene_path_cache.duplicate()

	var collected: Array[String] = []
	_collect_scene_paths("res://scenes", collected)
	collected.sort()
	_scene_path_cache = collected
	return _scene_path_cache.duplicate()

func _collect_scene_paths(dir_path: String, out_paths: Array[String]) -> void:
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		return

	dir.list_dir_begin()
	var entry_name: String = dir.get_next()
	while not entry_name.is_empty():
		if entry_name != "." and entry_name != "..":
			var child_path: String = dir_path + "/" + entry_name
			if dir.current_is_dir():
				_collect_scene_paths(child_path, out_paths)
			elif entry_name.to_lower().ends_with(".tscn"):
				out_paths.append(child_path)
		entry_name = dir.get_next()
	dir.list_dir_end()

func _list_story_chapters() -> Array[String]:
	if not _story_chapter_cache.is_empty():
		return _story_chapter_cache.duplicate()

	var chapters: Array[String] = []
	var dir: DirAccess = DirAccess.open(STORY_SCENES_DIR)
	if dir == null:
		return chapters

	dir.list_dir_begin()
	var entry_name: String = dir.get_next()
	while not entry_name.is_empty():
		if entry_name != "." and entry_name != ".." and dir.current_is_dir():
			chapters.append(entry_name.to_lower())
		entry_name = dir.get_next()
	dir.list_dir_end()

	chapters.sort()
	_story_chapter_cache = chapters
	return _story_chapter_cache.duplicate()

func _list_story_episode_tokens(chapter: String) -> Array[String]:
	var normalized_chapter: String = chapter.strip_edges().to_lower()
	if normalized_chapter.is_empty():
		return []

	if _story_episode_cache.has(normalized_chapter):
		var cached_any: Variant = _story_episode_cache.get(normalized_chapter, null)
		if cached_any is Array:
			var cached_untyped: Array = cached_any
			var cached: Array[String] = []
			for entry in cached_untyped:
				cached.append(str(entry))
			return cached

	var tokens: Array[String] = []
	var chapter_dir: String = "%s/%s" % [STORY_SCENES_DIR, normalized_chapter]
	var dir: DirAccess = DirAccess.open(chapter_dir)
	if dir == null:
		return tokens

	var prefix: String = normalized_chapter + "_"
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while not file_name.is_empty():
		if not dir.current_is_dir() and file_name.to_lower().ends_with(".tscn") and file_name.to_lower().begins_with(prefix):
			var stem: String = file_name.get_basename().to_lower()
			var suffix: String = stem.substr(prefix.length())
			if not suffix.is_empty() and not tokens.has(suffix):
				tokens.append(suffix)
		file_name = dir.get_next()
	dir.list_dir_end()

	tokens.sort()
	_story_episode_cache[normalized_chapter] = tokens.duplicate()
	return tokens

func _get_config_key_candidates() -> Array[String]:
	var keys: Array[String] = []
	for key_any in CONFIG_SET_ALLOWLIST.keys():
		var key_name: String = str(key_any)
		if not keys.has(key_name):
			keys.append(key_name)
	keys.sort()
	return keys

func _execute_command(command_line: String) -> void:
	var tokens: Array[String] = _tokenize_command(command_line)
	if tokens.is_empty():
		return

	var root_command: String = tokens[0].to_lower()
	match root_command:
		"help":
			_handle_help()
		"clear":
			output_label.clear()
		"lang":
			_handle_lang(tokens)
		"scene":
			_handle_scene(tokens)
		"story":
			_handle_story(tokens)
		"config":
			_handle_config(tokens)
		_:
			_append_error(_tr(
				"未知命令: %s（输入 help 查看命令）",
				"未知命令: %s（輸入 help 查看命令）",
				"Unknown command: %s (type help for commands)"
			) % root_command)

func _handle_help(show_info_header: bool = true) -> void:
	var help_header: String = _tr("可用命令:", "可用命令:", "Available commands:")
	if show_info_header:
		_append_info(help_header)
	else:
		_append_plain(help_header)
	_append_plain("  help")
	_append_plain("  clear")
	_append_plain("  lang list")
	_append_plain("  lang set <zh|tc|en|jp|kr|de|es|fr|it|pt|ru|th|vi>")
	_append_plain("  lang cycle")
	_append_plain("  scene reload")
	_append_plain("  scene goto <res://...tscn>")
	_append_plain("  story goto <chapter> <episode>")
	_append_plain("  config get <section.key>")
	_append_plain("  config set <section.key> <value>")

func _handle_lang(tokens: Array[String]) -> void:
	if tokens.size() < 2:
		_append_error(_tr("用法: lang <list|set|cycle>", "用法: lang <list|set|cycle>", "Usage: lang <list|set|cycle>"))
		return

	var sub_command: String = tokens[1].to_lower()
	match sub_command:
		"list":
			_append_plain(_tr("支持语言:", "支援語言:", "Supported languages:") + " " + ", ".join(PackedStringArray(SUPPORTED_LANGUAGE_CODES)))
			_append_plain(_tr("当前语言:", "目前語言:", "Current language:") + " " + GameConfig.current_language)
		"set":
			if tokens.size() < 3:
				_append_error(_tr("用法: lang set <code>", "用法: lang set <code>", "Usage: lang set <code>"))
				return
			var target_code: String = _normalize_language_code(tokens[2])
			if not SUPPORTED_LANGUAGE_CODES.has(target_code):
				_append_error(_tr("不支持的语言代码: %s", "不支援的語言代碼: %s", "Unsupported language code: %s") % tokens[2])
				return
			GameConfig.current_language = target_code
			GameConfig.save()
			var refreshed_count: int = _refresh_language_in_current_scene()
			_append_info(_tr("语言已切换到 %s（刷新节点: %d）", "語言已切換至 %s（刷新節點: %d）", "Language switched to %s (refreshed nodes: %d)") % [target_code, refreshed_count])
		"cycle":
			var current_code: String = _normalize_language_code(GameConfig.current_language)
			var current_index: int = SUPPORTED_LANGUAGE_CODES.find(current_code)
			if current_index < 0:
				current_index = 0
			var next_code: String = SUPPORTED_LANGUAGE_CODES[(current_index + 1) % SUPPORTED_LANGUAGE_CODES.size()]
			GameConfig.current_language = next_code
			GameConfig.save()
			var refreshed_count_cycle: int = _refresh_language_in_current_scene()
			_append_info(_tr("语言已切换到 %s（刷新节点: %d）", "語言已切換至 %s（刷新節點: %d）", "Language switched to %s (refreshed nodes: %d)") % [next_code, refreshed_count_cycle])
		_:
			_append_error(_tr("未知子命令: lang %s", "未知子命令: lang %s", "Unknown subcommand: lang %s") % sub_command)

func _handle_scene(tokens: Array[String]) -> void:
	if tokens.size() < 2:
		_append_error(_tr("用法: scene <reload|goto>", "用法: scene <reload|goto>", "Usage: scene <reload|goto>"))
		return

	var sub_command: String = tokens[1].to_lower()
	match sub_command:
		"reload":
			var current_scene: Node = get_tree().current_scene
			if current_scene == null:
				_append_error(_tr("当前没有场景可重载", "目前沒有場景可重載", "No scene available to reload"))
				return
			var scene_path: String = current_scene.scene_file_path
			if scene_path.strip_edges().is_empty():
				_append_error(_tr("当前场景无 scene_file_path，无法重载", "目前場景無 scene_file_path，無法重載", "Current scene has no scene_file_path"))
				return
			_append_info(_tr("重载场景: %s", "重載場景: %s", "Reloading scene: %s") % scene_path)
			get_tree().call_deferred("change_scene_to_file", scene_path)
		"goto":
			if tokens.size() < 3:
				_append_error(_tr("用法: scene goto <res://...tscn>", "用法: scene goto <res://...tscn>", "Usage: scene goto <res://...tscn>"))
				return
			var target_path: String = tokens[2]
			if not target_path.begins_with("res://"):
				_append_error(_tr("场景路径必须以 res:// 开头", "場景路徑必須以 res:// 開頭", "Scene path must start with res://"))
				return
			if not ResourceLoader.exists(target_path):
				_append_error(_tr("场景不存在: %s", "場景不存在: %s", "Scene not found: %s") % target_path)
				return
			_append_info(_tr("切换场景: %s", "切換場景: %s", "Switching scene: %s") % target_path)
			get_tree().call_deferred("change_scene_to_file", target_path)
		_:
			_append_error(_tr("未知子命令: scene %s", "未知子命令: scene %s", "Unknown subcommand: scene %s") % sub_command)

func _handle_story(tokens: Array[String]) -> void:
	if tokens.size() < 4:
		_append_error(_tr("用法: story goto <chapter> <episode>", "用法: story goto <chapter> <episode>", "Usage: story goto <chapter> <episode>"))
		return

	var sub_command: String = tokens[1].to_lower()
	if sub_command != "goto":
		_append_error(_tr("未知子命令: story %s", "未知子命令: story %s", "Unknown subcommand: story %s") % sub_command)
		return

	var chapter: String = tokens[2].strip_edges().to_lower()
	var episode_token: String = tokens[3].strip_edges().to_lower()
	if chapter.is_empty() or episode_token.is_empty():
		_append_error(_tr("用法: story goto <chapter> <episode>", "用法: story goto <chapter> <episode>", "Usage: story goto <chapter> <episode>"))
		return

	var scene_path: String = _resolve_story_scene_path(chapter, episode_token)
	if scene_path.is_empty():
		_append_error(_tr("未找到剧情场景: chapter=%s episode=%s", "未找到劇情場景: chapter=%s episode=%s", "Story scene not found: chapter=%s episode=%s") % [chapter, episode_token])
		return

	_append_info(_tr("剧情跳转: %s", "劇情跳轉: %s", "Story jump: %s") % scene_path)

	var main_menu: Node = get_tree().get_first_node_in_group("main_menu")
	if main_menu != null and main_menu.has_method("load_story_scene"):
		main_menu.call_deferred("load_story_scene", scene_path, "")
		return

	get_tree().call_deferred("change_scene_to_file", scene_path)

func _handle_config(tokens: Array[String]) -> void:
	if tokens.size() < 3:
		_append_error(_tr("用法: config <get|set> <section.key> [value]", "用法: config <get|set> <section.key> [value]", "Usage: config <get|set> <section.key> [value]"))
		return

	var sub_command: String = tokens[1].to_lower()
	var section_key: String = tokens[2]
	var split_index: int = section_key.find(".")
	if split_index <= 0 or split_index >= section_key.length() - 1:
		_append_error(_tr("配置键格式错误，应为 section.key", "配置鍵格式錯誤，應為 section.key", "Invalid key format, expected section.key"))
		return

	var section: String = section_key.substr(0, split_index)
	var key: String = section_key.substr(split_index + 1)

	match sub_command:
		"get":
			var value: Variant = GameConfig.get_setting(section, key, null)
			_append_plain("%s = %s" % [section_key, str(value)])
		"set":
			if tokens.size() < 4:
				_append_error(_tr("用法: config set <section.key> <value>", "用法: config set <section.key> <value>", "Usage: config set <section.key> <value>"))
				return
			if not bool(CONFIG_SET_ALLOWLIST.get(section_key, false)):
				_append_error(_tr("不允许设置该配置: %s", "不允許設定此配置: %s", "Setting this key is not allowed: %s") % section_key)
				return

			var raw_value: String = _join_tokens(tokens, 3)
			var current_value: Variant = GameConfig.get_setting(section, key, null)
			var parsed_value: Variant = _parse_config_value(raw_value, current_value)

			if section_key == "language.current":
				var normalized_code: String = _normalize_language_code(str(parsed_value))
				if not SUPPORTED_LANGUAGE_CODES.has(normalized_code):
					_append_error(_tr("不支持的语言代码: %s", "不支援的語言代碼: %s", "Unsupported language code: %s") % str(parsed_value))
					return
				GameConfig.current_language = normalized_code
				GameConfig.save()
				var refreshed_count: int = _refresh_language_in_current_scene()
				_append_info(_tr("%s 已设置为 %s（刷新节点: %d）", "%s 已設定為 %s（刷新節點: %d）", "%s set to %s (refreshed nodes: %d)") % [section_key, GameConfig.current_language, refreshed_count])
				return

			GameConfig.set_setting(section, key, parsed_value)
			GameConfig.save()
			_append_info(_tr("%s 已设置为 %s", "%s 已設定為 %s", "%s set to %s") % [section_key, str(parsed_value)])
		_:
			_append_error(_tr("未知子命令: config %s", "未知子命令: config %s", "Unknown subcommand: config %s") % sub_command)

func _resolve_story_scene_path(chapter: String, episode_token: String) -> String:
	var scene_prefix: String = "res://scenes/story/%s/%s_" % [chapter, chapter]
	var suffix_candidates: Array[String] = _build_story_episode_suffix_candidates(episode_token)
	for suffix in suffix_candidates:
		var candidate_path: String = scene_prefix + suffix + ".tscn"
		if ResourceLoader.exists(candidate_path):
			return candidate_path
	return ""

func _build_story_episode_suffix_candidates(episode_token: String) -> Array[String]:
	var normalized: String = episode_token.strip_edges().to_lower()
	var candidates: Array[String] = []

	if normalized.begins_with("ep") or normalized.begins_with("ex"):
		_append_unique_string(candidates, normalized)
		if normalized.length() > 2:
			var prefix: String = normalized.substr(0, 2)
			var number_part: String = normalized.substr(2)
			if number_part.is_valid_int():
				var number_value: int = int(number_part)
				_append_unique_string(candidates, "%s%02d" % [prefix, number_value])
				_append_unique_string(candidates, "%s%d" % [prefix, number_value])
		return candidates

	if normalized.is_valid_int():
		var ep_number: int = int(normalized)
		_append_unique_string(candidates, "ep%02d" % ep_number)
		_append_unique_string(candidates, "ep%d" % ep_number)
		return candidates

	_append_unique_string(candidates, "ep" + normalized)
	return candidates

func _append_unique_string(container: Array[String], value: String) -> void:
	if not container.has(value):
		container.append(value)

func _refresh_language_in_current_scene() -> int:
	var scene_root: Node = get_tree().current_scene
	if scene_root == null:
		return 0
	return _refresh_language_recursive(scene_root)

func _refresh_language_recursive(node: Node) -> int:
	var refresh_count: int = 0
	for method_name in LANGUAGE_REFRESH_METHODS:
		if node.has_method(method_name):
			node.call(method_name)
			refresh_count += 1
			break

	var children: Array = node.get_children()
	for child_any in children:
		if child_any is Node:
			var child_node: Node = child_any as Node
			refresh_count += _refresh_language_recursive(child_node)

	return refresh_count

func _normalize_language_code(language_code: String) -> String:
	var normalized: String = language_code.strip_edges().to_lower()
	match normalized:
		"ja":
			normalized = "jp"
		"ko":
			normalized = "kr"
	return normalized

func _parse_config_value(raw_value: String, current_value: Variant) -> Variant:
	var text: String = raw_value.strip_edges()
	var lower_text: String = text.to_lower()

	if lower_text == "true":
		return true
	if lower_text == "false":
		return false
	if lower_text == "null":
		return null

	match typeof(current_value):
		TYPE_BOOL:
			return lower_text == "1" or lower_text == "true" or lower_text == "yes" or lower_text == "on"
		TYPE_INT:
			if text.is_valid_int():
				return int(text)
		TYPE_FLOAT:
			if text.is_valid_float():
				return float(text)

	if text.is_valid_int():
		return int(text)
	if text.is_valid_float():
		return float(text)

	return text

func _tokenize_command(command_line: String) -> Array[String]:
	var tokens: Array[String] = []
	var current: String = ""
	var in_quotes: bool = false
	var quote_char: String = ""

	for i in range(command_line.length()):
		var ch: String = command_line.substr(i, 1)
		var is_quote: bool = ch == '"' or ch == "'"

		if is_quote:
			if in_quotes and ch == quote_char:
				in_quotes = false
				quote_char = ""
			elif not in_quotes:
				in_quotes = true
				quote_char = ch
			else:
				current += ch
			continue

		if ch == " " and not in_quotes:
			if not current.is_empty():
				tokens.append(current)
				current = ""
			continue

		current += ch

	if not current.is_empty():
		tokens.append(current)

	return tokens

func _join_tokens(tokens: Array[String], from_index: int) -> String:
	if from_index >= tokens.size():
		return ""

	var result: String = ""
	for i in range(from_index, tokens.size()):
		if i > from_index:
			result += " "
		result += tokens[i]
	return result

func _append_command(text: String) -> void:
	_append_colored_line("%s %s" % [PROMPT_TEXT, text], Color(0.76, 0.89, 1.0, 1.0))

func _append_info(text: String) -> void:
	_append_colored_line("[INFO] " + text, Color(0.72, 0.95, 0.72, 1.0))

func _append_error(text: String) -> void:
	_append_colored_line("[ERR] " + text, Color(1.0, 0.64, 0.64, 1.0))

func _append_plain(text: String) -> void:
	_append_colored_line(text, Color(0.93, 0.93, 0.93, 1.0))

func _append_colored_line(text: String, color: Color) -> void:
	output_label.push_color(color)
	output_label.add_text(text + "\n")
	output_label.pop()
	var last_line_index: int = maxi(output_label.get_line_count() - 1, 0)
	output_label.scroll_to_line(last_line_index)

func _tr(zh_text: String, tc_text: String, en_text: String) -> String:
	var console_lang: String = _console_language()
	match console_lang:
		"zh":
			return zh_text
		"tc":
			return tc_text
		"en":
			return en_text
		_:
			var lang_pack_any: Variant = CONSOLE_TEXT_TRANSLATIONS.get(console_lang, null)
			if lang_pack_any is Dictionary:
				var lang_pack: Dictionary = lang_pack_any
				var translated_any: Variant = lang_pack.get(en_text, "")
				var translated: String = str(translated_any)
				if not translated.is_empty():
					return translated
			return en_text

func _console_language() -> String:
	var language_code: String = _normalize_language_code(GameConfig.current_language)
	if SUPPORTED_LANGUAGE_CODES.has(language_code):
		return language_code
	return "en"
