# stardustdescends_ep08.gd - 星尘降临篇第8话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep08_script()

func play_script():
	pass

func stardustdescends_ep08_script():
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Masada0.png")
	await novel_interface.show_text_only("第三学園都市──マサダブルク。")
	await novel_interface.show_text_only("ここは都市と言うより、もはや砂漠に建てられた
巨大な軍事要塞だ。
名産品と言えば死海の泥と砂嵐、
そしてテロ攻撃。")
	await novel_interface.show_text_only("マサダブルクに関して放映されるニュースは
軍事衝突と人為的災害の類ばかりで、
そのおかげか多くの人々に過激的なイメージが
定着してしまった。")
	await novel_interface.show_text_only("血と砂、原油と硝煙による死の匂いが、
この古き大地の上を常に漂っている。")
	await novel_interface.show_text_only("そこに住む人々の生活はどんな感じだろう？

俺の想像が及ぶような世界ではないのだろうけど
7年戦争の経験から少しはイメージできる。")
	await novel_interface.show_text_only("身近に感じる部分も何故だか多い。

まるで実際に体験した事があるかのような……")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("はぁぁぁぁ―――――", "レン")
	novel_interface.change_music("res://assets/audio/music/unkown/UI_Main_Funk.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/Vessel.png")
	await novel_interface.show_text_only("甲板の手すりを背もたれにしている俺の身体に、
コアラ化したシンチェンが、
涙目になりながらくっついている。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("ごめんって、さっきのは冗談だってば──", "レン")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("ってかそろそろ力を緩めて欲しいんだけど……

爪が俺の肉に食い込んでるから……", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","tear",0.25)
	await novel_interface.show_dialog("うぅうぅ……ぁうぅ……", "シンチェン")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ちょっ！俺の服で鼻を拭くなっ！", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("ヤレヤレと言える状況に溜め息を吐きながら
俺は彼女の頭を撫でた。")
	await novel_interface.show_text_only("彼女の指差した方向にはマサダブルクがあると
愛衣の調べによって分かったけど、
当の本人は地名とかをまったく知らない
みたいで……")
	await novel_interface.show_text_only("むしろ『学園都市』という概念すらも
理解していない有り様だった。")
	await novel_interface.show_text_only("これには流石のマリルも頭を抱えてしまったが、
情報を整理したら追って指示を出すとの事だ。
今は次の連絡が来るまで甲板にて待機中である。")
	await novel_interface.show_text_only("その間、幾つかのテストを行ってみる事にした。

俺しか見えない幻像なんて未だに受け入れ難いし
現状をきちんと把握するためにも実験は必要だ。")
	await novel_interface.show_text_only("まずは携帯電話を床に置いて、彼女に拾って
貰おうと考えた。")
	await novel_interface.show_text_only("結果として「お前、頭大丈夫か？」と
言わんばかりの素敵な笑顔を彼女から頂く。")
	await novel_interface.show_text_only("30秒間ほど睨み合った末、笑顔に根負けして
結局は自分で携帯を拾い上げる事となった。
次に違うアプローチを考え付く──")
	await novel_interface.show_text_only("「実体がないって事は、壁とかを抜けられたり
　しないのか？」")
	await novel_interface.show_text_only("早速と俺は彼女の視線を尻目に甲板の扉を閉め、
壁一枚を隔てて隠れる事にした。")
	await novel_interface.show_text_only("──2分後

扉の向こう側から泣き声が聞こえてくる。

慌てて扉を開くと、彼女はすぐさま俺の太ももに
抱き着いて離れなくなった。")
	await novel_interface.show_text_only("結果として太ももに引っ付いたソレは離れず、
手すりまで戻るのも一苦労となってしまった。")
	novel_interface.show_character("ren_full","wail")
	await novel_interface.show_dialog("（この足パーツを装着しながら移動するって、
　これ以上は厳しいぞ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("子連れってこんなに苦労するんだな……")
	await novel_interface.show_text_only("最悪なのは彼女が他の人から見えないって事だ。

誰かが今の俺を見たら、独り言をずっと呟いてる
イカレ野郎だと思うだろう。")
	await novel_interface.show_text_only("それでもほっとけない俺は周りの目を気にしつつ
彼女を優しく慰めるしかできない。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("よしよし、もう置いていかないからさ～～", "レン")
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("さっきのは俺が悪かった。謝るから、ね？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そう言いながら、彼女におどけた顔をする。")
	await novel_interface.show_text_only("誰もいない空間に向けて表情をコロコロと
変えているように他人からは見えるのかな？
誰かに見られたら、その時は甲板の隙間に
めり込んでも隠れようと思う。")
	await novel_interface.show_text_only("シンチェンは俺に抱き着いたまま頭を上げた。

甘えるような上目遣いで瞳をパチパチして、
ヘッドホンの耳の部分を点滅させている。")
	novel_interface.show_character("stardust_small","tear")
	await novel_interface.show_dialog("じゃ、一緒にあっちに行くって約束してくれる？", "シンチェン")
	await novel_interface.show_dialog("本当に、本当に大事なの……！", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("……お前さっきのウソ泣きじゃないだろうな。")
	novel_interface.show_character("ren_full","upset")
	await novel_interface.show_dialog("（やっぱ子供って厄介だ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("どうにも泣かれると可哀想に見えて、
言う事を聞いてしまいそうになる。
だけどマリルが同意するか分からないし、
この子をあんな危険な所に連れていくなんて……")
	await novel_interface.show_text_only("ザ――……ザザ……

……イヤホンからノイズが聞こえてくる。
マリルからの連絡だ。")
	await novel_interface.show_dialog("レン、アニー。
お前達はマサダの事をどこまで知っている？", "マリル")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("うーん……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("どこまでって言われても……", "アニー")
	await novel_interface.show_text_only("思い出してはみるが、マサダに関する情報は
SIDのエージェント研修でもバラバラだ。")
	await novel_interface.show_dialog("第三学園都市……西アジアの中心にある
要塞都市なんでしょ？
内城区域と外城区域があって、その2つは
大きな壁で分断されているんだよね？", "アニー")
	novel_interface.show_character("ren_full","bored")
	await novel_interface.show_dialog("原因は確か……種族とか宗教とかの争いだっけ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("とりあえずマサダ外城区域は危険な
イメージしかない。
毎月最低でも1回か2回はテロ爆弾攻撃が
起きてるらしいし。")
	await novel_interface.show_dialog("情報機関としてはマサダ復興使命局が有名だね。

軍部の直下に所属していて、思想は急進的かつ
大胆不敵。", "アニー")
	novel_interface.show_character("ren_full","happy")
	await novel_interface.show_dialog("それは俺も知ってるぞ！
あの機関の通称が『マノ―ラ』だろ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ゲームや映画に良く出でくる名前だ。

大体の場合は主役じゃないけど……")
	novel_interface.show_character("ren_full","smile")
	await novel_interface.show_dialog("リモコン戦車や戦闘用ドローンは大体マサダから
提供されたって言う設定が多いし──
軍需産業だけは進んでいるイメージがある。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("まあ、一般的なイメージはそのぐらいだな。", "マリル")
	await novel_interface.show_dialog("あの辺りの地政学的環境は昔から非常に
複雑な上、緊張度も高い。
さらにレジスタンスや独立を企む組織などを
足せば、混沌と化しているのも納得だろう。", "マリル")
	await novel_interface.show_dialog("しかしマサダの『内城区域』だけで見れば、
新豊洲に遜色のない安全度だ。

だから──", "マリル")
	novel_interface.show_character("ren_full","perspire1")
	await novel_interface.show_dialog("えっ？まさか……行くって言うのか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("未だ太ももに張り付いているシンチェンが、
嬉しそうに俺の身体を揺らした。")
	await novel_interface.show_dialog("私達2人だけで……大丈夫なの？", "アニー")
	await novel_interface.show_text_only("3人！ 3人だから！！

この人型お荷物をお忘れなく！")
	await novel_interface.show_dialog("スパイ大作戦じゃあるまいし、現状は具体的な
目的地さえも分かっていない。
お前達が桁外れにバカな事をしなければ、
大方は大丈夫だろう。", "マリル")
	await novel_interface.show_dialog("それに船の乗り換えすら要らないよ。

そのカジノ船は明朝、マサダに到着するって！", "愛衣")
	await novel_interface.show_dialog("……どういう事？
この船、サモントンに行くんじゃなかったの？", "アニー")
	await novel_interface.show_dialog("スエズ運河が全面的に通行禁止となったからだ。

3日後にマサダとレジスタンスが停戦協定の
調印式を執り行う予定で、
それが終わるまで誰も通さない腹積もりだろう。", "マリル")
	await novel_interface.show_dialog("マサダ軍の「強めなアドバイス」にカジノ船も
乗客の安全を考慮した上で従っている。
一旦ではあるが、エイラートに戻るようだ。", "マリル")
	await novel_interface.show_dialog("その後は紅海・死海の運河を沿って北へと向かい
マサダ港に入港。
スエズ運河の封鎖が解除されるまでは、
そこで待機と言う流れだな。", "マリル")
	await novel_interface.show_dialog("アニーは新豊洲の芸術交流を目的とした
生徒に偽装する。
手続きなどはすでに済ませておいた。", "マリル")
	await novel_interface.show_dialog("レンは、まぁ──

お前はもうマサダ海防に登録されているから
……引き続きナースちゃんをやっておけ。", "マリル")
	await novel_interface.show_text_only("ナースちゃんと言った瞬間のマリルの話し方に
笑いを堪える気配を感じた。
微妙に不安を感じるぞ……")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("わ、分かったよ……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("どのみち調印式が終わるまで動けないから、
この2日間は城内で観光でもしたら？", "愛衣")
	await novel_interface.show_dialog("そいつの行きたい所が城区以外だった場合は、
駐在している情報部の人員を3日後手配しよう。", "マリル")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("スエズ運河まで封鎖するなんて……", "レン")
	await novel_interface.show_dialog("停戦協定を1つ結ぶぐらいで、大げさ過ぎや
しないか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.stop_music()
	await novel_interface.show_dialog("理由はとても簡単だよ？", "愛衣")
	await novel_interface.show_dialog("すでに大事になっちゃってるから。", "愛衣")
	await novel_interface.show_dialog("お前達はここ2日間ずっと船の中にいたから、
まだ知らないみたいだな？", "マリル")
	await novel_interface.show_dialog("ど、どういうこと……？", "アニー")
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("マサダ境内ヘブロンのアブラハム・モスクにて、
半日前に工業化学品での爆発事故が起きた。", "マリル")
	await novel_interface.show_dialog("爆発による衝撃波は一帯の建築物を倒壊させ、
生活インフラのほとんどは機能停止状態だ。", "マリル")
	await novel_interface.show_dialog("地域にいた住民達は安全区域に避難させたと、
マサダ政府は発表しているが……", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("またテロ攻撃なのか？", "レン")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("だと思うけど、問題なのは起きた場所の方……

アブラハム・モスクの下にあるマクペラの洞窟は
マサダ人の先祖の墓だと伝説上に残っているの。", "愛衣")
	await novel_interface.show_dialog("彼らが前世紀にヘブロンを引き継いで以来は、
一度も考古学的な発掘をしてないらしいけど……", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("そもそも情報封鎖のレベルが明らかに異常で、
怪しい点を挙げたら切りがないのさ。", "愛衣")
	await novel_interface.show_dialog("死傷者数は合理的な数字で報告されているけど
事件を撮影した動画がネット上にひとつもない。
今回の件に関するニュースも全部マサダ政府から
提供された画像と動画ばっかり。", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","serious")
	await novel_interface.show_dialog("ヘブロンに点在する大型病院の電子システムも
全て故障したそうでな。
多くの急診記録が失われている。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("しかも事故発生後、世界遺産委員会が申し出た
マクぺラの洞窟に対する緊急共同修復作業……
その提案をマサダ側は即却下したみたいだね。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("如何にも『マノ―ラっぽい』大胆な情報管制……

だけど情報封鎖の理由は？", "アニー")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("事態をさらに拗らせたくないからだろうな。", "マリル")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("衛星画像の分析ではどうも事故と思えん。

小型ロケット弾の引き起こした爆発が、
事件の起因なのではないかと推測している。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("……レジスタンスの仕業？

……えっと……でも停戦協定を結ぶんじゃ？", "レン")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("レジスタンスのリーダーがSNS上で無関係だと
表明をしてるね。
遺憾の意と事件に関する非難を語ってた。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("情報部はレジスタンス内部の別派閥による
犯行じゃないかと疑っているよ。
元々あいつら一枚岩じゃないからさ～～", "愛衣")
	await novel_interface.show_dialog("リーダーの方針では停戦を望んでいるけど、
他が協定を結びたくないとかの話じゃない？", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("可能性はあるが、現状だと憶測の域を脱せない。

ともかく、この3日間は第三学園都市にとって
最も敏感な時期となるだろう。", "マリル")
	await novel_interface.show_dialog("それに併せて警戒レベルも最高値まで
引き上げられている。
公海にいるより内城区域にいた方が遥かに
安全だ。", "マリル")
	novel_interface.change_expression("sigh")
	await novel_interface.show_dialog("まあ、今夜はゆっくり休め。
明日お前達が港に着いたら、また連絡する。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("わ、分かった！", "レン")
	await novel_interface.show_dialog("了解～～♪", "アニー")
	await novel_interface.show_text_only("……船上にいる2人との通信を切った後、
直ぐにマリルは視線を大型モニターに向ける。
モニターには赤服の女性が映っており、
通信が終わったタイミングと同時に話し始める。")
	novel_interface.show_character("akiko","serious")
	await novel_interface.show_dialog("……あなたもおかしいと思うでしょう？", "秋子")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","sigh")
	await novel_interface.show_dialog("……逆におかしいと思わないやつがいるのか？", "マリル")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("10日以内にレジスタンスと停戦協定を結ぶと、
先週にマサダ政府報道官が公表……", "マリル")
	await novel_interface.show_dialog("各国政府とメディアが全面的に称賛の声を上げ、
まぁ軍縮と停戦によって人心は掴めた。", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("──だが、この協定は急進すぎるにも程がある。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("akiko","normal")
	await novel_interface.show_dialog("慎重派なシャイネルマン首相の政治姿勢とは、
大きく矛盾しているわね。", "秋子")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("彼の持病が思ったより悪化しているのかな……？", "愛衣")
	await novel_interface.show_dialog("シャイネルマン首相は前回の平和フォーラム以来
一度も公の場に顔を出してないし。", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","sigh")
	await novel_interface.show_dialog("それは原因の1つに過ぎないかもしれん。", "マリル")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("マサダ国防軍内部の抱える矛盾は解決不可能な
状態にまで達しているのかもな。", "マリル")
	await novel_interface.show_dialog("人員と予算の削減は、歴史古くから内輪揉めの
火種を担ってきた。
軍功派の軍官達が技術派に喧嘩を売るのも
時間の問題と言えようか。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("akiko","serious")
	await novel_interface.show_dialog("国防軍内部に鎮座する学院系統出身の技術派と、
命がけで功勲を稼いできた軍功派による争い……", "秋子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは微かにうなずいた。")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("協定を結ぶとして、サインする人物に関しても
懸念の種となるだろう。
未だマサダ代表として立つのは誰になるのか、
不確定事項となっているからな。", "マリル")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("全世界の注目の中で偉大な功績を受領する者──

そんな人物が次回の選挙で勝つ可能性は？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("akiko","normal")
	await novel_interface.show_dialog("必然と言っても…………あっ。", "秋子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("秋子が何かを察したようだ。")
	novel_interface.show_character("akiko","shock")
	await novel_interface.show_dialog("調印式に影響が出ないように、マサダ側は事件を
化学品の爆発事故として片付けたい……", "秋子")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("ははっ、お前の動揺している表情は相変わらず
可愛いなぁ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("akiko","shy")
	await novel_interface.show_dialog("（小声）……変態め。", "秋子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("頬を微かに赤らめた秋子は、軽く咳払いをした。")
	novel_interface.show_character("akiko","shy")
	await novel_interface.show_dialog("──あなたは、もう見つけたの？", "秋子")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("この前に言っていた適切な「人選」を。", "秋子")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは首を振る。")
	novel_interface.show_character("liliu_uniform1","sigh")
	await novel_interface.show_dialog("シャイネルマンの爺さんがずっと定年退職せずに
今まで耐えてきた理由が身に染みて分かったよ。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──翌朝、8時40分")
	await novel_interface.show_text_only("──カジノ船「リーベルステラ」号

──VIPレストラン")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Gambling_Boat4.png")
	await novel_interface.show_text_only("船の最上部には小洒落たレストランがあって、
ここでは絶好の景色を見る事ができる。")
	await novel_interface.show_text_only("しかし肝心の空模様は雨曇りだ。

太陽に照らされず、深い暗色に染まった海面は
何か不吉な予兆のように感じる。")
	await novel_interface.show_text_only("他の乗客は昨晩の飲み放題にやられたのか、
レストラン内は俺達しかいない。")
	await novel_interface.show_text_only("貸し切り状態の中、俺は窓の外をぼーっと
眺めていた。
多少景色が変わっても水平線に代り映えはなく、
昨日と違う場所に移動した実感は湧かない。")
	await novel_interface.show_text_only("現在、俺達の乗る船はマサダ運河と呼ばれる
場所を運行している。
アカバ湾北端のエイラート港から死海西南側の
マサダブルクまでを繋げている人工水路だ。")
	await novel_interface.show_text_only("第一学園都市と第三学園都市が異質物技術を
運用して共同建設したらしい。
全長は180キロ。
両端の海抜差は430メートルにまで及ぶ。")
	await novel_interface.show_text_only("マサダのライフラインとも言えるこの運河は、
計画段階から武力衝突を伴っており、
周辺の小国家に与えた影響は良くも悪くも
甚大であると言わざるを得ない。")
	novel_interface.show_character("anne_uniform","normal1")
	await novel_interface.show_dialog("これが最後の閘門になるわけか。
物凄い工程だね……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("アニーは携帯で運河に関するドキュメントリーを
再生して俺に見せてくれる。")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("昨夜の間に俺達は海抜差が100メートル超えの
大型閘門を3つも越えたんだってさ。
カジノマネージャーさんの話だと、
午前中にはマサダ港に到着するっぽい。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺はアニーの携帯を見ながら、自分が着ている
ちょっと大きめなジャケットを軽く引っ張った。
このジャケットは国際医療救援組織の
物なんだけど──")
	novel_interface.show_character("ren_medical","shy")
	await novel_interface.show_dialog("（まさかの平均サイズだ……）

（女性用のサイズはないのか！？）", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_uniform","smile",0.25)
	await novel_interface.show_dialog("レンちゃん……どうしてジャケットの中が
ロングキャミソールとレギンスだけなの？", "アニー")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("ちょっと意味深な視線でアニーは俺を見てくる。")
	novel_interface.show_character("ren_medical","shy_left")
	await novel_interface.show_dialog("そんなに服とか持ってくるかよ！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("スケジュールの変更なんて予測できないし。
幸いにも船内のコンビニには下着とアレが……")
	await novel_interface.show_text_only("……少し恥ずかしくなって、キャミソールの紐を
引っ張った。
そもそも、これだってパジャマ用として
持ってきたヤツなのに。")
	novel_interface.show_character("ren_medical","shy_right")
	await novel_interface.show_dialog("（スカートも裾にレースが付いてるし。）

（あぁ、甲板の隙間にめり込みたい……！）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_small","happy")
	await novel_interface.show_dialog("ねぇ～ねぇ～…", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("今更になって羞恥心と格闘している俺の肩を、
シンチェンが揺らしてきた。")
	novel_interface.show_character("stardust_small","smile")
	await novel_interface.show_dialog("このお話しも終わったから、次にチェンジ！", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺はテーブルナプキンで作ったスタンドの上から
携帯を取った。
それから画面を切り替えて彼女の目の前に
戻してあげる。")
	await novel_interface.show_text_only("すると彼女は大人しく、興味深そうにアニメの
続きを見始めた。")
	novel_interface.show_character("anne_uniform","relieve")
	await novel_interface.show_dialog("この子、騒いでない時はすっごく可愛いね……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("アニーは手の中にある金平糖みたいな小粒を
調べながら、シンチェンに視線を向ける。")
	await novel_interface.show_text_only("この金色の金庫室で見つけた小粒だけど、
昨晩にアニーと合流してから新事実を発見した。
それは単純な話で小粒に触れた瞬間、
シンチェンが見えるようになったんだとか。")
	await novel_interface.show_text_only("だけどアニーは立体映像を見ている感じで、
俺みたいに触れる事はできない。")
	novel_interface.show_character("anne_uniform","normal1")
	await novel_interface.show_dialog("と言うか、これを金庫から持ち出すために、
胸の間に隠しちゃうなんてね……", "アニー")
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("……私ならできない……かな……", "アニー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("アニーはこっそり自分の胸を触った。")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("あ、あのドレスがキツめなだけだよ……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺のフォローに対して、アニーは無理矢理な
笑顔を作る。")
	await novel_interface.show_text_only("……ともかく、小粒に触れると見えるようになる
事実をマリルと愛衣に報告したところ、
シンチェンはある特殊な形式で存在する
情報集合体だと愛衣が推測を立てていた。")
	await novel_interface.show_text_only("この金平糖みたいなモノには、おそらく
シンチェンの人格に関する情報が保存されてる。")
	await novel_interface.show_text_only("例えるなら、人間の「魂」みたいな物質──")
	await novel_interface.show_text_only("魂から記憶が失われている原因については、
現段階で断定できないらしい。
時間が経ち過ぎたのか、はたまた他の原因か……")
	await novel_interface.show_text_only("シンチェンは何年も昔のコメディアニメを
興味深く見ている。")
	await novel_interface.show_text_only("その動画は俺も小さい頃に見た事がある。
結構印象的な内容だったはずだ。")
	await novel_interface.show_text_only("確かストーリーは、主人公と責任感の薄い
お母さんがジャングルで暮らしていて、
ある日奇妙な女の子と出会って……")
	novel_interface.show_character("ren_medical","bored")
	await novel_interface.show_dialog("（あれ……？ 何かデジャブを感じる……）", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_uniform","normal1",0.25)
	await novel_interface.show_dialog("レンちゃん、コンテナにあった隕石って
4000年前の地球に落ちた物なんだよね？", "アニー")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("アニーから質問が飛んで来たので、
考えるのを一時中断する。")
	novel_interface.show_character("ren_medical","normal1")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("anne_uniform","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ああ、そうだったはずだけど。
4000年前か……", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("縄文時代とか何とか時代とか……

まあ、歴史の教科書の内容はテストが終われば
あっと言う間に忘れるもんさ。")
	novel_interface.show_character("ren_medical","wry_smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("anne_uniform","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("コイツって、もしかして宇宙人じゃ……", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("アニメが笑いのツボに入ったのか、
シンチェンは爆笑していた。
それに併せヘッドホンの耳も愉快に点滅してる。")
	novel_interface.show_character("ren_medical","wry_smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("anne_uniform","relieve",0.25)
	await novel_interface.show_dialog("そうじゃないと思うよ。

むしろ彼女の笑ってる姿はアニメ見てる時の
レンちゃんにそ～っくり。", "アニー")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("えっ、そうなの？")
	novel_interface.show_character("ren_medical","wry_smile")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("anne_uniform","unhappy",0.25)
	await novel_interface.show_dialog("あのさ……
昔はレンちゃんって男の子だったんだよね？", "アニー")
	novel_interface.character_light(0.35,"worry")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("…………ん？", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("レンちゃん、もしかして以前……", "アニー")
	novel_interface.change_2nd_expression("shy")
	await novel_interface.show_dialog("……女の子に無責任な事をしたとか！？", "アニー")
	await novel_interface.show_dialog("だってこの子！
ここまでレンちゃんに懐いてるんだよ！！？ 
実は誰かとの子供じゃ……！！", "アニー")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ほぁッ！？　は、えぇッ！？

へ、へへへ、変な事を言うなよッ！！！", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("男だった頃でも、ファーストキスでさえ
出来てなかったんだぞ！？")
	novel_interface.show_character("ren_medical","panic")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("anne_uniform","relieve",0.25)
	await novel_interface.show_dialog("ほへ～～……本当かな～？", "アニー")
	novel_interface.change_2nd_expression("happy")
	await novel_interface.show_dialog("レンちゃんって純情なのかな～～？", "アニー")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("アニーは顔を近付けると、疑いの目を向けて
俺を見つめてくる。
慌てて話題を切り替える術はないかと
話題を探した。")
	novel_interface.show_character("ren_medical","shy_left")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("anne_uniform","happy",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("え、お、おい！？

アニー！　あっちの地平線を見てくれ！", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("窓を通して見える景色の向こう、東側の地平線に
忌々しい暗紅色の霧が浮いていた。")
	novel_interface.show_character("ren_medical","shy_left")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("anne_uniform","panic",0.25)
	await novel_interface.show_dialog("あれは……", "レン")
	novel_interface.character_light(0.35,"panic")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("なんだ……？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("目のあたりにする異常現象に俺とアニーは
顔を見合わせるばかり。
──そんな時、シンチェンが顔も上げず呟いた。")
	await novel_interface.show_dialog("強風により塵や砂が激しく吹き上げられ、
空高くに舞い上がる気象現象。
主に砂漠などの乾燥地域において発生しやすく、
空中に舞った砂塵で見通しが著しく低下する。
…………砂嵐だよ。", "シンチェン")

	print("=== 星尘降临篇第8话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
