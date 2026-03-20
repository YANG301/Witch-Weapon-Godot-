# chapter3_ep17.gd - 第三章第17话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter3_ep17_script()

func play_script():
	pass

func chapter3_ep17_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/School/BG_School_passage.png")
	novel_interface.show_character("anne_uniform","happy")
	await novel_interface.show_dialog("Chào buổi sáng, Ren! \\nSao hôm nay trông bạn có vẻ hơi khác lạ…", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("Phải, sau tất cả những cuộc kiểm tra thể chất ngày hôm qua… \\nTối qua tôi không thể ngủ ngon được. Bây giờ tôi cảm thấy choáng váng…", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Có phải cái giường không? Có lẽ bạn không ngủ ngon trên giường mới?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("Không có manh mối. Tôi hơi hụt hơi khi đang nằm trên giường ...", "Lian")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Hết hơi à? \\nĐợi đã ... Bạn ngủ theo tư thế nào?", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("À, nằm sấp như tôi vẫn thường làm.", "Lian")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("O-Nằm sấp ... \\nTư thế đó sẽ không giúp chúng phát triển ...", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("Giúp những gì phát triển?", "Lian")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Thôi nào, Ren. Bạn là con gái—bạn hiểu ý tôi mà ... (chọc).", "Annie")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("Waaah ... được rồi ... \\nTôi nghĩ bây giờ tôi hiểu rồi ...", "Lian")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Có vẻ như cậu vẫn còn một chặng đường dài phía trước, Ren…", "Annie")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
