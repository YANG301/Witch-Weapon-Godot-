# stardustdescends_ep09.gd - 星尘降临篇第9话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep09_script()

func play_script():
	pass

func stardustdescends_ep09_script():
	novel_interface.change_music("res://assets/audio/music/Normal Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Ordovician.png")
	await novel_interface.show_text_only("人類の関心が向くであろう議題を1つ挙げるなら
異星文化の有無は外せないだろう。
もし宇宙に強大な何かが存在しているであれば、
彼らは果たして善なのか、それとも悪なのか。")
	await novel_interface.show_text_only("正解に近い憶測であれば教えよう。
彼らは無意的なのだ。")
	await novel_interface.show_text_only("──4.49億年前のある日。

高エネルギーガンマ線が、地球外6000光年の
距離から飛来する。
それは大気圏を貫いて、地球へと直撃した。")
	await novel_interface.show_text_only("ガンマ線はオゾン層の3分の1を破壊。

太陽から放射された紫外線が、直接大気層を
通過して地表へ到達するようになってしまう。")
	await novel_interface.show_text_only("結果としてプランクトンが大量に死滅し、
海洋下の食物連鎖が崩壊を始めた。
それは生物達に大きな飢餓が広まる起因となる。")
	await novel_interface.show_text_only("ガンマ線の直撃から数十年が経ち、
大気中の分子が再構成を開始。
有毒な二酸化窒素ガスが大量に発生した。")
	await novel_interface.show_text_only("二酸化窒素ガスは地球を覆い尽くして、
太陽光の50%を遮断。
陽射を半分も失った事により、地球には著しい
気温低下が生じた。")
	await novel_interface.show_text_only("海水温度も25度から10度まで低下。

プランクトンの死滅は増加する一方となり、
食物連鎖の崩壊は更に加速する。")
	await novel_interface.show_text_only("そこから500年後、地球上における生物の
約3分の1が絶滅を迎えた。
残った生物も飢餓と寒さに耐える生活を
余儀なくされる。")
	await novel_interface.show_text_only("太陽光の消失により海水温度が凝固点に達して、
地球は氷の星へと変貌していく。
氷河は想像以上の速度で広がりを見せて、
海水面は100メートルも下降した。")
	await novel_interface.show_text_only("──ガンマ線の直撃から15万年後。

平均気温が5度となった地表は大部分が氷と化し
生物は寒さにより半数が消失してしまう。")
	await novel_interface.show_text_only("…………………………………………………………

地球の古生物達に無尽の絶望を齎したのは、
蓋を開ければシンプルな事柄だ。
超新星爆発によるガンマ線バーストが銀河系の
どこかで発生し、巻き込まれただけ。")
	await novel_interface.show_text_only("このアクシデントは歴史書に記された際、
「オルドビス紀末大量絶滅」と題された――")
	await novel_interface.hide_background()
	await novel_interface.stop_music()
	await novel_interface.show_text_only("…………………")
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──第五学園都市")
	await novel_interface.show_text_only("抑揚がある美しい音楽の下、ソファーの上で
寝ていた男が徐々に意識を取り戻す……")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	novel_interface.show_background("res://assets/images/bg/Fabiola/BAR.png")
	await novel_interface.show_text_only("ボサボサの髪や無精ひげを気にする余裕もなく、
彼はソファーに背を預けながら身体を起した。")
	await novel_interface.show_text_only("目の前の机には水が置いてある。

砂漠の遭難者かのように喉が渇いていた男性は、
勢い良く手に取り一気に飲み干した。")
	await novel_interface.show_text_only("男は酷い頭痛を感じた様子で、頭を抑えて
唸り声を上げる。
直後に何か物を探す素振りをしながら、
ソファーから立ち上がった。")
	await novel_interface.show_text_only("どうやら自分のカバンを探していたようだ。

カバンがソファーの近くにある事に気付くと、
男は慌てて中身を確認し始める。
中にあった文書を1枚ずつチェックして
全て揃っている事が分かるとホッと息を吐いた。
男はそのまま深くソファに座る。")
	novel_interface.show_character("shi","normal")
	await novel_interface.show_dialog("ここは……どこだ……？", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("男……施教授は辺りを観察した。

部屋内は高級バーの様相で、窓の外は高層ビルの
ネオンが点滅している。")
	await novel_interface.show_dialog("……お目覚めかな？", "女性の声")
	await novel_interface.show_text_only("声がしたので頭をそちらに向けた。

白衣を着た赤髪の女性が、淡い黄色の液体の
入った容器を持ってこちらへ近づいてくる。")
	await novel_interface.show_text_only("彼女は容器を施教授の前に置くと、
反対側のソファに座った。")
	novel_interface.show_character("liliu_research","normal")
	await novel_interface.show_dialog("電解質を混ぜてある飲み物だ。頭痛に効くぞ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("shi","normal")
	await novel_interface.show_dialog("君は……", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("施教授は赤髪の女を見つめる。
どうやら心当たりがある様子だ。")
	novel_interface.show_character("liliu_research","normal")
	await novel_interface.show_dialog("お前なら私を知っているはずだ。", "マリル")
	await novel_interface.show_dialog("昨年お前は交流の名目の上、訪問学者として
新豊洲科学院に来た時──
結晶体異質物をテーマとした私の講座に
出席していたな？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は微笑みながら、わざとらしく間を置いて
話を続ける。")
	novel_interface.show_character("liliu_research","speak")
	await novel_interface.show_dialog("私の名はマリル・フォン・ブラウン。
知っての通り新豊洲の科学者だ。
そして一応……SIDの主任もやっている。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルの名乗りを聞いた施教授は驚愕し、
本能的に逃げ出そうと考えた。
しかし、直ぐに無駄だと理解して諦める。")
	await novel_interface.show_text_only("そんな施教授にマリルはタブレットを渡すと、
慰め交じりの言葉を投げかけた。")
	novel_interface.show_character("liliu_research","smile")
	await novel_interface.show_dialog("怖がらなくて良い。
ここにいた方がきっと安全だ。", "マリル")
	await novel_interface.show_dialog("何せ私達が居なければ、そこがお前の人生の
終着点だっただろうからな。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("警戒しつつも受け取ったタブレットを眺めると、
画面には見覚えある交差点の映像が流れていた。")
	await novel_interface.show_text_only("──彼は事の成り行きを思い出す。

いくら待っても約束した買い手が現れないため、
諦めて帰る事を決め、
別荘を出てすぐの交差点でタクシーを呼んだ。")
	await novel_interface.show_text_only("タクシーが来るまで適当に時間を潰していると、
首に何か刺されたような痛みを感じた。
そして、途端に目の前が真っ暗になって……")
	novel_interface.show_character("shi","normal")
	await novel_interface.show_dialog("こいつは……", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("映像にはタクシーを待つ自分の姿が映っていた。

そのまましばらく見ていると、とある中年女性が
自分の後ろを通り過ぎる場面に切り替わる。
パッと見では一般の通行人に見える彼女だが、
突然注射器を持ち出し──")
	await novel_interface.show_text_only("手慣れた様子でこちらの首に針を突き刺した後、
倒れる身体を受け止めて、合図を出し始めた。")
	await novel_interface.show_text_only("おおよそ3秒後、ドアを開けたままの黒ワゴンが
現場に到着する。
2人の男が急いでワゴンから出て来ると、
自分を車内へと引っ張り入れる。")
	await novel_interface.show_text_only("そして現場から黒ワゴンは逃走……

僅か10秒未満。
自分の身体は神隠しのように消されてしまった。")
	novel_interface.show_character("liliu_research","normal")
	await novel_interface.show_dialog("こいつらはネットで依頼を受け持ってる殺し屋で
誰かが高い金を払って雇ったらしい。
私達が車を止めるのに尽力しなければ、
今頃どうなっていた事やら。", "マリル")
	await novel_interface.show_dialog("あの時は神経毒を注射される寸前だったか。

後一歩遅かったら、今頃お前は脳死状態に
なっていただろうな。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("施教授は深く息を吸って、身体を硬直させた。")
	novel_interface.show_character("liliu_research","smile")
	await novel_interface.show_dialog("で、聞きたい事があるのだが……", "マリル")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("お前は一体、誰の恨みを買った？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("shi","angry")
	await novel_interface.show_dialog("恨み……？　そ、そんな……", "施教授")
	await novel_interface.show_dialog("私はただの一介の学者に過ぎん。
他人の恨みを買うなんぞ……", "施教授")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_research","normal")
	await novel_interface.show_dialog("あの別荘は「地下取引の仲介所」として名高い。

軍事兵器、機密文書または異質物でも何のその。", "マリル")
	await novel_interface.show_dialog("『七戒』の担保がある限り、売買する双方が
どんなにゲス野郎だとしても──
大体は相手を鑑みない行動に移らないはずだ。", "マリル")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("しかし、お前の取引相手はリスクを侵してでも、
一見価値の無さそうなお前に手を出そうとした。
その原因はなんだ？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("施教授は自らを守るようにコートの襟を正すと、
さり気なく自分のカバンを横目に見る。")
	novel_interface.show_character("shi","normal")
	await novel_interface.show_dialog("既にあんた達は確認済みだろうが、
こいつは第一学園都市の「絶対機密」文書だ。
考えられるのは「無形の扉」の連中が私を……", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──マリルは笑いながらソファに背を預けた。")
	novel_interface.show_character("liliu_research","speak")
	await novel_interface.show_dialog("はは、お前程度の人間でも外国へ持ち込める物が
絶対機密な訳ないだろう？", "マリル")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("既にそれと同じ文書が3つも市場に出回って
いるぞ？
マサダの情報部も手に入れていたようだ。", "マリル")
	await novel_interface.show_dialog("この様子だと華雲宮が文書の意図的な流出を
狙ったと推測できるが──", "マリル")
	await novel_interface.show_dialog("他の情報販売者は全員無事に取引を終えていて、
お前だけが何故か別として扱われた。", "マリル")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("それは、お前が他の売り手と違って何か特殊な
理由を持っているからに他ならない。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("施教授は一言も喋らず、唖然と虚ろな目をした。")
	novel_interface.show_character("liliu_research","smile")
	await novel_interface.show_dialog("恐らく、お前が買い手へ提出した取引条件は
金だけじゃない……", "マリル")
	await novel_interface.show_dialog("お前が欲しかった物は、危うく自分の命を
奪い兼ねない『モノ』であった。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("長い溜め息を吐くと、身体をリラックスさせて、
施教授はマリルと同じくソファに背を預けた。")
	novel_interface.show_character("shi","eyeclose")
	await novel_interface.show_dialog("あんた達……本当に末恐ろしいな。", "施教授")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_research","happy")
	await novel_interface.show_dialog("お褒めに預かり光栄だ。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──マリルは口角を上げた。")
	novel_interface.show_character("liliu_research","normal")
	await novel_interface.show_dialog("置かれた状況はもう理解できただろう？", "マリル")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("さて……我々も取引を開始しようか。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──第三学園都市、マサダ港税関。")
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadaCustoms.png")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("このタトゥーみたいなの……

……本当に後で消えるのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は手の甲に張り付けられたバーコードを、
何度も触れて確認する。
こいつはマサダ税関の入国許可証だ。

外国人旅行者が滞在する間だけ取得できる
唯一の公式IDでもある。")
	await novel_interface.show_text_only("異質物で加工した特殊なインクを使用していて
事前に設定したタイミングが過ぎると、
自動的に消えるようになっているらしい。")
	await novel_interface.show_text_only("つまりこのバーコードは滞在期限になった瞬間、
手の甲から無くなってしまう。")
	await novel_interface.show_text_only("バーコードを持たない相手は兵士も臨検人員も
容赦なく逮捕して良い事となっている。")
	novel_interface.show_character("ren_medical","uneasy")
	await novel_interface.show_dialog("（うーん……お風呂に入った時とかに、
　消えちゃったりはしないよな？）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","disgust")
	await novel_interface.show_dialog("遅い……ホントに遅いよ……", "シンチェン")
	novel_interface.change_expression("wordless")
	await novel_interface.show_dialog("ホントにホントにホントにホントに～～", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("暇を持て余しているシンチェンはどこかで聞いた
感じの変な歌を口ずさんでいた。
俺達は国際医療救援組織の特別通路を利用して
入国したから特に面倒事は無かったが、
アニーは普通の旅行客と同じ扱いなので、
保安検査を受けなければならない。")
	await novel_interface.show_text_only("マサダの保安検査は鬼厳しいと世界中で
話題に挙がるほど厳重だ。
現に港のロビーでも、兵士達が実弾入りの銃を
構えて常にパトロールをしている。")
	await novel_interface.show_text_only("時間が掛かりそうだったので、俺達は先へ
進みながらアニーを待つ事にした。
そして案の定シンチェンが待ちくたびれる
ぐらいには時間が掛かっている感じである。")
	await novel_interface.show_text_only("シンチェンは外の景色を見ようと廊下の
窓前にあった柱の上へよじ登っている。
俺はシンチェンの後ろへと続くように移動して、
窓から東の方を眺めた。")
	await novel_interface.show_text_only("視界に映ったのは蒼く波の立たない死海。
そして運河の終点に佇立するエリヤダム。
ダムの吐水口近くの海面は、不均等な緑色と
浅青色が混ざり合っている。
よく見ると死海南側から北に行けば行くほど、
海面の色は深くなる。")
	await novel_interface.show_text_only("滅ぼされた2つの罪悪の街、ソドムとゴモラは
死海南部の底深くに沈んだ――
『創世記』では、そのように記されていた。")
	await novel_interface.show_text_only("あそこの海底には「アイツ」へ恨みを持つ冤魂が
沢山いたりするのかな……")
	await novel_interface.show_text_only("一方、東北側の地平線上には砂嵐による忌々しい
暗紅色の霧が生き物のように蠢いている。")
	await novel_interface.show_text_only("不思議なのは、この子が砂嵐に関する情報を
知っていた事──")
	novel_interface.show_character("stardust_small","konata_eye")
	await novel_interface.show_dialog("ん～？　な～に～？", "シンチェン")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("なぁ、君はマサダの歴史を知っているのかい？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("「何言ってるんだこいつ？」と言いそうな表情で
シンチェンは目をパチパチさせると、
ヘッドホンの猫耳が素早く2回点滅した。")
	novel_interface.show_character("ren_medical","smile")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","normal1",0.25)
	await novel_interface.show_dialog("マサダはアラム語で「要塞」を意味する。

切り立った岩山の上に建設され、
ヘロデ大王が後に離宮として改修した。
山頂への道は細い登山道が一本あるのみで、
その地形から難攻不落と言われている。", "シンチェン")
	await novel_interface.show_dialog("72年、マサダに立て籠った1000人はローマの
軍隊に囲まれながらも2年間の籠城戦を果たす。
しかし奮闘も虚しく、時を経て衰退していくと、
城門を破かれてしまい、
最後は将校を含めた兵士全員が自決を選択した。", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("──さっきレストランで聞いた時と同じだ。

彼女はウィキペディア並みの知識を朗読のように
急に淡々とした口調で語り始める。")
	novel_interface.show_character("ren_medical","wry_smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("stardust_small","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……その言葉の内容、君は理解しているんだな？", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"konata_eye")
	await novel_interface.show_dialog("ぜぇ～んぜん！　意味分かってないよ！", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("彼女は眩しい笑顔を見せた。")
	await novel_interface.show_text_only("お前はスマートスピーカーかよ！？")
	await novel_interface.show_text_only("あるいはスマートじゃない方のスピーカー……")
	await novel_interface.show_text_only("俺は歴史に詳しくないけど、もう何千年も
マサダの苦難は続いていると知っている。
首都だった聖城も七年戦争の際に破壊された。")
	novel_interface.show_character("ren_medical","upset")
	await novel_interface.show_dialog("はぁ、色々大変な民族だよな……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("「マサダは永遠に陥落せず」

入国管理のロビーの梁に貼っていたスローガン、
今なら何となく気持ちが理解できる。")
	novel_interface.show_character("ren_medical","upset")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","happy",0.25)
	await novel_interface.show_dialog("あっ！　アニーだ～～！", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("シンチェンは保安検査の出口を指差す。

アニーが荷物を引っ張って、こちらに向かって
来ているのが見えた。")
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──播磨脳科学総合研究センター、実験医療部")
	novel_interface.change_music("res://assets/audio/music/Normal Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Fabiola/Dementium.png")
	await novel_interface.show_text_only("マリルは脳潜入装置のベッドに座りながら、
疲れた顔でこめかみを揉んでいる。")
	await novel_interface.show_text_only("部屋に入ってきた愛衣が、彼女に電解質入りの
水を渡した。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("尋問はどうだった？ 何か収穫あったかい？", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_research","smile")
	await novel_interface.show_dialog("まぁ……面白い情報は持っていた。", "マリル")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("施教授の現状はどうだ？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("深昏睡状態のままだね。

脳幹反射は微弱、機械で生命を維持するしか
できない状態だよ。", "愛衣")
	await novel_interface.show_dialog("体内の神経毒はキレート剤によって
大半が中和されたけど……
すでに身体は甚大なダメージを負っているから、
二度と目覚めない可能性も高いと言えるわ。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("やっぱり現状は潜入装置で脳に入り込むしか、
彼から情報を引き出す方法はないよ。", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ボトルのキャップを外すと、中身をグッと飲んで
マリルは喉を潤していく。")
	novel_interface.show_character("liliu_research","normal")
	await novel_interface.show_dialog("……あいつの話だと、文書を盗んで売ったのは、
娘を探すためだったらしい。", "マリル")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ai","wink",0.25)
	await novel_interface.show_dialog("ありゃ、あんなダサダサ服の教授だったから
てっきり独身かと思ってた。", "愛衣")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("あいつの娘の経歴は以下の通りだ。

6年前にバークレー天文学部から優秀な成績で
卒業を果たした。
そして連邦政府解体前にNASAの秘密研究項目へ
スカウトされて配属──", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"think")
	await novel_interface.show_dialog("NASAって本当に懐かしい名前だね……", "愛衣")
	novel_interface.change_2nd_expression("normal")
	await novel_interface.show_dialog("項目ってのは、軍隊の宇宙兵器とかのやつ？", "愛衣")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("天文観測の項目だ。", "マリル")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("プレアデス星団のとある座標を観測していた時。

NASAは偶然にも特定波長の高周波点滅信号を
受信したらしい。", "マリル")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("信号は明らかな指向性を持っており、
軌道上の特定位置でしか受信できなかった。", "マリル")
	await novel_interface.show_dialog("それは太陽系に向けて、400光年離れた場所から
発射されたレーザーのような……", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("愛衣は頬っぺたが赤くなるほどの興奮を見せて、
関心を持っている事を露わにする。")
	novel_interface.show_character("liliu_research","smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("ai","dizzy",0.25)
	await novel_interface.show_dialog("まるで光ファイバーで特定方向にメッセージを
送っているかのような……！？", "愛衣")
	novel_interface.change_2nd_expression("blush_dizzy")
	await novel_interface.show_dialog("ままま、ま、まさか――ッ！？", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("マリルは軽く頷いた。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_CrabNebula.png")
	await novel_interface.show_text_only("1967年、天文学者達が初めて規則的な
パルス信号の観測に成功した。")
	await novel_interface.show_text_only("最初は地球外文明からの信号だと考えられ、
その信号は「緑の小人」と名付けられた。")
	await novel_interface.show_text_only("だが、後から中性子星の一種であるパルサーが
起因していたと判明。
発信元は知的生命体が作った物ではないと
証明された。
しかし、それでも人間は系外信号の盗聴作業を、
決して止めなかった。")
	await novel_interface.show_text_only("天文学者からアマチュアまで、全ての天文学に
関わる人間にとって、
外層宇宙からの電波を受信する事は、
遥か一生の願いとされている。")
	novel_interface.change_background("res://assets/images/bg/Fabiola/Dementium.png")
	novel_interface.show_character("liliu_research","angry")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ai","blush_dizzy",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("項目自体は10年以上前から始まっていたが、
現在は実質上の凍結扱いを受けている。
流石のNASAもブラッククリスマスには
敵わなかったようだ。", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal")
	await novel_interface.show_dialog("ブラッククリスマスか……", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("──2033年12月24日

ニューモリダスの海に前触れもなく現れたのは、
巨大な球体状の空間『ブラックゾーン』だった。")
	await novel_interface.show_text_only("存在理由の不明なソレに対応できる訳もなく
連邦政府は保有していた海軍戦力の大多数を、
ブラックゾーンに呑み込まれてしまう。

当時ブラッククリスマスは彼らとって、
文字通り七年戦争の真っ暗な句点となった。")
	novel_interface.show_character("liliu_research","normal")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ai","normal",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("施教授が当時、娘から貰ったメールには項目の
エントロピー特徴値の記載があったそうだ。", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"think")
	await novel_interface.show_dialog("エントロピー特徴値……
確か電磁信号の指紋のようなものだったよね？", "愛衣")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("そうだ。

そのメールを最後に、彼の娘は行方不明となり、
彼は必死に娘を捜索するようになった。
先ほどの情報も、この数年の間に施教授が
調査した成果だ。", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"stare") 
	await novel_interface.show_dialog("あのおっさん思ったよりやるね……", "愛衣")
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("更に興味深い話は続く。

あの黒い石棺みたいなEX級異質物が、
外敵を拒絶する際に発する電磁波……
アレはメールに在った記載と同一の特徴値を
持っている。", "マリル")
	await novel_interface.show_dialog("ただし、反応は遥かに激しいがな。

華雲宮の収容基地1つを全壊にした時などは、
想像を絶する数値を叩き出していたそうだ。", "マリル")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("それを知った彼はすぐに帰国を申し出て、
あの異質物の研究チームに入ろうとしたらしい。", "マリル")
	await novel_interface.show_dialog("しかし前回の平和フォーラムの後に突然、
その研究項目のチームは解散してしまった。", "マリル")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("研究拠点が全壊した件もあってか華雲宮の
上層部は石棺を教皇庁に預けて、
永久に封印しようと考えたらしいな。", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"think") 
	await novel_interface.show_dialog("でも、そうなると娘に関する最後の手掛かりが
無くなっちゃうから……", "愛衣")
	novel_interface.character_light(0.35,"smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("だから彼は機密文書を盗み出した。

闇サイトで仲介屋に通じて情報の取引を
行うために。", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"stare")
	await novel_interface.show_dialog("あっ、分かった！
彼が欲しかったのはNASAの……？", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("マリルは欲しいおもちゃを手に入れたような
笑顔を見せた。")
	novel_interface.show_character("liliu_research","smile")
	await novel_interface.show_dialog("その通り。", "マリル")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("彼の命が狙われた原因は……

闇サイトの仲介にNASA『0812項目』の
内部資料を要求していたからだ。", "マリル")

	print("=== 星尘降临篇第9话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
