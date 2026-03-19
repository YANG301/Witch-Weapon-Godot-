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
	await novel_interface.show_dialog("Olá. É hora de um teste!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Primeiro, nomeie as cores desses batons.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Err... Err... Esses nove batons... \\nTodos vermelhos né?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Espere, alguns deles são roxos, não são?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Você entendeu tudo errado!!", "Ai")
	await novel_interface.show_dialog("Pêssego, coral, magenta, cereja, roxo profundo, roxo claro, uva e lavanda. 0 ponto!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("A seguir, qual é a edição limitada do YYL para o Dia dos Namorados? \\nIsso é óbvio.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("O que, nenhum logotipo em lugar nenhum... \\nEste aqui tem um design em forma de coração?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Esse é o mais barato. As meninas vão se despedir imediatamente se receberem este no Dia dos Namorados. 0 ponto!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Agora preencha a lacuna: qual a textura desse protetor labial da MEC?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Textura? Veludo? \\nNão... sedoso?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("Qual é a palavra? \\nEu aprendi de cor, mas não consigo lembrar agora! Caramba!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("Não é bom... Você não tem isso em você!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("Eu não preciso ter isso…", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Ok, a última pergunta...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Qual é o nome da primeira fragrância abstrata? Qual é o preço da etiqueta?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Uh… eu esqueci totalmente! \\nPerfumes, você me pegou.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Seu preço... Uma garrafa tão pequena... \\nCerca de… 10 dólares?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Ops.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Errado! Tudo errado! \\nComo você é incrivelmente coxo!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Uau...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Hahaha.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! Pare de rir de mim!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
