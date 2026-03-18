# chapter1_ep1.gd - Chapter 1 Episode 1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep1_script()

func play_script():
	pass

func chapter1_ep1_script():
	novel_interface.change_music("res://assets/audio/music/Hero.mp3")
	await novel_interface.enter_center_performance_mode([
		"『วัตถุต่างภาวะ』—ข้อมูลหรือสื่อพาหะที่เมื่อเข้าเงื่อนไขเฉพาะ จะก่อให้เกิดปรากฏการณ์ทางฟิสิกส์เหนือสามัญ",
		"ปรากฏการณ์เหล่านี้ไม่ถูกจำกัดด้วยข้อจำกัดที่เป็นที่รู้จัก ไม่ว่าจะเป็นมิติ กาลอวกาศ หรือจิตใจ",
		"ตลอดมา 『วัตถุต่างภาวะ』ซ่อนตัวอยู่รอบตัวเราเสมอ",
		"เนื่องจากส่วนใหญ่มีรูปลักษณ์คล้ายของใช้ในชีวิตประจำวัน ผู้คนจึงสังเกตเห็นได้ยาก",
		"ทว่าเพียงถูกกระตุ้นด้วยเงื่อนไขบางอย่าง มันก็สามารถก่อให้เกิดปรากฏการณ์ผิดปกติที่เกินขอบเขตความเข้าใจของมนุษย์ได้",
		"เพื่อปกป้องมนุษย์ซึ่งเป็นสิ่งมีชีวิตอันเปราะบาง เราจึงพยายามอย่างยิ่งไม่ให้มันปรากฏต่อสายตาสาธารณะ",
		"เพราะการมีอยู่ของความผิดปกติเหล่านี้ จะสั่นคลอนระเบียบที่เราได้มาอย่างยากลำบากในปัจจุบัน!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("นับตั้งแต่เหตุเครื่องบินตกหมายเลขอุบัติเหตุ DA154\n『วัตถุต่างภาวะ』ก็เริ่มถูกค้นพบอย่างต่อเนื่องทั่วโลก","บันทึก")
	await novel_interface.show_dialog("ความพยายามทั้งหมดของเราสูญเปล่าแล้ว...","บันทึก")
	await novel_interface.show_dialog("ไม่มีใครรู้ว่าใครเป็นผู้สร้างมันขึ้นมา","บันทึก")
	await novel_interface.show_dialog("ก่อนที่วิทยาศาสตร์จะอธิบายหลักการของมันได้ ผู้คนและสื่อกลับชอบเรียกมันว่า...『ปาฏิหาริย์』","บันทึก")
	await novel_interface.show_dialog("ผู้คนเชื่อว่านี่คือพรจากพระเจ้า","บันทึก")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("จนกระทั่ง『ปาฏิหาริย์』บางชิ้นที่มีพลังมหาศาลถูกทำให้เป็นอาวุธ","บันทึก")
	await novel_interface.show_dialog("มนุษย์หยิบอาวุธที่ตนเองไม่อาจเข้าใจขึ้นมาเข่นฆ่ากันอีกครั้งอย่างไม่ลังเล","บันทึก")
	await novel_interface.show_dialog("และสงครามครั้งนั้นก็ดำเนินต่อเนื่องนาน 7 ปี...","บันทึก")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("ในที่สุด หกประเทศที่ก้าวหน้าที่สุดในด้านการวิจัย『วัตถุต่างภาวะ』ก็ได้บรรลุสนธิสัญญาสันติภาพ","บันทึก")
	await novel_interface.show_dialog("เพื่อรับมือกับกระแสต่อต้านสงครามที่พุ่งสูงในหมู่ประชาชน และเพื่อประชาสัมพันธ์ว่าการวิจัยเทคโนโลยีต่างภาวะนั้นไร้พิษภัย","บันทึก")
	await novel_interface.show_dialog("ทั้งหกประเทศจึงมีมติร่วมกัน ให้ใช้คำเรียกเมืองหลวงของตนว่า\n『นครการศึกษา』(Academy City)","บันทึก")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『นครการศึกษา』...ช่างเป็นชื่อที่ประชดประชันจริง ๆ"
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ ฐานอัลคาทราซ",
		"ใจกลางนครการศึกษาแห่งที่สอง",
		40,
		30,
		Vector2(68,460),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00001_1.ogv",
		"res://assets/video/00001_2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")
	await novel_interface.enter_center_performance_mode([
		"สามวันก่อน..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ ศูนย์วิจัยและกักกันสตีลมอนต์",
		"นครการศึกษาแห่งที่ห้า",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("ระบบยืนยันตัวตน AEGIS เริ่มทำงานแล้ว", "ระบบ") # color tags supported here
	await novel_interface.show_dialog("กำลังให้บริการคุณ", "ระบบ")
	await novel_interface.show_dialog("กรุณาตรวจสอบข้อมูลยืนยันตัวตนของคุณ", "ระบบ")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
