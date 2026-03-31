# stardustdescends_ep14.gd - 星尘降临篇第14话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep14_script()

func play_script():
	pass

func stardustdescends_ep14_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_ClusterBombs.png")
	await novel_interface.show_text_only("──『ハニーコム』

手の平サイズの爆撃用ドローン型兵器である。")
	await novel_interface.show_text_only("この兵器には簡単な制御装置と自爆用の爆弾が
搭載されており、
特攻と言う形で広範囲に無差別的な爆撃を行う。")
	await novel_interface.show_text_only("AIで人と装備を区別して無数に自爆する様は
地獄のような光景であり、
範囲的な打撃を与える効率はクラスター爆弾より
優れていると言われている。")
	await novel_interface.show_text_only("かつてマサダがベッカー高原に『ハニーコム』を
大量投入した結果……
無関係な市民の死傷者が数千人も発生し、
国際社会から痛烈な批判を受けた。")
	await novel_interface.show_text_only("しかし未だにマサダは、その類の兵器を撤廃する
国際公約を締結していない……")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("ズカアアアァァァ――――ンッッ！！！！")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPost.png")
	await novel_interface.show_text_only("南側の丘に設置されていた機銃が、轟音と共に
爆発した。
機銃を覆った布が爆風によって粉々に四散する。")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("何であんな物が……

車に乗せているのは医療物資だけじゃ
なかったのかよ……！？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","angry")
	await novel_interface.show_dialog("救援組織の知らぬ間に国防軍が入れたのかしら？", "エミリオ")
	await novel_interface.show_dialog("まだジープが補給所に1台あるわ。

ヴィラは彼女を連れて行って。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("了解だ！", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("ん……？　どういう事……ってほぉあッ！！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("何の説明も無くヴィラは俺の腰に手を回すと、
脇に抱えて高速で走り出した。
さながら荷物でも持つかのように。")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("おおあああぁぁぁぁ――ッ！？！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("砂丘を下っていくヴィラの速さに思わず
叫んでしまう。
坂道で出して良い速度じゃないし、
今の状況で手を離されてしまったら俺は、
チーズを追いかけて転がっていく祭りの
参加者みたいな状態になるだろう。")
	await novel_interface.show_text_only("そのままジェットコースターみたいなスピードで
補給所にたどり着くと、
ポイっと土囊の上へと投げ捨てられる。")
	novel_interface.show_character("valkyrja","speak")
	await novel_interface.show_dialog("あんたは隠れてろ！　私はエミの援護に回る！", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("吐き捨てるように一言だけ放つと、
ヴィラは俺を置いてジープへと乗り込んだ。")
	await novel_interface.show_text_only("ハニーコムは味方識別信号の無い車両、
敵性の武器や設備を破壊するように、
プログラミングが施されている。")
	await novel_interface.show_text_only("高速で移動する車両は優先的な攻撃目標として
選ばれやすいから、囮になるつもりか……？")
	await novel_interface.show_text_only("……………………")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPostF.png")
	await novel_interface.show_text_only("震えながら遮蔽物の裏に隠れて待機する。

遠くから機銃の掃射音と、爆発音が次々と
伝わってきた。")
	await novel_interface.show_text_only("爆発する度、金属と砂地の擦れる音が聞こえる。")
	await novel_interface.show_text_only("きっとドローンが自爆した時、ばら撒かれる
金属片の音だろう。
殺傷力は生身の人間を仕留めるに十分だ。")
	await novel_interface.show_text_only("機銃の発射音が次第に少なくなっていくと、
心が不安と焦燥感で一杯になる……")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("俺は木板を遮蔽物の上に置いて空間を作り、
両手で頭を抱えてしゃがみ込んだ。")
	await novel_interface.show_text_only("……第二次世界大戦の体験談で聞いたっけ。

戦闘中に味方機銃の音が途切れると、
自軍の士気に壊滅的な影響を与えるんだとか。")
	await novel_interface.show_text_only("……その気持ち今なら分かるぞ。")
	await novel_interface.show_text_only("最後だと思われる機銃の発射音が消え去って、
様々な音が聞き取りやすくなった。")
	await novel_interface.show_text_only("少し静かになった戦場に目立って響くのは
蜂の群れのようなドローンの飛行音。")
	await novel_interface.show_text_only("空中の四方八方を包んで飛び交っているので、
いつ居場所がバレてもおかしくはない。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("（あの2人は大丈夫だろうか……）", "レン")
	await novel_interface.show_dialog("（ジープのエンジン音も聞こえるから
　無事だとは思うけど……）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPostF.png")
	await novel_interface.show_text_only("遮蔽物から頭を半分だけ出して状況を確認すると
周囲は文字通りの戦場と化していた。
遠くにあった弾薬貯蔵用の小屋は火に包まれ
原型を留めていない。")
	await novel_interface.show_text_only("東側の砂丘を見るとヴィラの運転するジープが
疾走していた。
砂煙を大量に巻き上げて補給所へと向かって
来ている。")
	await novel_interface.show_text_only("その後ろには10機以上のドローンが……

追ってくるのを必死に逃げている様子だ。

速度は互いに同等なのか距離の差が、
開く気配はない。")
	await novel_interface.show_text_only("ジープの上部にはエミリオの姿があった。
天井のハッチから顔を出してドローンの群れに
M16を発砲している。")
	await novel_interface.show_text_only("弾薬が尽きるまで断続的に射撃を行うと、
彼女は弾切れの銃をドローンへと投げ捨てた。")
	await novel_interface.show_text_only("ドローンの群れの1機が投げた銃に反応して
自爆する。
他のドローンは爆発に巻き込まれないよう
瞬時に高度を上げる。")
	novel_interface.show_character("emilio","angry")
	await novel_interface.show_dialog("クソッ！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ジープは補給所を囲む壁まで到達すると
減速を始めた。
ドローンの視界を避けるようにジープから降りて
素早く壁に身を潜めるエミリオ。")
	await novel_interface.show_text_only("エミリオを見送るとジープは別の砂丘へ向けて
再び砂煙を上げながら加速する。")
	await novel_interface.show_text_only("ドローンの群れがジープに釣られて移動した後、
エミリオは壁を越えて補給所まで戻ってきた。")
	novel_interface.show_character("emilio","angry")
	await novel_interface.show_dialog("レンちゃん！？　無事！？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("こ、ここにいます……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は声を抑えながら返事をする。

すぐさま木板で確保した空間に彼女が
駆け付けてきた。")
	novel_interface.show_character("ren_medical","sob")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","perspire",0.25)
	await novel_interface.show_dialog("良くこんな場所を見つけたわね……

声は抑えなくても大丈夫よ、あいつら音とか
聞こえないから。", "エミリオ")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("あっ！　怪我してるのか！？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("エミリオの腕に何か所か擦り傷があった。

軍服の一部が鮮血に染まっているけど、
彼女は気にしていない様子である。")
	novel_interface.show_character("ren_medical","panic")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","smile",0.25)
	await novel_interface.show_dialog("これぐらい何ともないわよ。

それより早く装甲車に戻りましょう。

アレならドローンの爆発ぐらい余裕で
防げるから。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("光学迷彩で隠しておいた装甲車は国道の側に
止めてある。
距離は補給所から凡そ300メートル。")
	novel_interface.show_character("ren_medical","panic")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("emilio","smile",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("味方の識別装置とか付けてないのかよ！？

あのドローン達は味方を攻撃しないだろう！？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("あ、よく考えたら、この2人は自軍の物資を
奪おうとしているから「敵」なのか。
何だか頭が混乱してきた……")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("当然、市内に置いてきたわよ。

識別装置は位置情報も記録するから、
こんな「仕事」には持っていけないでしょ？", "エミリオ")
	novel_interface.change_expression("angry")
	await novel_interface.show_dialog("それよりも早く動きましょう！
どれだけヴィラが時間を稼げるか分からないし！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("エミリオは俺の肩を軽く叩いて遮蔽物から
離れていく。
この鉄火場の中を300メートル進むのは
相当勇気がいるぞ……
でも確かに、あんなドローン相手にカーチェイス
なんて長くは持たないだろうし……")
	await novel_interface.show_text_only("意を決して俺は彼女に付いて行こうとする。

だが──")
	novel_interface.show_character("emilio","perspire")
	await novel_interface.show_dialog("………………レンちゃん、早く逃げて。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("いつの間にか彼女は立ち止まっていた。

視線を上に向けると、3機のドローンが補給所の
真上を旋回しながら辺りをスキャンしている。")
	await novel_interface.show_text_only("1機のドローンが俺達のいる場所にカメラを
合わせた。
空中での旋回を急に止めて、赤いランプを
点滅させ始める。")
	novel_interface.show_character("emilio","angry")
	await novel_interface.show_dialog("────逃げなさいッッ！！！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("エミリオは拳銃を取り出し、空に向かって
全12発を連射した。")
	await novel_interface.show_text_only("1機目のドローンは補給所の外にヒラヒラと
墜落する。")
	await novel_interface.show_text_only("もう1機は空中で爆発。

金属片が雨のように降り注ぎ、設置していた
頭上の木板に突き刺さる。")
	await novel_interface.show_text_only("そして最後の1機は……仕留め切れなかった。

爆発の煙に紛れながら赤く発光して、
俺達へと突っ込んでくる──")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("（お、終わった……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("ズカアアアァァァ――――ンッッ！！！！")
	await novel_interface.show_text_only("……耳をつんざく炸裂音。

遮蔽物の狭い空間に高温の気流が吹き荒れ、
頭上の木板はどこかに飛んでった。")
	await novel_interface.show_text_only("鼻を突く焦げ臭い匂い。

血液と錆の匂い。

それらが混ざり合って空気中に充満する。")
	await novel_interface.show_text_only("辺りに散乱するのは大量の金属片。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPostF.png")
	await novel_interface.show_text_only("爆発の衝撃に耐えられず、バランスを崩して
俺は尻餅を突いてしまった。
……腕からは激痛が伝わってくる。")
	await novel_interface.show_text_only("いや、そんな事より重要なのは……")
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("（……い、生きてる？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("自分の身体を確認した。

腕に切り傷が1つだけで、ほぼ無傷だ。")
	await novel_interface.show_text_only("エミリオが庇ってくれたのか？

そう思って、すぐさまエミリオも無事か
確認すると……")
	await novel_interface.show_text_only("……彼女の手には赤い鮮血のような色をした盾が
展開されていた。
盾は暗褐色の煙を発生させながら徐々に空気中へ
霧散していく。")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("そ、それは……？", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","stare",0.25)
	await novel_interface.show_dialog("あなたには見せたくなかった……", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("盾が完全に消えると、彼女は腕をゆっくりと
振った。
さっきまで軍服の袖を染めていた血は、
痕跡さえも無くなっている。")
	novel_interface.show_character("ren_medical","worry")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","stare",0.25)
	await novel_interface.show_dialog("……とある異質物に接触する機会が偶然あって。

それから私とヴィラは奇妙な能力を使えるように
なってしまったの。", "エミリオ")
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("私は血液を鋼鉄より硬く固形化する事ができる。

すぐに蒸発するから、実用的じゃないけどね……", "エミリオ")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("実用的かはともかく、血を使う能力とか
格好良すぎじゃないか？", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"speechless")
	await novel_interface.show_dialog("……えっ？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("反応が意外すぎた様子で、彼女は俺の方を
即座に振り向いた。
彼女の憂いだ表情が一瞬だけ垣間見える。

しかし肘の傷を必死に舐めようと頑張る俺の姿を
見て、表情は笑いに変わってしまった。")
	await novel_interface.show_text_only("痛いんだから仕方ないだろ！

金属の破片が掠った程度でもさ……")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("マサダに住む人間の9割以上が何らかの宗教を
信じているわ。
どんな宗教であれ私のような血液を操る能力は
冒涜的な呪いの類でしょう？", "エミリオ")
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("ヴィラの方は私よりマシだったわ。
彼女は元々も力持ちだったけど……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("当のヴィラは右の方でドローンとのチェイスを
続けていた。")
	await novel_interface.show_text_only("ジープが砂丘で止まってしまう。

まだ10機以上のドローンが追尾しており、
もはやヴィラが距離を離す猶予もない。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("エ、エンジンが止まったのか！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("運転席から降りたヴィラはジープの正面に
移動すると、深呼吸をして──")
	await novel_interface.show_text_only("「ド――ン！」と言う巨大な音が鳴るぐらいの
勢いでジープを蹴っ飛ばした。")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("…………ぇぇッ！！？？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("キックによって容易く吹き飛んだジープが、
高度を上げようとするドローンの群れに直撃し、
ドミノ倒しのような爆発の連鎖を引き起こす。")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("……す、すごい…やったのかッ！？", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","stare",0.25)
	await novel_interface.show_dialog("いえ、安心するのはまだ早いわ。
耳を傾けて。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("……蜂に似た飛行音……そうか。

奴らの音がまだ周囲に聞こえるって事は……")
	await novel_interface.show_text_only("振り返ると絶望的な光景が広がっていた。")
	await novel_interface.show_text_only("補給所の外には30以上の黒い点が見える。")
	await novel_interface.show_text_only("赤い光を点滅させながら煙の中で旋回する様子が
薄っすらと見えた。
まるで全ての生存の意志を摘み取るかのように、
漆黒の幽霊が空を這い回っている。")
	await novel_interface.show_text_only("これこそが『ハニーコム』の恐ろしさだ。

全てのターゲットを完全に破壊するまで
死神の如き殺意で戦場を支配する……")
	await novel_interface.show_text_only("エミリオは俺を守るように後ろへと引っ張った。")
	novel_interface.show_character("ren_medical","wail")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("emilio","stare",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("どうしよう……", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"smile")
	await novel_interface.show_dialog("……色々と見誤ったわ。
ごめんね、あなたを巻き込んじゃって。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("し、死亡フラグみたいなセリフはやめて！")
	novel_interface.show_character("ren_medical","wail")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","upset",0.25)
	await novel_interface.show_dialog("もう残弾が1発もないの……
私が注意を惹くからあなたは装甲車まで逃げて。
そうすればきっと……", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("「きっと」の先が言い切れない理由は分かる。
俺の走る程度じゃ絶対に追い付かれるから。

今度こそ本当に終わった……")
	await novel_interface.show_text_only("急降下してくるドローン達に恐怖を感じて、
俺は思わずエミリオの手を握った。
覚悟を決めて、目を瞑る──")
	await novel_interface.show_text_only("────……………………

……俺の傷口から滲み出した血が彼女の手へと
流れ込んだ。
突然の事だったが……俺とエミリオは「何か」に
気付いた。")
	await novel_interface.show_text_only("彼女は右手を震わせると、急速に鮮血が
手の平へ集まっていく。")
	await novel_interface.stop_music()
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("これは……！？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPostL.png")
	await novel_interface.show_text_only("お互いの心臓が極限まで負荷を背負って
鼓動を打つ。
まるで静脈と動脈の循環が加速するかのように。")
	await novel_interface.show_text_only("把握できるほど心拍数は異常に増加して、
時間も無限に伸びている感じがした。")
	await novel_interface.show_text_only("周囲の音がスロー再生みたいに聞こえて、
ドローンもヒラヒラと舞う蝶に見える。")
	await novel_interface.show_text_only("理解し難い感覚の中、エミリオの手の平にある
「鮮血」が変貌を始めた。
血が無数の糸となり、ワイヤーフレームを描いて
物体を形作っていく。")
	await novel_interface.show_text_only("刻々と生成される物体を見つめながら、
彼女は驚嘆の表情を浮かべるしかできない。
……俺の身長とほぼ同じ大きさの巨大な剣が
生み出されたのだ。")
	await novel_interface.show_text_only("剣は眩いスカーレット色の光を放ち、
彼女の手の中に納まった。
素早く振り被ると、彼女は空中に向かって
ソレを全力で振るう──")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("──瞬く間に俺の視界が暗闇と化した。

周囲が一瞬で真空の宇宙になる。")
	await novel_interface.show_text_only("鋭い耳鳴りが万物を静寂に帰して、
世界に音はないと言い聞かせるかのように……")
	await novel_interface.show_text_only("────────────────────")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_StagingPostC.png")
	await novel_interface.show_text_only("――ッッッ！！！！！！！！")
	await novel_interface.show_text_only("意識が現実に戻ると気流が唸り声を上げていた。")
	await novel_interface.show_text_only("ドローンの軍勢は台風でも受けたかのように
空中を転がり回っている。")
	await novel_interface.show_text_only("衝撃によって次々と爆発していくドローン。

爆炎と金属片が次々と飛び散るが、
それすらも強風は飲み込んで離さない。")
	await novel_interface.show_text_only("エミリオの大剣が暗褐色の煙と化して消える時、
最初から存在など無かったかのように、
ドローンの大群は遠くの彼方へと
飛ばされていった……")
	await novel_interface.show_text_only("……呆気に取られる俺達2人。")
	await novel_interface.show_text_only("補給所は長年溜め込んだ土や砂礫や小石が
大掃除したみたいに一掃されている。")
	await novel_interface.show_text_only("空を包んでいた薄暗い砂塵も完全に消えて、
澄み切った景色が遠くの山まで続く。")
	novel_interface.show_character("emilio","perspire")
	await novel_interface.show_dialog("あなたは一体何者なの……？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("君は、魔女なのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("「魔女」という単語が初耳だったのか、
エミリオは困惑の表情で俺を見つめた。")
	await novel_interface.show_text_only("互いに状況が掴めず整理していたところ、
彼女の肩に装備してあるトランシーバーから
ヴィラの切羽詰まった声が聞こえてくる。")
	await novel_interface.show_dialog("東側からヘルファイアミサイルが2発、
向かって来ている！！", "ヴィラ")
	await novel_interface.show_dialog("恐らく『ハニーコム』が現場外の偵察ドローンに
空爆要請を出したのだろう！", "ヴィラ")
	await novel_interface.show_dialog("皆殺しじゃないと気が済まないのか連中は！
クソクソクソッ！！", "ヴィラ")
	await novel_interface.show_text_only("俺達は素早く視線を空へと向けた。

──東側に爆発の炎が2つ見える。")
	await novel_interface.show_dialog("は……え、消えた……？", "ヴィラ")
	await novel_interface.show_dialog("エミの仕業か？？", "ヴィラ")
	novel_interface.show_character("emilio","perspire")
	await novel_interface.show_dialog("今回のは私じゃないわ……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は無実と言わんばかりの表情をするが、
エミリオは気にせずハッキリと言う。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("ん～～だけど……
誰の仕業か分かった気がする。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("………………")
	await novel_interface.show_text_only("──SID高速大型輸送機の機内")
	novel_interface.change_music("res://assets/audio/music/Normal Stage.mp3")
	novel_interface.show_background("res://assets/images/bg/Baizhu/BG_Dispatched_Ship_Aisle.png")
	await novel_interface.show_dialog("……迎撃は成功したか？", "マリル")
	novel_interface.show_character("nyx_normal","smile")
	await novel_interface.show_dialog("ええ。マサダの防御システムには少々、
手こずりましたけど……", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ニュクスは椅子の背もたれに身体を預ける。

ずっと手に持っていた紅茶を静かに置いた。")
	novel_interface.show_character("nyx_normal","normal1")
	await novel_interface.show_dialog("2人の兵士さんはNGOトラックの追跡装置を
解除したみたいです。
……干渉はしませんの？", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("しばらく様子を見ようじゃないか。
彼女達ならレンに危害を加えないだろう。", "マリル")
	novel_interface.show_character("nyx_normal","smile")
	await novel_interface.show_dialog("あの2人にどのような調査結果が出たの
かしら？
予想外の収穫には相当な価値がある様子ね。", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("そうだな……あの馬鹿は変わり者を引き寄せる
体質なのかもしれん。", "マリル")
	novel_interface.show_character("nyx_normal","mock")
	await novel_interface.show_dialog("あなたのような？", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("お互い様だ。", "マリル")
	await novel_interface.show_dialog("ヨーロッパの方はどうだった？", "マリル")
	novel_interface.show_character("nyx_normal","normal2")
	await novel_interface.show_dialog("当時、NASAの衛星のほとんどを受け取ったのは
ニューモリダスですが……", "ニュクス")
	await novel_interface.show_dialog("一部未登録の衛星が理事会の手へと渡る前に、
データベースから削除されたみたいです。", "ニュクス")
	await novel_interface.show_dialog("連邦政府解体前の意図か、何者かの独断か、
ハッカー集団の仕業か……
……答えは未だ不明のまま。", "ニュクス")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("しかし2年前、ヨーロッパとアジアの闇市に
衛星の制御コードが出品されたと──
先ほど確かな情報を捕まえましたわ。", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("地下社会の情報ネットワークも意外と
役に立つものだな。", "マリル")
	novel_interface.show_character("nyx_normal","normal1")
	await novel_interface.show_dialog("ソ連が解体された際にも国防会議から
衛星の横流しがありましたからね。
連邦政府の調査が入り込んだ時には、
証拠なんて全て隠滅されていましたが。", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("未登録の物は大体が低軌道偵察衛星か、
軍隊用の短波通信衛星だろう。", "マリル")
	await novel_interface.show_dialog("軌道上で手入れもなく放置された状態なら
既に墜落済みの可能性が高い。", "マリル")
	novel_interface.show_character("nyx_normal","smile")
	await novel_interface.show_dialog("まだ作動中の高軌道衛星なら？", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("地面と2万キロメートルも離れた空間から、
軌道データの一切無い衛星を探すつもりか？", "マリル")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("そいつは干し草の中から針を探すのと同じだ。", "マリル")
	await novel_interface.stop_music()
	await novel_interface.show_text_only("………")
	await novel_interface.show_text_only("――マサダ近郊の国道")
	novel_interface.change_music("res://assets/audio/music/Story_01.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadSways.png")
	await novel_interface.show_text_only("俺とエミリオはトラックのボンネットに座って、
砂漠の夕焼けを堪能していた。")
	await novel_interface.show_text_only("ヴィラは探測器を使ってトラックに隠されて
いるであろう武器と追跡装置を調べている。")
	novel_interface.show_character("emilio","normal")
	await novel_interface.show_dialog("つまり、私やヴィラみたいな人が「魔女」と言う
存在なのね？
あなたは私達みたいな人を沢山知っていると。", "エミリオ")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","smile",0.25)
	await novel_interface.show_dialog("そうだよ。しかも彼女達には──", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("エミリオは軽く手を振りながら、慌てて俺の口を
塞ごうとする。")
	novel_interface.show_character("emilio","speechless")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ren_medical","smile",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("あなたはSIDの人だし、私の知るべき範囲だけ
教えてくれれば良いから。", "エミリオ")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("それにしても、あなたの話通りなら……

最近起きている破壊活動もレジスタンスの
関与していない可能性が有るって事？", "エミリオ")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("有り得ると思う。

魔導書から能力を付与された時、脳には莫大な
負担が掛かるんだ。
それは誰もが耐えられるって訳じゃない。", "レン")
	novel_interface.change_2nd_expression("worry")
	await novel_interface.show_dialog("理性を失うと暴走状態になって、
辺り構わず破壊し尽くすだけの存在に……", "レン")
	novel_interface.character_light(0.35,"upset")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("魔導書って異質物の類で、色んな場所に
出現するのよね？", "エミリオ")
	novel_interface.change_expression("speechless")
	await novel_interface.show_dialog("軍事委員会の任務に行き当たりばったりな
パトロールばかりが増える訳よ……
戦略的価値のない地区にも派遣されたりしたし。", "エミリオ")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("あなたの能力は、他の人の能力を増幅する事？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("俺は軽く頷いた。　一応、嘘ではないから。")
	novel_interface.show_character("emilio","normal")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("ren_medical","gratified",0.25)
	await novel_interface.show_dialog("だけど、ここまで激しい反応は俺も初めてだよ。", "レン")
	novel_interface.change_2nd_expression("bored")
	await novel_interface.show_dialog("内臓全部が抉られるかのように震えて、
身体がバラバラに砕けそうな感じだった。", "レン")
	novel_interface.character_light(0.35,"speechless")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("そう言われてもねぇ、今は特に何も起きないし。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("左手で俺の腕を引っ張りながら、右手を空中に
振り回す。
だけど本当に何も起こらないため、
彼女はおどけた表情を見せた。")
	novel_interface.show_character("emilio","speechless")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ren_medical","bored",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("過ぎた事は後で考えるとして……

ねぇ、私はあなたについても知りたいなぁ？", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("何か他の特別な事とかない？
あっ、機密事項以外で大丈夫だから！", "エミリオ")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"wry_smile")
	await novel_interface.show_dialog("べ、別に、他には何もないさ……", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("す、数か月前まで男性だった事は絶対秘密！！")
	novel_interface.show_character("emilio","mock")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ren_medical","wry_smile",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ほほぉ～～？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("彼女は興味津々に見つめながら近寄って来る。

か、彼女には心を読まれてしまうから、
このままだと……")
	novel_interface.show_character("emilio","normal")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ren_medical","bored",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("………………………………………………………

……もはや隙が多すぎて、逆に判断しづらいわ。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("そこまで言われるの！？")
	novel_interface.show_character("ren_medical","shy")
	await novel_interface.show_dialog("じ、ジロジロ見ないでくれよ……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("ん―……自信のない性格だけど独立的な思考を
持っている。
社会的な扶養システムで育ったんでしょ？", "エミリオ")
	await novel_interface.show_dialog("新豊洲の福利厚生は流石ね。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そこに関しては同意だ。特にマサダと比べると。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("小さい頃は男の子と一緒に遊んでいたの？

異性なんて意識は無かった感じかしら？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("いや同性だから！")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("仕草も喋り方も男の子のが伝染っちゃった
としか思えないわ。
こんなに無防備で可愛いのに……
告白された経験はないの？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女の視線を感じると、足を開いたまま
座ってしまっている事に気付いた。
俺は真っ赤になりながらも足を閉じる。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("あなたの傍にいた男の子達の目は節穴ね～～", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("それとも……既に心に決めている彼氏がいたり？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そんなモノは永遠にない！！")
	novel_interface.show_character("emilio","mock")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","shy_right",0.25)
	await novel_interface.show_dialog("うう……当てずっぽうな事を言うのは、
もう止めてくれよ……", "レン")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("それが違うなら、もしかして好きなのは……

……男性じゃないとか？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("意味深な表情をするエミリオに肘で
小突かれる俺。
──冷や汗が身体から溢れる。")
	novel_interface.show_character("emilio","smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("ren_medical","wail",0.25)
	await novel_interface.show_dialog("（ど、どう答えれば良いんだよッ！！）", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("俺は怒ったフリをしながら顔を砂漠へと向けて、
彼女の目線から逃がれる。")
	novel_interface.show_character("emilio","smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ren_medical","wail",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("あははっ、これくらいにしましょうか。

あなたと似たような部分があるから、
本当は私が茶化せる立場じゃないし。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("俺の態度にエミリオは笑うと、緩やかに移動する
オレンジ色の雲へ視線を向けた。")
	await novel_interface.show_text_only("え、待ってくれよ、似ているってどこが……？")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("私のお祖父さん、この国の偉い人だったのよ。

まぁ、昔の話だけど。", "エミリオ")
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("「聖城」の滅びた元凶はお祖父さんの政党が
周辺国家に対して、
宥和政策ばかり取っていたからだって……

既に彼は政治の舞台から追い出されているわ。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("えっ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("エミリオの話は、俺の予想を遥かに超えていた。")
	novel_interface.show_character("emilio","worry")
	await novel_interface.show_dialog("お父さんは長男に当たるんだけど、小さい頃から
お祖父さんと仲が悪かった。", "エミリオ")
	await novel_interface.show_dialog("果てにお父さんが異族の女性と結婚した時、
お祖父さんは怒り心頭だったらしくて。
そのまま勘当されちゃったみたい。", "エミリオ")
	await novel_interface.show_dialog("私は6歳になるまでお母さんとお祖母ちゃんの
集落で暮らしていたわ。
アルビールの周辺だったかしら。", "エミリオ")
	await novel_interface.show_dialog("丁度そのぐらいに「保護区」へ転居する政策が
行われたのよね。
レジスタンスを撃破する為だったらしいけど、
従わない者は全員レジスタンスだとか言われて。", "エミリオ")
	novel_interface.change_expression("upset")
	await novel_interface.show_dialog("引っ越しするにしても保護区までは遠いし……

国防軍から支給される補給物資も乗り物も
全然足りなかったし、
挙句には遭遇した強盗に食料の大半が
奪われちゃったから……", "エミリオ")
	await novel_interface.show_dialog("沢山の人が命を落としたわ。私の両親も含めて。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("そう…なのか……

（似ているって意味はそう言う事か……）", "レン")
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("じゃ、じゃあ君はその後──", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("エミリオは笑顔のまま頭を振って言葉を続ける。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("やっと保護区にたどり着いたのも束の間、
そこの老人達がマサダの役人へ連絡したの。", "エミリオ")
	await novel_interface.show_dialog("お祖父さんの元へ連行されたあの時の光景は
今でも鮮明に覚えてるわ。
彼の期待から失望に変化する表情を……", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("……失望？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("お祖父さんは自分の子孫が政界へ入る事を
強く望んでいるの。
何より家名が大切なのかしらね？", "エミリオ")
	await novel_interface.show_dialog("少なくともコネで私の出生証明書を改竄して、
母を別人に仕立て上げてしまうほど、
それぐらいに固執しているわ。", "エミリオ")
	await novel_interface.show_dialog("元々お父さんとお祖父さんの喧嘩は、
「意志」を背負うかどうかの話。", "エミリオ")
	await novel_interface.show_dialog("とは言え、私が軍学校に入学できたのは
お祖父さんのお陰だけど。", "エミリオ")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","panic",0.25)
	await novel_interface.show_dialog("その時ってまだ6歳だろ？

何に対して失望するんだよ？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("──彼女は自分の目を指さした。

金色の瞳と青色の瞳を。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("このレッテルは余りにも目立ち過ぎる。
私が政治に参加する事は決して許されない。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","sprite")
	await novel_interface.show_dialog("何の関係あるの？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("寧ろオッドアイとか最高の要素じゃない？
新豊洲の電気街を代表して君に1票入れよう。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("小さい頃の私も理解できなかったけど、
分かってしまえば結構シンプルな事よ。", "エミリオ")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("権力を世襲させる意図がない事を証明するため、
子供に変な名前を付ける権力者がいたりするの。", "エミリオ")
	await novel_interface.show_dialog("果物の名称や動物の鳴き声をベースに
名付けられた子供はどうなると思う？", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("ゲコゲコ君という人が議長として当選したら、
ニュースとか新聞は……", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("ぷっ――
た、確かに酷い字面になっちゃうっ。", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("シャイネルマン首相は自分が退任した際に
選挙を再開すると約束したわ。", "エミリオ")
	await novel_interface.show_dialog("選挙って「レッテル貼り」の極致だと思う。

どんなに功績や貢献を上げても目立つレッテルの
たった1つで全てが覆される。", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("私は愚かな有権者様に媚びへつらうつもりは
ないけどね……", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","happy")
	await novel_interface.show_dialog("……選挙だの有権者だのって、何の話をこいつに
してるんだ？", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("電子機器から抜き取ったと思われる電気コードを
両手一杯に持ったヴィラが、
トラックの後ろから姿を現した。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("掃除は終わった？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","wink")
	await novel_interface.show_dialog("ああ、物資箱の追跡装置は全て取り外した。
今ここにあるのは「クリーン」な物資だけだ。", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ヴィラは話しながら追跡装置を1機のドローンに
ぶら下げる。
ドローンに書かれていた番号は事前に
削ったようだ。")
	await novel_interface.show_text_only("俺達の見送る中、設定された通りにドローンは
夕陽へと飛んでいく。")
	await novel_interface.show_text_only("……エミリオは両手に付いたホコリを叩きながら
ボンネットから飛び降りた。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("──よし、私達も帰りましょうか。", "エミリオ")

	print("=== 星尘降临篇第14话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
