# chapter2_ep07.gd - 第二章第7话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep07_script()

func play_script():
	pass

func chapter2_ep07_script():
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/other/BG_City_street2.png")
	novel_interface.show_character("ren_battle","gratified")
	await novel_interface.show_dialog("아깐 정말 위험했어……\n겨우 돌아왔네~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+",다쳤어,\n팔에서 피가 엄청 나잖아!", "앤")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("괜찮아, 그냥 찰과상일 뿐이야.\n이 정도 상처는 남자한텐 아무것도 아니야!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("하지만 지금은 여자잖아, 너무 무리하지 마!\n게다가 발도 삔 것 같던데……", "앤")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("음…… 아무래도 일이 간단하지는 않은 것 같아. 이 문제를 해결하지 못하면 더 많은 사람이 다칠지도 몰라……", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("부탁이니까 너 자신도 좀 아껴 줘!\n팔에서 아직도 피가 나잖아.", "앤")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("그럴게. 고마워, 앤~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("하지만…… 아직 단서를 못 찾았어……\n다음 구역으로 계속 가 볼까?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(갑자기 눈앞에 나타나며)이 꼬맹아……", "마리루")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("마리루 박사, 아, 아니, 장관님!\n우릴 기다리고 계셨어요?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("저희 지금 막 다음 구역을 조사하러 가려던 참이었는데……", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("잠깐, 너…… 방금 싸운 거야?!", "마리루")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("어…… 나도 그냥, 어떻게든 해 보려고……", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("내가 분명 무리하지 말라고 했지!!", "마리루")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("통제할 수 없는 위험이 생기면 나한텐 큰 손실이야!\n봐, 벌써 다쳤잖아!", "마리루")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("의료반! 부상자다, 처치하고 즉시 본부로 데려가!", "마리루")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+",마리루 장관님이 정말 널 걱정하는 것 같아……\n우리 그냥……?", "앤")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("……응", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("말로 설명하기 힘든 당혹감이 마음속으로 조용히 스며들었다.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
