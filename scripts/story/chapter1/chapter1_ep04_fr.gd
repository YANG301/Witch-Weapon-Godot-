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
	await novel_interface.show_dialog("Hm... ?",GameConfig.player_name)
	await novel_interface.show_dialog("(Hein... qu'est-ce qui s'est passé, déjà ?)",GameConfig.player_name)
	await novel_interface.show_dialog("Ça fait mal...",GameConfig.player_name)
	await novel_interface.show_dialog("(Ah oui, on m'a attaqué...)\n(Et ensuite je me suis traîné dans l'ombre d'une pièce d'exposition voisine...)",GameConfig.player_name)
	await novel_interface.show_dialog("Autour de moi, il y avait comme des stèles de pierre.\n(Des motifs et des caractères étranges y étaient gravés...)",GameConfig.player_name)
	await novel_interface.show_dialog("(Sur la plaque de l'exposition, il y avait écrit « Miskatonic »...)\n(La suite était devenue illisible.)",GameConfig.player_name)
	await novel_interface.show_dialog("N'empêche, c'est beaucoup trop silencieux...",GameConfig.player_name)
	await novel_interface.show_dialog("Ces types sont déjà partis ailleurs ?",GameConfig.player_name)
	await novel_interface.show_dialog("Je vais... aller voir ce qu'il se passe.\nLa salle de conférence... Liliu...",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("Je dois être en train de rêver... pas vrai ?\nQu'est-ce... qu'il se passe au juste ??",GameConfig.player_name)
	await novel_interface.show_text_only("Au cœur d'une mer de flammes, comme dans un jardin de statues,\nles gens conservaient des gestes vivants et des expressions encore animées...")
	await novel_interface.show_text_only("Mais ils avaient perdu toutes leurs couleurs humaines et n'étaient plus qu'un blanc cadavérique.")
	await novel_interface.show_dialog("Un truc pareil... c'est impossible...",GameConfig.player_name)
	await novel_interface.show_dialog("Non...\nQu'est-ce qui est arrivé à tout le monde... Mlle Liliu... où êtes-vous passée...",GameConfig.player_name)
	await novel_interface.show_dialog("Que quelqu'un... me le dise, bon sang !!",GameConfig.player_name)
	await novel_interface.show_text_only("Lorsque j'ai tendu la main pour toucher le visage glacé d'une femme, son cou s'est brisé sans un son ; sa tête est tombée au sol et s'est réduite en morceaux.")
	await novel_interface.show_dialog("C'est... du sel ??",GameConfig.player_name)
	await novel_interface.show_dialog("Ugh... ouh...\nAaaah !!!!",GameConfig.player_name)
	await novel_interface.show_dialog("Aaaah !!!!!!\nAAAAAAAAAAAAAAAAAAAAAH !!!!!!!!!!!!",GameConfig.player_name)

	print("=== Chapter 1 Episode 4 End ===")

	# episode end
	await novel_interface.end_story_episode(0.5)
