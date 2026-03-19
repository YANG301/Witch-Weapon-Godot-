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
	await novel_interface.show_dialog("Bela banheira. \\nMariru realmente não se importa com dinheiro...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ah. \\nO momento mais relaxante depois de um longo dia.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Bem…", "Lian")
	await novel_interface.show_dialog("Este... é o meu corpo?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Parece justo e macio... \\nTão suave ao toque…")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("O que estou fazendo? \\nEnfrente isso.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Antes de encontrar um caminho de volta ao antigo eu\\nEste é o meu corpo...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("Que banho relaxante depois de lutar o dia todo com inimigos inesperados!", "Lian")
	await novel_interface.show_dialog("É melhor aproveitar este momento. Que dia cansativo!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ah.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Ainda não consigo aceitar minha voz. Parece um gatinho gemendo...", "Lian")
	await novel_interface.show_dialog("Droga! Essa voz é tão...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Sujo...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Hum…", "Lian")
	await novel_interface.show_dialog("Como posso me acostumar com esse corpo?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
