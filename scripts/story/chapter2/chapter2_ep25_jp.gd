# chapter2_ep25.gd - 第二章第25话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep25_script()

func play_script():
	pass

func chapter2_ep25_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	await novel_interface.show_text_only("ここは一体どこだ？\\n辺りには濃い霧が漂っていて、\\n誰かが遠いところに立っているように見える。")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("レン…………", "謎の影")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("…………誰だ？")
	await novel_interface.show_text_only("その影はだんだん俺に近付いてきた……")
	await novel_interface.show_text_only("それは奇妙な黒装束を着た人物。\\n冷淡な薄赤い瞳でこちらを見つめている……")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("まなざしの奥では、\\n狡猾な笑みを浮かべているかのように感じた。")
	await novel_interface.show_text_only("──アイツを俺は、すごく知っている気がする。")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("まで…………その時…………やがて…………", "謎の影")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("何を言っているんだ？\\n\\nおい──！　待って！")
	await novel_interface.show_text_only("……")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("あ──！", "小憐")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("窓の外はほの暗く、まだ日も昇っていない。\\n空には一抹の柔らかな光だけ。")
	await novel_interface.show_text_only("昨日は疲れすぎて、パジャマに着替えた後、\\nそのまま直ぐにベッドに倒れこんでしまった。\\n……だからあんな夢を見たのか？")
	await novel_interface.show_text_only("夢の中のシーンを思い出そうとしたが、\\nどうしても、アイツの発した言葉が思い出せない")
	await novel_interface.show_dialog("どうしてあんな夢を見たんだろう……\\nなんだか嫌な予感がする。", "小憐")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("あっ！　もう起きてたのねっ？", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("アニー……起きるの早いね。", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("大変なのっ！\\nさっきマリルさんから急ぎの電話があって、\\nメールの中のニュースを見てみろって……", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("分かったよ……\\n全く、少しも休めやしないな……", "小憐")
	await novel_interface.show_dialog("（アニーはいつも通り……良かった）\\n\\n（あれはやっぱり、ただの夢だったんだな）", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ほっと一息も束の間、\\n俺は急いで着替えてパソコンの前に座った。\\nマリルから届いたメールに添付されている、\\nニュースのリンクをクリックしてみた。")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("ま～た『異質物』の盗難か、\\n本当に世の中、穏やかじゃないな……", "小憐")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("でもこれって第二学園都市の事じゃないか、\\nSIDと全然関係ないし……\\nそれに……", "小憐")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("……待ってよ！？　何だよこれッ！？！？", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("早朝だけど、世界各地のウェブサイトのトップは全て同じ内容のニュースに更新されている。")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("謎の男がアルカトラズ収容基地に侵入、同基地に\\n保管されていた古代のEX級『異質物』を強奪。")
	await novel_interface.show_text_only("指名手配の情報は以下の通り──\\n性別：男性　年齢：15-18歳。\\n現時点での情報はたった1枚の写真のみ。")
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("この指名手配されている容疑者の顔は、\\n俺が一番よく知っている……")
	await novel_interface.show_dialog("……これは……俺？", "小憐")
	await novel_interface.show_text_only("正確に言えば、俺がまだ男だった時の姿だ。")
	await novel_interface.show_text_only("この男に奪われた異質物は未だ公表されていない\\nだが、指名手配上は危険レベルがAAAと\\n判定されている。")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("……なんでこんな事に？")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("一体……何が起きてる……？", "小憐")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
