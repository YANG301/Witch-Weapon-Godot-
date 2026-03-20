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
	await novel_interface.show_dialog("อรุณสวัสดิ์เรน! \\nทำไมวันนี้คุณดูไม่ค่อยดีนัก…", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("ใช่ หลังจากการตรวจร่างกายทั้งหมดเมื่อวานนี้… \\nเมื่อคืนนี้นอนไม่หลับ ตอนนี้ฉันรู้สึกวูบวาบ…", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("มันคือเตียงเหรอ? บางทีคุณอาจนอนไม่หลับบนเตียงใหม่?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("ไม่มีเบาะแส ฉันหายใจไม่ออกเล็กน้อยขณะนอนอยู่บนเตียง ...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("หายใจไม่ออก? \\nเดี๋ยวก่อน ... คุณนอนท่าไหน?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("ก็นอนคว่ำหน้าเหมือนเช่นเคย", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("โอ- ขณะท้อง ... \\nท่านั้นไม่ได้ช่วยให้พวกมันโตขึ้น ...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("ช่วยอะไรปลูก?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("เอาล่ะเรน คุณเป็นผู้หญิง คุณคงรู้ว่าฉันหมายถึงอะไร ... (โผล่)", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("ว้าว ... โอเค ... \\nฉันคิดว่าฉันเข้าใจแล้ว ...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ดูเหมือนว่าคุณยังต้องเดินทางอีกยาวไกล เร็น...", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
