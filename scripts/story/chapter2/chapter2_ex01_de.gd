# chapter2_ex01.gd - 第二章番外1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex01_script()

func play_script():
	pass

func chapter2_ex01_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Hallo. Zeit für ein Quiz!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Nennen Sie zunächst die Farben dieser Lippenstifte.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Ähm... Ähm... Diese neun Lippenstifte... \\nAlle rot, oder?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Moment, einige davon sind lila, nicht wahr?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Du hast sie alle falsch verstanden!!", "Ai")
	await novel_interface.show_dialog("Pfirsich, Koralle, Magenta, Kirsche, tiefes Lila, blasses Lila, Traube und Lavendel. 0 Punkt!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Welches ist als nächstes die limitierte YYL-Edition zum Valentinstag? \\nDas ist ein Kinderspiel.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Was, nirgendwo ein Logo... \\nDieses mit einem herzförmigen Design?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Das ist das günstigste. Mädchen werden sich sofort verabschieden, wenn sie dieses Geschenk am Valentinstag erhalten. 0 Punkt!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Füllen Sie nun die Lücke aus: Welche Textur hat dieser MEC-Lippenbalsam?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Textur? Samt? \\nNein... seidig?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("Was ist das Wort? \\nIch habe es auswendig gelernt, kann mich aber jetzt einfach nicht mehr daran erinnern! Verdammt!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("Nicht gut... Du hast es nicht in dir!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("Ich muss es nicht haben ...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Okay, die letzte Frage...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Wie heißt der allererste abstrakte Duft? Wie hoch ist der Etikettenpreis?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Äh... ich habe es völlig vergessen! \\nParfums, du hast mich.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Sein Preis... So eine kleine Flasche... \\nEtwa... 10 Dollar?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Ups.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Falsch! Alles falsch! \\nWie unglaublich lahm du bist!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Waaaah...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Hahaha.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! Hör auf, mich auszulachen!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
