# chapter2_ep15.gd - 第二章第15话

extends Node2D



@onready var novel_interface = $NovelInterface



func _ready():

	await get_tree().process_frame

	chapter2_ep15_script()



func play_script():

	pass



func chapter2_ep15_script():

	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")

	novel_interface.change_background("res://assets/images/bg/School/BG_School_passage.png")

	novel_interface.show_character("ren_uniform","shy")

	await novel_interface.show_dialog("はぁ……やっぱスカートが短すぎるよ……\\n下がスースーする……", "小憐")

	novel_interface.change_expression("worry")

	await novel_interface.show_dialog("この数日、信じられないことが多すぎて……\n頭の整理が全然追いつかないよ……", "小憐")

	await novel_interface.show_dialog("都市が滅亡した夢を見て、\\n朝起きたら自分が女の子になっていて、\\nわけの分かんない敵に襲われて……", "小憐")

	await novel_interface.show_dialog("未だに実感が持てない。\\nだけど……", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_dialog("それではレンさん、お入りになられて。", "クラス担任")

	novel_interface.show_character("ren_uniform","gratified")

	await novel_interface.show_dialog("あ、はい！", "小憐")

	novel_interface.change_background("res://assets/images/bg/School/BG_School_classRoom.png")

	novel_interface.change_expression("awkward")

	await novel_interface.show_dialog("は、はじ……はじめまして！\nみなさん、おはようございます……私はレンです……", "小憐")

	novel_interface.change_expression("blush")

	await novel_interface.show_dialog("みなさんと同じクラスになれてうれしいです。\nこれからどうぞよろしくお願いします……", "小憐")

	await novel_interface.show_dialog("（ただ、女子高生として同級生になるなんて……）", "小憐")

	novel_interface.change_expression("shy_left")

	await novel_interface.show_dialog("（同級生という形で女子高生に囲まれるなんて）\\n\\n（……もう勘弁してくれ……）", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_dialog("それでは、後ろの空いてるお席に、\\nレンさんは座って下さいね。", "クラス担任")

	await novel_interface.show_dialog("（……この時期での転校生は珍しいわね）", "生徒A")

	await novel_interface.show_dialog("（なんかずっと俯いているみたいだけど……\\n　大人しい感じの子なのかな？）", "生徒B")

	await novel_interface.show_dialog("（だけど可愛い……髪の色は染めていたり？）", "生徒A")

	novel_interface.show_character("ren_uniform","shy")

	await novel_interface.show_dialog("みんな俺を見てる……\\nうぅ……前途多難だ……", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_uniform","sob")

	await novel_interface.show_dialog("や～っと……授業が終わった……前の学校じゃ、\\nこんなに疲れる事なんてなかったのに。\\nやはり偏差値が高い学校は違う……", "小憐")

	novel_interface.change_expression("shy_left")

	await novel_interface.show_dialog("（やばい……トイレに行きたい……）\\n\\n（あッ……！！）", "小憐")

	await novel_interface.show_dialog("（ダ、ダメだ、学校の女子トイレになんて\\n　絶対入れない……！）", "小憐")

	novel_interface.change_expression("shy")

	await novel_interface.show_dialog("はぁ、どうしよう……", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("anne_uniform","normal1")

	await novel_interface.show_dialog("どうしたの～～？　溜め息ばっか吐いちゃって。", "アニー")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_uniform","worry")

	await novel_interface.show_dialog("えっ？　アニー！", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("anne_uniform","normal1",0.25)

	await novel_interface.show_dialog("どう？ 新しい学校には慣れそうかな？\\nここにいる子達は可愛い子ばかりだもんね～～", "アニー")

	novel_interface.character_light(0.35,"awkward")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("うぅ……それはともかく。\nアニーの基礎知識訓練はもう終わったの？", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"smile")

	await novel_interface.show_dialog("えっへんっ！\\n試験に合格してからすぐに駆け付けて来たの！\\nだってレンちゃんを1人にすると、\\n何が起こるか分からないもん。", "アニー")

	await novel_interface.show_dialog("幸いにも私の空白だった時間は短かったから！\\n\\nあと、今の新豊洲は移民都市だし、\\n私でも簡単に慣れる事ができたよ。", "アニー")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("マリルさんからも、レンちゃんのお世話を\\nって頼まれちゃったからね～～\\nわざわざ、私達が同じクラスに編入するようにも\\n手配してくれたんだし。", "アニー")

	novel_interface.character_2nd_move_left(-0.25)

	novel_interface.show_character("ren_uniform","shy",0.25)

	await novel_interface.show_dialog("俺は大の男だぞ……\\nと、とにかく面倒なんか見なくていいって。", "小憐")

	novel_interface.character_2nd_light(0.35,"normal1")

	novel_interface.character_dark()

	await novel_interface.show_dialog("えへへ～。それにレンちゃんの隣にいた方が、\\n私も安心だから……", "アニー")

	novel_interface.change_2nd_expression("normal2")

	await novel_interface.show_dialog("レンちゃんは自分から進んで、\\n私と一緒にSIDに入ったって聞いたよ。", "アニー")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("アニーが感謝の表情を見せた。\\nだけど、俺はしばらく言葉に詰まった。\\nそもそも俺って試験を合格できるかすらも\\n分からないのに……")

	novel_interface.show_character("anne_uniform","normal1")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_light()

	novel_interface.show_2nd_character("ren_uniform","shy",0.25)

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("あっ　そうだ！\\n保健室の先生から伝言を頼まれたよ。\\n健康診断を受けに来なさい　だって。", "アニー")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"panic")

	await novel_interface.show_dialog("けっ、健康診断！！？", "小憐")

	novel_interface.character_light(0.35,"worry")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("私達は転校生だから、それぞれで健康診断が\\n必要みたいだね。\\nあれかな？\\nクラス全員でできなくて残念……？", "アニー")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"awkward")

	await novel_interface.show_dialog("誰がそんなっ！！\\nいや分かったよ、ただその前に……", "小憐")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("……うん？", "アニー")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"shy_left")

	await novel_interface.show_dialog("（ト…ト……イレ……）", "小憐")

	novel_interface.character_2nd_move_left(-0.25)

	novel_interface.show_character("anne_uniform","worry",0.25)

	await novel_interface.show_dialog("聞こえないよ〜。\nもっとちゃんと言って？", "アニー")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"shy_right")

	await novel_interface.show_dialog("一緒にトイレに付いて来てもらえませんか……", "小憐")

	await novel_interface.show_dialog("俺1人で行くと罪悪感で……入れない……", "小憐")

	await novel_interface.hide_2nd_character()

	novel_interface.show_character("anne_uniform","normal2")

	await novel_interface.show_dialog("ふふ……　「面倒見なくていい」って\\n言ったばっかりなのに～～", "アニー")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_uniform","shy")

	await novel_interface.show_dialog("いいから……早く……", "小憐")

	await novel_interface.hide_character()

	novel_interface.change_background("res://assets/images/bg/School/BG_School_passage.png")

	novel_interface.show_character("ren_uniform","worry")

	await novel_interface.show_dialog("（えっと……健康診断か……）", "小憐")

	novel_interface.change_expression("upset")

	await novel_interface.show_dialog("（元は男子だなんて、バレないよなっ！）", "小憐")

	novel_interface.change_expression("worry")

	await novel_interface.show_dialog("（健康診断は何を検査するんだろう？）", "小憐")

	await novel_interface.show_dialog("（と言うか……服を脱がないとダメだよな？）", "小憐")

	novel_interface.change_expression("shy")

	await novel_interface.show_dialog("（苦労したけど、ちゃんと下着を穿いてきて\\n　良かった……）", "小憐")

	await novel_interface.hide_character()

	novel_interface.change_background("res://assets/images/bg/School/BG_School_heathRoom.png")

	novel_interface.show_character("ren_uniform","gratified")

	await novel_interface.show_dialog("（保健室は……ここか？）", "小憐")

	await novel_interface.show_dialog("すみませ～ん\\n健康診断を受けに来た転校生ですけど……", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("ai","stare")

	await novel_interface.show_dialog("いやぁ～よく来た！待ってた！", "愛衣")

	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")

	novel_interface.show_character("ren_uniform","wry_smile")

	await novel_interface.show_dialog("あ、あああ、愛衣ッ！？", "小憐")

	novel_interface.change_expression("wail")

	await novel_interface.show_dialog("うわ、え、ちょっ…なんで愛衣が保健室にッ！？", "小憐")

	await novel_interface.hide_character()

	await novel_interface.hide_background_with_fade()

	novel_interface.show_character("ren_uniform","awkward")

	await novel_interface.show_dialog("えっ、えっ？？\\n愛衣、や、やめろ―――っ！！", "小憐")

	await novel_interface.show_dialog("ちょっと……その手に持ってる、その、如何にも\\n怪しい動きをしている機械。\\nなんだっ！？　何をするっ！？", "小憐")

	novel_interface.change_expression("sob")

	await novel_interface.show_dialog("うぎゃああああぁぁぁぁぁ―――ッ！！！", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("……")

	novel_interface.change_background("res://assets/images/bg/School/BG_School_heathRoom.png")

	novel_interface.show_character("ren_uniform","sob")

	await novel_interface.show_dialog("うううっ……なんてこったい……", "小憐")

	await novel_interface.show_dialog("あんな事やこんな事なんて……\\n\\n別にしなくてもよかったのに……", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ai","blush_stare",0.25)

	await novel_interface.show_dialog("大げさだねぇ～\\n普通の検査だよ、普通の～～", "愛衣")

	novel_interface.change_2nd_expression("blush_think")

	await novel_interface.show_dialog("……両眼視力2.0、パーフェクッツッ。\\n以前のデータと視力とか違ってたりする？", "愛衣")

	novel_interface.character_light(0.35,"panic")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("えっ？　前は左目が1.0で、右目が0.7でした。\nゲームする時はもっと画面から離れろって、\nお医者さんに言われてて……", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"blush_dizzy")

	await novel_interface.show_dialog("興味深い……レンちゃんの身体は遺伝子レベルで\\n再構成されたと予測されるわ。\\n全身の骨格すらも含めて全てが変化しているし。", "愛衣")

	novel_interface.change_2nd_expression("blush_think")

	await novel_interface.show_dialog("しかし脳の神経トポロジ構造が両性の特質を\\n同時に表現しているせいか、\\n記憶と思考の習慣はそのまま維持を続けて……", "愛衣")

	await novel_interface.hide_2nd_character()

	await novel_interface.show_text_only("愛衣は興奮している様子で、\\n声も若干上ずっている。")

	novel_interface.show_character("ai","blush_wink")

	await novel_interface.show_dialog("となると……理論上、あなたは他人の感情を\\n意識的に察知しやすいはず。女性脳的にね。", "愛衣")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_uniform","panic")

	await novel_interface.show_dialog("そ、そんな事ないと思うけど……", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_dialog("絶対有り得ない！　俺は100パーセント男性だ！　", "小憐")

	novel_interface.show_character("ai","think")

	await novel_interface.show_dialog("とにかく、医学上レンちゃんは100%女性だよ。\\n健康状態も完全に問題なし、ただし……", "愛衣")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_uniform","worry",0.25)

	await novel_interface.show_dialog("……ただし？", "小憐")

	novel_interface.character_light(0.35,"stare")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("そのうちお腹が痛くなる時期が来ると思うけど、\nそれ以外は問題ないよ〜\nもうすぐだと思うから、ちゃんと覚悟しておいてね。", "愛衣")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("お腹が、痛くなる……？", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,false,"wail")

	await novel_interface.show_dialog("……ほあぁっ――？？？", "小憐")

	novel_interface.change_2nd_expression("sob")

	await novel_interface.show_dialog("あ、あっ……愛衣、それって……！！", "小憐")

	await novel_interface.hide_2nd_character()

	await novel_interface.show_text_only("悔しさと無力感が混じって、もう泣きそう……\\nううう、男だろ、泣いちゃダメだ！！")

	novel_interface.show_character("ai","blush_think")

	await novel_interface.show_dialog("それにしても、本当にパーフェクッツッ。\\nナイスボディだよぉ……\\nこの年齢になっても、身体に傷跡1つ付いてない\\n人間なんていないからねぇ。", "愛衣")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_uniform","shy_left")

	await novel_interface.show_dialog("聞いてて少しも嬉しくねえッ！！", "小憐")

	novel_interface.change_expression("shy")

	await novel_interface.show_dialog("あの……俺、もう帰って……いい……？", "小憐")

	await novel_interface.hide_character()

	novel_interface.change_background("res://assets/images/bg/Shot/aiyi_pickwearing.png")

	await novel_interface.show_text_only("愛衣は白衣を脱ぎ捨て、\\n「え？ 今から本気だけど？」みたいな表情で、\\nクローゼットから2着の何かを取り出した……")

	await novel_interface.show_dialog("何を言ってるの。\\n本番はここからに決まってるじゃない……", "愛衣")

	await novel_interface.show_dialog("マリルもや～っと許可をくれたの。\\n色々な服をレンちゃんに着せてみようって………", "愛衣")

	await novel_interface.show_dialog("えっ、な、ぁっ――？", "小憐")

	await novel_interface.show_dialog("そして……ふふふ、大丈夫レンちゃんこれも実験\\n\\nレンちゃんのあらゆるデータを研究する使命が\\n『────私にはある！！』", "愛衣")

	await novel_interface.show_dialog("い、いや、いやぁ、あああ！！\\nいやあああああぁぁぁぁ――――ッッ！！！！", "小憐")



	print("=== 第二章第15话结束 ===")



	# 调用剧情结束函数

	await novel_interface.end_story_episode(0.5)

