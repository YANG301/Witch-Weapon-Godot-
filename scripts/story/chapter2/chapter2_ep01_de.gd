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
	await novel_interface.show_dialog("Was hast du gesagt?! Der Verteidigungsbereich von „Aegis“ fällt eindeutig in die Zuständigkeit unseres Metropolitan Defense Bureau (MD)!", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Mit welcher Begründung übernehmen Sie das Kommando?\nErwarten Sie nicht, dass ich die Polizeiblockade aufhebe, es sei denn, Sie nennen mir einen überzeugenden Grund!!", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Es ist geheim. Ich kann und muss es dir weder erklären noch muss ich es dir erklären!", "Militäroffizier")
	await novel_interface.show_dialog("Das ist nun Sache des Militärs.\nSie werden kooperieren.", "Militäroffizier")
	await novel_interface.show_dialog("Ich weigere mich! Diese Operation steht unter dem Kommando des Verteidigungsbüros!!\nNicht, es sei denn, es liegt eine behördliche Anordnung des Senat... vor!", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Ähem, lass mich das sagen...", "Weibliche Stimme")
	await novel_interface.show_dialog("Verschwenden Sie immer noch Zeit mit so etwas Sinnlosem?", "Weibliche Stimme")
	await novel_interface.show_dialog("Diese Stimme ist – \nMariru... Offizier Mariru?!", "Militäroffizier")
	await novel_interface.show_dialog("Ja, gnädige Frau!", "Militäroffizier")
	await novel_interface.show_dialog("Die Secret Intelligence Division haben sich schon vor langer Zeit vom Militär getrennt, Sie brauchen mich also nicht „Offizier“ zu nennen.", "Mariru")
	await novel_interface.show_dialog("Mariru... Hmpf!", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Dies ist eine verschlüsselte Kommunikation der Stufe 4!!\nWie haben Sie das überhaupt geschafft?...", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Vergessen Sie dieses triviale Detail vorerst ~\nDenken Sie darüber nach, wie wir mit der Situation vor uns umgehen werden.", "Mariru")
	await novel_interface.show_dialog("Wenn es sich um einen Level-4-verschlüsselten Kanal handelt, sprechen Sie Klartext. Hier hört sowieso niemand zu –", "Mariru")
	await novel_interface.show_dialog("Ich möchte, dass alle Informationen offengelegt werden!!", "Mariru")
	await novel_interface.show_dialog("Ja, gnädige Frau!", "Militäroffizier")
	await novel_interface.show_dialog("Derzeit sind alle Überwachungssysteme rund um das Forschungszentrum ausgefallen und wir haben großräumige Raumzeitschwankungen festgestellt...", "Militäroffizier")
	await novel_interface.show_dialog("Raumzeitschwankungen?\nWas bedeutet das...?", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Der Urban Disaster Countermeasures Act sagt es ganz klar, nicht wahr...?", "Mariru")
	await novel_interface.show_dialog("Sagen Sie mir nicht, dass sich das Verteidigungsministerium nicht einmal die Mühe macht, geheime Gesetze zu lesen, nur weil sie nicht für die Öffentlichkeit zugänglich sind?", "Mariru")
	await novel_interface.show_dialog("Ugh... D-erzähl mir nicht, das ist...\nein Eindämmungsfehler im Zusammenhang mit „Substance H“...?", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Und obendrein ist das Ross Goblet letzte Nacht plötzlich verschwunden...", "Mariru")
	await novel_interface.show_dialog("...So etwas ist in New Opulentia seit sechs Jahren nicht passiert, oder?", "Mariru")
	await novel_interface.show_dialog("Sie müssen das Worst-Case-Szenario in Betracht ziehen:", "Mariru")
	await novel_interface.show_dialog("Ich-ich verstehe...", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Wir werden die innere Abriegelung sofort aufheben und Zivilisten unter dem Deckmantel einer Übung evakuieren...", "Offizier des Verteidigungsbüros")
	await novel_interface.show_dialog("Gut. Wie verlaufen die Außeneinsätze des Militärs?", "Mariru")
	await novel_interface.show_dialog("Spezialeinheiten setzen schwere Feuerkraft in einem Umkreis von zwei Kilometern um die Anomaliezone ein, wir können den Bedrohungsgrad jedoch noch nicht bestätigen.", "Militäroffizier")
	await novel_interface.show_dialog("Wie sieht es mit der Medienkontrolle aus?", "Mariru")
	await novel_interface.show_dialog("Gemäß Protokoll führen wir C-13 aus.", "Militäroffizier")
	await novel_interface.show_dialog("Gut. Von diesem Moment an werden die Secret Intelligence Division (SID) die Kernzone der Anomalie übernehmen.", "Mariru")
	await novel_interface.show_dialog("Ihr zieht auch alle sofort aus!", "Mariru")
	await novel_interface.show_dialog("Ja!", "Militärische Kommunikation")
	await novel_interface.show_dialog("A-alles klar...\nIhr solltet besser selbst vorsichtig sein.", "Offizier des Verteidigungsbüros")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
