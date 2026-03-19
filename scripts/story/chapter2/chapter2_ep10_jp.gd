# chapter2_ep10.gd - 第二章第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep10_script()

func play_script():
	pass

func chapter2_ep10_script():
	novel_interface.change_music("res://assets/audio/music/Witch's Confession.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("……", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("小憐が部屋を出た後、マリルは険しい表情で手元の端末を見つめていた。")
	await novel_interface.show_text_only("彼女の目の前に映し出されていたのは、絶えず変化する長いデータの流れ。")
	await novel_interface.show_text_only("画面上では『ロック』されていたはずのプロフィールが、勝手に書き換わり始めている。")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("（どういうことだ！　『イージス』はどんなネットワーク攻撃でも防げるはず……）\n（まさか元老院の連中か……）", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("『憐』の履歴は一度すべて意味不明の文字列に化けた。だが画面の点滅に合わせるように、少しずつ意味のある情報へ修正されていく。")
	await novel_interface.show_text_only("解読不能な状態から正常な記録へ戻っていく間も、『イージス』主機の攻性防火壁は一切警告を発しない。")
	await novel_interface.show_text_only("マリルの腕時計の文字盤では、赤いアルファベットの『T』が点滅していた。")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("（『イージス』主機上でこれほど大規模な改竄が起きているのに……）\n（『Themis』だけが異常に気づいたというのか……）", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("手元の端末には、『憐』の来歴が完全に更新されていた。幼稚園から小学校、中学校に至るまで、ずっと私立校に通っていたことになっている。")
	await novel_interface.show_text_only("成績表、卒業証書、受賞歴、医療記録、保険記録……そのどれもが、恵まれた裕福な家庭環境を物語っていた。")
	await novel_interface.show_text_only("だが少し前、少女の両親と兄は海外で飛行機事故に遭い、命を落としたことになっている。")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("『戦後児童保育法』に基づき、かつて志願登録していたSS級科学者が、この少女の監護人として割り当てられた……", "マリル")
	await novel_interface.show_dialog("（まさか私の記録まで……！）\n（やはり……これは挑発なのか？）", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("教師の所見には、こんな一文まであった。『兄の仕草を真似するのが好きで、女の子らしい慎みが足りない』——。")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("（ここまで偽装できるのなら、情報部の連中にも見習わせたいものだ）", "マリル")
	await novel_interface.show_dialog("（もし監護人が別人だったら、私ですら真偽を見分けられなかっただろう）\n（……他人の記録を移植したのか？）", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("（本部では徹底した盗聴検査をやり直す必要がありそうだ）", "マリル")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("（まだ下に写真が……？）", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("……！！", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("記録には一枚の写真も添付されていた。少女の両親の遺品という扱いらしい。")
	await novel_interface.show_text_only("写真の中では、幼い小憐が短い髪で、得意げに自分の絵を掲げている。")
	await novel_interface.show_text_only("少女が描いたのは小さな人魚。右下には幼い字で、一行の英語が添えられていた。『I have red hair too』")
	await novel_interface.show_dialog("……", "マリル")
	await novel_interface.show_dialog("ふふふふ、そういうことか……", "マリル")
	await novel_interface.show_dialog("合成写真とはいえ、子供の頃の姿はなかなか可愛いじゃないか〜", "マリル")
	await novel_interface.show_dialog("この子に、綻びひとつない経歴を用意して。", "マリル")
	await novel_interface.show_dialog("そのうえで、同時に『この子は特別だ』と私に知らせたかったわけだな？", "マリル")
	await novel_interface.show_dialog("最初から、私に隠し立てするつもりはなかった。", "マリル")
	await novel_interface.show_dialog("だからわざわざ、私が子供の頃に描いたこの絵を選んだ——", "マリル")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("私に伝えたかったのは、こういうことか……", "マリル")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("イージス……", "マリル")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
