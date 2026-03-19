# chapter2_ep01.gd - 第二章第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep01_script()

func play_script():
	pass

func chapter2_ep01_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/spSoundChannel.png")
	await novel_interface.show_dialog("뭐라고요?! '아이기스' 방위권 안은 분명 우리 도시방위청(MD)의 관할 아닙니까!", "방위청 장관")
	await novel_interface.show_dialog("군이 무슨 권리로 지휘권을 가져갑니까,\n납득할 만한 이유를 대지 않는 한, 경계 봉쇄는 절대 해제 못 합니다!!", "방위청 장관")
	await novel_interface.show_dialog("이건 기밀입니다. 당신에게 설명할 수도, 그럴 필요도 없습니다!", "군부 장관")
	await novel_interface.show_dialog("이제부터는 우리 군의 사안입니다.\n협조해 주십시오!", "군부 장관")
	await novel_interface.show_dialog("반대합니다! 이건 방위청 지휘하의 작전입니다!!\n원로원의 행정명령이라도 있지 않는 한……!", "방위청 장관")
	await novel_interface.show_dialog("크흠…… 제가 한마디 하지요.", "여성의 목소리")
	await novel_interface.show_dialog("아직도 그런 시시한 일로 시간을 낭비하고 있나요?", "여성의 목소리")
	await novel_interface.show_dialog("이 목소리는——\n마리루…… 마리루 장관님?!", "군부 장관")
	await novel_interface.show_dialog("자, 장관님. 안녕하십니까!", "군부 장관")
	await novel_interface.show_dialog("비밀정보국(SID)은 이미 오래전에 군에서 독립했습니다. 그러니 저를 장관이라 부를 필요는 없어요.", "마리루")
	await novel_interface.show_dialog("마리루인가…… 흥!", "방위청 장관")
	await novel_interface.show_dialog("이건 4급 암호 통신인데!!\n당신이 어떻게……", "방위청 장관")
	await novel_interface.show_dialog("그런 사소한 건 일단 제쳐 두고~\n지금 당장 눈앞의 문제를 어떻게 처리할지부터 생각하세요!", "마리루")
	await novel_interface.show_dialog("4급 암호 채널이라면 돌려 말하지 말고 바로 본론만 말하세요. 여기 대화는 다른 누구도 못 듣습니다——", "마리루")
	await novel_interface.show_dialog("정보를 전부 공개하세요!!", "마리루")
	await novel_interface.show_dialog("아, 네! 장관님!", "군부 장관")
	await novel_interface.show_dialog("현재 연구소 주변 감시 시스템 전체가 심각한 잡음 상태에 빠졌고, 대규모의 이상 시공파동이 감지되고 있습니다……", "군부 장관")
	await novel_interface.show_dialog("시공파동,\n그건……?", "방위청 장관")
	await novel_interface.show_dialog("『도시 재해 대책법』에 분명히 나와 있잖아요……", "마리루")
	await novel_interface.show_dialog("설마 일반에 공개되지 않은 기밀 조항이라고 해서 방위청조차 읽지 않았다는 건가요?", "마리루")
	await novel_interface.show_dialog("윽…… 설, 설마……\n『이물질』 수용 실패……?", "방위청 장관")
	await novel_interface.show_dialog("게다가 어젯밤 『로스 금잔』이 갑자기 사라진 일까지 겹쳤고……", "마리루")
	await novel_interface.show_dialog("……신토요스에서 이런 일이 일어난 건 벌써 6년 만이죠?", "마리루")
	await novel_interface.show_dialog("최악의 가능성까지 염두에 두세요——", "마리루")
	await novel_interface.show_dialog("아, 알겠습니다……", "방위청 장관")
	await novel_interface.show_dialog("방위청은 즉시 내측 봉쇄를 해제하고, 훈련을 명목으로 주민 대피를 시작하겠습니다……", "방위청 장관")
	await novel_interface.show_dialog("좋아요. 군은 외곽 배치를 어떻게 진행 중이죠?", "마리루")
	await novel_interface.show_dialog("특수작전부대가 이상 현상 구역 주변 반경 2킬로미터 안에 중화기를 배치 중이지만, 아직 위협 등급은 확정할 수 없습니다.", "군부 장관")
	await novel_interface.show_dialog("보도 통제는요?", "마리루")
	await novel_interface.show_dialog("협의에 따라 C-13 대본을 실행 중입니다.", "군부 장관")
	await novel_interface.show_dialog("좋아요. 그럼 지금부터 이상 핵심구역은 비밀정보국(SID)이 인수하겠습니다.", "마리루")
	await novel_interface.show_dialog("당신들도 즉시 움직이세요!", "마리루")
	await novel_interface.show_dialog("네!", "군부 통신")
	await novel_interface.show_dialog("아, 알겠습니다……\n당신들도 조심하세요.", "방위청 장관")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
