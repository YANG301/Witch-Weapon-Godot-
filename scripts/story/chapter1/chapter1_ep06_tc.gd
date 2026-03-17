# chapter1_ep6.gd - 第一章第6話
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep6_script()

func play_script():
	pass

func chapter1_ep6_script():
	novel_interface.change_music("res://assets/audio/music/Black Market.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/BG_RC_outside.png")
	novel_interface.show_character("ren_battle","normal1")
	await novel_interface.show_dialog("……呼、哈……雖然不知道是怎麼回事\n這算是，贏了嗎……？",GameConfig.player_name)
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("anne_battle","normal",0.25)
	await novel_interface.show_dialog("……好像是呢。","安妮")
	novel_interface.character_light(0.35,"awkward")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("你、你到底是什麼人！？\n從哪裡冒出來的！？",GameConfig.player_name)
	await novel_interface.show_dialog("襲擊我的那些家伙是什麼東西！？\n這根球棒又是啥！？",GameConfig.player_name)
	await novel_interface.show_dialog("這裡到底怎麼了？！",GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"perspire")
	await novel_interface.show_dialog("你先冷靜點！\n在我知道的範圍內，我會把你的問題一個個回答清楚。", "安妮")
	novel_interface.change_2nd_expression("worry")
	await novel_interface.show_dialog("不過我也跟你一樣搞不清楚狀況。\n真要說的話，我還更想知道你到底是誰呢……", "安妮")
	novel_interface.character_light(0.35,"normal1")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("抱歉……我剛才太慌了。",GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"smile")
	await novel_interface.show_dialog("沒關係啦。\n對了，我們還沒好好自我介紹呢。", "安妮")
	novel_interface.change_2nd_expression("normal")
	await novel_interface.show_dialog("我的名字是安妮·巴斯。\n就叫我安妮吧~", "安妮")
	novel_interface.character_light(0.35,"worry")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……我叫"+GameConfig.player_name+"，請多指教。",GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog(GameConfig.player_name+"啊……彼此彼此。", "安妮")
	novel_interface.change_2nd_expression("happy")
	await novel_interface.show_dialog("你的名字聽起來像男生耶，感覺好帥氣喔~", "安妮")
	novel_interface.character_light(0.35,"awkward")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("！？", GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light(0.35,"normal")
	await novel_interface.show_dialog("怎麼了，為什麼那麼驚訝？","安妮")
	novel_interface.character_light(0.35,"shy")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("啊，說來我現在……\n是女的啊……",GameConfig.player_name)
	novel_interface.character_dark()
	novel_interface.character_2nd_light()
	await novel_interface.show_dialog("嗯？妳本來就是女生呀。\n妳看，這身變出來的衣服不是挺適合妳的嗎？", "安妮")
	novel_interface.change_2nd_expression("uneasy")
	await novel_interface.show_dialog("很可愛很可愛……\n這件『戰鬥服』就當作我送妳的見面禮吧~", "安妮")
	novel_interface.character_light(0.35,"normal1")
	novel_interface.character_2nd_dark()
	await novel_interface.show_dialog("……戰鬥服？",GameConfig.player_name)
	novel_interface.change_expression("awkward")
	await novel_interface.show_dialog("呀呀——啊啊啊啊啊啊啊啊！！！！",GameConfig.player_name)
	await novel_interface.hide_all_characters()
	novel_interface.change_background("res://assets/images/bg/Shot/BG_Shot_girlchar_battleWearingShy.png")
	await novel_interface.show_text_only("反應過來才發現\n我居然穿著一身女裝！！")
	await novel_interface.show_text_only("水手服……\n和短到難為情的短裙……！")
	await novel_interface.show_text_only("腿上的絲襪……原來是這麼微妙的感覺嗎……？")
	await novel_interface.show_dialog("而且胸口傳來這種緊繃的束縛感，該不會是……（摸）",GameConfig.player_name)
	await novel_interface.show_dialog("啊啊啊啊啊啊！！！",GameConfig.player_name)
	novel_interface.change_background("res://assets/images/bg/Shot/BG_RC_outside.png")
	novel_interface.show_character("anne_battle","normal")
	await novel_interface.show_dialog("外套和妳的髮色也很搭喔~\n而且這一套也很適合活動。", "安妮")
	novel_interface.change_expression("worry")
	await novel_interface.show_dialog("嗯……？怎麼了呀~~？", "安妮")
	novel_interface.character_move_left(-0.25)
	novel_interface.show_2nd_character("ren_battle","shy",0.25)
	await novel_interface.show_dialog("因、因為……\n因為……",GameConfig.player_name)

	print("=== 第一章第6話結束 ===")

	# 調用劇情結束函數
	await novel_interface.end_story_episode(0.5)


