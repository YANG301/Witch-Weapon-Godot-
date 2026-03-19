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
	await novel_interface.show_dialog("さっきは本当に危なかった……\nやっと戻ってこられた～～", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+"、怪我してるの！？\n腕からこんなに血が出てるよ！", "アニー")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("大丈夫、ただの擦り傷だよ\nこれくらい男にとっては何でもない！", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("でも今は女の子なんだから、そんなに無理しちゃ駄目だよ！\nそれに足も捻ったんでしょ……", "アニー")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("うん……今回のことは簡単じゃなさそうだ。\nちゃんと片づけないと、まだ誰かが傷つくかもしれない……", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("お願いだから、もっと自分を大事にしてよ！\nまだ腕の血も止まってないんだから。", "アニー")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("うん、わかった。ありがとう、アニー〜", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("でも……まだ手がかりは何もないな……\nこのまま次の区域へ行ってみようか？", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("（突然目の前に現れる）この小娘……", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("マリル博士、あっ、いや、長官！\n私たちを待っていてくれたんですか？", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("私たち、次の区域を調べに行こうとしていたんですけど……", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("待て、お前……まさか今しがた戦ってきたのか！？", "マリル")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("えっと、私も……ただ、無理して少し試してみただけで……", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("私はちゃんと、お前に無理はするなと言ったはずだ！！", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("制御できない危険が起きたら、私にとっても莫大な損失だ！\nほら見ろ、もう怪我をしているじゃないか！", "マリル")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("医療班！　負傷者だ、応急処置をして、すぐ本\n部へ連れ帰れ！", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+"、マリル長官、すごく心配してるみたい……\n私たち、やっぱり戻った方がいいんじゃない？", "アニー")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("……うん", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("言葉にしにくい戸惑いが、そっと胸の奥に広がった。")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
