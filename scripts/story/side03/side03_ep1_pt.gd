# side02_ep1.gd - 新年彩券屋篇第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	side03_ep1_script()

func play_script():
	pass

func side03_ep1_script():
	novel_interface.change_background("res://assets/images/bg/Struggle/BG_Plain.png")
	novel_interface.change_music("res://assets/audio/music/unkown/UI_Main_Funk.mp3")
	novel_interface.show_character("ren_battle","sob")
	await novel_interface.show_dialog("呃……这里究竟是……？", "小怜")
	novel_interface.character_move_left(-0.25)
	novel_interface.character_dark()
	novel_interface.show_2nd_character("josette","",0.25)
	await novel_interface.show_dialog("啊，你醒啦。", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("mekako")
	await novel_interface.show_dialog("人类……失落亚人……数据不一致……无法判明种族？", "咩卡子")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("你，你是，你哪位？！\n从哪冒出来的？！", "小怜")
	await novel_interface.show_dialog("袭击我的都是谁？！\n到底想干什么？！", "小怜")
	await novel_interface.show_dialog("这里又是哪啊？！", "小怜")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("乖，乖……好啦，别着急，我不会伤害你的♡", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("mekako")
	await novel_interface.show_dialog("打了这么多场，身体也吃不消了吧？", "咩卡子")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("ren_battle","normal2")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("josette","",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("抱歉……我也是慌神了……", "小怜")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("没关系哦，我原谅你♡\n先介绍下自己吧？我是乔瑟特！", "乔瑟特")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……我叫小怜，你好。", "小怜")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("小怜你好呀。\n这下我又交到女生朋友啦♡", "乔瑟特")
	novel_interface.character_light(0.35,"shy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("啊不……我其实是……", "小怜")
	await novel_interface.show_dialog("（虽然她没有恶意，但是被称作女生朋友，还是感觉怪怪的……）", "小怜")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("（哎，算了。目前最好还是别戳破……）", "小怜")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("嗯？有什么烦心事吗？\n还是真的哪里受伤了？", "乔瑟特")
	novel_interface.character_light(0.35,"perspire1")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("没，没什么啦！\n……今后请多关照！", "小怜")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("？", "乔瑟特")
	novel_interface.character_light(0.35,"sob")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("（记不太清了，但我是不是又被卷进了什么麻烦事里……？）", "小怜")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("mekako")
	await novel_interface.show_dialog("（……看来一回到据点就得分析研究所的数据。）", "咩卡子")
	await novel_interface.hide_all_characters()
	
	

	print("=== 小怜联动剧情 结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
