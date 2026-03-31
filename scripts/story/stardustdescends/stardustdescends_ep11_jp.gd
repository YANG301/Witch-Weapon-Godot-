# stardustdescends_ep11.gd - 星尘降临篇第11话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep11_script()

func play_script():
	pass

func stardustdescends_ep11_script():
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MasadMuseum.png")
	novel_interface.show_character("ren_medical","normal1")
	await novel_interface.show_dialog("マサダ国家博物館……ってここだよな？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ちゃんと目的地に到達してるか心配になり、
俺は携帯の地図を開いて確かめた。")
	await novel_interface.show_text_only("わざわざ確認をしなければいけない程に、
博物館の見た目には驚かされる。
半地下の空間に展示室がほとんど埋まってる
なんて想像の範疇ではない。")
	await novel_interface.show_text_only("正門入り口にそびえ立つ黒い石壁も特徴的だ。

こいつの内部には旧都神殿の丘の西側外壁にある
廃墟の石材が仕込まれているらしい。")
	await novel_interface.show_text_only("放射線を防御する黒い素材で表面を包んでるのは
何度も経験した傷と苦難のせいなのだろうか。")
	await novel_interface.show_text_only("例えるなら、巨大な墓だろう。
老人達は首を垂れながら壁を撫でている。
彼らが捧げているのは哀悼の意か、
それとも祈祷なのか……")
	novel_interface.show_character("ren_medical","uneasy")
	await novel_interface.show_dialog("受付はこっち……？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("先に進むと無人の受付カウンターがあったので、
俺はネームプレートを使って登録を行い、
顔のバイオスキャンを完了させた。")
	await novel_interface.show_text_only("このネームプレートは国際医療救援組織の
暗号化通行証である。
交戦区域を出入りする医療人員のために
設計されたものだ。")
	await novel_interface.show_text_only("個人情報と医療記録が保存できる他――

これを使えば全世界のあらゆる組織の通信設備と
救援物資を利用する事ができる。")
	await novel_interface.show_text_only("中にはオフラインで使用可能な仮想通貨さえも
入っているようだ。
と言っても、そちらに関しては誘拐された時の
身代金用であるのだが……")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（ただの看護師の見習いにここまでの権限は
　必要ないだろ。）
（マリル……俺は心配になってきたぞ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("危険な任務とかをする羽目にならないように
祈ろう……")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_FirstExhibition.png")
	await novel_interface.show_text_only("俺は階段を下って第一展示ホールへと入った。

狭めの空間の中には石の彫刻品が、
数多く陳列されている。")
	await novel_interface.show_text_only("良く見ればハッキリと分かる風食の痕跡は、
歴史の流転を代弁しているかのようだった。")
	await novel_interface.show_text_only("まあ、歴史に興味を持てない俺にとっては、
それ以上何も思う事はないのだけど……
今は如何にして3時間耐えるかを考えよう。")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("……え？

あれってガイドさん！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("AI音声が当たり前となっている今のご時世に、
人が案内するガイドなんて久しぶりに見た。")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("（特にマサダって人口も少ないし……）

（貴重な労働力を割いて良いのか……？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("見た目は60代ぐらいのおじさんだ。

真っ白な髭に黒色の丸い帽子、スーツの襟には
スタッフ証が付いている。")
	await novel_interface.show_text_only("彼は周囲にパンフレットを配りながら
優しい笑顔で、訪ねてくる人達を案内していた。")
	await novel_interface.show_text_only("ちょっと気になったので俺も近付いてみる。

どうやら観光客に博物館の歴史を紹介している
最中のようだ。")
	await novel_interface.show_dialog("多くの貴重な文化財は、以前の国家博物館と共に
戦争によって破壊されました。", "ガイド")
	await novel_interface.show_dialog("この新博物館では現在、世界各地の文化財を
守るため様々な活動に取り組んでおります。
近年では西アジアとアフリカの貴重な品々を
保管する事に成功しました。", "ガイド")
	await novel_interface.show_text_only("俺はパンフレットの裏面をちらっと見る。

エジプトのミイラと青銅の仮面が
裏面で紹介されていた。")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("（余所の展示物だったヤツだろこれ！？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("昔と違って現存する大体の重要文化財は、
六大学園都市のどこかしらが保管してるから、
こういった事例は別に珍しくないけどさ……")
	await novel_interface.show_text_only("視線を戻すとガイドさんが案内をしながらも、
ポケットにずっと左手を入れている事に気付く。")
	novel_interface.show_character("ren_medical","bored")
	await novel_interface.show_dialog("（なんか変わった宗教的なやつかな？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("あぁ。多分暇過ぎてちょっとした事でさえ
気になり始めているのかも……
今日は安息日じゃないから博物館の来館者が
非常に少ない。
それに他のNGOメンバーもいないから、
看護師見習いを演じる必要もなくて気が抜ける。")
	await novel_interface.show_text_only("しかし、NGOメンバーの規則に準じて
「国史講習」の手順だけは守らないといけない。
最初の講習内容は30分以上を掛けて
歴史館と史料館を見学する事だ。")
	await novel_interface.show_text_only("故に勝手に移動できず、適当に周囲を観察して
どうにか俺は退屈を凌いでいる状態である。
今は子供達を引き連れた地元民っぽいグループに
視線を向けている。")
	await novel_interface.show_text_only("グループの中でも特に40代ぐらいの男2人が
目立つ風貌をしていた。
長く立派な髭を生やし、両方のもみあげを
三つ編みにしてぶら下げている。")
	await novel_interface.show_text_only("彼らは顔の見た目だけでなく服装も同じ物を
着ていた。
白いシャツ、膝まで丈のある黒いコートを羽織り
黒いジャズハットを被っている。
まるでどこかの怪しい組織団体から
来た人みたいだ。")
	await novel_interface.show_text_only("周囲に集まる子供達も、彼らと同じ様式の
白黒に見立てた服装である。")
	novel_interface.show_character("ren_medical","bored")
	await novel_interface.show_dialog("（学校の見学とかか？）

（その割に年齢がバラバラだよな……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("3歳未満から10歳以上までの子供がおり、
比べてみてもデコボコな状態だ。
年上の子は注意されそうなぐらい騒いでいて、
幼い子は今にも転びそうな歩き方をしていた。")
	await novel_interface.show_text_only("そんなグループの最後尾で、やつれた顔をした
中年女性2人が黙々と歩いている。")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("（……あの2人は先生って事か？）", "レン")
	await novel_interface.show_dialog("（何で1人はベビーカーを押してるんだろう？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("何とも奇妙な組み合わせだ……")
	await novel_interface.show_text_only("そんな様子をボンヤリ眺めてしばらく経つと、
ガイドさんが歴史館の案内を終えたみたいだ。
観光客を連れて史料館へ向かう素振りを
見せている。
やる事も特に無いし、俺は彼らの後ろへ付いて
行く事にした。")
	await novel_interface.show_text_only("ガイドさんは移動中に襟のマイクを調整しつつ
コホンっと咳払いをして話し始める。")
	await novel_interface.show_dialog("只今より皆様にご案内するのは、
この博物館で最も貴重な展示品となります。", "ガイド")
	await novel_interface.show_dialog("次の展示ホールでは撮影を禁止しておりますので
携帯はカバンなどに仕舞うようお願い致します。
それでは「聖書館」へと入りましょう。", "ガイド")
	await novel_interface.show_text_only("その言葉を聞いた途端に周囲の空気が変わった。

さっきまで騒いでいた子供はすぐさま静かになり
特徴的な2人の男性も厳粛な表情をしている。")
	await novel_interface.show_text_only("流石の俺も好奇心がくすぐられた。

とりあえず言われた通りにスマホを仕舞って
その時を待つ事にする。")
	await novel_interface.hide_background()
	await novel_interface.stop_music()
	await novel_interface.show_text_only("ガイドさんが掌紋認証を行うと、玄武岩の大門が
ゆっくりと開かれ長い石廊下が露わになった。")
	await novel_interface.show_text_only("俺を含めて20名ほどがゾロゾロと中へ
入っていく。
何かの重々しい雰囲気を一様に感じているのか、
全員が沈黙して喋り声すらも発さない。")
	await novel_interface.show_text_only("……………………")
	novel_interface.change_music("res://assets/audio/music/Normal Stage.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_SOTB.png")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("これは……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("廊下の果て──

そこにあったのは不思議な造形をした
円状の展示ホールだった。")
	await novel_interface.show_text_only("奇妙で独特な雰囲気を感じる空間に、
壁の模様が規則正しく天窓まで伸びている。")
	await novel_interface.show_text_only("天窓からの光はホール中心にある展示台へと
差し込み、神聖な静寂を醸し出す。")
	await novel_interface.show_text_only("粘土に似た素材が周囲を彩り、空間全体がまるで
陶器のようなデザインだ。")
	await novel_interface.show_text_only("石で作られた展示台の上には筒状のケースが
設置されていた。
その中に黄ばんだ古い羊皮紙が並べられている。")
	await novel_interface.show_text_only("俺は階段を登って展示台へと近付いてみた。

保護ガラスは5センチほどの厚さがあったけど、
羊皮紙のヘブライ語がはっきりと見える。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_DSS.png")
	await novel_interface.show_dialog("こ、これってもしかして……", "レン")
	await novel_interface.show_text_only("例の第3新なんとか市が舞台のアニメにも
登場した、あ、あの……")
	await novel_interface.show_dialog("──こちらは死海北西の洞窟にて発見された
古代文献。
前世紀最大の考古学的発見とされている
『死海文書』でございます。", "ガイド")
	await novel_interface.show_dialog("死海文書とは12箇所の洞窟から発掘された、
計500本以上が存在する文書の総称であり……", "ガイド")
	await novel_interface.show_dialog("こちらのケースに展示してある物は
有名な『モーセ五書』と呼ばれている
《創世記》の一部となります。", "ガイド")
	await novel_interface.show_dialog("神による天地創造の過程と、神の民に選ばれし
マサダ人の経緯が記載されており、
この国で最重要の歴史的文化財と言えましょう。", "ガイド")
	await novel_interface.show_text_only("そう言えば昔っからマサダ人は神に選ばれた民を
自称してたっけ。")
	await novel_interface.show_text_only("でも世界中の民族に大体1人か2人ぐらい
祖先となる神っているし……")
	await novel_interface.show_text_only("正直、こんな真面目な宗教の話になると
難しいから興味が全く湧かない。")
	await novel_interface.show_text_only("地元のお客さん達は俺と正反対の事を
思っているのだろうか……
変わった格好のおっさん達2人に至っては、
展示ケースに向かって祈祷し始めた。")
	await novel_interface.show_text_only("ガイドさんは低く優しい声で説明を始める。")
	await novel_interface.show_dialog("文書には祖先であるアブラハム、イサク、
そしてヤコブと12人の子供達──
彼らの物語についてが書かれております。", "ガイド")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_TheThree.png")
	await novel_interface.show_dialog("アブラハムとは数多の宗教における預言者であり
ヘブライ人とアラブ人の共通の先祖です。", "ガイド")
	await novel_interface.show_dialog("またアブラハムは人々の中から神に選定され、
祝福を与えられた人間でもあります。", "ガイド")
	await novel_interface.show_dialog("──神はアブラハムに約束しました。

彼の嫡子、嫡孫および嫡孫の後裔に
広大で肥沃な大地を与えると。", "ガイド")
	await novel_interface.show_dialog("その土地こそがナイル川からユーフラテス川まで
続く、今の私達が呼ぶ『約束の地』なのです。", "ガイド")
	await novel_interface.show_dialog("アブラハムは嫡子イサクを産み、イサクは嫡子の
エサウ、次男のヤコブを産みました……", "ガイド")
	await novel_interface.show_dialog("（うん……ヤコブ？）", "レン")
	await novel_interface.show_text_only("それってイルカの『管理人」だった
アイツと同じ名前じゃないか！")
	await novel_interface.show_text_only("だけど西洋の人って宗教聖典に登場する人物から
良く名前を付けたりするよな……")
	await novel_interface.show_text_only("ガイドさんは少し言葉を止め、メガネを掛けた。
それからまた古文書の説明を続ける。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_MessOfPottage.png")
	await novel_interface.show_dialog("文書によればヤコブは兄のイサクから
長子の権利を、
レンズ豆のスープで買い取ったとされています。", "ガイド")
	await novel_interface.show_dialog("長子の権利を手に入れたヤコブは、
アブラハムと神が交わした約束により
『約束の地』の相続権を持つ事となりました。", "ガイド")
	await novel_interface.show_dialog("後にヤコブはマサダの聖祖となり、彼の12人の
息子もそれぞれマサダの12部族の先祖に……", "ガイド")
	await novel_interface.show_text_only("ここまで聞いて、頭に熱が溜まってきた。")
	await novel_interface.show_text_only("ちょっと待って……レンズ豆のスープでかよ！？

正気か古代人……？")
	await novel_interface.show_text_only("しかもこの話の通りなら、マサダ人の全員が
ヤコブの末裔になるじゃないか……")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_DSS.png")
	await novel_interface.show_text_only("思考は混乱気味であるが、解説は止まらない。

ガイドさんは円状の展示台へ進むと、
文書の末尾にある部分について語り出す。")
	await novel_interface.show_dialog("ここにあるのは《創世記》の最後の部分です。", "ガイド")
	await novel_interface.show_dialog("聖祖ヤコブの生涯は伝説に満ちております。

彼は天国の扉の夢を見て、彼の祖父と同じ約束を
神と交わしました。", "ガイド")
	await novel_interface.show_dialog("ヤボク川にて神と繰り広げた格闘の結果、
足は不自由となってしまいましたが、
聖なる名前さえも授かる事が出来ました。", "ガイド")
	await novel_interface.show_dialog("晩年はエジプトで17年間を過ごし、
息子のヨセフと再会を果たした末……", "ガイド")
	await novel_interface.show_dialog("死の間際に息子と約束を交わします。

眠りにつく時はエジプトでなく、故郷カナンの
ヘブロンにあるマクぺラの洞穴に葬ってくれと。", "ガイド")
	await novel_interface.show_dialog("そこはアブラハムが買い取った地であり、
ヤコブの両親と祖父祖母が埋葬された……
いわば彼の家族の墓地だったのです。", "ガイド")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………それで文書は終わりのようだ。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_SOTB.png")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("（あれっ？）

（マクぺラの洞窟って聞いた事があるような？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("何か2日前に爆発があったとかなんとか
愛衣が言ってた気が……")
	await novel_interface.show_text_only("……くっそ、全然覚えてないぞ。

外国の地名とか人名とかって全部似たように
聞こえるし。")
	await novel_interface.show_text_only("色々と思考に追い立てられながらも、
目線だけはガイドさんと合わせておく。")
	await novel_interface.show_dialog("マサダは長き歴史を持つ民族です。
それ故に考古発掘にも注力しております。", "ガイド")
	await novel_interface.show_dialog("最初の文書が発見されて以来──

私達は80年以上の長き時が経とうとも、
『死海文書』の発掘と修復作業を続けています。", "ガイド")
	await novel_interface.show_dialog("何故ならそれらは私達の先祖の遺産であり、
私達の根源でもあるからなのです。", "ガイド")
	await novel_interface.show_dialog("しかしながら……", "ガイド")
	await novel_interface.show_text_only("階段を降りたガイドさんは、飾られていた
巨大な油絵の前へと足を運んだ。")
	novel_interface.change_music("res://assets/audio/music/Hero.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_TheJewishWar.png")
	await novel_interface.show_text_only("そのまま彼は一言も発さずに油絵を凝視する。")
	await novel_interface.show_text_only("あまりにも壮大な絵は、壁一面のほぼ全てを
占領していた。")
	await novel_interface.show_dialog("……私達の歴史は苦難に満ちている。", "ガイド")
	await novel_interface.show_text_only("振り返ったガイドさんの口角が微かに動く。

まるで苦難の記憶を抑えようとするかのように。")
	await novel_interface.show_dialog("この絵はフラウィウス・ヨセフスという
歴史学者の著作を元に作られた作品です。", "ガイド")
	await novel_interface.show_dialog("ローマ帝国に聖城が征服された歴史を
皆様は覚えておりますでしょうか？
100万以上のマサダ人が兵士達に虐殺された
あの歴史を……", "ガイド")
	await novel_interface.show_dialog("ここに描かれているのは、
第二の神殿が燃やされた日の情景です。", "ガイド")
	await novel_interface.show_dialog("悲しき出来事でありますが、
それは1000年に及ぶ苦難の序章に過ぎません。", "ガイド")
	await novel_interface.show_dialog("西暦70年、ローマ人により私達の祖先の多くが
ユダヤの地から追放を受けました。", "ガイド")
	await novel_interface.show_dialog("故郷を追われて怒りを感じない人間は、
きっと何処にもいないでしょう。
戦う事を誓った1000人ほどの義勇軍が、
マサダを最後の砦として反旗を翻します。", "ガイド")
	await novel_interface.show_dialog("彼らはローマ軍に包囲されながらも約2年の間
耐え抜きました。
ですが、水の手を断たれてしまった時には、
既に戦い続ける余力も残されておらず……", "ガイド")
	await novel_interface.show_dialog("やがてマサダの城門はローマ帝国第十軍団に
破られる事となります。
城内には900人以上が死屍累々と倒れ、
建物は燃え盛るばかり。", "ガイド")
	await novel_interface.show_dialog("ローマの奴隷になるぐらいならと、
義勇軍が選んだのは「自決」です。
最終的に生き延びたのは2人の大人と
5人の子供だけ……", "ガイド")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("……当時の光景を想像して、思わず胸が
締め付けられる。")
	await novel_interface.show_text_only("長い沈黙の後、ガイドさんは再び俺達に向かって
話を続けた。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_SOTB.png")
	await novel_interface.show_dialog("私達は一度だけでなく、幾度も故郷から駆逐され
家となる場所を追い出されてきました。", "ガイド")
	await novel_interface.show_dialog("征服され、支配され、排斥され、虐殺され……

時には奴隷、囚人、家畜と同様に扱われ……", "ガイド")
	await novel_interface.show_dialog("約100年前には人類史上稀に見る凄惨な
民族浄化が行われ……
600万人にも及ぶ我々の同胞が虐殺されました。", "ガイド")
	await novel_interface.show_dialog("更に10年前、我々の首都が焦土と化した事は
未だ記憶に新しい事でしょう。
神殿の丘を七日七晩と焼き尽した紫色の炎……", "ガイド")
	await novel_interface.show_dialog("……私の家族や友人も含め命を落しました。

あまりにも……あまりにも多くの人々……", "ガイド")
	await novel_interface.show_dialog("あの日を思う追悼の念は只々悔しいばかりか
生き延びた者達も多くを失ったのです……", "ガイド")
	await novel_interface.show_text_only("震えた声で、彼はポケットに入れていた左手を
振り上げる。")
	await novel_interface.show_text_only("それは人の手ではなく、金属製の義肢だった。

袖口から見える彼の手首には火傷の痕跡が
ハッキリと残っている。")
	await novel_interface.show_text_only("──その場にいる全員が沈黙してしまう。")
	await novel_interface.show_text_only("観光客と思われる小さな女の子は口元に
手を当て、瞳には涙を浮かべていた。")
	await novel_interface.show_text_only("あまりにも残酷な現実を映す左手の拳だが、
掲げた姿には揺るがない意志を感じる。
彼は周囲の反応にも動じずに言葉を吐き出した。")
	await novel_interface.show_dialog("マサダを死守した1000人の同胞と同じく、
我々は苦難に決して屈しない──", "ガイド")
	await novel_interface.show_text_only("朗々とした声ではないが、気迫に満ちていた。")
	await novel_interface.show_text_only("まるで神の導きを得たかのように、ガイドさんの
目は輝きを放っている。")
	await novel_interface.show_dialog("2度のディアスポラを経験しても、
最後には必ずこの土地へと戻った。
何故なら我々は苦難に屈しないからだ！", "ガイド")
	await novel_interface.show_dialog("先人は我々だけの国家を立ち上げるために、
90年前、砲煙弾雨を浴びながらここに戻った。", "ガイド")
	await novel_interface.show_dialog("如何に貧しい砂漠であっても──

たとえ淡水の確保すら困難だとしても──

ここは「我々の故郷」なのです！", "ガイド")
	await novel_interface.show_dialog("この地に流れるのは乳と蜜ではない！
我々の血と涙と汗だ！！", "ガイド")
	await novel_interface.show_dialog("この世界におけるマサダ人の魂の帰る場所。

我々の唯一の「故郷」は間違いなくここにある！", "ガイド")
	await novel_interface.show_dialog("『約束の地』とは我々の先祖と神の契約！
そして、子々孫々への約束！！", "ガイド")
	await novel_interface.show_dialog("神殿を焼き払らわれようとも、魂の砦は永遠に
陥落しないッ！！", "ガイド")
	await novel_interface.show_dialog("……最後に、この話を語り継ぐ事が出来た今を
神に感謝すると共に……
マサダ国立博物館までご足労いただいた皆様にも
感謝を表明いたします。
本当にありがとうございました。", "ガイド")
	await novel_interface.show_text_only("話の終わりに併せて、ガイドさんは頭を下げた。")
	await novel_interface.show_text_only("──その瞬間に巻き起こる拍手喝采。

俺も自分から拍手を投げ掛けた。

忍耐強く戦い続ける心がヒシヒシと伝わってきて
……とっても良い演説だったと思う。
この丸いホール内を拍手の音が包んで、
しばらくは鳴り止まなかった。")
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_IndiaEH.png")
	await novel_interface.show_text_only("それから俺は文書の展示エリアから離れて、
博物館内を見て回る。")
	await novel_interface.show_text_only("残り2時間半は博物館で過ごさないとだけど……

展示物をちゃんと見るようにしてからは
時間が順調に潰れていった。")
	await novel_interface.show_text_only("先ほどのガイドさんの話が、未だに俺の脳内で
グルグルと渦を巻いている。")
	await novel_interface.show_text_only("明るい展示ホールに入った後でも、
昂る気持ちが収まらない。")
	novel_interface.show_character("ren_medical","normal2")
	await novel_interface.show_dialog("（あのガイドさんは次の観客達を案内しに
　行ったか……）", "レン")
	novel_interface.change_expression("upset")
	await novel_interface.show_dialog("（……あれ？）

（そう言えば……あの人って毎日何回も
　案内するんだよな？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ふと、ある考えが俺の頭に浮かんでしまった。")
	await novel_interface.show_text_only("あのおじさんの仕事は博物館の案内だよな？

だったら毎日同じ言葉を繰り返している訳で……")
	await novel_interface.show_text_only("じゃあ説明している時の声のトーンとか、
身体の動きとか移動するルートまで、
数え切れないぐらい練習している事になる……")
	await novel_interface.show_text_only("多分ずっとポケットにしまった左手さえ……")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("最初から全部計画的な話だったのか！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("自分の考えながら衝撃を受ける俺。

昨晩マリルの言っていた事がようやく
理解できたかもしれない……")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Masadhotel.png")
	await novel_interface.show_dialog("国民皆兵の体制を保つためには、思想を全ての
社会階層に隈なく浸透させる必要がある。", "マリル")
	await novel_interface.show_dialog("洗脳手段として最も有効なのが、自民族の歴史に
屈辱と悔しさを抱かせる事だ。", "マリル")
	await novel_interface.show_dialog("傷付いた動物達が自発的に集まる習性ように、
悔しさを感じる人間は本能的に復讐を企む。", "マリル")
	await novel_interface.show_dialog("お前も実際に体験すれば分かるだろうなぁ。", "マリル")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_IndiaEH.png")
	await novel_interface.show_text_only("俺は両手でこめかみを押さえ大きく頭を振った。

傍から見たら頭の中に入った水を必死に出そうと
している、お馬鹿さんに見えるだろう。")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（流石の俺だぜ！）

（危うく洗脳されるところだった！）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("マリルに普段から頭を叩いて貰っているから、
何とか洗脳は免れたようだな。")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（もしくは、気付いているように見えて
　実は既に洗脳済みだとか……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("よし！ 考えるのは止めよう、全て忘れるんだ！")
	await novel_interface.show_text_only("そもそも「この土地は神から授かった故郷だ」
って言うのも眉唾だしな……")
	await novel_interface.show_text_only("上位者は支配した土地を離れる前に、
地図上に適当な境界線をやたらと沢山引き、
気まぐれに立ち去って行く──")
	await novel_interface.show_text_only("残された民衆には……
無尽の紛争と苦難しか置いていかない──")
	await novel_interface.show_text_only("俺は隅に展示されていたインドの仏像を見る。")
	novel_interface.show_character("ren_medical","stare")
	await novel_interface.show_dialog("（それって人間の方が得意だよな……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("心の中で皮肉を思いながらも、俺は引き続き
博物館内を歩いていく。")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_TechnologyEH.png")
	await novel_interface.show_text_only("暗い展示ホールへ足を踏み入れると、
プロジェクターによる映像が点在していた。
工学関連のホールらしく、紅海～死海を繋ぐ
運河の各整備工程や技術が紹介されている。")
	await novel_interface.show_text_only("映っている動画はどれもこれも、果敢で賢明な
民族であるマサダ人が困難を乗り越え、
如何にこのスーパー事業を成し遂げたかを
説明して称賛する物ばかりだった。")
	await novel_interface.show_text_only("先ほど無事に目が覚めた俺は、宣教紛いの言葉に
拒否感を思えてしまう。")
	await novel_interface.show_text_only("カジノ船のレストランでアニーが見せてくれた
大運河のドキュメンタリーを思い出した。
正確に言えば、その動画の掲載サイトにあった
とある1つの関連動画を俺は思い出す。")
	await novel_interface.show_text_only("内容はベン＝グリオン大学の微生物学教授が
提言した、運河の整備工程における反対意見だ。")
	novel_interface.show_character("ren_medical","normal2")
	await novel_interface.show_dialog("（あの教授だけど、ネット上じゃ色々な意味で
　有名人なんだよな……）", "レン")
	await novel_interface.hide_character()
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Itsuki.png")
	await novel_interface.show_text_only("学生達の前でエスキモー民族が作った伝統的な
食品を食べると言う彼の別動画がある。")
	await novel_interface.show_text_only("アザラシの死体に海鳥を詰めて発酵させ、
出来上がった物を自分の口の中へと…………")
	await novel_interface.show_text_only("衝撃的な映像とエキセントリックな
効果音のおかげで、SNSで急速に拡散。
現在は様々なネタ動画の素材として
使われている。")
	await novel_interface.show_text_only("そんな教授の上げた動画が信頼できるかと
言えばなのだが、
運河に関する動画は10年以上も前の物らしく
内容もかなり真面目だった。")
	await novel_interface.show_text_only("死海の水位は毎年1.2メートルずつ下っており、
このままでは近い将来に枯渇してしまう──
──と過去にマサダ政府は公式見解を
発表している。")
	await novel_interface.show_text_only("もしも運河の建設をしていなかった場合、
死海は2050年より前に消滅していたそうだ。")
	await novel_interface.show_text_only("しかし教授は動画内で1960年代に死海へと
流れ込むべき川をマサダ人がせき止めた事こそ、
根本的な原因だと反論している。")
	await novel_interface.show_text_only("西アジアの砂漠の地下に埋蔵されている石油は
天から授けられた宝物だ。
そう多くの人々が言うけれど──")
	await novel_interface.show_text_only("この土地には水こそが一番貴重な宝物である。")
	await novel_interface.show_text_only("教授は動画の中で強い警告を投げ掛けていた。

もし紅海の水が死海に流れ込めば、
死海の塩度濃度は大幅に希釈されてしまい、
現存する菌群の生態バランスに壊滅的な打撃を
与えてしまうと。")
	await novel_interface.show_text_only("しかし、細菌を気にする人間なんて
極少人数に限られる。
大運河は国家プロジェクトに位置付けられ、
新首都の立地の決定後すぐに整備が開始された。")
	await novel_interface.show_text_only("魚介類も生活できない超高塩度の海域が
好塩菌のパラダイスだったなんて、
誰も知ったこっちゃないだろうし……")
	await novel_interface.show_text_only("生態系って本当に不思議だなぁ……")
	await novel_interface.hide_background()
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（でも38分の解説は誰も見ないと思うぞ？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("今の現代人なんて15秒の動画で限界だ。

つまりは、このプロジェクター映像も現代人の
俺にとって見るのに限界が来てるって事で……")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_AncientHumanEH.png")
	await novel_interface.show_text_only("……思ったよりも相当広いなここ。

暗いホールを抜け、俺は人の見当たらない場所へ
たどり着いた。")
	await novel_interface.show_text_only("中央には人型生物のような骨格標本が
2つ展示されている。")
	await novel_interface.show_text_only("それぞれ欠損した部分が多く、姿の半分以上が
石膏のパーツで復元されていた。")
	await novel_interface.show_text_only("展示ケースの金属プレートには『Lucy & Ardi』
と書かれている。")
	await novel_interface.show_text_only("歩き疲れた俺は、とりあえずこのホールの
ベンチに座って休む事にした。")
	novel_interface.show_character("ren_medical","normal2")
	await novel_interface.show_dialog("そういえば、今頃あのドタバタな小っこいのは
何してんだろうな……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("後で見学が終わったらシンチェンを連れて、
入国管理局で手続きをしないといけない。")
	await novel_interface.show_text_only("昨夜はホテルの部屋を滅茶苦茶にした挙句。

エミリオからもらったザクロジュースまで
こぼしやがって……")
	await novel_interface.show_text_only("しかも俺と一緒にお風呂に入ろうなんて！")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("（アニーがフォローしてくれて助かった……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("さ、さもないと……")
	await novel_interface.show_text_only("う、うわああぁぁ考えるな考えるな――ッ！！")
	await novel_interface.show_text_only("気持ちを落ち着かせるために、俺は展示ケースの
隣にあったイメージ図を見た。
そこには原始人の部族っぽい物が描かれている。")
	await novel_interface.show_text_only("……構図はなんとなく有名なSF映画みたいだ。")
	await novel_interface.show_text_only("地球上に住んでる猿達が、巨大な黒い立方体の
影響によって進化を果たして……
何か骨を放り投げるシーンが印象深かった
気がする。")
	await novel_interface.hide_background()
	await novel_interface.stop_music()
	await novel_interface.show_text_only("──あの映画を見たのはいつだっけ？

というか、そんな映画あったかな……

何かと勘違いしてるのかも？")
	await novel_interface.show_text_only("黒い立方体って、そう言えば……")
	novel_interface.change_music("res://assets/audio/music/unkown/UI_Draw.mp3")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_AncientHumanEH.png")
	await novel_interface.show_text_only("などと考えていると。")
	await novel_interface.show_dialog("──不思議でしょう？", "少女の声")
	await novel_interface.show_text_only("…………突如の声

振り返ると、後ろに1人の少女が立っていた。")
	await novel_interface.show_text_only("シルクのような柔らかい髪を両手で整えながら、
俺に向かって優しく微笑む。")
	novel_interface.show_character("stardust_big","normal")
	await novel_interface.show_dialog("こんにちは。", "少女")

	print("=== 星尘降临篇第11话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
