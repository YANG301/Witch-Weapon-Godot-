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
	await novel_interface.show_dialog("小憐早安～\\n妳看起來有點沒精神欸……", "安妮")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("啊～昨天被體檢折騰得快死了，\\n晚上也沒睡好，頭暈暈的……", "小憐")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……妳會認床嗎？", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("我也不知道，總覺得睡覺時有點喘不過氣……", "小憐")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("喘不過氣？ \\n等等……妳用什麼姿勢睡覺啊？", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("就像平時那樣趴在床上睡啊。", "小憐")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("趴……趴著……\\n這樣會長不大啦！", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("什麼長不大啊……", "小憐")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("拜託！ 妳也該開始有點女生的自覺了吧～（戳戳）", "安妮")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("嗚！ 好吧……\\n我好像明白問題在哪裡了……", "小憐")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("哎……看來妳需要適應的地方還有很多呢～", "安妮")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
