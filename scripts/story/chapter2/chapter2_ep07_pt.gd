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
	await novel_interface.show_dialog("Isso foi muito perto...\nFinalmente conseguimos voltar~~", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+", você está machucado!\nSeu braço está sangrando muito!", "Annie")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Estou bem, é só um arranhão.\nEsse tipo de lesão não é nada para um cara!", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("Mas você obviamente é uma garota agora, então não se esforce tanto!\nE você torceu o tornozelo também, não foi...?", "Annie")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Sim... isso claramente não é simples. Se não resolvermos todos esses problemas,\nmais pessoas podem acabar se machucando...", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("Por favor, cuide-se melhor, ok?\nSeu braço ainda está sangrando.", "Annie")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("Eu irei. Obrigado, Annie~", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("Mas... ainda não temos nenhuma pista...\nDevemos continuar e verificar a próxima área?", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Aparecendo de repente na frente dela) Seu pirralho...", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("Dr. Mariru—ah, não, Comandante!\nVocê estava esperando por nós?", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("Estávamos prestes a investigar a próxima área...", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("Espere um segundo – você... acabou de lutar contra alguma coisa?!", "Mariru")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("Uh, eu só... tentei ajudar um pouco...", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("Lembro-me claramente de ter dito para você não se esforçar!!", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("Se algo incontrolável acontecesse com você, isso seria uma perda tremenda para mim!\nOlhe para você - você já está ferido!", "Mariru")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("Equipe médica! Temos uma garota ferida aqui – trate-a imediatamente e leve-a de volta ao QG!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+", Comandante Mariru parece realmente preocupado com você...\nTalvez devêssemos apenas...?", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("...Sim.", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("Um pânico fraco e indescritível invadiu silenciosamente meu coração.")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
