# chapter1_ep1.gd - Chapter 1 Episode 1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep1_script()

func play_script():
	pass

func chapter1_ep1_script():
	novel_interface.change_music("res://assets/audio/music/Hero.mp3")
	await novel_interface.enter_center_performance_mode([
		"\"Substance H\"—information or a medium capable of triggering supernatural physical phenomena once specific conditions are met.",
		"Those phenomena are not constrained by any known barrier—dimension, spacetime, mind, or otherwise.",
		"For a very long time, Substance H lay hidden all around us.",
		"Because most of it resembled ordinary everyday objects, it was extremely difficult to detect.",
		"And yet, once stimulated in the right way, it could unleash anomalies beyond the limits of human understanding.",
		"To protect humanity—this fragile species—we have done everything in our power to keep it out of public view.",
		"Because the mere existence of such anomalies could shake the hard-won order of the present world!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Ever since the DA154 crash, reports of Substance H have been surfacing all over the world.","Record")
	await novel_interface.show_dialog("Everything we did to keep them hidden was undone...","Record")
	await novel_interface.show_dialog("No one knows who created them.","Record")
	await novel_interface.show_dialog("Before science could explain how they worked, the public and the media preferred to call them... \"miracles.\"","Record")
	await novel_interface.show_dialog("People believed they were gifts from God.","Record")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("That was, until some of those \"miracles\" were weaponized.","Record")
	await novel_interface.show_dialog("Once again, humanity took up weapons it did not understand and turned them on itself.","Record")
	await novel_interface.show_dialog("And that war lasted seven years...","Record")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("At last, the six nations leading the world in Substance H research signed a peace treaty.","Record")
	await novel_interface.show_dialog("To placate a war-weary public, and to promote the supposed harmlessness of Substance H research,","Record")
	await novel_interface.show_dialog("the six nations jointly resolved to rename their capitals\n\"Academy Cities.\"","Record")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"\"Academy City\"... What an ironic name."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Alcatraz Base",
		"Second Academy City Center",
		40,
		30,
		Vector2(68,460),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00001_1.ogv",
		"res://assets/video/00001_2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")
	await novel_interface.enter_center_performance_mode([
		"Three days ago..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"Steele Monte Containment and Research Center",
		"Fifth Academy City",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("[ff9900]Aegis[-] identification system activated", "System Voice")# color tags supported here
	await novel_interface.show_dialog("At your service.", "System Voice")
	await novel_interface.show_dialog("Please verify your identity.", "System Voice")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# Call episode end function
	await novel_interface.end_story_episode(0.5)
