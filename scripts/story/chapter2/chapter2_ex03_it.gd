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
	await novel_interface.show_dialog("Bella vasca da bagno. \\nMariru non si preoccupa davvero dei soldi...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ahh. \\nIl momento più rilassante dopo una lunga giornata.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Bene…", "Lian")
	await novel_interface.show_dialog("Questo... è il mio corpo?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Sembra bello e morbido al tatto... \\nCosì liscio al tatto...")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("Cosa sto facendo? \\nAffrontalo.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Prima di trovare un modo per tornare al vecchio me\\nQuesto è il mio corpo...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("Che bagno rilassante dopo aver combattuto tutto il giorno con nemici inaspettati!", "Lian")
	await novel_interface.show_dialog("Farei meglio a godermi questo momento. Che giornata estenuante!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ahh.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Non riesco ancora ad accettare la mia voce. Sembra un gattino che geme...", "Lian")
	await novel_interface.show_dialog("Dannazione! Questa voce è così...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Sporco...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Mhm...", "Lian")
	await novel_interface.show_dialog("Come posso abituarmi a questo corpo?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
