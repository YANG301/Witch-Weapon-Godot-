# chapter1_ep1.gd - 第一章第1話
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep1_script()

func play_script():
	pass

func chapter1_ep1_script():
	novel_interface.change_music("res://assets/audio/music/Hero.mp3")
	await novel_interface.enter_center_performance_mode([
		"『異質物』——在滿足特定條件後，便會引發超常物理現象的資訊或載體。",
		"這些現象不受任何維度、時空、心靈等已知屏障的限制。",
		"長久以來，『異質物』一直潛伏在我們周遭。",
		"由於它們大多外形類似日常用品，很難被人發現。",
		"然而，只要受到特定刺激，它們就能引發超越人類理解範圍的異常現象。",
		"為了保護人類這個脆弱的物種，我們一直在極力避免它們暴露在大眾視野內。",
		"因為這些異常的存在將動搖現在來之不易的秩序！"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("自從事故編號DA154的那次墜機之後，\n『異質物』開始在世界各地不斷的被發現。","記錄")
	await novel_interface.show_dialog("我們的一切努力都化為烏有了……","記錄")
	await novel_interface.show_dialog("沒有人知道究竟是誰製造了它們。","記錄")
	await novel_interface.show_dialog("在科學尚未能解釋其原理之前，民眾與媒體更傾向稱它們為……『神蹟』。","記錄")
	await novel_interface.show_dialog("人們相信這是神所賜下的恩典。","記錄")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("直到一些擁有強大力量的『神蹟』被武器化。","記錄")
	await novel_interface.show_dialog("再一次，人類毫不猶豫地拿起自己無法理解的武器，開始互相廝殺。","記錄")
	await novel_interface.show_dialog("而這場戰爭，足足持續了七年……","記錄")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("終於，六個在『異質物』研究領域最先進的國家達成和平條約。","記錄")
	await novel_interface.show_dialog("為了安撫厭戰情緒高漲的民眾，同時宣傳異質物研究的無害性。","記錄")
	await novel_interface.show_dialog("這六個國家一致通過決議，將各自的首都\n統一冠上『學園都市』（Academy City）的稱號。","記錄")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『學園都市』……真是諷刺的稱呼啊。"
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ 阿卡特拉茲基地",
		"第二學園都市腹地",
		40,
		30,
		Vector2(68,460),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00001_1.ogv",
		"res://assets/video/00001_2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")
	await novel_interface.enter_center_performance_mode([
		"三天前……"
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ 斯蒂爾蒙特收容研究中心",
		"第五學園都市",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("埃癸斯識別系統已啟動。", "系統語音")# 這裡可改變顏色，但目前未處理
	await novel_interface.show_dialog("正在為您提供服務。", "系統語音")
	await novel_interface.show_dialog("請確認您的身份。", "系統語音")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== 第一章第1話結束 ===")

	# 調用劇情結束函數
	await novel_interface.end_story_episode(0.5)


