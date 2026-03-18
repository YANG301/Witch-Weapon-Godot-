# chapter1_ep4.gd - Chapter 1 Episode 4
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep4_script()

func play_script():
	pass

func chapter1_ep4_script():
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-1.ogv"
	])
	await novel_interface.show_text_only("...")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("Hm...?",GameConfig.player_name)
	await novel_interface.show_dialog("(Hä, was ist eigentlich passiert...?)",GameConfig.player_name)
	await novel_interface.show_dialog("Tut weh...",GameConfig.player_name)
	await novel_interface.show_dialog("(Ach ja, ich wurde angegriffen...)\n(Und dann bin ich in den Schatten eines nahen Ausstellungsstücks gekrochen...)",GameConfig.player_name)
	await novel_interface.show_dialog("Um mich herum lagen steintafelartige Platten.\n(Auf ihnen waren seltsame Muster und Schriftzeichen eingraviert...)",GameConfig.player_name)
	await novel_interface.show_dialog("(Auf dem Schild des Ausstellungsstücks stand Miskatonic...)\n(Der Rest war verschwommen.)",GameConfig.player_name)
	await novel_interface.show_dialog("Wenn ich so darüber nachdenke, ist es viel zu still...",GameConfig.player_name)
	await novel_interface.show_dialog("Sind diese Typen schon woanders hin?",GameConfig.player_name)
	await novel_interface.show_dialog("Ich sollte kurz nachsehen.\nDer Konferenzsaal... Liliu...",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Das ist doch ein Traum... oder?\nWas zum...? Was ist hier los??",GameConfig.player_name)
	await novel_interface.show_text_only("Mitten in einem Flammenmeer stehen Menschen wie in einem Skulpturengarten,\nin lebendigen Bewegungen und mit ausdrucksstarken Gesichtern...")
	await novel_interface.show_text_only("Aber sie haben jede menschliche Farbe verloren und sind kreideweiß geworden.")
	await novel_interface.show_dialog("So etwas... so etwas... kann doch nicht sein...",GameConfig.player_name)
	await novel_interface.show_dialog("Nein...\nWas ist mit allen... passiert... Wo ist Liliu... hin...",GameConfig.player_name)
	await novel_interface.show_dialog("Sagt mir doch endlich... jemand, was hier los ist!!",GameConfig.player_name)
	await novel_interface.show_text_only("Als ich die Hand nach dem kalten Gesicht einer Frau ausstrecken will, bricht ihr Hals lautlos ab, der Kopf fällt zu Boden und zerbirst in Stücke.")
	await novel_interface.show_dialog("Das ist... Salz??",GameConfig.player_name)
	await novel_interface.show_dialog("Ugh... uuh...\nUwaaaaaah!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("Uwaaaaaah!!!!\nAaaaaaaaaaaaaaaaaaah!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
