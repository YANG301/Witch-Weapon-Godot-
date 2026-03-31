# stardustdescends_ep07.gd - 星尘降临篇第7话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep07_script()

func play_script():
	pass

func stardustdescends_ep07_script():
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Vault.png")
	await novel_interface.show_text_only("本能的にここから離れたくなったので、
俺はシンチェンに目配せをする。
それから一言も喋らないようにして
エレベーターの扉へと向かった。")
	await novel_interface.show_text_only("サインに気付いたシンチェンと共に、係員さんを
尋問している少尉さんの元を後にする。")
	await novel_interface.show_text_only("強張る俺の動作から不安を感じ取ったみたいで、
彼女は俺の腕に身を寄せていた。")
	novel_interface.show_character("stardust_small","normal2")
	await novel_interface.show_dialog("（小声）ねぇねぇ……", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("柔らかな身体から伝わる温度のおかげか、
心の乱れは徐々に平穏へと戻っていく。
不安な顔をする彼女へ「大丈夫だよ」と
教えるように、
俺は黙って彼女の小さな手を掴んだ。")
	novel_interface.show_character("stardust_small","normal2")
	await novel_interface.show_text_only("それが通じたのであろうか、彼女は鮮やかな
笑顔を見せた。")
	await novel_interface.show_text_only("不思議な話だ。初対面であるはずの彼女に対して
言い得も知れない親近感が湧いてくるなんて。")
	await novel_interface.show_text_only("係員さんも兵士達も、なぜ彼女の事が
見えないのだろう……？")
	await novel_interface.hide_character()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("考え事をしながらシンチェンのプニプニな
頬を軽く弄り回した。
エレベーターの中に彼女の抗議の声が響く。")
	novel_interface.show_character("ren_full","gratified")
	await novel_interface.show_dialog("（なんか安心する感触と体温なんだよなぁ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ベアトリーチェのような自分で制御できない
特殊能力とかだったりして……")
	novel_interface.show_background("res://assets/images/bg/Stardust/BG_Stardust_Gambling_Boat3.png")
	await novel_interface.show_text_only("そんな可能性を頭の中に浮かべたところで、
エレベーターはVIPゾーンへと到着した。")
	await novel_interface.show_text_only("重厚なエレベーターの扉がゆっくりと開かれると
俺はようやく事態の重大さを理解する。")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_Gambling_Boat.png")
	await novel_interface.show_text_only("ロビーでは多くの乗客とスタッフ達が自動火器を
持つマサダブルク兵士に見張られていた。
どうやら強制的なセキュリティーチェックが
4人1組で行われているみたいだ。")
	await novel_interface.show_text_only("記録係であろう人間が乗客の抗議を無視して、
タブレットで1人ずつ写真を撮影している。")
	await novel_interface.show_text_only("壁には指向性の信号妨害装置が設置されていた。

懇意の有力者に電話を掛けようとしても、
電波が入らず客達は戸惑うばかり。")
	await novel_interface.show_text_only("確認したら俺の携帯とイヤホンも通じなく
なっている。
シンチェンは深刻な局面だと感じたのか、
反射的に俺の後ろへと身を縮こませた。")
	await novel_interface.show_text_only("そっとシンチェンを隠すように移動して、
俺はロビーの出口を伺う。
そこには軍官っぽい女性が通せんぼを
するかのように、立ちはだかっていた。
セキュリティーチェックに関する注意事項を、
彼女は拡声器を使って読み上げている。")
	novel_interface.show_character("valkyrja","normal")
	await novel_interface.show_dialog("腕時計、アクセサリー、などの金属類は
全て外して検査を受けろ！", "軍官")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("荷物類は登録後に識別コードを貼り、
こちらに集めてからスキャンだ！", "軍官")
	await novel_interface.show_dialog("チェックをクリアした人間には、
青色のリストバンドを渡す！
そいつを装着したらロビーから出ても良いぞ！", "軍官")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("そ、そんなに厳しいのか！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("自分の手首に付けている青色のリストバンドを
二度見した。")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("（これって……俺はすでにクリアって事で
　いいんだよな？）", "レン")
	novel_interface.change_expression("panic")
	await novel_interface.show_dialog("（と、とりあえず様子を見よう……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("出て良い条件は揃っているみたいだけど、
まずはその場に溶け込む事を優先した。
出口にいる彼女は、さっき会った少尉さんと
同い年ぐらいだろうか。
血気盛んで男臭い軍人達の中、紅一点の彼女は
非常に目立っている。")
	await novel_interface.show_text_only("青い迷彩服を着た屈強な海軍兵士達が従順に、
あの子の命令を聞き入れている様子は、
何とも不思議な光景だ。")
	novel_interface.show_character("ren_full","bored")
	await novel_interface.show_dialog("（見た目は高校生か大学1年ぐらいなのに……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そんな感じに見学していると、突然1人の巨漢が
制止を振り切ってロビーの出口へと飛び出した。
巨体を揺らしながら軍人に向かって大声で叫ぶ。")
	novel_interface.show_character("miller")
	await novel_interface.show_dialog("わしは南インド聖公会のミラー大主教である！ 

貴様らは聖職者に対して、尋問する権利など
持たぬはずだ。", "ミラー")
	await novel_interface.show_dialog("そもそもお前の服装は、マサダ国防軍の装備と
全く違うではないかッ！", "ミラー")
	await novel_interface.show_dialog("お前は一体何者だ！ 
この騒動は一体、誰に許可を得たのだ！？", "ミラー")
	await novel_interface.show_dialog("まずは、君の長官に話を通したまえ！！", "ミラー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("大主教さんが小山のように軍官の子の前に
立ちはだかり、物凄い剣幕で迫っていく。")
	novel_interface.show_character("valkyrja","normal2")
	await novel_interface.show_dialog("何者だと聞かれて答えるならば、
ヴィラ・ヴァルキューレ准尉と名乗るが。
私の立場は臨時指揮者に過ぎないし、
国防軍の軍服でないのは当然だろう？", "軍官")
	novel_interface.change_expression("speechless")
	await novel_interface.show_dialog("……あんたこそ一体何なんだ？

あんたは南……南インドの何だったか？

ああ～～っ！ 税務官とかそんなとこだな？", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("軍官は目の前の男に対して何かを唐突に閃き、
ジロジロと観察しながら独り言を呟く。")
	novel_interface.show_character("valkyrja","speechless")
	await novel_interface.show_dialog("ど～～りで。こんなにもまぁブクブクと……", "ヴィラ")
	novel_interface.change_expression("normal2")
	await novel_interface.show_dialog("あんな戦争＝日常のデコピンひとつで壊れそうな
地区が、税金なんかを納められるのか？", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("大主教の顔が真っ赤になっている事も気にせず
彼女は記録係からタブレットを乱雑に受け取る。")
	novel_interface.show_character("valkyrja","happy")
	await novel_interface.show_dialog("ふん、聖職者ビザねぇ……", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("軍官は軽蔑的に笑うと、少し離れたルーレットの
テーブルへ視線を向けた。")
	novel_interface.show_character("valkyrja","happy")
	await novel_interface.show_dialog("色白で肉々しい理由が分かったよ。
あんた教皇庁の人間か。
ご老人は今日という今日を『さぞかし』
お楽しみだったようですな？", "ヴィラ")
	novel_interface.change_expression("wink")
	await novel_interface.show_dialog("神はサイコロを振らないと聞いていたのだが……

ありがとう、お陰でまたひとつ賢くなれた。", "ヴィラ")
	await novel_interface.hide_character()
	novel_interface.show_character("miller")
	await novel_interface.show_dialog("き、貴様ぁ……ッッ！！！", "ミラー")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("怒りを抑えられなくなった様子の大主教さんは、
大声で叫びながら軍官に殴りかかろうとする。
煽った代償として彼女は手酷い一撃を受ける事に
なると思ったが……
顔色ひとつ変えずに彼を待ち構え、
襟を掴むと瞬時に持ち上げてしまった。")
	await novel_interface.show_text_only("──俺は思わず息を呑む。")
	await novel_interface.show_text_only("片手で大主教さん首を押さえる軍人。

巨体を誇る大主教さんの両足が地面から
少し浮いていた。")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("（す、凄い怪力……！）", "レン")
	await novel_interface.hide_character()
	novel_interface.show_character("valkyrja","speechless")
	await novel_interface.show_dialog("チッ……あんた耳が遠いようだな。

そのご老体に免じて、もう一度だけ言ってやる。", "ヴィラ")
	novel_interface.change_expression("angry")
	await novel_interface.show_dialog("私は兵士ではない。

こんなクソ面倒事を処理するために配置された
「タルピオットプログラム」の学生だ。", "ヴィラ")
	await novel_interface.show_dialog("軍事委員会の連中め……

一時的な階級を適当に押し付けさえすれば、
何でも私達に指図できると思いやがって……", "ヴィラ")
	await novel_interface.show_dialog("こっちだってもう何日も我慢しているのだぞ！？ 

ああ！もう！これ以上私を苛立たせるなら、
あんたを海に投げ込んでサメの餌にしてやる！！", "ヴィラ")
	await novel_interface.show_dialog("分かったかッ！！！？", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("大主教さんは慌てて頷いた。

首を押さえられているせいで声も出せない
様子だ。")
	novel_interface.show_character("valkyrja","angry")
	await novel_interface.show_dialog("大人しくあっちに並んでろッ！！", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("頷いた事に彼女は納得したようで大主教さんの
首から手を離す。
彼は咳き込みながら数歩後ずさりすると、
落ち着いて荒い息を吐いた。
表情は激怒しているが、それ以上は何もせず
渋々セキュリティーチェックの列へと向かった。
……リストバンドがあれば大丈夫なんだよね？")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("あ、う、あ、あの、すみません……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("一連の出来事に怯えながらも下にいた少尉さんの
言葉を信じて手首のバンドを振り動かす。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("こ、これで外に……出られるって……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("タブレットで俺のリストバンドのバーコードを
スキャンした後、軍官は微笑みを浮かべた。
何かを納得したかのような表情を俺に見せる。")
	novel_interface.show_character("valkyrja","wink")
	await novel_interface.show_dialog("ああ、問題ない。あんたは行っていいぞ。", "ヴィラ")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("……よ、よし。

どうにかこうにか困りの種だったシンチェンも
この場の全員が見えていないようだ。
彼女の言葉にホッと胸を撫で下ろす。

許可が下りたのだから、何も起きない内に
この場を離れよう……")
	await novel_interface.show_text_only("そして扉を開けて外に出ると、目の前で
スタッフが何度も頭を下げ始めた。")
	await novel_interface.show_text_only("今日の事については、後日リバーナがマサダに
交渉し、乗客の秘匿性は絶対に確保するとの事。")
	await novel_interface.show_text_only("また現在は船室の全ての信号が遮断されている
状態だと言う事も教えてくれた。
電話をかけたい場合は有線を使用するか、
船尾甲板に行かないと駄目みたいだ。")
	novel_interface.change_music("res://assets/audio/music/unkown/UI_Main_Funk.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/Vessel.png")
	await novel_interface.show_text_only("言われた通り、俺はシンチェンを引き連れて
甲板に出てきた。")
	await novel_interface.show_text_only("船舷には最新級のスーパードヴォラ哨戒艇が
横付けされている。
旗竿はマサダを象徴する青と白の2色国旗が
掲げられていた。")
	novel_interface.show_character("ren_full","smile")
	await novel_interface.show_dialog("はぁぁ――！　
や～っと新鮮な空気が吸えた～～", "レン")
	novel_interface.change_expression("sob")
	await novel_interface.show_dialog("（カジノ船の中は窓が全部閉まってたから、
　マジで息苦しかったよ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("運河にまたがる橋を見ながら、俺は両腕を
上空に向けて広げる。
この人工河道の両岸は視界の果てまで
ずっと伸びていた。")
	novel_interface.show_character("ren_full","gratified")
	await novel_interface.show_dialog("これがスエズ運河か！", "レン")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","happy",0.25)
	await novel_interface.show_dialog("うっは～～～い！！", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("シンチェンはピョンピョンと跳ね回りながら
手すりの前まで走っていく。
壮大な景色によって興奮も一入な様子だ。")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("（それにしても……）

（なんで船尾がこっちを向いているんだ……？）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("そんな事を考えていたら、直ぐに俺の携帯が
鳴り響く。
急いで回線を繋げると、懐かしいとも思えて
しまう声が聞こえてきた。")
	await novel_interface.show_dialog("──レンちゃん！　大丈夫なの！？", "アニー")
	await novel_interface.show_dialog("どうやら、杞憂だったようだ……
海に向かって胸を張る運動でもしてるのか？", "マリル")
	await novel_interface.show_dialog("青春の空気をたっぷり吸い込んでるの？
身体に栄養が巡って再発育しちゃうねぇ……", "愛衣")
	await novel_interface.show_text_only("あっ、ホントだ。
甲板にいるレンちゃんの様子が丸分かり！")
	novel_interface.show_character("ren_full","awkward")
	await novel_interface.show_dialog("──えっ！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("辺りを見回すが、監視装置などは見つからない。
上空から俺の事を見ているのだろうか……？")
	novel_interface.show_character("ren_full","shy")
	await novel_interface.show_dialog("（こんな何もない甲板上でも見られてるって
　何か変な感じ……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("発育と言われたからって胸を隠している
場合じゃないぞ？
とにかく、早く状況を報告しろ。", "マリル")
	novel_interface.show_character("ren_full","shy_left")
	await novel_interface.show_dialog("うぅぅぅ……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("わざわざ口に出さなくても良いじゃないか……

俺は金庫で巻き起こったシンチェンとの出会いを
事細かに報告した。
特に彼女が他人には見えない点を強調する。")
	await novel_interface.show_dialog("その子って今もレンちゃんの傍にいるの？

ハッキングした監視映像を見ている限り、
レンちゃんは一人でロビーを通ってるよ……？", "アニー")
	await novel_interface.show_dialog("それとセキュリティーチェックが終わるの
早過ぎないかな？
話し通りの状況だったらレンちゃんが一番に
ロビーから出られるはずないし。", "アニー")
	novel_interface.show_character("ren_full","gratified")
	await novel_interface.show_dialog("SIDが俺の身分証を完璧に偽造してくれたから
このリストバンドをくれたんじゃないのか？
金庫室に来た少尉さんはスキャンしただけで
合格って言ってくれたけど……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("マサダの海防部隊がそこまで緩いわけがない。", "マリル")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("でも、ロビーにいた軍官も金庫室の少尉も
どうみても20歳未満の女の子で……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("嘘でしょ？ マサダでは女性にも徴兵制度が
適用されるけど、流石にその年齢でなんて……", "アニー")
	novel_interface.show_character("ren_full","normal1")
	await novel_interface.show_dialog("そう言えば『タルピオットプログラム』の学生だ
ってロビーにいた軍人は名乗ってたぞ。
あと、これは一時的に割り当てられた
任務なんだってさ。", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("なるほど、それなら説明が付くな……", "マリル")
	await novel_interface.show_dialog("タルピオット（Talpiot）は数十年の歴史を誇る
マサダ国防総参謀部直属のエリート軍事学校だ。
そちらで得たノウハウを更に改良したのが
タルピオットプログラムと言うわけだな。", "マリル")
	await novel_interface.show_dialog("入学選抜は中学生と一般軍学校から上位1%の
学生のみが招待される。", "マリル")
	await novel_interface.show_dialog("そこからメンタル、体力や知能のテストによって
更に厳格な選別を受け、
毎年の入学者は指で数えられる程度だ。", "マリル")
	await novel_interface.show_dialog("上級士官や軍事科学技術者の育成に特化しており
小規模な軍事作戦を指揮する授業内容もある。", "マリル")
	await novel_interface.show_dialog("勿論だが『マノーラ』に所属する奴の中にも、
タルピオットプログラムの学生がいるわけだ。
そこから生まれた連中は全員が精鋭で、
離反工作を行うのも困難を極めるな。", "マリル")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("ある種のエリート学校ってやつか……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("私とレンちゃんは合格できなさそうだね。", "アニー")
	await novel_interface.show_dialog("──ねぇ、レンちゃん？", "愛衣")
	await novel_interface.show_text_only("愛衣が発した声に少々のためらいを感じる。")
	await novel_interface.show_dialog("君の言ってた子供って、今も一緒に甲板に
いるのかい？", "愛衣")
	novel_interface.show_character("ren_full","worry")
	await novel_interface.show_dialog("そうだけど、どうしたの？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("今サーモグラフィーを使っているんだけど、
本当に君以外、何も見えないんだよね……", "愛衣")
	await novel_interface.show_text_only("その結果を聞いて俺の心臓が少し跳ねた。

振り返って、手すりの場所でうずくまっている
彼女の方を見る。
先程と打って変わってキョロキョロする事もなく
彼女は一点の方向をずっと眺めていた。")
	await novel_interface.show_text_only("突然立ち上がると、金色の光を放つヘッドホンを
彼女は点滅させる。
そして見つめていた方向を指差した。")
	novel_interface.show_character("stardust_small","happy")
	await novel_interface.show_dialog("私達……「あっち」に行かないとだ！", "シンチェン")
	novel_interface.change_expression("pleased")
	await novel_interface.show_dialog("理由は忘れちゃったけど、あの方向のどこかに
行かなきゃ駄目だって感じたの！", "シンチェン")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("じゃないと……そうじゃないとヤバババだよ！！", "シンチェン")
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("ねぇねぇねぇ！一緒に行こうよ！！
良いでしょ～！？", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("シンチェンは俺の手を掴んで揺らしながら、
大きな目をパチパチとさせている。
まるで母親にオモチャをねだる子供みたいだ。")
	novel_interface.show_character("ren_full","wry_smile")
	await novel_interface.show_dialog("みんな……彼女が言ってた事が聞こえたか？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("いや、レンちゃんの声しか聞こえないよ……", "アニー")
	await novel_interface.show_dialog("実体がないと、音の源となる空気の振動を
起こす事は不可能だからね。", "愛衣")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("だ、だけど俺は感じるんだって！ 
彼女の感触や温度だって……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("ん～む、レンちゃんの説明から考えると、
脳が何らかの影響を受けて──
神経線維にインパルスが引き起これされて
いるんだと思うよ。", "愛衣")
	novel_interface.show_character("ren_full","panic")
	await novel_interface.show_dialog("嘘だろ、だって俺には彼女の影まで
見えてるんだぞ！？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("自分の感覚に完全な矛盾が生じていて、
それを受け入れることができない。
俺は本能的に弁解を続けてしまう。")
	await novel_interface.show_dialog("……試しに携帯のカメラで撮ってみろ。", "マリル")
	await novel_interface.show_text_only("マリルの言う通りにカメラを彼女に向けた。

すると頭が急に痺れを感じて──")
	await novel_interface.show_text_only("画面に映ったのは景色だけ。

彼女の姿はどこにもない。")
	await novel_interface.show_text_only("しかし携帯をズラせば、膨れ面でせがむ
彼女の小さな顔が見える。")
	novel_interface.show_character("ren_full","panic")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("stardust_small","happy",0.25)
	await novel_interface.show_dialog("行～こ～う～よ～！！", "シンチェン")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("諦めずに彼女の名前が書かれていた
ピンク色の紙切れをバッグから取り出す。")
	await novel_interface.show_text_only("そして紙切れに携帯を向けるが、
……何も映らない。
元より手の中には何も存在しない事を
俺は理解してしまう。")
	await novel_interface.show_text_only("携帯越しに見ずとも、幻だったかのように
紙切れは消え失せた……")
	await novel_interface.show_text_only("次に震える手を伸ばし携帯をシンチェンの
頭の上へと置いてみる──")
	await novel_interface.show_text_only("「カツンッ」という無機質な音を立てて、
携帯は彼女の足元に落ちた。")
	novel_interface.show_character("stardust_small","konata_eye")
	await novel_interface.show_dialog("……………………？", "シンチェン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("思わず息が荒くなってしまう。

動揺が身体を蝕むと、羽虫のようなノイズが
耳の中で響き、手足すらも重たくなってきた。")
	await novel_interface.hide_background()
	await novel_interface.show_text_only("──しばらくすると、愛衣が呟いた。")
	novel_interface.show_background("res://assets/images/bg/Stardust/Vessel.png")
	await novel_interface.show_dialog("理論……いや、推論と呼ぶべきかな……", "愛衣")
	novel_interface.show_character("ren_full","sob")
	await novel_interface.show_dialog("す、推論？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("レンちゃんが呼び戻した数々の魔女達は、
身体だけじゃなく記憶も完全に保存されていた。", "愛衣")
	await novel_interface.show_dialog("実体が存在しない上に記憶喪失なんてケースは
今までになかったからさ。
もしかすると何かの条件が欠けているせいで、
中途半端な状態で生成されちゃったのかも？", "愛衣")
	await novel_interface.show_dialog("その子が求めている事は何かあるかな？

それが条件のヒントになるかもしれない。", "愛衣")
	novel_interface.show_character("ren_full","happy")
	await novel_interface.show_dialog("求めている事……あるぞ！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は彼女の言っていた方向を指差した。")
	novel_interface.show_character("ren_full","happy")
	await novel_interface.show_dialog("俺が今指してる方向に行きたいらしい。

具体的な場所は分かってないみたいだけど……", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("電話からキーボードを叩く音が聞こえた。")
	await novel_interface.show_dialog("その方向から318キロ先には……", "マリル")
	await novel_interface.show_dialog("うん……マサダブルクだね。", "アニー")

	print("=== 星尘降临篇第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
