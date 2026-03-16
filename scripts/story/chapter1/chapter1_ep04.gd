# chapter1_ep4.gd - 第一章第4话
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
	await novel_interface.show_dialog("（咦，究竟发生了什么事来着）",GameConfig.player_name)
	await novel_interface.show_dialog("好痛……",GameConfig.player_name)
	await novel_interface.show_dialog("（对了，我被人袭击了……）\n（然后爬到了附近展品的阴影里……）",GameConfig.player_name)
	await novel_interface.show_dialog("我周围是石版一样的东西\n（上面铭刻着奇怪的图案和文字……）",GameConfig.player_name)
	await novel_interface.show_dialog("（展品的铭牌上写着Miskatonic……）\n（后面的字迹模糊了）",GameConfig.player_name)
	await novel_interface.show_dialog("话说回来也太安静了……",GameConfig.player_name)
	await novel_interface.show_dialog("那些家伙已经到别处去了吗？",GameConfig.player_name)
	await novel_interface.show_dialog("稍微，去看看情况吧。\n会议厅……莉琉……",GameConfig.player_name)
	await novel_interface.stop_music()
	await novel_interface.hide_character()
	await novel_interface.enter_video_performance_mode([
		"res://assets/video/4-2.ogv"
	])
	novel_interface.change_music("res://assets/audio/music/Sewer.mp3")
	novel_interface.change_background("res://assets/images/bg/Shot/cityCrash_salt.png")
	await novel_interface.show_dialog("这是，在做梦吧……？\n究竟是，怎么回事？？",GameConfig.player_name)
	await novel_interface.show_text_only("在一片火海中，仿佛雕塑园一样\n人们的动作鲜活、表情生动……")
	await novel_interface.show_text_only("但是他们，已经失去了人的颜色，变得一片惨白。")
	await novel_interface.show_dialog("这种、这种事……怎么可能……",GameConfig.player_name)
	await novel_interface.show_dialog("不要……\n大家都……怎么了……莉琉小姐……哪去了……",GameConfig.player_name)
	await novel_interface.show_dialog("倒是谁来……告诉我啊啊！！",GameConfig.player_name)
	await novel_interface.show_text_only("当我伸手试图触碰一位女性冰冷的脸庞时，她的脖子无言的断裂，头摔在地上，四分五裂。")
	await novel_interface.show_dialog("这是……盐？？",GameConfig.player_name)
	await novel_interface.show_dialog("唔……呜……\n呜哇啊啊啊啊！！！！",GameConfig.player_name)
	await novel_interface.show_dialog("呜哇啊啊啊啊！！！!\n啊啊啊啊啊啊啊啊啊啊啊啊啊啊！！！！！！！！",GameConfig.player_name)

	print("=== 第一章第4话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
