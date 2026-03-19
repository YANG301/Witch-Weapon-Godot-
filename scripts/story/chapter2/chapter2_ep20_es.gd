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
	await novel_interface.show_text_only("La Subestación Johnson era una enorme instalación al aire libre construida antes de la guerra, luego adquirida en su totalidad por Johnson Heavy Industries de la Primera Ciudad Academia.")
	await novel_interface.show_text_only("En los últimos años, la demanda de energía en la 'Zona del Acuerdo' ha aumentado tan bruscamente que la capacidad de la subestación se ha multiplicado por veinte.")
	await novel_interface.show_text_only("Annie y me deslizo con cuidado hacia la subestación a través de un hueco en la cerca de alambre.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("Este es el punto designado, eh... Se ve bastante mal aquí.\n¿Llegamos demasiado tarde?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Un zumbido revelador de corriente sobrecargada resuena alrededor de la subestación y de vez en cuando salen chispas del equipo eléctrico.")
	await novel_interface.show_text_only("El suelo y las paredes están cubiertos de marcas de quemaduras ramificadas, como si hubieran sido arrancadas por un rayo...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Esta no se parece en nada a las otras zonas de anomalía. Mariru no espera seriamente que reparemos transformadores, ¿verdad?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("La unidad de electricidad en la clase de física... esa es la parte que más dolor de cabeza me da...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("La voz de Annie tiembla como si acabara de recordar el terror de no poder distinguir nunca la regla de la mano izquierda de la de la derecha.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Espera, escucha—\nMás adelante...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("¡¿Qué fue eso?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-Allá arriba—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Miro hacia arriba y veo a una chica de cabello azul en el aire, envuelta en electricidad, usando guanteletes de metal demasiado grandes para su pequeño cuerpo.")
	await novel_interface.show_text_only("A su alrededor, un grupo de figuras que actúan de forma extraña se turnan para lanzar ataques salvajes.")
	await novel_interface.show_text_only("Uno de ellos es una mujer rodeada de cosas que parecen llamas fantasmales.")
	await novel_interface.show_text_only("Un chasquido estridente se escapa de su garganta, lo que instintivamente me hace apretar los dientes.")
	await novel_interface.show_text_only("Y los demás... o lo que sean, porque ni siquiera estoy seguro de que sean humanos, parecen estar controlados por algo.")
	await novel_interface.show_text_only("A medida que oleadas de ataques caen, incluso sus cuerpos se tuercen en ángulos imposibles junto con sus movimientos.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ja... ja-ja...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Bajo el implacable asalto, la niña de cabello azul ya está cubierta de heridas y apenas puede seguir defendiéndose.")
	await novel_interface.show_text_only("No... llamarla niña podría incluso ser demasiado. Ella es más como una niña... solo parece tener unos diez años.")
	await novel_interface.show_text_only("...Uh, ¿es este realmente el momento de obsesionarse con ese detalle?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, mira—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("El... gran... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Atacante loco")
	await novel_interface.show_dialog("Todos ellos... todos ellos... todos ellos... ¡¡¡CADA ÚLTIMO DE ELLOS!!!", "Atacante loco")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("¡Uf!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("¡Esa niña no podrá aguantar mucho más!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Bastardos—\n¡¡Deténganse ahí!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
