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
	await novel_interface.show_dialog("¡¿Qué dijiste?! ¡El perímetro defensivo de 'Aegis' claramente cae bajo la jurisdicción de nuestro Metropolitan Defense Bureau (MD)!", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("¿Por qué motivos asumes el mando?\n¡¡A menos que me des una razón convincente, no esperes que levante el bloqueo policial!!", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("Está clasificado. ¡No puedo ni necesito explicártelo!", "Oficial militar")
	await novel_interface.show_dialog("Esto ahora es un asunto de los militares.\nCooperarás.", "Oficial militar")
	await novel_interface.show_dialog("¡Me niego! ¡¡Esta operación está bajo el mando del Negociado de Defensa!!\n¡No, a menos que haya una orden administrativa del Senado...!", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("Ejem, déjame decir esto...", "Voz femenina")
	await novel_interface.show_dialog("¿Sigues perdiendo el tiempo en algo tan inútil?", "Voz femenina")
	await novel_interface.show_dialog("Esa voz es—\nMariru... ¡¿Oficial Mariru?", "Oficial militar")
	await novel_interface.show_dialog("¡S-sí, señora!", "Oficial militar")
	await novel_interface.show_dialog("El Secret Intelligence Division se separó del ejército hace mucho tiempo, así que no es necesario que me llames 'Oficial'.", "Mariru")
	await novel_interface.show_dialog("Mariru... ¡Hmph!", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("¡¡Esta es una comunicación cifrada de nivel 4!!\n¿Cómo pudiste siquiera...", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("Olvídate de ese detalle trivial por ahora~\nPiensa en cómo vamos a manejar la situación que tenemos delante.", "Mariru")
	await novel_interface.show_dialog("Si se trata de un canal cifrado de nivel 4, entonces hable con claridad. De todos modos, nadie más está escuchando aquí.", "Mariru")
	await novel_interface.show_dialog("¡¡Quiero que se revele toda la inteligencia!!", "Mariru")
	await novel_interface.show_dialog("¡S-sí, señora!", "Oficial militar")
	await novel_interface.show_dialog("Actualmente, todos los sistemas de vigilancia alrededor del centro de investigación han fallado y hemos detectado fluctuaciones espacio-temporales a gran escala...", "Oficial militar")
	await novel_interface.show_dialog("¿Fluctuaciones del espacio-tiempo?\n¿Qué significa eso...?", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("El Urban Disaster Countermeasures Act lo dice bastante claro, ¿no es así...?", "Mariru")
	await novel_interface.show_dialog("¿No me digan que la Oficina de Defensa ni siquiera se molesta en leer estatutos clasificados sólo porque no están abiertos al público?", "Mariru")
	await novel_interface.show_dialog("Ugh... ¿N-no me digas que esto es...\nuna falla de contención que involucra 'Substance H'...?", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("Y además de eso, el Ross Goblet desapareció repentinamente anoche...", "Mariru")
	await novel_interface.show_dialog("...Nada como esto ha sucedido en New Opulentia durante seis años, ¿verdad?", "Mariru")
	await novel_interface.show_dialog("Debe considerar el peor de los casos:", "Mariru")
	await novel_interface.show_dialog("E-entiendo...", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("Levantaremos el bloqueo interior de inmediato y evacuaremos a los civiles bajo la apariencia de un simulacro...", "Oficial de la Oficina de Defensa")
	await novel_interface.show_dialog("Bien. ¿Cómo van los despliegues militares en el exterior?", "Mariru")
	await novel_interface.show_dialog("Unidades de operaciones especiales están desplegando gran potencia de fuego en un radio de dos kilómetros alrededor de la zona de anomalía, pero aún no podemos confirmar el nivel de amenaza.", "Oficial militar")
	await novel_interface.show_dialog("¿Qué pasa con el control de los medios?", "Mariru")
	await novel_interface.show_dialog("Según el protocolo, estamos ejecutando C-13.", "Oficial militar")
	await novel_interface.show_dialog("Bien. Luego, a partir de este momento, el Secret Intelligence Division (SID) se hará cargo de la zona central de anomalía.", "Mariru")
	await novel_interface.show_dialog("¡Todos ustedes también se mudan inmediatamente!", "Mariru")
	await novel_interface.show_dialog("¡Sí!", "Comunicación militar")
	await novel_interface.show_dialog("E-está bien...\nSerá mejor que tengan cuidado.", "Oficial de la Oficina de Defensa")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
