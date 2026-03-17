# chapter1_ep1.gd - Chapter 1 Episode 1
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
		"『이물질』——특정 조건이 갖춰지면 초상적인 물리 현상을 일으키는 정보, 혹은 매개체.",
		"그 현상은 차원, 시공간, 정신 등 지금까지 알려진 어떤 장벽의 제약도 받지 않는다.",
		"오랫동안 『이물질』은 우리 곁에 조용히 숨어 있었다.",
		"대부분 일상용품과 비슷한 외형을 하고 있어 사람들에게 잘 발견되지 않았다.",
		"하지만 특정한 자극만 가해지면 인간의 이해를 초월하는 이상 현상을 일으킨다.",
		"이 나약한 종, 인류를 지키기 위해 우리는 그것들이 대중의 시야에 드러나는 일을 필사적으로 막아왔다.",
		"이런 이상 현상의 존재는 겨우 유지되고 있는 현 질서를 뒤흔들 수 있으니까!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("사고 번호 DA154의 추락 사고 이후,\n『이물질』이 세계 각지에서 잇따라 발견되기 시작했다.","기록")
	await novel_interface.show_dialog("우리가 쏟아부은 모든 노력은 수포로 돌아갔다……","기록")
	await novel_interface.show_dialog("그것들을 누가 만들어냈는지는 아무도 모른다.","기록")
	await novel_interface.show_dialog("과학이 아직 그 원리를 설명하지 못하던 시절, 사람들과 언론은 그것을……『기적』이라 부르기를 더 좋아했다.","기록")
	await novel_interface.show_dialog("사람들은 그것이 신이 내린 은총이라 믿었다.","기록")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("강대한 힘을 지닌 『기적』 일부가 무기화되기 전까지는.","기록")
	await novel_interface.show_dialog("그리고 다시 한 번, 인류는 자신조차 이해하지 못하는 무기를 집어 들고 서로를 향해 겨누기 시작했다.","기록")
	await novel_interface.show_dialog("그 전쟁은 무려 7년이나 이어졌고……","기록")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("마침내 『이물질』 연구 분야에서 가장 앞서 있던 여섯 나라가 평화 조약을 체결했다.","기록")
	await novel_interface.show_dialog("전쟁에 지친 민중을 달래는 동시에, 이물질 연구가 결코 위험하지 않다는 인상을 퍼뜨리기 위해서였다.","기록")
	await novel_interface.show_dialog("여섯 국가는 만장일치로 결의하여, 각자의 수도에\n『학원도시』（Academy City）라는 이름을 부여했다.","기록")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『학원도시』…… 참으로 아이러니한 이름이군."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ 알카트라즈 기지",
		"제2학원도시 심부",
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
		"3일 전……"
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ 스틸 마운트 수용 연구 센터",
		"제5학원도시",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("[ff9900]이지스[-] 식별 시스템이 기동되었습니다.", "시스템 음성")# color tags supported here
	await novel_interface.show_dialog("지금부터 안내를 시작하겠습니다.", "시스템 음성")
	await novel_interface.show_dialog("신원을 확인해 주십시오.", "시스템 음성")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
