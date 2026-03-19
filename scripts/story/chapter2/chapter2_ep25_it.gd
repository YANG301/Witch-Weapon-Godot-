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
	await novel_interface.show_text_only("Dove sono? \\nSono in una fitta nebbia. Sembra che ci sia qualcuno lì in lontananza.")
	novel_interface.show_character("ren_behind1")
	await novel_interface.show_dialog("Lian…", "Ombra")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("…Chi c'è?")
	await novel_interface.show_text_only("Lentamente la persona si avvicina...")
	await novel_interface.show_text_only("È uno strano uomo in nero. I suoi occhi sono rosati e freddi...")
	novel_interface.show_character("ren_behind2")
	await novel_interface.show_text_only("Nasconde nei suoi occhi un sorriso furbo.")
	await novel_interface.show_text_only("—Mi dà una sensazione familiare.")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_behind3")
	await novel_interface.show_dialog("Non fino a quando... quando... finalmente...", "Ombra")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Cosa stai dicendo? \\nEhi—! Aspettare!")
	await novel_interface.show_text_only("…")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_dialog("Aah—!", "Lian")
	novel_interface.change_music("res://assets/audio/music/Sunset.mp3")
	await novel_interface.show_text_only("È ancora prima dell'alba. Il sole non è sorto. C'è solo un raggio di morbida luce rossa all'orizzonte.")
	await novel_interface.show_text_only("Ero stanco morto ieri sera e non mi sono cambiato prima di addormentarmi. È per questo che ho fatto questo sogno?")
	await novel_interface.show_text_only("Apro gli occhi e cerco di ricordare il sogno. Ma non riesco proprio a ricordare cosa abbia detto.")
	await novel_interface.show_dialog("Perché ho fatto quel sogno? Qualcosa fa presagire male.", "Lian")
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Ah! Sei sveglio.", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Annie… Ti sei alzato così presto.", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_uniform","panic")
	await novel_interface.show_dialog("Qualcosa non va. Mariru ha appena chiamato e ci ha chiesto di leggere la notizia nella sua email!", "Annie")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_sleep")
	await novel_interface.show_dialog("Uh, bene! \\nPuò darci una pausa...", "Lian")
	await novel_interface.show_dialog("(Fantastico, Annie è uguale al solito) \\n(Era solo un sogno di sicuro.)", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Tiro un sospiro di sollievo e mi cambio in fretta. Seduto davanti al computer, apro il link che mi ha inviato Mariru.")
	novel_interface.show_character("ren_uniform","speechless")
	await novel_interface.show_dialog("Un altro Substance H rubato! Che mondo tormentato...", "Lian")
	novel_interface.change_expression("sprite")
	await novel_interface.show_dialog("Ma è successo nella Seconda Città Accademia. Cosa c'entra SID? \\nInoltre…", "Lian")
	novel_interface.change_expression("solemn")
	await novel_interface.show_dialog("… Aspetta. Che cos'è questo?!", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Anche se la mattina presto, la notizia ha conquistato i titoli dei giornali su quasi tutti i siti di notizie in tutto il mondo.")
	novel_interface.change_music("res://assets/audio/music/Deep Water.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/boySP_news.png")
	await novel_interface.show_text_only("Antica classe EX Substance H Preso dall'uomo misterioso che ha rubato la collezione e il centro di ricerca di Akatraz")
	await novel_interface.show_text_only("L'avviso di ricerca descrive un uomo di età compresa tra i 15 ei 18 anni. \\nC'è solo una foto del sospettato.")
	await novel_interface.show_text_only("…")
	await novel_interface.show_text_only("Nessuno conosce questo volto più di me.")
	await novel_interface.show_dialog("Questo sono... io?", "Lian")
	await novel_interface.show_text_only("Per l'esattezza sono io da ragazzino.")
	await novel_interface.show_text_only("L'avviso non rivela alcun dettaglio del Substance H. Gli è stata assegnata una classificazione di pericolo AAA.")
	novel_interface.change_background("res://assets/images/bg/APT/bedRoom.png")
	await novel_interface.show_text_only("… Com’è possibile?")
	novel_interface.show_character("ren_uniform","solemn")
	await novel_interface.show_dialog("Che diavolo sta succedendo?", "Lian")

	print("=== 第二章第25话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
