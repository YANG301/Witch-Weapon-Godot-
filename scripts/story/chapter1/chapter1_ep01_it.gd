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
		"『Oggetti Eterogenei』: informazioni o supporti capaci di scatenare fenomeni fisici soprannaturali quando vengono soddisfatte determinate condizioni.",
		"Questi fenomeni non sono vincolati da alcuna barriera nota: dimensioni, spazio-tempo, mente o altro.",
		"Per lunghissimo tempo, gli 『Oggetti Eterogenei』 sono rimasti in agguato tutto intorno a noi.",
		"Poiché, nella maggior parte dei casi, hanno l'aspetto di comuni oggetti d'uso quotidiano, è estremamente difficile notarli.",
		"Tuttavia, se sottoposti a stimoli specifici, possono innescare anomalie che superano la comprensione umana.",
		"Per proteggere questa fragile specie chiamata umanità, abbiamo sempre fatto di tutto per sottrarli allo sguardo del pubblico.",
		"Perché l'esistenza stessa di queste anomalie rischierebbe di scuotere l'ordine attuale, conquistato a caro prezzo!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Dopo lo schianto del volo DA154,\n『Oggetti Eterogenei』 hanno cominciato a emergere in tutto il mondo.","Archivio")
	await novel_interface.show_dialog("Tutti i nostri sforzi sono andati in fumo...","Archivio")
	await novel_interface.show_dialog("Nessuno sa chi li abbia creati.","Archivio")
	await novel_interface.show_dialog("Prima che la scienza riuscisse a spiegarne i principi, il pubblico e i media presero a chiamarli... 『miracoli』.","Archivio")
	await novel_interface.show_dialog("La gente credeva che fossero doni di Dio.","Archivio")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Finché alcuni 『miracoli』, dotati di un potere immenso, non vennero trasformati in armi.","Archivio")
	await novel_interface.show_dialog("Ancora una volta, l'umanità impugnò senza esitare armi che non comprendeva e cominciò a massacrarsi da sola.","Archivio")
	await novel_interface.show_dialog("E la guerra durò sette anni...","Archivio")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Alla fine, sei paesi all'avanguardia nella ricerca sugli 『Oggetti Eterogenei』 raggiunsero un trattato di pace.","Archivio")
	await novel_interface.show_dialog("Per andare incontro a un'opinione pubblica sempre più stanca della guerra e presentare la ricerca sulle tecnologie eterogenee come innocua,","Archivio")
	await novel_interface.show_dialog("i sei paesi approvarono all'unanimità una risoluzione, adottando per le rispettive capitali il nome di\n『Città Accademica』 (Academy City).","Archivio")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『Città Accademica』... che nome ironico"
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Base di Alcatraz",
		"Cuore della Seconda Città Accademica",
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
		"Tre giorni fa..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Centro di Contenimento e Ricerca Steele Monte",
		"Quinta Città Accademica",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Sistema d'identificazione Aegis attivato.", "Sistema")# color tags supported here
	await novel_interface.show_dialog("Pronto a servirvi.", "Sistema")
	await novel_interface.show_dialog("Si prega di verificare la propria identità.", "Sistema")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
