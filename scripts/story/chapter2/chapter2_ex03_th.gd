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
	await novel_interface.show_dialog("อ่างอาบน้ำสวย \\nMariru ไม่สนใจเรื่องเงินจริงๆ...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("อ่า.. \\nช่วงเวลาที่ผ่อนคลายที่สุดหลังจากวันอันยาวนาน", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("ก็…", "Lian")
	await novel_interface.show_dialog("นี่... นี่คือร่างกายของฉันเหรอ?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ดูยุติธรรมและให้ความรู้สึกนุ่มนวล... \\nนุ่มนวลน่าสัมผัส...")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("ฉันกำลังทำอะไรอยู่? \\nเผชิญหน้ากับมัน", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("ก่อนที่ฉันจะพบทางกลับคืนสู่ฉันคนเดิม\\nนี่คือร่างกายของฉัน...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("ช่างเป็นการอาบน้ำที่ผ่อนคลายมากหลังจากต่อสู้กับศัตรูที่ไม่คาดคิดมาทั้งวัน!", "Lian")
	await novel_interface.show_dialog("ฉันควรจะสนุกกับช่วงเวลานี้ดีกว่า ช่างเป็นวันที่เหนื่อยล้า!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("อ่า..", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("ยังไม่สามารถยอมรับเสียงของฉันได้ เสียงเหมือนลูกแมวคราง...", "Lian")
	await novel_interface.show_dialog("ประณามมัน! เสียงนี้ก็เลย...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("สกปรก...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("อืม...", "Lian")
	await novel_interface.show_dialog("ฉันจะชินกับร่างกายนี้ได้อย่างไร!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
