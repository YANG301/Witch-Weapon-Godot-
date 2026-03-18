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
	await novel_interface.show_dialog("Hum...?",GameConfig.player_name)
	await novel_interface.show_dialog("(Hã, o que foi que aconteceu mesmo?)",GameConfig.player_name)
	await novel_interface.show_dialog("Ai...",GameConfig.player_name)
	await novel_interface.show_dialog("(Ah, é... eu fui atacado...)\n(E depois me arrastei até a sombra de uma peça de exposição próxima...)",GameConfig.player_name)
	await novel_interface.show_dialog("Ao meu redor havia algo parecido com placas de pedra\n(Nelas estavam gravados símbolos e letras estranhas...)",GameConfig.player_name)
	await novel_interface.show_dialog("(Na placa da exposição estava escrito Miskatonic...)\n(O resto estava borrado)",GameConfig.player_name)
	await novel_interface.show_dialog("Falando nisso, está quieto demais...",GameConfig.player_name)
	await novel_interface.show_dialog("Aqueles caras já foram para outro lugar?",GameConfig.player_name)
	await novel_interface.show_dialog("Vou... dar uma olhada na situação.\nO auditório... Liliu...",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Isso... é um sonho, não é...?\nO que... está acontecendo??",GameConfig.player_name)
	await novel_interface.show_text_only("Em meio a um mar de fogo, as pessoas pareciam estátuas num jardim,\ncom gestos ainda vívidos e rostos ainda cheios de expressão...")
	await novel_interface.show_text_only("Mas elas já tinham perdido as cores humanas e se tornado de um branco cadavérico.")
	await novel_interface.show_dialog("I-isso... isso não pode ser possível...",GameConfig.player_name)
	await novel_interface.show_dialog("Não...\nO que aconteceu com todo mundo...? Onde está a Srta. Liliu...?",GameConfig.player_name)
	await novel_interface.show_dialog("Alguém... me diga alguma coisa!!",GameConfig.player_name)
	await novel_interface.show_text_only("Quando estendi a mão para tocar o rosto gelado de uma mulher, o pescoço dela se partiu em silêncio; a cabeça caiu no chão e se despedaçou em vários fragmentos.")
	await novel_interface.show_dialog("Isto é... sal??",GameConfig.player_name)
	await novel_interface.show_dialog("Ugh... uuh...\nUwaaaahhhhh!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("Uwaaaahhhhh!!!!\nAaaaaaaahhhhhhhhhhhhhhhhh!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
