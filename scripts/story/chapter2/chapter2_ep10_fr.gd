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
	await novel_interface.show_text_only("Après le départ de Lian, Mariru regarde son appareil portable avec une expression grave.")
	await novel_interface.show_text_only("Un long flux de données changeantes se déroule sous ses yeux.")
	await novel_interface.show_text_only("Le fichier à l'écran, soi-disant dans un état \"verrouillé\", est en train de changer.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Comment est-ce possible ? ! Aegis devrait être capable de se défendre contre toute attaque de réseau.)\n(Est-ce que cela pourrait être quelqu'un du Sénat... ?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Toute l'histoire de Lian s'est transformée en charabia. Au fur et à mesure que l’écran scintille, le texte tronqué se corrige progressivement en informations significatives.")
	await novel_interface.show_text_only("Des fragments illisibles à un enregistrement totalement cohérent, le pare-feu offensif de Aegis ne déclenche jamais le moindre avertissement.")
	await novel_interface.show_text_only("Sur le cadran de la montre de Mariru, une lettre rouge « T » clignote.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Une réécriture des données à cette échelle est en cours sur le mainframe Aegis, et seul \"Themis\" a remarqué l'anomalie... ?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Sur l'appareil portable, l'histoire personnelle de Lian a été entièrement mise à jour.\nDe la maternelle au collège, elle a fréquenté des écoles privées.")
	await novel_interface.show_text_only("Bulletins scolaires, diplômes, récompenses, dossiers médicaux, dossiers d'assurance...\nchaque détail indique un milieu familial riche et privilégié.")
	await novel_interface.show_text_only("Mais il n’y a pas si longtemps, les parents et le frère aîné de la jeune fille sont morts dans un accident d’avion à l’étranger.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("En vertu de la loi sur la protection de l'enfance d'après-guerre, un scientifique de rang SS qui s'était inscrit comme volontaire fut désigné comme tuteur de la jeune fille...", "Mariru")
	await novel_interface.show_dialog("(Ne me dites pas que même mes propres enregistrements ont également été modifiés !)\n(Donc c'est vraiment une provocation... ?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Le commentaire d'un enseignant se lit comme suit : \"Elle aime toujours imiter les manières de son frère aîné et n'a pas la retenue attendue d'une jeune femme...\"")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Un faux aussi complet... Je devrais demander au service d'information de l'étudier correctement.)", "Mariru")
	await novel_interface.show_dialog("(S'ils avaient désigné un tuteur différent, même moi, je n'aurais pas été en mesure de dire si c'était réel ou faux.)\n(...Ont-ils transplanté les dossiers de quelqu'un d'autre ?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(On dirait que le siège social a besoin d'un véritable balayage anti-bug.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(Il y a aussi une photo ci-dessous ?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("... !!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("Une photographie est jointe au dossier comme étant l'un des effets personnels des parents décédés.")
	await novel_interface.show_text_only("Sur la photo, la jeune Lian a les cheveux courts et exhibe fièrement son dessin.")
	await novel_interface.show_text_only("La jeune fille a dessiné une petite sirène. Dans une écriture anglaise enfantine, en bas à droite, se trouvent les mots : \"J'ai aussi les cheveux roux\".")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Hehehe... donc c'est comme ça...", "Mariru")
	await novel_interface.show_dialog("Même si c'est une photo composite, elle était vraiment adorable étant enfant~", "Mariru")
	await novel_interface.show_dialog("Vous lui avez raconté une histoire personnelle hermétique.", "Mariru")
	await novel_interface.show_dialog("Et en même temps, tu me rappelais que ce petit est spécial, n'est-ce pas ?", "Mariru")
	await novel_interface.show_dialog("Dès le début, vous n’avez jamais eu l’intention de me cacher quoi que ce soit.", "Mariru")
	await novel_interface.show_dialog("C'est pourquoi tu as délibérément choisi ce dessin que j'ai fait quand j'étais petite—", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Voilà donc les messages que vous vouliez me transmettre...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
