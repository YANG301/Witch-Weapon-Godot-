# chapter2_ex03.gd - 第二章番外篇03
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter2_ex03_script()

func play_script():
	pass

func chapter2_ex03_script():
	novel_interface.change_music("res://assets/audio/music/Chaostic Daily.mp3")
	novel_interface.change_background("res://assets/images/bg/APT/washingRoom.png")
	await novel_interface.show_dialog("Schöne Badewanne. \\nMariru kümmert sich wirklich nicht um Geld...", "Lian")
	novel_interface.show_character("ren_nude2","normal")
	await novel_interface.show_dialog("Ahh. \\nDer entspannendste Moment nach einem langen Tag.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Naja...", "Lian")
	await novel_interface.show_dialog("Das... ist mein Körper?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Sieht fair aus und fühlt sich weich an... \\nFühlt sich so glatt an…")
	novel_interface.show_character("ren_nude","shame")
	await novel_interface.show_dialog("Was mache ich? \\nSeien Sie ehrlich.", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Bevor ich einen Weg zurück zu meinem alten Ich finde\\nDas ist mein Körper...", "Lian")
	novel_interface.change_expression("relax")
	await novel_interface.show_dialog("Was für ein entspannendes Bad, nachdem man den ganzen Tag mit unerwarteten Feinden gekämpft hat!", "Lian")
	await novel_interface.show_dialog("Ich genieße diesen Moment lieber. Was für ein anstrengender Tag!", "Lian")
	novel_interface.change_expression("timid")
	await novel_interface.show_dialog("Ahh.", "Lian")
	novel_interface.change_expression("perspire")
	await novel_interface.show_dialog("Ich kann meine Stimme immer noch nicht akzeptieren. Klingt wie ein stöhnendes Kätzchen...", "Lian")
	await novel_interface.show_dialog("Verdammt! Diese Stimme ist so...", "Lian")
	novel_interface.change_expression("uneasy")
	await novel_interface.show_dialog("Schmutzig...", "Lian")
	novel_interface.change_expression("indignation")
	await novel_interface.show_dialog("Hm...", "Lian")
	await novel_interface.show_dialog("Wie kann ich mich an diesen Körper gewöhnen?!", "Lian")

	print("=== 第二章番外篇03结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
