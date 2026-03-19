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
	await novel_interface.show_dialog("Здравствуйте. Время для викторины!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Для начала назовите цвета этих помад.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Err... Err... Эти девять помад... \\nВсе красные, да?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Подождите, некоторые из них фиолетовые, не так ли?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Вы все поняли неправильно!!", "Ai")
	await novel_interface.show_dialog("Персиковый, коралловый, пурпурный, вишневый, темно-фиолетовый, бледно-фиолетовый, виноградный и лавандовый. 0 баллов!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Далее, какой из них будет выпущен ограниченным тиражом YYL ко Дню святого Валентина? \\nЭто несложно.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Что, нигде нет логотипа... \\nЭтот в форме сердца?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Это самый дешевый вариант. Девушки сразу попрощаются, если получат такое на День святого Валентина. 0 баллов!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Теперь заполните пробел: какова текстура бальзама для губ MEC?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Текстура? Бархатный? \\nНет... шелковистый?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("Что это за слово? \\nЯ выучил наизусть, но сейчас не могу вспомнить! Блин!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("Ничего хорошего... В тебе этого нет!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("Мне это не нужно…", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Хорошо, последний вопрос...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Как называется первый в мире абстрактный аромат? Какова его цена на этикетке?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Э-э… Я совсем забыл! \\nПарфюмы, вы меня поняли.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Его цена... Такая крохотная бутылочка... \\nПримерно… 10 баксов?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Упс.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Неправильно! Все неправильно! \\nКакой ты невероятно уродливый!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Ваааа...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Ха-ха-ха.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! Хватит надо мной смеяться!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
