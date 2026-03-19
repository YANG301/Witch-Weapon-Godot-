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
	await novel_interface.show_dialog("……", "마리루")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("샤오롄이 자리를 뜬 뒤, 마리루는 굳은 표정으로 휴대 단말기를 응시했다.")
	await novel_interface.show_text_only("그녀의 눈앞에는 끊임없이 변화하는 데이터 흐름이 길게 펼쳐져 있었다.")
	await novel_interface.show_text_only("화면 위 『잠금』 상태였던 그 파일이, 지금 이 순간 변하고 있었다.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(이럴 수가! 아이기스라면 어떤 네트워크 공격이든 막아야 할 텐데)\n(설마 원로원 쪽 인간들인가……)", "마리루")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("『렌』의 과거 기록이 전부 깨진 문자로 뒤덮였다가, 화면이 깜빡일 때마다 점차 의미 있는 정보로 교정되어 갔다.")
	await novel_interface.show_text_only("해독 불가 상태에서 완전한 정보로 바뀌는 동안에도, 아이기스 본체의 외부 공격성 방화벽은 어떤 경고도 띄우지 않았다.")
	await novel_interface.show_text_only("마리루의 손목시계 문자판에서는 붉은 글자 『T』가 점멸하고 있었다.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(아이기스 본체에서 이 정도 규모의 데이터 변조가 벌어졌는데, 『Themis』만 이상을 감지했다고……,)", "마리루")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("휴대 단말기 속 『렌』의 과거 기록은 완전히 갱신되어 있었다.\n유치원부터 초등학교, 중학교까지 모두 사립학교에 다닌 이력이다.")
	await novel_interface.show_text_only("성적표, 졸업장, 수상 기록, 의료와 보험 기록…… 곳곳에서 유복한 가정환경이 드러난다.")
	await novel_interface.show_text_only("하지만 얼마 전, 소녀의 부모와 오빠는 해외에서 사고를 당해 비행기 추락으로 사망했다.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("『전후 아동 보육법』에 따라, 자원봉사자로 등록돼 있던 SS급 과학자가 소녀의 후견인으로 배정되었다……", "마리루")
	await novel_interface.show_dialog("(설마 내 기록까지!)\n(역시…… 이건 도발인가,)", "마리루")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("교사 소견에는 이런 문장이 적혀 있었다. “오빠의 동작을 흉내 내는 걸 좋아하며, 여자아이로서의 얌전함이 부족하다……”")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(이 정도까지 위조할 수 있다니, 정보부 인간들한테 좀 배워 오라고 해야겠네)", "마리루")
	await novel_interface.show_dialog("(후견인 정보까지 바뀌었다면, 당사자인 나조차 진위를 구분 못 했겠지)\n(……누군가의 자료를 이식한 건가,)", "마리루")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(본부에서 도청 방지 스캔을 한 번 제대로 해야겠군.)", "마리루")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(아래에 사진도 붙어 있잖아……,)", "마리루")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("……!!", "마리루")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("기록에는 사진 한 장이 첨부돼 있었다. 소녀의 부모가 남긴 유품이라고 적혀 있다.")
	await novel_interface.show_text_only("사진 속 어린 렌은 짧은 머리를 하고, 자신이 그린 그림을 뽐내듯 내밀고 있었다.")
	await novel_interface.show_text_only("아이가 그린 것은 작은 인어 그림이었고, 오른쪽 아래에는 서툰 글씨로 “I have red hair too”라고 적혀 있었다.")
	await novel_interface.show_dialog("……", "마리루")
	await novel_interface.show_dialog("후후후후, 그렇구나……", "마리루")
	await novel_interface.show_dialog("합성 사진이긴 하지만, 어릴 적 모습도 정말 귀엽네~", "마리루")
	await novel_interface.show_dialog("그 아이에게 빈틈없는 과거 기록을 만들어 줬을 뿐만 아니라.", "마리루")
	await novel_interface.show_dialog("동시에 이 아이가 특별하다는 걸 내게 상기시키고 싶은 거겠지?", "마리루")
	await novel_interface.show_dialog("넌 처음부터 나한테 숨길 생각이 없었어.", "마리루")
	await novel_interface.show_dialog("그래서 일부러 내가 어릴 때 그린 그림을 골라 둔 거겠지——", "마리루")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("네가 전하고 싶은 건 이게 다야……?", "마리루")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("아이기스……", "마리루")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
