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
	await novel_interface.show_dialog("Ciao. È ora di un quiz!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Per prima cosa, dai un nome ai colori di questi rossetti.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Err... Err... Questi nove rossetti... \\nTutto rosso, giusto?", "Lian")
	novel_interface.change_expression("bored")
	await novel_interface.show_dialog("Aspetta, alcuni sono viola, vero?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Hai sbagliato tutto!!", "Ai")
	await novel_interface.show_dialog("Pesca, corallo, magenta, ciliegia, viola intenso, viola pallido, uva e lavanda. 0 punti!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Quindi, qual è l’edizione limitata YYL per San Valentino? \\nQuesto è un gioco da ragazzi.", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Cosa, nessun logo da nessuna parte... \\nQuesto con un design a forma di cuore?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Questo è il più economico. Le ragazze diranno subito addio se riceveranno questo a San Valentino. 0 punti!", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Ora riempi lo spazio vuoto: qual è la texture di questo balsamo labbra MEC?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Trama? Velluto? \\nNo... setoso?", "Lian")
	novel_interface.change_expression("shy")
	await novel_interface.show_dialog("Qual è la parola? \\nL'ho imparato a memoria ma ora non riesco a ricordarlo! Accidenti!", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","stare")
	await novel_interface.show_dialog("Non va bene... Non ce l'hai in te!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wail")
	await novel_interface.show_dialog("Non ho bisogno di averlo...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Ok, l'ultima domanda...", "Ai")
	novel_interface.change_expression("stare")
	await novel_interface.show_dialog("Come si chiama la prima fragranza astratta? Qual è il prezzo dell'etichetta?", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","wry_smile")
	await novel_interface.show_dialog("Uh... me ne ero completamente dimenticato! \\nProfumi, mi hai preso.", "Lian")
	novel_interface.change_expression("wail")
	await novel_interface.show_dialog("Il suo prezzo... Una bottiglia così piccola... \\nIntorno a... 10 dollari?", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Ops.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ai","normal")
	await novel_interface.show_dialog("Sbagliato! Tutto sbagliato! \\nQuanto sei incredibilmente zoppo!", "Ai")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","sob")
	await novel_interface.show_dialog("Waaaah...", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak2")
	await novel_interface.show_dialog("Ahahah.", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_uniform","awkward")
	await novel_interface.show_dialog("Mariru!! Smettila di ridere di me!", "Lian")

	print("=== 第二章番外1结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
