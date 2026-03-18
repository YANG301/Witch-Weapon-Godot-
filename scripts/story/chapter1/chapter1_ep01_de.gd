# chapter1_ep1.gd - Chapter 1 Episode 1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep1_script()

func play_script():
	pass

func chapter1_ep1_script():
	novel_interface.change_music("res://assets/audio/music/Hero.mp3")
	await novel_interface.enter_center_performance_mode([
		"„Anomalobjekte“ — Informationen oder Träger, die unter bestimmten Bedingungen übernatürliche physikalische Phänomene auslösen können.",
		"Diese Phänomene unterliegen keinerlei bekannten Schranken von Dimension, Raumzeit, Geist oder Ähnlichem.",
		"Seit jeher lauern „Anomalobjekte“ in unserer unmittelbaren Umgebung.",
		"Da sie zumeist wie Alltagsgegenstände erscheinen, sind sie nur schwer zu entdecken.",
		"Doch sobald sie auf bestimmte Weise aktiviert werden, können sie abnorme Phänomene hervorbringen, die das menschliche Verständnis übersteigen.",
		"Um die fragile Spezies Mensch zu schützen, haben wir mit aller Kraft verhindert, dass sie der Öffentlichkeit vor Augen treten.",
		"Denn die Existenz dieser Anomalien würde die mühsam errungene Ordnung der Gegenwart erschüttern!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Seit dem Absturz mit der Unfallnummer DA154\nwerden „Anomalobjekte“ überall auf der Welt fortwährend entdeckt.","Protokoll")
	await novel_interface.show_dialog("All unsere Bemühungen waren vergebens...","Protokoll")
	await novel_interface.show_dialog("Niemand weiß, wer sie erschaffen hat.","Protokoll")
	await novel_interface.show_dialog("Solange die Wissenschaft ihre Funktionsweise noch nicht erklären konnte, nannten Bevölkerung und Medien sie lieber... „Wunder“.","Protokoll")
	await novel_interface.show_dialog("Die Menschen glaubten, es seien Gaben Gottes.","Protokoll")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Bis einige besonders mächtige „Wunder“ zu Waffen gemacht wurden.","Protokoll")
	await novel_interface.show_dialog("Erneut griff die Menschheit ohne Zögern zu Waffen, die sie selbst nicht verstand, und begann einander abzuschlachten.","Protokoll")
	await novel_interface.show_dialog("Und dieser Krieg dauerte sieben Jahre...","Protokoll")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Schließlich schlossen sechs Staaten, die in der Forschung an „Anomalobjekten“ führend waren, einen Friedensvertrag.","Protokoll")
	await novel_interface.show_dialog("Um der kriegsmüden Bevölkerung entgegenzukommen und zugleich die Ungefährlichkeit der Anomalobjekt-Forschung zu propagieren.","Protokoll")
	await novel_interface.show_dialog("beschlossen diese sechs Staaten einstimmig, ihre Hauptstädte\nunter der Bezeichnung „Akademiestadt“ (Academy City) zu führen.","Protokoll")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"„Akademiestadt“ ... was für ein ironischer Name."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Alcatraz-Basis",
		"Im Herzen der Zweiten Akademiestadt",
		40,
		30,
		Vector2(68,460),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00001_1.ogv",
		"res://assets/video/00001_2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Whisky.mp3")
	await novel_interface.enter_center_performance_mode([
		"Vor drei Tagen..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Steelemont-Eindämmungs- und Forschungszentrum",
		"Fünfte Akademiestadt",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Aegis-Identifikationssystem aktiviert.", "System")# color tags supported here
	await novel_interface.show_dialog("Zu Ihren Diensten.", "System")
	await novel_interface.show_dialog("Bitte bestätigen Sie Ihre Identität.", "System")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
