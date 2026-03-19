# chapter2_ex01.gd - 第二章番外1
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex01_script()

func play_script():
	pass

func chapter2_ex01_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/opsRoom.png")
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Hola. ¡Es hora de hacer una prueba!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Primero, nombra los colores de estos labiales.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Err... Err... Estos nueve lápices labiales... \\nTodos rojos, ¿verdad?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Espera, algunos de ellos son morados, ¿no?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("¡¡Los entendiste todos mal!!", "Ai")
	await novel_interface.show_dialog("Melocotón, coral, magenta, cereza, morado oscuro, morado pálido, uva y lavanda. ¡0 puntos!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("A continuación, ¿cuál es la edición limitada de YYL para San Valentín? \\nEsto es una obviedad.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("¿Qué, no hay logotipo en ninguna parte... \\n¿Este tiene un diseño en forma de corazón?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Ese es el más barato. Las niñas se despedirán inmediatamente si reciben este el día de San Valentín. ¡0 puntos!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Ahora completa el espacio en blanco: ¿cuál es la textura de este bálsamo labial MEC?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("¿Textura? ¿Terciopelo? \\nNo... ¿sedoso?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("¿Cuál es la palabra? \\n¡Lo aprendí de memoria pero ahora no puedo recordarlo! ¡Maldita sea!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("No es bueno... ¡No lo tienes dentro!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("No necesito tenerlo...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Bien, la última pregunta...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("¿Cómo se llama la primera fragancia abstracta? ¿Cuál es el precio de etiqueta?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Uh… ¡lo olvidé por completo! \\nPerfumes, me tienes.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Su precio... Una botella tan pequeña... \\nAlrededor… ¿10 dólares?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Vaya.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("¡Mal! ¡Incorrectamente! \\n¡Qué increíblemente tonto eres!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Waaaah...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Jajaja.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! ¡Deja de reírte de mí!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
