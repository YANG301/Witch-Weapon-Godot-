# chapter2_ep20.gd - 第二章第20话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep20_script()

func play_script():
	pass

func chapter2_ep20_script():
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	await novel_interface.show_text_only("Johnson Substation was a massive open-air facility built before the war, later acquired in full by Johnson Heavy Industries of the First Academy City.")
	await novel_interface.show_text_only("Over the past few years, power demand in the 'Agreement Zone' has surged so sharply that the substation's capacity has now been expanded twentyfold.")
	await novel_interface.show_text_only("Annie and I slip carefully into the substation through a gap in the wire fence.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("This is the designated point, huh... It looks pretty bad here.\nAre we too late?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("A telltale hum of overloaded current echoes around the substation, and sparks spit from the electrical equipment every so often.")
	await novel_interface.show_text_only("The ground and walls are covered in branching burn marks, as if they had been clawed by lightning...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("This doesn't feel like the other anomaly zones at all. Mariru isn't seriously expecting us to repair transformers, is she?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("The electricity unit in physics class... that's the part that gives me the worst headache...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Annie's voice trembles as if she has just recalled the terror of never being able to tell the left-hand rule from the right-hand one.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Wait, listen—\nUp ahead...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("What was that?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-Up there—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("I look up and see a blue-haired girl in the air, wreathed in electricity, wearing metal gauntlets far too large for her small frame—")
	await novel_interface.show_text_only("Around her, a group of strangely acting figures are taking turns launching savage attacks.")
	await novel_interface.show_text_only("One of them is a woman surrounded by things that look like ghostly flames.")
	await novel_interface.show_text_only("A shrill clacking sound spills from her throat, instinctively setting my teeth on edge.")
	await novel_interface.show_text_only("And the others... or whatever they are, because I'm not even sure they're human, seem to be controlled by something.")
	await novel_interface.show_text_only("As wave after wave of attacks crash down, even their bodies twist into impossible angles along with their movements.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Hah... h-haah...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Under the relentless assault, the blue-haired little girl is already covered in wounds and can only barely keep defending herself.")
	await novel_interface.show_text_only("No... calling her a girl might even be too much. She's more like a child... she looks only about ten years old.")
	await novel_interface.show_text_only("...Uh, is this really the time to be getting hung up on that detail?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, look—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("The... great... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Mad Attacker")
	await novel_interface.show_dialog("All of them... all of them... all of them... EVERY LAST ONE OF THEM!!!", "Mad Attacker")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ugh—!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("That little girl can't hold out much longer!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("You bastards—\nStop right there!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
