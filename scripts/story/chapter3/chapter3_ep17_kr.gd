# chapter3_ep17.gd - 第三章第17话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter3_ep17_script()

func play_script():
	pass

func chapter3_ep17_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/School/BG_School_passage.png")
	novel_interface.show_character("anne_uniform","happy")
	await novel_interface.show_dialog("좋은 아침이야, 렌!~\\n왜 이렇게 풀이 죽어있어?……", "앤")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("아흑……어제 이런저런 일을 체험하고\\n잠을 못 잤더니 머리가 어지러워…", "샤오롄")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("설마……낯선 침대에서는 잠을 못자는 그런 타입?", "앤")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("나도 몰라. 침대에서 숨을 잘 못 쉬겠어……", "샤오롄")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("숨을 못 쉬겠다고?\\n잠깐……보통 어떤 자세로 잠을 자는데?", "앤")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("평소처럼 침대에 엎드려서……", "샤오롄")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("어……엎드려서……\\n그러면 커지지 않는데……", "앤")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("뭐가 커지지 않는다는 거야……", "샤오롄")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("렌도 여성으로서 자각을 가질 필요가 있어~(콕콕)", "앤")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("흑!……알았어……\\n뭐가 문제인지 알 것 같아……", "샤오롄")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("에휴……보아하니 네가 적응해야 할 곳이 아직 많은 것 같아~", "앤")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
