# chapter2_ex01.gd - 第二章番外1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex01_script()

func play_script():
	pass

func chapter2_ex01_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Xin chào. Thời gian cho một bài kiểm tra!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Đầu tiên, hãy kể tên màu sắc của những thỏi son này.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Err... Err... Chín thỏi son này... \\nTất cả đều màu đỏ, phải không?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Đợi đã, một số trong số chúng có màu tím phải không?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Bạn đã hiểu sai hết rồi!!", "Ai")
	await novel_interface.show_dialog("Đào, san hô, đỏ tươi, anh đào, tím đậm, tím nhạt, nho và hoa oải hương. 0 điểm!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Tiếp theo, đâu là phiên bản giới hạn YYL dành cho ngày Valentine? \\nĐây là điều hiển nhiên.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Cái gì, không có logo ở đâu cả... \\nCái này có thiết kế hình trái tim à?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Đó là cái rẻ nhất. Các cô gái sẽ nói lời tạm biệt ngay lập tức nếu nhận được món quà này vào ngày lễ tình nhân. 0 điểm!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Bây giờ hãy điền vào chỗ trống: kết cấu của son dưỡng môi MEC này như thế nào?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Kết cấu? Nhung? \\nKhông... mượt?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("Từ gì vậy? \\nTôi đã học thuộc lòng nhưng bây giờ không nhớ được! Chết tiệt!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("Không ổn... Bạn không có nó trong người!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("Tôi không cần phải có nó…", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Được rồi, câu hỏi cuối cùng...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Tên của loại nước hoa trừu tượng đầu tiên là gì? Giá nhãn của nó là bao nhiêu?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Ờ… tôi hoàn toàn quên mất! \\nNước hoa, bạn đã có tôi.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Giá của nó... Một chai nhỏ như vậy... \\nKhoảng… 10 đô la?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Rất tiếc.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Sai rồi! Tất cả đều sai! \\nBạn thật khập khiễng biết bao!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Ôi chao...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Hahaha.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! Đừng cười nhạo tôi nữa!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
