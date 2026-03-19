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
	await novel_interface.show_dialog("Bonjour. C'est l'heure d'un quiz !", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Tout d’abord, nommez les couleurs de ces rouges à lèvres.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Euh... Euh... Ces neuf rouges à lèvres... \\nTous rouges, n'est-ce pas ?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Attendez, certains d’entre eux sont violets, n’est-ce pas ?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Vous vous êtes tous trompés !!", "Ai")
	await novel_interface.show_dialog("Pêche, corail, magenta, cerise, violet foncé, violet pâle, raisin et lavande. 0 point !", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Ensuite, quelle est l’édition limitée YYL pour la Saint-Valentin ? \\nC'est une évidence.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Quoi, pas de logo nulle part... \\nCelui-ci avec un motif en forme de cœur ?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("C'est le moins cher. Les filles diront au revoir tout de suite si elles reçoivent celui-ci le jour de la Saint-Valentin. 0 point !", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Maintenant, remplissez le vide : quelle est la texture de ce baume à lèvres de MEC ?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Des textures ? Velours? \\nNon... soyeux ?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("Quel est le mot ? \\nJ'ai appris par cœur, mais je ne m'en souviens plus ! Bon sang!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("Pas bon... Tu ne l'as pas en toi !", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("Je n'en ai pas besoin…", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("D'accord, la dernière question...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Quel est le nom du tout premier parfum abstrait ? Quel est le prix de son étiquette ?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Euh… j'ai complètement oublié ! \\nParfums, vous m'avez.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Son prix... Une si petite bouteille... \\nEnviron… 10 dollars ?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Oups.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Faux ! Tout va mal ! \\nComme tu es incroyablement boiteux !", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Waaaah...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Hahaha.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru !! Arrête de te moquer de moi !", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
