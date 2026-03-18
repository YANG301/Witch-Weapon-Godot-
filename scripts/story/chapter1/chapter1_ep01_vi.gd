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
		"『Vật dị chất』—— thông tin hoặc vật mang có thể gây ra hiện tượng vật lý siêu thường khi thỏa mãn những điều kiện nhất định.",
		"Những hiện tượng ấy không bị ràng buộc bởi bất kỳ rào cản đã biết nào như chiều không gian, thời-không hay tâm trí.",
		"Từ rất lâu nay, 『Vật dị chất』 vẫn luôn ẩn nấp quanh chúng ta.",
		"Vì phần lớn chúng có hình dáng giống đồ dùng thường ngày nên con người rất khó phát hiện ra.",
		"Tuy nhiên, chỉ cần bị kích hoạt theo một phương thức nhất định, chúng có thể gây ra những hiện tượng bất thường vượt ngoài phạm vi hiểu biết của loài người.",
		"Để bảo vệ loài người mong manh này, chúng tôi vẫn luôn dốc toàn lực ngăn chúng lộ diện trước công chúng.",
		"Bởi vì sự tồn tại của những dị thường ấy sẽ làm lung lay trật tự khó khăn lắm mới có được ngày hôm nay!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Kể từ vụ tai nạn rơi máy bay mang mã DA154 đó,\n『Vật dị chất』 bắt đầu liên tiếp được phát hiện ở khắp nơi trên thế giới.","Hồ sơ")
	await novel_interface.show_dialog("Mọi nỗ lực của chúng tôi đều đã thành công cốc rồi……","Hồ sơ")
	await novel_interface.show_dialog("Không ai biết ai đã tạo ra chúng.","Hồ sơ")
	await novel_interface.show_dialog("Khi khoa học vẫn chưa thể giải thích nguyên lý của chúng, công chúng và truyền thông lại thích gọi chúng là……『Thần tích』.","Hồ sơ")
	await novel_interface.show_dialog("Người ta tin rằng đó là ân huệ của thần linh.","Hồ sơ")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Cho đến khi một số 『Thần tích』 sở hữu sức mạnh khổng lồ bị vũ khí hóa.","Hồ sơ")
	await novel_interface.show_dialog("Một lần nữa, loài người không hề do dự cầm lấy thứ vũ khí mà chính mình cũng không thể lý giải để tàn sát lẫn nhau.","Hồ sơ")
	await novel_interface.show_dialog("Và cuộc chiến ấy kéo dài suốt 7 năm……","Hồ sơ")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Cuối cùng, sáu quốc gia đi đầu trong lĩnh vực nghiên cứu 『Vật dị chất』 đã ký kết hiệp ước hòa bình.","Hồ sơ")
	await novel_interface.show_dialog("Để xoa dịu làn sóng chán ghét chiến tranh đang dâng cao trong dân chúng, đồng thời tuyên truyền tính vô hại của việc nghiên cứu công nghệ dị chất.","Hồ sơ")
	await novel_interface.show_dialog("Sáu quốc gia ấy nhất trí thông qua nghị quyết, bắt đầu gọi thủ đô của mình là\n『Thành Phố Học Viện』 (Academy City).","Hồ sơ")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『Thành Phố Học Viện』…… đúng là một cái tên đầy châm biếm."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Căn cứ Alcatraz",
		"Vùng lõi Thành Phố Học Viện Thứ Hai",
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
		"Ba ngày trước..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Trung tâm Nghiên cứu Giam giữ Stilmont",
		"Thành Phố Học Viện Thứ Năm",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Hệ thống nhận diện Aegis đã khởi động.", "Hệ thống")# color tags supported here
	await novel_interface.show_dialog("Rất hân hạnh được phục vụ quý khách.", "Hệ thống")
	await novel_interface.show_dialog("Xin vui lòng xác nhận danh tính của bạn.", "Hệ thống")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
