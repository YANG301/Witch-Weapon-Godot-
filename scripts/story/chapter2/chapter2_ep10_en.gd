# chapter2_ep10.gd - 第二章第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep10_script()

func play_script():
	pass

func chapter2_ep10_script():
	novel_interface.change_music("res://assets/audio/music/Witch's Confession.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("After Lian leaves, Mariru stares at her handheld device with a grave expression.")
	await novel_interface.show_text_only("A long stream of shifting data unfolds before her eyes.")
	await novel_interface.show_text_only("The file on the screen, supposedly in a \"locked\" state, is changing.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(How can this be?! Aegis should be able to defend against any network attack.)\n(Could this be someone from the Senate...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Lian's entire history has turned into gibberish. As the screen flickers, the garbled text gradually corrects itself into meaningful information.")
	await novel_interface.show_text_only("From unreadable fragments to a fully coherent record, Aegis's offensive firewall never raises a single warning.")
	await novel_interface.show_text_only("On the face of Mariru's watch, a red letter \"T\" is blinking.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(A data rewrite on this scale is happening on the Aegis mainframe, and only \"Themis\" noticed the anomaly...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("On the handheld device, Lian's personal history has been completely updated.\nFrom kindergarten through middle school, she attended private schools.")
	await novel_interface.show_text_only("Report cards, diplomas, awards, medical records, insurance records...\nevery detail points to a wealthy, privileged family background.")
	await novel_interface.show_text_only("But not long ago, the girl's parents and older brother died in a plane crash overseas.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("Under the Postwar Child Welfare Act, an SS-rank scientist who had once registered as a volunteer was assigned as the girl's guardian...", "Mariru")
	await novel_interface.show_dialog("(Don't tell me even my own records got altered too!)\n(So this really is a provocation...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("One teacher's comment reads: \"She always likes to imitate her older brother's mannerisms and lacks the restraint expected of a young lady...\"")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(A forgery this thorough... I ought to make the information department study it properly.)", "Mariru")
	await novel_interface.show_dialog("(If they had assigned a different guardian, even I wouldn't have been able to tell whether it was real or fake.)\n(...Did they transplant someone else's records?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Looks like headquarters needs a proper anti-bug sweep.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(There's a photo below too?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("A photograph is attached to the record as one of the late parents' belongings.")
	await novel_interface.show_text_only("In the photo, the young Lian has short hair and is proudly showing off her drawing.")
	await novel_interface.show_text_only("The girl has drawn a little mermaid. In childish English handwriting at the lower right are the words: \"I have red hair too\"")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Hehehe... so that's how it is...", "Mariru")
	await novel_interface.show_dialog("Even if it's a composite photo, she really was adorable as a child~", "Mariru")
	await novel_interface.show_dialog("You gave her an airtight personal history.", "Mariru")
	await novel_interface.show_dialog("And at the same time, you were reminding me that this little one is special, weren't you?", "Mariru")
	await novel_interface.show_dialog("You never intended to hide anything from me from the very start.", "Mariru")
	await novel_interface.show_dialog("That's why you deliberately chose this drawing I made when I was little—", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("So those are the messages you wanted to convey to me...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
