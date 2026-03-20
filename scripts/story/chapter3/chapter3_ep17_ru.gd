# chapter3_ep17.gd - 第三章第17话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter3_ep17_script()

func play_script():
	pass

func chapter3_ep17_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/School/BG_School_passage.png")
	novel_interface.show_character("anne_uniform","happy")
	await novel_interface.show_dialog("Доброе утро, Рен! \\nПочему ты сегодня выглядишь немного не в своей тарелке…", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("Да, после всех этих вчерашних медосмотров… \\nНе мог спать спокойно прошлой ночью. Теперь я чувствую себя одурманенным…", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Это кровать? Возможно, вы плохо спите на новых кроватях?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("Без понятия. Я немного запыхалась, пока лежала в постели ...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Запыхался? \\nWait ...  What sleeping position do you use?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("Ну, лежу на животе, как всегда.", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("O-На животе ... \\nЭта поза не поможет им вырасти ...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("Помогите, что вырастить?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Давай, Рен. Ты девочка, ты понимаешь, что я имею в виду __ЭЛЛИПСИС__ (тыкаю пальцем).", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("Вааа ... окей ... \\nДумаю, теперь я понял ...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Похоже, тебе еще предстоит пройти долгий путь, Рен…", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
