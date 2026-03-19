# chapter2_ex01.gd - 第二章番外1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex01_script()

func play_script():
	pass

func chapter2_ex01_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("ふっふふ～ん、テストの時間だっ！", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("まずはこれらの口紅の正確な色を名前で答えて！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("はぁっ？こ、こ、この9つの口紅……\\n全部赤色じゃないのっ！？", "小憐")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("あ、待って、こいつらだけが紫色のような……？", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("う～～んと…………全然ダメ―――ッ！！", "愛衣")
	await novel_interface.show_dialog("ピーチピンク、コーラルピンク、ローズピンク、\\nチェリーピンク、マゼンタピンク、パープル、\\nグレープ、ラベンダー……\\n基本的な色分けすらできないのは、0点っ！", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("じゃあ次の問題だ！この口紅の中で、どれが\\n今年のYYLのバレンタイン限定モデルかな？\\nこれはサービス問題よ！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("えっ…、ラベルとか見当たらないんだけど……\\nバレンタインってことは……、\\nこのちっちゃいハートマークがあるやつ？", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("はい！アウト──！一番安物を選ぶだなんて……\\nバレンタインにこれを女の子に贈ってしまったら\\n即！絶！交！　0点っ！", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("ん～む。これじゃあ記述問題も望み薄そうだね。\\nこのMECのリップの素材を書いてみて～～", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("素材？……ベルベット……だっけ？\\nいや、違う……シルク？", "小憐")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("えっと……あの単語はなんだったっけ？\\n暗記したのに全然思い出せないぞ！ちくしょう！", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("いやぁ～～～\\nこの子ったら本当に素質ないわ……", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("そんな素質はいらんわッ！", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("最後にもう1問だけ試してみましょうか……", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("史上初の合成香水の名前！\\nそして店頭価格はいくらでしょうか！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("うっ！……その部分は完全に忘れた！\\n香水なんて無理だよ～～……", "小憐")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("価格か……こんなちっちゃいボトル……\\nえっと……800円ぐらい？", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("ぷふ───ッ！", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("違う違う違ぁ――う！\\nはぁ……こっちの方面は本当にダメダメだね！", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("うぅっ……", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("ぷく……くはははははっ！", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("そこっ！！　マリルッ！！！　笑うなッ！！！", "小憐")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
