# chapter2_ep01.gd - 第二章第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep01_script()

func play_script():
	pass

func chapter2_ep01_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/spSoundChannel.png")
	await novel_interface.show_dialog("พูดอะไรน่ะ?! ขอบเขตการป้องกันของ 'Aegis' ตกอยู่ภายใต้เขตอำนาจศาลของ สำนักป้องกันมหานคร (MD) ของเราอย่างชัดเจน!", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("เหตุใดคุณจึงเข้าควบคุมคำสั่ง?\nเว้นแต่คุณจะให้เหตุผลที่น่าเชื่อถือแก่ฉัน อย่าคาดหวังว่าฉันจะยกเลิกการปิดล้อมของตำรวจ!!", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("มันเป็นความลับ ฉันไม่จำเป็นต้องอธิบายให้คุณฟัง!", "นายทหาร")
	await novel_interface.show_dialog("นี่เป็นเรื่องของกองทัพแล้ว\nคุณจะต้องให้ความร่วมมือ", "นายทหาร")
	await novel_interface.show_dialog("ฉันปฏิเสธ! การดำเนินการนี้อยู่ภายใต้คำสั่งของกระทรวงกลาโหม!!\nไม่ เว้นแต่จะมีคำสั่งทางปกครองจาก วุฒิสภา...!", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("อะแฮ่ม ขอพูดแบบนี้นะ...", "เสียงผู้หญิง")
	await novel_interface.show_dialog("คุณยังเสียเวลากับเรื่องไร้สาระขนาดนี้อยู่เหรอ?", "เสียงผู้หญิง")
	await novel_interface.show_dialog("เสียงนั้นคือ—\nMariru... เจ้าหน้าที่ Mariru?!", "นายทหาร")
	await novel_interface.show_dialog("ใช่แล้ว คุณผู้หญิง!", "นายทหาร")
	await novel_interface.show_dialog("หน่วยข่าวกรองลับ หลุดพ้นจากกองทัพไปนานแล้ว ดังนั้นคุณไม่จำเป็นต้องเรียกฉันว่า 'เจ้าหน้าที่'", "Mariru")
	await novel_interface.show_dialog("Mariru... ฮึ่ม!", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("นี่คือการสื่อสารที่เข้ารหัสระดับ 4!!\nคุณทำได้อย่างไร...", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("ลืมรายละเอียดเล็กๆ น้อยๆ นั้นไปก่อนเลย~\nลองคิดดูสิว่าเราจะรับมือกับสถานการณ์ที่อยู่ตรงหน้าอย่างไร", "Mariru")
	await novel_interface.show_dialog("หากนี่คือช่องสัญญาณที่เข้ารหัสระดับ 4 ให้พูดอย่างชัดเจน ไม่มีใครฟังที่นี่อยู่แล้ว—", "Mariru")
	await novel_interface.show_dialog("อยากให้เปิดเผยข่าวกรองทั้งหมด!!", "Mariru")
	await novel_interface.show_dialog("ใช่แล้ว คุณผู้หญิง!", "นายทหาร")
	await novel_interface.show_dialog("ปัจจุบัน ระบบเฝ้าระวังทั้งหมดรอบๆ ศูนย์วิจัยล้มเหลว และเราตรวจพบความผันผวนของกาลอวกาศในวงกว้าง...", "นายทหาร")
	await novel_interface.show_dialog("ความผันผวนของกาลอวกาศ?\nนั่นหมายความว่าอย่างไร...?", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("พระราชบัญญัติมาตรการรับมือภัยพิบัติในเมือง ระบุไว้ค่อนข้างชัดเจนใช่ไหม...?", "Mariru")
	await novel_interface.show_dialog("อย่าบอกนะว่ากระทรวงกลาโหมไม่สนใจอ่านกฎเกณฑ์ลับๆ เพียงเพราะว่ามันไม่เปิดให้สาธารณะชนหรอก", "Mariru")
	await novel_interface.show_dialog("ฮึ... อย่าบอกนะว่านี่คือ...\nความล้มเหลวในการกักกันที่เกี่ยวข้องกับ 'Substance H'...?", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("และยิ่งไปกว่านั้น Ross Goblet ก็หายไปเมื่อคืนนี้...", "Mariru")
	await novel_interface.show_dialog("...ไม่มีอะไรแบบนี้เกิดขึ้นใน New Opulentia เป็นเวลาหกปีแล้วใช่ไหม?", "Mariru")
	await novel_interface.show_dialog("คุณต้องพิจารณาสถานการณ์ที่เลวร้ายที่สุด—", "Mariru")
	await novel_interface.show_dialog("ฉัน-ฉันเข้าใจแล้ว...", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("เราจะยกเลิกการล็อคดาวน์ภายในทันที และอพยพพลเรือนภายใต้หน้ากากของการฝึกซ้อม...", "เจ้าหน้าที่กองบัญชาการกลาโหม")
	await novel_interface.show_dialog("ดี. การเคลื่อนทัพภายนอกของกองทัพเป็นอย่างไร?", "Mariru")
	await novel_interface.show_dialog("หน่วยปฏิบัติการพิเศษกำลังวางกำลังอาวุธหนักภายในรัศมี 2 กิโลเมตรรอบเขตความผิดปกติ แต่เรายังยืนยันระดับภัยคุกคามไม่ได้", "นายทหาร")
	await novel_interface.show_dialog("แล้วการควบคุมสื่อล่ะ?", "Mariru")
	await novel_interface.show_dialog("ตามโปรโตคอล เรากำลังดำเนินการ C-13", "นายทหาร")
	await novel_interface.show_dialog("ดี. จากนั้นนับจากนี้เป็นต้นไป หน่วยข่าวกรองลับ (SID) จะเข้าครอบครองโซนแกนหลักที่ผิดปกติ", "Mariru")
	await novel_interface.show_dialog("พวกคุณทุกคนก็ย้ายออกไปทันทีเช่นกัน!", "Mariru")
	await novel_interface.show_dialog("ใช่!", "การสื่อสารทางทหาร")
	await novel_interface.show_dialog("อะเอาล่ะ...\nคุณควรจะดูแลตัวเองให้ดีกว่านี้นะ", "เจ้าหน้าที่กองบัญชาการกลาโหม")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
