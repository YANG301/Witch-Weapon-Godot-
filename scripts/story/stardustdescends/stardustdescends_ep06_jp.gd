# stardustdescends_ep06.gd - 星尘降临篇第6话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep06_script()

func play_script():
	pass

func stardustdescends_ep06_script():
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	await novel_interface.show_dialog("ねぇ、何を探しているの～～？", "女の子の声")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("……………………………………………………

――――――――――――っっ！！！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("突如として密閉空間に女の子が現れる。

俺は恐怖のあまり、身も心もフリーズしていた。")
	novel_interface.show_character("ren_full","sob")
	await novel_interface.show_dialog("（ぎゃああああぁぁぁ――ッ！？！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ホラー映画のお約束なら……お、俺は今から……")
	await novel_interface.show_text_only("…………")
	await novel_interface.show_dialog("んん～？", "小さい女の子")
	await novel_interface.show_text_only("魂が抜け落ちたかのように立ち尽くす俺。

そんな俺の前にひょいっと回り込み、
興味津々に見つめてくる女の子。")
	novel_interface.show_character("stardust_small","panic")
	await novel_interface.show_dialog("ま、まさか…………壊れちゃった？", "小さい女の子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("女の子は手を伸ばすと俺の顔を適当につねった。

それに呼応して頭のネコ耳みたいな装飾が、
金色に点滅する。")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("キ、キ、キミは……？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","wordless")
	await novel_interface.show_dialog("え～～、覚えてないの？", "小さい女の子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……何を？")
	await novel_interface.show_text_only("彼女は失望した表情で溜め息を吐いた。")
	novel_interface.show_character("stardust_small","wordless")
	await novel_interface.show_dialog("うーわ。相変わらず無責任な性格なんだぁ……", "小さい女の子")
	novel_interface.change_expression("konata_eye")
	await novel_interface.show_dialog("やれやれだぜ……", "小さい女の子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("「マジかよお前」と言わんばかりの表情で、
女の子は頭を振った。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("──はっ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("状況は全然把握できてないが、この小娘から
馬鹿にされた事だけは分かった。")
	novel_interface.show_character("ren_full","upset")
	await novel_interface.show_dialog("一体、誰なんだよお前は……？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","pleased")
	await novel_interface.show_dialog("ふふ～ん♪
じゃあ特別にもう一回だけ教えて進ぜよ～う！
よ～く聞いてね！", "小さい女の子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("女の子は腰に手を当て、得意げに顎を上げた。
今から名前を発表するらしい。")
	novel_interface.show_character("ren_full","bored")
	await novel_interface.show_dialog("（この表情……）

（知っているような気はするんだけど……）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","pleased")
	await novel_interface.show_dialog("ジャカジャカジャカジャカ……ジャンッ！！

私の名前はぁ――？", "小さい女の子")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","uneasy")
	await novel_interface.show_dialog("（貴族のお嬢様、天才少女、暴力的な姉御、
　ドMの変態とかじゃないよね……）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","uneasy")
	await novel_interface.show_dialog("私の名前はぁ──", "小さい女の子")
	await novel_interface.show_dialog("私の──…………", "小さい女の子")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","stare")
	await novel_interface.show_dialog("……うん？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("さっきまで得意気だった彼女の表情が、
徐々に狼狽したモノへと変わっていった。
まるで誘拐犯でも見るかのように、
真っ直ぐに俺を見つめる。")
	novel_interface.show_character("stardust_small","panic")
	await novel_interface.show_dialog("…………えっと。

私……なんて名前だったのかな！？", "小さい女の子")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","perspire1")
	await novel_interface.show_dialog("知らねえよッ！？！？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","tear")
	await novel_interface.show_dialog("あっ！　キ、キレたぁ！", "小さい女の子")
	await novel_interface.show_dialog("ふぇーん……", "小さい女の子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ツッコミに驚いたようで、彼女は左右を見回して
ビクビクしながら俺から距離を取った。")
	await novel_interface.show_text_only("そのまま背中をこちらへ向けて、
頭を手で抑えながらしゃがみ込んでしまう。")
	novel_interface.show_character("ren_full","shy_left")
	await novel_interface.show_dialog("（……なんか俺が悪役みたいになってる！？）", "レン")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("え～～っと？ 　それは……？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ふと彼女の手首を見ると、ピンク色のヨレヨレな
紙切れが巻かれていた。
彼女に近寄って、その紙切れを取り外してみる。")
	await novel_interface.show_text_only("紙にはミミズみたいな歪んだ文字が
書かれていた。")
	novel_interface.show_character("ren_full","normal2")
	await novel_interface.show_dialog("「星尘」（シンチェン）……？", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","panic",0.25)
	await novel_interface.show_dialog("あぁぁ――！？！？！？", "小さい女の子")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("何気なしに書かれていた文字を呟くと、
彼女が飛び上がった。
急上昇したネコ耳が俺に突き刺さりそうになる。")
	novel_interface.show_character("ren_full","normal2")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("stardust_small","panic",0.25)
	await novel_interface.show_dialog("ピンポンピンポーーン！！
それが私の名前だよ！？！？", "小さい女の子")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("なんで自分の身体に名前を貼り付けてんだよ！？
ペットか何かじゃないだろ！！
それとも無責任な親に名前付きの紙を括られて
孤児院へ捨てられちゃったとか言う流れか！？")
	novel_interface.show_character("ren_full","normal2")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	await novel_interface.show_dialog("わ、私……
うぅ……ぐす……", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("彼女は鼻水をすすりながら涙目になって
しまった。
今すぐにでも泣き出しそうな様子である。")
	novel_interface.show_character("ren_full","perspire1")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("あ、いや、俺はそんなつもりじゃ……", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("頭を下げたまま黙り込み、彼女は自分の感情を
落ち着かせようとしていた。
その様子を見て冷静さを取り戻した俺も
ようやく状況を把握し始める。")
	await novel_interface.show_text_only("突然この子が金庫内に現れた原因は、
恐らく俺が隕石に触れたからだと思う。")
	novel_interface.show_character("ren_full","upset")
	await novel_interface.show_dialog("（もしかして……この子は魔女なのか？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("だけどあの隕石が地球に落ちたのは
4000年前って話だろ？
この子の服装はどう見ても昔の物じゃないし……")
	novel_interface.show_character("ren_full","normal2")
	await novel_interface.show_dialog("（それともハインリッヒの時と似た状況で……）

（服装は「アイツ」が作成した物なのか？）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","normal1")
	await novel_interface.show_text_only("──いや、違う気がする。

あのネコ耳ヘッドホンは、どこかの通販サイトで
見た事あるぞ。")
	novel_interface.change_expression("normal2")
	await novel_interface.show_text_only("彼女に似合ってはいるんだけどな……")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そもそも彼女の喋り方は、SNSなんかを趣味に
している子達にそっくりだ。
そんなので古代人だとは流石に言わせない。")
	await novel_interface.show_text_only("……何かしらの影響が記憶にまで及んだのかな？

後でアニーに児童失踪名簿でも調べてもらうと
するか……")
	await novel_interface.show_text_only("今後の予定を順序立てて考えるために、
俺は頼りない自分の頭脳をフル回転させる。
理解の及ばない状況に酷く頭を痛めていると、
どうした事か彼女が抱き着いてきた。")
	novel_interface.show_character("ren_full","timid")
	await novel_interface.show_dialog("…………ぇお？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺が拒絶しないと分かった途端、
彼女は力を強める。
小動物の赤子みたいに頬をお腹へと引っ付けて、
俺が離れる事を阻止してきた。")
	novel_interface.show_character("ren_full","timid")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	await novel_interface.show_dialog("とにかく、あなたは行っちゃダメなの……！", "シンチェン")
	await novel_interface.show_dialog("約束したのに……", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("彼女は泣きながら、物凄く悲しそうに
小声で呟いた。")
	await novel_interface.show_text_only("俺は優しく彼女の頭を撫でてあげる。

淡青色の髪はシルクのように柔らかく
スベスベだった。")
	await novel_interface.show_text_only("金庫室の照明の光を艶やかに浴びており、
波打つと紫色に淡く輝く……")
	novel_interface.show_character("ren_full","gratified")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("（俺を誰かと勘違いしてるのか？）

（しょうがないなぁ……）", "レン")
	await novel_interface.show_dialog("よ、よ～しよし、分かったよ……", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("……実際は何も分かってないけどな！

子供のあやし方ってこんな感じか？")
	novel_interface.show_character("ren_full","smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("大丈夫だ、俺はどこにも行かないぞ～？

その代わり協力してくれないかな？ 
何か聞かれたら俺と一緒に来たって答えるんだ。", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("彼女は頭を俺の服に埋めたまま小さく頷いた。")
	novel_interface.show_character("ren_full","shy")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("（まさか俺の事をお母さんって思ってるとか
　じゃないよな？）", "レン")
	novel_interface.change_expression("shy_left")
	await novel_interface.show_dialog("（男だった時を含めて……）

（ファーストキスですらまだなんだぞ……）", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("考えるのは止めにしておこう。
……大事な部分の傷口が広がるだけだ。
それよりも俺は予め想定されていた
魔女出現後の作戦プランを思い出す。
対象に敵意がないと確認、及び判断できた場合、
従者の暗示を掛け直す事に注力──")
	await novel_interface.show_text_only("彼女に優しく話しかけながら手を離してもらう。

そこから俺は金平糖みたいな球状の物体を
自らの「安全」な場所に押し込んだ。")
	await novel_interface.show_text_only("念のために0812号のコンテナを再度開けて、
隕石がちゃんと置いてあるか確認する。")
	novel_interface.show_character("ren_full","normal2")
	await novel_interface.show_dialog("（トスハイム青金石柱みたく砕け散ったりとかは
　してないな……）", "レン")
	await novel_interface.hide_character()
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	await novel_interface.show_text_only("特に変化のない状態で何よりだったが
コンテナを閉め直した時に俺は気付いた。
監視カメラのランプが素早く点滅している……

これは俺とアニーが予め決めていた緊急信号だ。")
	novel_interface.show_character("ren_full","serious")
	await novel_interface.show_dialog("──何か起きたのか！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("不味い、この子の相手ばかりに気を取られて
確認が疎かになっていた。
いつから緊急信号が点滅していたのか
一切を把握できていない。")
	await novel_interface.show_text_only("示し合わせたかのように廊下の方からも
「ピンポーン」という音が聞こえてくる。")
	novel_interface.show_character("ren_full","serious")
	await novel_interface.show_dialog("まさか……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("今の音は、エレベーターの扉が開く時の──")
	novel_interface.show_character("ren_full","wail")
	await novel_interface.show_dialog("し、しまった！！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺はシンチェンを引っ張りつつ靴とカバンを
急いで拾い上げた。
素早くエレベーターへ向かって走り出す。")
	novel_interface.show_character("ren_full","sob")
	await novel_interface.show_dialog("（ヤバイ！係員の暗示をかけ直す時間がない！）

（この子もどうやって誤魔化せば……！！）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("――などと考えても時すでに遅し。

何とか係員さんの近くまでたどり着いたが、
すでにエレベーターの扉は開いていた。")
	await novel_interface.show_text_only("エレベーターから現れたのは4人組。
先頭に立っているのは軍服を着た女性だ。")
	await novel_interface.show_text_only("彼女の背後には青い迷彩服を着た男が2人、
左右に分かれて立っている。
何かを2人で気だるそうに担いでいる様子だが、
それは上の階にいたカジノマネージャーだった。")
	await novel_interface.show_text_only("先頭の女性が意識を取り戻した係員と、
息切れしている俺を見て溜め息を吐いた。
そして少々気が乗らないような感じで
話しかけてくる。")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("マサダブルク国防軍、カラカル大隊所属の
エミリオ・スィートライド少尉よ。
私達は海防任務を遂行するために来たの。", "女性士官")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("この少尉と名乗る色白の彼女は、
右目は青色で左目はオレンジ色をしていた。")
	novel_interface.show_character("ren_full","stare")
	await novel_interface.show_dialog("（……オッドアイってやつかな？）

（初めて見た……）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("あなた達は今、マサダブルク軍が統制を敷いた
海域内にいるわ。
情報によると、この船には《サモントン条約》で
定められた禁制品が積まれてるって……", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("……そんな感じの「捜査権」云々の無駄話は、
さっき船長に伝えといたから。", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("文句があるならマサダブルク軍事委員会か、
外で浮かんでいる武装哨戒艇に言いなさい。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("おいおい、マジかよ。

この年若い少尉さん、国際法で定められている
「権利声明」を端折ったぞ。
澄ました顔で拳銃に弾丸を込めているし……")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("と言うわけで、大人しく協力してよね。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女がアイコンタクトを送ると、背後の兵士達は
貧弱なマネージャーを金庫の中へと連行する。")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("……で、金庫にいるのはあなた達2人だけ？
さっきまでナニしてたのかしら？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","normal1")
	await novel_interface.show_dialog("（俺達……2人？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("少尉さんの呼びかけに思わず横目で
シンチェンを見る。
彼女は素知らぬ様子で目をぱちくりさせていた。")
	await novel_interface.show_text_only("視線を係員さんの方に変えると、彼は催眠から
完全に目覚めた様子だ。
手にしたチップを眺めながら何かを考えており、
その姿に俺は耐えきれない程の緊張を感じた。")
	novel_interface.show_character("ren_full","sob")
	await novel_interface.show_dialog("（催眠のおかげで、脳が前後の過程とか詳細を
　色々と補完したんだよな？）
（頼むからこの子の事も上手く補完して
　おいてくれ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……彼の顔が真っ赤になっていく。

良く見ると額からも汗が出てきた。

何か悪い事がバレた時のような表情をして……")
	await novel_interface.show_dialog("い、いやいやいやいや！？！？！？", "係員")
	await novel_interface.show_dialog("ほ、本当、本当に何もしてないんですよ……！！", "係員")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("…………", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","wail")
	await novel_interface.show_dialog("…………", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("お前は一体なにを補完したんだ！？")
	await novel_interface.show_text_only("ここにいる子供は見えていないのか！？")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("へぇ～～？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("意味深な顔を見せると、彼女は係員さんの股下に
軽蔑の眼差しを向けた。
そして一歩一歩と迫って行く。")
	await novel_interface.show_text_only("係員さんは彼女の持つ銃を目で追っている。

その表情は今にも恐怖で漏らしてしまいそうな
感じだ。")
	await novel_interface.show_text_only("冷たく「ふんっ」と一言だけ発すると、
微笑みながら彼女は俺の方へと振り返る。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("お嬢さん、あなたの身分証を。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("えっ？　……ぁあ！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は急いでハンドバッグの中を漁った。

SIDは今回の作戦のために、いくつかの
偽造の身分を用意してくれている。")
	await novel_interface.show_text_only("マサダブルク側からの尋問を受けた場合、
使うのは確か……
俺はオレンジ色の身分証を取り出した。")
	await novel_interface.show_text_only("その身分証を携帯端末でスキャンした後、
彼女は少しだけ眉を上げる。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("国際医療救援組織……？", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("看護師の見習い？
ふふ、こんなポジションまであるの？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──ごめんなさい。

──3日間の臨時医療訓練を受けただけの
看護師見習いです。")
	await novel_interface.show_text_only("しかも最後の試験は自分の筋肉に中央アジア産の
ワクチンを注射するという……")
	await novel_interface.show_text_only("試験当日、俺は注射器を持ったまま1時間ほど
躊躇していた。
太ももの皮膚に針が突き刺さりかけた瞬間、
怖くてどうしても手が止まってしまうのだ。")
	await novel_interface.show_text_only("でもやらないとマリルに…………って事で、
意を決して針を刺そうとした。その時──
胸のスピーカーから鋭い爆音が鳴り響いた。")
	await novel_interface.show_text_only("驚いた勢いで針が3分の2ぐらい体内へ
刺さり、お陰様で合格となったんだけど──")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("（あいつら勝手に録画してた上、それを何度も
　見ながら爆笑しやがって……）
（奴らは全員サディストか！？）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("その服装からすると、お嬢様はNGOの
宣伝映像に洗脳された感じかしら？", "エミリオ")
	await novel_interface.show_dialog("……それとも社会経験を積んで、大学の単位を
少しでも増やしたいのかな？", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("どう見ても向上心があるようには
見えないんだけどねぇ。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","wail")
	await novel_interface.show_dialog("（俺ってそんなに分かりやすい！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("値踏みをする少尉さんに未だ緊張感を隠せない。

バレないかと冷や冷やしながら話を聞いてると
突然、彼女は顔を耳元まで近付けて来る。
──そして低く冷たい声で呟いた。")
	await novel_interface.show_dialog("交戦区域はあなたみたいな子供が
おママゴトをする場所じゃないよ……", "エミリオ")
	await novel_interface.show_text_only("驚く間もなく彼女はすぐさま笑顔を戻して、
俺の肩をたたく。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("冗談よ、冗談。
私達もあなたを頼る時が来るかも知れないわね！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女はそう言いながら、俺に青色の
リストバンドを装着した。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("それを外しちゃダメよ？

検査後はそれを装着するよう決められていて、
未検査の人達と区分されるわ。
つまりあなたは合格って事。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("（身分証をスキャンしただけでクリアだって？）

（いや、それ以上に奇妙なのは……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は驚愕の表情を隠しつつ、エミリオに向けて
変顔しているシンチェンを見た。")
	await novel_interface.show_text_only("ここにいる人達は全員……

……シンチェンが見えないのか？")

	print("=== 星尘降临篇第6话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
