# chapter1_ep4.gd - Chapter 1 Episode 4
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep4_script()

func play_script():
	pass

func chapter1_ep4_script():
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-1.ogv"
	])
	await novel_interface.show_text_only("……")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("음……?",GameConfig.player_name)
	await novel_interface.show_dialog("(어…… 방금 무슨 일이 있었던 거지……?)",GameConfig.player_name)
	await novel_interface.show_dialog("아파……",GameConfig.player_name)
	await novel_interface.show_dialog("(맞다, 누군가한테 습격당했고……)\n(그러고 근처 전시품 그림자 안으로 기어 들어갔지……)",GameConfig.player_name)
	await novel_interface.show_dialog("내 주변엔 석판 같은 물건들이 있고,\n(그 위에는 기묘한 무늬와 글자가 새겨져 있다……)",GameConfig.player_name)
	await novel_interface.show_dialog("(전시 명패에는 Miskatonic이라고 적혀 있어……)\n(뒤쪽 글자는 흐려져서 안 보여.)",GameConfig.player_name)
	await novel_interface.show_dialog("그보다도…… 너무 조용하잖아……",GameConfig.player_name)
	await novel_interface.show_dialog("그 녀석들은 다른 곳으로 갔나?",GameConfig.player_name)
	await novel_interface.show_dialog("잠시 상황을 지켜보자\\n회의실……마리루……",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("이건,꿈인가……?\\n도대체,어떻게 된 거지??",GameConfig.player_name)
	await novel_interface.show_text_only("불바다 속,조각 공원처럼\\n사람들의 동작과 표정이 생동감있다……")
	await novel_interface.show_text_only("하지만 그들에게서는 사람다운 기색이 모두 사라지고, 하나같이 창백할 뿐이다.")
	await novel_interface.show_dialog("이, 이런 일이…… 말도 안 돼……",GameConfig.player_name)
	await novel_interface.show_dialog("안 돼……\\n다들……왜 그러는 거야……마리루씨……어디 갔어……?",GameConfig.player_name)
	await novel_interface.show_dialog("누가 좀 알려줘!!",GameConfig.player_name)
	await novel_interface.show_text_only("한 여자의 차가운 얼굴을 만지려고 하자 \\n그녀의 목이 잘려 바닥에서 산산조각 난다.")
	await novel_interface.show_dialog("이건…… 소금??",GameConfig.player_name)
	await novel_interface.show_dialog("으…흑……\\n흐아아아아아!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("으아아아아아!!!\n아아아아아아아아아아아아아아!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
