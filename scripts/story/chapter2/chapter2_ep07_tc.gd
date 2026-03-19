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
	await novel_interface.show_dialog("剛才真是好險……\\n總算回來了～", GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","perspire",0.25)
	await novel_interface.show_dialog(GameConfig.player_name+"，妳受傷了？\n手臂流了好多血！", "安妮")
	novel_interface.character_light(0.35,"happy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("沒關係，只是擦傷而已\n這點傷對男生來說算不了什麼！", GameConfig.player_name)
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("但妳現在明明就是女生嘛，不要太逞強啦！ \\n而且妳的腳也扭傷了吧……", "安妮")
	novel_interface.character_light(0.35,"serious")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("嗯……看來事情並不簡單，如果不能把麻煩都解決\n掉，說不定還會有很多人受傷……", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("不管怎樣，拜託妳多愛惜一下自己好不好！ \\n妳看，妳的手臂還在流血呢。", "安妮")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,true,"happy")
	await novel_interface.show_dialog("我會的。謝謝你，安妮～", GameConfig.player_name)
	novel_interface.change_expression("gratified")
	await novel_interface.show_dialog("不過……還是沒什麼線索啊……\\n我們繼續去下一個區域吧？", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","serious")
	await novel_interface.show_dialog("（突然出現在面前）妳這小丫頭……", "莉琉")
	await novel_interface.hide_character()
	novel_interface.show_character("ren_battle","panic")
	await novel_interface.show_dialog("莉琉博士，啊不，長官！ \\n妳在等我們嗎？", GameConfig.player_name)
	novel_interface.change_expression("happy")
	await novel_interface.show_dialog("我們正準備去下一個區域探查……", GameConfig.player_name)
	await novel_interface.hide_character()
	novel_interface.show_character("liliu_uniform2","speak")
	await novel_interface.show_dialog("等等，妳……是不是剛剛戰鬥過？ ！", "莉琉")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","perspire1",0.25)
	await novel_interface.show_dialog("呃，嗯。 我也……只是盡力試試……", GameConfig.player_name)
	novel_interface.character_light(0.35,"speak")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("我不是跟妳說過不要勉強自己嗎！ ！", "莉琉")
	novel_interface.change_expression("serious")
	await novel_interface.show_dialog("如果發生了無法控制的危險，對我而言可是莫大的損失！ \\n看，妳現在受傷了吧！", "莉琉")
	await novel_interface.hide_2nd_character()
	novel_interface.character_move_right(0,0.3,false,"speak")
	await novel_interface.show_dialog("醫療組！ 有人受傷，給她處理下，馬上帶回總\n部！", "莉琉")
	await novel_interface.hide_character()
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog(GameConfig.player_name+"，莉琉長官好像很擔心妳呢……\n不然我們……？", "安妮")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","upset",0.25)
	await novel_interface.show_dialog("……嗯。", GameConfig.player_name)
	await novel_interface.hide_all_characters()
	await novel_interface.show_text_only("一絲難以言喻的慌亂悄悄爬上了心頭。")

	print("=== 第二章第7话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
