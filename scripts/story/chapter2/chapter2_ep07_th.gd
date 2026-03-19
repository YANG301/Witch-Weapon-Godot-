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
	await novel_interface.show_dialog("ใกล้เข้ามาแล้วจริงๆ...\nในที่สุดเราก็กลับมาได้~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+"เจ็บนะ!\nแขนคุณมีเลือดออกมาก!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ฉันสบายดี มันเป็นแค่รอยถลอก\nอาการบาดเจ็บแบบนี้ไม่เหมาะกับผู้ชายเลย!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("แต่ตอนนี้คุณเป็นผู้หญิงแล้ว อย่ากดดันตัวเองมากนัก!\nและคุณก็บิดข้อเท้าด้วยใช่ไหม...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ใช่แล้ว... เห็นได้ชัดว่ามันไม่ง่ายเลย หากเราไม่แก้ไขปัญหาทั้งหมดนี้\nอาจมีคนได้รับบาดเจ็บมากขึ้น...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("ดูแลตัวเองให้ดีกว่านี้หน่อยได้ไหม\nแขนของคุณยังมีเลือดไหลอยู่", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("ฉันจะ. ขอบคุณ Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("แต่... เรายังไม่มีเบาะแสใดๆ...\nเราควรไปตรวจสอบพื้นที่ต่อไปหรือไม่?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(จู่ๆ ก็ปรากฏตัวต่อหน้าเธอ) ไอ้สารเลว...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("ดร. Mariru—อ่า ไม่สิ ผู้บัญชาการ!\nคุณกำลังรอพวกเราอยู่เหรอ?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("เรากำลังจะออกไปสำรวจพื้นที่ต่อไป...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("เดี๋ยวก่อน—คุณ... เพิ่งทะเลาะกันเรื่องอะไรเหรอ?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("เอ่อ ฉันแค่... พยายามช่วยนิดหน่อย...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ฉันจำบอกได้ชัดเจนว่าอย่ากดดันตัวเอง!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("หากมีสิ่งใดที่ควบคุมไม่ได้เกิดขึ้นกับคุณ นั่นจะเป็นการสูญเสียครั้งใหญ่สำหรับฉัน!\nดูสิ คุณบาดเจ็บแล้ว!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("ทีมแพทย์! เรามีเด็กผู้หญิงที่ได้รับบาดเจ็บอยู่ที่นี่ โปรดรักษาเธอทันทีและพาเธอกลับไปที่ศูนย์บัญชาการทันที!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", ผู้บัญชาการ Mariru ดูเหมือนเป็นห่วงคุณจริงๆ...\nบางทีเราควรแค่...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...ใช่", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("ความตื่นตระหนกอันแผ่วเบาที่อธิบายไม่ได้ได้คืบคลานเข้ามาในหัวใจของฉันอย่างเงียบๆ")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
