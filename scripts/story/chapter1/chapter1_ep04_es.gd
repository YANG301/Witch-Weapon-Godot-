# chapter1_ep4.gd - Chapter 1 Episode 4
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep4_script()

func play_script():
	pass

func chapter1_ep4_script():
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-1.ogv"
	])
	await novel_interface.show_text_only("...")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("¿Mmm...?",GameConfig.player_name)
	await novel_interface.show_dialog("（Eh... ¿qué fue exactamente lo que pasó?）",GameConfig.player_name)
	await novel_interface.show_dialog("Me duele...",GameConfig.player_name)
	await novel_interface.show_dialog("（Cierto, me atacaron...）\n（Y luego me arrastré hasta la sombra de una exhibición cercana...）",GameConfig.player_name)
	await novel_interface.show_dialog("A mi alrededor hay algo parecido a unas losas de piedra.\n（Tienen grabados símbolos y letras extraños...）",GameConfig.player_name)
	await novel_interface.show_dialog("（En la placa de la exhibición ponía «Miskatonic»...）\n（Lo demás estaba borroso）",GameConfig.player_name)
	await novel_interface.show_dialog("Ahora que lo pienso, aquí está demasiado silencioso...",GameConfig.player_name)
	await novel_interface.show_dialog("¿Esos tipos ya se han ido a otra parte?",GameConfig.player_name)
	await novel_interface.show_dialog("Voy... a echar un vistazo.\nLa sala de conferencias... Liliu...",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Esto... debe de ser un sueño, ¿verdad...?\n¿Qué... qué demonios está pasando?",GameConfig.player_name)
	await novel_interface.show_text_only("En medio de un mar de llamas, como si estuviera en un jardín de esculturas,\nlas posturas de la gente seguían llenas de vida y sus expresiones eran vívidas...")
	await novel_interface.show_text_only("Pero habían perdido todo color humano y se habían vuelto de un blanco mortecino.")
	await novel_interface.show_dialog("Esto... esto... ¿cómo puede ser posible...?",GameConfig.player_name)
	await novel_interface.show_dialog("No...\n¿Qué les ha pasado... a todos...? Señorita Liliu... ¿dónde está...?",GameConfig.player_name)
	await novel_interface.show_dialog("¡Que alguien... me lo explique de una vez!",GameConfig.player_name)
	await novel_interface.show_text_only("Cuando extendí la mano para tocar el rostro helado de una mujer, su cuello se quebró en silencio y la cabeza cayó al suelo, haciéndose añicos.")
	await novel_interface.show_dialog("¿Esto es... sal?",GameConfig.player_name)
	await novel_interface.show_dialog("Ugh... uh...\n¡¡Uwaaaahhhhh!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("¡¡Uwaaaahhhhh!!!\n¡¡Aaaaaaaaaaaaaaaaaah!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
