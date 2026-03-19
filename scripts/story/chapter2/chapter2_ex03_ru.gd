# chapter2_ex03.gd - 第二章番外篇03
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex03_script()

func play_script():
	pass

func chapter2_ex03_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/APT/washingRoom.png")
	await novel_interface.show_dialog("Хорошая ванна. \\nMariru действительно не заботится о деньгах...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ах. \\nСамый расслабляющий момент после долгого дня.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Ну…", "Lian")
	await novel_interface.show_dialog("Это... моё тело?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Выглядит красиво и на ощупь мягкий... \\nТак гладкий на ощупь…")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("Что я делаю? \\nПризнайтесь этому.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Прежде чем я найду путь назад к прежнему себе\\nЭто мое тело...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("Какая расслабляющая ванна после целого дня борьбы с неожиданными врагами!", "Lian")
	await novel_interface.show_dialog("Мне лучше насладиться этим моментом. Какой утомительный день!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ах.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Все еще не могу принять свой голос. Похоже на стонущий котёнок...", "Lian")
	await novel_interface.show_dialog("Черт возьми! Этот голос такой...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Грязный...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Хм…", "Lian")
	await novel_interface.show_dialog("Как мне привыкнуть к этому телу?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
