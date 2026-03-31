# stardustdescends_ep10.gd - 星尘降临篇第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep10_script()

func play_script():
	pass

func stardustdescends_ep10_script():
	await novel_interface.show_text_only("入国審査のロビーから出ると、曇り空はすっかり
晴れ模様となっていた。
良い天気の下、俺達3人は港湾局専用線の列車に
乗り込む。")
	await novel_interface.show_text_only("列車はリニアモーター式であり、窓から見える
景色は認識できないほどの凄まじいスピードだ。
マサダ内城区域のクネセト駅まで地図上で見ると
結構な距離だったが10分もかからず到着した。")
	await novel_interface.show_text_only("……………………")
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Masadainner.png")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("これって……", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","happy")
	await novel_interface.show_dialog("す、すごい……！！", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","happy")
	await novel_interface.show_dialog("わ～お！", "シンチェン")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","happy")
	await novel_interface.show_dialog("ここが……マサダブルク！？", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_uniform","panic",0.25)
	await novel_interface.show_dialog("全然……想像してたのと違う……", "アニー")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("「激しい戦火の砂漠に荒くそびえ立つ要塞」が、
マサダのイメージだったけど。
目の前に広がる景色は全くと言って良いほど
俺達の想像上と違う光景だった。")
	await novel_interface.show_text_only("まるで有名な庭園を現実化したみたいに
綺麗であり──
清潔な街道には掃除用ロボットや無人の貨物車が
行き交っている。")
	await novel_interface.show_text_only("中心部に林立している高層ビル群はハイテク感が
満載の金属装甲板を外面に備えており、
その装甲板は空の雲模様を微かに反射していた。")
	await novel_interface.show_text_only("目の前に広がる植生景観は近未来的な世界に
迷い込んだと勘違い出来そうなぐらいに美しい。")
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("清々しい空気だな……！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("石の手すりで身体を支えながら深呼吸してみる。

潤いのある空気に、海風特有のしょっぱさが
程よく混じっているように感じた。")
	novel_interface.show_character("ren_medical","smile")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_uniform","happy",0.25)
	await novel_interface.show_dialog("ここは地球上で気圧が最も高い場所だから。

空気中の酸素は普通より多いし、いつもよりも
呼吸がしやすいと思うよ。", "アニー")
	novel_interface.change_2nd_expression("normal1")
	await novel_interface.show_dialog("死海近くの砂漠を住みやすく改良するにしても、
良くもここまで……", "アニー")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("アニー、あっち見て。
あのずーっと続いているのはなんだ……？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("俺は遠くに見えるどこまでも連なって、
視界を横断する塀みたいな構造物を指差した。
塀の後ろに高層ビルなどは見当たらない。")
	novel_interface.show_character("anne_uniform","stare")
	await novel_interface.show_dialog("あれは『隔離壁』。", "アニー")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("今は離れているから小さく感じるけど、
実際の高さは50数メートルぐらいあるの。
各所に保安検査の検問所や自動防御装置があって
地下にも沢山のセンサーが仕掛けられてる。", "アニー")
	await novel_interface.show_dialog("ネズミ一匹すら通れないレベルの防備だから、
隠れて壁を越えるのはまず不可能だね。", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("溜め息を吐きながらアニーは語る。")
	novel_interface.show_character("anne_uniform","upset")
	await novel_interface.show_dialog("彼らは過去にも同じような物を作っていたけど、
結局は都市丸ごと跡形もなく消し飛んだのよね。", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("あれって随分前の話だよな。
俺がまだ小学生の時ぐらいで──", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……話している最中に思い出した。

アニーは『因果の狭間』と言う場所に7年間も
閉じ込められていたのだ。
彼女にとって比較的近い昔話だったのかも
しれない。")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("と、ところでさ──

ああ言う壁って、何か意味があったりするのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺はやや強引に話題を切り替えた。")
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("本当に戦争になったら、あんな壁は1ミリも
役に立たないだろうし……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","normal2")
	await novel_interface.show_dialog("政府が壁を建設する目的は色々とあるね。

外敵の侵入を防ぐとか、人民の逃亡や不法移民の
入国を阻止するためとか。", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("前方の公園に設置されている六大学園都市の
旗を見ながら、アニーは続けた。")
	novel_interface.show_character("anne_uniform","upset")
	await novel_interface.show_dialog("だけどマサダに関してはちょっと複雑かも……", "アニー")
	await novel_interface.show_dialog("壁の中で暮らす人も外で暮らす人も、
考えは似たり寄ったり。
彼らにとっての安心な暮らしって、
壁の向こう側を見ないようにする事なの。", "アニー")
	await novel_interface.show_dialog("向こう側の奴らには死んでも会いたくないと、
多くの人々が思っているわ。
心情的だけじゃなく物理的にも相手の存在を
遮断するために壁は利用されてる。", "アニー")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("……レンちゃんには分からない話かも。", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","pleased")
	await novel_interface.show_dialog("ほほぅ～～なるほどなるほど～～", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("いきなり会話に参加してきたシンチェンが、
あたかも理解しているかのように頷く。")
	novel_interface.show_character("stardust_small","pleased")
	await novel_interface.show_dialog("うん、うん……うん？　……うん！", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("お前、それ絶対分かってないだろ！？

今のお前と全く同じリアクションを俺は
頭の中で繰り広げていたんだからなっ！？")
	await novel_interface.show_text_only("と言う訳で、俺もアニーの難しい話を
完全に理解できたわけではなかった。
神妙な面持ちだし、彼女の生い立ちに
関係する事だったり……？")
	await novel_interface.show_text_only("目線を宙に泳がせて思考を整理していると、
アニーが腕を俺の首に回した。")
	novel_interface.show_character("anne_uniform","smile")
	await novel_interface.show_dialog("まあ、真剣に考えなくても良いって！

実は私も結構適当な事を言ってたりするし！", "アニー")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("そんな事より知ってる？

マサダの『ファントムフォース』なんだけど、
実は内城区域のどこかの地下にあるらしいよ！", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("えっ……？
あのXK級異質物の事だよな？", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("『ファントムフォース』は第三学園都市である
マサダブルクが誇る戦略的異質物だ。
移動不可の空間的な存在で、その価値は
新豊洲の『イージス』に匹敵する。")
	await novel_interface.show_text_only("武器の威力を数倍から数百倍まで底上げする
効果を持ち合わせており、
空間内から弾道ミサイルなどを発射すると
とんでもない破壊力となって飛んでいく。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_doomsday.png")
	await novel_interface.show_text_only("以前、マサダが公表した『自動反撃システム』は
その強力無比な効果の下で作成された。")
	await novel_interface.show_text_only("マサダ市街の損壊率が50%を超過したと
システムによって判断された時、
自動的に『終末プログラム』が起動される。")
	await novel_interface.show_text_only("起動すると『ファントムフォース』に設置された
核弾頭が全ての大都市へと無差別に放たれる。
要するに全世界が道連れになると言う事だ。")
	await novel_interface.show_text_only("公表された直後は猛抗議が行われたけど、
停止する術が備わっていない事実もあり、
人々はシステムを受け入れるしか他なかった。")
	await novel_interface.show_text_only("今回の停戦協定がトラブルなく潤滑に進んだのも
このシステムによる圧力が大きいのだろう。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Masadainner.png")
	novel_interface.show_character("anne_uniform","smile")
	await novel_interface.show_dialog("あそこのビルの装甲板、見えるかな？", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("うん、さっきから見えていたけど……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("あのビルを見ていると、使徒迎撃用に建てられた
第3新なんとか市が頭に浮かんでくる……")
	novel_interface.show_character("anne_uniform","smile")
	await novel_interface.show_dialog("この内城区域の地下には、あの装甲板が大量に
設置されてるの。", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("おいおいおいおい！！
結構ニアピンな話なのか！？")
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("ど、どういうことだ……？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","smile")
	await novel_interface.show_dialog("わざわざ死海近くの厳しい砂漠環境に、
新しい首都を建設した理由は何故だと思う？", "アニー")
	await novel_interface.show_dialog("立地条件だって最悪な場所なのにさ。

落差が400メートルを超える大型運河の建設に
わざわざ莫大な費用をかけたのか分かる？", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("この下に『ファントムフォース』があるからって
言いたいのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は足元を指差すが、どこか違和感を感じた。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("でも、代償が大きすぎるだろ？

『イージス』みたいに一切の攻撃を遮断する
効果とかであれば建設する理由は分かるけど……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","worry")
	await novel_interface.show_dialog("だからこそ、みんな疑ってるの！

『ファントムフォース』には公表されていない
超重要な「秘密」があるかもって！", "アニー")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("この土地に住む意味は私達が思う以上に
深いのかもしれないわ……！
きっとマサダの指導者が民族全員の運命を
賭けるぐらいには！", "アニー")
	await novel_interface.show_dialog("街の防備の大半が『ファントムフォース』を
守るために作られたって考えてみて？", "アニー")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("それなら厳重な隔離壁をこれぐらい備えるのは
普通に感じるよねぇ～", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("「マサダは永遠に陥落せず」って言葉には、
そんな意味が含まれてるのか……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("だけど形振り構わず守ろうとする秘密なんて、
逆に人々の好奇心を煽ってしまう気がする……")
	await novel_interface.show_text_only("例のスローガンが載ってるクネセト駅の広告を
俺は見ようと振り返った。
──その時、見覚えのある顔を発見する。")
	await novel_interface.show_text_only("戦利品満載のバッグを抱えて駅の出口から
現れたのは、金庫室で出会ったあの少尉さん。
……確か名前はエミリオだったっけか。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("……あら？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("目が合うと、少尉さんはこっちにやって来た。")
	await novel_interface.show_text_only("瞬時にアニーは見知らぬ通りすがりの人を装う。

携帯を見ながら荷物を引っ張りつつ
俺の傍から素早く離れる。")
	await novel_interface.show_text_only("一方、他に存在がバレないと知ったシンチェンは
ますます図に乗り始めていた。")
	await novel_interface.show_text_only("俺の前に立つ姿は、飼い主が後ろに付いてるから
大丈夫だ！と調子に乗る小型犬みたいだ。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("あなたはカジノ船の金庫室にいた……
看護師見習いのお嬢さん？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は俺の胸にあるネームプレートをチラっと
確認する。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("レン、それがあなたの名前ね？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("ど、どうも、まだ会えたね。", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("あの一緒にいた係員だけど、あなたが去った後に
うんと私が懲らしめてやったから。", "エミリオ")
	await novel_interface.show_dialog("後で発覚したんだけど、あいつ何人かの
女性スタッフにセクハラしてたみたい。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("――ええっ！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そんな事やってたのかよ！？")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("挙句にあなたのような客人にも手を出すなんて、
頭でも壊れちゃってたのかしら？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("あ、あはははは……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("催眠スプレーのお陰か、彼の頭の中で何かが
色々と起きたみたいだな……")
	novel_interface.show_character("ren_medical","happy")
	await novel_interface.show_dialog("お礼を言うの、まだだったよね？

お陰様で直ぐにセキュリティーチェックを
通り抜ける事が出来たよ！", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("ああ、気にしないで。

上の人が最近、私達をくだらない任務に
派遣するの好きらしくて……", "エミリオ")
	novel_interface.change_expression("upset")
	await novel_interface.show_dialog("前回は収容隊がフル装備で半日スキャンしたのに
まったくの収穫なしだったのよ？", "エミリオ")
	novel_interface.change_expression("speechless")
	await novel_interface.show_dialog("どうせ今回も、適当に買ったデマ情報を
鵜呑みにしただけでしょうね……", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","stare")
	await novel_interface.show_dialog("ふふん、偉そうに……ぺぇーだ！", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("少尉さんの言葉を小馬鹿にするかのように、
シンチェンは戯けた顔をした。")
	novel_interface.show_character("stardust_small","stare")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","normal",0.25)
	await novel_interface.show_dialog("それにしても──", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("すると少尉さんは急にしゃがみ始める。")
	novel_interface.show_character("stardust_small","stare")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","smile",0.25)
	await novel_interface.show_dialog("この子、凄く可愛いわね～～！

ここの出身の子じゃないよね？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("…………………………

瞬間的に俺とシンチェンは凍り付いた。")
	novel_interface.show_character("stardust_small","panic")
	await novel_interface.show_dialog("えっ…………？

…………あっ……あぅ。", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("キャンキャンと吠えてた威勢はどこに行ったのか
シンチェンの表情は泣きそうな感じに変わる。
逃げるように少尉さんの前から引き下がると、
俺の後ろへと一目散に隠れてしまった。")
	novel_interface.show_character("stardust_small","panic")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","wail",0.25)
	await novel_interface.show_dialog("あ、あはははは……
こ、この子は俺の……あの、その……", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("な、何で！いつの間に！？

どうして、シンチェンが見えてるんだ！？")
	await novel_interface.show_text_only("少尉さんはバッグを降ろして漁り始めると、
赤い透明の液体が入っている瓶を取り出した。
瓶はガラス製で、ロゴやラベルなどは
貼り付けられていない。")
	novel_interface.show_character("stardust_small","panic")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","smile",0.25)
	await novel_interface.show_dialog("搾りたてのザクロジュースは特産品の1つなの。
すっごく美味しいわよ？", "エミリオ")
	await novel_interface.show_dialog("ほら、あなたに1つあげるわ。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("少尉さんはシンチェンに瓶を渡そうとする。

ヤバい！と瞬間的に気づいたが、
反応する事はできなかった。")
	await novel_interface.show_text_only("渡された瓶がシンチェンの身体をすり抜け、
地面へ…………")
	novel_interface.show_character("stardust_small","uneasy")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("emilio","smile",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("さ、さんきゅーべりまっち……", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("…………落ちなかった。

瓶は俺の予想に反して何事もなくシンチェンの
手に乗っていた。
少尉さんは受け取ってくれた事を確認して、
シンチェンの頭を撫でる。")
	novel_interface.show_character("stardust_small","uneasy")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","mock",0.25)
	await novel_interface.show_dialog("よしよし、いい子だね～～", "エミリオ")
	novel_interface.character_light(0.35,"konata_eye")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("え、えへへ～～", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("どう言う事だ……
この子は、もう幻じゃなくなったのか？")
	await novel_interface.show_text_only("い、いつから、そうなっていた？

俺とアニーはずっと彼女が見えていたから、
気付けてなかったのか？")
	await novel_interface.show_text_only("いや違う、税関の人は彼女を見逃さないだろう。
少なくとも入国審査の後になる……")
	await novel_interface.show_text_only("つまり見えるようになったのは、
……ついさっき？")
	await novel_interface.show_text_only("と、と、とりあえず今は適当に誤魔化して、
ホテルに戻ってから考えよう。")
	await novel_interface.show_text_only("……うん？

……入国……審査……？")
	novel_interface.show_character("emilio","normal")
	await novel_interface.show_dialog("それにしたって……レンちゃん？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("少尉さんはシンチェンの腕を掴んだ。")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("この子に入国管理局のバーコードがないのは
どう言う事かしら？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……一気に変な汗が噴き出る。")
	await novel_interface.show_text_only("あ……ああ……逮捕される……ッ！！")
	await novel_interface.show_text_only("噂だとマサダの人々の間で違法入国者は相当な
嫌悪の対象らしい。
もし、兵士に現行犯で捕まってしまったら……")
	await novel_interface.show_text_only("少尉さんは固まる俺をじっくりと見つめた。

それからジュースを貰って能天気に喜んでいる、
シンチェンへと視線を動かす。")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("……こんなに堂々と彼女みたいな子を連れて
街中を歩いてたら、すぐに逮捕されるわよ？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("携帯電話より2、3倍ぐらいは分厚そうな端末を
少尉さんはベルトから取り出した。")
	await novel_interface.show_text_only("手際よく端末をタップすると、端末の印刷口から
横幅1センチぐらいの白い紙帯が現れる。
紙帯にはバーコードが印刷されていた。")
	await novel_interface.show_text_only("少尉さんはシンチェンの腕に紙帯を宛がうと、
両端を引っ付け腕輪のようにして巻き付ける。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("軍隊用の臨時IDよ。バーコードのインクは
36時間後に自動で消えるわ。", "エミリオ")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("紙帯は防水性だからシャワーなら大丈夫だけど、
お風呂に浸かったり水泳なんかはしないでね。", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("期限までに入国管理局で手続きをするか、
この子を連れて街から出なさい。
分かったかしら？", "エミリオ")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","wry_smile",0.25)
	await novel_interface.show_dialog("わ、分かったよ！

えっと、ありがとう……", "レン")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("気にしないでって。

私のキャンプは外城区域にある医療救援組織の
輸送センターの隣よ。", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("もしかすると、また直ぐに会えるかも
知れないわね？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("少尉さんはシンチェンのほっぺを摘まんで、
バッグを片手に離れていく。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("それじゃ、バ～イ！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は少尉さんの背中を見つめながら、
シンチェンの手を握り締めた。")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("良い人で助かった……", "レン")
	await novel_interface.hide_character()
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("当日の夜。")
	await novel_interface.show_text_only("──マサダインバルホテル客室内。")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Masadhotel.png")
	novel_interface.show_character("anne_uniform","smile")
	await novel_interface.show_dialog("よ～～っし！", "アニー")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("部屋内にあった盗聴器とか盗撮カメラは、
全部片付けたよ！", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣が事前に用意してくれていた機械を使い
客室の隅々まで検査した結果、
30分弱で大量に仕掛けられていたマイクロ系の
装置を全て発見する事ができた。")
	novel_interface.show_character("anne_uniform","happy")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","wail",0.25)
	await novel_interface.show_dialog("……ってこんなに多いのかよ！？", "レン")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("全ホテルの高級客室に仕掛けてあるだろうし
私達だけが狙いの代物じゃないよ。
これが『マノーラ』の通常運転なんだと思う。", "アニー")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("と言う訳で安全も確保したし、リビングで
マリルとお喋りタイムだね～～♪", "アニー")
	novel_interface.hide_all_characters()
	await novel_interface.show_text_only("シンチェンはベッドの上に寝そべって、
ホテルのペンと紙で絵を描いている。
実物へ干渉できるようになった事が、
興奮冷めやらない様子だ。")
	novel_interface.show_character("ren_medical","bored")
	await novel_interface.show_dialog("（つまりは直に俺の携帯とかを使って
　遊べるわけで……）
（何か更に面倒事が起きそう……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("携帯の個人情報が暴かれる嫌な予感がしたので、
迅速にフォルダへパスワードを掛けた。
全てに掛け終えて安堵していると、
胸からしびれる感じが伝わって来る。
……個人情報など無意味！と言わんばかりに
愛衣の声が胸から聞こえて来た。")
	await novel_interface.show_dialog("聞こえるかい？

今アニーの報告をまとめてる最中なのだけど──", "愛衣")
	await novel_interface.show_dialog("マサダ内城区域へ入った途端にシンチェンは
色々な物に触れられる身体を獲得した。
でも記憶は戻ってないって事だね？", "愛衣")
	novel_interface.show_character("ren_medical","shy")
	await novel_interface.show_dialog("携帯を使えよ！！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("だって、こっちの方が音質良いし……", "愛衣")
	await novel_interface.show_dialog("気にしない～♪　気にしない～♪", "愛衣")
	await novel_interface.show_dialog("とにかく状況確認が先決だよ。

アニーがシンチェンの存在を認識できるように
なったのは、
レンちゃんが金庫室で発見した金色の小粒に、
直接触れてからだよね？", "愛衣")
	novel_interface.show_character("anne_uniform","worry")
	await novel_interface.show_dialog("うん。もう見えた瞬間びっくりだったよ？
ほんと、幽霊が出たのかと思った……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("レンちゃん以外にも効果があると言う事は……
新型の異質物なのかな？", "愛衣")
	await novel_interface.show_dialog("ホテルの体重計だと、彼女の重さは
20キログラム。
年相応の平均レベルだね。", "愛衣")
	await novel_interface.show_dialog("記憶は失ってるけど、基本的な生活常識があって
知識量は同年代を遥かに凌駕している。
ウェブページ上の文章も楽々読めちゃうご様子。", "愛衣")
	await novel_interface.show_dialog("この子……

是非ともモルモットにしよう！！", "愛衣")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("モ、モルモ……ット？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("レンちゃん早くその子を新豊洲に連れ戻してッ！

彼女の身体構造から脳まで余すところなく
丹念に丹念に丹念に研究すあぷぅッ！？", "愛衣")
	await novel_interface.show_text_only("加速的にエスカレートしていく愛衣の独り言が、
マリルの会心の一撃によって止められた。
最近うちの戦研部主任は頭を叩かれ過ぎてて、
変人さが余計に増さないか少し心配だ。")
	await novel_interface.show_dialog("コホン……その子から何か新しい要求はあるか？", "マリル")
	await novel_interface.show_dialog("記憶を取り戻す手掛かりになるかもしれん。", "マリル")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("無いらしいけど……

強いて言うなら、彼女が今求めているのは
遊びと食べ物かな。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──テーブルへと視線を向ける。

そこにはシンチェンが販売冷蔵庫から取ってきた
一口しか食べていないお菓子が散らかっていた。")
	await novel_interface.show_dialog("……仕方ない、お前達はもうしばらく待機だ。

マサダとレジスタンスの停戦協定調印式は、
明後日の朝に予定されている。", "マリル")
	await novel_interface.show_dialog("国際医療救援組織のメンバーとして規則に則り
レンは明日「国史講習」を受けろ。
さもなくば、自由行動の許可は出せない。", "マリル")
	novel_interface.show_character("anne_uniform","frustrate")
	await novel_interface.show_dialog("「国史講習」……なにそれ？", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("マサダにおける愛国主義教育みたいなものだな。

とは言っても国家博物館に3時間以上
滞在するだけの簡単な講習だ。", "マリル")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("……サボっていいですか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("簡単だって言ってるだろうが。

原則としてNGOメンバーは講習が終わるまで
隔離壁の外に行く事を禁止されている。", "マリル")
	await novel_interface.show_dialog("シンチェンの正式IDの事もあるからな、
駄々を捏ねても無駄だぞ？
お前は講習が終わり次第に入国管理局へと
彼女を連れて行き申請手続きをしてくれ。
大使館のスタッフを手配しておくから、
そいつに付いて行けば大丈夫だ。", "マリル")
	novel_interface.show_character("anne_uniform","worry")
	await novel_interface.show_dialog("待機と言っても色々ゴタゴタになりそうだね。

本格的な観光も明後日の調印式が終わってからに
なりそう……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("いてててて……
ア、アニーの話の通り……なんだけど───", "愛衣")
	await novel_interface.show_text_only("叩かれてダウンしてた愛衣がようやく目覚める。")
	await novel_interface.show_dialog("調印式の日にマサダは砂嵐注意報が出ていて、
特に昼頃は砂塵で覆い尽くされるみたい。
具合によっては明後日すら支障が出るかもよ。", "愛衣")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("砂嵐か……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","worry")
	await novel_interface.show_dialog("だから調印式が朝になったの……？", "アニー")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Duststorm.png")
	await novel_interface.show_text_only("マサダは地中海気候で西風の多い場所だけど、
一年間に何週かだけ、東風になる時期がある。")
	await novel_interface.show_text_only("この時期になると風化した砂が巻き上がり、
東風は莫大な砂塵を乗せた砂嵐と化すそうだ。")
	await novel_interface.show_text_only("巨大な隔離壁は内城区域の脆弱な生態系を
激しい環境から守る意味も込められている。")
	await novel_interface.show_text_only("窓の外から見える美しい市街地。

この場所が砂嵐に襲われた時は一体、
どんな様相になるのだろうか……")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Masadhotel.png")
	await novel_interface.show_dialog("うあぁぁ――――ッ！？！？", "シンチェン")
	await novel_interface.stop_music()
	await novel_interface.show_text_only("カシャァァンッ！！！

──隣の部屋からガラスの破裂音が聞こえた。")
	novel_interface.show_character("ren_medical","shout")
	await novel_interface.show_dialog("どうしたっ！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺とアニーは直ぐに音が鳴った方へと向かう。

そこには床に腹ばいで倒れているシンチェンと、
赤い液体が撒き散らされた地面が──
────────────────────")
	novel_interface.show_character("stardust_small","panic")
	await novel_interface.show_dialog("あ…あぅ……あ……
……ザクロジュース……", "シンチェン")
	novel_interface.change_expression("tear")
	await novel_interface.show_dialog("こ、こぼしちゃったよぉ……", "シンチェン")

	print("=== 星尘降临篇第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
