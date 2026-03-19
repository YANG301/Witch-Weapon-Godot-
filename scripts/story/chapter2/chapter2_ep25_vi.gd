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
	await novel_interface.show_text_only("Tôi đang ở đâu? \\nTôi đang ở trong sương mù dày đặc. Hình như có ai đó ở đằng xa.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Bóng tối")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… Ai ở đó?")
	await novel_interface.show_text_only("Người đó từ từ đến gần…")
	await novel_interface.show_text_only("Đó là một người đàn ông kỳ lạ mặc đồ đen. Đôi mắt anh hồng hồng và lạnh lùng…")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Anh giấu nụ cười ranh mãnh trong mắt.")
	await novel_interface.show_text_only("—Anh ấy mang lại cho tôi một cảm giác quen thuộc.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Không cho đến khi… khi… cuối cùng…", "Bóng tối")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Bạn đang nói gì thế? \\nNày—! Chờ đợi!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Aa—!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("Vẫn còn trước bình minh. Mặt trời chưa lên. Chỉ có một chùm ánh sáng đỏ dịu ở phía chân trời.")
	await novel_interface.show_text_only("Đêm qua tôi mệt chết đi được, chưa thay đồ trước khi ngủ quên. Đó có phải là lý do tại sao tôi có giấc mơ này?")
	await novel_interface.show_text_only("Tôi mở mắt và cố nhớ lại giấc mơ. Nhưng tôi không thể nhớ được anh ấy đã nói gì.")
	await novel_interface.show_dialog("Tại sao tôi lại có giấc mơ đó? Có điều gì đó báo hiệu bệnh tật.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("À! Bạn tỉnh rồi.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Cậu dậy sớm thế.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Có gì đó không ổn. Mariru vừa gọi điện và yêu cầu chúng tôi đọc tin tức trong email của cô ấy!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Ờ, được thôi! \\nCô ấy có thể cho chúng ta nghỉ ngơi được không…", "Lian")
	await novel_interface.show_dialog("(Tuyệt vời, Annie vẫn giống như thường lệ) \\n(Đó chắc chắn chỉ là một giấc mơ.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Tôi thở phào nhẹ nhõm rồi nhanh chóng thay đồ. Ngồi trước máy tính, tôi mở link Mariru gửi cho tôi.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Một Substance H khác bị đánh cắp! Thật là một thế giới rắc rối…", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Nhưng nó đã xảy ra ở Thành Phố Học Viện Thứ Hai. Có chuyện gì với SID vậy? \\nBên cạnh đó…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Đợi đã. Cái gì thế này?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Mặc dù mới sáng sớm nhưng tin tức này đã tràn ngập tiêu đề trên hầu hết các trang tin tức trên toàn thế giới.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Cổ EX-class Substance H Được chụp bởi Người đàn ông bí ẩn trộm Trung tâm nghiên cứu và sưu tập của Akatraz")
	await novel_interface.show_text_only("Lệnh truy nã mô tả một người đàn ông ở độ tuổi từ 15 đến 18. \\nChỉ có hình ảnh của nghi phạm.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Không ai quen thuộc với khuôn mặt này hơn tôi.")
	await novel_interface.show_dialog("Đây là… tôi?", "Lian")
	await novel_interface.show_text_only("Nói chính xác hơn thì đó là tôi khi còn là một cậu bé.")
	await novel_interface.show_text_only("Thông báo không tiết lộ bất kỳ chi tiết nào về Substance H. Anh ta được xếp hạng nguy hiểm AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… Làm sao điều này có thể xảy ra được?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("Cái quái gì đang xảy ra vậy?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
