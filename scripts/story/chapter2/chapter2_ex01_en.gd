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
	await novel_interface.show_dialog("Hello. Time for a quiz!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("First, name the colors of these lipsticks.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Err... Err... These nine lipsticks... \\nAll red, right?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Wait, some of them are purple, aren’t they?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("You got them all wrong!!", "Ai")
	await novel_interface.show_dialog("Peach, coral, magenta, cherry, deep purple, pale purple, grape, and lavender. 0 point!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Next, which one is the YYL limited edition for Valentine’s Day? \\nThis is a no-brainer.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("What, no logo anywhere... \\nThis one with a heart shape design?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("That's the cheapest one. Girls will say goodbye right away if they receive this one on Valentine’s Day. 0 point!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Now fill in the blank: what's the texture of this MEC lip balm?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Texture? Velvet? \\nNo... silky?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("What's the word? \\nI did learn by heart but just can't remember it now! Damn it!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("No good... You don’t have it in you!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("I don't need to have it…", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Okay, the last question...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("What's the name of the first-ever abstract fragrance? What's its label price?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Uh… I totally forgot! \\nPerfumes, you’ve got me.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Its price... Such a tiny bottle... \\nAround… 10 bucks?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Oops.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Wrong! All wrong! \\nHow incredibly lame you are!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Waaaah...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Hahaha.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! Stop laughing at me!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
