# chapter1_ep1.gd - 第1章第1話
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
		"『異質物』――特定の条件を満たした時、超常的な物理現象を引き起こす情報、または媒体。",
		"それらの現象は、次元・時空・精神といった既知の障壁に制限されない。",
		"長きにわたり、『異質物』は私達のすぐ傍らに潜み続けていた。",
		"その多くは日用品に似た外見をしているため、人に発見されにくかった。",
		"だが、特定の刺激を受ければ、人類の理解を超えた異常現象を引き起こす。",
		"人類という脆弱な種を守るため、私達はそれらが大衆の目に晒されることを必死に避けてきた。",
		"なぜなら、その異常の存在そのものが、今ある得難い秩序を揺るがしかねないからだ。"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("DA154墜落事故以来、\n『異質物』は世界各地で次々と発見されるようになった。","記録")
	await novel_interface.show_dialog("私達が積み上げてきた努力は、すべて水泡に帰した……","記録")
	await novel_interface.show_dialog("それを生み出した者が誰なのか、今なお誰にも分からない。","記録")
	await novel_interface.show_dialog("科学がその原理を解き明かすより前に、人々やメディアはそれを……『聖痕』と呼ぶことを好んだ。","記録")
	await novel_interface.show_dialog("人々は、それを神から授かった恩寵だと信じていた。","記録")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("しかし、強大な力を持つ『聖痕』の一部が兵器転用されるまでは。","記録")
	await novel_interface.show_dialog("再び人類は、自ら理解できもしない兵器を手に取り、ためらいもなく互いを殺し合い始めた。","記録")
	await novel_interface.show_dialog("その戦争は七年に及び……","記録")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("やがて『異質物』研究で世界最先端にあった六つの国家が、ついに平和条約を結んだ。","記録")
	await novel_interface.show_dialog("厭戦気分を強めた民衆を宥めると同時に、異質技術研究の無害性を宣伝するため。","記録")
	await novel_interface.show_dialog("六つの国家は一致して決議し、それぞれの首都に\n『学園都市』（Academy City）の呼称を与えた。","記録")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『学園都市』……なんとも皮肉な呼び名だ。"
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ アルカトラズ基地",
		"第二学園都市深部",
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
		"3日前……"
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ スティールマウント研究センター",
		"第五学園都市",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("[ff9900]イージス[-]認証システム起動しました", "システム音声")# ここは色付き表示対応
	await novel_interface.show_dialog("ただいまご案内致します。", "システム音声")
	await novel_interface.show_dialog("本人確認を行ってください。", "システム音声")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== 第1章第1話終了 ===")

	# エピソード終了処理
	await novel_interface.end_story_episode(0.5)
