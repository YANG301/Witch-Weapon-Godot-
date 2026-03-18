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
	await novel_interface.show_dialog("Mmh...?",GameConfig.player_name)
	await novel_interface.show_dialog("(Aspetta... che cosa mi era successo, di preciso?)",GameConfig.player_name)
	await novel_interface.show_dialog("Che male...",GameConfig.player_name)
	await novel_interface.show_dialog("(Giusto, qualcuno mi ha aggredito...)\n(E poi mi sono trascinato nell'ombra di un'esposizione lì vicino...)",GameConfig.player_name)
	await novel_interface.show_dialog("Attorno a me ci sono oggetti simili a tavolette di pietra\n(con strani simboli e caratteri incisi sopra...)",GameConfig.player_name)
	await novel_interface.show_dialog("(Sulla targhetta dell'esposizione c'è scritto Miskatonic...)\n(Il resto è ormai illeggibile.)",GameConfig.player_name)
	await novel_interface.show_dialog("A pensarci bene, qui è fin troppo silenzioso...",GameConfig.player_name)
	await novel_interface.show_dialog("Quei tipi si sono spostati da un'altra parte?",GameConfig.player_name)
	await novel_interface.show_dialog("Vado a dare un'occhiata... con cautela.\nSala conferenze... Liliu...",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Sto sognando... vero?\nChe diavolo... è successo??",GameConfig.player_name)
	await novel_interface.show_text_only("In mezzo a un mare di fiamme, le persone sembravano statue in un giardino: i movimenti ancora vivi, le espressioni ancora nitide...")
	await novel_interface.show_text_only("Ma avevano perso i colori degli esseri umani ed erano diventate di un bianco spettrale.")
	await novel_interface.show_dialog("Una cosa del genere... non può essere...",GameConfig.player_name)
	await novel_interface.show_dialog("No...\nChe cosa è successo a tutti...? Signorina Liliu... dove sei...?",GameConfig.player_name)
	await novel_interface.show_dialog("Qualcuno... me lo dica!!",GameConfig.player_name)
	await novel_interface.show_text_only("Quando allungai la mano per sfiorare il viso gelido di una donna, il suo collo si spezzò senza emettere un suono; la testa cadde a terra e andò in frantumi.")
	await novel_interface.show_dialog("Questo è... sale??",GameConfig.player_name)
	await novel_interface.show_dialog("Ugh... ah...\nAaaahhhhh!!!!",GameConfig.player_name)
	await novel_interface.show_dialog("Aaaahhhhh!!!\nAaaaaaaaaaaaaaaaaah!!!!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
