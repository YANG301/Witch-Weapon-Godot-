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
	await novel_interface.show_text_only("La Johnson Substation era un'enorme struttura all'aperto costruita prima della guerra, successivamente acquisita per intero dalla Johnson Heavy Industries della Prima Città Accademia.")
	await novel_interface.show_text_only("Negli ultimi anni, la domanda di energia nella “Zona dell'Accordo” è aumentata così bruscamente che la capacità della sottostazione è stata ampliata di venti volte.")
	await novel_interface.show_text_only("Annie ed io entriamo con cautela nella sottostazione attraverso un varco nel recinto di filo metallico.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("Questo è il punto designato, eh... Sembra piuttosto brutto qui.\nSiamo troppo tardi?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Un ronzio rivelatore di corrente sovraccarica echeggia intorno alla sottostazione e ogni tanto fuoriescono scintille dalle apparecchiature elettriche.")
	await novel_interface.show_text_only("Il terreno e le pareti sono ricoperti di segni di bruciature ramificati, come se fossero stati colpiti da un fulmine...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Questa non sembra affatto come le altre zone anomale. Mariru non si aspetta sul serio che ripariamo i trasformatori, vero?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("L'unità elettrica a lezione di fisica... è la parte che mi fa venire più mal di testa...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("La voce di Annie trema come se avesse appena ricordato il terrore di non riuscire mai a distinguere la regola della mano sinistra da quella della mano destra.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Aspetta, ascolta:\nPiù avanti...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Cos'era quello?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-Lassù—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Alzo lo sguardo e vedo nell'aria una ragazza dai capelli blu, avvolta nell'elettricità, che indossa guanti di metallo decisamente troppo grandi per la sua piccola corporatura...")
	await novel_interface.show_text_only("Attorno a lei, un gruppo di figure dalla strana recitazione si alternano lanciando attacchi selvaggi.")
	await novel_interface.show_text_only("Uno di loro è una donna circondata da cose che sembrano fiamme spettrali.")
	await novel_interface.show_text_only("Un suono secco e acuto le esce dalla gola, facendomi stringere istintivamente i denti.")
	await novel_interface.show_text_only("E gli altri... o qualunque cosa siano, perché non sono nemmeno sicuro che siano umani, sembrano essere controllati da qualcosa.")
	await novel_interface.show_text_only("Mentre ondate di attacchi si abbattono, anche i loro corpi si deformano in angoli impossibili insieme ai loro movimenti.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ah... h-ah...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Sotto l'assalto implacabile, la bambina dai capelli blu è già coperta di ferite e riesce a malapena a difendersi.")
	await novel_interface.show_text_only("No... chiamarla ragazza potrebbe essere addirittura eccessivo. Sembra più una bambina... sembra che abbia solo dieci anni.")
	await novel_interface.show_text_only("...Uh, è davvero il momento di soffermarsi su questo dettaglio?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, guarda—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("Il... grande... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Attaccante pazzo")
	await novel_interface.show_dialog("Tutti... tutti... tutti... TUTTI L'ULTIMO!!!", "Attaccante pazzo")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Uffa...!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("Quella ragazzina non potrà resistere ancora a lungo!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Bastardi—\nFermati lì!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
