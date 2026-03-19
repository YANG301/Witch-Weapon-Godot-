# chapter2_ep01.gd - 第二章第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep01_script()

func play_script():
	pass

func chapter2_ep01_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/spSoundChannel.png")
	await novel_interface.show_dialog("What did you say?! The defensive perimeter of 'Aegis' clearly falls under the jurisdiction of our Metropolitan Defense Bureau (MD)!", "Defense Bureau Officer")
	await novel_interface.show_dialog("On what grounds are you taking over command?\nUnless you give me a convincing reason, don't expect me to lift the police blockade!!", "Defense Bureau Officer")
	await novel_interface.show_dialog("It's classified. I neither can nor need to explain it to you!", "Military Officer")
	await novel_interface.show_dialog("This is now a matter for the military.\nYou will cooperate.", "Military Officer")
	await novel_interface.show_dialog("I refuse! This operation is under the Defense Bureau's command!!\nNot unless there's an administrative order from the Senate...!", "Defense Bureau Officer")
	await novel_interface.show_dialog("Ahem, let me say this...", "Female Voice")
	await novel_interface.show_dialog("You're still wasting time on something this pointless?", "Female Voice")
	await novel_interface.show_dialog("That voice is—\nMariru... Officer Mariru?!", "Military Officer")
	await novel_interface.show_dialog("Y-yes, ma'am!", "Military Officer")
	await novel_interface.show_dialog("The Secret Intelligence Division broke away from the military long ago, so you don't need to call me 'Officer.'", "Mariru")
	await novel_interface.show_dialog("Mariru... Hmph!", "Defense Bureau Officer")
	await novel_interface.show_dialog("This is a level-4 encrypted communication!!\nHow did you even...", "Defense Bureau Officer")
	await novel_interface.show_dialog("Forget that trivial detail for now~\nThink about how we're going to handle the situation in front of us.", "Mariru")
	await novel_interface.show_dialog("If this is a level-4 encrypted channel, then speak plainly. No one else is listening in here anyway—", "Mariru")
	await novel_interface.show_dialog("I want all intelligence disclosed!!", "Mariru")
	await novel_interface.show_dialog("Y-yes, ma'am!", "Military Officer")
	await novel_interface.show_dialog("At present, all surveillance systems around the research center have failed, and we've detected large-scale spacetime fluctuations...", "Military Officer")
	await novel_interface.show_dialog("Spacetime fluctuations?\nWhat does that mean...?", "Defense Bureau Officer")
	await novel_interface.show_dialog("The Urban Disaster Countermeasures Act states it quite clearly, doesn't it...?", "Mariru")
	await novel_interface.show_dialog("Don't tell me the Defense Bureau doesn't even bother reading classified statutes just because they're not open to the public?", "Mariru")
	await novel_interface.show_dialog("Ugh... D-don't tell me this is...\na containment failure involving 'Substance H'...?", "Defense Bureau Officer")
	await novel_interface.show_dialog("And on top of that, the Ross Goblet suddenly vanished last night...", "Mariru")
	await novel_interface.show_dialog("...Nothing like this has happened in New Opulentia for six years, has it?", "Mariru")
	await novel_interface.show_dialog("You need to consider the worst-case scenario—", "Mariru")
	await novel_interface.show_dialog("I-I understand...", "Defense Bureau Officer")
	await novel_interface.show_dialog("We'll lift the inner lockdown at once and evacuate civilians under the guise of a drill...", "Defense Bureau Officer")
	await novel_interface.show_dialog("Good. How are the military's outer deployments coming along?", "Mariru")
	await novel_interface.show_dialog("Special operations units are deploying heavy firepower within a two-kilometer radius around the anomaly zone, but we still can't confirm the threat level.", "Military Officer")
	await novel_interface.show_dialog("What about media control?", "Mariru")
	await novel_interface.show_dialog("Per protocol, we're executing C-13.", "Military Officer")
	await novel_interface.show_dialog("Good. Then from this moment on, the Secret Intelligence Division (SID) will take over the anomaly core zone.", "Mariru")
	await novel_interface.show_dialog("You all move out immediately as well!", "Mariru")
	await novel_interface.show_dialog("Yes!", "Military Communication")
	await novel_interface.show_dialog("A-all right...\nYou'd better be careful yourselves.", "Defense Bureau Officer")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
