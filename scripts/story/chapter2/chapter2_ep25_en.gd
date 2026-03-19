# chapter2_ep25.gd - 第二章第25话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep25_script()

func play_script():
	pass

func chapter2_ep25_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	await novel_interface.show_text_only("Where am I? \\nI'm in a thick fog. There seems to be someone there in the distance.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Shadow")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… Who's there?")
	await novel_interface.show_text_only("Slowly, the person comes near…")
	await novel_interface.show_text_only("It’s a strange man in black. His eyes are pinkish and cold…")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("He hides a foxy smile in his eyes.")
	await novel_interface.show_text_only("—He gives me a familiar feeling.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Not until… when … finally…", "Shadow")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("What are you saying? \\nHey—! Wait!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Aah—!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("It's still before dawn. The sun hasn't come up. There's only a beam of soft red light on the horizon.")
	await novel_interface.show_text_only("I was dead tired last night, and didn't get changed before falling asleep. Is that why I had this dream?")
	await novel_interface.show_text_only("I open my eyes and try to recall the dream. But I just can't remember what he said.")
	await novel_interface.show_dialog("Why did I have that dream? Something bodes ill.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Ah! You're awake.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… You're up so early.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Something is wrong. Mariru just called in and asked us to read the news in her email!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Uh, fine! \\nCan’s she give us a break…", "Lian")
	await novel_interface.show_dialog("(Great, Annie is the same as usual) \\n(That was just a dream for sure.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("I let out a sigh of relief, and hurriedly get changed. Sitting in front of the computer, I open the link Mariru sent me.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Another Substance H stolen! What a troubled world…", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("But it happened in the Second Academy City. What's it with SID? \\nBesides…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Wait. What's this?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Though in the early morning, the news grabbed the headlines on almost all the news websites across the world.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Ancient EX-class Substance H Taken by Mysterious Man Burgling Akatraz's Collection and Research Center")
	await novel_interface.show_text_only("The wanted notice describes a man aged between 15 and 18. \\nThere's only a picture of the suspect.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("No one is more familiar with this face than I am.")
	await novel_interface.show_dialog("This is… me?", "Lian")
	await novel_interface.show_text_only("To be exact, it's me when I was a boy.")
	await novel_interface.show_text_only("The notice doesn't disclose any details of the Substance H. He’s been given a danger rating of AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… How is this possible?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("What the heck is going on?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
