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
	await novel_interface.show_text_only("Dopo che Lian se ne va, Mariru fissa il suo dispositivo portatile con un'espressione grave.")
	await novel_interface.show_text_only("Un lungo flusso di dati mutevoli si svolge davanti ai suoi occhi.")
	await novel_interface.show_text_only("Il file sullo schermo, presumibilmente in uno stato \"bloccato\", sta cambiando.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Come può essere?! Aegis dovrebbe essere in grado di difendersi da qualsiasi attacco di rete.)\n(Potrebbe essere qualcuno del Senato...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("L'intera storia di Lian è diventata senza senso. Mentre lo schermo sfarfalla, il testo confuso si corregge gradualmente in informazioni significative.")
	await novel_interface.show_text_only("Dai frammenti illeggibili a un record pienamente coerente, il firewall offensivo di Aegis non genera mai un singolo avviso.")
	await novel_interface.show_text_only("Sul quadrante dell'orologio di Mariru, una lettera rossa \"T\" lampeggia.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Una riscrittura dei dati su questa scala è in corso sul mainframe Aegis e solo \"Themis\" ha notato l'anomalia...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Sul dispositivo portatile, la storia personale di Lian è stata completamente aggiornata.\nDall'asilo alla scuola media, ha frequentato scuole private.")
	await novel_interface.show_text_only("Pagelle, diplomi, premi, cartelle cliniche, cartelle cliniche...\nogni dettaglio indica un background familiare ricco e privilegiato.")
	await novel_interface.show_text_only("Ma non molto tempo fa, i genitori della ragazza e il fratello maggiore sono morti in un incidente aereo all'estero.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("Ai sensi del Postwar Child Welfare Act, uno scienziato di grado SS che una volta si era registrato come volontario fu assegnato come tutore della ragazza...", "Mariru")
	await novel_interface.show_dialog("(Non dirmi che anche i miei dischi sono stati alterati!)\n(Quindi questa è davvero una provocazione...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Il commento di un insegnante recita: \"Le piace sempre imitare i manierismi del fratello maggiore e non ha la moderazione che ci si aspetta da una giovane donna...\"")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Un falso così accurato... Dovrei farlo studiare adeguatamente al dipartimento informazioni.)", "Mariru")
	await novel_interface.show_dialog("(Se avessero assegnato un tutore diverso, nemmeno io sarei stato in grado di dire se fosse vero o falso.)\n(...Hanno trapiantato i record di qualcun altro?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Sembra che il quartier generale abbia bisogno di un'adeguata pulizia anti-bug.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(C'è anche una foto qui sotto?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("Una fotografia è allegata al documento come uno degli effetti personali dei defunti genitori.")
	await novel_interface.show_text_only("Nella foto, la giovane Lian ha i capelli corti e mostra con orgoglio il suo disegno.")
	await novel_interface.show_text_only("La ragazza ha disegnato una sirenetta. Nella calligrafia inglese infantile in basso a destra ci sono le parole: \"Anch'io ho i capelli rossi\"")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Ehehe... quindi è così...", "Mariru")
	await novel_interface.show_dialog("Anche se è una foto composita, era davvero adorabile da bambina~", "Mariru")
	await novel_interface.show_dialog("Le hai raccontato una storia personale ineccepibile.", "Mariru")
	await novel_interface.show_dialog("E allo stesso tempo mi stavi ricordando che questo piccolino è speciale, vero?", "Mariru")
	await novel_interface.show_dialog("Non hai mai avuto intenzione di nascondermi nulla fin dall'inizio.", "Mariru")
	await novel_interface.show_dialog("Ecco perché hai scelto deliberatamente questo disegno che ho fatto quando ero piccola—", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Quindi questi sono i messaggi che volevi trasmettermi...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
