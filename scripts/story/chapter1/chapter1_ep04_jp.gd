# chapter1_ep4.gd - 第1章第4話
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
	await novel_interface.show_dialog("…………うん……？",GameConfig.player_name)
	await novel_interface.show_dialog("(あれ……俺、何があったんだっけ……)",GameConfig.player_name)
	await novel_interface.show_dialog("ぃ…痛っ……",GameConfig.player_name)
	await novel_interface.show_dialog("(そうだ、襲われて……)\n(それで、近くの展示物の影に這い込んだんだ……)",GameConfig.player_name)
	await novel_interface.show_dialog("周りには石板みたいな物が並んでいて、\n(そこには奇妙な図形や文字が刻まれている……)",GameConfig.player_name)
	await novel_interface.show_dialog("(展示プレートにはMiskatonicって書いてある……)\n(その先は掠れて読めない)",GameConfig.player_name)
	await novel_interface.show_dialog("それにしても、静かすぎる……",GameConfig.player_name)
	await novel_interface.show_dialog("あいつらはもう別の場所に行っちゃったのかな？",GameConfig.player_name)
	await novel_interface.show_dialog("ちょっと、様子を見に行こう……\\n講義室……マリルさん……",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("これ、夢……だよな……？　\\n一体、どういう事だ？？",GameConfig.player_name)
	await novel_interface.show_text_only("火の海の中は、まるで彫刻園のように、\\n生き生きとした動きや表情を見せる人々がいた。")
	await novel_interface.show_text_only("しかし彼らからはすでに「人間の色」が\\n全て失われており、残るのは惨白のみ。")
	await novel_interface.show_dialog("こ、こんなの……ありえない……",GameConfig.player_name)
	await novel_interface.show_dialog("イヤだ……\\nみんな……どうしたんだ……\\nマリルさん……どこに行ったんだよ……？",GameConfig.player_name)
	await novel_interface.show_dialog("誰か…………何が起きたか俺に教えてくれ！！",GameConfig.player_name)
	await novel_interface.show_text_only("1人の女性の冷たい顔に触れると、\\n首が無言のままに崩れる。\\n彼女の頭部は床に落下し、バラバラに砕けた。")
	await novel_interface.show_dialog("……これは……塩？？",GameConfig.player_name)
	await novel_interface.show_dialog("うぅ…ぁ……\\nぁぁぁああああッ！！！！",GameConfig.player_name)
	await novel_interface.show_dialog("うわあああああ！！！\nあああああああああああああああ！！！！！！！！",GameConfig.player_name)

	print("=== 第1章第4話終了 ===")

	# エピソード終了処理
	await novel_interface.end_story_episode(0.5)
