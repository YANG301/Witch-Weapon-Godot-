# chapter2_ep25.gd - 第二章第25话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep25_script()

func play_script():
	pass

func chapter2_ep25_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	await novel_interface.show_text_only("Wo bin ich? \\nIch befinde mich in dichtem Nebel. Da scheint in der Ferne jemand zu sein.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Schatten")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… Wer ist da?")
	await novel_interface.show_text_only("Langsam kommt die Person näher ...")
	await novel_interface.show_text_only("Es ist ein seltsamer Mann in Schwarz. Seine Augen sind rosa und kalt ...")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Er verbirgt ein schlaues Lächeln in seinen Augen.")
	await novel_interface.show_text_only("—Er gibt mir ein vertrautes Gefühl.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Erst... wenn... endlich...", "Schatten")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Was sagst du? \\nHey—! Warten!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Aah –!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("Es ist noch vor Tagesanbruch. Die Sonne ist noch nicht aufgegangen. Am Horizont ist nur ein Strahl sanften roten Lichts zu sehen.")
	await novel_interface.show_text_only("Ich war letzte Nacht todmüde und habe mich vor dem Einschlafen nicht umgezogen. Hatte ich deshalb diesen Traum?")
	await novel_interface.show_text_only("Ich öffne meine Augen und versuche, mich an den Traum zu erinnern. Aber ich kann mich einfach nicht erinnern, was er gesagt hat.")
	await novel_interface.show_dialog("Warum hatte ich diesen Traum? Etwas verheißt nichts Gutes.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Ach! Du bist wach.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Du bist so früh wach.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Etwas stimmt nicht. Mariru hat gerade angerufen und uns gebeten, die Neuigkeiten in ihrer E-Mail zu lesen!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Äh, gut! \\nKann sie uns eine Pause gönnen?", "Lian")
	await novel_interface.show_dialog("(Großartig, Annie ist das Gleiche wie immer) \\n(Das war sicher nur ein Traum.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Ich atme erleichtert auf und ziehe mich hastig um. Ich sitze vor dem Computer und öffne den Link, den mir Mariru geschickt hat.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Noch ein Substance H gestohlen! Was für eine unruhige Welt ...", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Aber es geschah in der Zweiten Akademiestadt. Was ist mit SID? \\nAußerdem…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Warte. Was ist das?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Allerdings sorgten die Nachrichten schon am frühen Morgen für Schlagzeilen auf fast allen Nachrichten-Websites auf der ganzen Welt.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Antiker EX-Klasse Substance H Entnommen von einem mysteriösen Mann, der das Sammlungs- und Forschungszentrum von Akatraz einbricht")
	await novel_interface.show_text_only("In der Fahndungsanzeige wird ein Mann im Alter zwischen 15 und 18 Jahren beschrieben. \\nVon dem Verdächtigen gibt es nur ein Bild.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Niemand kennt dieses Gesicht besser als ich.")
	await novel_interface.show_dialog("Das bin... ich?", "Lian")
	await novel_interface.show_text_only("Um genau zu sein: Ich bin es, als ich ein Junge war.")
	await novel_interface.show_text_only("Die Bekanntmachung enthält keine Einzelheiten zu Substance H. Er wurde mit der Gefahreneinstufung AAA eingestuft.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… Wie ist das möglich?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("Was zum Teufel ist los?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
