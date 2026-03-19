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
	await novel_interface.show_dialog("Belle baignoire. \\nMariru ne se soucie vraiment pas de l'argent...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ahh. \\nLe moment le plus relaxant après une longue journée.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Eh bien…", "Lian")
	await novel_interface.show_dialog("C'est mon corps ?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("A l'air juste et doux au toucher... \\nSi doux au toucher…")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("Qu'est-ce que je fais ? \\nFaites-y face.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Avant de trouver un moyen de revenir à mon ancien moi\\nVoici mon corps...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("Quel bain relaxant après avoir combattu toute la journée avec des ennemis inattendus !", "Lian")
	await novel_interface.show_dialog("Je ferais mieux de profiter de ce moment. Quelle journée épuisante !", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ahh.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Je ne peux toujours pas accepter ma voix. On dirait un chat gémissant...", "Lian")
	await novel_interface.show_dialog("Bon sang ! Cette voix est tellement...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Sale...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Hum…", "Lian")
	await novel_interface.show_dialog("Comment puis-je m'habituer à ce corps ?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
