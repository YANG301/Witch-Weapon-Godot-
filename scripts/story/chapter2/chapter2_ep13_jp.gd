# chapter2_ep13.gd - 第二章第13话

extends Node2D



@onready var novel_interface = $NovelInterface



func _ready():

	await get_tree().process_frame

	chapter2_ep13_script()



func play_script():

	pass



func chapter2_ep13_script():

	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")

	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")

	novel_interface.show_character("liliu_research","normal")

	await novel_interface.show_dialog("新しい学校へ転入する前に、基礎知識に関する\\n『訓練』を最初の任務として与えよう。", "マリル")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","worry",0.25)

	await novel_interface.show_dialog("うん？基礎知識？　俺はアニーみたいに数年分の\\n知識が欠けているわけじゃないけど……", "小憐")

	novel_interface.character_light(0.35,"happy")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("んん～～？ お前は女の子としての知識を～～\\n十数年分欠いているわけだが～～？", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"wry_smile")

	await novel_interface.show_dialog("そ、そんな知識は必要ないっ！", "小憐")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("マリルは俺の抗議を無視し、生き生きと机の方へ\\n移動する。\\n机の上には、色々な道具が用意されてる事に\\n気が付いた。")

	novel_interface.show_character("liliu_research","speak")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_light()

	novel_interface.show_2nd_character("ren_battle","wry_smile",0.25)

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("まずは、口紅12種類の基本色を見分けて、\\n人気TOP20のブランドを全部覚えろ。", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"smile")

	await novel_interface.show_dialog("こんなにあるのか……\\nどれも色同じじゃないのコレ？", "小憐")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,true,"smile")

	await novel_interface.show_dialog("甘いわっ！\\nこれは全体の10分の1にも満たない！！", "マリル")

	novel_interface.change_expression("normal")

	await novel_interface.show_dialog("本日は化粧セットを一通り用意した──\\nファンデーション、アイシャドウ、リップ、\\nハイライト、シェーディング……", "マリル")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","sob")

	await novel_interface.show_dialog("えっ？　顔にこんなにいろいろ塗るの！？\n絵を描くんじゃないんだぞ……女の子ってそんなに\n大変なのかよ……", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_research","speak",0.25)

	await novel_interface.show_dialog("な～に心配はいらん。\\n今日からお前専属の先生が化粧を教えるからな。", "マリル")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("そもそも、高校生って化粧禁止じゃ……", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"happy")

	await novel_interface.show_dialog("お前はね、女子高生の世界を知らなさ過ぎる……\\n\\nそんないい加減な態度じゃ、半日も経たずに\\n疑われるぞ。", "マリル")

	novel_interface.change_2nd_expression("speak")

	await novel_interface.show_dialog("それに普通に登校する以外にも、SIDの捜査員\\nとして様々な任務をこなさなくてはならない。\\n化粧は女性エージェントの必須スキルの1つだ。", "マリル")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("とくに、お前みたいな可愛い顔立ちならなおさらだ。", "マリル")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("マリルは人差し指で俺の顎を軽く持ち上げた。")

	await novel_interface.show_text_only("彼女の手から逃げるように、俺は身を翻した。\\n\\nこれを許すと、男の尊厳が完全に奪われてしまう気がする。")

	novel_interface.show_character("ren_battle","shy_left")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_light()

	novel_interface.show_2nd_character("liliu_research","happy",0.25)

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("志願はしたけどさぁ、こんな事を学ばないと\\nいけないなんて聞いてないよ……", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"smile")

	await novel_interface.show_dialog("SIDの採用審査は非常に厳しく、\\n毎回大勢の受験者をふるいに落としている。", "マリル")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("あれだけの大口を叩いたんだ、\\n自分で実力を証明してみせろ。", "マリル")

	await novel_interface.show_dialog("最終審査さえ合格して正式な配属が決まれば、\\n相応の給料も出るぞ～～", "マリル")

	novel_interface.character_2nd_move_left(-0.25)

	novel_interface.show_character("ren_battle","smile",0.25)

	await novel_interface.show_dialog("えっ？　給料出るの！？\\n\\n（そ、それじゃ俺のGfatショッピングカートに\\n　入ってるモノを全部買える……！）", "小憐")

	novel_interface.character_dark()

	await novel_interface.show_text_only("よし、男の尊厳とやらは、一旦保留としよう。")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"speak")

	await novel_interface.show_dialog("（フハハハ、単純なガキめ）", "マリル")

	novel_interface.change_2nd_expression("angry")

	await novel_interface.show_dialog("それ相応の見返りがある以上、よく覚えておけ。\nお前にとって私は上官だ。私の命令は絶対、\n無条件で従うものと思え。", "マリル")

	novel_interface.character_2nd_move_left(-0.25)

	novel_interface.show_character("ren_battle","worry",0.25)

	await novel_interface.show_dialog("それで結局……何をすれば……", "小憐")

	novel_interface.character_2nd_light(0.35,"speak")

	novel_interface.character_dark()

	await novel_interface.show_dialog("先にお前に紹介するべき人物がいる──\\n\\nお前の化粧の先生にと、自ら名乗り出てくれた。", "マリル")

	novel_interface.change_2nd_expression("normal")

	await novel_interface.show_dialog("普段は試験薬や特殊装備の開発研究などを\\n担当しているんだが……", "マリル")

	await novel_interface.hide_all_characters()

	novel_interface.show_character("ai","dizzy")

	await novel_interface.show_dialog("あぁ………これが本物のレンちゃんね？\\nふふふ、このプロフィールは本当に面白いわ～～", "メガネをかけた女子")

	novel_interface.change_expression("normal")

	await novel_interface.show_dialog("こんにちは、私がSID戦術研究部の主任よ。\\nお互いプロフィールを編集された者同士、\\n仲良くしましょ？\\n私の事は愛衣って呼んで。", "メガネをかけた女子")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("ど、どうも……\\n（彼女のプロフィールも……編集されたのっ？）", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ai","blush_wink",0.25)

	await novel_interface.show_dialog("マ～リ～ル～、こんなにも素晴らしい研究素材\\nであるレンちゃんを、なんで……\\nなんで貸してくれないの～～！？", "愛衣")

	novel_interface.character_light(0.35,"panic")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("（？？？？？　研究……素材？　貸す……？）", "小憐")

	await novel_interface.show_dialog("（な、なんだか背筋が寒くなってきたぞ……）", "小憐")

	await novel_interface.hide_all_characters()

	novel_interface.show_character("liliu_research","happy")

	await novel_interface.show_dialog("この子の保護者は私だからな～～\\n勝手に手を出すなよ～～", "マリル")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ai","stare",0.25)

	await novel_interface.show_dialog("ちぇっ、分かったわよ……", "愛衣")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_left(0,0.3,false,"normal")

	await novel_interface.show_dialog("私は普段あまり化粧しないけど、そういうのは\nすごく簡単よ。10分もあれば全部覚えられたわ。", "愛衣")

	await novel_interface.show_dialog("あなたもすぐに覚えられるはずよ。", "愛衣")

	await novel_interface.hide_2nd_character()

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("10分でっ！？\\n手順とか複雑そうなんだけど……", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_research","smile",0.25)

	await novel_interface.show_dialog("愛衣は何でもすぐ覚えられるからな。\\nこれからは彼女から色々学んでくれ。", "マリル")

	novel_interface.character_light(0.35,"wry_smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("はぁ……\\n（言ったって記憶力の良し悪しは無理じゃん！）", "小憐")

	await novel_interface.hide_all_characters()

	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")

	novel_interface.show_character("ren_battle","sob")

	await novel_interface.show_dialog("あ～～う～～\\n\\n一日中愛衣と化粧品のブランドやら色やらを\\n勉強し続けて、頭が痛い……", "小憐")

	novel_interface.change_expression("panic")

	await novel_interface.show_dialog("………ってマリル！?　なんでここにいるの！？", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_research","speak",0.25)

	await novel_interface.show_dialog("うん？　この部屋は元々、私が新豊洲に\\n所持している住居の1つだ。\\nというか、このビル自体がSIDの資産だぞ？", "マリル")

	novel_interface.character_light(0.35,"wry_smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("すごいなおい！\\n\\nってちょっと待って、まさかここで\\n俺とアニーと一緒に暮らすとかじゃ……", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"smile")

	await novel_interface.show_dialog("たまに帰って来るぐらいだ、\\n常に住むわけじゃない。\\nあと冷蔵庫のビールが切れてるから、\\n今度2箱ぐらい買っておけよ？", "マリル")

	novel_interface.change_2nd_expression("normal")

	await novel_interface.show_dialog("でも今日は保護者として、わざわざ様子を見に\n来てやったんだよ。ありがたく思え〜", "マリル") #♪少一个音乐符？

	novel_interface.character_light(0.35,"wail")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("い、いやな予感っ！！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"speak")

	await novel_interface.show_dialog("ほ～れほれ、これがレンちゃんの制服だぞ～～\\nそしてこれが～～ワンピース～～", "マリル")

	novel_interface.character_light(0.35,"awkward")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("なんで……こんなにスカート短いの……", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"happy")

	await novel_interface.show_dialog("やっぱスカートはこれぐらいの長さがいいなぁ。", "マリル")

	novel_interface.character_light(0.35,"wry_smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("スカートの丈、絶対変えたなッ！！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"smile")

	await novel_interface.show_dialog("細かい事をいちいち気にするな！", "マリル")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("こちらはショートにハイソックス、ええと…\\nニーハイ、タイツと……\\nおお！　ガーターまであるぞぉ！", "マリル")

	novel_interface.character_light(0.35,"sob")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("なんで靴下だけでこんなに種類あるんだ……", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("パターンも色々用意しているぞぉ。\\nストライプ、パッチワーク、ドットなどなど！！\\nなるほど！　網タイツも試してみたいか？", "マリル")

	novel_interface.character_light(0.35,"perspire1")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("そんなの絶対いやだよ！！", "小憐")

	novel_interface.change_expression("awkward")

	await novel_interface.show_dialog("違うっ！　色々あり過ぎて呆れてたのっ！\\n要するにっ！！　こんなもの着ないっ！！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("いざ任務の時に駄々こねられても困るからな……\\nそれこそ早いうちに観念なさいなぁ……\\nそれとも……長官権限で、\\n私が直々に手伝ってあげようか？", "マリル")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0)

	await novel_interface.show_dialog("な……な……っ！！", "小憐")



	print("=== 第二章第13话结束 ===")



	# 调用剧情结束函数

	await novel_interface.end_story_episode(0.5)

