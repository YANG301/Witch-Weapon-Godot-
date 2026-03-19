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
	await novel_interface.show_text_only("Trạm biến áp Johnson là một cơ sở ngoài trời khổng lồ được xây dựng trước chiến tranh, sau đó được Johnson Heavy Industries của Thành phố Học viện Đầu tiên mua lại toàn bộ.")
	await novel_interface.show_text_only("Trong vài năm qua, nhu cầu điện tại 'Khu Hiệp định' đã tăng mạnh đến mức công suất của trạm biến áp hiện đã được mở rộng gấp 20 lần.")
	await novel_interface.show_text_only("Annie và tôi cẩn thận trượt vào trạm biến áp qua một khoảng trống trên hàng rào dây thép.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("Đây là điểm được chỉ định à, huh... Ở đây trông khá tệ.\nChúng ta có quá muộn không?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Tiếng vo ve của dòng điện quá tải vang vọng xung quanh trạm biến áp và tia lửa điện thỉnh thoảng phát ra từ các thiết bị điện.")
	await novel_interface.show_text_only("Mặt đất và các bức tường đầy những vết cháy phân nhánh, như thể bị sét đánh...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Điều này không có cảm giác giống những vùng dị thường khác chút nào. Mariru không thực sự mong đợi chúng ta sửa chữa máy biến áp, phải không?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("Bộ phận điện trong lớp vật lý... đó là phần khiến tôi đau đầu nhất...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Giọng của Annie run rẩy như thể cô ấy vừa nhớ lại nỗi kinh hoàng khi không bao giờ có thể phân biệt được quy tắc bên trái với quy tắc bên phải.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Đợi đã, nghe này—\nPhía trước...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Đó là cái gì vậy?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-Trên kia—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Tôi nhìn lên và thấy một cô gái tóc xanh trên không, được bao phủ bởi điện, đeo găng tay kim loại quá lớn so với thân hình nhỏ bé của cô ấy—")
	await novel_interface.show_text_only("Xung quanh cô, một nhóm nhân vật có hành động kỳ lạ đang thay phiên nhau tung ra những cuộc tấn công dã man.")
	await novel_interface.show_text_only("Một trong số họ là một người phụ nữ được bao quanh bởi những thứ trông giống như ngọn lửa ma quái.")
	await novel_interface.show_text_only("Một âm thanh chói tai phát ra từ cổ họng cô ấy, theo bản năng khiến tôi nghiến răng.")
	await novel_interface.show_text_only("Và những người khác... hay bất kể họ là ai, bởi vì tôi thậm chí không chắc họ có phải là con người hay không, dường như bị điều khiển bởi thứ gì đó.")
	await novel_interface.show_text_only("Khi hết đợt tấn công này đến đợt tấn công khác ập xuống, ngay cả cơ thể của chúng cũng bị biến thành những góc không thể tin được cùng với chuyển động của chúng.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Hah... h-haah...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Dưới sự tấn công không ngừng nghỉ, cô bé tóc xanh đã đầy vết thương và chỉ có thể tự vệ một cách khó khăn.")
	await novel_interface.show_text_only("Không... gọi cô ấy là con gái thậm chí có thể là quá đáng. Cô ấy giống một đứa trẻ hơn... cô ấy trông chỉ khoảng mười tuổi.")
	await novel_interface.show_text_only("...Uh, đây có thực sự là lúc để chú ý đến chi tiết đó không?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, nhìn này—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("The... tuyệt vời... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Kẻ tấn công điên cuồng")
	await novel_interface.show_dialog("Tất cả bọn họ... tất cả bọn họ... tất cả bọn họ... MỌI NGƯỜI CUỐI CÙNG!!!", "Kẻ tấn công điên cuồng")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ờ—!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("Cô bé đó không thể chịu đựng được lâu nữa!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Lũ khốn nạn—\nDừng lại ngay!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
