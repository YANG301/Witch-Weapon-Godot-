# chapter1_ep4.gd - 第一章第4話
extends Node2D

@onready var novel_interface = $NovelInterface

func _ready():
	await get_tree().process_frame
	chapter1_ep4_script()

func play_script():
	pass

func chapter1_ep4_script():
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-1.ogv"
	])
	await novel_interface.show_text_only("……")
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.show_character("ren_male","hurt")
	await novel_interface.show_dialog("嗯……？",GameConfig.player_name)
	await novel_interface.show_dialog("（咦……剛才到底發生了什麼來著？）",GameConfig.player_name)
	await novel_interface.show_dialog("好痛……",GameConfig.player_name)
	await novel_interface.show_dialog("（對了，我被人襲擊了……）\n（然後爬到了附近展品的陰影裡……）",GameConfig.player_name)
	await novel_interface.show_dialog("我周圍是石版一樣的東西\n（上面銘刻著奇怪的圖案和文字……）",GameConfig.player_name)
	await novel_interface.show_dialog("（展品的銘牌上寫著Miskatonic……）\n（後面的字跡模糊了）",GameConfig.player_name)
	await novel_interface.show_dialog("話說回來也太安靜了……",GameConfig.player_name)
	await novel_interface.show_dialog("那些傢伙已經跑到別處去了嗎？",GameConfig.player_name)
	await novel_interface.show_dialog("稍微，去看看情況吧。\n會議廳……莉琉……",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("這是，在做夢吧……？\n究竟是，怎麼回事？？",GameConfig.player_name)
	await novel_interface.show_text_only("在一片火海中，仿佛雕塑園一樣\n人們的動作鮮活、表情生動……")
	await novel_interface.show_text_only("但他們早已失去了活人的血色，一個個都白得駭人。")
	await novel_interface.show_dialog("這種、這種事……怎麼可能……",GameConfig.player_name)
	await novel_interface.show_dialog("不要……\n大家都……怎麼了……莉琉小姐……哪去了……",GameConfig.player_name)
	await novel_interface.show_dialog("拜託誰來……告訴我啊啊！！",GameConfig.player_name)
	await novel_interface.show_text_only("當我伸手想碰觸一位女性冰冷的臉龐時，她的脖子卻無聲地折斷，頭顱摔落在地，四分五裂。")
	await novel_interface.show_dialog("這是……鹽？？",GameConfig.player_name)
	await novel_interface.show_dialog("唔……嗚……\n嗚哇啊啊啊啊！！！！",GameConfig.player_name)
	await novel_interface.show_dialog("嗚哇啊啊啊啊！！！!\n啊啊啊啊啊啊啊啊啊啊啊啊啊啊！！！！！！！！",GameConfig.player_name)

	print("=== 第一章第4話結束 ===")

	# 調用劇情結束函數
	await novel_interface.end_story_episode(0.5)


