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
	await novel_interface.show_dialog("C'è mancato davvero poco...\nFinalmente siamo tornati~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", sei ferito!\nIl tuo braccio sanguina molto!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sto bene, è solo un graffio.\nQuesto tipo di infortunio non è niente per un ragazzo!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Ma ovviamente sei una ragazza in questo momento, quindi non sforzarti così tanto!\nE ti sei anche storto la caviglia, vero...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sì... chiaramente non è semplice. Se non risolviamo tutti questi problemi,\npiù persone potrebbero rimanere ferite...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Per favore, abbi più cura di te, ok?\nIl tuo braccio sta ancora sanguinando.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Lo farò. Grazie, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Ma... non abbiamo ancora nessuna pista...\nDobbiamo andare avanti e controllare la prossima area?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Apparendo all'improvviso davanti a lei) Piccola mocciosa...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Dr. Mariru—ah, no, Comandante!\nCi stavi aspettando?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Stavamo per esplorare la prossima area...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Aspetta un attimo: hai... litigato contro qualcosa?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Uh, ho solo... provato ad aiutare un po'...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Ricordo distintamente di averti detto di non spingerti oltre!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Se ti accadesse qualcosa di incontrollabile, sarebbe una perdita tremenda per me!\nGuardati: sei già ferito!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Squadra medica! Abbiamo una ragazza ferita qui: curala subito e riportala direttamente al quartier generale!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", Il comandante Mariru sembra davvero preoccupato per te...\nForse dovremmo semplicemente...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Sì.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Un panico debole e indescrivibile si insinuò silenziosamente nel mio cuore.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
