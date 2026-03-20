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
	await novel_interface.show_dialog("レンちゃんおはよう～～！\\nどうしたの？　なんか元気ないね……", "アニー")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_uniform","speechless",0.25)
	await novel_interface.show_dialog("あぅ……昨日の検査で色々されて……\\nよく寝れなかったし、頭が重い……", "小憐")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("もしかして……\\nレンちゃんは慣れない場所だと眠れないタイプ？", "アニー")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"upset")
	await novel_interface.show_dialog("俺もよく分からないんだ……\\nなんかベッドの上だと息が苦しくって……", "小憐")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("息が苦しい？\\nんー…ちょっと待って……\\n普段はどんな姿勢で寝てるの？", "アニー")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("大体いつも、うつ伏せで寝てるけど……", "小憐")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("う、うつ伏せ……\\nそんなことしたら大きくならないよ……", "アニー")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire1")
	await novel_interface.show_dialog("一体、何が大きくならないんだ……", "小憐")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("レンちゃんは～～女の子としての自覚を～～\\nもっと持った方がいいよ～（ツンツン）", "アニー")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"shy")
	await novel_interface.show_dialog("んっ！……わ、分かったよ……\\nもう分かったって……", "小憐")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("まったくもう……\\nまだまだ慣れなきゃな点がいっぱいだね～～", "アニー")

	print("=== 第三章第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
