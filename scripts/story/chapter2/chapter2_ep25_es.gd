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
	await novel_interface.show_text_only("¿Dónde estoy? \\nEstoy en una espesa niebla. Parece haber alguien ahí en la distancia.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "sombra")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… ¿Quién está ahí?")
	await novel_interface.show_text_only("Lentamente, la persona se acerca...")
	await novel_interface.show_text_only("Es un hombre extraño vestido de negro. Sus ojos son rosados y fríos...")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Esconde una sonrisa astuta en sus ojos.")
	await novel_interface.show_text_only("—Me da una sensación familiar.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("No hasta… cuando… finalmente…", "sombra")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("¿Qué estás diciendo? \\n¡Oye! ¡Esperar!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("¡Aah—!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("Todavía es antes del amanecer. El sol no ha salido. Sólo hay un rayo de suave luz roja en el horizonte.")
	await novel_interface.show_text_only("Anoche estaba muy cansado y no me cambié antes de quedarme dormido. ¿Es por eso que tuve este sueño?")
	await novel_interface.show_text_only("Abro los ojos y trato de recordar el sueño. Pero simplemente no puedo recordar lo que dijo.")
	await novel_interface.show_dialog("¿Por qué tuve ese sueño? Algo augura mal.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("¡Ah! Estás despierto.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Te levantas muy temprano.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Algo anda mal. Mariru acaba de llamarnos y nos pidió que leyéramos las noticias en su correo electrónico.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("¡Está bien! \\n¿Puede darnos un respiro...?", "Lian")
	await novel_interface.show_dialog("(Genial, Annie es el mismo de siempre) \\n(Eso fue solo un sueño, seguro.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Dejo escapar un suspiro de alivio y me cambié apresuradamente. Sentado frente a la computadora, abro el enlace que Mariru me envió.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("¡Otro Substance H robado! ¡Qué mundo tan turbulento...!", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Pero sucedió en la Segunda Ciudad Academia. ¿Qué pasa con SID? \\nAdemás…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Espera. ¡¿Qué es esto?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Aunque temprano en la mañana, la noticia acaparó los titulares de casi todos los sitios web de noticias de todo el mundo.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Antigua clase EX Substance H Tomada por un hombre misterioso que roba en el centro de investigación y colección de Akatraz")
	await novel_interface.show_text_only("El aviso de búsqueda describe a un hombre de entre 15 y 18 años. \\nSolo hay una foto del sospechoso.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Nadie está más familiarizado con este rostro que yo.")
	await novel_interface.show_dialog("Este soy… ¿yo?", "Lian")
	await novel_interface.show_text_only("Para ser exactos, soy yo cuando era niño.")
	await novel_interface.show_text_only("El aviso no revela ningún detalle del Substance H. Se le ha otorgado una calificación de peligro AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… ¿Cómo es esto posible?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("¿Qué diablos está pasando?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
