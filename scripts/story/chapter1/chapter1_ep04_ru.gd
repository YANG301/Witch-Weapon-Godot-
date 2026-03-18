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
	await novel_interface.show_text_only("……")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("Мм…?",GameConfig.player_name)
	await novel_interface.show_dialog("(Э?.. Что вообще со мной произошло?)",GameConfig.player_name)
	await novel_interface.show_dialog("Больно…",GameConfig.player_name)
	await novel_interface.show_dialog("(Точно, на меня напали…)\n(А потом я дополз до тени ближайшего экспоната…)",GameConfig.player_name)
	await novel_interface.show_dialog("Вокруг меня лежит что-то вроде каменных плит.\n(На них высечены какие-то странные узоры и письмена…)",GameConfig.player_name)
	await novel_interface.show_dialog("(На табличке у экспоната было написано Miskatonic…)\n(Дальше буквы расплывались)",GameConfig.player_name)
	await novel_interface.show_dialog("Кстати… здесь слишком тихо…",GameConfig.player_name)
	await novel_interface.show_dialog("Те люди уже ушли куда-то ещё?",GameConfig.player_name)
	await novel_interface.show_dialog("Надо бы… пойти и посмотреть.\nКонференц-зал… Лилю…",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Это… сон, да…?\nЧто… здесь произошло?..",GameConfig.player_name)
	await novel_interface.show_text_only("Среди моря огня люди застыли, словно экспонаты в парке скульптур, —\nпозы живые, лица полны выражения…")
	await novel_interface.show_text_only("Но они уже утратили человеческие краски и стали мертвенно-белыми.")
	await novel_interface.show_dialog("Т-такого… такого просто не бывает…",GameConfig.player_name)
	await novel_interface.show_dialog("Нет…\nЧто со всеми… где… Лилю…",GameConfig.player_name)
	await novel_interface.show_dialog("Хоть кто-нибудь… скажите же мне!!",GameConfig.player_name)
	await novel_interface.show_text_only("Когда я протянул руку, чтобы коснуться ледяного лица одной женщины, её шея беззвучно надломилась, голова упала на землю и разлетелась вдребезги.")
	await novel_interface.show_dialog("Это… соль??",GameConfig.player_name)
	await novel_interface.show_dialog("У… у…\nУвааааааа!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("Увааааааа!!!\nААААААААААААААААААААААА!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
