# stardustdescends_ep17.gd - 星尘降临篇第17话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep17_script()

func play_script():
	pass

func stardustdescends_ep17_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_SlumArea.png")
	await novel_interface.show_text_only("──暗闇の中、俺は階段を下りて外へと向かう。")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("（真っ暗で何も見えないな……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("通信が途絶えてから何度呼びかけても、
エミリオの応答は返って来ない。")
	await novel_interface.show_text_only("このスラムの夜間は非常に犯罪率が高いらしく、
武装した過激派までもいるんだとか。
……全てが俺の不安を煽る。")
	await novel_interface.show_text_only("ハイファおばさんはエミリオの言っていた通りに
全ての廊下と部屋の灯りを消した。
すでに子供達が寝入っていたのは幸いか、
孤児院で大きな騒ぎは起こっていない。")
	await novel_interface.show_text_only("だけど俺の頭に巡り続ける不吉な予感。

分厚い金属の扉が閉じられようとした時、
止まらない胸騒ぎが破裂した。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("（ここにいたら、もうエミ達に会えなくなる
　気がする……）")
	await novel_interface.show_text_only("──頭より身体が先に動いてしまう。

「彼女達の様子を見に行く」と一言だけ告げて、
俺は扉が閉じる前に外へと飛び出したのだ。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_SlumArea.png")
	await novel_interface.show_text_only("…………")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（何で俺は軽々しく飛び出しちゃったんだろう……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("穏やかな地中海性気候のマサダではあるが、
乾き切っていない髪が夜風に触れると、
薄ら寒さを感じる。")
	await novel_interface.show_text_only("少しだけ身震いしながらも、隠れて周囲を
警戒した。
停めていた装甲車はすでにライトが消えていて、
エンジンも切っている様子だ。
しかし後部のドアがしっかり閉じられていない
ように見える。")
	await novel_interface.show_text_only("俺は足音をなるべく立てずに装甲車の後ろへと
回り込んだ。
ドアに覗き込めるぐらいの隙間を作って、
恐る恐る車内を確認する。")
	await novel_interface.show_text_only("中は一面が黒色で夜闇より暗い。

このままじゃ何も分かりようが無いため、
携帯のライトで照らしてみた。
すると垣間見えたのは──")
	await novel_interface.show_text_only("……逆さまの男の顔だ。

口から泡を吹きながら、生気のない瞳で
俺を見つめて……")
	await novel_interface.show_text_only("ーーーーーーーーーーッ！？！？！？

驚きのあまり携帯を宙へと放り投げ、
小鹿のように後ろへとジャンプした。")
	await novel_interface.show_text_only("絶叫が思わず洩れ出そうになった瞬間、
刹那的に背後から手が伸びてくる。
跳んだ俺の身体が着地前にキャッチされ、
その手で口を完全に塞がれてしまう。")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("（むぐううぅぅぅーーッ！？！？！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("宙を舞った携帯は背後と違う人間が確保して
すぐさまライトが消された。
囁くような声が聞こえてきて……

俺は目をキュッと閉じた──")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("しっ──！ 私達よ、レンちゃん。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("恐怖でパニック状態となっていた俺の頬を
エミリオが軽く叩いてくれた。
そのまま目元に浮かべた涙を拭ってくれる。")
	novel_interface.show_character("valkyrja","happy")
	await novel_interface.show_dialog("風呂上りなのか？

良い匂いだなぁ～～", "ヴィラ")
	novel_interface.change_expression("wink")
	await novel_interface.show_dialog("おっと、暴れるなって。", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("背後を取ったヴィラは俺の動きを封じながら
匂いを嗅いできた。
もがこうとすると拘束を強めて来るので、
大人しくする他にない。
しかし拘束を強めたのは落ち着かせるため
だったようで、
状況が把握できるぐらいに冷静になると、
すぐに手を放してくれた。")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("……外を見て。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("エミリオがゲートの外を指差したので、
そちらを確認する。")
	await novel_interface.show_text_only("目を凝らしてみると、ゴソゴソと人影が
蠢いている事に気付いた。")
	novel_interface.show_character("emilio","stare")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_medical","stare",0.25)
	await novel_interface.show_dialog("（泥棒……？）

（……いや、流石に数が多すぎる）", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("黒い服装の人間が4～5人ほど闇に紛れて
街道を歩いている。
それに合わせて2台の旧ワゴン車がゆっくりと
並走していた。")
	await novel_interface.show_text_only("ヘッドライトやブレーキランプなどの照明は、
全てが取り外されている様子だ。
異常なほど遅く前進しているのはエンジン音を
極力抑えるためなのだろうか。")
	await novel_interface.show_text_only("通り過ぎていく光景は軍の隊列かのようである。

後ろには同じような編成の部隊が距離を離して
続いている。")
	await novel_interface.show_text_only("そんな最中に酒瓶を持った1人のホームレスが
現れた。
酔っ払っているのだろうか、空に向けてゲップを
しながらフラフラと彼らへ接近してしまう。")
	await novel_interface.show_text_only("彼らは特に驚きもせず作業的にホームレスを
見つめた。
機械のような動作でホームレスへと組み付き、
頭を片手で掴むと、
少しの躊躇も見せずに首を捻じ曲げる。

動かなくなったホームレスは道の外れに
引きずられて行く……")
	novel_interface.show_character("emilio","stare")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("ren_medical","panic",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("──────────────ッッ！？！？", "レン")
	await novel_interface.show_dialog("なんだあの連中は……！！", "レン")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("確認した小隊は今通り過ぎたのを足して6つ目。

さっき捕まえた1人に尋問しようと思ったけど、
毒で自殺しちゃってね。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("エミリオは親指で装甲車の方を指す。

あの泡を吹いていた男の事か……")
	novel_interface.show_character("emilio","stare")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("ren_medical","panic",0.25)
	await novel_interface.show_dialog("彼の服の中には「黒い旗」が有ったわ。

過激派が自爆テロを行う時に掲げる旗だから
どこかへ攻撃するつもりかも。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("目の前で起きている事はエミリオの予想を
遥かに超えた事態なのだろうか。
彼女は眉をしかめるばかりである。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("自、自爆テロ……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ニュースで良く耳にする単語だけど、
こんな大所帯なんて聞いてないぞ！")
	novel_interface.show_character("ren_medical","panic")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","stare",0.25)
	await novel_interface.show_dialog("ナンバープレートとブレーキランプを取り外して
可能な限り特定されるのを避けているわね。
スラムから行動を起こすのはドローン達の死角を
突くためかしら。
この辺りだと監視システムはまともに機能して
いないし。", "エミリオ")
	await novel_interface.show_dialog("でも昼間は国防軍のパトロールが巡回してるから
元より安全に帰る事は想定されていない……", "エミリオ")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0)
	await novel_interface.show_dialog("つ、つまりは？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","angry")
	await novel_interface.show_dialog("恐らく数時間以内には巻き起こると思う。

前例がないぐらいの規模の自爆テロがね。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","speak")
	await novel_interface.show_dialog("放射線の観測センサーだけはマサダ内城区域から
数キロメートルの円周上に埋め込まれてある。", "ヴィラ")
	await novel_interface.show_dialog("放射性物質をワゴンに積載してあるなら
ここまで来る自体が不可能に近い。", "ヴィラ")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("すると狙いは単純な自動車爆弾を使用したテロと
考えられるが……
それにしたって人数が多すぎる。
最悪の事態を考えておくべきだ。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("ほ、報告しておかないと不味いんじゃないか？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("さっき公衆電話を使って緊急コードを送ったわ。

周囲に妨害電波が振り撒かれているから
連絡が届く信頼度は携帯よりも高いはず。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そんな骨董品がまだ存在しているのかよ。")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("妨害装置まで起動して用意周到……
本当にこの連中は何者かしら？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("軍とマノ―ラに連絡が届いたとして、
到着は少なくとも10分以上かかるだろう。
ここから行方を晦ますには十分な時間だ。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("俺達だけでも尾行は出来そうだけど。", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("いいえ、無理な話よ。

後を追うだけでも場所が場所だから、
簡単には出来ないわ。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ここは少数民族の集居集落みたいなもので、
あちらこちらで言語が違う。
その上でスラムと言う治安の関係もあり、
数多のギャングの根城にもなっている。")
	await novel_interface.show_text_only("各種インフラ施設は長きに渡り修繕されておらず
迷路のように荒廃していくばかり。
法律度外視で山のように存在する違法建築物は、
勿論だが公式マップに記載されていない。")
	await novel_interface.show_text_only("当のマサダ政府もこの状況に見て見ぬふりを
決め込んでいる。
数年前より国家自体の予算が緊縮しているため、
整頓したくても出来ないのが実情だろうか。")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("（……明日の停戦協定と関係してるのかな）", "レン")
	novel_interface.change_expression("wry_smile")
	await novel_interface.show_dialog("マリっ……俺の上司から明日に調印式があるって
聞いたんだけど。", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","shout")
	await novel_interface.show_dialog("あっ、調印式は明日の何時だっけ？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","panic")
	await novel_interface.show_dialog("確か朝の6時になったはずだ。

多数のメディアに露出する重要な日に、
砂嵐は出来る限り避けたいんだろ。", "ヴィラ")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("マサダ代表として調印するのはハモン陸軍少将。

事前の取材では軍服でなくスーツで出席すると、
アイツは言ってたな……", "ヴィラ")
	novel_interface.change_expression("speechless")
	await novel_interface.show_dialog("野心を丸出しの癖に洒落ぶりやがって……

あのカエルめ、選挙もまともに出来ないのか？
小手先で勝負せずに直接出馬を表明しろよ。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（……カ、カエル？）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("ハモンが次期首相に狙いを定めているとして、
彼の性格を鑑みると……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("どうやら調印する人物の事を二人は詳しく
知っている様子だ。
エミリオは渋めた顔で何かを考え込んでいる。")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("……事は停戦協定の署名1つで終わらない
でしょうね。", "エミリオ")
	novel_interface.change_expression("shout")
	await novel_interface.show_dialog("きっと停戦協定に調印した結果を国民へと
分かり易く具現化するために、
AI防衛兵器の電子協定も更新するはず。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","bored")
	await novel_interface.show_dialog("……どういう事？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","shout")
	await novel_interface.show_dialog("マサダの上空を旋回している全てのドローン達が
倉庫でおねんねするとなったら、
きっと左翼のメディア達は涙腺崩壊させながら
感動すると思うわ。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","wink")
	await novel_interface.show_dialog("はは、簡単に想像できるな……", "ヴィラ")
	novel_interface.change_expression("panic")
	await novel_interface.show_dialog("……って、ちょっと待て！

つまりあの連中はAI防衛兵器の協定を更新する
タイミングに合わせて、
襲撃を起こすって言いたいのか！？", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("手薄になったタイミングを狙うのは
有り得ない話じゃない。
マサダの国防におけるAI兵器の依存度は
今や80％を占めているから。", "エミリオ")
	await novel_interface.show_dialog("流石に全てを一括で更新するような真似は
しないと思うけど。
きっと守備エリアで区切って段階的には
実行されるはずよ。", "エミリオ")
	novel_interface.change_expression("shout")
	await novel_interface.show_dialog("調印式の会場はどこだったかしら？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("死海沿いにある、マサダ……なんだったっけ。", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("マリルから事前に聞いていた情報通りなら──")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_ShelterOffice.png")
	await novel_interface.show_dialog("明日の調印式だが、マサダは国防軍北方司令部の
ハモン陸軍少将を代表とした。", "マリル")
	await novel_interface.show_dialog("調印式の行われる場所はマサダ国際会議場だ。", "マリル")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_SlumArea.png")
	novel_interface.show_character("valkyrja","speak")
	await novel_interface.show_dialog("マサダ国際会議場なら、ここからも遠くないな。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","solemn")
	await novel_interface.show_dialog("調印式そのものを奴らは狙ってる？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","speechless")
	await novel_interface.show_dialog("そこまで奴らも馬鹿じゃないはずだ。

会場周辺はマノ―ラが厳戒態勢で守っているし、
国防軍も大量の重火器を配備している。", "ヴィラ")
	await novel_interface.show_dialog("仮に襲撃をしようとも会場から5キロ圏内にも
侵入できず、殲滅されるのがオチだろう。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("「国際会議場内のホールから外を見た場合……」", "エミリオ")
	await novel_interface.show_dialog("一番近くの隔離壁は、私達からも見えている
あの場所よね？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そう言って隔離壁の方をエミリオは指差す。

連続して続く壁は、真っ直ぐと伸びた街道を
遮るかのように鎮座していた。")
	await novel_interface.show_text_only("壁の後ろには、暖かな内城区域の光。")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("……内城区東北側の隔離壁。

彼らの目標は調印式の会場じゃなくて……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("言い終わる前にエミリオは口を噤んだ。

俺でも事の重大さが呑み込める。")
	await novel_interface.show_text_only("暗い空を見上げると、星々の姿は欠片のひとつも
無くなっていた。")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("（こんなにも……空は暗かったのか？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("言葉に出来ない予感が身体を這い巡る。

胸騒ぎは大きくなるばかり。")
	await novel_interface.show_text_only("だが改めて考えると、この時の認識さえも
甘かったのかもしれない。
俺は思ってもいなかったんだ。

事態が更に悪化するなんて……")
	await novel_interface.stop_music()
	await novel_interface.show_text_only("……………………")
	await novel_interface.show_text_only("――同時刻、第五学園都市")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_bar.png")
	await novel_interface.show_text_only("抑揚のある美しい音楽の下で、相も変わらず
ソファーに座ってる施教授は、
苦痛の表情で頭を抑えていた。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("……お目覚めかな？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは液体の入った容器を施教授の前に置くと
反対側のソファに座る。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("電解質を混ぜてある飲み物だ。頭痛に効くぞ。", "マリル")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("shi","eyeclose",0.25)
	await novel_interface.show_dialog("私は…………", "施教授")
	novel_interface.change_2nd_expression("normal")
	await novel_interface.show_dialog("私は……君の事を知っている？", "施教授")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("表情に出さなかったが、内心でマリルは驚いた。")
	await novel_interface.show_text_only("彼女は先ほど判明したNASAの秘密研究項目に
関する情報を使って、
施教授に交差検証を実施するつもりだったが、
予想外の収穫に発展した。")
	novel_interface.show_character("liliu_uniform1","normal1")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("shi","normal",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("（今までの尋問は記憶に残っていないはずだ）

（……前回の記憶の削除が不完全だったのか？）", "マリル")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("お前……何を覚えている？", "マリル")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"eyeclose")
	await novel_interface.show_dialog("いや、夢で見た感じに霧がかっていて、
わ、私も記憶が定かではない……", "施教授")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("とにかく、こいつを飲んでみろ。
頭痛に効くぞ。", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("マリルは液体の入った容器を施教授の方へと
押し動かした。
──これは愛衣がデザインした「保険装置」だ。")
	await novel_interface.show_text_only("容器内の液体が全て消耗されたタイミングで
自分と対象とのリンクが自動的に切断される。")
	await novel_interface.show_text_only("通常であれば液体は人間の本能で拒否され
対象が飲むには至らないだろう。
飲んでしまえば自分の精神がおかしいと
認める事になるからだ。")
	await novel_interface.show_text_only("しかし対象の精神が本当に不安定である場合は
自ずと安定剤として欲するようになってしまう。")
	await novel_interface.show_text_only("施教授は容器を長時間見つめた後、
ゆっくりと喋り始めた──")
	novel_interface.stop_music()
	novel_interface.show_character("shi","eyeclose")
	await novel_interface.show_dialog("私の娘が不眠症になっていた時期なのだが、
電話した時に1つの思考実験を投げて来た。", "施教授")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("「なぜ、未だに世界の終わりは来ないのか？」", "施教授")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("……ほぅ？", "マリル")
	await novel_interface.hide_character()
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.show_character("shi","normal")
	await novel_interface.show_dialog("4.4億年前、3.65億年前、2.5億年前、
2億年前と6500万年前。", "施教授")
	await novel_interface.show_dialog("世界終末レベルの事件は単純計算で1億年ごとに
大よそ自然と起き続けている。", "施教授")
	await novel_interface.show_dialog("そこから核兵器の発明によって終末へと向かう
確率は大幅に上がった。", "施教授")
	await novel_interface.show_dialog("キューバ危機で人類は一度滅亡に直面しかけ、
思い留まりはしたが──", "施教授")
	await novel_interface.show_dialog("……異質物兵器の出現により再び狂気に陥る。

アレは生命を滅ぼし家屋を破壊するだけでなく、
価値観や信仰すら捻じ曲げる事ができるからな。", "施教授")
	novel_interface.change_expression("eyeclose")
	await novel_interface.show_dialog("実際は多くの人間が理解しているはずだ。

連合議会が公開した6つのXK級異質物以外にも
世界終末をもたらす異質物が存在する事を。", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("施教授は液体の沸き立つ気泡を見つめながら
淡々と話し続ける。")
	novel_interface.show_character("shi","eyeclose")
	await novel_interface.show_dialog("あの6つは人類がある程度だけ制御できる
異質物に過ぎん。", "施教授")
	await novel_interface.show_dialog("制御不可能の強大な力を発見するに至れば、
必ず人類は存在を隠す事に尽力する。", "施教授")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("──しかし全てを隠し通す事は不可能だ。

世界終末レベルの事件を引き起こす異質物が
今までに1度も起動していないのは、
可能性として有り得るのだろうか？", "施教授")
	await novel_interface.show_dialog("例えば100人同時にコインを投げたとして、
ただの1人だけが裏を出したとしても、
裏が出た時点で全員が死亡してしまうとしよう。", "施教授")
	await novel_interface.show_dialog("このコイントスを幾度も繰り返した後に、
最も思考すべき問題とは──", "施教授")
	novel_interface.change_expression("angry")
	await novel_interface.show_dialog("……なぜ、私達はまだ生きているのだろうか？", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは背中をソファーへと預けて深呼吸した。

この質問は彼女が自分自身に問い続けて
予てより疑問に思っている事柄だ。")
	await novel_interface.show_text_only("SIDの主任として重大な危機へ立ち向かう中、
幾度も不思議に感じている。")
	await novel_interface.show_text_only("選択肢やタイミングを1つでも見誤れば、
世界の崩壊は免れなかった。
勘と実力だけで全てを乗り切ってきたと、
言えるのだろうか？
運として片付けられる事象なのだろうか？")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("……お前の娘の答えはなんだったんだ？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("shi","normal")
	await novel_interface.show_dialog("この世界にはゲームのような「セーブ」機能を
持つ異質物が存在している。
世界の終末は言わばゲームオーバーである。

……私の娘はそう言っていた。", "施教授")
	await novel_interface.show_dialog("ある地点からセーブポイントが作成されて、
取り返しの付かない状況に陥ると発動する。
自動的に世界をセーブポイントまで巻き戻すと、
無かった事として新たな局面が始まる。", "施教授")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("コインの裏が出た瞬間にやり直す機能か。

複雑な問題にシンプルな答案を追求するならば、
その答えで合格だろう。", "マリル")
	novel_interface.change_expression("sigh")
	await novel_interface.show_dialog("しかし全てが元の状態に戻ったとしても、
何故やり直すと別の結末になるんだ？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("shi","eyeclose")
	await novel_interface.show_dialog("それが問題となる点だな。

戻るだけならば何も変わらず繰り返されるのみで
終わってしまう。
ゲームオーバーを避けるためには「前回」と
別のやり方を試すようなプレイヤーが必要だ。", "施教授")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("彼らはリセットする度に「前回」の記憶か情報を
持っているのだろう。", "施教授")
	await novel_interface.show_dialog("そして今まで世界の終末を回避して来たのは、
他ならぬ彼らのお陰かも知れん。", "施教授")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","serious")
	await novel_interface.show_dialog("……そいつらが救世主だとでも言いたいのか？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("shi","eyeclose")
	await novel_interface.show_dialog("いや……", "施教授")
	await novel_interface.show_dialog("世界の終末を乗り越える事が「クリア」として、
「セーブポイント」があるならば。
それより前に発生した全ての苦難と苦痛は、
一体どうなる？", "施教授")
	await novel_interface.show_dialog("「クリア」の過程で生まれた犠牲者の運命を
確定する事が「セーブ」と言う行為だ。
きっと彼らの「世界を救う」は慈悲も無く、
人々の事などは無関係なのだろう。", "施教授")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("……30億人の命を奪った七年戦争。

やり直すチャンスはあったはずだ。", "施教授")
	novel_interface.change_expression("angry")
	await novel_interface.show_dialog("あんな物を「セーブ」した人間を救世主なんぞ
私は絶対に呼ばん。", "施教授")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("亡き肉親を思い出したのか、施教授の言葉が
感情を帯びてくる。")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("あくまで仮説の話だろう？ 

それなら並行宇宙の理論で説明する事ができ……", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──ゴクリ。

マリルの言葉を待たずして、施教授は電解質の
液体を飲み干した。")
	await novel_interface.hide_background()
	await novel_interface.stop_music()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("――6時間後、マサダ国際会議場の駐車場")
	await novel_interface.show_text_only("――装甲兵員輸送車内")
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPCO2.png")
	await novel_interface.show_text_only("心臓が飛び出そうな程に息を切らしながら、
俺とヴィラは手すりに寄りかかっていた。")
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("すでにあんたの指紋は検証されている。

入国の時に登録していたから……", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ヴィラは車内の救急箱を使って、
自らの腕に負った傷を手当てしている。")
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("あんたがSIDの人間だとマノ―ラにバレるのは
時間の問題だ。", "ヴィラ")
	await novel_interface.show_dialog("取りあえずあんたは車内に隠れていろ。

この駐車場には同じ装甲車が数台あるから
30分ぐらいは持つだろう。", "ヴィラ")
	await novel_interface.show_dialog("信頼できる暗号化した通信チャンネルはあるか？

仲間と連絡できるなら早く状況を知らせて
捕まる前に逃げた方が良い。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("エ、エミリオはどこに？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("エミは国防軍に連れ去られた……

恐らくだが会場内の臨時セーフハウスに
閉じ込められている……", "ヴィラ")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("私は……エミを助けに行く。", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ヴィラはフラグとスタンのグレネード2種を
自分の腰へと引っ掛けるや否や、
すぐに装甲車から飛び出した。")
	await novel_interface.show_text_only("俺は糸の切れたように座席へと座り込んだ。

俺の身元がバレた上にエミリオが
捕まるなんて……")
	await novel_interface.show_text_only("もはや、最悪だ……！！！！")

	print("=== 星尘降临篇第17话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
