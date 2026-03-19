# chapter2_ep14.gd - 第二章第14话

extends Node2D



@onready var novel_interface = $NovelInterface



func _ready():

	await get_tree().process_frame

	chapter2_ep14_script()



func play_script():

	pass



func chapter2_ep14_script():

	novel_interface.change_music("res://assets/audio/music/step by step.mp3")

	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")

	novel_interface.show_character("ren_battle","sob")

	await novel_interface.show_dialog("でも、俺は男の子に戻りたいんだよ……\\n一体どうすればいいんだ……", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_research","happy",0.25)

	await novel_interface.show_dialog("まあ……いっそこのまま女の子として生きるのも\n悪くないんじゃないか？", "マリル")

	novel_interface.character_light(0.35,"awkward")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("ええぇぇぇぇ？？\\nいっ！　やっ！　だっ！", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"normal")

	await novel_interface.show_dialog("お前が言っていたような都市全体が滅びる運命。\\n\\nそれが捻じ曲げられて、本当に幾千万の命が、\\n復活したのかもしれない……", "マリル")

	await novel_interface.show_dialog("それほどの奇跡を起こすのであれば、\\n何かしらの代償がいるだろう？", "マリル")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("もしその代償が……お前が今の姿になる事だけ\\nだとしたら？", "マリル")

	await novel_interface.hide_2nd_character()

	novel_interface.show_character("ren_battle","panic")

	await novel_interface.show_dialog("そんな……", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("liliu_research","smile")

	await novel_interface.show_dialog("それにしても……\\n\\nお前はもう15歳だろう？", "マリル")

	novel_interface.change_expression("speak")

	await novel_interface.show_dialog("その年頃の女の子なら\\nせめて……下着ぐらいは着けるべきだろう？", "マリル")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","shy_left",0.25)

	await novel_interface.show_dialog("────は？", "小憐")

	novel_interface.character_light(0.35,"smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("まだ成長期だし、これからたわわに実る時期……", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"awkward")

	await novel_interface.show_dialog("はーー？？", "小憐")

	novel_interface.character_light(0.35,"happy")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("着けないと色々困るぞ。\nたとえば走った時とかな。", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"shy")

	await novel_interface.show_dialog("し、下着って、お、え、まさか……！？", "小憐")

	novel_interface.character_light(0.35,"speak")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("そうだ。\\nお前ならこの可愛らしい少女モノのデザインとか\\n似合うと思うのだが？\\nお人形さんみたいな顔してるしなぁ～～", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"awkward")

	await novel_interface.show_dialog("ぜぜ、絶対に嫌ッ！！\\nお、俺は男なんだぞッ！！", "小憐")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("それにしてもその座り方……\\n意外と大胆だなぁ～～", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"blush")

	await novel_interface.show_dialog("お、お、お、お……\\n俺、トイレ行ってくるっ！！", "小憐")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,true,"smile")

	await novel_interface.show_dialog("おやおや～～　それにしても、\\nあの子……本当からかい甲斐があると言うか。", "マリル")

	await novel_interface.show_dialog("どうやら、これからは退屈せずに済みそうだ。", "マリル")

	await novel_interface.hide_character()

	novel_interface.change_background("res://assets/images/bg/APT/washingRoom.png")

	await novel_interface.show_text_only("鏡の中の自分を見つめ、先程の会話を思い出す。\\n\\nそして身体を壁に寄りかけながら、\\nゆっくりとうずくまった。")

	novel_interface.show_character("ren_battle","shy")

	await novel_interface.show_dialog("やっぱり、信じたくないよ……", "小憐")

	novel_interface.change_expression("sob")

	await novel_interface.show_dialog("あんなもの……絶対に着けられるもんかっ！", "小憐")

	await novel_interface.show_dialog("男として……\\n何か大事なモノが……\\n俺から失われていく気がする……", "小憐")

	novel_interface.change_expression("shy_left")

	await novel_interface.show_dialog("それに、あんなの買う現場を見られでもしたら…\\nダメダメッ！　絶対にダメッ！", "小憐")

	await novel_interface.show_dialog("（そんな事になったら……）\\n\\n（本物の……変態だっ！！！）", "小憐")

	novel_interface.change_expression("sob")

	await novel_interface.show_dialog("俺は変態なんかになりたくないんだ！！", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("liliu_research","happy")

	await novel_interface.show_dialog("おや～～？レンちゃん？\\nま～たしゃがんで泣き虫さんと遊んでるのかな？\\nこっちはもうお前のバストサイズに合わせて\\n準備は万端なんだぞ？", "マリル")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","awkward")

	await novel_interface.show_dialog("えっ！？", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_research","smile",0.25)

	await novel_interface.show_dialog("お前の部屋にちゃんと置いておいたから。\\n私からのプレゼントだ。受け取れ♡", "マリル")

	novel_interface.character_light(0.35,"sob")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("いらないッ！\\nお、俺は絆創膏でいいからッ！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("この子…………\\n一体、清純なのかエッチなのか分からんな……", "マリル")

	novel_interface.change_2nd_expression("speak")

	await novel_interface.show_dialog("なるほど…テープ状の絆創膏を使えば……\\n確かにさらに面白くなるな。", "マリル")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("あぁ～なるほどちゃんと理解したぞ、絆創膏を\\n剥がす瞬間の快感が、たまらないんだろう？", "マリル")

	await novel_interface.show_dialog("残念だなぁ、\\nここにはスプレー式の絆創膏しかないからなぁ～", "マリル")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0)

	await novel_interface.show_dialog("わざとだろッ！！\\nうぅ………くそッ！！", "小憐")

	await novel_interface.hide_character()

	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")

	novel_interface.show_character("ren_nude","indignation")

	await novel_interface.show_dialog("ちっくしょう、つ、着ければいいんだろッ！！\\n男たるもの、恥すらも乗り越えて見せてやらぁ！", "小憐")

	novel_interface.character_dark()

	await novel_interface.show_text_only("……")

	await novel_interface.show_text_only("…………………")

	novel_interface.character_light(0.35,"shock")

	await novel_interface.show_dialog("……ん？　え？\nこれ……どうやって着けるんだ……？", "小憐")

	novel_interface.change_expression("timid")

	await novel_interface.show_dialog("…うーーっ………", "小憐")

	novel_interface.character_dark()

	await novel_interface.show_text_only("「バタン」")

	novel_interface.character_move_left(-0.25,0.3,false)

	novel_interface.show_2nd_character("liliu_research","happy",0.25)

	await novel_interface.show_dialog("私が手伝ってやろう！", "マリル")

	novel_interface.character_light(0.35,"shock")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("マッ！　マリルッ！？\\nど、どうやって入ってきた！！？", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"smile")

	await novel_interface.show_dialog("な～に、これも保護者の義務だ。\\nちゃ～んと手伝ってあげようではないか。\\n制服のニーハイは、1人で大丈夫か？", "マリル")

	novel_interface.character_light(0.35,"uneasy")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("はぁっ！？た、たかが靴下1つぐらい自分で\\n履けるってッ！\\nじ、自分でやるからぁ！！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"speak")

	await novel_interface.show_dialog("じゃあスカートは？", "マリル")

	novel_interface.character_light(0.35,"shock")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("スカートは無……いや自分で穿けるから……\\nだからマリルは早く出ていってくれ！！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"happy")

	await novel_interface.show_dialog("あらま～、スカート穿けちゃうの？\\nすごいねぇ。", "マリル")

	novel_interface.character_light(0.35,"shame")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("スカートは後ろのホックに手を伸ばさなくて\\n済むのに、何が難しいんだよ！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("ふふっ、いいだろう。\n少ししたら、どんな格好になったか見に来てやる。", "マリル")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,true,"indignation")

	await novel_interface.show_dialog("くそ……俺を舐めるなよ、マリルめっ！", "小憐")

	await novel_interface.hide_character()

	await novel_interface.hide_background()

	await novel_interface.show_text_only("しばらくして――")

	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")

	novel_interface.show_character("ren_uniform","happy")

	await novel_interface.show_dialog("マリル！　着れた！", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_research","shock",0.25)

	await novel_interface.show_dialog("本当か？", "マリル")

	novel_interface.character_light(0.35,"sprite")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("本当も何も！　ちゃんと着てるじゃないか！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("ファスナーは……どの位置だ？", "マリル")

	novel_interface.character_light(0.35,"smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("もちろん前だよ！　トイレも便利だし！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal")

	await novel_interface.show_dialog("ふむ……さて問題だ。\\n今のお前はナニを使ってトイレをするのか？", "マリル")

	novel_interface.character_light(0.35,"wail")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("えっ………", "小憐")

	novel_interface.change_expression("awkward")

	await novel_interface.show_dialog("そ、そんなの関係ないだろ！　とにかく……", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("ふふ……ファスナーは横だ。\n鏡を見ればすぐ分かるぞ。", "マリル")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,true,"shy")

	await novel_interface.show_dialog("横なら横でいいよ……\nもう……", "小憐")

	novel_interface.change_expression("sob")

	await novel_interface.show_dialog("なんで女の子の服はこんなに着にくいんだよ！！", "小憐")



	print("=== 第二章第14话结束 ===")



	# 调用剧情结束函数

	await novel_interface.end_story_episode(0.5)

