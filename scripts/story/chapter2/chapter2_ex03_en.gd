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
	await novel_interface.show_dialog("Nice bathtub. \\nMariru really doesn't care about money...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ahh. \\nThe most relaxing moment after a long day.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Well…", "Lian")
	await novel_interface.show_dialog("This... is my body?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Looks fair and feels soft... \\nSo smooth to the touch…")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("What am I doing? \\nFace it.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Before I find a way back to the old me\\nThis is my body...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("What a relaxing bath after fighting all day with unexpected enemies!", "Lian")
	await novel_interface.show_dialog("I’d better enjoy this moment. What an exhausting day!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ahh.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Still can't accept my voice. Sounds like a moaning kitty...", "Lian")
	await novel_interface.show_dialog("Damn it! This voice is so...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Dirty...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Hm…", "Lian")
	await novel_interface.show_dialog("How can I get used to this body?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
