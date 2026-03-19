# chapter2_ep07.gd - 第二章第7话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep07_script()

func play_script():
	pass

func chapter2_ep07_script():
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/other/BG_City_street2.png")
	novel_interface.show_character("ren_battle","gratified")
	await novel_interface.show_dialog("Thật sự rất gần rồi...\nCuối cùng chúng tôi đã quay trở lại~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", bạn bị thương!\nCánh tay của bạn đang chảy máu rất nhiều!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Tôi không sao, chỉ là một vết xước thôi.\nLoại vết thương này chẳng là gì với một chàng trai cả!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Nhưng hiện tại bạn rõ ràng là con gái nên đừng cố gắng quá!\nVà bạn cũng bị trẹo mắt cá chân, phải không...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Vâng... việc này rõ ràng không hề đơn giản. Nếu chúng ta không giải quyết được tất cả rắc rối này,\nnhiều người có thể sẽ bị tổn thương hơn...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Xin hãy chăm sóc bản thân tốt hơn nhé?\nCánh tay của bạn vẫn đang chảy máu.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Tôi sẽ làm vậy. Cảm ơn, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Nhưng... chúng ta vẫn không có manh mối nào...\nChúng ta có nên tiếp tục đi kiểm tra khu vực tiếp theo không?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Đột nhiên xuất hiện trước mặt cô) Đồ nhóc con...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Tiến sĩ Mariru—à, không, Chỉ huy!\nBạn đang đợi chúng tôi phải không?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Chúng tôi vừa định đi điều tra khu vực tiếp theo...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Đợi một chút—có phải bạn... vừa đánh nhau với cái gì không?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Uh, tôi chỉ... cố gắng giúp đỡ một chút...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Tôi nhớ rõ ràng đã nói với bạn rằng đừng cố gắng quá sức!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Nếu có điều gì không thể kiểm soát được xảy ra với bạn, đó sẽ là một mất mát to lớn đối với tôi!\nNhìn bạn xem—bạn đã bị tổn thương rồi!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Đội y tế! Chúng tôi có một cô gái bị thương ở đây—chữa trị cho cô ấy ngay lập tức và đưa cô ấy về thẳng trụ sở!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", Chỉ huy Mariru có vẻ thực sự lo lắng cho bạn...\nCó lẽ chúng ta nên...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Ừ.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Một nỗi hoảng sợ mơ hồ khó tả lặng lẽ len lỏi vào lòng tôi.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
