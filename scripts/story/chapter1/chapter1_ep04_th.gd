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
	await novel_interface.show_text_only("...")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("อืม...?",GameConfig.player_name)
	await novel_interface.show_dialog("(เอ๊ะ ก่อนหน้านี้เกิดอะไรขึ้นกันนะ)",GameConfig.player_name)
	await novel_interface.show_dialog("เจ็บจัง...",GameConfig.player_name)
	await novel_interface.show_dialog("(จริงสิ ฉันโดนคนทำร้าย...)\n(แล้วก็คลานไปหลบในเงาของของจัดแสดงแถวนั้น...)",GameConfig.player_name)
	await novel_interface.show_dialog("รอบตัวฉันมีอะไรเหมือนแผ่นหินอยู่\n(บนนั้นสลักลวดลายกับตัวอักษรประหลาดเอาไว้...)",GameConfig.player_name)
	await novel_interface.show_dialog("(ป้ายชื่อของจัดแสดงเขียนว่า Miskatonic...)\n(ตัวอักษรข้างหลังเลือนจนอ่านไม่ออก)",GameConfig.player_name)
	await novel_interface.show_dialog("ว่าแต่ เงียบเกินไปแล้ว...",GameConfig.player_name)
	await novel_interface.show_dialog("พวกนั้นไปที่อื่นกันหมดแล้วเหรอ?",GameConfig.player_name)
	await novel_interface.show_dialog("ขอดูสถานการณ์...สักหน่อยดีกว่า\nห้องประชุม...ลิลิ่ว...",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("นี่มัน...ฝันอยู่ใช่ไหม...?\nมันเกิด...อะไรขึ้นกันแน่??",GameConfig.player_name)
	await novel_interface.show_text_only("ท่ามกลางทะเลเพลิง ราวกับอยู่ในสวนประติมากรรม\nผู้คนยังคงมีท่วงท่าสดเหมือนมีชีวิต สีหน้าก็ยังมีอารมณ์...")
	await novel_interface.show_text_only("แต่พวกเขาสูญเสียสีสันของมนุษย์ไปแล้ว กลายเป็นสีขาวซีดทั้งร่าง")
	await novel_interface.show_dialog("เรื่องแบบนี้...เรื่องแบบนี้...จะเป็นไปได้ยังไง...",GameConfig.player_name)
	await novel_interface.show_dialog("ไม่เอา...\nทุกคน...เป็นอะไรกันไปหมด...คุณลิลิ่ว...หายไปไหนแล้ว...",GameConfig.player_name)
	await novel_interface.show_dialog("ใครก็ได้...ช่วยบอกฉันทีสิ!!",GameConfig.player_name)
	await novel_interface.show_text_only("เมื่อฉันยื่นมือออกไปพยายามแตะใบหน้าอันเย็นเฉียบของผู้หญิงคนหนึ่ง คอของเธอก็หักลงอย่างเงียบงัน ศีรษะตกกระแทกพื้นแล้วแตกกระจายเป็นเสี่ยง ๆ")
	await novel_interface.show_dialog("นี่มัน...เกลือ??",GameConfig.player_name)
	await novel_interface.show_dialog("อุ...อึก...\nอ๊ากกกกกก!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("อ๊ากกกกกก!!!！\nอ๊าาาาาาาาาาาาาาาาาาาา!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
