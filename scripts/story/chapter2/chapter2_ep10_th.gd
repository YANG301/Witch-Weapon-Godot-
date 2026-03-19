# chapter2_ep10.gd - 第二章第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep10_script()

func play_script():
	pass

func chapter2_ep10_script():
	novel_interface.change_music("res://assets/audio/music/Witch's Confession.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("หลังจากที่ Lian จากไป Mariru ก็จ้องมองอุปกรณ์พกพาของเธอด้วยสีหน้าเคร่งเครียด")
	await novel_interface.show_text_only("ข้อมูลการเปลี่ยนแปลงอันยาวเหยียดปรากฏต่อหน้าต่อตาเธอ")
	await novel_interface.show_text_only("ไฟล์บนหน้าจอซึ่งคาดว่าจะอยู่ในสถานะ \"ล็อค\" กำลังเปลี่ยนแปลง")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(เป็นไปได้ยังไง?! Aegis น่าจะสามารถป้องกันการโจมตีทางเครือข่ายได้)\n(นี่อาจเป็นคนจาก วุฒิสภา...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Lian ประวัติศาสตร์ทั้งหมดของกลายเป็นคำพูดที่ไม่มีความหมาย ขณะที่หน้าจอกะพริบ ข้อความที่อ่านไม่ออกจะค่อยๆ แก้ไขตัวเองให้เป็นข้อมูลที่มีความหมาย")
	await novel_interface.show_text_only("จากส่วนที่อ่านไม่ได้ไปจนถึงบันทึกที่เชื่อมโยงกันอย่างสมบูรณ์ ไฟร์วอลล์ที่น่ารังเกียจของ Aegis จะไม่ส่งคำเตือนแม้แต่ครั้งเดียว")
	await novel_interface.show_text_only("บนหน้าปัดนาฬิกาของ Mariru มีตัวอักษรสีแดง \"T\" กะพริบ")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(การเขียนข้อมูลใหม่ในระดับนี้เกิดขึ้นบนเมนเฟรม Aegis และมีเพียง \"Themis\" เท่านั้นที่สังเกตเห็นความผิดปกติ...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("บนอุปกรณ์พกพา ประวัติส่วนตัวของ Lian ได้รับการอัปเดตอย่างสมบูรณ์แล้ว\nตั้งแต่ชั้นอนุบาลถึงมัธยมต้น เธอเข้าเรียนในโรงเรียนเอกชน")
	await novel_interface.show_text_only("รายงานบัตร ประกาศนียบัตร รางวัล เวชระเบียน บันทึกการประกันภัย...\nทุกรายละเอียดชี้ไปที่ภูมิหลังของครอบครัวที่ร่ำรวยและมีสิทธิพิเศษ")
	await novel_interface.show_text_only("แต่ไม่นานมานี้พ่อแม่และพี่ชายของหญิงสาวเสียชีวิตจากอุบัติเหตุเครื่องบินตกในต่างประเทศ")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("ภายใต้พระราชบัญญัติสวัสดิการเด็กหลังสงคราม นักวิทยาศาสตร์ระดับ SS ซึ่งครั้งหนึ่งเคยลงทะเบียนเป็นอาสาสมัครได้รับมอบหมายให้เป็นผู้ปกครองของเด็กผู้หญิง...", "Mariru")
	await novel_interface.show_dialog("(อย่าบอกนะว่าบันทึกของฉันก็เปลี่ยนไปเหมือนกัน!)\n(นี่ถือเป็นการยั่วยุจริงๆ...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ความคิดเห็นของครูคนหนึ่งอ่านว่า: \"เธอชอบเลียนแบบกิริยาท่าทางของพี่ชายอยู่เสมอ และขาดความยับยั้งชั่งใจที่หญิงสาวคาดหวังไว้...\"")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(การปลอมแปลงอย่างละเอียดขนาดนี้... ฉันควรจะให้แผนกข้อมูลศึกษาอย่างถูกต้อง)", "Mariru")
	await novel_interface.show_dialog("(ถ้าพวกเขามอบหมายผู้ปกครองคนอื่น แม้ว่าฉันจะไม่สามารถบอกได้ว่าของจริงหรือของปลอมก็ตาม)\n(...พวกเขาย้ายบันทึกของคนอื่นไปหรือเปล่า?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(ดูเหมือนว่าสำนักงานใหญ่จำเป็นต้องมีการกวาดล้างการป้องกันข้อบกพร่องที่เหมาะสม)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(มีรูปข้างล่างด้วยเหรอ?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("โดยแนบรูปถ่ายมาด้วยซึ่งเป็นหนึ่งในทรัพย์สินของบิดามารดาผู้ล่วงลับ")
	await novel_interface.show_text_only("ในภาพ เด็กสาว Lian มีผมสั้นและโชว์ภาพวาดของเธออย่างภาคภูมิใจ")
	await novel_interface.show_text_only("หญิงสาวได้วาดนางเงือกน้อย ในลายมือภาษาอังกฤษแบบเด็กๆ ที่มุมขวาล่างมีคำว่า \"ฉันก็มีผมสีแดงเหมือนกัน\"")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("อิอิอิ... นั่นแหละ...", "Mariru")
	await novel_interface.show_dialog("แม้ว่าจะเป็นภาพคอมโพสิต แต่เธอก็น่ารักจริงๆ เมื่อตอนเป็นเด็ก~", "Mariru")
	await novel_interface.show_dialog("คุณให้ประวัติส่วนตัวแก่เธอ", "Mariru")
	await novel_interface.show_dialog("และในขณะเดียวกันคุณก็เตือนฉันว่าเด็กน้อยคนนี้พิเศษใช่ไหม?", "Mariru")
	await novel_interface.show_dialog("คุณไม่เคยตั้งใจจะปิดบังอะไรจากฉันตั้งแต่เริ่มต้น", "Mariru")
	await novel_interface.show_dialog("นั่นเป็นเหตุผลว่าทำไมคุณจงใจเลือกภาพวาดนี้ที่ฉันทำเมื่อยังเด็ก—", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("นี่คือข้อความที่คุณต้องการจะสื่อถึงฉัน...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
