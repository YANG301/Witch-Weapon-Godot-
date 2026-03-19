# chapter2_ep20.gd - 第二章第20话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep20_script()

func play_script():
	pass

func chapter2_ep20_script():
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	await novel_interface.show_text_only("Подстанция Джонсон была огромным объектом под открытым небом, построенным до войны, позже полностью приобретенным компанией Johnson Heavy Industries из Первого Академгорода.")
	await novel_interface.show_text_only("За последние несколько лет спрос на электроэнергию в «Зоне соглашения» вырос настолько резко, что мощность подстанции теперь увеличена в двадцать раз.")
	await novel_interface.show_text_only("Мы с Annie осторожно проскальзываем на подстанцию через дыру в проволочном заборе.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("Это назначенная точка, хах... Здесь все выглядит довольно плохо.\nНе слишком ли поздно?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("По подстанции разносится предательский гул перегрузки, а из электрооборудования время от времени вылетают искры.")
	await novel_interface.show_text_only("Земля и стены покрыты ветвящимися следами ожогов, как будто их пронзила молния...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Это совсем не похоже на другие аномальные зоны. Mariru не думает всерьез, что мы будем ремонтировать трансформаторы, не так ли?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("Блок электричества на уроке физики... это та часть, которая вызывает у меня самую сильную головную боль...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Голос Annie дрожит, как будто она только что вспомнила ужас от невозможности отличить правило левой руки от правила правой.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Подожди, послушай—\nВпереди...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Что это было?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("Т-там…", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Я поднимаю глаза и вижу в воздухе синеволосую девушку, окутанную электричеством, в металлических перчатках, слишком больших для ее маленького тела…")
	await novel_interface.show_text_only("Вокруг нее группа странных фигур по очереди совершает жестокие атаки.")
	await novel_interface.show_text_only("Одна из них — женщина, окруженная предметами, похожими на призрачное пламя.")
	await novel_interface.show_text_only("Пронзительный щелкающий звук вырывается из ее горла, инстинктивно сжимая мои зубы.")
	await novel_interface.show_text_only("А остальные... или кем бы они ни были, потому что я даже не уверен, что они люди, похоже, чем-то управляются.")
	await novel_interface.show_text_only("По мере того как волна за волной атак обрушивается, даже их тела изгибаются под невероятными углами вместе с их движениями.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ха... х-хаах...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Под безжалостным нападением синеволосая маленькая девочка уже вся в ранах и едва может защищаться.")
	await novel_interface.show_text_only("Нет,... называть ее девушкой, возможно, даже слишком. Она больше похожа на ребёнка... на вид лет на десять.")
	await novel_interface.show_text_only("...Э, неужели сейчас самое время зацикливаться на этой детали?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, смотри—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("... великий... Си-ли Ду-ма-смрти-гахара...\nГлиммер... Ёми... кекекеке...", "Безумный атакующий")
	await novel_interface.show_dialog("Все они... все они... все они... КАЖДЫЙ ПОСЛЕДНИЙ ИЗ НИХ!!!", "Безумный атакующий")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ух!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("Эта маленькая девочка больше не сможет продержаться!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Вы, ублюдки, — \nСтоп!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
