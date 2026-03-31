# stardustdescends_ep18.gd - 星尘降临篇第18话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep18_script()

func play_script():
	pass

func stardustdescends_ep18_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Psychology.png")
	await novel_interface.show_text_only("心の痛みを経験するのは誰もが通る道だ。

重くて、焦らされて、抉られて、耐え難くて。")
	await novel_interface.show_text_only("だが、あなたは知っているだろうか？

人間の心理的苦痛はほとんどが後天的に
習得されるものだと。")
	await novel_interface.show_text_only("食事を満足にできるだけでも幸せだと感じる
子供達がいたとして。
彼らがSNSで同級生から仲間外れにされる
孤独の苦痛を理解できるはずもない。")
	await novel_interface.show_text_only("仲間に溶け込めない、周囲に認めてもらえない、
想像している自分になれない……")
	await novel_interface.show_text_only("以上のような苦痛は全て複雑な概念の根元に
建てられたものであり、
後天的に習得した意味が重なり合った結果から
生み出された副産物に過ぎないのだ。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Camus.png")
	await novel_interface.show_text_only("──アルベール・カミュは著作で語った。

人間はたとえ「無意味」な宇宙の中であっても
「意味」を永遠に探し続ける。
その行為こそが人間の不条理な部分であると。")
	await novel_interface.show_text_only("本当の自由は「意味」という枷がある限り
如何にしても手に入らない。")
	await novel_interface.show_text_only("「意味」から離れるなど人類の文明には不可能。

何故なら「意味」は各時代を通して見ても
社会体系の基礎であるから。")
	await novel_interface.show_text_only("家筋の意味、国の意味、君主の意味、宗教の意味
国民意識、思想形態、大衆文化まで。")
	await novel_interface.show_text_only("「意味」の体系が脳内に刻まれた人間は
自然に様々な概念を形成してしまい、
価値観の階段を作り上げてしまう──")
	await novel_interface.show_text_only("称賛に値すべきもの、唾棄すべきもの、
幸福と栄光、苦痛と羞恥。")
	await novel_interface.show_text_only("政権交代が苦痛のあまりに自殺する者もいれば、
アイドルの結婚を知って自殺する者もいる。
2つの苦痛を馬鹿らしいと思うのか。

それとも共感できると思うのか。")
	await novel_interface.show_text_only("あなたが本当に賢い人間であるのならば、
枷を外せる機会が訪れるかもしれない。
その時は籠の外へと一人だけ飛び出して
自由に散歩する事ができる。")
	await novel_interface.show_text_only("だけど、ひとしきり自由を堪能した後は
枷の付いているフリをするだろう。
そして籠の中にいた時と同じ素振りで、
皆の賞賛や卑しめに同調する。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Prisoner.png")
	await novel_interface.show_text_only("どうしてそうなるのか？
賢いあなたなら気付いているはず。
人間は単なる「意味」の囚人に留まらない。

自ら望んで「意味」の牢番をしているのが、
人間であるのだ。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("……………………")
	await novel_interface.show_text_only("…………")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_ConventionCentre.png")
	await novel_interface.show_text_only("──マサダ国際会議場

──開催前の調印式会場")
	await novel_interface.show_text_only("現場には数百社の記者達が詰め寄せていた。

間もなく来たるであろう歴史的瞬間を収めようと
撮影機器をチェックしながら待機している。")
	await novel_interface.show_text_only("照明の群が緊張感を掻き立てるかのように、
薄暗く光る中で、
壇上の後ろに掛かっている青いカーテンへ向けて
今か今かと熱い視線を注いでいる様子だ。")
	await novel_interface.show_text_only("視線が青いカーテンに集中している理由は
後ろに控え室が設置されているからだろう。
その控え室には本日の主役とも言える人物が
待機している。")
	await novel_interface.show_text_only("壁を包む遮音板とカーテンの防音加工により、
粛然とした空気が漂う控え室。")
	await novel_interface.show_text_only("静寂な空間を尻目に灰色のスーツを着た男が
通路へと歩き出した。
向こう側に立っている砂漠仕様の迷彩服を着た
軍官に用事があるようだ。")
	await novel_interface.show_text_only("小太りな体付きであるが整った髪型をしており
眼光は殺気を感じる程に鋭い。")
	await novel_interface.show_text_only("神妙な面持ちで敬礼を向ける軍官に対して
軽く頷く様は見るからに威厳が伺える。
それもそのはず、彼こそが記者達の目的であり
歴史的瞬間の立役者になろう人物──
調印式のマサダ側代表である国防軍北方司令、
ハモン陸軍少将その人であった。")
	await novel_interface.show_dialog("……少将、おはようございます。
先ほどの襲撃に関して報告いたします。", "少佐")
	await novel_interface.show_text_only("軍官は少将の顔色を確認してから恐る恐る
話し始めた。
迷彩服に刺繍されてある襟章から見て
彼の階級は少佐。
金色の六芒星をシンボルとしている事から
マサダ国防軍の所属である事が分かる。")
	await novel_interface.show_text_only("少将は苛立ちを見せながらネクタイを外すと、
手にある黒革カバーのタブレットに挟み込んだ。")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("こいつにはどうも慣れないな……", "ハモン")
	await novel_interface.show_dialog("まあ、報告を聞こうではないか。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("およそ30分前に起きた会議場南西方向の
爆発についてですが……", "少佐")
	await novel_interface.show_dialog("主に砂糖を材料としたIED（即製爆発装置）に
よるものだったと判明しました。", "少佐")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("……シュガーボムだったのか。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("煙が大量発生するように作成されていただけで
威力自体は低い代物でした。
死傷者は言うまでも無く0人です。", "少佐")
	await novel_interface.show_dialog("すぐさま現場に急行して人員を配置、
既に煙の対処は終わっております。
本件についてのメディアによる報道も
今のところ行われておりません。", "少佐")
	await novel_interface.show_dialog("容疑者の足取りは現在捜査範囲を拡大して
追っております。
しかし周辺道路の監視映像などを調査しても、
痕跡などは残されておらず、
未だ発見までに至っていない状態です。

──以上が報告となります。", "少佐")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("……………………

……以上が報告だと？", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("言葉を最後まで聞いたハモンは少佐の眼を
真っ直ぐと睨み付ける。
恐怖のあまり少佐は口が開かなくなり、
その場に立ち尽くす事しかできない。")
	await novel_interface.show_text_only("「ふんっ」の不満そうな声と共に、
ハモンは少佐の胸へタブレットを押し付けた。")
	novel_interface.show_character("hamon","speak")
	await novel_interface.show_dialog("自分の目で確かめてみろッ！", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("バランスを崩しながらも慌ててタブレットを
手に取る少佐。
画面には『マノ―ラ』の象徴となる7つの燭台の
ロゴマークが表示されていた。")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("……数分前に送られてきた情報だ。", "ハモン")
	await novel_interface.show_dialog("地下駐車場に3人の不審者が潜入していたのを
彼奴ら『マノ―ラ』が発見した。", "ハモン")
	await novel_interface.show_dialog("その内の2人がエレベーターシャフトへ潜入して、
ビルの消防システムの破壊を謀ったのだ。", "ハモン")
	await novel_interface.show_dialog("彼奴らのエージェントが1名の拘束に成功し、
無傷の1名と負傷状態の1名は逃走中。
今も全力で捜索に当たっている。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("エ、エレベーターシャフトですって！？

この会議場に潜入した者がいたなんて……", "少佐")
	await novel_interface.show_text_only("──ハッと少佐は気付く。")
	await novel_interface.show_text_only("まさか爆発は我々の注意を逸らすための
囮だったのか……？")
	await novel_interface.show_text_only("地上の駐車場は守備部隊と軍用車両が
占有しているため、
メディア設備の運搬用車両などは全て
会議場の地下に止まっている。")
	await novel_interface.show_text_only("内部へと潜入するならば、確かに地下駐車場が
最適な入口であろう。")
	await novel_interface.show_text_only("軍事情報局では会議場内のありとあらゆる場所に
監視網を敷いていた。
しかしエレベーターの底下は流石に死角である。")
	await novel_interface.show_text_only("自らが手配した防衛網が容易く破られた事実に
少佐は身体中から冷や汗を噴き出す。")
	novel_interface.show_character("hamon","speak")
	await novel_interface.show_dialog("貴様ら情報局は会議場の警備を自信満々に
請け負ったのだよな？", "ハモン")
	novel_interface.change_expression("shout")
	await novel_interface.show_dialog("わざわざマノ―ラを外部警備へと回したのに、
俺の面子を潰すつもりか！？", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("カーテンを挟んだ先に記者がいる事を考慮して、
音量を控えつつハモンは怒鳴った。")
	await novel_interface.show_dialog("こ、これは……申し訳ございません！

私めの失態であります！", "少佐")
	await novel_interface.show_dialog("し、しかしマノ―ラのエージェントは会議場の
外に配置されていたはずでは……
何故ビルの中の出来事を……？", "少佐")
	await novel_interface.show_text_only("ハモンは頭を横に振りながら少佐の肩を叩く。")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("あの記者連中の内にもマノ―ラの者が
潜んでいるのだろうな……", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ハモンは分かっていた。

軍内部より数年間をかけて育て上げた組織でも
マノ―ラの足元には及ばない事を。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Speech.png")
	await novel_interface.show_text_only("「彼らはこの国の神経であり細胞である。
　危険に対して常に最速で反応せしめる組織だ」")
	await novel_interface.show_text_only("「飛んできた敵の矢を反射的に躱せなければ
　矢が当たって死ぬだけであろう」
「矢を躱すには彼らが必要であると知れ」")
	await novel_interface.show_text_only("制約無しの最高行動権をマノ―ラが持つ理由を
議会へ説明する際、
ハモンの叔父であるシャイネルマン首相が
度々口にしていた台詞だ。")
	await novel_interface.show_text_only("しかしハモンは納得していない。

自分が制御出来ない組織が全ての情報を
保有している現状に。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("情報を渡すのは権力を渡すにも等しい。

これは対外、対内とも戦い続けて積み重ねた
ハモンの経験則である。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_ConventionCentre.png")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("それと──", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ハモンは意味深く少佐を見つめた。")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("捕らえた1名は、カラカル大隊の女少尉だ。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("み、身内の犯行なのですか！？", "少佐")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("しかも『タルピオット』の生徒らしい……", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("多大な含みを持ってハモンは言葉にする。")
	await novel_interface.show_text_only("本件の引き起こせる政治的影響に気付いた少佐も
思わず息を呑んだ。")
	await novel_interface.show_text_only("停戦協定に対しては国防軍内部にも少なからず
反対の声が上がっている。
特に軍功を収めたい若手の将官達からは
多くの異議の申し立てがあった。")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("現場から採取した指紋の鑑定結果によると……

数日前の入国審査にて登録された外国人が、
彼女と共に行動していたようだ。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("まさか……諸外国の工作員が煽動を？", "少佐")
	await novel_interface.show_text_only("両の眉をしかめたハモンは、しばらく沈黙する。")
	novel_interface.show_character("hamon","speak")
	await novel_interface.show_dialog("…………可能性の否定はできん。

大人しく協力せん事など分かってはいるが、
マノ―ラに情報の共有を要請しておく。", "ハモン")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("捕えた少尉の身柄は上の階のセーフハウスに
確保しておいた。
彼女の事はお前に一任する。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("了解しました。", "少佐")
	await novel_interface.show_text_only("外したネクタイを静かに付け直してから、
ハモンは憂いのある表情で俯いた。")
	novel_interface.show_character("hamon","speak")
	await novel_interface.show_dialog("……調印式の始まりは間もなくだ。

……これ以上はトラブルが起こらぬように
周囲を警戒してくれ。", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("少将、ご安心ください！", "少佐")
	await novel_interface.show_text_only("そして背を向けて、少しだけ間を置いた後に、
再び少佐へ言葉を投げかける。")
	novel_interface.show_character("hamon","serious")
	await novel_interface.show_dialog("あと……軍服を着用していない俺の事を
階級で呼ばなくて良い。", "ハモン")
	await novel_interface.show_dialog("軍人による政府を、もう国民達は望んでない。

……分かったな？", "ハモン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("りょ、了解ですっ！", "少佐")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("……………………n
──マサダ国際会議場、室外駐車場")
	await novel_interface.show_text_only("──装甲兵員輸送車内")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPCRS.png")
	await novel_interface.show_dialog("こぉんのボケタレェェェッッッ！！！！

何をどう考えたら相手の懐に飛び込むんだッ！？", "マリル")
	await novel_interface.show_text_only("イヤホンに自動音量調整機能が無かったら
今頃、俺の鼓膜は木端微塵になっていただろう。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("うぅうぅ……ぁうぅ……", "レン")
	novel_interface.change_expression("wry_smile")
	await novel_interface.show_dialog("だ、だって……その、えと……", "レン")
	await novel_interface.show_dialog("ず、ずっと連絡が取れなかったんだもん……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("先程まで俺は輸送車の遮断モードを切るために、
必死にコントロールパネルと戦っていた。
何とかマリルに通話を繋ぐ事ができて今に至る。")
	await novel_interface.show_text_only("「ドンッ！！」と言う大きな音がイヤホンの
向こう側から聞こえてきた。
マリルがデスクを力強く叩いたのであろう
光景が脳裏に浮かんでくる。")
	await novel_interface.show_dialog("……だからって勝手に行動したのか？", "マリル")
	await novel_interface.show_dialog("最近は直々に調教していなかったから、
随分と緩んでしまったようだな。
喜べ、また鞭で叩いて教えてやろう。
手取り足取りな……", "マリル")
	await novel_interface.show_text_only("怒りに満ちた叫びから脅迫力満点の低いトーンに
声が切り替わるマリル。")
	await novel_interface.show_text_only("噴火準備が完了した火山の唸り声みたいで、
恐ろしさのレベルがどんどん上がっていく。")
	await novel_interface.show_dialog("まぁまぁ、そんなに怒ってやらないでよ～", "愛衣")
	await novel_interface.show_text_only("愛衣が優しい親戚のおばさんのような感じで
俺のフォローへと入ってくれた。")
	await novel_interface.show_dialog("体力測定オールＤのレンちゃんがこんな作戦に
自ら参加するなんてさ。
勇気だけは褒めてあげるべきだと思うよ？", "愛衣")
	await novel_interface.show_text_only("待って、それはフォローになってないから！！
ただの俺の悪口になってるからそれ！！")
	await novel_interface.show_text_only("そ、そもそも愛衣を頼りにするなんて考えが
ダメなんだ。
こうなったら自分で説明するしかない。")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("ほ、星が……消えたんだよ……", "レン")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_SlumArea.png")
	await novel_interface.show_dialog("昨晩は晴れていてスラムじゃ光も少ないから、
星空がはっきりと見えていたんだ。", "レン")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_SlumArea1.png")
	await novel_interface.show_dialog("だけど、あいつらがスラムを通り過ぎる時、
空に星が1つも見えなくなった。", "レン")
	await novel_interface.show_dialog("それからは通信設備を使っても電波が
届かなくなって……", "レン")
	await novel_interface.show_dialog("普通の電波妨害装置じゃないと思ったんだ。", "レン")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("……どういう意味だ？", "マリル")
	await novel_interface.show_dialog("教会周辺でエルガノを捕まえた時の夜と
状況が全く一緒なんだよ！", "レン")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Church.png")
	await novel_interface.show_text_only("あの夜もマリルとの通信が突然切断されて、
辺りも怪しい雰囲気に――")
	await novel_interface.show_text_only("遠くにあるビル達が急に歪んだように見えて、
清らかな夜空も一瞬にして暗く霞んだ。")
	await novel_interface.show_dialog("あの時も、空にあった星が消えたんだ。", "レン")
	await novel_interface.show_dialog("黒い兵員輸送車が教会に突入して来たのは、
その後からで……", "レン")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadAPCRS.png")
	await novel_interface.show_text_only("しばらくの間、マリルが沈黙する。

俺は親からのお叱りを待つ子供みたいに、
息を呑んだ。")
	await novel_interface.show_dialog("……だからお前は大人しく彼女達に付いて行き
無謀な特攻に加担したと？", "マリル")
	await novel_interface.show_text_only("仕方なさそうに吐いたマリルの溜め息が
イヤホンからは聞こえてきた。")
	await novel_interface.show_dialog("軍事学校を卒業していない生徒だとしてもだ。

こう言った場合は専門機関に連絡すべきとさえ
彼女達は習っていないのか？", "マリル")
	novel_interface.show_character("ren_medical","upset")
	await novel_interface.show_dialog("スラムを離れてからエミは軍隊だけじゃなく、
警察や情報機関にも報告していたよ。
テロ通報のホットラインにまで連絡したのに、
相手の返答はどれも同じような感じでさ……", "レン")
	await novel_interface.show_dialog("「情報のご提供ありがとうございます」

「お問い合わせ頂いた場所へ速やかに向かい
　調査を致します」って。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ギャングの闘争により銃撃戦が勃発しても、
スラムでは日常茶飯事として済まされる。
夜中に武器を持った通行人がいたって、
ごく普通の事。
各機関の人達の反応も平常運転に過ぎない。")
	await novel_interface.show_text_only("元より一般的なマサダ市民から見れば、
夜のスラムに現れる通行人なんて、
全員がテロリストみたいなものだ。")
	novel_interface.show_character("ren_medical","upset")
	await novel_interface.show_dialog("あいつらにマサダの城壁は突破できないって、
一応だけどエミは言っていた。
スラムから離脱するのも不可能みたい。", "レン")
	novel_interface.change_expression("perspire1")
	await novel_interface.show_dialog("でも、もし車に積んでいるのが本物の爆弾で、
調印式に合わせて起爆するとしたら……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("戦いの引き金となるのは目に見えているんだ。

隔離壁だけじゃなく周囲一帯も巻き込まれて、
そうなったら、孤児院は……")
	await novel_interface.show_dialog("過激派どもの大きな目論見を察知したは良いが、
連絡した機関の反応が無いに等しく、
事件性を露呈させるべく彼女達と襲撃を装って、
調印式の延期を画策したと言う流れだな。", "マリル")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("うん……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("で、今になって私に連絡してきたとして、
本当に連絡が取れなかったのか？
聞いている限りでは電波妨害のあったスラムを
離れてから……
遮断モードが起動された輸送車の内部以外なら、
幾らでも連絡手段を使えたと思うのだが？", "マリル")
	await novel_interface.show_text_only("声の凶悪さが急上昇した。

言葉に合わせてリズム良く指関節を鳴らす音が
イヤホンから伝わってくる。")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("……あ、あの。

そ、それはですね……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("どうやら誤魔化すのに失敗したみたいだ。

マリル火山が噴火したかもしれない。")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("ごごごご、ごめん、ごめんなさい！！
俺がバカでしたッ！！", "レン")
	await novel_interface.show_dialog("連絡しなくてごめんなさい……

俺が全部悪かったんです……", "レン")
	await novel_interface.show_dialog("で、でも……エミ……

エミが……だから……", "レン")
	await novel_interface.show_dialog("エミが捕まっちゃったんだよぉぉ……！！！", "レン")
	await novel_interface.show_dialog("ううぅぅぅぅ……ひっぐ……えっぐ……！！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("緊張、焦燥、後悔。

抱えていた沢山の感情が一気に押し寄せてきて、
意思と関係なく涙が止まらなくなった。")
	await novel_interface.show_dialog("……はぁ、バカが。", "マリル")
	await novel_interface.show_text_only("呆れた様子で言葉を失うマリルだったが、
声色を冷静に切り替えて話を続ける。")
	await novel_interface.show_dialog("国防軍の人間かつタルピオットの優等生と言う
免罪符が彼女にはある。
実質的な破壊行為だって何も起こしていない。", "マリル")
	await novel_interface.show_dialog("通報内容も各機関が録音しているだろうから、
彼女の動機は証明に足り得る。
祖父とやらも一族の面子が掛かっている関係上、
放って置かないはずだ。", "マリル")
	await novel_interface.show_dialog("故に今一番の最悪はお前が捕まる事であると
理解しておけ。
認識次第では彼女達の行動理由を証明する術も
外部介入の疑える性質へ一変してしまう。", "マリル")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("はい……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("私情や感情論を抜きにした冷たい口調だけど、
簡潔な状況整理をしてくれた。
マリルは動揺した俺を落ち着かせる時に、
良くこのような話し方をする。")
	await novel_interface.show_dialog("他に質問は？", "マリル")
	novel_interface.show_character("ren_medical","shy")
	await novel_interface.show_dialog("もうちょっと優しい感じに慰めて貰えたら
嬉しいのですが……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("まともな行動を取ってから言え。", "マリル")
	await novel_interface.show_text_only("──頷きながら顔を拭う。

鼻水が止まらず顔もグジャグジャだけど、
涙は溢れなくなった。")
	await novel_interface.show_dialog("さっき言った事が全て理解できたのなら、
今は大人しく車内でジッとしていろ。
幸いにも砂嵐が間もなくマサダに到着する。
見込みよりは時間を稼げるはずだ。
その間に脱出するチャンスを見つけ出す。", "マリル")
	novel_interface.show_character("ren_medical","upset")
	await novel_interface.show_dialog("彼女達が乗っていた車に居続けるのは、
むしろ危なくないか……？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("車両が彼女達用に配備された物であるならば、
特定される危険性は高いな。
しかし、自分達の情報が捕捉されるような車両を
物資強奪には使わないだろう？", "マリル")
	await novel_interface.show_dialog("襲撃の件もこちらで調べておくが……

調印式に合わせて襲撃が起きたとしても、
お前が置かれている状況に変わりはない。", "マリル")
	await novel_interface.show_dialog("いずれせよ、油断ならないと忘れるな。

今から関連部署の指揮を執る兼ね合いで
別チャンネルに切り替えるが、
いつでもお前の声を聞けるように接続自体は
そのままにしておく。
何かあればすぐに言え。", "マリル")
	novel_interface.show_character("ren_medical","upset")
	await novel_interface.show_dialog("分かった。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("………………………………………………

イヤホンからはホワイトノイズが消えると、
マリルの声は聞こえなくなった。
俺は狼狽える心を出来る限り正常に戻そうと、
何度も深呼吸をする。")
	novel_interface.show_character("ren_medical","upset")
	await novel_interface.show_dialog("（砂嵐なんて……）

（ゲームとか映画でしか見た事ないけど……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("とりあえず車両に搭載されているカメラで
外の様子を見渡してみた。")
	await novel_interface.show_text_only("会議場周辺は薄紅色の弱い光に包まれており、
早朝特有の澄んだ空気が立ち込めていそうだ。
今の爽やかな景色からは砂嵐の気配など、
微塵も感じない。")
	await novel_interface.show_text_only("しかし適当にモニターの映像を切り替えて、
朝のニュースを確認してみると、
黄砂によって1メートル先の景色すら見えない
死海東岸の様子が中継されている。")
	await novel_interface.show_text_only("もう少し経つと同じ光景になるのか……

西岸のこっち側も……")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──新豊洲、SID本部")
	novel_interface.show_background("res://assets/images/bg/SID/opsRoom.png")
	await novel_interface.show_text_only("レンとの通信をマリルがミュートした時。

秋子とのリアルタイムの通信映像だけしか、
大画面には映し出されていなかった。")
	await novel_interface.show_dialog("あなたが途中で責めるのを止めるなんて……", "秋子")
	await novel_interface.show_text_only("秋子は普段のマリルと対応が異なる事に気付き
不思議に感じている様子だ。")
	novel_interface.show_character("liliu_uniform1","jest")
	await novel_interface.show_dialog("あいつはすでに自白したではないか。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("……自白？", "秋子")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("自らの意志で2人に付き添ったとな。

危機が迫ったら自分の能力で2人を助けれるかも
などと考えていたのだろう、あのバカは。", "マリル")
	await novel_interface.show_dialog("私から許可は絶対得られないと知っているから、
わざと報告しなかったのだろうさ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","dizzy")
	await novel_interface.show_dialog("いや、レンちゃんが自白したというよりは
誘導尋問だったよね？
そう言うとこ性悪なんだからマリ……おぶっ！？", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルのチョップをナチュラルな流れで受けると
愛衣は自分の机に突っ伏した。
そのまま置いてあった小瓶をマリルに取られて、
中身をゴクゴクと飲まれてしまう。
小瓶にはエナジードリンクが入っていたようだ。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("自分の心理状態さえ把握できていないバカに、
誘導尋問なんてしても無駄だ。", "マリル")
	novel_interface.change_expression("sigh")
	await novel_interface.show_dialog("と言うか、お前もう起きたのか？

まだ数時間ぐらいしか寝てないだろう？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("この前ランボットがマリルに押し付けていた
睡眠時間を短縮できる効果の異質物。
アレを私のオフィスに置いてるんだよ。", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("確か安全性評価から落ちた物では？

作用次第で精神錯乱に陥る可能性も高いから
気を付けた方が……", "秋子")
	novel_interface.show_character("liliu_uniform1","sigh")
	await novel_interface.show_dialog("元々錯乱しているようなヤツが使用したところで
今さら影響でもあると思うのか？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("エナジードリンクを全て飲み干したマリルは、
空になった小瓶を愛衣の頭に乗せる。")
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("レンちゃんの説明を正しいとするならさ～

この件も連合議会の裏で暗躍していた組織が
関与してそうに疑えるけど。", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","serious")
	await novel_interface.show_dialog("どうだろうな……", "マリル")
	await novel_interface.show_dialog("全周波数の電波を一定エリア内にて妨害できる
異質物兵器が現れたのは、
西アジアの戦地が最初だったはずだ。", "マリル")
	await novel_interface.show_dialog("仕組みに関しては当事者であるランボットから
色々と聞いた。", "マリル")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("あれの効果は電波を条件下で遮断するのではなく
捻じ曲げていると言う認識が正しいらしい。
発信源が遠方であるほど歪曲させる力が増すため
衛星の強力な信号すらも妨害できる性能を持つ。", "マリル")
	await novel_interface.show_dialog("光まで細長い線のように屈折させてしまうから、
人の目にも影響を及ぼすそうだ。
空の星が消えたのは肉眼で捉えられないほど、
光度が減衰しただけに過ぎない。", "マリル")
	await novel_interface.show_dialog("国際平和フォーラムの開催期間中に天国の扉の
レプリカを奪おうとした特殊部隊も、
この異質物兵器を使用していた事から、
私は一つの推測を立てた。", "マリル")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("兵器自体を開発したのはマサダ軍であり、
連合議会に何らかの協定を通じて、
関連技術を『渡した』のではないかと。", "マリル")
	await novel_interface.show_dialog("そのような兵器を保有しているかについて、
マサダは公に認めていないが……
彼らが大量の非公認兵器を未だ持っている関係上
言葉全てを鵜呑みにできんからな。", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("しかし、もう1つの可能性もある──", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("ありゃ？", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは頭に小瓶を乗せたままの愛衣に向けて
小瓶を落とさずキープするようにと、
サーカスの調教師みたいなサインを出した。")
	novel_interface.show_character("liliu_uniform1","serious")
	await novel_interface.show_dialog("発想を『逆転』させても違和感が無いんだ。

西アジアの戦場にはマサダ軍のみならず、
相対した『もう一方』が存在するよな？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("あなた……まさか……", "秋子")
	novel_interface.show_character("liliu_uniform1","serious")
	await novel_interface.show_dialog("仮に兵器はレジスタンスが開発した物だとして。

連合議会に何らかの取引材料として共有したと、
考えたらどうなるか……", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……………………

……沈黙に陥る指令室。

刺激的な考察が飛べば騒ぎ出すであろう愛衣も
今回ばかりは静かであった。
頭の小瓶を微動だにさせず黙り込んでいる。")
	await novel_interface.show_dialog("……飛躍した推測すぎるわ。", "秋子")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("お前はおかしいと思わないのか？", "マリル")
	await novel_interface.show_dialog("自らがテロ組織と認定したレジスタンスを相手に
連合議会は積極的な行動を示さない。
南米の軍閥問題を容易く解決できる力があれば、
手の打ちようは幾らでもあるはずだ。", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("その事実すらも、あの男の計画だとしたら……", "マリル")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Mouchard.png")
	await novel_interface.show_text_only("マリルはモニターにワリード・ムシャルの
プロフィールを表示する。")
	await novel_interface.show_dialog("絶望的な戦力差と装備差があるにも関わらず、
レジスタンスが生き延びて来たのは、
わざとマサダが見逃しているからに過ぎないと、
世界中の人々はそう思っているだろう。", "マリル")
	await novel_interface.show_dialog("市民の死傷や輿論などを気にしなければ、
1週間足らずで何とかなる──
レジスタンスなんて簡単に壊滅できるだろうと、
世界は大きな勘違いをしている。", "マリル")
	await novel_interface.show_dialog("このレジスタンスのリーダーについてだが、
SIDでも掴んでいる情報は少ない。
妻と娘が殺害されてからの活動経歴などは、
追いかけても何一つ見つからず仕舞いで、
データとして存在するのは学者時代に
公開されていた物だけだ。", "マリル")
	await novel_interface.show_dialog("大学の元同僚や教授達に彼の評価を聞くと、
一重に天才だったと口を揃える。
同時に家族を深く愛していた事でも評判の
男だった。", "マリル")
	await novel_interface.show_dialog("心の奥底からマサダを深く恨んでいる切れ者が、
国防軍の傀儡に収まるだけとは思えない。", "マリル")
	await novel_interface.hide_background()
	await novel_interface.show_dialog("しかし、改めて逆転の発想をしてみると……", "マリル")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Kidnap.png")
	await novel_interface.show_dialog("レジスタンスが理事会メンバーの娘を狙った
例のニューモリダスの事件──", "マリル")
	await novel_interface.show_dialog("第2回国際平和フォーラムの開催期間中から
すでに形勢は覆っていたのかもしれない。", "マリル")
	await novel_interface.show_dialog("奴らは不正規に入手したマサダの無人武装ヘリを
市街地で暴れさせる事により、
理事会が多方面から圧力を受けるように仕向け、
戦時債券を発行中止にまで導いた。", "マリル")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform1","sigh")
	await novel_interface.show_dialog("第二学園都市からの資金を断ち切ってしまえば
マサダは案外と脆いものだったんだ。
維持できない軍事力は負担へと変貌を遂げ、
足枷となって国全体を徐々に蝕んでいく。
軍縮へと至るまでに追い込まれたマサダの現状は
自然な流れで起きた出来事などではない。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("恐ろしく効果的な経済面への攻撃だった訳ね……", "秋子")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("丁度その辺りからレジスタンスは派閥に分かれて
内部分裂を始めた。
大よそ組織全体に崩壊の兆しが見えて来たのかと
傍からは思えてしまうが……", "マリル")
	await novel_interface.show_dialog("派閥や分枝が細胞分裂のように生まれ続けて、
実際はむしろ、勢いが強まった。
レジスタンスのリーダー達を殲滅しても、
全ての作戦に勝利を収めても、
沈まぬ組織と化したレジスタンスは無限にも近く
湧き出し続ける。", "マリル")
	await novel_interface.show_dialog("もうマサダは戦争するにも苦しいのだろう。
軍用施設を市民救助施設に偽装している事が、
疲弊の何よりの証だ。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("大胆な仮説だが、数分間で一連の証拠を繋げて、
衝撃の結論にまで至るマリル。")
	await novel_interface.show_text_only("自分のために先生を容易く論破してくれた、
マリルの学生時代の姿を秋子は思い出す。")
	await novel_interface.show_text_only("──思わず秋子は頬が赤くなった。")
	await novel_interface.show_text_only("そんな反応をバレないように隠す秋子をよそに、
マリルはモニターへと視線を外さず語り続ける。")
	novel_interface.show_character("liliu_uniform1","normal1")
	await novel_interface.show_dialog("一時的な勝負が行われようとも構わず、
味方に被害を出そうと気にも留めない。", "マリル")
	await novel_interface.show_dialog("綿密な計算と純粋たる理性で打ち出す復讐。", "マリル")
	novel_interface.change_expression("sigh")
	await novel_interface.show_dialog("このような相手から二の矢三の矢と受けて、
遂に喉元まで迫っていると意識した時、
シャイネルマン首相は座して死を待つだけ
だったのだろうか？
何かしらの手を打ったとするならば……", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("まさか、『自動反撃システム』！？", "秋子")
	await novel_interface.show_text_only("悟った秋子に、マリルが軽く頷いた。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("チェス盤上で圧倒的不利な局面を打開するのは、
チェックメイトされないようにするしかない。", "マリル")
	await novel_interface.show_dialog("システムが世界全土を巻き込むと知っていて、
尚もレジスタンスが攻撃の意志を示した場合、
世の中は全世界への宣戦布告と位置付けて、
阻止する動きを見せるだろう。", "マリル")
	novel_interface.change_expression("jest")
	await novel_interface.show_dialog("そうなればレジスタンスとの間にいくら強固な
約束があったとしても、
連合議会はマサダに協力せざるを得ない。", "マリル")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("方法の強引さを他国から批判されようとも、
首都と国のエリート達さえ無事であるならば、
残された力で改革や方向転換などを経て、
マサダは国家の存続が実現できる。", "マリル")
	await novel_interface.show_dialog("シャイネルマンの逆転の一手に対して、
ムシャルの対策は……", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("はい、は～い！", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("頭の小瓶をそのままに愛衣が手を挙げた。")
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("色々大変なのは承知だけどさ。

まずはレンちゃんの救出計画を先に考えるべき
じゃないの？", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","jest")
	await novel_interface.show_dialog("あのバカは放っとけ。", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣の予想に反してマリルの返答は辛辣で、
更に秋子も似た様な反応を示している。")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("……へっ？", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("彼女の置かれている状況は如何なる救出方法でも
一定のリスクが発生するわ。
しかも今回の相手はマノ―ラよ。", "秋子")
	novel_interface.show_character("liliu_uniform1","sigh")
	await novel_interface.show_dialog("砂嵐を利用しての救出は現実的でない。

何日も前から予報されていた天気など
対策済みに決まっている。", "マリル")
	novel_interface.change_expression("jest")
	await novel_interface.show_dialog("今回ばかりは捕まるまで待ってから交渉した方が
得策だろう。", "マリル")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("情報でも権限でもマノ―ラとの交渉材料は
SIDにいくらでもあるからな。", "マリル")
	await novel_interface.show_dialog("レンの能力がバレてしまう可能性に関しても、
問題は無い。
今のマサダは自分達の商品を売り込むのが優先で
付け入る隙はいくらでもある。", "マリル")
	await novel_interface.show_dialog("SIDとランボットから直接脅迫を掛ければ、
彼らは理性的な選択を確実にするだろうさ。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","think")
	await novel_interface.show_dialog("なるほど……", "愛衣")
	await novel_interface.show_dialog("ヴィラとかいう怪力娘ちゃんも行動しているけど
彼女はどうするの？", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("ヴィラの目標はセーフハウスだったよな？", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マサダでは長年に渡るテロ攻撃の経験から、
集会などを開催する場所に対策を講じている。
セーフハウスも国防軍の共通保安対策として
定められた物のひとつである。")
	await novel_interface.show_text_only("突発的に出入口の安全を確保できない状況や、
VIPの保護、重要容疑者の拘束など、
様々な緊急時にセーフハウスを利用する事が、
許されている。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("この情報をヴィラの父親に伝えてくれ。", "マリル")
	novel_interface.change_expression("jest")
	await novel_interface.show_dialog("総参謀部の位にある人間が如何な行動をするか
高みの見物と洒落込もうじゃないか。
自分の娘が虎口に入ろうとしている時は
一体どうするだろうな？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","wink")
	await novel_interface.show_dialog("本当に性悪だねマリル……", "愛衣")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform1","serious")
	await novel_interface.show_dialog("お前のヘンテコな性格よりはマシさ。

それより重要なのは──", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルは片手で自分の腹部を押さえながら、
モニターの映像を切り替えた。
目の前に映し出されたのはニュースの生中継だ。")
	await novel_interface.show_text_only("小太りのハモンと白いアゴヒゲのムシャルが、
調印式会場で長い握手を交わしている。
両者の表情は眉毛すらも固まっているかのように
ピクリとも動かない。")
	novel_interface.show_character("liliu_uniform1","angry")
	await novel_interface.show_dialog("隠していた自身の姿を今になって公衆の面前に
曝け出す理由はなんだ？
ムシャルが何か勝負の一手を企んでいるのは……

間違いな……い……", "マリル")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("………………？

マリル、顔色悪いわよ……？", "秋子")
	await novel_interface.show_text_only("マリルの腹部から「グ――」と言う音が
聞こえてきた。
直後、彼女は一言も発さずに指令室から
飛び出して行く。")
	await novel_interface.show_dialog("…………………………", "秋子")
	novel_interface.show_character("ai","blush_dizzy")
	await novel_interface.show_dialog("あらま……", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("愛衣は小瓶を慎重に頭から降ろした。

そしてハザードシンボルが印刷された
密封パックに入れる。")
	await novel_interface.show_dialog("そのエナジードリンク……

絶対に普通の物ではないわよね？", "秋子")
	novel_interface.show_character("ai","blush_think")
	await novel_interface.show_dialog("ちょびっとだけ成分を足したかな……？", "愛衣")
	await novel_interface.show_dialog("24時間に分けて少しずつ飲みながら効果を試す
つもりだったんだけど。", "愛衣")
	novel_interface.change_expression("blush_stare")
	await novel_interface.show_dialog("まさかマリルが一気に飲み切っちゃうなんて～♪", "愛衣")

	print("=== 星尘降临篇第18话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
