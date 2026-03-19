# chapter2_ep25.gd - 第二章第25话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep25_script()

func play_script():
	pass

func chapter2_ep25_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	await novel_interface.show_text_only("ฉันอยู่ที่ไหน? \\nฉันอยู่ในหมอกหนา ดูเหมือนจะมีคนอยู่ไกลออกไป")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "เงา")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… มีใครอยู่บ้าง?")
	await novel_interface.show_text_only("บุคคลนั้นค่อยๆเข้ามาใกล้...")
	await novel_interface.show_text_only("มันเป็นชายแปลกหน้าในชุดดำ ดวงตาของเขาเป็นสีชมพูและเย็นชา…")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("เขาซ่อนรอยยิ้มเจ้าเล่ห์ไว้ในดวงตาของเขา")
	await novel_interface.show_text_only("—เขาให้ความรู้สึกคุ้นเคยแก่ฉัน")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("ไม่จนกระทั่ง…เมื่อ…ในที่สุด…", "เงา")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("คุณกำลังพูดอะไร? \\nเฮ้-! รอ!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("อ่า—!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("มันยังอยู่ก่อนรุ่งสาง พระอาทิตย์ยังไม่ขึ้น มีเพียงแสงสีแดงอ่อนๆ ที่ขอบฟ้า")
	await novel_interface.show_text_only("เมื่อคืนฉันเหนื่อยมาก และไม่ได้เปลี่ยนเสื้อผ้าก่อนจะหลับไป นั่นเป็นเหตุผลว่าทำไมฉันถึงมีความฝันนี้?")
	await novel_interface.show_text_only("ฉันลืมตาขึ้นและพยายามนึกถึงความฝัน แต่ฉันจำไม่ได้ว่าเขาพูดอะไร")
	await novel_interface.show_dialog("ทำไมฉันถึงมีความฝันนั้น? บางสิ่งบางอย่างเป็นลางบอกเหตุ", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("อ่า! คุณตื่นแล้ว.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… คุณตื่นเช้ามาก", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("มีบางอย่างผิดปกติ Mariru เพิ่งโทรมาขอให้เราอ่านข่าวในอีเมลของเธอ!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("เอ่อ ก็ได้! \\nเธอขอพักเราหน่อยได้ไหม...", "Lian")
	await novel_interface.show_dialog("(เยี่ยมเลย Annie ก็เหมือนเดิม) \\n(นั่นมันก็แค่ความฝันแน่นอน)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ฉันถอนหายใจด้วยความโล่งอก และรีบเปลี่ยนเสื้อผ้า ฉันนั่งอยู่หน้าคอมพิวเตอร์ เปิดลิงก์ที่ Mariru ส่งมาให้ฉัน")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Substance H ถูกขโมยไปอีกแล้ว! โลกช่างวุ่นวายเสียนี่กระไร…", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("แต่มันเกิดขึ้นใน นครวิชาการแห่งที่สอง SID คืออะไร? \\nนอกจากนี้...", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… รอก่อน นี่มันอะไรกัน!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("แม้ว่าในช่วงเช้า ข่าวดังกล่าวก็พาดหัวข่าวในเว็บไซต์ข่าวเกือบทุกแห่งทั่วโลก")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("คลาส EX โบราณ Substance H ถ่ายโดยชายลึกลับขโมยศูนย์รวบรวมและวิจัยของ Akatraz")
	await novel_interface.show_text_only("ประกาศที่ต้องการระบุถึงชายคนหนึ่งอายุระหว่าง 15 ถึง 18 ปี \\nมีเพียงภาพของผู้ต้องสงสัยเท่านั้น")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("ใบหน้านี้ไม่มีใครคุ้นเคยกับใบหน้านี้มากไปกว่าฉันอีกแล้ว")
	await novel_interface.show_dialog("นี่คือ... ฉันเหรอ?", "Lian")
	await novel_interface.show_text_only("พูดให้ถูกคือฉันเองเมื่อตอนเด็กๆ")
	await novel_interface.show_text_only("ประกาศดังกล่าวไม่เปิดเผยรายละเอียดใดๆ ของ Substance H เขาได้รับระดับอันตรายที่ AAA")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… เป็นไปได้ยังไง?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("เกิดอะไรขึ้น?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
