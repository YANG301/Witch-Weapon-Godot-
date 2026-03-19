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
	await novel_interface.show_text_only("這是哪裡？ \\n周圍彌漫著厚重的濃霧，遠方似乎站著一個人。")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("憐……", "黑影")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……是誰？")
	await novel_interface.show_text_only("那道身影逐漸向我走來……")
	await novel_interface.show_text_only("是一名穿著黑色奇怪衣著的傢伙，一雙冷淡的淺紅色眼睛……")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("那股眼神之中彷彿帶有一絲狡猾的笑意。")
	await novel_interface.show_text_only("——那個人，讓我有一種非常熟悉的感受。")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("直到……之時……終將……", "黑影")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("你說什麼？ \\n喂——！ 等等！")
	await novel_interface.show_text_only("……")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("啊——！", "小憐")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("窗外還是凌晨，太陽還沒升起。 天邊只有一抹柔和的紅光。")
	await novel_interface.show_text_only("昨天太過勞累，我沒換衣服就在床上睡死了。 所以才做了那個夢嗎……")
	await novel_interface.show_text_only("我睜開眼試圖回憶起夢裡的場景，卻無論如何都想不起那個人究竟說了什麼。")
	await novel_interface.show_dialog("怎麼會做這種夢，總有種不好的預感。", "小憐")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("啊！ 妳已經醒了嗎？", "安妮")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("安妮……妳起來的好早呢。", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("出事了！ 莉琉剛才打電話來叫我們看郵件裡的新聞！", "安妮")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("嗯，好的！ \\n真是不讓人休息啊……", "小憐")
	await novel_interface.show_dialog("（太好了，安妮還是和平時一樣，）\\n（那果然只是普通的夢。 ）", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("我鬆了一口氣，匆匆換上衣服坐到電腦旁，點開莉琉寄到郵件裡的新聞連結。")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("又有「異質物」失竊啦，真是一波未平一波又起……", "小憐")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("不過這不是第二學園都市嘛，關SID什麼事嘛？ \\n而且……", "小憐")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("……等等，這是什麼？ ！", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("雖然是凌晨，但世界各地網站的頭條全都更新了同樣的新聞內容。")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("神秘男性闖入阿卡特拉茲收容基地，奪走該基地收容的EX級古代「異質物」。")
	await novel_interface.show_text_only("釋出通緝資訊如下—性別：男性 年齡：15-18歲目前只有一張照片。")
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("通緝令中嫌疑犯的長相，我再熟悉不過了。")
	await novel_interface.show_dialog("這是……我？", "小憐")
	await novel_interface.show_text_only("確切來說，那是我還是男生時的樣子。")
	await novel_interface.show_text_only("通緝令中，該男子搶走的異質物並未公開，只是將它的危險等級定為AAA。")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("……為什麼會這樣？")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("到底……發生了什麼事？", "小憐")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
