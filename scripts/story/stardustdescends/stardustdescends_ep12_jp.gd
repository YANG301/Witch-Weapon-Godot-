# stardustdescends_ep12.gd - 星尘降临篇第12话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep12_script()

func play_script():
	pass

func stardustdescends_ep12_script():
	novel_interface.change_music("res://assets/audio/music/unkown/UI_Draw.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_AncientHumanEH.png")
	novel_interface.show_character("stardust_big","normal")
	await novel_interface.show_dialog("こんにちは。", "少女")
	await novel_interface.show_text_only("赤子のような綺麗な肌と金色に輝いて見える瞳。

全身から何かオーラを発しているかのようだ。")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","blush")
	await novel_interface.show_dialog("（な……なんて綺麗な人だ！）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("その顔に魅入ってしまって、挨拶してない事さえ
思い出すのに時間を要した。")
	novel_interface.show_character("ren_medical","awkward")
	await novel_interface.show_dialog("あ――ああっ！！

こここ、んにちはっ、あのえっと──", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は慌ててベンチから立ち上がり、
「どうぞ座って」と言おうとした。")
	await novel_interface.show_text_only("ロボットみたいな俺の不思議な挙動を見て、
少女は堪え切れずに笑ってしまう。")
	await novel_interface.show_text_only("彼女は骨格標本の展示ケースの前まで移動すると
ウォールナット製の枠に触れた。
何かを考えるかのような素振りをしている。")
	novel_interface.show_character("stardust_big","normal")
	await novel_interface.show_dialog("この展示ホール、いつも人が少なくて……

……古人類学に興味はありますか？", "少女")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──俺は反射的に頷いた。")
	novel_interface.show_character("ren_medical","uneasy")
	await novel_interface.show_dialog("（元々なくても、今はあります！！）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("少女は人を蕩かせるような暖かい笑顔を見せた後
展示ケースに振り返って説明を始めた。")
	novel_interface.show_character("stardust_big","normal")
	await novel_interface.show_dialog("──彼女の名前は『ルーシー』。

約320万年前に生きていたの。", "少女")
	await novel_interface.show_dialog("とある調査隊が1974年にアフリカで
彼女を発掘。
彼女は人類の祖先として最も古く、
最も欠損のない化石でした。", "少女")
	await novel_interface.show_dialog("後に、より古い化石は発見されたけど、今でも
ルーシ―は「人類の祖母」と呼ばれています。", "少女")
	novel_interface.change_expression("smile2")
	await novel_interface.show_dialog("実は「ルーシー」という名前は――", "少女")
	await novel_interface.show_dialog("調査隊が彼女を発見した時、ラジオから繰り返し
流れていた人気バンドの楽曲。
《Lucy in the Sky with Diamonds》が
由来なんですって。", "少女")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("まるでアフリカ大陸の静かな夜の星空を
300万年前に体験して語ってるかのような。
彼女の声からは嘘一つない優しい響きを感じた。")
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("「人類の祖母」か……

彼女は多くの人々の祖先であるって事？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("stardust_big","normal")
	await novel_interface.show_dialog("単純に考えるとその通りですが、事実はその限り
ではないのです。", "少女")
	await novel_interface.show_dialog("ルーシ―は最も早く直立二足歩行を達成した
人類と言われていますが、
彼女はあくまで個体群の一員に過ぎません。", "少女")
	await novel_interface.show_dialog("それに当時の人類の性別を骨盤の開口部で
判断するのは不可能だと、
一部の科学者は主張しています。", "少女")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は微笑みながら、俺の耳元へと近付いた。")
	novel_interface.show_character("stardust_big","smile1")
	await novel_interface.show_dialog("だから……

ルーシーは必ずしも女性ではないのですよ……？", "少女")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","awkward")
	await novel_interface.show_dialog("──ぇ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("慌てながら、俺は何歩も後退した。")
	await novel_interface.show_text_only("今、なんで俺にそんな話を……？

もしかして彼女は俺の秘密を探っている……？")
	novel_interface.show_character("ren_medical","shy_right")
	await novel_interface.show_dialog("（あと耳に息を吹きかけるのは止めてくれ！！）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺の驚きっぷりを見た彼女は、少し得意気な顔で
話を続ける。")
	novel_interface.show_character("stardust_big","normal")
	await novel_interface.show_dialog("ルーシ―は時が経ち過ぎていて、DNAを採取し
検証するのも不可能でした。", "少女")
	await novel_interface.show_dialog("良好な状態で保存された死体なら、サモントンの
遺伝子分析技術で血縁関係を鑑定できたのに……", "少女")
	await novel_interface.show_dialog("過去に6000年前のミイラからDNAを採取して
現代の遺伝子データベースと照合した結果、
その末裔を見つける事もできましたからね。", "少女")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("凄すぎるだろ――！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("この子は地元の医学生だったりするのか？

だけど服装や顔立ちはマサダ人じゃないように
見えるしなぁ……")
	novel_interface.show_character("stardust_big","smile1")
	await novel_interface.show_dialog("前回で私も知ったのだけど……", "少女")
	novel_interface.change_expression("close_eye")
	await novel_interface.show_dialog("人類の祖先は本当に凄いと思います。", "少女")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は話しながら展示ケースの後ろに回って、
俺の視界から外れていく。")
	await novel_interface.show_dialog("アフリカを旅立ち、肥沃な三日月地帯を越え……

多くの困難を克服して、彼らは世界中の各所へと
到達しました。", "少女")
	await novel_interface.show_dialog("最も寒い場所でも、最も暑い場所でも。

昼が続く場所でも、夜が続く場所でも──", "少女")
	await novel_interface.show_dialog("海を渡り、海の向こう側まで辿り着くなんて……", "少女")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("そ、それって……")
	novel_interface.show_background("res://assets/images/bg/Fabiola/Mother.png")
	await novel_interface.show_text_only("小さい頃、母さんが読み聞かせてくれた本──")
	await novel_interface.show_text_only("その本の文章は強く記憶に残っている。")
	await novel_interface.show_text_only("未だに本の名前は分からないまま……")
	await novel_interface.hide_background()
	novel_interface.show_character("ren_medical","normal2")
	await novel_interface.show_dialog("ねえ、君はどこからそれを……！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──そこで俺は気付く。

展示ケースの後ろは暗闇の空間が広がっていた。

彼女の声の聞こえる場所が海碧に点滅して輝く。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Stardust.png")
	await novel_interface.show_text_only("光の中心に彼女がいて、周囲の空間は朧げな
暗闇に飲み込まれた。")
	await novel_interface.show_dialog("これなら伝わったかな……", "少女")
	await novel_interface.show_dialog("────私達が約束した通り。", "少女")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("約束…………？

私達…………？")
	await novel_interface.show_text_only("虚無から彼女の最後の声が届く────")
	await novel_interface.show_dialog("あなたは、髪を伸ばしても似合いますね……", "少女")
	await novel_interface.show_text_only("俺の質問を待たずに彼女の姿が消え去っていく。

まるで最初から存在しなかったかのように──")
	await novel_interface.show_text_only("何故か心の中から悲しみが溢れて、
目から涙が零れた……")
	await novel_interface.show_text_only("なんだよこれ……

ちょっと待ってよ……")
	await novel_interface.stop_music()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("おい…………")
	await novel_interface.show_text_only("おいってば――！！！")
	await novel_interface.show_text_only("…………………………………………………………

……世界が回っている。

誰かが俺の身体を揺すってるのか？")
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_AncientHumanEH.png")
	novel_interface.show_character("emilio","stare")
	await novel_interface.show_dialog("おーい、お嬢さん？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("えっ……？", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","speechless",0.25)
	await novel_interface.show_dialog("あなたって本当に……
こんなところで寝るなんて、風邪引きたいの？", "エミリオ")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……少尉さん？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("……さっきのは……夢なのか？")
	await novel_interface.show_text_only("心の中のモヤモヤが張り付いて取れない。

俺は顔を揉んで涙を拭き、気持ちを何とか
改めようとする。")
	novel_interface.show_character("ren_medical","normal2")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("emilio","speechless",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("君が何故ここに……", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal")
	await novel_interface.show_dialog("作戦中に回収した文化財が偽物かどうか
鑑定してもらうためよ。
そしたらあなたがベンチの上で寝ているから。", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("少し寝癖のついた髪の毛を整えながら
携帯を確認する。
脳内はさっきの女の子との出来事でいっぱい
だけど……")
	novel_interface.show_character("ren_medical","panic")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("emilio","normal",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……ってうわっ！？ もうこんな時間っ！？！？", "レン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("寝ていたのは10分ぐらいだと思ったが、
時刻を見るとすでに1時間半も経過していた。")
	await novel_interface.show_text_only("3時間の「国史講習」はどうなったかと言うと、
とっくの15分前に終わっている。")
	await novel_interface.show_text_only("急いで俺はベンチから立ち上がった。

長時間座ったせいでお尻にくっついた
キャミソールを軽く引っ張り、
恥ずかしがりながらも少尉さんへ話す。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("本当に起こしてくれて助かったよ。
危うく遅刻するとこだった……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("講習が終了したらマリルの手配した大使館の
スタッフと合流して、
シンチェンと一緒に入国管理局で手続きする
予定になっている。")
	await novel_interface.show_text_only("博物館の外に彼女達の車が……はふんっ！？")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("んにゃ～～……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("──突然、首にチクッとした痛みが伝わった。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("振り返る間もなく視界がぼやける。

手足から段々と力が抜けて、身体が後ろに……")
	await novel_interface.stop_music()
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──その後すぐのSID作戦指令室")
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform1","angry")
	await novel_interface.show_dialog("行方不明だとッッ！？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは素早くレポートを読んでいく。

大使館の運転手はレンと会えなかったようで、
携帯は圏外で繋がらないとの報告だった。")
	await novel_interface.show_text_only("レンに付けさせている追跡装置からの信号も
博物館の範囲内にて途絶していた。")
	await novel_interface.show_text_only("博物館を含めたマサダ内城区域の公共監視設備は
マノ―ラのサーバーに繋がっているため、
ハッキングしようにも時間が掛かる。")
	await novel_interface.show_text_only("時々行方不明になるのは承知の、おバカな子だが
今回はマリルも予想していなかったようだ。")
	await novel_interface.show_text_only("モニター前にいる愛衣は左手で鉛筆を回しつつ、
同時に何枚もの衛星監視画像を確認している。")
	await novel_interface.show_text_only("──鉛筆を回すのは、愛衣が脳を本気で
フル回転させている時の癖だ。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("たぶんこれだよ……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣がマリルに見せたのは、博物館の地下駐車場
から1台の装甲車が離れていく画像だった。")
	await novel_interface.show_text_only("低高度の偵察衛星で撮った画像ではないため
解像度的にも角度的にも、
ナンバープレートを識別するのは不可能である。")
	await novel_interface.show_text_only("だが、写真の時間は信号が途絶した時間と一致、
この装甲車で連れ去られたと考えて良いだろう。
しかし多分岐している地下道を移動経路に
使われたため、肝心の行方は特定できない。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("あれは装甲兵員輸送車F-950 SWAT TRUCK。

車体は電磁波を遮断する上に一定量の放射線まで
通さない仕様だね。", "愛衣")
	await novel_interface.show_dialog("自動車爆弾やゲリラの襲撃から身を守るために、
マサダは異質物で補強した特殊装甲の乗り物を、
100台以上配備しているみたい。", "愛衣")
	novel_interface.change_expression("think")
	await novel_interface.show_dialog("マノ―ラの仕業かな？

ほら、レンちゃん達ってイルカの管理人やらと
争った事もあるし……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは真剣な表情で頭を振った。")
	novel_interface.show_character("ai","think")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("liliu_uniform1","serious",0.25)
	await novel_interface.show_dialog("──可能性は極めて低い。

あいつはレンの本当の価値を理解していない
からな。
わざわざ今日にリスクを負ってまで
動くはずがない。
他の学園都市も同じ理由で動かないだろう。", "マリル")
	novel_interface.character_light(0.35,"normal")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……停戦協定の事？", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("五大学園都市の全てがマサダに秘密拠点を
持っているとしてもだ。
この重大かつ緊張度の高いタイミングで動くのは
あまりの暴挙とも言える。", "マリル")
	await novel_interface.show_dialog("現にマサダと仲が悪いニューモリダスや
サモントンでさえ今日に限っては大人しい。", "マリル")
	novel_interface.change_2nd_expression("normal1")
	await novel_interface.show_dialog("眼前にある「世界平和の破壊」と言う悪名を
率先して欲しがる人間はいないだろう？", "マリル")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("だとすると国防軍の内部で何者かが動いたって
考えるべきかな……", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("愛衣はモニターに資料を表示した。")
	novel_interface.show_character("ai","normal")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("liliu_uniform1","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("映っていた装甲車は手に入れるにしても
バカ高い値段で売られているし、
重火力無人ヘリの『イエローヘッド』と
同レベルの暗号化が施されているよ。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("仮にハッキングでの乗っ取りが成功したら
マサダ外部の犯行も疑えるけど。
マサダの採用する防御モジュールと同じ物が
破られたとなれば、
今頃は国中で蜂の巣をつついたような大騒ぎに
発展しているはず。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("レンの携帯は衛星との接続が中断された瞬間、
自動で録音機能が起動するよう設定されている。", "マリル")
	await novel_interface.show_dialog("信号が回復した瞬間、予備電源で録音した内容と
位置情報が送信されるだろう。", "マリル")
	novel_interface.change_2nd_expression("sigh")
	await novel_interface.show_dialog("今は様子を見るしかないか……", "マリル")
	await novel_interface.stop_music()
	await novel_interface.hide_all_characters()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──頭痛がする。")
	await novel_interface.show_text_only("──デジャブのような猛烈な頭痛だ。")
	await novel_interface.show_text_only("誰かが脳にセメントを流し込んで、
じわじわとかき混ぜているかのようだ……")
	await novel_interface.show_text_only("頭の中がガンガンと鳴り、激しい耳鳴りが
俺を襲う。")
	await novel_interface.show_text_only("俺は……どこだ？")
	novel_interface.change_music("res://assets/audio/music/Story_01.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPC.png")
	await novel_interface.show_text_only("俺はゆっくりと目を開けた。

少しずつ瞳孔が周囲の光に適応し始める。")
	novel_interface.show_character("emilio","normal")
	await novel_interface.show_dialog("──目が覚めた？", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("小さい身体に合わせて薬の量を調整したのは
正解だったわね……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は親切な感じに俺へ話しかけてくると、
ティッシュ箱を渡してくれた。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("ほら、これでヨダレを拭いて。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","normal2")
	await novel_interface.show_dialog("うっ……　こ、ここは……？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("装甲輸送車の中みたいだけど……

この車の型式はロシア訛りの英語を話す
成金野郎の動画で見た事があるぞ。")
	await novel_interface.show_text_only("異質物で強化されている、リッチなお値段の
輸送車だったっけか。
まさか俺に乗れる日が来るとはラッキー……")
	await novel_interface.show_text_only("──って違うッ！

なんで俺は装甲輸送車なんかに
乗せられてるんだよッ！？")
	await novel_interface.show_text_only("手持ちの端末で俺の顔をスキャンする少尉さん。
端末の画面には「認証成功」と表示されている。")
	await novel_interface.show_text_only("意識がハッキリとしてきた俺は自分の身体を
色々と触って確認した。
怪我はないけど、携帯がなくなっている。")
	await novel_interface.show_text_only("刺されたような痛みを首に感じると、
ようやく状況が飲み込めた──")
	novel_interface.show_character("ren_medical","serious")
	await novel_interface.show_dialog("（おいおいおいおい、まさか……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("（コレって誘拐じゃ！？！？）")
	await novel_interface.show_text_only("隣の少尉さんをチラっと見ると、
何故かマシンガンの薬莢を点検している。
どう考えても俺を誘拐するのに、その重火器は
必要ないと思うけど……")
	novel_interface.show_character("ren_medical","serious")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("emilio","mock",0.25)
	await novel_interface.show_dialog("──ねぇ、ちょっと聞いて良い？", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("少尉さんは顔を近付けて、ニヤニヤしながら
話し始める。")
	novel_interface.show_character("ren_medical","serious")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("emilio","mock",0.25)
	await novel_interface.show_dialog("あなたって新豊洲から来たのよね？
……元老院の人？", "エミリオ")
	novel_interface.character_light(0.35,"wry_smile")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("え、えぇ……？", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("それとも……SID？", "エミリオ")
	novel_interface.character_light(0.35,"wail")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("ヒィッ！", "レン")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"smile")
	await novel_interface.show_dialog("なるほどぉ、そっちかぁ～～", "エミリオ")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("（どどどうやって分かったの！？）")
	await novel_interface.show_text_only("──引き続き「尋問」は続く。")
	novel_interface.show_character("emilio","normal")
	await novel_interface.show_dialog("筋肉が全然ないから、フィールド要員でない事は
確定として……", "エミリオ")
	await novel_interface.show_dialog("昨日あの子にバーコードをプレゼントしたのは
覚えているわよね？
あれをスキャンしたら国防軍のイントラネットに
偽装したサイトへとアクセスするのだけど。", "エミリオ")
	await novel_interface.show_dialog("特に何も気付いていない様子だから、
技術スタッフという可能性も低いだろうし……", "エミリオ")
	novel_interface.change_expression("speechless")
	await novel_interface.show_dialog("……そうじゃないと流石にポンコツすぎる。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は俺の首に手を回すと、わざと声のトーンを
低くして問い詰めて来る。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("確かSIDの試験は非常に厳しかったはず……", "エミリオ")
	await novel_interface.show_dialog("裏口から入ったんでしょう……？
何か特殊なコネでも持ってるのかしら？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("（ある意味、100点満点で正解です！！）")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("ね、やっぱりだよね、レンちゃん？

末端のSIDのメンバーだとしても何故か
ネームプレートの権限が異様に高いんだもの……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("（なんか何も喋ってないのに全部バレて
　行くんだけど！？）
（このままだと俺の秘密が全てバレちゃう！？）")
	await novel_interface.show_text_only("俺は本能的に身体を竦めて怯える小動物みたいに
頭を隠した。
何にも知らないふりを決め込もうとする。")
	await novel_interface.show_text_only("対してエミリオは優しい表情を絶やさず、
軽く俺の背中を叩いた。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("怖がらなくていいわよ♪

私達はあなたの偽装した身分を借りて、
ちょっと物資を調達したいだけ。
あなたに害を成すつもりもないし、
夜になる前には戻るから！", "エミリオ")
	await novel_interface.show_dialog("事が済んだら安全に出国できるようにも
してあげる。
何なら昨日の子も一緒に連れて。
だからね……", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("あなたの携帯はしばらく私が預かりまーす！
問題ないわよね？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("（問題ないです！　ご、ごゆっくりどうぞ！！）")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("ありがとね～～！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("（一言も喋ってないぞ俺……）

（もしかしてテレパシーとかできちゃったり？）")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("実はそうなの……", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("（嘘だろッ！？）

（お、ほぁ―ぁぁ――――――
　な、なにも考えるなぁ……ッ……俺ッ！！）")
	await novel_interface.show_text_only("俺はもっと頭を隠そうと頑張る。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("こうしましょう、私に2つだけ質問して。

全て正直に答える事を保障するから。", "エミリオ")
	await novel_interface.show_dialog("そうすればあなたも少しは安心できるかしら？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……表情から誠意を感じるし、悪意は感じない。
そう思うとちょっとは俺も気持ちが落ち着いた。")
	await novel_interface.show_text_only("（……なら、教えて欲しい）

（どうやって俺をエージェントと見破った？）")
	novel_interface.show_character("emilio","speechless")
	await novel_interface.show_dialog("……………………………………………………

……………………？

えっ、嘘でしょ？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("お腹を抱えて彼女は笑いだす。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("あはははは！ レンちゃん本当に可愛いわね！", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("心の中で質問をしたのね？
私が本当にテレパシーできると思って！", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("…………え？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("表情と癖だけでバレバレよ。
あなた対尋問訓練を受けた事ないでしょ？", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("尋問なら受けた経験だけは多いんだけどね。

分かりやすくて悪かったな！")
	novel_interface.show_character("ren_medical","shy")
	await novel_interface.show_dialog("あの、ど、どうやって俺を見破ったの……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("顔が真っ赤になるぐらい恥ずかしいが、
この質問だけは何としても聞いておかないと……")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("カジノ船で初めて会った時、必死に何かを
隠してたのは分かったから。", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("自分からボロを出さないかなぁ～って
気付かないフリしてたのよ。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("こいつ良い人だと思ってたのに……
俺って本当にバカ！")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("あなたが身分証を取り出した瞬間は、
私も誤魔化せずに笑いそうになったけど……", "エミリオ")
	await novel_interface.show_dialog("だって、あんなの下手すぎるでしょ？

いくつか偽造した身分を用意するとは思うけど、
あの場面で「看護師見習い」って。", "エミリオ")
	await novel_interface.show_dialog("少なくともカジノのVIPクラスじゃないと
金庫室へ入る事はできないのに、
どうやって誤魔化すつもりだったのかしら？", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("私の方がバレないように努力する羽目に
なるなんてね。
あの時は言い訳を一瞬で閃けて良かったわ。", "エミリオ")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	await novel_interface.show_dialog("その服装からすると、お嬢様はNGOの
宣伝映像に洗脳された感じかしら？", "エミリオ")
	await novel_interface.show_dialog("……それとも社会経験を積んで、大学の単位を
少しでも増やしたいのかな？", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPC.png")
	await novel_interface.show_text_only("そういう事だったの！！？

上手く誤魔化せたと思ったのに！")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("だから君は……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","normal")
	await novel_interface.show_dialog("お互いに掴んだのがデマ情報だったのは
不幸中の幸いね。
異質物は発見できず仕舞いで収容隊も成果なし。

任務としてあなたを捕まえる意味は、
何ひとつ無くなっちゃったから。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("発見できずって……あの黒い石棺は？

俺が触れた後に異質物の特性を失ったのか……？")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("まあ、全貌はそんな感じなんだけども……

折角だし思ったのよ。

こんな珍しい子に出会える機会も滅多に無いし、
ちょっとした私事に利用できないかなって。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("「私事」か……

彼女の「私事」ってやつは随分と物騒な
気がする……")
	await novel_interface.show_text_only("──俺は車内を見回した。

山のように積まれた装甲材や設備、
加えて各種の重火器が取り揃えられている。")
	await novel_interface.show_text_only("そして車外状況を映し出しているモニターは……

すでに俺達が隔離壁の近くまで到達した事を
示していた……")

	print("=== 星尘降临篇第12话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
