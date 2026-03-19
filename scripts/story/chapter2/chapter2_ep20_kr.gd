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
	await novel_interface.show_text_only("존슨 변전소,전쟁 전 지어진 대형 노천 변전소로 훗날 제1학원도시의 존슨 중공업이 인수했다. ")
	await novel_interface.show_text_only("요 몇 년간 『협약구역』의 전기 수요가 늘어감에 따라 현재 용량은 20배로 확장됐다.")
	await novel_interface.show_text_only("나와 앤은 철조망 구멍을 통해 조심스럽게 변전소에 들어왔다.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("여기가 바로 그 지점이야. 상황이 조금 안 좋아 보이는데…\\n우리가 늦은 걸까, ", "샤오롄")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("이때,변전소 주위에 전류 과부화 특유의 웅웅거리는 소리가 울리고,전력 설비에서 이따금 불꽃이 튄다.")
	await novel_interface.show_text_only("땅과 벽에 커다란 나무 형태의 그을린 흔적이 있다. 마치 번개에 침식당한 것 같다…")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("변이 구역의 기운이 느껴지지 않아. 마리루가 변압기를 고치라고 우릴 보낸 건 아니겠지?", "앤")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("물리 수업의 전기학은 정말 머리가 아파…", "앤")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("왼손법칙과 오른손법칙을 구분하지 못해 느꼈던 공포가 생각났는지 앤의 목소리가 떨린다.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("잠깐, 들어 봐——\n앞에서 뭔가……", "샤오롄")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("무슨 소리지?!", "샤오롄")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("저, 저 위에——", "앤")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同,但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("고개를 들어보니 온몸이 전기로 둘러진,체형에 어울리지 않는 금속 장갑을 끼고 있는 파란머리 소녀가 있다.")
	await novel_interface.show_text_only("그녀의 주위에 행동이 괴의한 무리들이 차례로 그녀에게 맹렬한 공격을 개시하고 있다. ")
	await novel_interface.show_text_only("그 중 한 여자의 몸 주위에 도깨비불 같은 것이 에워싸고 있다.")
	await novel_interface.show_text_only("목에서 각각각각 하는 날카로운 소리를 낸다. 본능적인 불쾌감을 준다.")
	await novel_interface.show_text_only("나머지 녀석들은…인간인지 확신할 수 없지만,무언가에 지배당하고 있는 것 같다.")
	await novel_interface.show_text_only("차례차례 이어지는 맹렬한 공격 중 심지어 몸도 공격 동작에 따라 불가능한 각도로 비틀어진다.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("후……하,하아…", "이루카")
	novel_interface.character_dark()
	await novel_interface.show_text_only("연속된 공격으로 이미 상처를 입은 파란머리 소녀가 애써 공격을 막아내고 있다. ")
	await novel_interface.show_text_only("아니,소녀라기 보다,아이……\\n외모를 보니 10살 정도의 어린 아이다. ")
	await novel_interface.show_text_only("……윽,지금 이런 걸 생각할 때가 아니잖아?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("앤,저것 봐——", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("위대……한…… 夕力Duマmーsmrti一ガハラ一\n미광…… 황천…… 크크크크……", "광란의 습격자")
	await novel_interface.show_dialog("전부… 전부… 전부… 전부전부전부전부전부전부전부전부전부전부전부전부전부전부전부전부 다!!!", "광란의 습격자")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("크아——!", "이루카")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("저 아이,얼마 버티지 못할 것 같아!", "앤")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("네 이 녀석들——\\n멈춰!!", "샤오롄")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
