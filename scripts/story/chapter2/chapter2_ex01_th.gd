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
	await novel_interface.show_dialog("สวัสดี. ถึงเวลาตอบคำถาม!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("ขั้นแรก ตั้งชื่อสีของลิปสติกเหล่านี้", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("เอ่อ... เอ่อ... ลิปสติกทั้งเก้าอันนี้... \\nสีแดงทั้งหมดใช่ไหม?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("เดี๋ยวนะ บางอันก็มีสีม่วงไม่ใช่เหรอ?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("พวกคุณเข้าใจผิดกันหมดแล้ว!!", "Ai")
	await novel_interface.show_dialog("สีพีช ปะการัง สีม่วงแดง เชอร์รี่ สีม่วงเข้ม สีม่วงอ่อน องุ่น และลาเวนเดอร์ 0 คะแนน!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("ถัดไป YYL รุ่นลิมิเต็ดอิดิชั่นสำหรับวันวาเลนไทน์คือตัวไหน? \\nนี่ไม่ใช่เรื่องง่ายๆ", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("อะไรนะ ไม่มีโลโก้เลย... \\nอันนี้เป็นรูปหัวใจเหรอ?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("อันที่ถูกที่สุดเลย สาวๆ จะต้องบอกลาทันทีหากได้รับสิ่งนี้ในวันวาเลนไทน์ 0 คะแนน!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("เติมคำลงในช่องว่าง: เนื้อสัมผัสของลิปบาล์ม MEC นี้คืออะไร?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("พื้นผิว? กำมะหยี่? \\nไม่... เนียนเหรอ?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("คำว่าอะไร? \\nฉันเรียนรู้จากใจ แต่ตอนนี้จำไม่ได้แล้ว! ประณามมัน!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("ไม่ดีเลย... คุณไม่มีมันอยู่ในตัว!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("ฉันไม่จำเป็นต้องมีมัน…", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("เอาล่ะ คำถามสุดท้าย...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("น้ำหอมแนวนามธรรมตัวแรกชื่ออะไร? ราคาป้ายเท่าไหร่คะ?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("เอ่อ… ฉันลืมไปเลย! \\nน้ำหอม คุณเข้าใจฉันแล้ว", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("ราคาของมัน... ขวดเล็กขนาดนี้... \\nประมาณ… 10 เหรียญเหรอ?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("อุ๊ย", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("ผิด! ผิดหมด! \\nคุณงี่เง่าอย่างไม่น่าเชื่อจริงๆ!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("ว้าว...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("ฮ่าๆๆ", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! หยุดหัวเราะเยาะฉันได้แล้ว!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
