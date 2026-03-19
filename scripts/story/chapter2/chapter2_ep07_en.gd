# chapter2_ep07.gd - 第二章第7话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep07_script()

func play_script():
	pass

func chapter2_ep07_script():
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/other/BG_City_street2.png")
	novel_interface.show_character("ren_battle","gratified")
	await novel_interface.show_dialog("That was really close...\nWe finally made it back~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", you're hurt!\nYour arm is bleeding a lot!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("I'm fine, it's just a scrape.\nThis kind of injury is nothing to a guy!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("But you're obviously a girl right now, so don't push yourself so hard!\nAnd you twisted your ankle too, didn't you...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Yeah... this clearly isn't simple. If we don't solve all this trouble,\nmore people might end up getting hurt...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Please, take better care of yourself, okay?\nYour arm is still bleeding.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("I will. Thanks, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("But... we still don't have any leads...\nShould we keep going and check the next area?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Suddenly appearing in front of her) You little brat...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Dr. Mariru—ah, no, Commander!\nWere you waiting for us?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("We were just about to go investigate the next area...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Wait a second—did you... just fight something?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Uh, I only... tried to help a little...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("I distinctly remember telling you not to push yourself!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("If anything uncontrollable happened to you, that would be a tremendous loss for me!\nLook at you—you're already hurt!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Medical team! We have an injured girl here—treat her at once and bring her straight back to HQ!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", Commander Mariru seems really worried about you...\nMaybe we should just...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Yeah.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("A faint, indescribable panic quietly crept into my heart.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
