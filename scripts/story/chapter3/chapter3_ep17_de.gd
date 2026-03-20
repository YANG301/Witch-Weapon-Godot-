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
	await novel_interface.show_dialog("Morgen, Ren! \\nWarum siehst du heute ein bisschen dämlich aus?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("Ja, nach all den körperlichen Untersuchungen gestern… \\nKonnte letzte Nacht nicht gut schlafen. Jetzt fühle ich mich benommen ...", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Ist es das Bett? Vielleicht schlafen Sie in neuen Betten nicht gut?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("Keine Ahnung. Ich war etwas außer Atem, als ich im Bett lag ...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Außer Atem? \\nWarten Sie ... Welche Schlafposition verwenden Sie?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("Nun, ich liege auf dem Bauch, so wie ich es immer tue.", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("O-Auf deinem Bauch ... \\nDiese Position wird ihnen nicht beim Wachsen helfen ...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("Helfen Sie, was zu wachsen?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Komm schon, Ren. Du bist ein Mädchen – du weißt, was ich meine ... (stupsen).", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("Waaah ... okay ... \\nIch glaube, ich verstehe es jetzt ...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sieht so aus, als hättest du noch einen langen Weg vor dir, Ren ...", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
