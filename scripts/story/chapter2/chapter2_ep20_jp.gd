# chapter2_ep20.gd - 第二章第20话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep20_script()

func play_script():
	pass

func chapter2_ep20_script():
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	await novel_interface.show_text_only("江森変電所は、戦前に建てられた\\n大型の屋外変電所で、\\n第一学園都市の江森重工が買収したものだ。")
	await novel_interface.show_text_only("ここ数年『協定区域』の電気需要の急増を\\n皮切りに、供給力を急激に拡大した。\\n現在の最大供給量は20倍にも拡張されている。")
	await novel_interface.show_text_only("俺とアニーは金網の欠けたところから用心深く\\n変電所に侵入した。")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("ここが指定された場所か、なんだか雰囲気が\\nおかしいな………遅かったのか？", "小憐")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("こうしている瞬間も、変電所の周辺はブーンと\\n電流の過負荷時に響く特有の音を発生させ、\\n設備からは時折火花が飛び散っている。")
	await novel_interface.show_text_only("地面と壁には大きな樹木模様の焼け跡が幾つも。\\nまるで雷に侵食されたかのようだ……")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("この前の異変区域のような感じはしないけど……\\n\\nマリルさんは私達に変圧器の修理をさせる\\nつもりじゃないよね？", "アニー")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("物理の授業の電気何とか系は、\\n私、一番頭が痛くなるのに……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("アニーの声が震える。見分けがつかない\\n左手と右手の法則に支配されていた、\\nあの恐怖をきっと思い出しているのだろうか。")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("待って、聞こえる──\nこの先に、なんか……", "小憐")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("何の音！？", "小憐")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("う、上ッ！　上に──", "アニー")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("見上げると、空が雷光に彩られている。\\n\\nその中に、体形に不釣り合いの金属グローブを\\n装着した青髪の少女がいた。")
	await novel_interface.show_text_only("少女の周囲には猟奇的な動きをしている連中が、\\n手を休めず連続の猛攻撃を仕掛けている。")
	await novel_interface.show_text_only("そのうち1人の女性は、火の玉のようなものを\\n全身に纏っていた。")
	await novel_interface.show_text_only("喉からケラケラと甲高い声を出し、\\n本能的な不快感を覚える。")
	await novel_interface.show_text_only("他の人は……\\nいや、そもそも人かどうかも怪しい存在達は、\\n何かに支配されているようだった。")
	await novel_interface.show_text_only("次から次へと繰り出す猛烈な攻撃の動きに伴い、\\n四肢が人間ではありえない角度に曲がっている。")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("う……は、はぁ……はぁ……", "イルカ")
	novel_interface.character_dark()
	await novel_interface.show_text_only("青髪の少女は、連続の攻撃の下に晒され続けた。\\n\\n身体中傷だらけになるも、懸命に堪える事しか\\nできていない。")
	await novel_interface.show_text_only("あんな小さな子なのに、ボロボロに……\\n見た目からすると……10歳くらいかな？\\n女子……というより女児…？")
	await novel_interface.show_text_only("──なんて、今そういう細かい事を気にしてる\\n場合じゃないってッ！")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("アニー、ほら──", "小憐")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("偉大…なる…タカDůマm─smrti─ガハラ─\n微光……黄泉……ケケケケ…", "狂った襲撃者") #伟大……的……夕力Důマmーsmrti一ガハラ一\n微光……黄泉……咯咯咯咯……有符号高度bug
	await novel_interface.show_dialog("全部…全部…全部…\n全部全部全部全部ゼンブぜんぶ\nゼンブゼェンブゼェェンブゼェェエッッッ！！！", "狂った襲撃者")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("ぁ、ぁ、あぁッッ！！", "イルカ")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("あの女の子、もう堪えられないみたい！", "アニー")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("おまえら──\\nやめろぉッ！！", "小憐")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
