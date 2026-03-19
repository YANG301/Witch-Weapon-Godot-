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
	await novel_interface.show_text_only("Depois que Lian sai, Mariru olha para seu dispositivo portátil com uma expressão grave.")
	await novel_interface.show_text_only("Um longo fluxo de dados mutáveis se desenrola diante de seus olhos.")
	await novel_interface.show_text_only("O arquivo na tela, supostamente em estado \"bloqueado\", está mudando.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Como pode ser isso?! Aegis deve ser capaz de se defender contra qualquer ataque de rede.)\n(Poderia ser alguém do Senado...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("Toda a história de Lian se transformou em um jargão. À medida que a tela pisca, o texto distorcido gradualmente se corrige em informações significativas.")
	await novel_interface.show_text_only("Desde fragmentos ilegíveis até um registro totalmente coerente, o firewall ofensivo do Aegis nunca gera um único aviso.")
	await novel_interface.show_text_only("No mostrador do relógio de Mariru, uma letra vermelha \"T\" está piscando.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("(Uma reescrita de dados nesta escala está acontecendo no mainframe Aegis, e apenas \"Themis\" percebeu a anomalia...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("No dispositivo portátil, a história pessoal de Lian foi completamente atualizada.\nDo jardim de infância ao ensino médio, ela frequentou escolas particulares.")
	await novel_interface.show_text_only("Boletins, diplomas, prêmios, registros médicos, registros de seguros...\ncada detalhe aponta para uma origem familiar rica e privilegiada.")
	await novel_interface.show_text_only("Mas não faz muito tempo, os pais e o irmão mais velho da menina morreram em um acidente de avião no exterior.")
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("De acordo com a Lei de Bem-Estar Infantil do Pós-guerra, um cientista da SS que já havia se registrado como voluntário foi designado como guardião da menina...", "Mariru")
	await novel_interface.show_dialog("(Não me diga que até meus próprios registros também foram alterados!)\n(Então isso é realmente uma provocação...?)", "Mariru")
	await novel_interface.hide_character()
	await novel_interface.show_text_only("O comentário de uma professora diz: \"Ela sempre gosta de imitar os maneirismos do irmão mais velho e não tem a contenção esperada de uma jovem...\"")
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("(Uma falsificação tão completa... eu deveria fazer o departamento de informação estudá-la adequadamente.)", "Mariru")
	await novel_interface.show_dialog("(Se eles tivessem designado um guardião diferente, nem eu seria capaz de dizer se era real ou falso.)\n(...Eles transplantaram os registros de outra pessoa?)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("(Parece que a sede precisa de uma varredura anti-bug adequada.)", "Mariru")
	novel_interface.change_expression("normal1")
	await novel_interface.show_dialog("(Tem uma foto abaixo também?...)", "Mariru")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("...!!", "Mariru")
	await novel_interface.hide_character()
	novel_interface.show_special_centered_image("res://assets/images/bg/Shot/girlchar_childRedHair.png",308,0.6,0.96,0.3)
	await novel_interface.show_text_only("Uma fotografia está anexada ao registro como um dos pertences dos falecidos pais.")
	await novel_interface.show_text_only("Na foto, a jovem Lian tem cabelos curtos e exibe orgulhosamente seu desenho.")
	await novel_interface.show_text_only("A menina desenhou uma pequena sereia. Em caligrafia infantil em inglês, no canto inferior direito estão as palavras: \"Eu também tenho cabelo ruivo\"")
	await novel_interface.show_dialog("...", "Mariru")
	await novel_interface.show_dialog("Hehehe... então é assim...", "Mariru")
	await novel_interface.show_dialog("Mesmo que seja uma foto composta, ela realmente era adorável quando criança~", "Mariru")
	await novel_interface.show_dialog("Você deu a ela uma história pessoal incontestável.", "Mariru")
	await novel_interface.show_dialog("E ao mesmo tempo você estava me lembrando que esse pequenino é especial, não é?", "Mariru")
	await novel_interface.show_dialog("Você nunca pretendeu esconder nada de mim desde o início.", "Mariru")
	await novel_interface.show_dialog("É por isso que você escolheu deliberadamente esse desenho que fiz quando era pequeno—", "Mariru")
	await novel_interface.hide_special_centered_image(0.3)
	novel_interface.show_character("liliu_uniform2","normal2")
	await novel_interface.show_dialog("Então essas são as mensagens que você queria transmitir para mim...", "Mariru")
	novel_interface.change_expression("speak")
	await novel_interface.show_dialog("Aegis...", "Mariru")

	print("=== 第二章第10话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
