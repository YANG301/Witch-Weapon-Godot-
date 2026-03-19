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
	await novel_interface.show_dialog("ここのバスタブは使い心地が最高だ。\\nマリルって本当にお金に糸目をつけないんだな…", "小憐")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("はあ～～ぁぁ～\\n\\nず～っとドタバタしてた後のお風呂は、\\nものすごくリラックスできるな～～……", "小憐")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("はい…………", "小憐")
	await novel_interface.show_dialog("これが、ほんとに俺の身体……なのか？", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ビックリするほど白い肌……\\n触ってみるとスベスベするし……")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("ほおぁぁ――ッ！　何しようとしてるんだ俺！\\n\\n……いや、現実を受け入れるしかないか。", "小憐")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("どうせ戻る方法が見つかるまで、\\nこれが俺の身体なんだ……", "小憐")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("それにしても、一日中謎の敵と戦ってたんだ！\\nお風呂もやっぱり気持ちいいもんさ！", "小憐")
	await novel_interface.show_dialog("しっかり洗おう……今日は疲れたんだ。", "小憐")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("ん……んん……とっ！", "小憐")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("まだ現在の自分の声にも慣れておらず、\\n猫撫で声のようなモノが出てしまう……", "小憐")
	await novel_interface.show_dialog("畜生……この声、なんか…………", "小憐")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("いやらしい………", "小憐")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("うーー", "小憐")
	await novel_interface.show_dialog("こんな身体、慣れるわけないだろぉ……！！", "小憐")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
