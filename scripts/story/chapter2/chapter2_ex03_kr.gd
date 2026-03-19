# chapter2_ex03.gd - 第二章番外篇03
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex03_script()

func play_script():
	pass

func chapter2_ex03_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/APT/washingRoom.png")
	await novel_interface.show_dialog("여기 욕조 정말 좋다!\\n마리루는 역시 돈 씀씀이가 커……", "샤오롄")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("아~~~~하루종일 바빴고 이제 욕조 안에 누으니 몸과 마음이 편해진다~~", "샤오롄")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("응…", "샤오롄")
	await novel_interface.show_dialog("이게 바로……내 몸이지?", "샤오롄")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("피부가 부드러워서 낯설어……\\n매끄러워……")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("아!뭐하는 거야!\\n에휴,현실을 받아들이자.", "샤오롄")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("원래 모습을 회복하기 전까지\\n이게 내 몸이니까…", "샤오롄")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("하루종일 싸우다가 목욕을 하니까 정말 살 것 같아~", "샤오롄")
	await novel_interface.show_dialog("씻자……오늘은 정말 고단한 하루였어~~", "샤오롄")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("으아~~~~~", "샤오롄")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("목소리가 적응이 안 돼서,고양이 울음소리 같은 소리를 내버렸다...", "샤오롄")
	await novel_interface.show_dialog("이런,이 목소리,엄청……", "샤오롄")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("저질 같아……", "샤오롄")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("으……", "샤오롄")
	await novel_interface.show_dialog("어떻게 적응하란 거야……이 몸!!", "샤오롄")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
