# stardustdescends_ep13.gd - 星尘降临篇第13话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep13_script()

func play_script():
	pass

func stardustdescends_ep13_script():
	novel_interface.change_music("res://assets/audio/music/Story_01.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadSentry.png")
	await novel_interface.show_text_only("俺達の進行方向には建造途中の隔離壁があった。")
	await novel_interface.show_text_only("内城区域の端に当たるため中央の市街地のような
治安の良さは感じない。")
	await novel_interface.show_text_only("鋼鉄、コンクリートと塵埃……

荒涼たる砂漠は戦地の粗雑な雰囲気を匂わせる。")
	await novel_interface.show_text_only("もはや駐屯地とも呼べる検問所の周囲には、
同型の装甲輸送車が物騒にも立ち並んでいた。")
	await novel_interface.show_text_only("遠くでは所狭しと重機達が働いており、
ドローンの群れが隔離壁の上空に伺える。")
	await novel_interface.show_text_only("設置された金属フェンスを見ると、遠目にも
「通行禁止」と書かれている気がするが……")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPCO2.png")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("……突っ込む気なのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("少尉さんは笑いつつ装甲車の内壁をノックした。")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("こいつで？", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("固い装甲だけど、熱の伝導性は普通の金属と
同じぐらいよ。
もし攻撃されたら、私達が焼き上がるまで
20秒ってところかしら。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──俺達の車が急停車する。

運転席から声が聞こえてきた。")
	await novel_interface.show_dialog("カラカル大隊所属のヴィラ・ヴァルキューレ
一等准尉だ。
偵察任務のためにキャンプの隊員を迎えに行く。", "ヴィラ")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（この声ってカジノ船でセキュリティーチェック
　を取り仕切っていた、あの怪力女！！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女がデブ総主教を片手で持ち上げていた事を
俺は鮮明に覚えている。")
	await novel_interface.show_dialog("おう、ヴィラじゃないか。

今イェフダ市場辺りに抗議の連中が湧いてるから
囲まれたくなけりゃあ別の出口を──", "男性の声")
	await novel_interface.show_dialog("良いから早く通せ！　遠回りじゃ間に合わない！", "ヴィラ")
	await novel_interface.show_dialog("──っと、分かった分かった。
ただトラブルだけは起こすなよ？
お前の親父さんからお叱りを受けたら
こっちだって形無しだ。
この前なんざ、総参謀部から直接電話が
掛かってきたんだぞ……", "男性の声")
	await novel_interface.show_dialog("もう一度その話を私にしたら、全力でアクセルを
踏むからな？", "ヴィラ")
	await novel_interface.show_dialog("……了解だ。おい、道を開けろっ！
ヴィラ様のお通りだ！！", "男性の声")
	await novel_interface.show_text_only("相変わらずの強気な態度を取る怪力女だが、
意外と軍の人に顔が利くようだ。
人望が厚いのか、逆らうと面倒事になるのか……

そんな中、少尉さんは俺の耳元に顔を近付けて
小さな声で尋ねてくる。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("ねぇ、さっき一瞬だけ大声で助けを呼ぼうと
したわよね？
すぐに諦めたみたいだから良いけど、
そんな事を考えちゃ駄目でしょ～？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","shy_left")
	await novel_interface.show_dialog("そそ、そんな事はないです！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("素早く顔を逆方向へと向けるが誤魔化せては
ないだろう。
俺はこう言うタイプの人が一番苦手
なんだよ……")
	await novel_interface.show_text_only("道を塞いでいた連中が立ち退いて通路を空け、
ゆっくりと車が隔離壁を通り抜けていく。
そのまま俺達はマサダの外城区域に入った。")
	await novel_interface.show_text_only("先へ進めば進むほど、通行人が増えていく。")
	await novel_interface.show_text_only("路面の舗装は甘く、植生などの景観も少ないが、
非常に賑やかな街並みだ。
往来する群衆に多数のバス、数々の露店、
タイムトラベルしたような光景が眼前に広がる。")
	await novel_interface.show_text_only("えーっと……荒れ果てた土地は？ 

テロの爆弾攻撃は？

……マサダに対してのイメージを根本から
改めなくちゃいけないような気がした。")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("人が滅茶苦茶いるなぁ……", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","smile",0.25)
	await novel_interface.show_dialog("まあ、隔離壁の中で暮らしているのは、
マサダの全人口の1割程度だから。", "エミリオ")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("1割！？ あの中にそれだけしかいないのか！？", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("内城区域の面積は32平方キロメートル、
それはマサダ全体の4分の1にも満たないわ。
おかげで地価は高騰しっぱなしなの。", "エミリオ")
	await novel_interface.show_dialog("1坪でも簡単に手を出せる値段じゃないもの。

死海側にあるアパートなら同じ値段で
部屋1つは買えちゃうわね。", "エミリオ")
	novel_interface.character_light(0.35,"wry_smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("隔離壁の事はてっきり……その……", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("アパルトヘイト……人種隔離制度かしら？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("特定の人種が特定の人種を差別的に扱う政策が
国によって推進される事もあるらしい。
俺が言い淀んだ事を少尉さん側から口にした。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("連合議会からは禁止にされているけど……", "エミリオ")
	await novel_interface.show_dialog("マサダには《反テロ法》が制定されているの。

内城区域に住みたい場合、まずは安全局の審査を
受ける必要があるわ。", "エミリオ")
	await novel_interface.show_dialog("そこで直系の親族が特定民族である申請者は、
審査から「偶然」落ちるみたいで……
……ここまで言えば分かるかしら？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("それって結局、隔離政策と同じだよな！？")
	await novel_interface.show_text_only("ただ隔離するのは自分達側だけど……")
	await novel_interface.show_text_only("土地が高いって話だし、マサダ人だとしても
多くは外城区域に住んでいる様子だ。")
	await novel_interface.show_text_only("俺は再度モニターに目を向けた。

M16自動小銃を抱えた女性の兵士が
露店の前にしゃがみ、
頭巾で顔を隠した女店主と交渉している。")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("（家を買えないのは、どこの人も同じか……）

（……ってうわッ！？！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──いきなり急停止する装甲車。

俺がモニターへ激突しそうになっている最中、
運転席から怪力女の罵声が聞こえてくる。")
	await novel_interface.show_dialog("くそッ！！", "ヴィラ")
	novel_interface.show_character("emilio","shout")
	await novel_interface.show_dialog("どうしたの！？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("……ドローンを出したからモニターで
確認してくれ。", "ヴィラ")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("言われるままにモニターを見ると、ゾッとする
光景が映し出されていた。")
	#novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_AncientHumanEH.png") #原游戏有素材，但已丢失
	await novel_interface.show_text_only("どこかのお偉いさんの葬儀……とは明らかに
様子が違う。
黒いジャケットと帽子を身に着けた男性を筆頭に
1000以上に及ぶ黒装束の人達が集まっていた。")
	await novel_interface.show_text_only("彼らは自作した白黒のプラカードを持っている。

それらを高々と掲げている様は、他に存在する
全ての色を否定するかのようだ。")
	await novel_interface.show_text_only("ほとんどの人が長い髭を生やして、
両方のもみあげを三つ編みにしている。
なんかどこかで見た事あるような……")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPCR1.png")
	await novel_interface.show_dialog("【ﾋﾟｰｰ】どもめッ！ 

国家の補助金で生活している癖に毎日毎日
【ﾋﾟｰｰ】みたいな抗議しやがって！", "ヴィラ")
	await novel_interface.show_text_only("……多分【ﾋﾟｰｰ】は方言の一種だ。

言葉の意味は理解できないけど、伝えたい事は
何となく分かった。")
	await novel_interface.show_dialog("神の教えを講じる小学校の数を倍にしろだと！？

あいつら【ﾋﾟｰｰ】髪が【ﾋﾟｰｰ】脳の中まで
生えたのかッ！？", "ヴィラ")
	await novel_interface.show_text_only("運転席の扉が力強く蹴り開けられた。

どうやら車から降りて喧嘩を売りに行った
みたいだが……")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("か、彼女は何を……？", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","mock",0.25)
	await novel_interface.show_dialog("ナンバープレートでも隠すつもりじゃ
ないかしら～？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("少尉さんは適当に相槌を打つと、分厚い軍用の
タブレットで地図を確認し始める。")
	novel_interface.show_character("ren_medical","wry_smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("emilio","mock",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……あの人達はマサダ人じゃないの？

さっき博物館でも見た覚えがあるぞ。", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"stare")
	await novel_interface.show_dialog("彼らはマサダの「文化遺産」的な存在よ。

仕事、税金、兵役などの全てが免除されて、
毎月政府から補助金も貰えるの。", "エミリオ")
	await novel_interface.show_dialog("自身の宗教裁判所すら持っているから、
交通妨害などで社会秩序を破っても、
警察と軍隊は彼らに何もできないわ。", "エミリオ")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……そんなのが許されるのかよ。", "レン")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("（毎日引き籠ってゲーム三昧できるじゃん……）", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"mock")
	await novel_interface.show_dialog("──代わりに教義は絶対厳守。

家にパソコンやテレビを置いたり、
ネットにアクセスするのもアウトね。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("（酷刑だったッ！！）")
	novel_interface.show_character("ren_medical","uneasy")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","speechless",0.25)
	await novel_interface.show_dialog("彼らの奥さんだけは電子機器の使用が
許されているわ。
仕事をするのに今の時代じゃどうしてもって
感じかしら？", "エミリオ")
	novel_interface.change_2nd_expression("stare")
	await novel_interface.show_dialog("補助金はそこそこ貰えるけど「産めよ、増えよ」
って神の教えで子供を沢山産むから。
家族が10人以上もいれば、生活が厳しく
なるのは当然の結果ね。", "エミリオ")
	novel_interface.change_2nd_expression("speechless")
	await novel_interface.show_dialog("宗教学校が足りなくなるのも、母数が多いんだし
当たり前じゃない？", "エミリオ")
	novel_interface.character_light(0.35,"bored")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("（博物館で見かけた沢山の子供達って
　もしかして……）", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("白黒の衣装を着た男性が2人いて、
痩せ顔の女性が2人で後ろを歩いていて……")
	await novel_interface.show_text_only("……ベビーカーを押していた理由が今分かった。")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("宗教原理主義者なんて……

特に過激派はどこの宗教でも癌よ。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俯いてタブレットを弄り続けながらも、
どこか悲しみを帯びた声で少尉さんは呟く。")
	await novel_interface.show_text_only("そんな話をしている内、怪力女が車内へと
戻ってきた。
少尉さんは運転席後部の金属プレートを
軽く叩いて彼女を呼ぶ。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("東側に回って。

3番目の交差点に最近建てられた高架橋が
あるでしょ？
あそこを通るのが一番早いと思うわ。", "エミリオ")
	await novel_interface.show_dialog("それと「アレ」をするつもりなら、
Uターンしてからよ。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("了解だ。", "ヴィラ")
	await novel_interface.show_text_only("力強くアクセルを踏んで一気にハンドルを回す
怪力運転手。
乗客の気持ちを一切考えない感じに
車がUターンをする。")
	await novel_interface.show_text_only("「ドン――、ドン――、ドン――、ドン――」
っと、車の天井から音が4回響いた。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("（今の音……）

（ランチャー的な発射音っぽかったけど！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……黒装束の群衆が騒ぎ出す。

催涙ガスと思われる白い煙が4か所から
立ち上っていた。")
	await novel_interface.show_text_only("混乱を背にして、車は現場から全速力で
離れていく……")
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("隔離壁が段々と遠ざかっていき、周辺の環境も
殺風景になっていく。")
	await novel_interface.show_text_only("元々マサダブルクは砂漠の中に建てられている
都市だ。
市街地の雰囲気こそ特異だったのかも知れない。")
	await novel_interface.show_text_only("誰もいない道の上を装甲車は疾走する。")
	await novel_interface.show_text_only("孤独な道路に人の痕跡などはなく、
少し枯れた灌木が砂地に佇むばかり。")
	novel_interface.change_music("res://assets/audio/music/unkown/Battle_08.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPost.png")
	await novel_interface.show_text_only("建物らしき景色が見える頃には、都心部から出て
すでに1時間が経過していた。
軍用の補給所のような場所で、車はようやく
停止する。")
	novel_interface.show_character("valkyrja","normal")
	await novel_interface.show_dialog("ここだぞ。本当に彼女に手伝って貰うのか？", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("えっ！？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("大丈夫、彼女はもちろん協力的よ。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("お前らッ！俺が逃げ――", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("抗議をしながら車から降りた俺だが、
言いかけた台詞を飲み込んだ。")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("……はは、辺り一面全てが砂漠だ。

どこに逃げると言うのだ俺は。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("砂漠に埋もれかけの補給所は、遠くからだと
砂丘の1つにしか見えないだろう。")
	await novel_interface.show_text_only("停まっていたジープの表面も分厚い砂で
覆われていた。
弾除けとして使う土嚢袋は散らかりっ放し。")
	await novel_interface.show_text_only("フォークリフトと発電機は錆と風食によって
ボロボロな状態であり、
壁の角には転倒した弾薬クレート達が
放置されていた。")
	await novel_interface.show_text_only("随分前に廃棄された様子だけど……

こういう場所の維持費用って高いだろうし……")
	await novel_interface.show_text_only("レジスタンスはこの辺りからいなくなって、
軍がもう必要としなくなったのかな？")
	await novel_interface.show_text_only("空笑いしながら、思い付く事を適当に
頭の中で並べた。
──いわゆる現実逃避である。")
	await novel_interface.show_text_only("この果てなき砂漠を眺めていると、
全てを忘れたい感情が芽生えてくる。
さっき彼女達から第2の質問として聞いた
「私事」についても例外ではなかった……")
	await novel_interface.show_text_only("NGOが交戦エリアで軍事物資を輸送する行為は
国際条約で認められていない。")
	await novel_interface.show_text_only("市民を助ける名目で中立的立場が許されている
にも拘わらず──
一方だけに肩入れして助力するなどと言う行為は
極めて重大な道徳的違反である。")
	await novel_interface.show_text_only("しかし近年、マサダ軍とNGOの間で密かに
物資が取引されているらしい。
市民救助施設にカモフラージュした軍用施設を
利用して密輸が行われるんだとか。")
	await novel_interface.show_text_only("この「市民救助施設」はレジスタンスの得意な
ゲリラ戦を牽制できる以外にも、
襲われれば政治的な批判材料にも利用できるため
モラル面を加味しなければ有効だと言えよう。")
	await novel_interface.show_text_only("しかし、同時にデメリットも存在する。

この物資が灰色に近い存在となっている時点で、
例え奪われたとしても、
マサダは詳細を大々的に発表できないのだ。")
	await novel_interface.show_text_only("少尉さんと怪力女……

名前で呼ぶと、エミリオ・スィートライドと
ヴィラ・ヴァルキューレ。
二人の狙いは、そんな弱点を突いた
グレーな物資の奪取である。
俺のネームプレートには様々な機能が搭載されて
いるけど、
エミリオはその中のSOSコードに目を付けて
いたようだ。")
	await novel_interface.show_text_only("元々その機能は緊急事態に陥った際、付近の
NGO所属の救援物資を検索する代物である。
エミリオはその検索機能を使って、ターゲットに
適合する車両へ目星を付けたのだった。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("あのトラックの運んでいる物は主に
医療系の物資よ。
国道を沿って進行中だから、ここに到着するのは
大体40分後ぐらいかしらね。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","happy")
	await novel_interface.show_dialog("私はバリケードと地雷の設置を、二人は機銃と
スピーカーを用意してくれ。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","shy")
	await novel_interface.show_dialog("……スピーカー？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……胸の装置さえもバレたかと思ったが
違うようだ。")
	await novel_interface.show_text_only("ヴィラが装甲車に積載していた品々を出して
次々とカバーを外していく。
車内を見回した時に大方の予想はしていたけど、
それでも俺は物量に驚いてしまう。")
	await novel_interface.show_text_only("四足歩行ロボット「ビッグドッグ」 1台
遠隔操作式バリケード 2台
自動照準機銃 6台
スピーカー 4台
それと何個かの遠隔操作できる小型爆弾……")
	await novel_interface.show_text_only("…………戦争かな？")
	await novel_interface.show_text_only("ビッグドッグを使って、機銃とスピーカーを
砂丘の上へと運ぶ。")
	await novel_interface.show_text_only("バリケードと爆弾を設置し終わったヴィラは
ガソリンを満タンにしたジープを運転し、
エミリオの指示通り国道沿いにあった
巨石の裏へと停車させた。")
	await novel_interface.show_text_only("その後、光学迷彩で装甲車を隠してから
偵察ドローンを起動……
……準備完了のようだ。")
	await novel_interface.show_text_only("俺達3人は背の高い砂丘の裏側に身を隠し、
目標が到達するのを待つ。")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("本当に誰も怪我しないんだろうなぁ……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("さっき設置した武装類の火力なら、
30人ぐらいの部隊は余裕で殲滅できる。
不安にならない方がおかしい。")
	novel_interface.show_character("valkyrja","wink")
	await novel_interface.show_dialog("安心しろ、これはエミが考えた作戦だぞ。", "ヴィラ")
	await novel_interface.show_dialog("彼女を信じればオールグリーンだと、
私達の隊なら誰もが知っている。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("あそこにある機銃はAIが赤外線の照準を
合わせて自動で射撃するから。
前もって人間を絶対狙わないように
設定してあるわ。", "エミリオ")
	await novel_interface.show_dialog("遠隔操作の爆弾も基本的に殺傷力を
取り除く改造が施されているの。
大きな音や煙だけを発生させる物ばかり──", "エミリオ")
	novel_interface.change_expression("shout")
	await novel_interface.show_dialog("あっ、トラックが来たみたい！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("偵察ドローンが医療救援組織の赤マークを付けた
トラックを発見する。
彼女の予定通り、国道を沿ってこちらへ
向かって来ていた。")
	await novel_interface.show_text_only("トラックが補給所の近くに差し掛かると
同時に1つ目の爆弾が破裂する。
そのタイミングで遠隔操作のバリケードが起動、
トラックを強烈に揺らした。")
	await novel_interface.show_text_only("徐々に減速していくトラック。

パンクでもしたのかとトラックの運転手は
慌てて車を降りてしまう。")
	novel_interface.show_character("emilio","angry")
	await novel_interface.show_dialog("……今よッ！！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……いよいよ花火ショーの開演か。

エミリオの合図が放たれた。")
	await novel_interface.show_text_only("2台目のバリケードが立ち上がると、
トラックの前輪部を挟む。
並行して砂丘からの機銃掃射も始まった。")
	await novel_interface.show_text_only("降り注ぐ弾丸は人体とトラックの動力システムを
巧妙に避けつつ、地面へと無数の弾痕を残す。")
	await novel_interface.show_text_only("慌てて運転手はトラックの中へと逃げ込むが、
何度エンジンを回そうともトラックは動かない。")
	await novel_interface.show_text_only("スピーカーからはアラブ語を喋る男性の
声が聞こえてくる。
恐らく生け捕りにして身代金を要求するとかの
セリフを事前に録音した物だろう。")
	await novel_interface.show_text_only("その間も爆発が止む気配はない。

瞬く間にトラックの周辺は煙で溢れ返る。")
	await novel_interface.show_text_only("発生した煙を利用して運転手と同乗していた
もう一人はトラックから脱出した。
狼狽えながらも道路の傍にあった巨石の裏へ
身を隠す。")
	await novel_interface.show_text_only("彼らの隠れた場所には、俺達が予めジープを
配置してあった。
それを見つけた2人は唯一の救いと急ぎ乗り込み
銃撃の勢いが衰え始める時を見計らう……
独特な緊張感が漂う中、2人は意を決して
車を発進させた──")
	await novel_interface.show_text_only("……必死な2人の姿が容易に想像できるぐらい
酷い運転だった。

2人が乗るジープは道路も道標も無視して、
ジグザグ運転で砂漠の奥へと走り去っていく……")
	await novel_interface.show_text_only("…………………………………………………………

言葉を失うほどの数分間の出来事。

俺は(　ﾟдﾟ)と見ている事しかできなかった。")
	await novel_interface.show_text_only("エミリオは立ち上がって砂を手で払いつつも、
「？」な俺へと説明してくれる。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("この辺りにレジスタンスがいないとしても、
レジスタンスから離脱した逃走兵が盗賊となって
襲ってくる事件も少なくないの。", "エミリオ")
	await novel_interface.show_dialog("国際公約に色々と違反してるマサダ国防軍は
大きく公表もできないし、
盗賊の仕業と偽装して目撃者まで用意すれば、
大体は沈黙するしかないわ。", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("とまぁ、こんな感じの計画でした～～", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("なぜ味方の物資を奪うのか理由は分からないけど
彼女らの一連の作戦が凄すぎて敬うしか他ない。")
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("────！　待て、あれを見ろッ！", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ヴィラは捨て置かれたトラックの
上部を指差した。")
	await novel_interface.show_text_only("上部にあった黒い穴から小型のドローンが
6機飛び出してくる。
2、3秒経つと6機が更に飛び出してきて、
その後も6機……")
	await novel_interface.show_text_only("すぐにエミリオは地に伏せて、軍用タブレットで
機銃の照準設定を変更する。
その間にもドローンはトラックから
延々と湧き出して……")
	novel_interface.show_character("emilio","shout")
	await novel_interface.show_dialog("あちゃ～『ハニーコム』か……

そんな物を用意していたなんて……", "エミリオ")
	novel_interface.change_expression("angry")
	await novel_interface.show_dialog("これは厄介ね……", "エミリオ")

	print("=== 星尘降临篇第13话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
