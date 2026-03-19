# chapter2_ex03.gd - 第二章番外篇03
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex03_script()

func play_script():
	pass

func chapter2_ex03_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/APT/washingRoom.png")
	await novel_interface.show_dialog("這裡的浴缸還真不錯啊～\\n莉琉真是不在乎花錢的性格……", "小憐")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("啊～～\\n折騰了一天之後好好的泡澡，最療癒了～～", "小憐")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("嗯……", "小憐")
	await novel_interface.show_dialog("這真的是……我的身體嗎？", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("皮膚白嫩得有些陌生……\\n摸起來還滑滑的……")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("啊！ 我在做什麼啊！ \\n哎，目前只能接受現實了。", "小憐")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("在找到恢復原狀的辦法之前，\\n這就是我……", "小憐")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("跟莫名其妙出現的敵人戰鬥了一整天，泡熱水澡真是好舒服啊～", "小憐")
	await novel_interface.show_dialog("認真擦洗一下吧……今天好累，一定流了很多汗……", "小憐")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("嗯啊～～", "小憐")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("依然無法適應自己的聲音，發出了小貓般低吟聲……", "小憐")
	await novel_interface.show_dialog("該死，這聲音，聽起來還真……", "小憐")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("下流……", "小憐")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("唔……", "小憐")
	await novel_interface.show_dialog("怎麼可能適應啊……這個身體！ ！", "小憐")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
