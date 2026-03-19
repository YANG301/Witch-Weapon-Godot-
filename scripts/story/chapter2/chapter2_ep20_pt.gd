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
	await novel_interface.show_text_only("A Subestação Johnson era uma enorme instalação ao ar livre construída antes da guerra, mais tarde adquirida integralmente pela Johnson Heavy Industries da Primeira Cidade Acadêmica.")
	await novel_interface.show_text_only("Ao longo dos últimos anos, a procura de energia na “Zona do Acordo” aumentou tão acentuadamente que a capacidade da subestação foi agora ampliada vinte vezes.")
	await novel_interface.show_text_only("Annie e eu entro cuidadosamente na subestação através de uma abertura na cerca de arame.")
	novel_interface.show_character("ren_battle","worry")
	await novel_interface.show_dialog("Este é o ponto designado, hein... Parece muito ruim aqui.\nChegamos tarde demais?", "Lian")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Um zumbido revelador de corrente sobrecarregada ecoa pela subestação e faíscas são cuspidas do equipamento elétrico de vez em quando.")
	await novel_interface.show_text_only("O chão e as paredes estão cobertos de marcas de queimaduras, como se tivessem sido arranhadas por um raio...")
	novel_interface.show_character("anne_battle","worry")
	await novel_interface.show_dialog("Isto não se parece em nada com as outras zonas de anomalia. Mariru não está realmente esperando que consertemos transformadores, está?", "Annie")
	novel_interface.change_expression("frustrate")
	await novel_interface.show_dialog("A unidade de eletricidade na aula de física... essa é a parte que mais me dá dor de cabeça...", "Annie")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("A voz de Annie treme como se ela tivesse acabado de se lembrar do terror de nunca ser capaz de distinguir a regra da mão esquerda da da direita.")
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Espere, ouça—\nAdiante...", "Lian")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("O que foi isso?!", "Lian")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog("U-lá em cima—", "Annie")
	await novel_interface.hide_all_characters()
	novel_interface.change_music("res://assets/audio/music/Hand-to-hand combat.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/yiluka_fight0.png")#此处老cg和新cg有不同，但是老cg文件暂时无法寻得
	await novel_interface.show_text_only("Olho para cima e vejo uma garota de cabelo azul no ar, envolta em eletricidade, usando manoplas de metal grandes demais para seu corpo pequeno...")
	await novel_interface.show_text_only("Ao seu redor, um grupo de figuras de atuação estranha se revezam em ataques selvagens.")
	await novel_interface.show_text_only("Uma delas é uma mulher cercada por coisas que parecem chamas fantasmagóricas.")
	await novel_interface.show_text_only("Um som estridente sai de sua garganta, instintivamente deixando meus dentes tensos.")
	await novel_interface.show_text_only("E os outros... ou o que quer que sejam, porque nem tenho certeza se são humanos, parecem ser controlados por alguma coisa.")
	await novel_interface.show_text_only("À medida que onda após onda de ataques desabam, até mesmo seus corpos se torcem em ângulos impossíveis junto com seus movimentos.")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_City_powerSubstation.png")
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Hah... h-haah...", "Elluka")
	novel_interface.character_dark()
	await novel_interface.show_text_only("Sob o ataque implacável, a menina de cabelos azuis já está coberta de feridas e mal consegue continuar se defendendo.")
	await novel_interface.show_text_only("Não... chamá-la de garota pode até ser demais. Ela parece mais uma criança... ela parece ter apenas dez anos.")
	await novel_interface.show_text_only("...Uh, este é realmente o momento de se preocupar com esses detalhes?")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","solemn")
	await novel_interface.show_dialog("Annie, olhe—", "Lian")
	await novel_interface.hide_character()
	novel_interface.show_character("witch_second")
	await novel_interface.show_dialog("O... ótimo... Xi-li Du-ma-smrti-gahara...\nGlimmer... Yomi... kekekeke...", "Atacante Louco")
	await novel_interface.show_dialog("Todos eles... todos eles... todos eles... CADA UM DELES!!!", "Atacante Louco")
	await novel_interface.hide_character()
	novel_interface.show_character("iluka_battle")
	await novel_interface.show_dialog("Ugh—!", "Elluka")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","perspire")
	await novel_interface.show_dialog("Aquela garotinha não aguenta muito mais!", "Annie")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shout",0.25)
	await novel_interface.show_dialog("Seus bastardos—\nParem aí!!", "Lian")

	print("=== 第二章第20话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
