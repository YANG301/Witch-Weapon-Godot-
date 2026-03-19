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
	await novel_interface.show_dialog("Estuvo muy cerca...\nFinalmente logramos regresar~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+"¡Estás herido!\n¡Tu brazo está sangrando mucho!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Estoy bien, es sólo un rasguño.\n¡Este tipo de lesión no es nada para un chico!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Pero obviamente eres una chica en este momento, ¡así que no te esfuerces tanto!\nY también te torciste el tobillo, ¿no?...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sí... esto claramente no es simple. Si no solucionamos todo este problema,\nmás personas podrían terminar resultando heridas...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Por favor, cuídate más, ¿vale?\nTu brazo todavía sangra.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Lo haré. Gracias, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Pero... todavía no tenemos ninguna pista...\n¿Deberíamos continuar y comprobar la siguiente área?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Aparece de repente frente a ella) Pequeño mocoso...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Dr. Mariru—¡ah, no, comandante!\n¿Nos estaba esperando?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Estábamos a punto de ir a investigar la siguiente área...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Espera un segundo, ¿acabas de... luchar contra algo?", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Uh, yo sólo... intenté ayudar un poco...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("¡¡Recuerdo claramente haberte dicho que no te esforzaras!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("¡Si te sucediera algo incontrolable, sería una pérdida tremenda para mí!\nMírate, ¡ya estás herido!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("¡Equipo médico! Tenemos una niña herida aquí. ¡Trátala de inmediato y tráela directamente de regreso al cuartel general!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", El comandante Mariru parece realmente preocupado por ti...\n¿Quizás deberíamos simplemente...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Sí.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Un pánico leve e indescriptible se deslizó silenciosamente en mi corazón.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
