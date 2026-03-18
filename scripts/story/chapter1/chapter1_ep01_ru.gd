# chapter1_ep1.gd - Chapter 1 Episode 1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep1_script()

func play_script():
	pass

func chapter1_ep1_script():
	novel_interface.change_music("res://assets/audio/music/Hero.mp3")
	await novel_interface.enter_center_performance_mode([
		"«Гетероматерия» — это информация или носитель, способные при определённых условиях вызывать сверхъестественные физические явления.",
		"Эти явления не ограничены никакими известными барьерами — ни измерениями, ни временем и пространством, ни сознанием.",
		"Долгое время «гетероматерия» таилась совсем рядом с нами.",
		"Поскольку большинство из них внешне не отличается от обычных бытовых вещей, распознать их крайне трудно.",
		"Но стоит подвергнуть их определённому воздействию, и они вызывают аномалии, выходящие за пределы человеческого понимания.",
		"Чтобы защитить человечество, этот хрупкий вид, мы изо всех сил старались не допускать их появления на глазах у масс.",
		"Потому что само существование этих аномалий способно пошатнуть с таким трудом удерживаемый нынешний порядок!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("После крушения самолёта, проходившего по делу DA154,\n«гетероматерию» стали находить по всему миру.","Запись")
	await novel_interface.show_dialog("Все наши усилия пошли прахом…","Запись")
	await novel_interface.show_dialog("Никто не знает, кто их создал.","Запись")
	await novel_interface.show_dialog("Пока наука не смогла объяснить принцип их действия, люди и СМИ предпочитали называть их… «чудесами».","Запись")
	await novel_interface.show_dialog("Люди верили, что это дар Божий.","Запись")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Пока некоторые из этих «чудес», обладавшие огромной силой, не превратили в оружие.","Запись")
	await novel_interface.show_dialog("И снова человечество без колебаний схватилось за оружие, смысла которого не понимало, и обратило его друг против друга.","Запись")
	await novel_interface.show_dialog("И эта война длилась семь лет…","Запись")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Наконец шесть стран, лидировавших в исследованиях «гетероматерии», заключили мирный договор.","Запись")
	await novel_interface.show_dialog("Чтобы успокоить население, измотанное войной, и одновременно показать безвредность исследований гетеротехнологий.","Запись")
	await novel_interface.show_dialog("Эти шесть стран единогласно постановили называть свои столицы\n«Академгородами» (Academy City).","Запись")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"«Академгород»… какое ироничное название."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ База Алькатрас",
		"Сердце Второго Академгорода",
		40,
		30,
		Vector2(68,460),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00001_1.ogv",
		"res://assets/video/00001_2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")
	await novel_interface.enter_center_performance_mode([
		"Три дня назад..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Центр содержания и исследований «Стилмонт»",
		"Пятый Академгород",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Система идентификации AEGIS активирована.", "Система")# color tags supported here
	await novel_interface.show_dialog("Начинаю обслуживание.", "Система")
	await novel_interface.show_dialog("Пожалуйста, подтвердите свою личность.", "Система")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
