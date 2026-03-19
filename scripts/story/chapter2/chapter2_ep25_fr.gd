# chapter2_ep25.gd - 第二章第25话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep25_script()

func play_script():
	pass

func chapter2_ep25_script():
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	await novel_interface.show_text_only("Où suis-je ? \\nJe suis dans un épais brouillard. Il semble y avoir quelqu'un au loin.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Ombre")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("… Qui est là ?")
	await novel_interface.show_text_only("Lentement, la personne s’approche…")
	await novel_interface.show_text_only("C'est un homme étrange en noir. Ses yeux sont rosés et froids…")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Il cache un sourire rusé dans ses yeux.")
	await novel_interface.show_text_only("—Il me donne un sentiment familier.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Pas avant… quand… enfin…", "Ombre")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Que dis-tu ? \\nHé— ! Attendez!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Aah—!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("Il est encore avant l'aube. Le soleil n'est pas levé. Il n'y a qu'un faisceau de douce lumière rouge à l'horizon.")
	await novel_interface.show_text_only("J'étais mort de fatigue la nuit dernière et je ne me suis pas changé avant de m'endormir. Est-ce pour ça que j'ai fait ce rêve ?")
	await novel_interface.show_text_only("J'ouvre les yeux et j'essaie de me souvenir du rêve. Mais je ne me souviens tout simplement pas de ce qu'il a dit.")
	await novel_interface.show_dialog("Pourquoi ai-je fait ce rêve ? Quelque chose augure mal.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Ah ! Vous êtes réveillé.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Vous vous levez si tôt.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Quelque chose ne va pas. Mariru vient de nous appeler et nous demande de lire les nouvelles dans son e-mail !", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Euh, bien ! \\nPeut-elle nous donner une pause…", "Lian")
	await novel_interface.show_dialog("(Super, Annie est comme d'habitude) \\n(C'était juste un rêve, c'est sûr.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Je pousse un soupir de soulagement et me change en toute hâte. Assis devant l'ordinateur, j'ouvre le lien que Mariru m'a envoyé.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Un autre Substance H volé ! Quel monde troublé…", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Mais cela s'est produit dans la Deuxième Cité Académie. Qu'est-ce qu'il y a avec SID ? \\nEn plus…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Attendez. Qu'est-ce que c'est ça?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Même si tôt le matin, la nouvelle a fait la une des journaux sur presque tous les sites d’information du monde entier.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Ancienne classe EX Substance H prise par un homme mystérieux cambriolant le centre de recherche et de collection d'Akatraz")
	await novel_interface.show_text_only("L'avis de recherche décrit un homme âgé entre 15 et 18 ans. \\nIl n'y a qu'une photo du suspect.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Personne ne connaît mieux ce visage que moi.")
	await novel_interface.show_dialog("C'est... moi ?", "Lian")
	await novel_interface.show_text_only("Pour être exact, c'est moi quand j'étais petit.")
	await novel_interface.show_text_only("L'avis ne divulgue aucun détail sur le Substance H. Il a reçu une cote de danger AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… Comment est-ce possible ?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("Que se passe-t-il ?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
