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
	await novel_interface.show_text_only("여긴 어디지,\\n주위에 짙은 연기가 가득하다.\\n멀리 한 사람이 서있는 것 같다.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("렌……", "검은 그림자")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……누구지?")
	await novel_interface.show_text_only("그 인영이 천천히 내게 걸어온다……")
	await novel_interface.show_text_only("이상한 검은색 옷을 입은 녀석은 차가운 붉은색 눈동자를 가지고 있다……")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("그 눈빛 속에 교활한 조롱기가 담겨있다.")
	await novel_interface.show_text_only("——저 사람,왠지 익숙한 느낌이 들어.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("그 날이…되면…결국……", "검은 그림자")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("뭐라고?\\n이봐——!기다려!")
	await novel_interface.show_text_only("……")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("아——!", "샤오롄")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("창밖을 보니 아직 새벽이다. 해가 곧 뜨려는지 하늘가에 부드러운 붉은빛이 엿보인다.")
	await novel_interface.show_text_only("어제 너무 피곤한 나머지 옷도 못 갈아입고 잠이 들었는데,그래서 그런 꿈을 꾼 걸까?")
	await novel_interface.show_text_only("눈을 뜨고 꿈 속 장면을 떠올려봤지만 그 사람의 말이 기억나지 않는다.")
	await novel_interface.show_dialog("이런 꿈을 꾸다니,불길한 느낌이 든다.", "샤오롄")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("아!일어났구나?", "앤")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("앤……일찍 일어났네?", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("큰일이야!마리루가 방금 전화로 이메일을 확인하라고 했어!", "앤")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("응,알았어!\\n정말 한시도 못 쉬게 한다니까……", "샤오롄")
	await novel_interface.show_dialog("(다행이다. 앤은 평소와 똑같아.)\\n(역시 꿈일 뿐이였어.)", "샤오롄")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("나는 한숨을 쉬고 옷을 갈아입은 뒤 컴퓨터에 앉아 이메일 링크를 클릭했다.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("또 『이물질』 도난 사건인가. 정말 평온한 날이 없군……", "샤오롄")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("이번엔 제2학원도시잖아, SID와 무슨 상관이라고…… 게다가……", "샤오롄")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("……잠깐,이건?!", "샤오롄")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("세계 각지의 인터넷에 똑같은 헤드라인의 뉴스가 업데이트 되고 있다.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("신비한 남성이 알카트라즈 수용 기지에 침입해 EX급 고대 『이물질』을 훔치다.")
	await novel_interface.show_text_only("수배 정보는 다음과 같았다— 성별: 남성, 연령: 15~18세. 현재 확보된 사진은 한 장뿐이다.")
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("지명수배 속 용의자의 얼굴이 너무나도 익숙하다. ")
	await novel_interface.show_dialog("이건…나잖아?", "샤오롄")
	await novel_interface.show_text_only("확실히 말하면 내가 남자였을 때 모습이다.")
	await novel_interface.show_text_only("지명수배 속 남자가 훔친 이물질은 공개되지 않았다. 그의 위험 등급은 AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("……어떻게 이런 일이?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("도대체…무슨 일이 일어난 거야?", "샤오롄")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
