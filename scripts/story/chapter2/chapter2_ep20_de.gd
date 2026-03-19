# chapter2_ep20.gd - 第二章第20话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep20_script()

func play_script():
	pass

func chapter2_ep20_script():
	novel_interface.change_music("res://assets/audio/music/Hard Stage.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	await novel_interface.show_text_only("Johnson Substation war eine riesige Freiluftanlage, die vor dem Krieg gebaut und später vollständig von Johnson Heavy Industries aus der First Academy City übernommen wurde.")
	await novel_interface.show_text_only("In den letzten Jahren ist der Strombedarf in der „Agreement Zone“ so stark gestiegen, dass die Kapazität des Umspannwerks inzwischen um das Zwanzigfache erweitert wurde.")
	await novel_interface.show_text_only("Annie und ich schlüpfen vorsichtig durch eine Lücke im Drahtzaun in das Umspannwerk.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("Das ist der vorgesehene Punkt, huh... Hier sieht es ziemlich schlecht aus.\nSind wir zu spät?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Ein verräterisches Summen von überlastetem Strom hallt durch das Umspannwerk, und von Zeit zu Zeit sprühen Funken aus den elektrischen Geräten.")
	await novel_interface.show_text_only("Der Boden und die Wände sind mit verzweigten Brandspuren bedeckt, als wären sie vom Blitz zerkratzt worden...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Das fühlt sich überhaupt nicht wie die anderen Anomaliezonen an. Mariru erwartet doch nicht ernsthaft, dass wir Transformatoren reparieren, oder?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("Die Elektrizitätseinheit im Physikunterricht... das ist der Teil, der mir am meisten Kopfschmerzen bereitet...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Annies Stimme zittert, als ob sie sich gerade an den Schrecken erinnert hätte, nie in der Lage zu sein, die Regel der linken Hand von der Regel der rechten Hand zu unterscheiden.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Warte, hör zu –\nVor uns...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Was war das?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-Da oben—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Ich schaue auf und sehe in der Luft ein blauhaariges Mädchen, das von Elektrizität umhüllt ist und Metallhandschuhe trägt, die viel zu groß für ihre kleine Statur sind –")
	await novel_interface.show_text_only("Um sie herum wechselt sich eine Gruppe seltsam agierender Gestalten ab, die brutale Angriffe starten.")
	await novel_interface.show_text_only("Eine von ihnen ist eine Frau, umgeben von Dingen, die wie geisterhafte Flammen aussehen.")
	await novel_interface.show_text_only("Ein schrilles, klapperndes Geräusch dringt aus ihrer Kehle und bringt mich instinktiv dazu, die Zähne nervös zu machen.")
	await novel_interface.show_text_only("Und die anderen... oder was auch immer sie sind, weil ich nicht einmal sicher bin, ob sie Menschen sind, scheinen von etwas kontrolliert zu werden.")
	await novel_interface.show_text_only("Während eine Angriffswelle nach der anderen zusammenbricht, verdrehen sich sogar ihre Körper mit ihren Bewegungen in unmögliche Winkel.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Hah... h-haah...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Unter dem unerbittlichen Angriff ist das blauhaarige kleine Mädchen bereits mit Wunden übersät und kann sich kaum noch wehren.")
	await novel_interface.show_text_only("Nein... Sie ein Mädchen zu nennen, könnte sogar zu viel sein. Sie ähnelt eher einem Kind... Sie sieht aus, als sei sie erst etwa zehn Jahre alt.")
	await novel_interface.show_text_only("...Äh, ist es jetzt wirklich an der Zeit, sich auf dieses Detail einzulassen?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, schau—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("Der... große... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Verrückter Angreifer")
	await novel_interface.show_dialog("Alle von ihnen... alle von ihnen... alle von ihnen... JEDER LETZTE VON IHNEN!!!", "Verrückter Angreifer")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Uff –!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("Das kleine Mädchen kann nicht mehr lange durchhalten!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Ihr Bastarde – \nHört sofort auf!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
