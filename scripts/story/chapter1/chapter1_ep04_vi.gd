# chapter1_ep4.gd - Chapter 1 Episode 4
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep4_script()

func play_script():
	pass

func chapter1_ep4_script():
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-1.ogv"
	])
	await novel_interface.show_text_only("……")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("Ừm……?",GameConfig.player_name)
	await novel_interface.show_dialog("(Ơ, rốt cuộc đã xảy ra chuyện gì nhỉ)",GameConfig.player_name)
	await novel_interface.show_dialog("Đau quá……",GameConfig.player_name)
	await novel_interface.show_dialog("(Phải rồi, mình bị người ta tập kích……)\n(Rồi còn chui vào trong cái bóng của món trưng bày gần đó……)",GameConfig.player_name)
	await novel_interface.show_dialog("Xung quanh mình là những thứ giống như phiến đá\n(Trên đó khắc đầy hoa văn và chữ viết kỳ quái……)",GameConfig.player_name)
	await novel_interface.show_dialog("(Trên bảng tên món trưng bày có ghi Miskatonic……)\n(Phần phía sau thì mờ mất rồi)",GameConfig.player_name)
	await novel_interface.show_dialog("Yên tĩnh quá……",GameConfig.player_name)
	await novel_interface.show_dialog("Đám người kia đã đi chỗ khác rồi sao?",GameConfig.player_name)
	await novel_interface.show_dialog("Ra xem tình hình một chút vậy.\nHội trường…… Liliu……",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Đây là…… mình đang mơ sao……?\nRốt cuộc là chuyện gì vậy??",GameConfig.player_name)
	await novel_interface.show_text_only("Giữa một biển lửa, trước mắt tôi là khung cảnh như một khu vườn tượng đá\nnhững động tác của con người vẫn sống động, nét mặt vẫn rõ ràng……")
	await novel_interface.show_text_only("Thế nhưng họ đã đánh mất màu sắc của con người, trở nên trắng bệch hoàn toàn.")
	await novel_interface.show_dialog("Chuyện này, chuyện này…… sao có thể……",GameConfig.player_name)
	await novel_interface.show_dialog("Đừng mà……\nMọi người đều…… bị sao vậy…… chị Liliu…… đang ở đâu……",GameConfig.player_name)
	await novel_interface.show_dialog("Rốt cuộc ai đó…… nói cho tôi biết đi a a!!",GameConfig.player_name)
	await novel_interface.show_text_only("Khi tôi đưa tay ra định chạm vào gương mặt lạnh băng của một người phụ nữ, cổ cô ấy lặng lẽ gãy lìa, đầu rơi xuống đất rồi vỡ tan thành nhiều mảnh.")
	await novel_interface.show_dialog("Đây là…… muối sao??",GameConfig.player_name)
	await novel_interface.show_dialog("Ư…… ư……\nUwaaaa!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("Uwaaaa!!!!\nAaaaaaaaaaaaaaaaaa!!!!!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
