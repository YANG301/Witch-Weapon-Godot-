# side02_ep3.gd - 新年彩券屋篇第3话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	side03_ep3_script()

func play_script():
	pass

func side03_ep3_script():
	novel_interface.change_background("res://assets/images/bg/Struggle/BG_Jungle.png")
	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")
	novel_interface.show_character("iluka_uniform","unhappy")
	await novel_interface.show_dialog("呜呜……", "伊露卡")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("脚步声越来越近，像是一头野兽正在奔跑。")
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("狗狗，坐下！", "乔瑟特")
	await novel_interface.show_dialog("咦？是个这么小的女孩子呀？\n对不起哦，我是不是吓到你了？", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("mekako")
	await novel_interface.show_dialog("这是因为你在判明情况之前，就急着发动了反击。", "咩卡子")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("有句话不是说“百思不如一试”嘛。\n还是“先下手为强”来着？", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("iluka_uniform","speechless")
	await novel_interface.show_dialog("目标，判定，危险度，极高……", "伊露卡")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("mekako")
	await novel_interface.show_dialog("你算是被严加提防了。", "咩卡子")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("抱歉抱歉。\n啊，你是不是受了点伤？", "乔瑟特")
	await novel_interface.show_dialog("恢复道具应该在这……", "乔瑟特")
	await novel_interface.show_dialog("喏，这个给你♡", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("iluka_uniform","hungry")
	await novel_interface.show_dialog("！", "伊露卡")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("咦？你不喜欢巧克力吗？\n那我换成药品类的……", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("iluka_uniform","hungry")
	await novel_interface.show_dialog("伊露卡，喜欢，巧克力。", "伊露卡")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("少女接过巧克力，像小动物一样专注地吃了起来。")
	novel_interface.show_character("ren_battle","wry_smile")
	await novel_interface.show_dialog("伊露卡！\n真的是伊露卡！", "小怜")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("iluka_uniform","gourmet")
	await novel_interface.show_dialog("小怜姐姐……？", "伊露卡")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("ren_battle","happy")
	await novel_interface.show_dialog("你没事真是太好了。伊露卡，这些人虽然怪怪的，但不是坏人。", "小怜")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("josette")
	await novel_interface.show_dialog("你叫伊露卡呀。\n我是乔瑟特！你好♡", "乔瑟特")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("iluka_uniform","smile")
	await novel_interface.show_dialog("嗯！", "伊露卡")
	await novel_interface.hide_all_characters()
	novel_interface.show_character("ren_battle","perspire1")
	await novel_interface.show_dialog("（咦，咦？关系已经这么好了？是因为年龄相近吗？）", "小怜")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("（心情好像很高兴，又好像有点空落落的……？）", "小怜")
	
	

	print("=== 伊露卡联动剧情 结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
