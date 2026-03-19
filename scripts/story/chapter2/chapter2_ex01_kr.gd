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
	await novel_interface.show_dialog("흐응~훈련 성과를 검사할 때가 됐어! ", "아이")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("자,우선 이 립스틱과 상응되는 색깔의 이름을 말해봐!", "아이")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("으앗, 이, 이…… 이 아홉 개 립스틱……\n다 빨간색 아니야?!", "샤오롄")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("잠깐,이건 보라색 같은데, ", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("윽,완전……틀렸어!!", "아이")
	await novel_interface.show_dialog("피치,코랄,마젠타,체리 레드,자홍,연보라,와인,라벤더색,이것도 구분하지 못하다니,0점!", "아이")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("이 립스틱 중에 어떤 게 yyl가 이번 연인의 날에 출시한 한정판이지,\\n이건 그냥 점수 주는 문제다", "아이")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("엣?상표가 없잖아……\\n연인의 날이라면,미니 하트가 있는 것?", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("제일 싼 걸 고르다니. 연인의 날에 여자친구에게 준다면 바로 차일 거야. 0점!", "아이")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("주관식은 희망이 없겠어. MEC라고 적혀 있는 립스틱의 텍스처를 맞춰봐~", "아이")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("텍스처……벨벳이라고 했던가?\\n아니……실크?", "샤오롄")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("아! 그 단어가 뭐였더라,\n분명 외웠는데도 전혀 생각이 안 나! 젠장!", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("에휴~정말 재능이 없는 아이구나……!", "아이")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("재능이 없어야 맞는 거잖아!", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("마지막으로 테스트해보자……", "아이")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("첫 번째 거,꽃 향기를 합성한 향수의 이름과 매장 가격이 얼마인지 맞춰봐! ", "아이")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("으윽……그 부분은 완전히 잊어버렸어!\\n향수는 정말 방법이 없어~~", "샤오롄")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("가격…… 이렇게 작은 한 병이……\n한…… 50쯤?", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("푸하~", "마리루")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("완전 틀렸어!\\n휴……넌 이런쪽에 전혀 재능이 없구나,!", "아이")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("흑흑……", "샤오롄")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("푸하하하하하하.", "마리루")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("마리루 ! ! 비웃지 마! ! ", "샤오롄")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
