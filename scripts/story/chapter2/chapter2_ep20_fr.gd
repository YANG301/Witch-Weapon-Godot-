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
	await novel_interface.show_text_only("La sous-station Johnson était une immense installation à ciel ouvert construite avant la guerre, plus tard acquise en totalité par Johnson Heavy Industries de la First Academy City.")
	await novel_interface.show_text_only("Au cours des dernières années, la demande d'électricité dans la « zone d'accord » a augmenté si fortement que la capacité de la sous-station a été multipliée par vingt.")
	await novel_interface.show_text_only("Annie et moi nous glissons prudemment dans la sous-station à travers une brèche dans le grillage.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("C'est le point désigné, hein.... Ça a l'air plutôt mauvais ici.\nEst-ce qu'on est trop tard ?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Un bourdonnement révélateur de courant surchargé résonne autour de la sous-station et des étincelles jaillissent de temps en temps de l'équipement électrique.")
	await novel_interface.show_text_only("Le sol et les murs sont couverts de marques de brûlures ramifiées, comme s'ils avaient été griffés par la foudre...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Cela ne ressemble pas du tout aux autres zones d’anomalie. Mariru ne s'attend pas sérieusement à ce que nous réparions les transformateurs, n'est-ce pas ?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("L'unité d'électricité en cours de physique... c'est la partie qui me donne le plus mal à la tête...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("La voix de Annie tremble comme si elle venait de rappeler la terreur de ne jamais pouvoir distinguer la règle de gauche de celle de droite.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Attendez, écoutez—\nEn avant...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Qu'est-ce que c'était ?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-Là-haut—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Je lève les yeux et vois une fille aux cheveux bleus dans les airs, enveloppée d'électricité, portant des gants en métal bien trop grands pour sa petite silhouette...")
	await novel_interface.show_text_only("Autour d'elle, un groupe de personnages au comportement étrange lancent à tour de rôle des attaques sauvages.")
	await novel_interface.show_text_only("L’une d’elles est une femme entourée de choses qui ressemblent à des flammes fantomatiques.")
	await novel_interface.show_text_only("Un claquement aigu sort de sa gorge, me faisant instinctivement grincer des dents.")
	await novel_interface.show_text_only("Et les autres... ou quoi qu'ils soient, parce que je ne suis même pas sûr qu'ils soient humains, semblent être contrôlés par quelque chose.")
	await novel_interface.show_text_only("Alors que vague après vague d'attaques s'abattent, même leurs corps se tordent dans des angles impossibles au rythme de leurs mouvements.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Hah... h-haah...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Sous les assauts incessants, la petite fille aux cheveux bleus est déjà couverte de blessures et parvient à peine à se défendre.")
	await novel_interface.show_text_only("Non... la traiter de fille pourrait même être trop. Elle ressemble plus à une enfant..., elle n'a l'air d'avoir qu'une dizaine d'années.")
	await novel_interface.show_text_only("...Euh, est-ce vraiment le moment de s'attarder sur ce détail ?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, regarde—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("Le... grand... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Attaquant fou")
	await novel_interface.show_dialog("Tous... tous... tous... TOUS LES DERNIERS !!!", "Attaquant fou")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Pouah—!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("Cette petite fille ne peut plus tenir longtemps !", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Espèces de salauds—\nArrêtez-vous là !!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
