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
		"« Substance H » — toute information ou tout support capable de déclencher des phénomènes physiques surnaturels dès lors que certaines conditions sont réunies.",
		"Ces phénomènes ne connaissent aucune barrière connue : dimensions, espace-temps, esprit ou autre.",
		"Pendant très longtemps, la « Substance H » est restée tapie tout autour de nous.",
		"Comme elle prenait le plus souvent l'apparence d'objets du quotidien, il était extrêmement difficile de la repérer.",
		"Pourtant, une fois stimulée d'une certaine manière, elle peut provoquer des anomalies dépassant l'entendement humain.",
		"Pour protéger l'humanité, cette espèce si fragile, nous avons tout fait pour la garder hors du regard du public.",
		"Car l'existence même de ces anomalies pourrait ébranler l'ordre du monde, si durement préservé !"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Depuis le crash répertorié sous le numéro DA154,\nla « Substance H » a commencé à être découverte aux quatre coins du monde.","Archives")
	await novel_interface.show_dialog("Tous nos efforts ont été réduits à néant...","Archives")
	await novel_interface.show_dialog("Personne ne sait qui les a créées.","Archives")
	await novel_interface.show_dialog("Avant que la science n'en perce le fonctionnement, le public et les médias ont préféré les appeler... « miracles ».","Archives")
	await novel_interface.show_dialog("Les gens croyaient qu'il s'agissait d'un don de Dieu.","Archives")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Jusqu'au jour où certains « miracles » dotés d'une puissance redoutable furent transformés en armes.","Archives")
	await novel_interface.show_dialog("Une fois encore, l'humanité s'est emparée d'armes qu'elle ne comprenait pas et s'est entretuée.","Archives")
	await novel_interface.show_dialog("Et cette guerre a duré sept ans...","Archives")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Enfin, six nations à la pointe de la recherche sur la « Substance H » ont conclu un traité de paix.","Archives")
	await novel_interface.show_dialog("Afin d'apaiser une population lasse de la guerre, tout en vantant l'innocuité de la recherche sur les technologies liées à la Substance H.","Archives")
	await novel_interface.show_dialog("Ces six nations ont adopté à l'unanimité une résolution, donnant à leurs capitales le nom de\n« Cités Académiques » (Academy City).","Archives")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"« Cité Académique »... Quel nom terriblement ironique."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Base d'Alcatraz",
		"Au cœur de la Deuxième Cité Académique",
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
		"Il y a trois jours..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Centre de confinement et de recherche Steele Monte",
		"Cinquième Cité Académique",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Système d'identification Aegis activé.", "Système")# couleur possible ici, non gérée pour l'instant
	await novel_interface.show_dialog("À votre service.", "Système")
	await novel_interface.show_dialog("Veuillez confirmer votre identité.", "Système")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
