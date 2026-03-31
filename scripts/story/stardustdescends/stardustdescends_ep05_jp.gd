# stardustdescends_ep05.gd - 星尘降临篇第5话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep05_script()

func play_script():
	pass

func stardustdescends_ep05_script():
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("ここが「リーベルステラ」の金庫室か……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は目を丸くしながら辺りを見回した。

この空間は全てが発光する特殊な金属板を
使用して設計されている。")
	await novel_interface.show_text_only("金属板の材質は黄金のチップと似ているけど、
微かに灰緑色の光沢があるようだ。
独特な輝きが規格外の雰囲気を際立たせている。")
	await novel_interface.show_text_only("カジノ船に金庫があるとは聞いていたけど、
船底がこんな風になっているなんて……
ちなみに金庫は特定のVIP客しか使用できないが
その資格を何とか入手して俺はここに来ている。")
	await novel_interface.show_text_only("出入口はVIPゾーンに設置されている
エレベーター1つのみ。
金庫室に通じている扉は、もはや分厚すぎて
開けられるモノなのかと疑うレベルである。")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("（やっぱこの場所じゃ電波は届かないか……）", "レン")
	await novel_interface.show_text_only("イヤホンの通信はエレベーターに乗った瞬間から
途切れてしまった。
必ず事前の練習通りに行動するんだよと、
俺はアニーに言われた事を頭の中で呟く。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	novel_interface.show_character("ren_full","solemn")
	await novel_interface.show_dialog("（まずは監視システムの状態を確認して……）

（……良し、OKだ）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("金庫室内に複数台ある監視カメラのランプが、
明滅した後に消えた。
それはアニーからの合図だ。")
	await novel_interface.show_dialog("──お客様の金庫は1212番でございます。 

金庫を開くには、お客様が保有する鍵と
我々が保有する鍵の両方が必要となりまして……", "係員")
	await novel_interface.show_text_only("係員さんが鍵を渡そうと振り返った瞬間、
その顔に目掛けて俺は「香水」を構える。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("ご、ごめんなさいっ！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("プシュッと「香水」を顔に向けて吹き付けると、
係員さんの目が虚ろになった。
何か言おうと口を動かしているが、
どうやら声を出せないみたいだ。")
	await novel_interface.show_text_only("こいつは戦研部が開発した新製品の
麻酔スプレーらしい。
愛衣の手によって脳の抑制作用を低下させる
薬物が添加されている。")
	await novel_interface.show_text_only("吸い込んだ人間は催眠状態に入り込み、
あらゆる暗示を受け入れやすくなる。
……って説明されたんだけど。")
	novel_interface.show_character("ren_full","smile")
	await novel_interface.show_dialog("は～い、ここで立っててね～……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("意識が朦朧としている係員さんをエレベーターの
正面に移動させた。
それから彼の手に赤色のチップを渡す。")
	novel_interface.show_character("ren_full","solemn")
	await novel_interface.show_dialog("コホン──", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("何度も練習したセリフを思い出しながら、
硬い口調で係員さんに告げた。")
	novel_interface.show_character("ren_full","normal1")
	await novel_interface.show_dialog("貴方は先ほど俺を金庫まで案内した。
異常は一切なかった。", "レン")
	await novel_interface.show_dialog("俺は金庫に荷物を入れた後、貴方に1枚の
チップを渡した。", "レン")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("指を鳴らす音を聞くか、エレベーターの扉が
開いた時に目を覚ます。
その時、貴方は全ての事を「思い出す」。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("虚ろな目で係員さんはエレベーターを
見つめている。
彼のフラフラと揺れている背中を見て、
俺はゆっくりと後ろに下がった。")
	novel_interface.show_character("ren_full","stare")
	await novel_interface.show_dialog("（これで本当にいいのかよ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("人間の脳は簡単な暗示だけでも内容を勝手
補完するってマリルが言ってたけど……
これは流石に簡単過ぎだろ！？")
	novel_interface.show_character("ren_full","stare")
	await novel_interface.show_dialog("果たしてあの人は何を「思い出す」事に
なるのやら……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("小言を呟きつつ、俺は金庫室の中央に移動する。

素早くハイヒールを脱ぎ、きちんと揃えて
床へと置いた。")
	await novel_interface.show_text_only("イヤホンや他の金属類もハンドバッグに入れて、
ハイヒールの隣に置いておく。")
	await novel_interface.show_text_only("辺りを見ると分かるが、この金庫室は
通常の物と全く違う。
正体は巨大な超伝導静磁場遮断室だ。

あらゆる放射線と磁場を遮断できる部屋で、
金庫と呼ぶにも特別過ぎる代物である。")
	await novel_interface.show_text_only("施教授の情報によると華雲宮城の軍需工場が
製造した物らしい。
リバーナは製造技術を備えてないみたいだから、
順当だとは思うけど……")
	await novel_interface.show_text_only("考えながらも探している内に、目標としている
コンテナを俺は見つけた。
コンテナに付いている2つの鍵穴の間には、
雲紋みたいなレーザー加工の刻印が施してある。")
	novel_interface.show_character("ren_full","normal1")
	await novel_interface.show_dialog("こいつが0812番のコンテナだな……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺はセラミック製のマスターキーを2本同時に
鍵穴へ差し込み、奥にあったスイッチを押した。")
	await novel_interface.show_text_only("銀行なんかにある個人金庫のセキュリティーは
実は付け焼刃と言って良いほど甘い物だ。
以前にファビオラがそう教えてくれた。")
	await novel_interface.show_text_only("そもそも、この手の機関は個別の施錠レベルとか
管理体制より金庫自体の堅固さを重視している。")
	await novel_interface.show_text_only("重要なのは「キー」と言う担保だ。

顧客にしか開けないと言う錯覚を与え、大金を
払っても良いと思えるように信用度を上げる。")
	novel_interface.show_character("ren_full","stare")
	await novel_interface.show_dialog("（金庫と警備システムが「安全」を……）

（鍵は「安心」を与えているってね……）", "レン")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("（今のマリルみたいな台詞だったよな！）

（……ちょっと嫌かも）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("しばらくすると、鍵穴から「カチッ」という音が
聞こえた。
マスターキーの起動を示すと、コンテナが
ゆっくりと開いていく。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("コンテナ内に鎮座していたのは……

全長1.5メートルを超える黒色の隕石──

……………………")
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("EX級の異質物だってッ！？！？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("そうだ、それがあの古代隕石の評価だ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","stare")
	await novel_interface.show_dialog("「EX級」は宗教関連の異質物にのみ適用される
評価だって前に言ってなかったっけ？", "レン")
	await novel_interface.show_dialog("収容は許されたけど、研究は宗教的冒涜だから
信徒達が許さないって……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("一部の異質物は神話や伝承などで神殺しの力を
持っていると記載があったりする。")
	await novel_interface.show_text_only("目覚めると世界終焉を迎える可能性があるため、
如何なる形でも研究は全面禁止されている。")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("──そうだった。")
	await novel_interface.show_text_only("俺がこんなにハッキリと覚えているのは……")
	await novel_interface.show_text_only("前に俺の偽者が盗み出した「天命の矛」も
EX級の異質物だったからだ。")
	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("（俺の……顔か……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺はリビングの壁に掛けてある鏡を見つめた。")
	await novel_interface.show_text_only("最近は夢の中でさえ男の姿に戻れていない……")
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("──EX級だからと言って宗教関連に
限るわけではない。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルの言葉が思考に沈んだ俺の意識を、
現実へと引き戻した。")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("測定結果によると、あの隕石は4000年前に
地球へと落下してきた物らしい。
戦前にエジプトの考古学者が発見したそうだ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_TheMeteorite.png")
	await novel_interface.show_dialog("矩形的に規則正しく形が整っていた事から、
自然の産物でない事は一目瞭然。", "マリル")
	await novel_interface.show_dialog("最初は古代エジプトの石棺と言われていたが、
繋ぎ目もない事からその説は否定された。", "マリル")
	await novel_interface.show_dialog("数年後、各地の異質物による紛争が激化したため
隕石は華雲宮城の大博物館に運び込まれる。", "マリル")
	await novel_interface.show_dialog("施教授は隕石を研究する主要メンバーの
1人だったようだ。
当初、華雲宮城は良い拾い物をしたと
思っていたみたいだが……", "マリル")
	await novel_interface.show_dialog("直ぐに彼らは後悔する事となる。
そう──
隕石は自身に対する探測や侵入に対して、
「激しく」抵抗する事が判明してからな。", "マリル")
	await novel_interface.show_dialog("あの隕石は独特な磁場を備えているのだが、
そいつに呼吸的な周期の起伏がある。
最高値の磁力はルビジウム磁石にも匹敵。", "マリル")
	await novel_interface.show_dialog("また放射線を照射すると隕石の磁場は突如暴走、
数値が測定不能なレベルに増加してしまう。", "マリル")
	await novel_interface.show_dialog("お陰で隕石の解析を行った際に研究拠点は全壊。

結果を導き出すどころの騒ぎでは無くなった。", "マリル")
	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")
	novel_interface.show_character("anne_normal","happy")
	await novel_interface.show_dialog("……チョッキンパって半分に切っちゃったら
どうかな？", "アニー")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal1")
	await novel_interface.show_dialog("強度は高くないので切断自体は可能と言えよう。

しかし物理構造を破壊する行為に対して隕石は、
超エネルギーと放射線を発する事で答えてくる。", "マリル")
	await novel_interface.show_dialog("強引な切断によって発生するエネルギー量は、
計算上だけでも凄まじい数値だ。
極めて広大な範囲を全て消滅するのも容易い。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("だから「研究禁止」のEX級になったわけか……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("例えるなら予測不能の時限爆弾みたいなモノさ。
性質があまりにも不安定過ぎる。", "マリル")
	await novel_interface.show_dialog("この厄介認定された危険物を、華雲宮城は
どうしても手放したかったようだ。
あらゆる手段を尽くして何とか教皇庁を説得、
サモントン側も黙認して今に至る。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("教皇庁と言えば、ソヤが午後辺りにメールで
送ってきた写真の事を思い出した。")
	await novel_interface.show_text_only("前回の事件後、ソヤは調査のために教皇庁へ
戻っている。
そのついでに自身の「装備」もパワーアップ
するんだとか。")
	await novel_interface.show_text_only("俺は携帯を開いて、送られてきたメールを
再確認する。
写っているのは高価そうな設備群を連ねている
内赦院の工房だった。
見た目は戦研部の開発室と何ら変わりない。")
	await novel_interface.show_text_only("写真にはレーザートーチで作業している人が
修道服を着ている以外、
特に宗教的な雰囲気などは何一つなかった。")
	novel_interface.show_character("ren_battle","speechless")
	await novel_interface.show_dialog("（お金さえ払えば、何でも教皇庁は引き受ける
　のかな……）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("これより隕石は華雲宮城によって教皇庁へと
運ばれる。
飛行機での運搬は隕石の強磁性によって
ほぼ不可能と言っていい。
となると、次の手は船になるわけだが。", "マリル")
	novel_interface.change_expression("speak2")
	await novel_interface.show_dialog("それであればスエズ運河の渡航は必須。

あそこを通るとなってしまえば理屈上、
国際条約を片っ端から違反しまくる事になる。", "マリル")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_normal","normal1",0.25)
	await novel_interface.show_dialog("そこで彼らはリバーナに依頼を？", "アニー")
	novel_interface.character_light(0.35,"normal1")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("その通りだ。

しかも華雲宮城はミスター洪先生のカジノ船に
超伝導静磁場遮断室まで設置してな。", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"panic")
	await novel_interface.show_dialog("そんな情報を私達に教えるって事は、まさか……", "アニー")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("マリルは微笑みながら頷いた。")
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("「呼吸的な作用を備えている物質」であれば、
お前達も接触した経験があるんだぞ？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","wry_smile")
	await novel_interface.show_dialog("うん、うん――……うん？", "レン")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_TheLastJudgement.png")
	await novel_interface.show_text_only("そうやって2人が話す最中、メールを見ていると
最後にもう1枚写真があった事に俺は気付いた。
システィーナ礼拝堂の有名なフレスコ画
《最後の審判》だ。")
	await novel_interface.show_text_only("彼女が教会を出入りできるようになった証だと、
そう思えばホッと一息が出る。
俺は感慨深くなりながら、何となくフレスコ画を
ネットで検索してみた。")
	await novel_interface.show_dialog("（ミケランジェロって確か……）

（ハインリッヒと同じ年代の人だったよな？）", "レン")
	await novel_interface.show_dialog("あの時代に生まれた天才達は裸に対して全員、
何らかの特別なこだわりでもあるのか……", "レン")
	novel_interface.change_background("res://assets/images/bg/APT/livingRoom.png")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("──ハインリッヒの「トスハイム青金石柱」", "マリル")
	await novel_interface.show_dialog("あの石柱の表面温度は、極小の幅ではあるが
呼吸のように増減する。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_normal","stare")
	await novel_interface.show_dialog("だから……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルとアニーは携帯を弄っている俺の方を
同時に見た。")
	novel_interface.show_character("liliu_uniform2","normal1")
	await novel_interface.show_dialog("……コホンッ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","speechless")
	await novel_interface.show_dialog("？？？", "レン")
	novel_interface.change_expression("panic")
	await novel_interface.show_dialog("──え、えっ！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	await novel_interface.show_text_only("「天国の扉」事件以後、再発を防止するために
マリルはSIDの作戦方針を変更した。")
	await novel_interface.show_text_only("EX級異質物に関する情報は全て能動的に追跡。

項目の権限レベルに上限を設けない。")
	await novel_interface.show_text_only("「新豊洲に籠っているだけでは、世界滅亡級の
　災厄は阻止できない」
「そして我々にも連合議会の扉を開ける
　カギが必要だ」")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("（それはそうだけど……）

（今ここで見つかっちゃったら……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("特殊な戦闘服を着た連中に電気銃で撃たれた事を
思い出し、不意に悪寒を感じてしまう。")
	novel_interface.show_character("ren_full","uneasy")
	await novel_interface.show_dialog("（か、カギが鍵穴の中で折れませんように……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("気が進まないけど、俺はコンテナの扉を開けて、
中にある真っ黒な隕石を見つめる。")
	await novel_interface.show_text_only("この異質物金属で作られたコンテナは、
最大限に魔法の効果を抑える事が可能だ。
愛衣が言っていたので間違いない。")
	await novel_interface.show_text_only("そしてカジノ船の上空を飛翔する大型輸送機には
小規模な戦争すら起こせるぐらいの、
SIDの戦闘部隊が待機している。

安心安全、突発的な状況にも対応できるように
この作戦は組まれているんだ！")
	novel_interface.show_character("ren_full","upset")
	await novel_interface.show_dialog("だから……「ちょっとだけ」触れるぐらい……
大した事はないよな……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("緊張か恐怖か分からないけど、体内の血が
沸き立つのを感じる。")
	await novel_interface.show_text_only("見てられずに目を閉じてしまいながら、
隕石の表面に向かってゆっくりと手を伸ばす……")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("……なんか……ふわふわ？")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	await novel_interface.show_text_only("目を開けると、隕石の表面にぴったりと手の平は
触れている。
今の質感は固くて温かいんだけど……")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("（さっきのは幻覚？）

（柔らかい感触がしたはず……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("隕石に再度触れてみるが、質感が硬い事は
間違いない。")
	await novel_interface.show_text_only("本来の作戦は、隕石に触れたらすぐに離脱する。
……だったけども。")
	await novel_interface.show_text_only("とりあえずコンテナに鍵を掛け直してから、
さっきの感触について考える。")
	novel_interface.show_character("ren_full","upset")
	await novel_interface.show_dialog("（あの手触り……一体どういう事なんだ？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("――コツン

……などと困惑していると、背後から突然、
何か落としたような音が伝わってきた。")
	await novel_interface.show_text_only("金属の床に落ちて、跳ねながら転がっていく音。

外部からの音が遮断された金庫内では、
非常に聞き取りやすいものだった。")
	novel_interface.show_character("ren_full","normal1")
	await novel_interface.show_dialog("……なんだ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("振り返ると地面には黄色の物体が存在していた。")
	await novel_interface.show_text_only("直径はおおよそ1センチほど。

球状になっていて、角の丸い8個の突起物が
付いている。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("……これって俺のドレスから落ちたのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("幼い頃に食べた金平糖に似ているけど……

俺は何だろうと拾い上げ、舐めて本当に金平糖か
確かめようとしてみた。")
	await novel_interface.show_dialog("────ねぇ。", "？？？")
	await novel_interface.show_text_only("声が聞こえた瞬間、俺は飛び上がりそうになる。

誰もいない金庫の中で……
背後から幼い子供の声が聞こえてきたのだ。")
	novel_interface.show_character("stardust_small","smile")
	await novel_interface.show_dialog("ねぇ、何を探しているの～～？", "シンチェン")

	print("=== 星尘降临篇第5话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
