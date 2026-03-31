# stardustdescends_ep4.gd - 星尘降临篇第4话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep4_script()

func play_script():
	pass

func stardustdescends_ep4_script():
	novel_interface.change_music("res://assets/audio/music/Story_01.mp3")
	novel_interface.change_background("res://assets/images/bg/Fabiola/Hospital_Passage.png")
	await novel_interface.show_text_only("──数時間後

──播磨脳研、科学総合研究センター")
	await novel_interface.show_text_only("白衣の銀髪少女はイヤホンを通じて会話しながら
タブレットの上に指を滑らせていた。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("大丈夫だって。あのお利口さんの2人なら
スヤスヤと夢の中で、お散歩中さ。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("ふふ、人間の脳における立場の合理化は
凄まじいのだよ。
その強い意志と能力を甘く見ちゃいけない。", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣がチラッと病室の方を見た。

そこには黒いスーツを着た2人の男が、
脳潜入装置の上に横たわっている。")
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("自分の考えた物語こそが、最も自分を騙す事に
適してるってね～～", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼らの様子を見て、ニヤリと笑いながら
愛衣は目線をタブレットに戻した。
そうして画面を見直した時に……
ふと気掛かりなデータを発見する。
彼女は素早く画面をスクロールして、
何度もデータを確認した。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("おいおいおい、なんですかこのデータは……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("……どうした？", "マリル")
	novel_interface.show_character("ai","dizzy")
	await novel_interface.show_dialog("レンちゃんとニュクスの額が接触した時、
監視カメラ上のボルツマン探針が一瞬だけ、
「振り切った」じゃないか！？", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("故障という可能性はないよな？

お前の調整で理論上は極値まで情報量を測定
できるようになったんじゃないのか？", "マリル")
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("あくまで限りなくベッケンシュタイン境界の
近くまで測定できるようにしただけさ。
それ以上の測定は私にできないよ。", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("でも探針が振り切ったと言う測定結果は大きい。

それによって測定範囲以上の情報量が出た
と言う事実が分かるからね。
あの一瞬で激増した情報量は、物質の持ち得る
エントロピーの限界値に間違いなく迫った！", "マリル")
	await novel_interface.show_text_only("愛衣はタブレットを使い超高速で計算を始めた。")
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("その現象を考慮しなければ、ニュクスは魔女と
特徴データが完全に一致しているけど……
当の本人は気付いてない様子だね？", "愛衣")
	await novel_interface.show_dialog("ラファエルの時と似ている状況なのか？
ソヤを別任務に派遣しなければよかったのに……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣は文句を言いつつ、異常データを観測した
時間帯の監視映像を開いた。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("機械の故障は絶対に無いと言い切れるわ。

読み取った数値はすぐに正常に戻ったし、
そもそも回収した際も機材は良好な状態だった。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("あの時に意識を失ったのはレンちゃんだけ。
その場にいる他の人に全く影響はなかった……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("脳内で何度も仮説と検証を繰り返し、
愛衣が最後にたどり着いた唯一の結論は──")
	novel_interface.show_character("ai","blush_dizzy")
	await novel_interface.show_dialog("……2.5YBまで暴増した情報を1秒未満で
全てレンちゃんが吸収したなんて……
……あり得ると思う？", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("自分で出した結論ではあったが、愛衣自身も
信じられない様子だった。")
	await novel_interface.show_dialog("……YBって、どれぐらい大きい単位だったっけ？", "マリル")
	novel_interface.show_character("ai","blush_dizzy")
	await novel_interface.show_dialog("そう、10の24乗バイトが1YB（ヨタバイト）。

それだけで戦前のインターネットが保有した
全ての情報量を超えているって言うね……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("興奮の余りに、声の震えを抑えながら
愛衣は喋っている。")
	novel_interface.show_character("ai","blush_dizzy")
	await novel_interface.show_dialog("あの可愛い頭の中には、ゲームの攻略情報以外
何も入らないと思っていたのに……！", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("そう言えば10の24乗の単位は確か
「禾予」（じょ）だったな。
施教授から手に入れた情報にも記載が
あったんじゃないか？", "マリル")
	novel_interface.show_character("ai","blush_stare")
	await novel_interface.show_dialog("華雲宮城の古代隕石との関連性も検証しないと
だね……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣は施教授から入手した情報をスクリーン上に
表示させた後、しばらく考え込んだ。")
	novel_interface.show_character("ai","blush_wink")
	await novel_interface.show_dialog("うぅーむ……
この件はレンちゃんを頼るしかないかも。", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.hide_background_with_fade()
	await novel_interface.stop_music()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──5日後

──リバーナカジノ船「リーベルステラ」号")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Gambling_Boat.png")
	await novel_interface.show_dialog("……そちらのお嬢さん。", "ディーラー")
	await novel_interface.show_dialog("お嬢さん？", "ディーラー")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("お……え……？", "レン")
	await novel_interface.show_dialog("フォ、フォールド……", "レン")
	novel_interface.change_expression("perspire1")
	await novel_interface.show_dialog("すみません、次のゲームは止めときます～～", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("少女はポーカーテーブルから離れると、
人気がない通路の曲がり角へと向かった。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("さっき持ってた役はフラッシュだったぞ！？ 
何でゲームを降りなきゃいけないんだよ……！", "レン")
	await novel_interface.show_dialog("（小声）
しかも直前にいっぱいチップを賭けたのに……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("声を抑えるが、俺はゲーマーとしての悔しさを
言葉に隠しきれない。")
	await novel_interface.show_dialog("ちょっとレンちゃん、独り言はダメだって！
せめて携帯で電話するフリとかしようよ。", "アニー")
	await novel_interface.show_dialog("まだ船にある3つの監視室の中で、
1つしか掃討できてないんだから……", "アニー")
	novel_interface.show_character("ren_full","wail")
	await novel_interface.show_dialog("（そっ、掃討？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("さほど大きくないカジノ船ではありますが、
至るところに監視カメラが設置されていますね。
耳のイヤホンが発覚した時は、鮫の餌として
海に投げ捨てられるのでしょうね。", "ニュクス")
	await novel_interface.show_text_only("背筋が寒くなって来たので、すぐにバッグから
携帯を取り出した。")
	novel_interface.show_character("ren_full","upset")
	await novel_interface.show_dialog("……これからどうします？

すでに元手の8割ぐらいまで手持ちが
減っているんですけど……
元手の倍は勝たないとVIPルームに、
入れないんでしょう？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("現在のチップ数が表示されるブレスレットを
見てみると、堪らず深いため息が出てしまう。
これはマリルのお金だ、マリルのお金……！")
	novel_interface.show_character("ren_full","sob")
	await novel_interface.show_dialog("（と言っても結局は新豊洲市民の血税だよな！）", "レン")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Baizhu/BG_Dispatched_Ship_Aisle.png")
	await novel_interface.show_text_only("そうやって悩んでいる俺の上空、高度30000m
ではSIDの高速大型輸送機が飛翔している。
ニュクス先輩は輸送機の中で、紅茶を片手に
スクリーンを見つめていた。")
	novel_interface.show_character("nyx_normal","normal1")
	await novel_interface.show_dialog("あなたの手札はダイヤの2と6だけ。

公開カードと合わせればフラッシュにはなるけど、
相手の挙動を見る限り、あっちもフラッシュを
作っていた可能性が高いわ。
しかも手札の数字もあなたより上だったはずよ。", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("えっ！！？

てっきり俺はオールインで全力勝負だと
思ってたんですけど……", "レン")
	novel_interface.show_character("nyx_normal","speak")
	await novel_interface.show_dialog("はぁ……", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("救いようがないと言わんばかりの深い溜め息を
先輩が吐いた。
昨夜ずっと5000万チップに対してヨダレを
垂らしていたお馬鹿さんに、
どう説明すれば理解して貰えるのかを
思案している。")
	novel_interface.show_character("nyx_normal","normal2")
	await novel_interface.show_dialog("良い役が揃っても、すぐにレイズやオールインを
するのはミステイクです。
逆もまた然りで、手が弱ければフォールドに
直行する考えも改めましょう。", "ニュクス")
	await novel_interface.show_dialog("特に初心者は良い役が揃うと頭に血が昇り、
テーブル上の戦略や情報を見逃しがちです。
俗に言うティルトなどは無駄の極まりですし……", "ニュクス")
	await novel_interface.show_dialog("無知は恐怖を招き、恐怖はリスクヘッジできない
アグレッシブなプレイを生んでしまいます。
初心者ほど心の恐怖を晴らすために、
よくオールインと言う攻めに逃げるのよね。", "ニュクス")
	novel_interface.change_expression("sad")
	await novel_interface.show_dialog("全てのチップをポットに賭けた瞬間こそ、
追い詰められた魂は自由を感じるの……", "ニュクス")
	await novel_interface.show_dialog("結果として、相手はその行動から
次に何を選ぶかを簡単に予測できるのよ。", "ニュクス")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("多くの人は良い役が揃っても勝てません。

最終的にもっと優れた役を相手が持っていて、
容易くバストアウト……", "ニュクス")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("一晩で全財産を失うタイプって、そんな感じの
お馬鹿さんばかりですからね？", "ニュクス")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("ヒィッ！？", "レン")
	await novel_interface.show_text_only("鋭い矢が突き刺さったかのように、俺の身体は
意図せずビクンッと動く。")
	await novel_interface.show_text_only("それを見た先輩は満足げに紅茶を啜った後、
優雅な動作で話を続けた。")
	novel_interface.show_character("nyx_normal","mock")
	await novel_interface.show_dialog("……良くお聞きなさい？

テキサス・ホールデムは心理の銃口を向けながら
順番にアクションを起こしていくゲームです。", "ニュクス")
	await novel_interface.show_dialog("自分の手札に一喜一憂している場合ではなく、
狩り取るべき相手に関心を持つ事が重要なの。", "ニュクス")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Choice.png")
	await novel_interface.show_dialog("フォールド、コール、レイズ――
降りるか続けるか、賭け金を上乗せするか。
このゲームでは基本的に3つのアクションを
必ず選択しなければならないわ。
限定的で逃げ場のない縛りだけど、
それは相手も同じ──", "ニュクス")
	await novel_interface.show_dialog("あなたの厳守するべき原則はひとつだけ、
「行動の根拠」をバレないようにする事。
相手のアクションを選択しやすくなるような
余計な情報を渡すなど愚の骨頂ですから。", "ニュクス")
	await novel_interface.show_dialog("理想とするなら、全ての選択が正しく見せるか、
もしくは全ての選択が誤りに見せるか。
その状態に陥れる事ができれば合格かしらね。", "ニュクス")
	await novel_interface.show_dialog("な、なるほど……", "レン")
	await novel_interface.show_dialog("最善の手が見つからない時の決断は、
全てに苦痛と迷いが伴ってきます。", "ニュクス")
	await novel_interface.show_dialog("心と意志の永久的な拷問を受けるかのように。

精神を削れば削って行くほど、
早く解放されたいと考えるようになるのです。", "ニュクス")
	await novel_interface.show_dialog("そこまで追い込めば盤面は支配できるわ。

相手を完膚なきまでに喰らい尽くす
最高のタイミングですよ。", "ニュクス")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("喰らい……尽くす……？", "レン")
	await novel_interface.show_text_only("唾を飲み込みながら、先輩の教えに恐々と頷く。")
	await novel_interface.show_dialog("（どこで先輩はこんな事を覚えたんだ……）", "レン")
	await novel_interface.show_dialog("（とにかく、今後この人とは絶対ポーカーで
　勝負しないって決めたぞ！！）", "レン")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Gambling_Boat.png")
	await novel_interface.show_text_only("先輩から圧倒的な勝負強さを感じ取った俺は、
もう何も言わず大人しく従う事にした。
ポーカーテーブルに戻って先輩の助言を受けつつ
ゲームをプレイしていく。
すると1時間も経たずして手持ちのチップが
倍になってしまった。")
	await novel_interface.show_text_only("凄い……のだけど一番儲けたゲームに関しては、
先輩の助言とかあまり関係なかった。
あの時は先輩と愛衣が俺の寝相について
話していたのだ。")
	await novel_interface.show_text_only("しかも話すだけに留まらず、写真の交換まで
やり始めたんだあの2人は！
こっちは聞いてるだけで恥ずかしかったわ！！")
	await novel_interface.show_text_only("そんな事情も知らず、俺の慌てた表情を見て
目の前の相手はブラフと思ったらしい。
俺のオールインに付き合ってくれた。")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("お陰でポーカーには勝てたけど……

気持ち的にはフォールドなんですが……", "レン")
	await novel_interface.show_dialog("うあああぁぁ、もう考えるの止める！", "レン")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Gambling_Boat3.png")
	await novel_interface.show_text_only("船の係員さんに案内されて、ようやくカジノの
VIPゾーンへと入る事ができた。")
	await novel_interface.show_text_only("さっきまでいたホールとは全く違う景色だ。

内装、室内装飾から椅子の材質までもが、
ホールの物よりも明らかに高級品である。")
	await novel_interface.show_text_only("洗礼された服装の男性3人がポーカーテーブルで
微酔していた。
遠くのソファではナイスバディなお姉さん達が
会話に興じている。")
	await novel_interface.show_text_only("元々「リーベルステラ」号は、上流階級に
属する人間だけを客層とした小型カジノ船だ。
船自体は灰色の装甲に覆われており、
非常に控え目な外観をしている。")
	await novel_interface.show_text_only("この船に乗船するには最低でも2000万チップを
購入する必要がある。
しかも客も数十人いるかどうかといったところだ。")
	await novel_interface.show_text_only("そしてVIPゾーンへ入るためには、
リバーナに点在するカジノの中で、
累計5000万以上を儲ける事が条件となる。")
	await novel_interface.show_text_only("俺はマリルの指示に従い、1億の現金を
黄金のチップ1枚と交換した。
表面には美しいリバーナの紋章が刻まれている。")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("これがあの伝説の……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("外殻の素材を異質物で作成した事により、
衝撃、磁場、高温にも耐えられるらしい。
しかも全世界のカジノで即換金可能だ。")
	await novel_interface.show_text_only("言ってみれば全世界共通で使用できてしまう
最高額の無記名債権である。")
	await novel_interface.show_dialog("よし、船の監視システムを抑えた！
いつでもOKよ！", "アニー")
	await novel_interface.show_text_only("ようやく……
イヤホンから安心できる声が届いた。")

	print("=== 星尘降临篇第4话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
