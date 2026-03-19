# chapter2_ep11.gd - 第二章第11话

extends Node2D



@onready var novel_interface = $NovelInterface



func _ready():

	await get_tree().process_frame

	chapter2_ep11_script()



func play_script():

	pass



func chapter2_ep11_script():

	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")

	novel_interface.change_background("res://assets/images/bg/SID/hall.png")

	novel_interface.show_character("liliu_uniform2","speak2")

	await novel_interface.show_dialog("おやおや～～レンちゃんじゃないか？\\nどうだ名実共に美少女となったご感想は？", "マリル")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","shy",0.25)

	await novel_interface.show_dialog("……もう、これ以上俺をからかわないでくれ！", "小憐")

	novel_interface.character_light(0.35,"normal1")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("ふふ～～ん、そうだ、休日が終わり次第、\\n別の公立高校に編入するのはもう聞いたか？", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"worry")

	await novel_interface.show_dialog("うん、新しい学校の方が今の住まいに近いし……\n単位の条件も今より厳しくなさそうだから。", "小憐")

	novel_interface.character_light(0.35,"normal2")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("安全面を考慮し、住居は新しく手配する。\\n学校に関してはだが……", "マリル")

	novel_interface.change_expression("serious")

	await novel_interface.show_dialog("（ふん、あの老いぼれに頼むしかなさそうだな）", "マリル")

	await novel_interface.show_dialog("（考えるだけでも面倒くさいが……すでに情報の　完璧な修正が施されているのは幸いか……）", "マリル")

	novel_interface.change_expression("normal2")

	await novel_interface.show_dialog("御桜川女子高等学校、あの学校のセキュリティは最高クラスで、SIDの本部からもそう遠くない。", "マリル")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("マリルはそう言いながら上を指差す。")

	await novel_interface.show_text_only("御桜川は地下本部の上、\\n商区繁華街に位置する学校だ。\\n特徴としては学費が死ぬほどセレブリティ。")

	novel_interface.show_character("ren_battle","awkward")

	await novel_interface.show_dialog("そ、そこってお嬢様高校じゃないか！　伝説では\\n「聖なる百合と燦爛たる桜が咲く天国」──", "小憐")

	await novel_interface.show_text_only("例のよく落ちる掲示板の住民が、御桜川の高い学費を皮肉って作ったキャッチコピーだ。")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_uniform2","normal2",0.25)

	await novel_interface.show_dialog("何か言ったか？", "マリル")

	novel_interface.character_light(0.35,"wry_smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("いいい、いいえっ！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"speak2")

	await novel_interface.show_dialog("しかしこのおバカが、\\n先輩や後輩になるかもしれないのか……\\nお姉様や妹やらに……", "マリル")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("マリルは軽く微笑んだが、それ以上は何も\\n語らなかった。")

	novel_interface.show_character("ren_battle","awkward")

	novel_interface.character_move_left(-0.25,0)

	novel_interface.character_dark()

	novel_interface.show_2nd_character("liliu_uniform2","speak2",0.25)

	novel_interface.character_2nd_light()

	await novel_interface.show_dialog("一体、何になるんだよっ！？", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal2")

	await novel_interface.show_dialog("今は好奇心に身を任せる時じゃない。\\nとにかく、明日はちゃんと学校に行け。", "マリル")

	await novel_interface.show_dialog("あそこの気品の高さや厳格さは、\\n普通の公立高校と比べ物にならないからな。", "マリル")

	novel_interface.character_light(0.35,"wry_smile")

	novel_interface.character_2nd_dark()

	await novel_interface.show_text_only("少しはのんびりさせてください _(:3」∠ )_")

	novel_interface.change_expression("worry")

	await novel_interface.show_dialog("……あ、そうだ、アニーはどうするの？", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal1")

	await novel_interface.show_dialog("あの娘はな……かなり面白い身の上だぞ。", "マリル")

	novel_interface.character_light(0.35,"normal1")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("彼女が、どうかしたの？", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"speak2")

	await novel_interface.show_dialog("システム上、アニー・バースに関する記録は、\\n7年前から以前の物だけ。\\nつまり彼女の記録は15歳の時で止まっている。", "マリル")

	novel_interface.character_light(0.35,"panic")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("七年前って……アニーはもう22歳なの！？\n見た目は俺とそんなに変わらないのに！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal2")

	await novel_interface.show_dialog("そうだ、彼女の骨年齢は依然として15歳だ。", "マリル")

	await novel_interface.show_dialog("この長い年月の間、彼女はどこへ行っていたのか\\nなぜ突然現れたのか誰も分からない。\\nそれは彼女自身も含めてな。", "マリル")

	novel_interface.character_light(0.35,"worry")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("……どうであっても、\\nアニーは悪いヤツじゃないと思う。", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal1")

	await novel_interface.show_dialog("その点に関して、心配の必要はないな。\\n\\nSIDの内部にも当時の彼女のファンだった奴が、\\nいるからな。", "マリル")

	novel_interface.character_light(0.35,"gratified")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("え？！　アニーって何かのアイドルとかなの？", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal2")

	await novel_interface.show_dialog("……まあ「あの有名人は今」のカテゴリーには、\\n属するな。", "マリル")

	await novel_interface.show_dialog("しかし、私は過去の彼女よりも\\n現在の彼女の特別な点を気に入っている。", "マリル")

	await novel_interface.show_dialog("元々『魔女』の資料は数えるほどしかない\\nというのに、意外な収穫だ。", "マリル")

	novel_interface.character_light(0.35,"worry")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("『魔女』……それって？", "小憐")

	await novel_interface.hide_character()

	novel_interface.character_2nd_move_right(0,0.3,true,"speak2")

	await novel_interface.show_dialog("簡単に言えば、特定の情報に感染した結果、\n『異質物』に似た性質を持つようになった人間のことだ。", "マリル")

	await novel_interface.show_dialog("現代科学では解明できない『異質物』の奇妙な\\n特性を『聖痕』と呼んでいるように。", "マリル")

	novel_interface.change_2nd_expression("normal2")

	await novel_interface.show_dialog("一般人が表現するのならそれを『魔法』とでも\\n呼ぶのではないだろうか。", "マリル")

	novel_interface.character_2nd_move_left(-0.25)

	novel_interface.show_character("ren_battle","normal1",0.25)

	await novel_interface.show_dialog("魔法っていうのも、まだ俺たちが理解できてない\n科学の一種なんじゃないかな……", "小憐")

	novel_interface.character_2nd_light()

	novel_interface.character_dark()

	await novel_interface.show_dialog("そのように理解してもらっても差し支えないな。", "マリル")

	await novel_interface.hide_all_characters()

	novel_interface.change_background("res://assets/images/bg/Shot/burningPunish.png")

	await novel_interface.show_dialog("『魔女』の記述は歴史上数多く存在していたが、\\nいずれも迷信や伝説として扱われ続けてきた。", "マリル")

	await novel_interface.show_dialog("例えばヨーロッパでは300年余りの間、\\n『魔女狩り』と称して10万人に及ぶ女性達が、\\n処刑されてきた歴史が存在する。", "マリル")

	await novel_interface.show_dialog("『魔女狩り』…歴史の授業で学んだ事がある……", "小憐")

	await novel_interface.show_dialog("当時は退屈な歴史問題だと思っていたが、考えてみれば、大規模かつ不自然な災難だった……", "マリル")

	novel_interface.change_background("res://assets/images/bg/SID/hall.png")

	novel_interface.show_character("liliu_uniform2","serious")

	await novel_interface.show_dialog("『異質物』が発見されて以来、各国は様々な伝説の真実性を改めて見直している。", "マリル")

	await novel_interface.show_dialog("最近とある組織が再び魔女の「生産」に成功し、\\nスパイ活動に編入しているという噂もあるな。", "マリル")

	novel_interface.change_expression("speak2")

	await novel_interface.show_dialog("しかし、アニーが快く引き受けてくれて\\nよかったよ。", "マリル")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("引き受けるって、何を？", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("liliu_uniform2","normal2")

	await novel_interface.show_dialog("SIDの捜査員だ。", "マリル")

	await novel_interface.show_dialog("明日から、彼女は私の部下になるぞ。", "マリル")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","panic",0.25)

	await novel_interface.show_dialog("そ、そんなのダメだって！\\nSIDの捜査員は危険過ぎる！\\n考えれば分かる事じゃないか！", "小憐")

	novel_interface.change_2nd_expression("wry_smile")

	await novel_interface.show_dialog("それに彼女は俺と同じ15歳だし、\\n捜査員の仕事なんてできるわけが……", "小憐")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("ふん、こちとら最年少の捜査員は13歳だ。", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"wail")

	await novel_interface.show_dialog("13歳っ！？　違法だろう！！\\n違法に決まってるっ！！", "小憐")

	novel_interface.character_light(0.35,"normal1")

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("会う機会があれば、考えを改めると思うぞ？\\nあの子は少なくとも、お前より大分賢いからな。", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"sprite")

	await novel_interface.show_dialog("……ムゥ…", "小憐")

	await novel_interface.hide_all_characters()

	await novel_interface.show_text_only("現在、各学園都市は表面上は停戦しているが、\\n本当に表面上だけであると言う事も、\\n新豊洲の市民としては、もちろん知っている。")

	await novel_interface.show_text_only("イージスのフィールドは極めて優秀だが、\\n万能な道具では決してない。\\n例えば生物兵器や浸透式のテロには無力だ。")

	await novel_interface.show_text_only("この都市を守るために、マリルやSIDが\\nどれだけ見えない所で死闘を繰り広げて来たか、\\n想像に難くない。")

	novel_interface.show_character("liliu_uniform2","normal1")

	await novel_interface.show_dialog("あ、そうだ、アニーも表向きはお前と一緒に\\n入学する転校生だ。", "マリル")

	await novel_interface.show_dialog("同じスイートルームで生活してもらう。制服や\\n日常品その他は1時間以内に全て届けさせよう。", "マリル")

	novel_interface.change_expression("normal2")

	await novel_interface.show_dialog("後の足りない物は、自分で用意してくれ。", "マリル")

	await novel_interface.hide_character()

	novel_interface.show_character("ren_battle","worry")

	await novel_interface.show_dialog("分かった……", "小憐")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("分かっている、条件は何も悪くない。\\nいや、むしろ前の暮らしよりも快適だ。")

	await novel_interface.show_text_only("問題なんて、SIDに全て解決してもらえばいい。\\n名門学校で楽に単位にありついていればいい。")

	await novel_interface.show_text_only("そして、この新しい身体に慣れればいい…のか？")

	novel_interface.show_character("ren_battle","solemn")

	await novel_interface.show_dialog("……ダメだ。", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("liliu_uniform2","normal2")

	await novel_interface.show_dialog("……うん？", "マリル")

	await novel_interface.hide_character()

	await novel_interface.show_text_only("現在の状況は不安が募るばかり。\\n\\nだけど、アニー1人だけが危険に晒されて、\\nそれでいいのだろうか？")

	await novel_interface.show_text_only("俺とアニーの突然の出会い。\\n彼女は落ち着いた素振りではあったが、\\n少しだけ動揺も見せていた。")

	await novel_interface.show_text_only("彼女もきっと……怖かったのでは？")

	novel_interface.show_character("ren_battle","solemn")

	await novel_interface.show_dialog("……マリルさん、あなたが反対しないなら\\n俺も手伝いたいッ！", "小憐")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("liliu_uniform2","serious",0.25)

	await novel_interface.show_dialog("はあッ！？", "マリル")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("……俺に……あの台風を乗り越える能力が、\\nあるのなら、SIDで何か役に立てるはず！", "小憐")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"normal2")

	await novel_interface.show_dialog("あれは台風じゃない、時空位相波動だ……", "マリル")

	await novel_interface.hide_2nd_character()

	novel_interface.character_move_right(0,0.3,true,"shout")

	await novel_interface.show_dialog("とにかく、アニーを1人で危険に晒すなんて\\nできないよ。", "小憐")

	novel_interface.change_expression("serious")

	await novel_interface.show_dialog("もしかしたら、男に戻る方法だって\\n見つかるかもしれないし……", "小憐")

	await novel_interface.hide_character()

	novel_interface.show_character("liliu_uniform2","normal2")

	await novel_interface.show_dialog("……だがお前の戦闘力では、\\nSIDの清掃員にすら勝てないぞ。", "マリル")

	novel_interface.character_move_left(-0.25)

	novel_interface.show_2nd_character("ren_battle","panic",0.25)

	await novel_interface.show_dialog("えっ……\\n（どんな清掃員を雇ってるんだよっ！）\\n（違う意味のスイーパーか！？）", "小憐")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("……そうだな……こうしよう。今後何か危機が\\n迫っても、生存率を上げられるように、\\nお前にはSIDの候補生訓練を受講してもらう。", "マリル")

	novel_interface.change_expression("normal1")

	await novel_interface.show_dialog("それならば身分も四級捜査員（候補）としよう。", "マリル")

	novel_interface.character_dark()

	novel_interface.character_2nd_light(0.35,"happy")

	await novel_interface.show_dialog("ありがとうっ！　頑張るよ！", "小憐")

	novel_interface.character_light()

	novel_interface.character_2nd_dark()

	await novel_interface.show_dialog("（まあいい、この子からどのようなデータが得ら　れるか、しばらく確認してみようか）", "マリル")



	print("=== 第二章第11话结束 ===")



	# 调用剧情结束函数

	await novel_interface.end_story_episode(0.5)

