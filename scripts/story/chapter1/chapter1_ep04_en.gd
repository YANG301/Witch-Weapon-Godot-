# chapter1_ep4.gd - Chapter 1 Episode 4
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep4_script()

func play_script():
	pass

func chapter1_ep4_script():
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-1.ogv"
	])
	await novel_interface.show_text_only("...")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("Hum…?",GameConfig.player_name)
	await novel_interface.show_dialog("(Huh...? What happened again...?)",GameConfig.player_name)
	await novel_interface.show_dialog("Ouch…",GameConfig.player_name)
	await novel_interface.show_dialog("(Right... I was attacked...)\n(And then I crawled into the shadow behind one of the exhibits...)",GameConfig.player_name)
	await novel_interface.show_dialog("Around me were slab-like objects.\n(Strange patterns and letters were carved into them...)",GameConfig.player_name)
	await novel_interface.show_dialog("(The exhibit placard says \"Miskatonic\"...)\n(I can't make out the rest.)",GameConfig.player_name)
	await novel_interface.show_dialog("Come to think of it... it's way too quiet...",GameConfig.player_name)
	await novel_interface.show_dialog("Did those people go somewhere else?",GameConfig.player_name)
	await novel_interface.show_dialog("Le… let me check around. \n The Conference Hall… Mariru…",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("This must be a dream… I suppose? \n What the heck is this all about?",GameConfig.player_name)
	await novel_interface.show_text_only("In a sea of fire, people are standing still like sculptures. \n Their postures are lively and expressions vivid…")
	await novel_interface.show_text_only("But they don't show the normal colors of human, and are all ghostly pale.")
	await novel_interface.show_dialog("H… how could this… be possible…",GameConfig.player_name)
	await novel_interface.show_dialog("No… \n What happened… to these people? And Ms. Mariru… Where is she?",GameConfig.player_name)
	await novel_interface.show_dialog("Please… someone tell me!",GameConfig.player_name)
	await novel_interface.show_text_only("I try to touch the frozen face of a woman, but her neck just breaks without a sound. Her head falls onto the floor and crushes into parts.")
	await novel_interface.show_dialog("It's… salt?",GameConfig.player_name)
	await novel_interface.show_dialog("Uh… No… \n Waaaah!",GameConfig.player_name)
	await novel_interface.show_dialog("Waaaah! \n Noooo!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# Call episode end function
	await novel_interface.end_story_episode(0.5)
