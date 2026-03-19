# chapter2_ep12.gd - 第二章第12话

extends Node2D



@onready var novel_interface = $NovelInterface



func _ready():

	await get_tree().process_frame

	chapter2_ep12_script()



func play_script():

	pass



func chapter2_ep12_script():

	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")

	await novel_interface.show_text_only("SID候補生訓練の登録手続きを一通り終えたら、\\n分厚い「教材」を沢山もらった。")

	await novel_interface.show_text_only("その後、スタッフの指示に従って、SID本部から\\n目立たない小型エレベーターに入る。")

	novel_interface.change_background("res://assets/images/bg/other/BG_City_street3.png")

	await novel_interface.show_text_only("エレベーターはかなりの速さで上昇し、耳がつんとする。\n地上に出た頃には、もう夕暮れになっていた。")

	await novel_interface.show_text_only("エレベーターの出口は、小さなオフィスビルの\\nロビーに繋がっていた。\\nすぐ外は車の往来が絶えない商業地区である。")

	await novel_interface.show_text_only("このエレベーターは、乗っている全員が認証済みの\n関係者である時だけ深層へ降りられる。\nそうでない時は、1階から3階を往復するだけらしい。") #换行问题

	await novel_interface.show_text_only("2階には24時間営業のカフェが出店しており、\\n1日中多くの人が出入りしている。\\nカモフラージュに最適なのだろう。")

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("はぁ……", "小憐")

	novel_interface.change_expression("wry_smile")

	await novel_interface.show_dialog("エージェント訓練って格闘とか射撃なんかを\\n教わるのかと思っていたら…\\n学習塾の塾生みたいじゃないか……", "小憐")

	await novel_interface.show_dialog("というか本が多くて重すぎ！マリルが手配して\\nくれた住居がここから近くてよかった。", "小憐")

	novel_interface.change_expression("worry")

	await novel_interface.show_dialog("学区東道6号……マリルいわく、\n『とても目立たない場所』らしいけど……", "小憐")

	await novel_interface.hide_character()

	await novel_interface.hide_background()

	await novel_interface.show_text_only("……")

	novel_interface.change_music("res://assets/audio/music/step by step.mp3")

	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")

	novel_interface.show_character("ren_battle","wail") 

	await novel_interface.show_dialog("――どこが目立たないんだよっ！！", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("ペントハウスアパートメント。それはホテルや\\nマンションで最も価格の高い最上階の部屋。\\n豪華リビングから巨大なバルコニーへ移ると、\\n商業地区の夜景を一望できる。")

	novel_interface.show_character("ren_battle","wail")

	await novel_interface.show_dialog("壁際のこの炎……本物の暖炉だよな？\\nなんとご大層な……", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("部屋を間違えたかと考えている最中、\\nマリルからのメッセージが届いた。")

	await novel_interface.show_text_only("マリル：寝室は好きな部屋を一つ選んでいいぞ。\n元老院の予算なんだから、遠慮はするな〜") #原文有个？

	await novel_interface.show_text_only("こやつ……\\nすぐさま新豊洲の納税者様に土下座しろ！！")

	await novel_interface.show_dialog("レンちゃん！　お帰り～！", "アニー")

	await novel_interface.show_text_only("髪を束ねたアニーが、浴室であろう部屋から\\nひょっこり出てきた。")

	novel_interface.show_character("ren_battle","happy")

	await novel_interface.show_dialog("アニー！？なんだいたのか～～\\n\\nさっきマリルから、特別訓練を受けているって\\n聞いていたんだけど……", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("anne_uniform","normal1",0.25)

	await novel_interface.show_dialog("予想より早く終わったから、先にお風呂に入って\\n制服を試着していたところよ。\\nどうやら私達ルームメイトになるみたいだね～～", "アニー")

	novel_interface.character_light(0.35,"panic")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("そ、そうだね\\n（そう言えばマリルからも聞いたな）", "小憐")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,false,"shy_left")

	await novel_interface.show_dialog("（これは天が俺に課した試練なのか？）\\n\\n（女の子と一つ同じ屋根の下で暮らすなんて…）", "小憐")

	novel_interface.change_expression("timid")

	await novel_interface.show_dialog("そ、それが学校の制服？　可愛いなぁ～～", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("anne_uniform","happy")

	await novel_interface.show_dialog("そうだよっ。\\n\\nレンちゃんの服もあっちの箱に入ってるから、\\n後で試着してみてね！", "アニー")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","awkward",0.25)

	await novel_interface.show_dialog("お、俺も着ないといけないのか……", "小憐")

	novel_interface.character_light(0.35,"normal2")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("ふふっ、まだレンちゃんは女の子に\\n慣れていないのかな？", "アニー")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("アニーの話を聞きつつ、頭を掻きむしりながら、\\nソファーに倒れこんだ。")

	novel_interface.show_character("anne_uniform","normal2")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.show_2nd_character("ren_battle","shy",0.25)

	await novel_interface.show_dialog("こんな事、慣れるわけないだろ……", "小憐")

	novel_interface.change_2nd_expression("sob")

	await novel_interface.show_dialog("うぅ……こんな感覚、\\n誰にも理解できないだろうな……", "小憐")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,true,"normal1")

	await novel_interface.show_dialog("私は分かるよ。", "アニー")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("アニーは突然そばに座って、\\n俺を慰めるように指で軽く頬に触れた。")

	novel_interface.show_character("ren_battle","timid")

	await novel_interface.show_dialog("……アニー？", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("anne_uniform","relieve")

	await novel_interface.show_dialog("だって私達は同じだもん。", "アニー")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("少し苦笑いしてるアニー。")

	novel_interface.show_character("ren_battle","perspire1")

	await novel_interface.show_dialog("な、なんだって――ッ！\\nアニーも男性だったのかッ！？", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("anne_uniform","smile",0.25)

	await novel_interface.show_dialog("あはははははっ！　レンちゃん落ち着いてっ！", "アニー")

	novel_interface.change_2nd_expression("happy")

	await novel_interface.show_dialog("アニーは生まれてから、ずっと女の子だよ～～", "アニー")

	novel_interface.character_light(0.35,"shy_left")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("あ、う……っ\\n（恥ずかしいッ！！）", "小憐")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("俺の羞恥心がピークに達している中、\\n笑顔のアニーは俺を優しく見つめる。")

	novel_interface.show_character("ren_battle","shy_left")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.show_2nd_character("anne_uniform","normal2",0.25)

	await novel_interface.show_dialog("でもね、レンちゃんが今感じてる恐怖とか\\n不安とか、私は全て理解できるよ。", "アニー")

	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_left(0,0.3,false)

	await novel_interface.show_dialog("ずっと、別の時空に閉じ込められていたから……\\n\\nあの感覚は、今のレンちゃんが感じてる事と\\nきっと似ているんだろうなって……", "アニー")

	await novel_interface.hide_2nd_character()

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("別の……時空？", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("アニーは、適切な言葉を探りつつ話しを続ける。")

	novel_interface.show_character("anne_uniform","worry")

	await novel_interface.show_dialog("マリルさんは教えてくれなかったかな？\n私は別の時空で、何が起きたのかも分からないまま\n長い時間を過ごしていたの。", "アニー")

	novel_interface.change_expression("normal2")

	await novel_interface.show_dialog("あそこでの時間の概念は曖昧で、そんなに長く\\nいた感じなんてなかったんだけど……\\n帰って来たら7年も月日が過ぎちゃってた。", "アニー")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("うん、そこについては少し聞いた……", "小憐")

	await novel_interface.show_dialog("（マリルからは断片的にしか聞いてないけど……）", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("何があったんだろう？\\n俺からアニーに聞いてもいいのかな？")

	await novel_interface.show_text_only("アニーはそれ以上何も言わず、俯いたまま\\n指を弄りながら考え込んでいる。")

	novel_interface.show_character("anne_uniform","upset")

	await novel_interface.show_dialog("レンちゃん……\nこういう気持ちになったこと、ないかな？", "アニー")

	await novel_interface.show_dialog("これが夢だったらと疑って、次に目を開いた時、\\n全てを夢で終わらせて欲しいと願う感覚──", "アニー")

	await novel_interface.show_dialog("こんなはずがない、ここにいるはずがない──\\nだけど、どんな事をしても、行先は戻らない。", "アニー")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","upset")

	await novel_interface.show_dialog("（そんな……そんな気持ちを、アニーはずっと\\n　1人で耐えてきたのか？）", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("俺はアニーに少し近付いて、\\n彼女の肩を軽く叩いた。\\nえっと……女の子を慰めるのに、\\nこれくらいは大丈夫だよな？")

	novel_interface.show_character("ren_battle","smile")

	await novel_interface.show_dialog("もう、怖がらなくっていいって！\\n帰って来れたじゃないか？", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("anne_uniform","worry",0.25)

	await novel_interface.show_dialog("うん……\\nでも、私はこの世界に全然馴染めてない……", "アニー")

	await novel_interface.show_dialog("レンちゃん達が口にした『学園都市』って\\n単語でさえ、さっぱり分からないの。", "アニー")

	novel_interface.character_light(0.35,"worry")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("（……そうか、アニーが消える前の時代じゃ、\\n　まだ戦争は終わってないのか）", "小憐")

	novel_interface.change_expression("gratified")

	await novel_interface.show_dialog("それこそ、ここ数年何があったのか、\\n全く分からないんじゃ？", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"unhappy")

	await novel_interface.show_dialog("調べてはみたんだけど……私がいた時代から、\\nあらゆる事が起き過ぎていて……\\n報道の中で使ってる言葉の意味さえも\\n分からなかった。", "アニー")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("7年前は……全世界を混乱の渦に巻き込んだ、\\nあの戦争の中期だったね。", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"worry")

	await novel_interface.show_dialog("えっ？　戦争？\\n\\nマサダブルクがヨーロッパに対して行った\\n軍事作戦の事？", "アニー")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("アニーは頑張って思い出そうとしている。")

	novel_interface.show_character("ren_battle","worry")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_light()

	novel_interface.show_2nd_character("anne_uniform","worry",0.25)

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("違うよ。そのあと間もなく、ほとんどすべての国が\n戦争に巻き込まれていったんだ。", "小憐")

	novel_interface.change_expression("normal1")

	await novel_interface.show_dialog("当時、俺は寄宿舎の小学校に通っていたけど、\\n毎日戦争と死亡者数のニュースがあって、\\nかなり酷い時期だった……", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"upset")

	await novel_interface.show_dialog("レンちゃんも戦争を体験したの？", "アニー")

	novel_interface.character_light(0.35,"normal2")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("体験とは少し違うかな。\\n\\nイージスの保護があったから、当時の新豊洲は\\n廃墟のすぐ側で全力の再建を図っていたし。", "小憐")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("あの頃、巨大なクレーンと建設機械が都市の\\nあちこちに散見してた光景は今でも覚えている。\\nこの部屋の窓から見える夜景は\\nあの頃に比べて随分と綺麗になった。")

	novel_interface.show_character("ren_battle","gratified")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_light()

	novel_interface.show_2nd_character("anne_uniform","upset",0.25)

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("だから俺が知ってるのは、大体教科書からの\\n受け売りだよ。", "小憐")

	await novel_interface.show_dialog("戦争の影響で、近年は聖痕関連の技術が急速的に\\n向上してて……\\nあ、『聖痕』というのは異質物によって\\n引き起こされる超常現象の事なんだけど。", "小憐")

	novel_interface.change_expression("worry")

	await novel_interface.show_dialog("戦後、この重大な技術を発展させた6つの国が、\\n世界各地に六大学園都市を設立したんだ。", "小憐")

	novel_interface.change_expression("wry_smile")

	await novel_interface.show_dialog("（歴史の先生としての才能が突然目覚めた\\n　……………………………………気がする）", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"unhappy")

	await novel_interface.show_dialog("そんな事があったなんて…全然想像がつかない。", "アニー")

	novel_interface.character_light(0.35,"gratified")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("やっぱり……アニーがいなくなった頃の世界は、\nまだ今よりずっと平和だったんだね……", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"normal1")

	await novel_interface.show_dialog("そうだね、その時の私は、野球の国際試合に\\n参加してたんだからっ！", "アニー")

	novel_interface.hide_2nd_character()

	await novel_interface.show_text_only("野球の話になった途端、アニーの目がキラキラと\\n輝いた。")

	novel_interface.show_character("anne_uniform","smile")

	await novel_interface.show_dialog("知ってる、レンちゃん？ 私が打席に立つと、\\nファンのみんなの視線が、一手に集中するの！", "アニー")

	novel_interface.change_expression("happy")

	await novel_interface.show_dialog("緊張はするけど、全力を尽くさないといけない\\nあの感覚……全身の血が騒いでるかのようでっ！", "アニー")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("野球と言えば、リバーナにある野球場の外に\\n数万人の犠牲者の名前が刻まれた、\\n黒い石碑がある事を、ふと思い出した。")

	novel_interface.show_character("ren_battle","normal1")

	await novel_interface.show_dialog("もしかしたら……", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("anne_uniform","normal2")

	await novel_interface.show_dialog("……うん？", "アニー")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","normal1")

	await novel_interface.show_dialog("あの戦争の最も悲惨な数年を避けられたのは、\\nある意味良い事だったのかもしれない。", "小憐")

	novel_interface.change_expression("gratified")

	await novel_interface.show_dialog("そう考えると、俺が女の子になってアニーと\\n出会えた……\\nこれも、ある意味良い事だったのかも？", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("アニーは少しキョトンとしつつも、何とも\\n言えない困った表情をしている…ように見えた。\\n俺の見間違いかな？")

	novel_interface.show_character("anne_uniform","normal1")

	await novel_interface.show_dialog("レンちゃん……実はずっとお礼が言いたかったの。\nだって……あの世界をさまよっていた私を、\n助け出してくれたのはレンちゃんだから。", "アニー")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","panic",0.25)

	await novel_interface.show_dialog("えっ？　俺は何もしてないって……", "小憐")

	novel_interface.character_light(0.35,"happy")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("だから……あなたはきっと特別なんだよ。", "アニー")

	await novel_interface.show_dialog("レンちゃんがどうやったかなんて分からない。\\nだけど、あの時レンちゃんの暖かい手が、\\n私を引っ張ってくれた事を私は確かに感じたの。", "アニー")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("アニーが俺の手を軽く握る。\\n軽くだけど、想いの深さを感じた。")

	novel_interface.show_character("anne_uniform","normal1")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_light()

	novel_interface.show_2nd_character("ren_battle","panic",0.25)

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("レンちゃんがいなければ、私はいつまでも\\n閉じ込められて、\\nそして最後……何に変わってたか……", "アニー")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"worry")

	await novel_interface.show_dialog("何に変わる……？", "小憐")

	novel_interface.character_light(0.35,"normal2")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("あはっ、なんでもない！　もう過ぎた事だし。\\nなんか突然眠くなってきちゃった～～", "アニー")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("この話題を、もう避けたいようだ。\\nアニーは笑顔を残しつつも背筋を伸ばす。")

	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")

	await novel_interface.show_dialog("お前達、いつまで「秘密の女子話in夜」を\\n続けるつもりだ？", "マリル")

	await novel_interface.show_text_only("部屋の片隅のスピーカーから、突如マリルの声が\\n聞こえた。")

	novel_interface.show_character("ren_battle","panic")

	await novel_interface.show_dialog("マ、マリル姉っ！？\\nずっと盗み聞きしてたのかっ！？", "小憐")

	novel_interface.character_dark()

	await novel_interface.show_dialog("なんだ？保護者は子供の生活を監督するものだ。\\n何がいけない。", "マリル")

	novel_interface.character_light(0.35,"wry_smile")

	await novel_interface.show_dialog("よく言うよ……", "小憐")

	novel_interface.character_dark()

	await novel_interface.show_dialog("ほう？　口答えするのか？\\n\\n明日はミッチリと訓練してやらねばならない\\nみたいだな……", "マリル")

	novel_interface.character_light(0.35,"wail")

	await novel_interface.show_dialog("すみませんっ！　すぐお風呂入って寝ますっ！\\nおやすみなさいっ！！", "小憐")



	print("=== 第二章第12话结束 ===")



	# 调用剧情结束函数

	await novel_interface.end_story_episode(0.5)

