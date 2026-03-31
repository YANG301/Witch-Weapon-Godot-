# stardustdescends_ep16.gd - 星尘降临篇第16话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	stardustdescends_ep16_script()

func play_script():
	pass

func stardustdescends_ep16_script():
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_ShelterOffice.png")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("──ここに何人ぐらい子供達が暮らしているの？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("思い沈むハイファおばさんに俺は聞いた。")
	await novel_interface.show_dialog("……32人よ。

全員が集落の孤児で、10歳よりも
下の子ばかり。", "ハイファ")
	await novel_interface.show_dialog("昼間は社会福祉士の方が手伝いに来て下さるけど
私の能力だと今の人数が手一杯で……", "ハイファ")
	await novel_interface.show_dialog("このスラムだけでも親を失くした子達は
数百人といるわ。
マサダからの予算支援が少なすぎて、
保育施設の経営存続すら危うい状況なのにね。", "ハイファ")
	await novel_interface.show_text_only("──マリルの言う通りだ。

マサダが大規模な軍隊を維持するためだけに
周囲のリソースを略奪し尽くしたら、
暮らしている人々はもう持たない……")
	novel_interface.show_character("ren_medical","worry")
	await novel_interface.show_dialog("他にみんなを助けてくれる人はいないの？

マサダはNGOの国内活動を許可してるはず
でしょ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("白ヘルメットを被った人達が来たりしたけど……

身体に障害のある子の写真を数枚撮ったら、
そのまま帰って行ったわ。", "ハイファ")
	await novel_interface.show_dialog("現状も何とかなっているのは、子供達が色々と
手伝ってくれるから。
私の力不足が子供達の自由を奪っていて……", "ハイファ")
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("そんな事は言っちゃダメだよ！ 

子供達は絶対あなたに感謝してるはずだし、
俺だって世話になった時は……", "レン")
	await novel_interface.show_dialog("と、とにかく「家族がいる」って事が
子供達にとっては大切だからさ！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("ハイファおばさんの悲しげな様子に
思わず言葉が出してまった。
最初は驚きの表情を浮かべる彼女だったが
徐々に優しい笑顔へと変わっていく。")
	await novel_interface.show_dialog("本当に良い子ね……レンちゃん。

レンちゃんはマサダの人じゃないのよね？", "ハイファ")
	await novel_interface.show_dialog("エミから聞いたけど、今夜ここに泊まって
行くのでしょ？", "ハイファ")
	novel_interface.show_character("ren_medical","gratified")
	await novel_interface.show_dialog("明日は停戦協定の調印式があるからさ、
内城区域が厳戒態勢になってるんだ。
だから朝までは身動きが取れなくて……

……えっと、すみませんお邪魔します！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("畏まらなくても大丈夫よ。
それじゃ、お風呂の準備をしないとね。", "ハイファ")
	await novel_interface.show_text_only("そう言って部屋から離れるハイファおばさん。

無理して俺に笑顔を咲かせてくれていたが、
暗くなる表情は隠し切れていなかった。
彼女は扉を出る間際に独り言を呟く。")
	await novel_interface.show_dialog("……1枚の紙切れだけで解消されるのかしら。

……ここまで深く積もった恨みが。", "ハイファ")
	await novel_interface.stop_music()
	await novel_interface.hide_background()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("──SID指令室")
	novel_interface.change_music("res://assets/audio/music/Normal Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	await novel_interface.show_text_only("マリルはコーヒーカップを2つ持って、
あくびをしながら指令室へと入った。
中では愛衣が画面の前で作業を続けている。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("こんな面白味のない情報収集作業なんかに、
お前が乗り気とは珍しいな。", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","wink")
	await novel_interface.show_dialog("目標が面白いからね～♪", "愛衣")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("キャラメルマキアートが入っているカップを
マリルは愛衣の机に置いた。
直ぐに愛衣が手に取って口を付ける。")
	novel_interface.show_character("liliu_uniform1","normal2")
	await novel_interface.show_dialog("そんなに甘いモノを夜遅くに飲むと
無駄な肉がつくぞ？", "マリル")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("糖分は脳が吸収するから問題ないさ。

それよりも突破口を発見したから聞いてよ。", "愛衣")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("liliu_uniform1","normal1",0.25)
	await novel_interface.show_dialog("情報提供者が見つかったのか？", "マリル")
	novel_interface.character_light(0.35,"normal")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("んーや、結局は1人も見つからなかったわ。

『0812項目』の機密レベルじゃ研究の全体像を
知っている人間なんて10人もいないだろうし。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"sigh")
	await novel_interface.show_dialog("パランティアがそれほどに貴重な情報源である
人間を簡単に手放すはずないか……", "マリル")
	novel_interface.character_light(0.35,"stare")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("だから発想を逆転したのさ。", "愛衣")
	await novel_interface.show_dialog("宇宙機＋異質物の技術開発は当時の国家工業の
英知だとは思わない？", "愛衣")
	await novel_interface.show_dialog("設計、研究、開発、製造、輸送……
参加したスタッフは少なくとも数千人規模。", "愛衣")
	novel_interface.change_expression("think")
	await novel_interface.show_dialog("この項目の秘密保護法に関しては、連邦政府の
解体後に失効しているのよね。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("まさかネット上から分析を試みる気か？

無関係のゴミ情報ばかりが大量に
蔓延ってるぞ？", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("──愛衣は肩をすくめた。")
	novel_interface.show_character("ai","normal")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("liliu_uniform1","sigh",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("一部の元スタッフが事実情報を売り……", "愛衣")
	await novel_interface.show_dialog("次にネット広告会社が情報に尾ひれを付けて
人目を惹くタイトルでネットへと載せる。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("人々が興味を失うまでフェイクニュースと
タイトル詐欺を何度も拡散させて──
今や600万以上の「NASA機密」関連情報が
結果として公開されているわ。
こういう国家機密的なネタは、みんな大好きで
釣られちゃうからねぇ。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal1")
	await novel_interface.show_dialog("600万以上か……", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("こめかみを抑えて首を振るマリル。

対して愛衣はおどけた表情を見せる。")
	novel_interface.show_character("ai","stare")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("liliu_uniform1","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("だけど確実に潜んでると分かっている情報なら、
見つけ出す方法を探すだけで良いじゃない？
AIで語意解析と情報源分析、確信度が90%を
超えたものだけを抽出すると……", "愛衣")
	novel_interface.change_expression("wink")
	await novel_interface.show_dialog("……情報は意外と転がってるモノさ。", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("愛衣がキーボードを叩いた瞬間、画面に大量の
資料が表示される。
その全てはマリルの興味を惹きつける
モノだった。")
	novel_interface.show_character("ai","normal")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("liliu_uniform1","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("『0812項目』の総質量は30～50トンと
推測される。
光学設備を5トンも積んでいるのに、
生命維持装置は取り付けられてないみたい。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("ここまで重いと衛星とは呼べんぞ……

……まさか無人の宇宙ステーションか？", "マリル")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("高度660から36000キロメートル範囲の
軌道変更が可能な──
2つの推進システムを搭載している時点で、
容量的に無人でも可笑しくないね。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("1つ目のイオン推進エンジンは比較的少ない
燃料で長時間の動作ができるけど、
想定寿命を約30年として設計されたから
重量が嵩んでる。", "愛衣")
	novel_interface.change_expression("normal") 
	await novel_interface.show_dialog("もう1つのロケットエンジンなんて全体質量の
約半分を占めているらしいわ。
こっちは地球降下の際に使われるようね。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"serious")
	await novel_interface.show_dialog("長期周回と軌道調整を幾度も可能とする機能……

400光年外のシグナル源に照準を合わせるため
と考えても違和感はない。", "マリル")
	novel_interface.character_light()
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("物理的な回収手段が想定されているであれば……

収集する予定の情報量が無線で転送できないほど
大きいなんて事も有り得るかも。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("莫大な情報量を信号から確保するにしても
スケールの大きさには驚きだな。", "マリル")
	novel_interface.change_2nd_expression("normal1")
	await novel_interface.show_dialog("これだけ規模のデカい物と判明したんだ、
位置の特定は容易に出来そうだが……", "マリル")
	novel_interface.character_light(0.35,"think")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("そうなんだけどね～

こんな大きな物体が『セントリーシステム』の
監視から逃れるなんて普通は出来ないのに……", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("あの小惑星の監視システムを利用すれば
各軌道下の物体を調べられるだろう？", "マリル")
	novel_interface.character_light(0.35,"normal")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("そう思って調べてみたんだけどさ。

特徴の合致した衛星は一年前に軌道変更を
行ったきりで、それ以降の消息は不明なの。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("……そのタイミングで制御コードが
出品されたのか？", "マリル")
	novel_interface.character_light(0.35,"wink")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("こんな大きな物体を完璧に隠すなんて……
月の裏側にでも移動させたのかな？
まあ、流石に闇市の情報に繋がるかどうかは
分からないかな～", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"sigh")
	await novel_interface.show_dialog("肝心な部分は上手く隠匿されているか……

だが、ここまで分かっただけでも価値はある。

こんなAIをいつ作ったんだ？
確信度を検索できるとは世紀の発明だぞ？", "マリル")
	novel_interface.character_light(0.35,"think")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("本当に何かしら受賞しても良いレベルの
代物だよね。
でも残念ながらコレは私が作った物じゃ
ないんだ。
数日前『Elder Seven』というIDの
アカウントがネット上にアップしててさ。", "愛衣")
	novel_interface.change_expression("wink")
	await novel_interface.show_dialog("今オープンソースソフトウェアに関する
界隈を賑わせているの。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("こんな代物が一般公開されただと？", "マリル")
	novel_interface.character_light(0.35,"normal")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("疑う気持ちは大いに分かるよ？

相当な計算能力で学習させないと制作不可能な
レベルのAIだもん。", "愛衣")
	await novel_interface.show_dialog("1人の力で完成できる規模のコードじゃないし、
価値は数十億に匹敵すると思う。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal1")
	await novel_interface.show_dialog("諸手を挙げて買いたい奴もいるだろうに
信じられん……
隔離はちゃんとしているな？", "マリル")
	novel_interface.character_light(0.35,"wink")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("当然よ。

『Themis』のバーチャルパソコン上で
試しに動かしてみたわ。", "愛衣")
	novel_interface.change_expression("normal")
	await novel_interface.show_dialog("私も最初はガセか何かと疑ったんだけど、
アルゴリズムは本物だった。
ネットから同類情報を迅速に分類して
関係性を判断──", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("同時に相違ある情報源から共通度を測定し、
情報の確信度の判断が行われているの。", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"jest")
	await novel_interface.show_dialog("悪質な広告会社に対して効果は抜群だな。

粗悪な広告しか作成できない連中に対して
鉄槌を下す素晴らしいツールだが……", "マリル")
	novel_interface.character_light(0.35,"blush_think")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("このAIはネット以外でも検索が可能だよ。
例えば「情報量が莫大なデータベース」でもね。", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("──マリルの表情が厳しくなっていく。")
	novel_interface.show_character("ai","blush_think")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("liliu_uniform1","serious",0.25)
	await novel_interface.show_dialog("もし、このAIを政府の監視システムに
接続させた場合……", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("例えば画像認識システムと組み合わせれば、
人々のプロフィールの確保も容易になり、
個々人の交流など関係性すらも判断できる
ようになる。")
	await novel_interface.show_text_only("相手の目的を判断、行為すらも予測可能となれば
確信度がある情報とは心理を読む事と同じ。
更には意図的に行為を誘導する事さえ……")
	await novel_interface.show_text_only("……マリルは頭を振る。

大変な事実に頭を抱えるが、今は目先の事に
集中するべきと判断した。")
	novel_interface.show_character("ai","blush_think")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("liliu_uniform1","sigh",0.25)
	await novel_interface.show_dialog("このAIに関しては、また後ほど話そう。", "マリル")
	novel_interface.change_2nd_expression("normal1")
	await novel_interface.show_dialog("明日の調印式だが、マサダは国防軍北方司令部の
ハモン陸軍少将を代表とした。", "マリル")
	await novel_interface.show_dialog("調印式の行われる場所はマサダ国際会議場だ。", "マリル")
	novel_interface.character_light(0.35,"think")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("死海沿いにある会議場だよね？

隔離壁の中でサインした協定なんて説得力ないし
良いと思うよ。", "愛衣")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("そう言えば今まで聞いてなかったけど、
レジスタンスってどんな人達なの？", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal2")
	await novel_interface.show_dialog("今まで聞かれた事は無かったが、
教えた事も無かったか……", "マリル")
	await novel_interface.show_dialog("最初は地方の民族武装集団や過激宗教団体、
政府解体後の元軍人に──
賊なども併せて集結した連合軍だった。", "マリル")
	await novel_interface.show_dialog("こいつらの共通点はマサダへの恨みだけ。
内部は言語の統制も取れていない。
普通であれば各個撃破されて終わるような
組織だったが……", "マリル")
	novel_interface.character_light(0.35,"normal")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("そんな連中を率いて今まで戦ってきたなんて、
リーダーは一体何者？", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal1")
	await novel_interface.show_dialog("レジスタンス側の代表として、明日の協定に調印
するのはワリード・ムシャルと言う名の男だ。", "マリル")
	await novel_interface.show_dialog("二世代ほどの装備差がありながらも国防軍の
包囲攻勢に抵抗しつつ勢力を広げた人物──
と言えば、まるで偉人の解説のようだな。", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("愛衣は画面にワリード・ムシャルの
プロフィールを表示する。")
	novel_interface.show_character("ai","dizzy")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.character_light()
	novel_interface.show_2nd_character("liliu_uniform1","normal1",0.25)
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……って彼、博士号を持っているの！？", "愛衣")
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("びっくりだろう？

ベン＝グリオン大学の物理学者……
それが世界最高額の賞金首だった男の前職さ。", "マリル")
	novel_interface.change_2nd_expression("serious")
	await novel_interface.show_dialog("七年戦争時にあった聖城の破壊の後……

怒り狂ったマサダ人がベエルシェバに住んでいた
彼の奥さんと娘を引きずり出してな……", "マリル")
	novel_interface.character_light(0.35,"think")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("自民族以外を恨んで無差別攻撃するなんて
一人遊びするよりも無意味な行為だよ？
人類は実に救いようのない生き物だねぇ。", "愛衣")
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("案の定、愛衣の下ネタを絡めた発言に
マリルの手刀が飛ぶ。
愛衣は本能的に首を引っ込めたが……
今回は軽く叩かれただけで終わった。")
	novel_interface.show_character("ai","think")
	novel_interface.character_move_left(-0.25,0)
	novel_interface.show_2nd_character("liliu_uniform1","sigh",0.25)
	await novel_interface.show_dialog("……そうだな。人間は愚かだ。", "マリル")
	novel_interface.change_2nd_expression("normal1")
	await novel_interface.show_dialog("事件を期にムシャルは大学から離れた。

そして再び公に姿を現した時にはマサダで
一番のお尋ね者となっていた。", "マリル")
	await novel_interface.show_dialog("マサダの自動反撃システムが完成せずに
稼働していなかったら、
奴は死ぬまで戦うつもりだったのだろう……", "マリル")
	novel_interface.change_2nd_expression("normal2")
	await novel_interface.show_dialog("お前も死ぬまで画面の前に座っているつもりか？

すでに何時間も作業をしているんだ。
少しは寝たらどうだ？", "マリル")
	novel_interface.change_2nd_expression("normal1")
	await novel_interface.show_dialog("明日は何が起こるか分からんからな……", "マリル")
	await novel_interface.hide_all_characters()
	await novel_interface.stop_music()
	await novel_interface.hide_background_with_fade()
	await novel_interface.show_text_only("…………")
	await novel_interface.show_text_only("……")
	await novel_interface.show_text_only("──マサダ外城区域　孤児院")
	novel_interface.change_music("res://assets/audio/music/Shop.mp3")
	novel_interface.change_background("res://assets/images/bg/Stardust/BG_Stardust_ShelterCorridor.png")
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("ふぅ、砂だらけだった髪も綺麗さっぱり！
やっぱお風呂って大事だよな～", "レン")
	novel_interface.change_expression("wry_smile")
	await novel_interface.show_dialog("（そして軍用物資の中に使い捨てパンツが
　あったのは助かった……）", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("浴室は予想より広くて、綺麗に掃除されていた。

洗面台の上には子供のおもちゃがたくさん
置かれている。")
	await novel_interface.show_text_only("俺は髪を拭きながら浴室の外で充電してた
携帯を手に取った。
無線スピーカーへの接続をオフにする。")
	await novel_interface.show_dialog("レンちゃん、お風呂は終わった？", "ハイファ")
	novel_interface.show_character("ren_medical","smile")
	await novel_interface.show_dialog("うん、すごく気持ち良かったよ。
ありがとう、ハイファおばさん！", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_dialog("そう言えば浴室で音楽を聴いていたわよね？
でも携帯は外に置いてあったから……", "ハイファ")
	novel_interface.show_character("ren_medical","shy_left")
	await novel_interface.show_dialog("え、いや、あの、き、気のせいじゃないかな？", "レン")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("俺は顔を真っ赤にしながら胸を隠そうとした。")
	await novel_interface.show_text_only("その時、携帯と一緒に置いてあった
トランシーバーから通信が聞こえてくる。")
	await novel_interface.show_dialog("──レンちゃん、聞こえるッ！？", "エミリオ")
	novel_interface.show_character("ren_medical","serious")
	await novel_interface.show_dialog("ん、どうしたんだ？", "レン")
	await novel_interface.hide_character()
	await novel_interface.stop_music()
	await novel_interface.show_dialog("ハイファおばさんに明かりを全て消してと
伝えてッ！
それと扉のロック！！
ヤバいモノを見つけ──────", "エミリオ")
	await novel_interface.show_text_only("――――……ザーーーー…………

話の途中で、トランシーバーの向こう側からは
ノイズの音しか聞こえなくなった……")

	print("=== 星尘降临篇第16话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
