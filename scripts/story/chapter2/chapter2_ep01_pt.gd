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
	await novel_interface.show_dialog("O que você disse?! O perímetro defensivo de 'Aegis' está claramente sob a jurisdição do nosso Metropolitan Defense Bureau (MD)!", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("Com que base você está assumindo o comando?\nA menos que você me dê uma razão convincente, não espere que eu levante o bloqueio policial!!", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("É classificado. Não posso nem preciso explicar isso para você!", "Oficial Militar")
	await novel_interface.show_dialog("Este é agora um assunto para os militares.\nVocê irá cooperar.", "Oficial Militar")
	await novel_interface.show_dialog("Eu recuso! Esta operação está sob o comando do Departamento de Defesa!!\nNão, a menos que haja uma ordem administrativa do Senado...!", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("Ahem, deixe-me dizer isso...", "Voz Feminina")
	await novel_interface.show_dialog("Você ainda está perdendo tempo com algo tão inútil?", "Voz Feminina")
	await novel_interface.show_dialog("Essa voz é—\nMariru... Oficial Mariru?!", "Oficial Militar")
	await novel_interface.show_dialog("Sim, senhora!", "Oficial Militar")
	await novel_interface.show_dialog("O Secret Intelligence Division se separou do serviço militar há muito tempo, então você não precisa me chamar de 'Oficial'.", "Mariru")
	await novel_interface.show_dialog("Mariru... Tsc!", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("Esta é uma comunicação criptografada de nível 4!!\nComo você se saiu...", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("Esqueça esse detalhe trivial por enquanto ~\nPense em como vamos lidar com a situação que temos diante de nós.", "Mariru")
	await novel_interface.show_dialog("Se este for um canal criptografado de nível 4, fale claramente. Ninguém mais está ouvindo aqui de qualquer maneira—", "Mariru")
	await novel_interface.show_dialog("Quero todas as informações divulgadas!!", "Mariru")
	await novel_interface.show_dialog("Sim, senhora!", "Oficial Militar")
	await novel_interface.show_dialog("Atualmente, todos os sistemas de vigilância em torno do centro de pesquisa falharam e detectamos flutuações no espaço-tempo em grande escala...", "Oficial Militar")
	await novel_interface.show_dialog("Flutuações do espaço-tempo?\nO que isso significa...?", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("O Urban Disaster Countermeasures Act afirma isso claramente, não é ...?", "Mariru")
	await novel_interface.show_dialog("Não me diga que o Departamento de Defesa nem se preocupa em ler estatutos confidenciais só porque não estão abertos ao público?", "Mariru")
	await novel_interface.show_dialog("Ugh... D-não me diga que isso é...\numa falha de contenção envolvendo 'Substance H'...?", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("E além disso, o Ross Goblet desapareceu de repente na noite passada...", "Mariru")
	await novel_interface.show_dialog("...Nada parecido com isso aconteceu em New Opulentia durante seis anos, não é?", "Mariru")
	await novel_interface.show_dialog("Você precisa considerar o pior cenário -", "Mariru")
	await novel_interface.show_dialog("E-eu entendo...", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("Levantaremos o bloqueio interno imediatamente e evacuaremos os civis sob o pretexto de um exercício...", "Oficial do Departamento de Defesa")
	await novel_interface.show_dialog("Bom. Como estão indo os destacamentos militares externos?", "Mariru")
	await novel_interface.show_dialog("Unidades de operações especiais estão mobilizando poder de fogo pesado num raio de dois quilômetros ao redor da zona de anomalia, mas ainda não podemos confirmar o nível de ameaça.", "Oficial Militar")
	await novel_interface.show_dialog("E o controle da mídia?", "Mariru")
	await novel_interface.show_dialog("Por protocolo, estamos executando C-13.", "Oficial Militar")
	await novel_interface.show_dialog("Bom. Então, a partir deste momento, o Secret Intelligence Division (SID) assumirá o controle da zona central da anomalia.", "Mariru")
	await novel_interface.show_dialog("Todos vocês se mudam imediatamente também!", "Mariru")
	await novel_interface.show_dialog("Sim!", "Comunicação Militar")
	await novel_interface.show_dialog("Tudo bem...\nÉ melhor vocês tomarem cuidado.", "Oficial do Departamento de Defesa")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
