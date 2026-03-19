# chapter2_ep20.gd - 第二章第20话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep20_script()

func play_script():
	pass

func chapter2_ep20_script():
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	await novel_interface.show_text_only("江森變電所，戰前建造的大型露天變電所，後來被第一學院都市的江森重工收購。")
	await novel_interface.show_text_only("這幾年，隨著「協議區」的用電需求暴增而不斷擴張，如今的容量已經擴大了20倍。")
	await novel_interface.show_text_only("我和安妮從鐵絲網的缺口處小心地進入變電所。")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("這就是定位點了，看起來有點糟……\\n我們來晚了嗎？", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("此時，變電所周圍回響著一片電流過載時特有的嗡嗡聲，電力裝置也不時噴出火花。")
	await novel_interface.show_text_only("地面和牆壁都有大片的樹狀焦痕，就像是被雷電侵蝕過……")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("這裡似乎沒有之前身處異變區域的感覺，莉琉該不會只是讓我們來維修變壓器吧？", "安妮")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("物理課的電子學部分最讓我頭痛了……", "安妮")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("安妮說話時聲音發抖，似乎回想起了被搞不清楚的左右手定律支配的恐懼。")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("等等，你聽——\n前面好像……", "小憐")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("什麼聲音？ ！", "小憐")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("在、在上面——", "安妮")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("我抬起頭，看到天上有一名全身電光環繞，手上戴著與體型不相稱的金屬拳套的藍髮少女——")
	await novel_interface.show_text_only("在她的周圍，一群舉止怪異的傢伙，正在輪番對她發動猛攻。")
	await novel_interface.show_text_only("其中一個女性身旁環繞著像鬼火一樣的東西。")
	await novel_interface.show_text_only("從咽喉中發出尖銳的咯咯聲，讓人本能地感到不悅。")
	await novel_interface.show_text_only("而其他人……或者說無法確定是不是人的存在，似乎被什麼支配著。")
	await novel_interface.show_text_only("在一輪輪的猛烈攻擊中，身體也隨著攻擊的動作扭曲成不可能的角度。")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("呼……哈、哈啊……", "伊露卡")
	novel_interface.character_dark()
	await novel_interface.show_text_only("藍髮的小姑娘受到輪番攻擊之下，\\n身上已經傷痕累累，只能勉強招架。")
	await novel_interface.show_text_only("不、與其說是少女，不如說是小女孩……\\n畢竟看她的外表，只有十歲左右的樣子。")
	await novel_interface.show_text_only("……呃，現在是糾結這種細節的時候嗎？")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("安妮，你看——", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("偉大……的……夕力Duマmーsmrti一ガハラ一\n微光……黃泉……咯咯咯咯……", "瘋狂的襲擊者") #伟大……的……夕力Důマmーsmrti一ガハラ一\n微光……黄泉……咯咯咯咯……有符号高度bug
	await novel_interface.show_dialog("全部…全部…全部…全部全部全部全部全部全部全部全部全部全部全部全部全部全部全部都！！！", "瘋狂的襲擊者")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("呃啊——！", "伊露卡")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("那個小女孩，看起來快撐不住了！", "安妮")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("這群傢伙——\\n給我住手！ ！", "小憐")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
