# chapter2_ep25.gd - 第二章第25话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep25_script()

func play_script():
	pass

func chapter2_ep25_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	await novel_interface.show_text_only("Где я? \\nЯ в густом тумане. Кажется, вдалеке кто-то есть.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Тень")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… Кто там?")
	await novel_interface.show_text_only("Медленно человек приближается…")
	await novel_interface.show_text_only("Это странный человек в черном. Глаза у него розоватые и холодные…")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Он прячет в глазах лисью улыбку.")
	await novel_interface.show_text_only("— Он вызывает у меня знакомое чувство.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Пока… когда… наконец…", "Тень")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Что ты говоришь? \\nЭй! Ждать!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Ааа!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("Еще до рассвета. Солнце не взошло. На горизонте лишь луч мягкого красного света.")
	await novel_interface.show_text_only("Вчера вечером я смертельно устал и не переоделся перед тем, как заснуть. Вот почему мне приснился этот сон?")
	await novel_interface.show_text_only("Я открываю глаза и пытаюсь вспомнить сон. Но я просто не могу вспомнить, что он сказал.")
	await novel_interface.show_dialog("Почему мне приснился этот сон? Что-то предвещает беду.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Ах! Вы проснулись.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Ты так рано встал.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Что-то не так. Mariru только что позвонила и попросила прочитать новости в ее электронном письме!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Ух, хорошо! \\nМожет ли она дать нам передохнуть…", "Lian")
	await novel_interface.show_dialog("(Отлично, Annie такой же, как обычно) \\n(Это точно был всего лишь сон.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Я вздохнул с облегчением и поспешно переоделся. Сидя перед компьютером, я открываю ссылку, которую мне прислал Mariru.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Ещё одно Substance H украдено! Какой беспокойный мир…", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Но это произошло во Втором Академгороде. Что это за SID? \\nКроме того…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Подожди. Что это?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Однако ранним утром эта новость попала в заголовки почти всех новостных сайтов по всему миру.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Древний EX-класс Substance H Захвачен загадочным человеком, ограбившим Центр коллекций и исследований Акатраса.")
	await novel_interface.show_text_only("В объявлении о розыске описан мужчина в возрасте от 15 до 18 лет. \\nТам только фотография подозреваемого.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Никто не знаком с этим лицом лучше, чем я.")
	await novel_interface.show_dialog("Это… я?", "Lian")
	await novel_interface.show_text_only("Точнее, это я в детстве.")
	await novel_interface.show_text_only("В уведомлении не раскрываются какие-либо подробности Substance H. Ему присвоен рейтинг опасности ААА.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… Как это возможно?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("Что, черт возьми, происходит?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
