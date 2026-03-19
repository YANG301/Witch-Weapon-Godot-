# chapter2_ep10.gd - 第二章第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep10_script()

func play_script():
	pass

func chapter2_ep10_script():
	novel_interface.change_music("res://assets/audio/music/Witch's Confession.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("……", "莉琉")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("小憐離開後，莉琉神色凝重地盯著手持裝置。")
	await novel_interface.show_text_only("在莉的眼前展現的，是一長串變化的資料流。")
	await novel_interface.show_text_only("螢幕上那份處於「鎖定」狀態的檔案，正在發生變化。")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("（怎麼會！ 埃癸斯應該可以防禦任何網路攻擊啊！ )\\n(難道是元老院的人……）", "莉琉")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("「憐」的歷史記錄全都變成了亂碼，隨著螢幕的閃爍，亂碼逐漸被修改為有意義的資訊。")
	await novel_interface.show_text_only("從無法解析到逐漸完善，埃癸斯主機外部的攻擊性防火牆始終沒有發出任何警告。")
	await novel_interface.show_text_only("莉琉的手錶錶面上有一個紅色的字母「T」在閃爍。")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("（埃癸斯主機上發生這種規模的資料篡改，只有「Themis」注意到了異常嗎……）", "莉琉")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("螢幕上顯示，「憐」的歷史記錄已完全更新了，\\n從幼稚園、小學到中學都就讀於私立學校。")
	await novel_interface.show_text_only("成績單、畢業證書、得獎記錄、醫療和保險記錄……處處都展現著她來自優越富足的家庭。")
	await novel_interface.show_text_only("但是前不久少女的雙親和哥哥在海外遭遇事故墜機身亡。")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("根據《戰後兒童保育法》，曾登記為志願者的SS級科學家被分配成為了少女的監護人……", "莉琉")
	await novel_interface.show_dialog("（連我的記錄都……）\\n（這是在挑釁嗎？ ）", "莉琉")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("教師評語上還寫著「總是喜歡模仿哥哥的動作，缺乏作為女孩子的矜持……」")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("（偽造到這種程度，真該讓資訊部門的人好好學學！ ）", "莉琉")
	await novel_interface.show_dialog("（如果換成別的監護人，大概連我都無法分辨真偽了。 ）\\n（……是移植了別人的資料嗎？ ）", "莉琉")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("（看來總部要好好做一次反竊聽的掃描行動了。 ）", "莉琉")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("（嗯？ 下面還有張照片？ ……）", "莉琉")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("……！ ！", "莉琉")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("記錄中有一張照片附件，是少女雙親的遺物。")
	await novel_interface.show_text_only("照片上，幼時的小憐一頭短髮，正在得意地展示著她的畫作。")
	await novel_interface.show_text_only("女孩畫的是小美人魚，右下角用稚氣的字型寫著一行英文「I have red hair too」。")
	await novel_interface.show_dialog("……", "莉琉")
	await novel_interface.show_dialog("呵呵呵呵，原來是這樣……", "莉琉")
	await novel_interface.show_dialog("雖然是合成的照片，但小時候的樣子還真可愛～", "莉琉")
	await novel_interface.show_dialog("既然特別在我面前為她打造了天衣無縫的歷史記錄，", "莉琉")
	await novel_interface.show_dialog("是想提醒我，這個小傢伙很特別吧？", "莉琉")
	await novel_interface.show_dialog("你一開始就不打算隱瞞我。", "莉琉")
	await novel_interface.show_dialog("所以才特意選了這張我小時候畫的畫——", "莉琉")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("你想傳達給我的資訊就是這些嗎……", "莉琉")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("埃癸斯……", "莉琉")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
