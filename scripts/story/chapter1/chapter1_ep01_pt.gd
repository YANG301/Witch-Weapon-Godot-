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
		"『Objetos Heterogêneos』 — informações ou suportes que, ao cumprir certas condições, desencadeiam fenômenos físicos sobrenaturais.",
		"Esses fenômenos não se submetem a nenhuma barreira conhecida, seja de dimensão, espaço-tempo, mente ou qualquer outra.",
		"Há muito tempo, os 『Objetos Heterogêneos』 espreitam ao nosso redor.",
		"Como a maioria deles assume a aparência de objetos cotidianos, é muito difícil percebê-los.",
		"No entanto, basta um estímulo específico para que provoquem anomalias além da compreensão humana.",
		"Para proteger a humanidade, essa espécie frágil, sempre nos empenhamos ao máximo para impedir que eles viessem a público.",
		"Porque a existência dessas anomalias abalaria a ordem conquistada com tanta dificuldade!"
	],Vector2(160,10),"res://assets/gui/font/HYQiHei-50S.otf",32,"",9,Color("282521"),Color(0,0,0,0),true)
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGSci.png")
	await novel_interface.show_dialog("Desde a queda da aeronave no incidente de código DA154,\n『Objetos Heterogêneos』 vêm sendo descobertos sem cessar em várias partes do mundo.","Registro")
	await novel_interface.show_dialog("Todos os nossos esforços foram em vão...","Registro")
	await novel_interface.show_dialog("Ninguém sabe quem os criou.","Registro")
	await novel_interface.show_dialog("Antes que a ciência conseguisse explicar seus princípios, o público e a mídia preferiram chamá-los de... 『milagres』.","Registro")
	await novel_interface.show_dialog("As pessoas acreditavam que eram dádivas divinas.","Registro")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGWar.png")
	await novel_interface.show_dialog("Até que alguns 『milagres』 de imenso poder foram convertidos em armas.","Registro")
	await novel_interface.show_dialog("Mais uma vez, a humanidade empunhou armas que não compreendia e começou a se massacrar.","Registro")
	await novel_interface.show_dialog("E essa guerra durou sete anos...","Registro")
	novel_interface.change_background("res://assets/images/bg/Shot/storyBGPol.png")
	await novel_interface.show_dialog("Por fim, seis países que lideravam a pesquisa de 『Objetos Heterogêneos』 assinaram um tratado de paz.","Registro")
	await novel_interface.show_dialog("Para conter o crescente sentimento antibélico da população e, ao mesmo tempo, propagar a suposta inocuidade da pesquisa heterogênea.","Registro")
	await novel_interface.show_dialog("Esses seis países aprovaram por unanimidade\na adoção do título 『Academy City』 para suas respectivas capitais.","Registro")
	await novel_interface.hide_background_with_fade()
	await novel_interface.enter_center_performance_mode([
		"『Academy City』... que nome irônico."
	],Vector2(300,-70),"res://assets/gui/font/STZHONGS.TTF",41,"res://assets/images/bg/Shot/cityMorning.png",9,Color("282521"),Color(0.0,0.0,0.0,0.4),false)
	await novel_interface.stop_music()
	await novel_interface.enter_briefing_performance_mode(
		"■ Base Alcatraz",
		"Interior da Segunda Academy City",
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
		"Três dias antes..."
	],Vector2(535,15),"res://assets/gui/font/HYQiHei-50S.otf",59,"res://assets/images/bg/Baizhu/white_bg.png",0,Color("fff"),Color(0.0,0.0,0.0,0.0),true,Color.BLACK)
	await novel_interface.enter_briefing_performance_mode(
		"■ Centro de Contenção e Pesquisa Steele Monte",
		"Quinta Academy City",
		31,
		31,
		Vector2(68,500),
		"res://assets/gui/font/HYQiHei-50S.otf",
		60
	)
	novel_interface.change_background("res://assets/images/bg/Shot/AEGIS.png")
	await novel_interface.show_dialog("Sistema de identificação Aegis ativado.", "Sistema")# color tags supported here
	await novel_interface.show_dialog("À sua disposição.", "Sistema")
	await novel_interface.show_dialog("Por favor, confirme sua identidade.", "Sistema")
	await novel_interface.stop_music()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/00002_1.ogv",
	])
	var _player_name = await novel_interface.enter_name_input_mode()
	print("=== Chapter 1 Episode 1 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
