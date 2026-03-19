# chapter2_ep20.gd - 第二章第20话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep20_script()

func play_script():
	pass

func chapter2_ep20_script():
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	await novel_interface.show_text_only("Johnson Substation คือสิ่งอำนวยความสะดวกกลางแจ้งขนาดใหญ่ที่สร้างขึ้นก่อนสงคราม ต่อมาจอห์นสัน เฮฟวี อินดัสทรีส์ แห่ง First Academy City เข้าซื้อกิจการทั้งหมด")
	await novel_interface.show_text_only("ในช่วงไม่กี่ปีที่ผ่านมา ความต้องการพลังงานไฟฟ้าใน 'เขตข้อตกลง' ได้เพิ่มขึ้นอย่างรวดเร็วจนปัจจุบันกำลังการผลิตของสถานีย่อยได้รับการขยายถึงยี่สิบเท่า")
	await novel_interface.show_text_only("Annie และฉันค่อยๆ เข้าไปในสถานีย่อยผ่านช่องว่างในรั้วลวดหนาม")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("นี่คือจุดที่กำหนดฮะ... ที่นี่ดูแย่มาก\nเรามาสายเกินไปหรือเปล่า?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("เสียงครวญครางของกระแสไฟเกินดังก้องไปทั่วสถานีย่อย และเกิดประกายไฟพ่นออกมาจากอุปกรณ์ไฟฟ้าบ่อยครั้ง")
	await novel_interface.show_text_only("พื้นและกำแพงปกคลุมไปด้วยรอยไหม้ที่แตกแขนงราวกับว่าถูกฟ้าผ่า...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("สิ่งนี้ไม่รู้สึกเหมือนโซนความผิดปกติอื่นๆ เลย Mariru ไม่ได้คาดหวังให้เราซ่อมหม้อแปลงอย่างจริงจังใช่ไหม?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("หน่วยไฟฟ้าในวิชาฟิสิกส์... คือส่วนที่ทำให้ฉันปวดหัวที่สุด...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Annie เสียงสั่นราวกับเธอเพิ่งนึกถึงความหวาดกลัวที่ไม่สามารถบอกกฎมือซ้ายจากมือขวาได้")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("เดี๋ยวก่อน ฟัง—\nข้างหน้า...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("นั่นมันอะไรน่ะ!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-บนนั้น—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("ฉันเงยหน้าขึ้นและเห็นหญิงสาวผมสีฟ้าในอากาศ สวมชุดเกราะไฟฟ้า สวมถุงมือโลหะที่ใหญ่เกินไปสำหรับร่างเล็กๆ ของเธอ—")
	await novel_interface.show_text_only("รอบตัวเธอ กลุ่มบุคคลที่แสดงท่าทีแปลกๆ ผลัดกันโจมตีอย่างดุเดือด")
	await novel_interface.show_text_only("หนึ่งในนั้นคือผู้หญิงที่รายล้อมไปด้วยสิ่งที่ดูเหมือนเปลวไฟที่น่ากลัว")
	await novel_interface.show_text_only("เสียงกรี๊ดดังเล็ดลอดออกมาจากลำคอของเธอ ทำให้ฉันกัดฟันโดยสัญชาตญาณ")
	await novel_interface.show_text_only("และคนอื่นๆ... หรืออะไรก็ตามที่พวกเขาเป็น เพราะฉันไม่แน่ใจด้วยซ้ำว่าพวกเขาเป็นมนุษย์ ดูเหมือนจะถูกควบคุมโดยบางสิ่งบางอย่าง")
	await novel_interface.show_text_only("เมื่อการโจมตีครั้งแล้วครั้งเล่าพังทลายลง แม้แต่ร่างกายของพวกเขาก็บิดตัวเป็นมุมที่เป็นไปไม่ได้พร้อมกับการเคลื่อนไหวของพวกเขา")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("ฮะ... ฮะฮะ...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("ภายใต้การโจมตีอย่างไม่หยุดยั้ง เด็กหญิงตัวเล็ก ๆ ผมสีฟ้ามีบาดแผลเต็มไปหมด และแทบจะปกป้องตัวเองได้เพียงเท่านั้น")
	await novel_interface.show_text_only("ไม่... การเรียกเธอว่าผู้หญิงอาจจะมากเกินไปด้วยซ้ำ เธอดูเหมือนเด็กมากกว่า... เธอดูอายุแค่สิบขวบเท่านั้น")
	await novel_interface.show_text_only("...เอ่อ นี่เป็นเวลาที่จะแขวนคอกับรายละเอียดนั้นจริงๆ เหรอ?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie ดูสิ—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("ผู้ยิ่งใหญ่... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... คิคิคิคิ...", "ผู้โจมตีที่บ้าคลั่ง")
	await novel_interface.show_dialog("ทั้งหมด... ทั้งหมด... ทั้งหมด... ทุกอันสุดท้าย!!!", "ผู้โจมตีที่บ้าคลั่ง")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("เอ่อ—!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("สาวน้อยคนนั้นทนไม่ไหวอีกต่อไปแล้ว!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("ไอ้สารเลว—\nหยุดอยู่ตรงนั้น!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
