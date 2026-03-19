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
	await novel_interface.show_dialog("Bồn tắm đẹp. \\nMariru thực sự không quan tâm đến tiền...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("À. \\nGiây phút thư giãn nhất sau một ngày dài.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Ờ…", "Lian")
	await novel_interface.show_dialog("Đây... là cơ thể của tôi?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Trông đẹp và mềm mại... \\nChạm vào rất mượt…")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("Tôi đang làm gì thế? \\nHãy đối mặt với nó.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Trước khi tìm cách quay về với tôi ngày xưa\\nĐây là cơ thể của tôi...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("Thật là một sự tắm thư giãn sau khi chiến đấu cả ngày với những kẻ thù bất ngờ!", "Lian")
	await novel_interface.show_dialog("Tốt hơn là tôi nên tận hưởng khoảnh khắc này. Thật là một ngày mệt mỏi!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("À.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Vẫn không thể chấp nhận giọng nói của tôi. Nghe như tiếng mèo con rên rỉ...", "Lian")
	await novel_interface.show_dialog("Chết tiệt! Giọng này hay quá...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Bẩn...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Ừm…", "Lian")
	await novel_interface.show_dialog("Làm sao tôi có thể quen được với cơ thể này?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
