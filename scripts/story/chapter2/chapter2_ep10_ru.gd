# chapter2_ep10.gd - 第二章第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep10_script()

func play_script():
	pass

func chapter2_ep10_script():
	novel_interface.change_music("res://assets/audio/music/Witch's Confession.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("После того, как Lian уходит, Mariru смотрит на свое портативное устройство с серьезным выражением лица.")
	await novel_interface.show_text_only("Перед ее глазами разворачивается длинный поток меняющихся данных.")
	await novel_interface.show_text_only("Файл на экране, якобы в \"заблокированном\" состоянии, меняется.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Как такое может быть?! Aegis должен уметь защититься от любой сетевой атаки.)\n(Может ли это быть кто-то из Сенат...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Вся история Lian превратилась в тарабарщину. По мере мерцания экрана искаженный текст постепенно преобразуется в осмысленную информацию.")
	await novel_interface.show_text_only("От нечитаемых фрагментов до полностью связной записи — наступательный брандмауэр Aegis никогда не выдает ни одного предупреждения.")
	await novel_interface.show_text_only("На циферблате часов Mariru мигает красная буква «Т».")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Перезапись данных такого масштаба происходит на мэйнфрейме Aegis и только «Фемида» заметила аномалию...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("На портативном устройстве личная история Lian была полностью обновлена.\nС детского сада до средней школы она посещала частные школы.")
	await novel_interface.show_text_only("Табель успеваемости, дипломы, награды, медицинские записи, страховые свидетельства...\nкаждая деталь указывает на богатое и привилегированное семейное прошлое.")
	await novel_interface.show_text_only("Но не так давно родители и старший брат девочки погибли в авиакатастрофе за границей.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("В соответствии с послевоенным Законом о защите детей опекуном девочки был назначен учёный ранга СС, который когда-то зарегистрировался добровольцем...", "Mariru")
	await novel_interface.show_dialog("(Не говорите мне, что даже мои собственные записи тоже были изменены!)\n(Так это действительно провокация...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Комментарий одного учителя гласит: «Она всегда любит подражать манерам своего старшего брата, и ей не хватает сдержанности, ожидаемой от молодой девушки...»")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Такая тщательная подделка... Надо заставить информационный отдел как следует ее изучить.)", "Mariru")
	await novel_interface.show_dialog("(Если бы они назначили другого опекуна, даже я бы не смог сказать, настоящий он или фальшивый.)\n(...Они пересадили чужие записи?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Похоже, штаб-квартире нужна тщательная проверка на наличие ошибок.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(Ниже тоже есть фото?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("К протоколу приобщена фотография как одна из вещей покойных родителей.")
	await novel_interface.show_text_only("На фото юная Lian с короткими волосами и гордо демонстрирует свой рисунок.")
	await novel_interface.show_text_only("Девушка нарисовала русалочку. Детским английским почерком справа внизу слова: «У меня тоже рыжие волосы».")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Хе-хе-хе... вот так вот...", "Mariru")
	await novel_interface.show_dialog("Даже если это составное фото, в детстве она действительно была очаровательна~", "Mariru")
	await novel_interface.show_dialog("Вы рассказали ей полную личную историю.", "Mariru")
	await novel_interface.show_dialog("И в то же время вы напоминали мне, что этот малыш особенный, не так ли?", "Mariru")
	await novel_interface.show_dialog("Ты с самого начала не собирался ничего от меня скрывать.", "Mariru")
	await novel_interface.show_dialog("Вот почему вы сознательно выбрали этот рисунок, который я сделал, когда был маленьким…", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Вот какие сообщения вы хотели мне передать...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
