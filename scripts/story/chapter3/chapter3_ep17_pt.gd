# chapter3_ep17.gd - 第三章第17话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter3_ep17_script()

func play_script():
	pass

func chapter3_ep17_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/School/BG_School_passage.png")
	novel_interface.show_character("anne_uniform","happy")
	await novel_interface.show_dialog("Bom dia, Ren! \\nPor que você está um pouco desanimado hoje...", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("Sim, depois de todos aqueles exames físicos ontem... \\nNão consegui dormir bem ontem à noite. Agora me sinto tonto…", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("É a cama? Talvez você não durma bem em camas novas?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("Nenhuma pista. Fiquei um pouco sem fôlego enquanto estava deitado na cama ...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sem fôlego? \\nEspere ... Que posição de dormir você usa?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("Bem, deitado de bruços como sempre faço.", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("O-De bruços ... \\nEssa posição não vai ajudá-los a crescer ...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("Ajudar o que crescer?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Vamos, Ren. Você é uma garota - você sabe o que quero dizer ... (cutucar).", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("Waaah ... ok ... \\nAcho que entendi agora ...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Parece que você ainda tem um longo caminho a percorrer, Ren…", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
