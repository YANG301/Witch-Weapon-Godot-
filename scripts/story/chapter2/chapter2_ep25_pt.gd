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
	await novel_interface.show_text_only("Onde estou? \\nEstou em meio a uma névoa espessa. Parece haver alguém lá ao longe.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Sombra")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… Quem está aí?")
	await novel_interface.show_text_only("Lentamente, a pessoa se aproxima…")
	await novel_interface.show_text_only("É um homem estranho vestido de preto. Seus olhos são rosados e frios…")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Ele esconde um sorriso sexy em seus olhos.")
	await novel_interface.show_text_only("—Ele me dá uma sensação familiar.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Não até... quando... finalmente...", "Sombra")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("O que você está dizendo? \\nEi—! Espere!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Aah-!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("Ainda é antes do amanhecer. O sol não nasceu. Há apenas um feixe de luz vermelha suave no horizonte.")
	await novel_interface.show_text_only("Eu estava morto de cansaço ontem à noite e não me troquei antes de adormecer. Foi por isso que tive esse sonho?")
	await novel_interface.show_text_only("Abro os olhos e tento me lembrar do sonho. Mas simplesmente não consigo lembrar o que ele disse.")
	await novel_interface.show_dialog("Por que eu tive esse sonho? Algo é um mau presságio.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Ah! Você está acordado.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Você acordou tão cedo.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Algo está errado. Mariru acabou de ligar e pediu para lermos as novidades em seu e-mail!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Ah, tudo bem! \\nEla pode nos dar um tempo...", "Lian")
	await novel_interface.show_dialog("(Ótimo, Annie é o mesmo de sempre) \\n(Isso foi apenas um sonho, com certeza.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Soltei um suspiro de alívio e rapidamente me troquei. Sentado em frente ao computador, abro o link que Mariru me enviou.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Outro Substance H roubado! Que mundo conturbado…", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Mas aconteceu na Segunda Cidade Acadêmica. O que há com SID? \\nAlém disso…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Espere. O que é isso?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Embora no início da manhã, as notícias ganharam as manchetes em quase todos os sites de notícias do mundo.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Classe EX antiga Substance H tirada pelo homem misterioso que rouba a coleção e centro de pesquisa de Akatraz")
	await novel_interface.show_text_only("O aviso de procurado descreve um homem com idade entre 15 e 18 anos. \\nHá apenas uma foto do suspeito.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Ninguém está mais familiarizado com esse rosto do que eu.")
	await novel_interface.show_dialog("Este sou... eu?", "Lian")
	await novel_interface.show_text_only("Para ser exato, sou eu quando era menino.")
	await novel_interface.show_text_only("O aviso não divulga nenhum detalhe do Substance H. Ele recebeu uma classificação de perigo AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… Como isso é possível?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("O que diabos está acontecendo?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
