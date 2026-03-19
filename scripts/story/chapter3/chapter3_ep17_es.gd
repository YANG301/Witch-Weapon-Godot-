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
	await novel_interface.show_dialog("小怜早上好啊！~\n你怎么有点无精打采的……", "安妮")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("啊呜……昨天被体检折腾的乱七八糟的\n昨晚也没睡好，脑袋晕晕的……", "小怜")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("莫非……你是在陌生的床上睡不着的类型？", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("我也不知道，总觉得在床上有点喘不过气……", "小怜")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("喘不过气？\n等等……你一般是什么姿势睡觉啊", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("就像平时那样趴在床上睡嘛……", "小怜")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("趴……趴着……\n这样可长不大啊……", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("什么长不大啊……", "小怜")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("拜托小怜也有点作为女生的自觉啦~（戳戳）", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("呜！……好吧……\n我好像明白问题所在了……", "小怜")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("哎……看来你需要适应的地方还有很多呢~", "安妮")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
