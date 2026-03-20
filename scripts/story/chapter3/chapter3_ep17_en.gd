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
	await novel_interface.show_dialog("Morning, Ren! \\nWhy do you look a bit off today…", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("Yea, after all those physical checkups yesterday… \\nCouldn’t sleep well last night. Now I feel woozy…", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Is it the bed? Perhaps you don’t sleep well on new beds?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("No clue. I was a little out of breath while I was lying in bed...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Out of breath? \\nWait... What sleeping position do you use?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("Well, lying on my stomach just as I always do.", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("O-On your stomach... \\nThat position won't help them grow...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("Help what grow?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Come on, Ren. You're a girl—you know what I mean... (poke).", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("Waaah... okay... \\nI think I get it now...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Looks like you still have a long way to go, Ren…", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
