# chapter2_ex01.gd - 第二章番外1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex01_script()

func play_script():
	pass

func chapter2_ex01_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("哼哼～到了驗收結果的時候了！", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("來，先把這些口紅和對應的顏色名稱連起來！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("噫？這、這……這九隻口紅……\n不都是紅色的嗎！？", "小憐")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("等等，好像這幾支是紫色？", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("完全不對！ ！", "愛衣")
	await novel_interface.show_dialog("桃粉、珊瑚粉、洋紅、櫻桃紅、紫紅、淡紫、葡萄紫、薰衣草紫這麼基本的顏色都分不清楚，0分！", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("這些口紅裡，哪一支是yyl這次情人節的限量款？ \\n這可是送分題。", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("這？ 上面好歹要有yyl商標啊……\\n情人節的話，應該這個有小愛心的？", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("……居然選了最便宜的，情人節送這個就直接分手吧！ 0分！", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("填空題看來也沒希望了，總之，寫下MEC這款唇膏的質地吧。", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("質地……好像叫天鵝絨？ \\n不對……絲綢？", "小憐")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("啊！那個詞叫什麼來的？\n明明背過卻完全記不起來了！可惡！", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("哎～這孩子真是沒天分！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("有天分才奇怪吧！", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("最後再試一題好了……", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("第一款合成花香調的香水叫什麼名字，專櫃賣多少！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("呃呃……這部分完全忘記了！ \\n拿香水最沒辦法了～", "小憐")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("價格……這麼一小瓶…\n大概……50塊錢？", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("噗嗤～", "莉琉")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("答錯了！ 我的天啊！ \\n妳這方面真的完全不行欸！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("嗚嗚……", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("噗哈哈哈哈哈哈，太好笑了！", "莉琉")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("莉琉！ ！！ 妳還笑我！", "小憐")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
