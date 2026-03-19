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
	await novel_interface.show_text_only("Sau khi Lian rời đi, Mariru nhìn chằm chằm vào thiết bị cầm tay của mình với vẻ mặt nghiêm trọng.")
	await novel_interface.show_text_only("Một dòng dữ liệu dài thay đổi mở ra trước mắt cô.")
	await novel_interface.show_text_only("Tệp trên màn hình được cho là ở trạng thái \"bị khóa\" đang thay đổi.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Làm sao điều này có thể xảy ra?! Aegis có thể phòng thủ trước bất kỳ cuộc tấn công mạng nào.)\n(Đây có thể là ai đó từ Thượng viện...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Toàn bộ lịch sử của Lian đã trở nên vô nghĩa. Khi màn hình nhấp nháy, văn bản bị cắt xén dần dần tự sửa thành thông tin có ý nghĩa.")
	await novel_interface.show_text_only("Từ những đoạn không thể đọc được đến một bản ghi hoàn toàn mạch lạc, tường lửa tấn công của Aegis không bao giờ đưa ra một cảnh báo nào.")
	await novel_interface.show_text_only("Trên mặt đồng hồ của Mariru, chữ \"T\" màu đỏ đang nhấp nháy.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Việc ghi lại dữ liệu ở quy mô này đang diễn ra trên máy tính lớn Aegis và chỉ \"Themis\" nhận thấy sự bất thường...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Trên thiết bị cầm tay, lịch sử cá nhân của Lian đã được cập nhật hoàn toàn.\nTừ mẫu giáo đến trung học cơ sở, cô theo học trường tư.")
	await novel_interface.show_text_only("Thẻ báo cáo, bằng cấp, giải thưởng, hồ sơ y tế, hồ sơ bảo hiểm...\nmọi chi tiết đều chỉ ra xuất thân gia đình giàu có, đặc quyền.")
	await novel_interface.show_text_only("Nhưng cách đây không lâu, bố mẹ và anh trai của cô gái đã qua đời trong một vụ tai nạn máy bay ở nước ngoài.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("Theo Đạo luật phúc lợi trẻ em thời hậu chiến, một nhà khoa học cấp SS từng đăng ký làm tình nguyện viên được chỉ định làm người giám hộ cho cô gái...", "Mariru")
	await novel_interface.show_dialog("(Đừng nói với tôi rằng ngay cả hồ sơ của tôi cũng bị thay đổi!)\n(Vậy đây thực sự là một sự khiêu khích...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Nhận xét của một giáo viên có nội dung: \"Cô ấy luôn thích bắt chước cách cư xử của anh trai mình và thiếu sự kiềm chế như một cô gái trẻ...\"")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Một sự giả mạo triệt để đến mức này... Tôi phải yêu cầu bộ phận thông tin nghiên cứu kỹ lưỡng.)", "Mariru")
	await novel_interface.show_dialog("(Nếu họ chỉ định một người giám hộ khác, ngay cả tôi cũng không thể biết đó là thật hay giả.)\n(...Họ đã cấy ghép hồ sơ của người khác à?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Có vẻ như trụ sở chính cần quét chống lỗi thích hợp.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(Có ảnh bên dưới nữa à?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("Một bức ảnh được đính kèm vào hồ sơ như một trong những đồ đạc của cha mẹ quá cố.")
	await novel_interface.show_text_only("Trong ảnh, cô gái trẻ Lian để tóc ngắn và tự hào khoe bức vẽ của mình.")
	await novel_interface.show_text_only("Cô gái đã vẽ một nàng tiên cá nhỏ. Bằng chữ viết tay trẻ con bằng tiếng Anh ở phía dưới bên phải là dòng chữ: \"Tôi cũng có mái tóc đỏ\"")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Hehehe... thì ra là thế này...", "Mariru")
	await novel_interface.show_dialog("Ngay cả khi đó là một bức ảnh tổng hợp, cô ấy thực sự rất đáng yêu khi còn nhỏ ~", "Mariru")
	await novel_interface.show_dialog("Bạn đã cho cô ấy một lịch sử cá nhân kín đáo.", "Mariru")
	await novel_interface.show_dialog("Đồng thời, bạn cũng đang nhắc nhở tôi rằng đứa bé này thật đặc biệt phải không?", "Mariru")
	await novel_interface.show_dialog("Ngay từ đầu anh đã không hề có ý định giấu em điều gì.", "Mariru")
	await novel_interface.show_dialog("Đó là lý do cậu cố tình chọn bức vẽ này mà tôi vẽ khi còn nhỏ—", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Vậy đó chính là những thông điệp bạn muốn truyền tải tới tôi...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
