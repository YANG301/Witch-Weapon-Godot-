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
	await novel_interface.show_dialog("Das war wirklich knapp...\nWir haben es endlich zurück geschafft~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", du bist verletzt!\nDein Arm blutet stark!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Mir geht es gut, es ist nur eine Schramme.\nDiese Art von Verletzung ist nichts für einen Mann!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Aber du bist im Moment offensichtlich ein Mädchen, also übertreibe dich nicht so sehr!\nUnd du hast dir auch den Knöchel verdreht, nicht wahr?...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Ja... Das ist eindeutig nicht einfach. Wenn wir dieses Problem nicht lösen, könnten\nmehr Menschen verletzt werden...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Pass bitte besser auf dich auf, okay?\nDein Arm blutet immer noch.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Das werde ich. Danke, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Aber... wir haben immer noch keine Hinweise...\nSollen wir weitermachen und den nächsten Bereich überprüfen?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Plötzlich vor ihr auftauchend) Du kleiner Bengel...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Dr. Mariru – ah nein, Commander!\nHaben Sie auf uns gewartet?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Wir wollten gerade das nächste Gebiet untersuchen...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Moment mal – hast du... gerade gegen etwas gekämpft?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Äh, ich habe nur... versucht, ein wenig zu helfen...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Ich erinnere mich noch genau, wie ich dir gesagt habe, du sollst dich nicht überfordern!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Wenn dir etwas Unkontrollierbares passieren würde, wäre das ein enormer Verlust für mich!\nSchau dich an – du bist bereits verletzt!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Ärzteteam! Wir haben hier ein verletztes Mädchen – behandeln Sie sie sofort und bringen Sie sie direkt zurück ins Hauptquartier!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", Commander Mariru scheint sich wirklich Sorgen um Sie zu machen...\nVielleicht sollten wir einfach...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Ja.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Eine leichte, unbeschreibliche Panik kroch leise in mein Herz.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
