# side02_ep2.gd - 新年彩券屋篇第2话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	side03_ep2_script()

func play_script():
	pass

func side03_ep2_script():
	novel_interface.change_background("res://assets/images/bg/Struggle/BG_Plain.png")
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.show_character("anne_normal","worry")
	await novel_interface.show_dialog("好痛…… 到底怎么回事……", "安妮")
	novel_interface.change_expression("panic")
	await novel_interface.show_dialog("咦？ 这……是哪？\n好多没见过的生物……", "安妮")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("（莫非又来到了不同的时代……）", "安妮")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("ren_battle","shout")
	await novel_interface.show_dialog("安妮？ 还真是安妮！\n你没事吧？", "小怜")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("anne_normal","panic")
	await novel_interface.show_dialog("小怜？", "安妮")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("哈哈，什么啊，原来小怜也在啊……\n太好了……", "安妮")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("突然，一阵激昂的咆哮声在耳畔炸开。这么强烈的声响只有在电影里听到过。")
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("呀，在这在这！\n小怜和姐姐都没事吧~？", "乔瑟特")
	await novel_interface.show_dialog("我们突然遭到袭击，所以反击回去了，你们没有受伤吧？", "乔瑟特")
	novel_interface.character_move_left(-0.25)
	novel_interface.character_dark()
	novel_interface.show_2nd_character("anne_normal","panic",0.25)
	await novel_interface.show_dialog("你是……小朋友？", "安妮")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("我叫乔瑟特！是小怜的朋友哦。\n既不是怪人也不是敌人，你放心好了♡", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("mekako")
	await novel_interface.show_dialog("乔瑟特，周围还有许多危险生物。\n请避免轻率行动。", "咩卡子")
	await novel_interface.show_dialog("（人类……失落亚人……数据不一致……无法判明种族？）", "咩卡子")
	await novel_interface.show_dialog("（但是，确实可以检测到与小怜的亲和值。）", "咩卡子")
	await novel_interface.show_dialog("您好，我是咩卡子。\n由于当前形式不利，我们稍后再共享信息。", "咩卡子")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("anne_normal","happy")
	await novel_interface.show_dialog("小怜你……\n好像又被卷进麻烦事了呢。", "安妮")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("虽然我有很多想问你的事情，但还是从眼前的问题开始解决吧！", "安妮")
	
	
	

	print("=== 安妮联动剧情 结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
