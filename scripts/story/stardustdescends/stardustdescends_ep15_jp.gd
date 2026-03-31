# stardustdescends_ep15.gd - 星尘降临篇第15话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep15_script()

func play_script():
	pass

func stardustdescends_ep15_script():
	novel_interface.change_music("res://assets/audio/music/Wind.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_StarrySky.png")
	await novel_interface.show_text_only("Take my love, take my land
（私の愛を奪い、私の地を奪い）")
	await novel_interface.show_text_only("Take me where I cannot stand
（私の居場所を失くされても）")
	await novel_interface.show_text_only("I don't care I'm still free
（私は気にしない、まだ自由があるから）")
	await novel_interface.show_text_only("You can't take the sky from me
（君は私から空を奪う事はできない）")
	await novel_interface.show_text_only("Take me out to the black
（私を暗闇の中へ追いやっても）")
	await novel_interface.show_text_only("Tell them I ain't coming back
（私が二度と戻ってこないと彼らに言っても）")
	await novel_interface.show_text_only("Burn the land and boil the sea
（大地を焼き払っても、海を沸騰させても）")
	await novel_interface.show_text_only("You can't take the sky from me
（君は私から空を奪う事はできない）")
	await novel_interface.show_text_only("──《Firefly》主題歌")
	await novel_interface.stop_music()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("──マサダ城外、国道の傍")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Sways.png")
	await novel_interface.show_text_only("日が沈んでいくと、砂漠の空が暗くなるのは
早かった。
城外にある人影のない小道で、俺達は一旦
車から降りる。")
	await novel_interface.show_text_only("ヴィラはトラックのナンバープレートを
入れ替え始めた。
その間に俺とエミリオは国防軍のロゴが付いた
ネットを物資箱へと被せていく。")
	await novel_interface.show_text_only("城外には不発弾や地雷などの危険物が多いため、
処理作業中を示すネットは人払いに最適だ。")
	await novel_interface.show_text_only("トラックを自動運転モードに設定したら、
後は装甲車で牽引して城内へ戻るだけ……")
	await novel_interface.show_text_only("……気付けば俺と彼女達は「誘拐犯と被害者」
から「共犯」になっていた。
九死に一生を得た体験が関係性を奇妙な方向へ
拗らせたのだ。")
	await novel_interface.show_text_only("車内で色々と雑談をしたのも仲良くなった
要因の1つだと思う。
俺からは新豊洲の学校生活や美味い食べ物の話。

彼女達は軍学校でのエピソードを教えてくれた。")
	await novel_interface.show_text_only("意外な事にヴィラとエミリオは俺とほぼ同年代の
生まれだった。
彼女達の歩む人生は俺と全く違っていて、
年が近いだなんて今でも思えないけど……")
	await novel_interface.show_text_only("七年戦争時──

マサダは兵員を補充するため、中学生から素質のある子を選抜し──
設備等のリソースが充実した軍事学校への
入学を推奨させた。")
	await novel_interface.show_text_only("エミリオは息苦しかった家から離れるため、
12歳の時に全寮制の軍事学校の門を叩いた。")
	await novel_interface.show_text_only("ヴィラはお父さんが空軍の高官であり、
家系も軍に深く関わっているため、
選択肢も無くキャンバリー参謀大学へ入る事が
決まっていたらしい。")
	await novel_interface.show_text_only("各々の学校にて30ヶ月の座学と軍事訓練を
受けた後──
同年に2人はマサダのトップとなるエリート校、
『タルピオット』軍学校へ入学を申し込んだ。")
	novel_interface.show_character("ren_medical","perspire1")
	await novel_interface.show_dialog("『タルピオット』の倍率って確か100倍とか
聞いたんだけど……？", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("話した通りに人種隔離政策やらコネもあるから、
一概にそうとは言い切れないわね。
でもヴィラってばコネを絶対に頼りたくないって
申し込む時にわざと偽の名字を使ったのよ？
そのせいで彼女のお父さんの堪忍袋がブチン！", "エミリオ")
	novel_interface.change_expression("mock")
	await novel_interface.show_dialog("『ダヤン』はそこまで珍しくないのに
『ヴァルキューレ』って……
何で大層な名字にしちゃったの？", "エミリオ")
	await novel_interface.show_dialog("合格発表の時は現場にいた学生も大人も、
誰が「戦女神」かって話題で持ち切りだったわ。", "エミリオ")
	await novel_interface.show_dialog("ヴィラったら顔を伏せながら真っ赤な顔にして
プルプルと人混みの中で震えていてね？
あの時は本当に可愛かったわよ～～", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("中二病の公開処刑って言うヤツだな！
すっごい気持ちが分かるわ！")
	await novel_interface.show_text_only("……いや、俺なんで分かったの。")
	novel_interface.show_character("valkyrja","shy")
	await novel_interface.show_dialog("も、もう良いだろその事は！！
卒業したら…元に戻すから……", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("え～～もったいないわ。
私は結構気に入ってるのに。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","blush")
	await novel_interface.show_dialog("えっ？", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("近接戦闘試験の時の事は覚えてる？ 

この子ったらフィールド上で「戦女神様」と
呼んだだけでパニック状態になっちゃうの。", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","shy")
	await novel_interface.show_dialog("こら、やめろってッ！！
その名前で私を呼ぶな……！", "ヴィラ")
	novel_interface.change_expression("angry")
	await novel_interface.show_dialog("お、おい、レン！

そこのネットを引っ張るのを手伝え！", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("かしこまりました戦女神様。
すぐに向かいます戦女神様。", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","shy")
	await novel_interface.show_dialog("やめろぉぉッ！！！", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("ぷ――――あははははははははは～！！！", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","shy")
	await novel_interface.show_dialog("だからいつも言うなってあれほどッ！！", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("そんな話を交えながら、夜の帳が落ちるまで
俺達は装甲車を走らせていく。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_SlumArea.png")
	await novel_interface.show_text_only("左に曲がって旧工場地域を抜けてから
隔離壁に沿って北へと向かい、
内城区域からそれほど離れていない
北東の場所にたどり着いた。")
	await novel_interface.show_text_only("この一帯はスラムらしい。

周囲の建物はボロボロで、街灯は光を照らす
役割を果たせていない。")
	await novel_interface.show_text_only("暗い街には通行人の姿も無く、4つの言語で
書かれている様々なサインが印象的なだけ。")
	await novel_interface.show_text_only("整備の行き届いていない民家の光も
外から見た限りでは仄かで、
隔離壁から発せられている光の方が
明るいとさえ感じた。")
	await novel_interface.show_text_only("それぐらい暗いからか、今ここで空を見上げると
満天の星を拝む事ができる。")
	novel_interface.show_character("ren_medical","happy")
	await novel_interface.show_dialog("うわぁ……綺麗な星空だな……", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("着いたわよ。ここが目的地で～す。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("惚けながら空に浮かぶ星々を眺めていると、
見知らぬ鉄製のゲート前に到着した。
ゲートは端々が錆びており、向こう側には
庭のような場所が見える。")
	await novel_interface.show_text_only("装甲車から降りたエミリオがゲートを開けると、
ヴィラはトラックを手動操縦に切り替えた。
バックで慎重にトラックをゲート内へ入れると
続けて装甲車も入れて中で停車させる。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("庭のような場所は複数の民家に囲まれていた。

その内の1つに彼女達が入っていくので、
俺は付いて行く。
階段を上がると、防空壕の入口みたいな
分厚い金属の扉があった。")
	await novel_interface.show_text_only("チャイムを鳴らし「私よ」とエミリオが話すと、
40代ぐらいの女性が扉を開けて現れる。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_ShelterCorridor.png")
	await novel_interface.show_text_only("扉の先は長い廊下が続いていて、淡い薔薇の
香りが漂っていた。")
	await novel_interface.show_text_only("天井の電球は剥き出しのコードとソケットから
無骨にぶら下がっているが、
床の絨毯は古いながらも丁寧に手入れが
施されていると感じる。")
	await novel_interface.show_text_only("廊下の壁と扉は全てが淡青色で、
壁には色鮮やかな絵が飾ってあった。")
	await novel_interface.show_text_only("奥にある部屋から小さな1人の女の子が
廊下へ頭の半分を突き出している。
こちらの状況を覗き見ようとしている様子だが、
すぐに彼女は頭を引っ込めてしまった。")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("（……ここは幼稚園？）", "レン")
	await novel_interface.show_dialog("（いや、雰囲気的には孤児院の方が近いか……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("飾ってある絵が子供の描いた物だと俺は気付く。

そこには子供の視点から見た残酷な光景が、
いくつも描かれていた……")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("ハイファおばさま──", "エミリオ")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("（……おばさま？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("……あら、こんなに夜遅くに、
しかもヴィラまで。
……こちらの子は？", "ハイファ")
	novel_interface.show_character("ren_medical","happy")
	await novel_interface.show_dialog("こ、こんばんは。レンと言います。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("あらあら綺麗な子ねぇ……

あなた達ご飯はまだなの？
すぐに台所の食べ物を持ってくるわ。", "ハイファ")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("大丈夫だから、気にしないで。

それより、軍隊の処分したい物資があるから
こっちに持ってくるって話があったじゃない？", "エミリオ")
	await novel_interface.show_dialog("最近の国防軍は軍事削減を行っててさ。

ヴィラがお父さんに頼んで廃棄予定だった
物資の一部を貰ったらしいの。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("そんな……本当に何度も何度も、
あなたのお父様にはお世話になっているわ。
今度改めて直接お礼を言わせて頂かないと。", "ハイファ")
	novel_interface.show_character("ren_medical","speechless")
	await novel_interface.show_dialog("（……何度も？）

（なるほど、だから手慣れた感じで……）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","panic")
	await novel_interface.show_dialog("い、いいや、父は多忙だから！", "ヴィラ")
	novel_interface.change_expression("wink")
	await novel_interface.show_dialog("どうせ撤退する時は、物資を持って帰るより
改めて買った方が安く付く。", "ヴィラ")
	await novel_interface.show_dialog("とは言え物資の処理や手続きは非常に複雑だから
私達は夜中を選んで届けているって訳だ。
……再三言うけど、他人には内緒だぞ！", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("はいはい、分かっているわよ。
でも運ぶのを手伝うくらいは大丈夫よね？", "ハイファ")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("子供達用のレーションとタブレットを
持ってくるから、
倉庫のスペースを少し開けて貰えるかしら？", "エミリオ")
	await novel_interface.show_dialog("残りはハディー先生の救護施設で使えそうな
物だから、後で彼のところに運ぶわ。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("あっ、エミリオおねえちゃんだ！", "子供A")
	await novel_interface.show_dialog("エミねえちゃん──", "子供B")
	await novel_interface.show_dialog("「戦女神」のおねえちゃんもいる～～", "子供C")
	await novel_interface.show_text_only("頭を抱えるヴィラを尻目に、2つの部屋から
声が聞こえてくる。")
	await novel_interface.show_text_only("10人以上の子供がダダダッッとこちらに
駆け寄ってきた。")
	await novel_interface.show_text_only("子供達は俺達に引っ付くと、楽しそうな表情で
騒ぎ始める。
特にエミリオは人気みたいで、彼女の周囲には
輪っかができていた。")
	await novel_interface.show_dialog("きいて、きいて、おねえちゃん、
わたし2年生の文字をよめるようになった！", "子供A")
	await novel_interface.show_text_only("電子辞書を持つ女の子は得意気に話す。

あの古い端末は俺と同じ年齢ぐらい前に作られた
モデルだろうか。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("凄いじゃないレマ！ 
今日は新型のタブレットを持て来たわよ～！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("エミねえちゃん！

ぼくサッカーボールを20かいリフティング
できるようになった！", "子供B")
	await novel_interface.show_text_only("明らかにサイズの合わない10番ユニフォームを
着ている男の子が、一生懸命に手を挙げている。")
	novel_interface.show_character("emilio","mock")
	await novel_interface.show_dialog("さっすがオマール！
将来、華雲宮の代表を倒す時はあなたが頼りね！", "エミリオ")
	await novel_interface.hide_character() 
	await novel_interface.show_dialog("そ、それと……わ、わたしのかいたえもみて――", "子供C")
	await novel_interface.show_text_only("少し発音のたどたどしい子が、壁に飾ってある
一番大きな絵を指差した。")
	novel_interface.show_character("emilio","smile")
	await novel_interface.show_dialog("ハサンの絵は上手ねぇ……！", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("物資のリストを見た時に彼女達の大体の目的は
察していた。
だけどまさか、こんな場所があるなんて──")
	await novel_interface.show_text_only("さっきの複数言語で書かれていたサインは、
この一帯が異族達の住居地である印だ。")
	await novel_interface.show_text_only("各インフラの不足は周りの様相を見て分かる通り
明らかであり、
安心して暮らせる犯罪レベルでは無い事も
分厚い金属の扉から伺える。")
	await novel_interface.show_text_only("子供達の笑顔を見ていたら、シンチェンの事を
思い出して心配になってきた。
あの子は今どうしているのか――")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("エミ、あの……俺の携帯を……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("彼女は携帯を握って少しだけ考え込んだが、
すぐにトランシーバーと一緒に渡してくれた。")
	novel_interface.show_character("emilio","normal")
	await novel_interface.show_dialog("私とヴィラは下の荷物を運びに行くわ。

この辺りは電波が不安定だからトランシーバーも
一緒に持ってなさい。", "エミリオ")
	novel_interface.change_expression("smile")
	await novel_interface.show_dialog("停戦協定の調印式は明日の朝だから……

この時間でも内城区域へ通じる検問所は全て
閉鎖されていると思う。", "エミリオ")
	await novel_interface.show_dialog("明日、砂嵐が起こる前にあなたを送り届けるわ。", "エミリオ")
	await novel_interface.hide_character()
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("──孤児院の事務所")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_ShelterOffice.png")
	await novel_interface.show_text_only("ようやく電波の繋がる場所を見つけてから、
俺は電話に向かって謝り倒していた。")
	await novel_interface.show_dialog("ほほぅ、ようやく今になって携帯を
取り戻せたと……？
で、それを思い出すまでに幾ら時間を掛けた？", "マリル")
	await novel_interface.show_dialog("楽しんでるようだなぁボンクラァ！！", "マリル")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("ィヒィ────ッ！
も、申し訳ございません……", "レン")
	await novel_interface.show_dialog("で、ですから、その……

今夜は外城区域で過ごす事になりまして、
明日の朝には戻るので……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("しかも其処で一夜を過ごすだと、おん！？", "マリル")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("てっ、停戦協定が原因で内城区域への帰り道は
全部封鎖されてるって、エミが言ってるし……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("エミという呼び方まで……
随分と親しい間柄になったようだなぁ～～？", "マリル")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("そ、そんな事はない！！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("お前と言う子は本当に……

いつか本気で騙されて砂漠に埋められても
知らんぞ私は……", "マリル")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("え、えと、そうっ！ あの2発のミサイル、
マリルが止めてくれたんだよな……？
ありがとう、ありがとうございます！！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("戯言を……ちっ、まぁ良い……

一応「収穫」はあったしな。", "マリル")
	await novel_interface.show_dialog("あのヴィラとやらの父親はマサダ総参謀部の
作戦部長で国防軍の軍功派だ。", "マリル")
	await novel_interface.show_dialog("非常に由緒ある家名を彼女は持っており、
曾祖父のモーシェ・ダヤンに至っては、
マサダで知らない方が珍しい。", "マリル")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("えっ？　そんな凄い人の家系なの……？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("しかもモーシェはアマチュアの考古学者でも
あったらしい。
唯一、マクペラの洞窟で考古学研究を
行ったマサダ人なのだとか──", "マリル")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("マクペラの洞窟って……
前に爆発事故があった場所だよな？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("1967年に起きた「六日戦争」の後、
マサダはヘブロンの支配権を手に入れた。", "マリル")
	await novel_interface.show_dialog("当時、国防長官だったモーシェは洞窟の隙間を
調査するために、
スレンダーな12歳の女の子を侵入させた
そうだ。", "マリル")
	novel_interface.show_character("ren_medical","wry_smile")
	await novel_interface.show_dialog("（なんかめちゃくちゃだな……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("しかし奴は何1つ文化財を取り出さなかった上、
宗教的な理由なんて柄にもない言い訳で、
人々が洞窟へ進入するのを禁じた。", "マリル")
	await novel_interface.show_dialog("血気盛んで色々と行動に移してしまう部分は
彼ら家系の遺伝だろうな。
総参謀部の作戦部長は元パイロットとして
とんでもない命知らずだったと有名だ。", "マリル")
	await novel_interface.show_dialog("娘のヴィラは軍功派の家系であるにも関わらず、
技術派のタルピオット軍学校に申し込んだ。
それは家名に泥を塗ったと同然の行動なんだぞ？

ただでさえ目をつけられている状況の上、
彼女の今日やった事が耳に入りでもしたら……", "マリル")
	novel_interface.show_character("ren_medical","panic")
	await novel_interface.show_dialog("ど、どうするつもりだ？", "レン")
	await novel_interface.show_dialog("あの2人は良い人なんだから、やめて……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("こぉ～のスカタンめ。

万が一お前達が捕まった時に備えて、交渉材料の
1つや2つを事前に用意してるんだコッチは。", "マリル")
	await novel_interface.show_dialog("お前ぐらいの年齢の子供を育てる親とは、
こうも気苦労するんだな……", "マリル")
	novel_interface.show_character("ren_medical","uneasy")
	await novel_interface.show_dialog("まぁ……俺は大丈夫だから安心して。

それよりアニーとシンチェンはどうなったの？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("お前が誘拐された後、すぐに彼女達の安全を
確保して大使館へ送り届けた。", "マリル")
	await novel_interface.show_dialog("どうやって元老院のじいさん達に説明するか
検討中ではあるが……", "マリル")
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("だ、大丈夫だって、俺も明日は絶対予定通りに
大使館へ行くから！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("ああ、そうだ。
もし外区で夜を過ごすなら気を付けろよ？", "マリル")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("──うん？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("風呂に入る時は男に見られないようにな。

一部民族の風習では嫁入りが決定してしまうぞ。", "マリル")
	novel_interface.show_character("ren_medical","wail")
	await novel_interface.show_dialog("はぁッ！？！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ーーブツン……ツー……ツー……")
	await novel_interface.show_text_only("……俺は思わず身震いする。")
	novel_interface.show_character("ren_medical","sob")
	await novel_interface.show_dialog("（……そんな事を言い残して切るなよ！！）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("レンちゃん、電話は終わった？

搾りたてのザクロジュースでもいかが？", "ハイファ")
	await novel_interface.show_text_only("食べ物と飲み物が乗ったトレーを持ちながら
ハイファおばさんが部屋に入ってきた。
優しく親しみやすい声で俺に話しかけてくる。")
	await novel_interface.show_text_only("彼女は一皿のピスタチオと、赤い液体の入った
ガラス瓶を机に置いた。")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("これ昨日もエミから1つ貰ったよ。
おばさんの作った物だったんだ。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("ふふ、あの子の小さい頃からの大好物なのよ。
母子揃って……", "ハイファ")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("エミのおばさんって事は、彼女のお母さんは
あなたの……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("ええ……エミの母親は私の一番上の姉よ。", "ハイファ")
	await novel_interface.show_text_only("ハイファおばさんは溜息を吐くと、
悲しそうな表情で椅子に座った。")
	await novel_interface.show_dialog("三姉妹の内、エミの母親が亡くなって、
もう一人の姉は行方不明。", "ハイファ")
	await novel_interface.show_dialog("集落の老人達はエミが学校へ行けるように
彼女を父親の家に送り届けたの。
あの子は良く脱走して戻ってきたけど……", "ハイファ")
	await novel_interface.show_dialog("ここ2年間で私達の生活を世話するまでに
なってしまって……
まだまだ子供なのに……", "ハイファ")
	await novel_interface.show_text_only("机の上には写真立てがあった。

市場で撮ったと思われる綺麗な女の子3人の
古ぼけた写真が飾られている。")
	await novel_interface.show_text_only("一番左の短髪の子は面影から、幼い頃の
ハイファおばさんである事が直ぐに分かった。
学校の制服を着ているし、12～13歳ぐらいの
写真なのかな。")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("エミから聞いたけど、両親は引っ越し途中に
亡くなったって……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("…………………………………………

……そう彼女は語ったのね？", "ハイファ")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("そうだけど……どうしたの？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("彼女は高熱に苦しんでいたから恐らく覚えて
いないのでしょうね。
きっと、後に長老が彼女に嘘を教えて……", "ハイファ")
	await novel_interface.show_dialog("保護区へ向かうまでに沢山の人が命を
落とした事は確かよ。
でも――……", "ハイファ")
	await novel_interface.show_dialog("……いいえ。
これで良いのよ……これで良い……", "ハイファ")
	await novel_interface.show_text_only("ハイファおばさんは写真立てを手に取ると
写真を中から取り出して言葉を止めた。
額縁で隠れて見えなかった部分には
文字が書かれてあった。")
	await novel_interface.show_text_only("「アミラ　&　リナ　&　ハイファ」

「アレッポ　2010年」")

	print("=== 星尘降临篇第15话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
