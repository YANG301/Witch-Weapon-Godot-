# chapter2_ep07.gd - 第二章第7话
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ep07_script()

func play_script():
	pass

func chapter2_ep07_script():
	novel_interface.change_music("res://assets/audio/music/Like A Girl.mp3")
	novel_interface.change_background("res://assets/images/bg/other/BG_City_street2.png")
	novel_interface.show_character("ren_battle","gratified")
	await novel_interface.show_dialog("C'était vraiment proche....\nNous sommes finalement revenus~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", tu es blessé !\nVotre bras saigne beaucoup !", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Je vais bien, c'est juste une égratignure.\nCe genre de blessure n'est rien pour un mec !", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Mais tu es visiblement une fille en ce moment, alors ne te force pas trop !\nEt tu t'es tordu la cheville aussi, n'est-ce pas... ?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Ouais..., ce n'est clairement pas simple. Si nous ne résolvons pas tous ces problèmes,\ndavantage de personnes pourraient finir par être blessées...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("S'il vous plaît, prenez mieux soin de vous, d'accord ?\nVotre bras saigne toujours.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Je le ferai. Merci, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Mais... nous n'avons toujours aucune piste...\nDevrions-nous continuer et vérifier la zone suivante ?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(apparaissant soudain devant elle) Espèce de petit morveux...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Dr Mariru—ah, non, Commandant !\nNous attendiez-vous ?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Nous étions sur le point d'aller enquêter sur la zone suivante...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Attendez une seconde : est-ce que vous... venez de combattre quelque chose ?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Euh, j'ai seulement... essayé d'aider un peu...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Je me souviens très bien de t'avoir dit de ne pas te pousser !!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Si quelque chose d'incontrôlable vous arrivait, ce serait une perte énorme pour moi !\nRegardez-vous, vous êtes déjà blessé !", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Équipe médicale ! Nous avons une fille blessée ici : soignez-la immédiatement et ramenez-la directement au QG !", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", le Commandant Mariru semble vraiment inquiet pour vous...\nPeut-être devrions-nous simplement... ?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Ouais.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Une légère panique indescriptible s’est glissée dans mon cœur.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
