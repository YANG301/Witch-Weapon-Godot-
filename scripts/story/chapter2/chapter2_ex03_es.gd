# chapter2_ex03.gd - 第二章番外篇03
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex03_script()

func play_script():
	pass

func chapter2_ex03_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/APT/washingRoom.png")
	await novel_interface.show_dialog("Bonita bañera. \\nMariru realmente no le importa el dinero...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ahh. \\nEl momento más relajante después de un largo día.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Bueno…", "Lian")
	await novel_interface.show_dialog("¿Este... es mi cuerpo?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Se ve claro y se siente suave... \\nTan suave al tacto...")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("¿Qué estoy haciendo? \\nAcéptalo.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Antes de encontrar un camino de regreso a mi antiguo yo\\nEste es mi cuerpo...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("¡Qué baño tan relajante después de luchar todo el día con enemigos inesperados!", "Lian")
	await novel_interface.show_dialog("Será mejor que disfrute este momento. ¡Qué día tan agotador!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ahh.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Todavía no puedo aceptar mi voz. Suena como un gatito gimiendo...", "Lian")
	await novel_interface.show_dialog("¡Maldita sea! Esta voz es tan...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Sucio...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Mmm...", "Lian")
	await novel_interface.show_dialog("¿Cómo puedo acostumbrarme a este cuerpo?", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
