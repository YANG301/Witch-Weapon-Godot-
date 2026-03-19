# chapter2_ep07.gd - 第二章第7话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep07_script()

func play_script():
	pass

func chapter2_ep07_script():
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/other/BG_City_street2.png")
	novel_interface.show_character("ren_battle","gratified")
	await novel_interface.show_dialog("Это было очень близко...\nМы наконец-то вернулись~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", ты ранен!\nУ тебя сильно кровоточит рука!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Со мной все в порядке, это всего лишь царапина.\nТакая травма для парня ничего не значит!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Но ты, очевидно, сейчас девушка, так что не напрягай себя так сильно!\nИ ты тоже подвернула лодыжку, не так ли...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Да... это явно не просто. Если мы не решим всю эту проблему,\nеще больше людей могут пострадать...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Пожалуйста, берегите себя получше, ладно?\nВаша рука все еще кровоточит.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Я буду. Спасибо, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Но... у нас все еще нет никаких зацепок...\nМожет, продолжим и проверим следующую область?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Внезапно появляясь перед ней) Ты, маленький засранец...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Доктор Mariru—ах, нет, коммандер!\nВы нас ждали?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Мы как раз собирались исследовать следующую область...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Подожди секунду, ты... только что с чем-то дрался?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Э-э, я всего лишь... пытался немного помочь...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Я отчетливо помню, как говорил тебе не заставлять себя!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Если бы с тобой случилось что-то неконтролируемое, это было бы для меня огромной потерей!\nПосмотри на себя — тебе уже больно!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Медицинский коллектив! У нас здесь раненая девушка — немедленно окажите ей помощь и верните ее прямо в штаб!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", Командир Mariru кажется очень беспокоится за тебя...\nМожет быть, нам стоит просто...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Да.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Слабая, неописуемая паника тихо закралась в мое сердце.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
