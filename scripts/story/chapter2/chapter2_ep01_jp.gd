# chapter2_ep01.gd - 第二章第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep01_script()

func play_script():
	pass

func chapter2_ep01_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/spSoundChannel.png")
	await novel_interface.show_dialog("何だと！？『イージス』の防衛圏内は、れっきとした我々都市防衛庁（MD）の管轄だぞ！", "防衛庁長官")
	await novel_interface.show_dialog("軍がどういう権限で指揮権を取り上げる！？\n納得のいく理由を示さない限り、警備封鎖の解除など認めん！！", "防衛庁長官")
	await novel_interface.show_dialog("これは機密事項だ。君に説明することも、その必要もない！", "軍部長官")
	await novel_interface.show_dialog("ここから先は我々軍の管轄だ。\n協力してもらう。", "軍部長官")
	await novel_interface.show_dialog("認めん！ これは防衛庁指揮下の作戦だ！！\n元老院の行政命令でもない限り……！", "防衛庁長官")
	await novel_interface.show_dialog("────ゴホン、少し失礼するが……", "女性の声")
	await novel_interface.show_dialog("君たち、まだそんなくだらないことで時間を浪費しているのか？", "女性の声")
	await novel_interface.show_dialog("この声は——\nマリル……マリル長官！？", "軍部長官")
	await novel_interface.show_dialog("お、お疲れ様です、長官殿！", "軍部長官")
	await novel_interface.show_dialog("秘密情報局（SID）はとっくに軍から独立している。長官と呼ぶ必要はない。", "マリル")
	await novel_interface.show_dialog("マリルか……ふん！", "防衛庁長官")
	await novel_interface.show_dialog("これはレベル4暗号化通信だぞッ！？\nいったいどうやって……", "防衛庁長官")
	await novel_interface.show_dialog("そんな些末なことは後回しよ～\n今はどう対処するかを考えなさい！", "マリル")
	await novel_interface.show_dialog("レベル4暗号化回線なんだから、回りくどいことは抜きで話しなさい。ここでの会話を他の誰かが聞くことはない——", "マリル")
	await novel_interface.show_dialog("持っている情報を全て出しなさい！！", "マリル")
	await novel_interface.show_dialog("あ、は、はい！　長官！", "軍部長官")
	await novel_interface.show_dialog("現在、研究所周辺の監視設備は全面的に機能不全に陥っており、大規模な時空波動も検知されています……", "軍部長官")
	await novel_interface.show_dialog("時空波動？\nそれは……？", "防衛庁長官")
	await novel_interface.show_dialog("『都市災害対策法』に明記されているでしょう……", "マリル")
	await novel_interface.show_dialog("まさか一般公開されていない機密条項だからといって、防衛庁は目も通していないのかしら？", "マリル")
	await novel_interface.show_dialog("うっ……ま、まさか……\n『異質物』の収容失敗……？", "防衛庁長官")
	await novel_interface.show_dialog("しかも昨夜は『ロス・ゴールド』が突如として消えた……", "マリル")
	await novel_interface.show_dialog("……新豊洲でこんな事態が起きるのは、もう六年ぶりでしょう？", "マリル")
	await novel_interface.show_dialog("最悪の可能性を想定しなさい——", "マリル")
	await novel_interface.show_dialog("わ、分かりました……", "防衛庁長官")
	await novel_interface.show_dialog("防衛庁は直ちに内側の封鎖を解除し、演習を名目に住民の避難を開始します……", "防衛庁長官")
	await novel_interface.show_dialog("よし。外周の軍の配置状況は？", "マリル")
	await novel_interface.show_dialog("特殊作戦部隊が異変区域の周囲二キロ圏内に重火力を展開中ですが、脅威レベルはまだ確定できていません。", "軍部長官")
	await novel_interface.show_dialog("報道統制は？", "マリル")
	await novel_interface.show_dialog("事前の協議に従い、ただいまC-13シナリオを実行中です。", "軍部長官")
	await novel_interface.show_dialog("よし。それではこの時点をもって、秘密情報局（SID）が異変核心区を引き継ぐ。", "マリル")
	await novel_interface.show_dialog("あなたたちも直ちに動きなさい！", "マリル")
	await novel_interface.show_dialog("はっ！", "軍部通信")
	await novel_interface.show_dialog("わ、分かりました……\nそちらもお気をつけて。", "防衛庁長官")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
