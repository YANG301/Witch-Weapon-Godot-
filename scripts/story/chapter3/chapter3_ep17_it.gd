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
	await novel_interface.show_dialog("Buongiorno, Ren! \\nPerché hai un aspetto un po' strano oggi...", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("Sì, dopo tutti i controlli fisici di ieri... \\nNon sono riuscito a dormire bene la notte scorsa. Adesso mi sento stordito...", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("E' il letto? Forse non dormi bene sui letti nuovi?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("Nessun indizio. Ero un po' senza fiato mentre ero a letto ...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Senza fiato? \\nAspetta ... Che posizione usi per dormire?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("Beh, sdraiato a pancia in giù, come faccio sempre.", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("O-A pancia in giù ... \\nQuella posizione non li aiuterà a crescere ...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("Aiutare cosa a crescere?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Andiamo, Ren. Sei una ragazza, sai cosa intendo ... (poke).", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("Waaah ... okay ... \\nPenso di aver capito ora ...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sembra che tu abbia ancora molta strada da fare, Ren...", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
