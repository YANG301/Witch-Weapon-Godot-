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
	await novel_interface.show_dialog("Cos'hai detto?! Il perimetro difensivo di 'Aegis' rientra chiaramente sotto la giurisdizione del nostro Metropolitan Defense Bureau (MD)!", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Per quale motivo prendi il comando?\nA meno che tu non mi dia una ragione convincente, non aspettarti che tolga il blocco della polizia!!", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("E' classificato. Non posso né ho bisogno di spiegartelo!", "Ufficiale militare")
	await novel_interface.show_dialog("Adesso questa è una questione che spetta ai militari.\nCoopererai.", "Ufficiale militare")
	await novel_interface.show_dialog("Mi rifiuto! Questa operazione è sotto il comando dell'Ufficio della Difesa!!\nNo, a meno che non ci sia un ordine amministrativo da parte del Senato...!", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Ehm, lasciatemi dire questo...", "Voce femminile")
	await novel_interface.show_dialog("Stai ancora perdendo tempo con qualcosa di così inutile?", "Voce femminile")
	await novel_interface.show_dialog("Quella voce è—\nMariru... Ufficiale Mariru?!", "Ufficiale militare")
	await novel_interface.show_dialog("S-sì, signora!", "Ufficiale militare")
	await novel_interface.show_dialog("I Secret Intelligence Division si sono staccati dall'esercito molto tempo fa, quindi non c'è bisogno che mi chiami \"Ufficiale\".", "Mariru")
	await novel_interface.show_dialog("Mariru... Tsk!", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Questa è una comunicazione crittografata di livello 4!!\nCome hai fatto...", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Dimentica quei dettagli banali per ora~\nPensa a come gestiremo la situazione che abbiamo di fronte.", "Mariru")
	await novel_interface.show_dialog("Se questo è un canale crittografato di livello 4, parla chiaro. Comunque nessun altro sta ascoltando qui dentro...", "Mariru")
	await novel_interface.show_dialog("Voglio che tutte le informazioni siano divulgate!!", "Mariru")
	await novel_interface.show_dialog("S-sì, signora!", "Ufficiale militare")
	await novel_interface.show_dialog("Al momento, tutti i sistemi di sorveglianza attorno al centro di ricerca hanno fallito e abbiamo rilevato fluttuazioni spaziotemporali su larga scala...", "Ufficiale militare")
	await novel_interface.show_dialog("Fluttuazioni spaziotemporali?\nCosa significa...?", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Il Urban Disaster Countermeasures Act lo afferma chiaramente, non è vero...?", "Mariru")
	await novel_interface.show_dialog("Non dirmi che l'Ufficio della Difesa non si preoccupa nemmeno di leggere gli statuti riservati solo perché non sono aperti al pubblico?", "Mariru")
	await novel_interface.show_dialog("Ugh... D-non dirmi che questo è...\nun fallimento di contenimento che coinvolge 'Substance H'...?", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("E per di più, il Ross Goblet è improvvisamente scomparso ieri notte...", "Mariru")
	await novel_interface.show_dialog("...Niente di simile accadeva in New Opulentia da sei anni, vero?", "Mariru")
	await novel_interface.show_dialog("Devi considerare lo scenario peggiore:", "Mariru")
	await novel_interface.show_dialog("S-capisco...", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Revocheremo immediatamente il blocco interno ed evacueremo i civili con il pretesto di un'esercitazione...", "Ufficiale dell'Ufficio Difesa")
	await novel_interface.show_dialog("Bene. Come stanno procedendo gli schieramenti esterni dell'esercito?", "Mariru")
	await novel_interface.show_dialog("Le unità per le operazioni speciali stanno dispiegando una forte potenza di fuoco entro un raggio di due chilometri attorno alla zona anomala, ma non possiamo ancora confermare il livello di minaccia.", "Ufficiale militare")
	await novel_interface.show_dialog("E il controllo dei media?", "Mariru")
	await novel_interface.show_dialog("Secondo il protocollo, stiamo eseguendo C-13.", "Ufficiale militare")
	await novel_interface.show_dialog("Bene. Quindi, da questo momento in poi, il Secret Intelligence Division (SID) prenderà il controllo della zona centrale dell'anomalia.", "Mariru")
	await novel_interface.show_dialog("Anche voi andate via tutti immediatamente!", "Mariru")
	await novel_interface.show_dialog("Sì!", "Comunicazione militare")
	await novel_interface.show_dialog("A-va bene...\nFareste meglio a stare attenti anche voi.", "Ufficiale dell'Ufficio Difesa")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
