# chapter1_ep1.gd - 第一章第1话
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
		"『异质物』——一旦满足特定条件，就能引发超常物理现象的信息或载体。",
		"这些现象不受任何维度、时空、心灵等已知壁障的限制。",
		"长久以来，『异质物』一直潜伏在周围。",
		"由于它们大多外形类似日常用品，很难被人发现。",
		"然而，只要受到特定的激发，它们就能引发超越人类理解范围的异常现象。",
		"为了保护人类这个脆弱的物种，我们一直在极力避免它们暴露在大众视野内。",
		"因为这些异常的存在将动摇现在来之不易的秩序！"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("自从事故编号DA154的那次坠机之后，\n『异质物』开始在世界各地不断的被发现。","记录")
	await novel_interface.show_dialog("我们的一切努力都化为乌有了……","记录")
	await novel_interface.show_dialog("没人知道谁制造了它们。","记录")
	await novel_interface.show_dialog("在科学还未能解释其原理之前，民众和媒体更喜欢称它们为……『神迹』。","记录")
	await novel_interface.show_dialog("人们相信这是神的恩赐。","记录")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("直到一些拥有强大力量的『神迹』被武器化。","记录")
	await novel_interface.show_dialog("再一次，人类毫不犹豫的拿起自己无法理解的武器开始互相厮杀。","记录")
	await novel_interface.show_dialog("而这场战争持续了7年……","记录")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("终于，六个在『异质物』研究领域最先进的国家达成和平条约。","记录")
	await novel_interface.show_dialog("为了应对厌战情绪高涨的民众，同时宣传异质技术研究的无害性。","记录")
	await novel_interface.show_dialog("这六个国家一致通过决议，对各自的首都启用了\n『学园都市』（AcademyCity）的称谓。","记录")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『学园都市』……真是个讽刺的称谓啊"
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ 阿卡特拉兹基地",
		"第二学园都市腹地",
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
		"三天前..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ 斯蒂尔蒙特收容研究中心",
		"第五学园都市",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("埃癸斯识别系统已启动。", "系统")#此处可以变色，但是没考虑到
	await novel_interface.show_dialog("正在为您服务。", "系统")
	await novel_interface.show_dialog("请核对您的身份。", "系统")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== 第一章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
