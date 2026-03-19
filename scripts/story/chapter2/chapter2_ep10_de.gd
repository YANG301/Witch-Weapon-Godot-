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
	await novel_interface.show_text_only("Nachdem Lian gegangen ist, starrt Mariru mit ernster Miene auf ihr Handgerät.")
	await novel_interface.show_text_only("Vor ihren Augen entfaltet sich ein langer Strom sich verändernder Daten.")
	await novel_interface.show_text_only("Die Datei auf dem Bildschirm, die sich angeblich in einem „gesperrten“ Zustand befindet, ändert sich.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Wie kann das sein?! Aegis sollte in der Lage sein, sich gegen jeden Netzwerkangriff zu verteidigen.)\n(Könnte das jemand von der Senat... sein?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Die gesamte Geschichte von Lian hat sich in Unsinn verwandelt. Während der Bildschirm flackert, korrigiert sich der verstümmelte Text nach und nach in aussagekräftige Informationen.")
	await novel_interface.show_text_only("Von unlesbaren Fragmenten bis hin zu vollständig kohärenten Datensätzen löst die offensive Firewall von Aegis nie eine einzige Warnung aus.")
	await novel_interface.show_text_only("Auf dem Zifferblatt von Marirus Uhr blinkt ein roter Buchstabe „T“.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Eine Datenumschreibung dieser Größenordnung findet auf dem Aegis-Mainframe statt, und nur „Themis“ hat die Anomalie bemerkt...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Auf dem Handheld-Gerät wurde Lians persönlicher Verlauf vollständig aktualisiert.\nVom Kindergarten bis zur Mittelschule besuchte sie Privatschulen.")
	await novel_interface.show_text_only("Zeugnisse, Diplome, Auszeichnungen, Krankenakten, Versicherungsunterlagen...\nJedes Detail weist auf eine wohlhabende, privilegierte Familie hin.")
	await novel_interface.show_text_only("Doch vor nicht allzu langer Zeit kamen die Eltern und der ältere Bruder des Mädchens bei einem Flugzeugabsturz im Ausland ums Leben.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("Nach dem Kinderfürsorgegesetz der Nachkriegszeit wurde ein SS-Wissenschaftler, der sich einst als Freiwilliger gemeldet hatte, als Vormund des Mädchens eingesetzt...", "Mariru")
	await novel_interface.show_dialog("(Erzähl mir nicht, dass auch meine eigenen Aufzeichnungen geändert wurden!)\n(Das ist also wirklich eine Provokation...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Der Kommentar einer Lehrerin lautet: „Sie ahmt immer gerne die Verhaltensweisen ihres älteren Bruders nach und es fehlt ihr die Zurückhaltung, die man von einer jungen Dame erwartet...“")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Eine so gründliche Fälschung... Ich sollte dafür sorgen, dass die Informationsabteilung sie gründlich untersucht.)", "Mariru")
	await novel_interface.show_dialog("(Hätten sie einen anderen Vormund eingesetzt, hätte nicht einmal ich sagen können, ob es echt oder gefälscht war.)\n(...Haben sie die Unterlagen einer anderen Person transplantiert?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Sieht so aus, als ob das Hauptquartier eine ordentliche Insektenbekämpfung braucht.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(Gibt es unten auch ein Foto?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("Der Akte ist ein Foto als Eigentum der verstorbenen Eltern beigefügt.")
	await novel_interface.show_text_only("Auf dem Foto hat die junge Lian kurze Haare und präsentiert stolz ihre Zeichnung.")
	await novel_interface.show_text_only("Das Mädchen hat eine kleine Meerjungfrau gezeichnet. In kindlicher englischer Handschrift stehen unten rechts die Worte: „Ich habe auch rote Haare“")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Hehehe... So ist es also...", "Mariru")
	await novel_interface.show_dialog("Auch wenn es sich um ein zusammengesetztes Foto handelt, war sie als Kind wirklich bezaubernd~", "Mariru")
	await novel_interface.show_dialog("Sie haben ihr eine undurchsichtige persönliche Geschichte erzählt.", "Mariru")
	await novel_interface.show_dialog("Und gleichzeitig hast du mich daran erinnert, dass dieser Kleine etwas Besonderes ist, nicht wahr?", "Mariru")
	await novel_interface.show_dialog("Du hattest von Anfang an nie vor, etwas vor mir zu verbergen.", "Mariru")
	await novel_interface.show_dialog("Deshalb hast du dich bewusst für diese Zeichnung entschieden, die ich gemacht habe, als ich klein war –", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Das sind also die Botschaften, die Sie mir übermitteln wollten...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
