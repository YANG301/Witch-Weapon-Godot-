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
		"Los «Objetos Heterogéneos» son información o soportes que, al cumplirse ciertas condiciones, pueden desencadenar fenómenos físicos sobrenaturales.",
		"Estos fenómenos no están limitados por ninguna barrera conocida, ya sea dimensional, espacio-temporal o mental.",
		"Desde hace mucho tiempo, los «Objetos Heterogéneos» han permanecido acechando a nuestro alrededor.",
		"Como la mayoría tienen la apariencia de objetos cotidianos, resulta muy difícil detectarlos.",
		"Sin embargo, con un estímulo específico pueden provocar anomalías que sobrepasan la comprensión humana.",
		"Para proteger a la frágil especie humana, hemos hecho cuanto estaba en nuestras manos por mantenerlos fuera de la vista del público.",
		"¡Porque la existencia de estas anomalías sacudiría el frágil orden que tanto nos costó construir!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Desde el accidente aéreo registrado como DA154,\nlos «Objetos Heterogéneos» han empezado a aparecer por todo el mundo.","Registro")
	await novel_interface.show_dialog("Todos nuestros esfuerzos fueron en vano...","Registro")
	await novel_interface.show_dialog("Nadie sabe quién los creó.","Registro")
	await novel_interface.show_dialog("Antes de que la ciencia pudiera explicar sus principios, la gente y los medios prefirieron llamarlos... «milagros».","Registro")
	await novel_interface.show_dialog("La gente creyó que eran un regalo de Dios.","Registro")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Hasta que algunos «milagros» de inmenso poder fueron convertidos en armas.","Registro")
	await novel_interface.show_dialog("Una vez más, la humanidad empuñó sin dudar armas que no comprendía y comenzó a masacrarse entre sí.","Registro")
	await novel_interface.show_dialog("Y aquella guerra se prolongó durante siete años...","Registro")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Por fin, las seis naciones más avanzadas en la investigación de «Objetos Heterogéneos» firmaron un tratado de paz.","Registro")
	await novel_interface.show_dialog("Para calmar a una población harta de la guerra y, al mismo tiempo, promocionar la supuesta inocuidad de la investigación en tecnología heterogénea.","Registro")
	await novel_interface.show_dialog("Estas seis naciones aprobaron por unanimidad otorgar a sus capitales el nombre de\n«Ciudad Académica» (Academy City).","Registro")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"«Ciudad Académica»... qué nombre tan irónico."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Base Alcatraz",
		"Interior de la Segunda Ciudad Académica",
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
		"Tres días antes..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Centro de Investigación y Contención Stilmont",
		"Quinta Ciudad Académica",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Sistema de identificación AEGIS activado.", "Sistema")# color tags supported here
	await novel_interface.show_dialog("A su servicio.", "Sistema")
	await novel_interface.show_dialog("Por favor, confirme su identidad.", "Sistema")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
