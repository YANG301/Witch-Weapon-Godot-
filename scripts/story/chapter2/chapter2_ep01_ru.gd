# chapter2_ep01.gd - 第二章第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep01_script()

func play_script():
	pass

func chapter2_ep01_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/spSoundChannel.png")
	await novel_interface.show_dialog("Что ты сказал?! Оборонительный периметр 'Aegis' явно подпадает под юрисдикцию нашего Столичное бюро обороны (MD)!", "Офицер бюро обороны")
	await novel_interface.show_dialog("На каком основании вы принимаете на себя командование?\nЕсли вы не дадите мне убедительную причину, не ждите, что я сниму полицейскую блокаду!!", "Офицер бюро обороны")
	await novel_interface.show_dialog("Это засекречено. Я не могу и не должен вам это объяснять!", "военный офицер")
	await novel_interface.show_dialog("Теперь это дело военных.\nВы будете сотрудничать.", "военный офицер")
	await novel_interface.show_dialog("Я отказываюсь! Эта операция проводится под командованием Бюро обороны!!\nНет, если только не будет административного приказа от Сенат...!", "Офицер бюро обороны")
	await novel_interface.show_dialog("Кхм, позвольте мне сказать следующее...", "Женский голос")
	await novel_interface.show_dialog("Ты все еще тратишь время на что-то бессмысленное?", "Женский голос")
	await novel_interface.show_dialog("Этот голос — \nMariru... Офицер Mariru?!", "военный офицер")
	await novel_interface.show_dialog("Д-да, мэм!", "военный офицер")
	await novel_interface.show_dialog("Отдел секретной разведки давно отделились от армии, так что вам не нужно называть меня «Офицер».", "Mariru")
	await novel_interface.show_dialog("Mariru... Хм!", "Офицер бюро обороны")
	await novel_interface.show_dialog("Это зашифрованное сообщение 4-го уровня!!\nКак вы вообще...", "Офицер бюро обороны")
	await novel_interface.show_dialog("Забудьте пока об этой тривиальной детали~\nПодумайте о том, как мы собираемся справиться с ситуацией, которая перед нами.", "Mariru")
	await novel_interface.show_dialog("Если это зашифрованный канал 4-го уровня, то говорите прямо. Все равно здесь больше никто не подслушивает…", "Mariru")
	await novel_interface.show_dialog("Я хочу, чтобы все разведданные были раскрыты!!", "Mariru")
	await novel_interface.show_dialog("Д-да, мэм!", "военный офицер")
	await novel_interface.show_dialog("В настоящее время все системы наблюдения вокруг исследовательского центра вышли из строя, и мы обнаружили крупномасштабные пространственно-временные флуктуации...", "военный офицер")
	await novel_interface.show_dialog("Флуктуации пространства-времени?\nЧто это значит...?", "Офицер бюро обороны")
	await novel_interface.show_dialog("В Закон о противодействии городским бедствиям об этом говорится совершенно ясно, не так ли...?", "Mariru")
	await novel_interface.show_dialog("Только не говорите мне, что Бюро обороны даже не утруждает себя чтением секретных законов только потому, что они закрыты для публики?", "Mariru")
	await novel_interface.show_dialog("Ух... Н-только не говорите мне, что это...\nпровал сдерживания, связанный с 'Substance H'...?", "Офицер бюро обороны")
	await novel_interface.show_dialog("И вдобавок ко всему, Ross Goblet внезапно исчез прошлой ночью...", "Mariru")
	await novel_interface.show_dialog("...Ничего подобного не происходило в New Opulentia уже шесть лет, не так ли?", "Mariru")
	await novel_interface.show_dialog("Вам нужно рассмотреть худший сценарий —", "Mariru")
	await novel_interface.show_dialog("Я-я понимаю...", "Офицер бюро обороны")
	await novel_interface.show_dialog("Мы немедленно снимем внутренний карантин и эвакуируем мирных жителей под видом учений...", "Офицер бюро обороны")
	await novel_interface.show_dialog("Хорошо. Как продвигается внешнее развертывание вооруженных сил?", "Mariru")
	await novel_interface.show_dialog("Подразделения специального назначения развертывают мощную огневую мощь в радиусе двух километров вокруг аномальной зоны, но мы пока не можем подтвердить уровень угрозы.", "военный офицер")
	await novel_interface.show_dialog("А как насчет контроля над СМИ?", "Mariru")
	await novel_interface.show_dialog("Согласно протоколу мы выполняем C-13.", "военный офицер")
	await novel_interface.show_dialog("Хорошо. Затем с этого момента Отдел секретной разведки (SID) захватит центральную зону аномалии.", "Mariru")
	await novel_interface.show_dialog("Вы все тоже немедленно уходите!", "Mariru")
	await novel_interface.show_dialog("Да!", "Военная связь")
	await novel_interface.show_dialog("А-хорошо...\nВам лучше быть осторожными.", "Офицер бюро обороны")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
