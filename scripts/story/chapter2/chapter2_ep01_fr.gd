# chapter2_ep01.gd - 第二章第1话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep01_script()

func play_script():
	pass

func chapter2_ep01_script():
	novel_interface.change_music("res://assets/audio/music/Conspiracy.mp3")
	novel_interface.change_background("res://assets/images/bg/SID/spSoundChannel.png")
	await novel_interface.show_dialog("Qu'as-tu dit ?! Le périmètre défensif de 'Aegis' relève clairement de la juridiction de notre Metropolitan Defense Bureau (MD) !", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Pour quelles raisons prenez-vous le commandement ?\nÀ moins que vous ne me donniez une raison convaincante, ne vous attendez pas à ce que je lève le blocus policier !!", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("C'est classifié. Je ne peux ni n’ai besoin de vous l’expliquer !", "Officier militaire")
	await novel_interface.show_dialog("C'est désormais l'affaire des militaires.\nVous coopérerez.", "Officier militaire")
	await novel_interface.show_dialog("Je refuse ! Cette opération est sous le commandement du Bureau de la Défense !!\nPas à moins qu'il y ait un ordre administratif du Sénat... !", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Ahem, laisse-moi dire ceci...", "Voix féminine")
	await novel_interface.show_dialog("Vous perdez encore du temps sur quelque chose d'aussi inutile ?", "Voix féminine")
	await novel_interface.show_dialog("Cette voix est—\nMariru... Officier Mariru ?!", "Officier militaire")
	await novel_interface.show_dialog("O-oui, madame !", "Officier militaire")
	await novel_interface.show_dialog("Les Secret Intelligence Division se sont séparés de l'armée il y a longtemps, vous n'avez donc pas besoin de m'appeler « Officier ».", "Mariru")
	await novel_interface.show_dialog("Mariru... Hmph !", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Il s'agit d'une communication cryptée de niveau 4 !!\nComment avez-vous même...", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Oubliez ce détail trivial pour l'instant~\nRéfléchissez à la façon dont nous allons gérer la situation devant nous.", "Mariru")
	await novel_interface.show_dialog("S’il s’agit d’une chaîne cryptée de niveau 4, parlez clairement. De toute façon, personne d'autre n'écoute ici...", "Mariru")
	await novel_interface.show_dialog("Je veux que tous les renseignements soient divulgués !!", "Mariru")
	await novel_interface.show_dialog("O-oui, madame !", "Officier militaire")
	await novel_interface.show_dialog("À l'heure actuelle, tous les systèmes de surveillance autour du centre de recherche sont tombés en panne et nous avons détecté des fluctuations spatio-temporelles à grande échelle...", "Officier militaire")
	await novel_interface.show_dialog("Fluctuations spatio-temporelles ?\nQu'est-ce que cela signifie... ?", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Le Urban Disaster Countermeasures Act l'indique très clairement, n'est-ce pas... ?", "Mariru")
	await novel_interface.show_dialog("Ne me dites pas que le Bureau de la Défense ne prend même pas la peine de lire des lois classifiées simplement parce qu'elles ne sont pas ouvertes au public ?", "Mariru")
	await novel_interface.show_dialog("Ugh... N-ne me dites pas que c'est...\nune défaillance de confinement impliquant 'Substance H'... ?", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Et en plus de ça, le Ross Goblet a soudainement disparu la nuit dernière...", "Mariru")
	await novel_interface.show_dialog("...Rien de tel ne s'est produit en New Opulentia depuis six ans, n'est-ce pas ?", "Mariru")
	await novel_interface.show_dialog("Vous devez envisager le pire des cas...", "Mariru")
	await novel_interface.show_dialog("Je-je comprends...", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Nous allons immédiatement lever le confinement intérieur et évacuer les civils sous couvert d'un exercice...", "Officier du Bureau de la Défense")
	await novel_interface.show_dialog("Bien. Comment se déroulent les déploiements militaires à l’extérieur ?", "Mariru")
	await novel_interface.show_dialog("Les unités d'opérations spéciales déploient une puissance de feu importante dans un rayon de deux kilomètres autour de la zone d'anomalie, mais nous ne pouvons toujours pas confirmer le niveau de menace.", "Officier militaire")
	await novel_interface.show_dialog("Qu’en est-il du contrôle des médias ?", "Mariru")
	await novel_interface.show_dialog("Conformément au protocole, nous exécutons C-13.", "Officier militaire")
	await novel_interface.show_dialog("Bien. Puis à partir de ce moment, le Secret Intelligence Division (SID) prendra le relais de la zone centrale de l'anomalie.", "Mariru")
	await novel_interface.show_dialog("Vous déménagez tous immédiatement également !", "Mariru")
	await novel_interface.show_dialog("Oui !", "Communication militaire")
	await novel_interface.show_dialog("Très bien...\nVous feriez mieux d'être prudents vous-mêmes.", "Officier du Bureau de la Défense")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
