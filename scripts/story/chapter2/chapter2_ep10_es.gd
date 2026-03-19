# chapter2_ep10.gd - 第二章第10话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep10_script()

func play_script():
	pass

func chapter2_ep10_script():
	novel_interface.change_music("res://assets/audio/music/Witch's Confession.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Después de que Lian se va, Mariru mira fijamente su dispositivo portátil con una expresión grave.")
	await novel_interface.show_text_only("Un largo flujo de datos cambiantes se desarrolla ante sus ojos.")
	await novel_interface.show_text_only("El archivo en la pantalla, supuestamente en estado \"bloqueado\", está cambiando.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(¿Cómo puede ser esto? Aegis debería poder defenderse contra cualquier ataque de red.)\n(¿Podría ser alguien del Senado...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Toda la historia de Lian se ha convertido en un galimatías. A medida que la pantalla parpadea, el texto confuso se corrige gradualmente y convierte en información significativa.")
	await novel_interface.show_text_only("Desde fragmentos ilegibles hasta un registro totalmente coherente, el firewall ofensivo de Aegis nunca genera una sola advertencia.")
	await novel_interface.show_text_only("En la esfera del reloj de Mariru, una letra roja \"T\" parpadea.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(¿Se está produciendo una reescritura de datos a esta escala en la computadora central Aegis, y solo \"Themis\" notó la anomalía ...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("En el dispositivo portátil, el historial personal de Lian se ha actualizado por completo.\nDesde el jardín de infantes hasta la escuela secundaria, asistió a escuelas privadas.")
	await novel_interface.show_text_only("Boletas de calificaciones, diplomas, premios, registros médicos, registros de seguros...\ncada detalle apunta a un entorno familiar rico y privilegiado.")
	await novel_interface.show_text_only("Pero no hace mucho, los padres y el hermano mayor de la niña murieron en un accidente aéreo en el extranjero.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("Según la Ley de Bienestar Infantil de la Posguerra, un científico de rango SS que alguna vez se había registrado como voluntario fue asignado como tutor de la niña...", "Mariru")
	await novel_interface.show_dialog("(¡No me digas que incluso mis propios registros también fueron alterados!)\n(¿Entonces esto realmente es una provocación...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("El comentario de un maestro dice: \"A ella siempre le gusta imitar los gestos de su hermano mayor y carece de la moderación que se espera de una joven...\".")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Una falsificación tan completa... Debería hacer que el departamento de información la estudie adecuadamente).", "Mariru")
	await novel_interface.show_dialog("(Si hubieran asignado un tutor diferente, ni siquiera yo habría podido saber si era real o falso.)\n(...¿Trasplantaron los registros de otra persona?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Parece que la sede necesita un barrido anti-insectos adecuado).", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(¿También hay una foto abajo?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("Se adjunta al expediente una fotografía como una de las pertenencias de los difuntos padres.")
	await novel_interface.show_text_only("En la foto, la joven Lian tiene el pelo corto y muestra con orgullo su dibujo.")
	await novel_interface.show_text_only("La niña ha dibujado una sirenita. En una letra infantil en inglés, en la parte inferior derecha se encuentran las palabras: \"Yo también tengo el pelo rojo\".")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Jejeje... entonces así es...", "Mariru")
	await novel_interface.show_dialog("Incluso si es una foto compuesta, ella realmente era adorable cuando era niña~", "Mariru")
	await novel_interface.show_dialog("Le diste una historia personal hermética.", "Mariru")
	await novel_interface.show_dialog("Y al mismo tiempo me recordabas que este pequeño es especial, ¿no?", "Mariru")
	await novel_interface.show_dialog("Nunca pretendiste ocultarme nada desde el principio.", "Mariru")
	await novel_interface.show_dialog("Por eso elegiste deliberadamente este dibujo que hice cuando era pequeña.", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Entonces esos son los mensajes que querías transmitirme...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
