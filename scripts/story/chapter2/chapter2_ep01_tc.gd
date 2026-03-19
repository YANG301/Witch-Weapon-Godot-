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
	await novel_interface.show_dialog("你說什麼！『埃癸斯』的防禦範圍內，明明屬於我們都市防衛廳（MD）的管轄範圍！", "防衛廳長官")
	await novel_interface.show_dialog("軍方憑什麼要接管指揮權？\n不拿出讓人信服的理由，休想要我解除警備封鎖！", "防衛廳長官")
	await novel_interface.show_dialog("這是機密，我不能也沒必要向你解釋！", "軍方長官")
	await novel_interface.show_dialog("現在這已經是屬於我們軍方的事務了。\n請你們配合！", "軍方長官")
	await novel_interface.show_dialog("我不同意！這是防衛廳指揮的行動！！\n除非有元老院的行政令……", "防衛廳長官")
	await novel_interface.show_dialog("咳咳，我說……", "女性的聲音")
	await novel_interface.show_dialog("你們還在這種無聊的事上浪費時間啊？", "女性的聲音")
	await novel_interface.show_dialog("這個聲音是——\n莉琉……莉琉長官？！", "軍方長官")
	await novel_interface.show_dialog("長、長官好！", "軍方長官")
	await novel_interface.show_dialog("秘密情報局（SID）早就從軍方獨立出來了，你不用叫我長官。", "莉琉")
	await novel_interface.show_dialog("莉琉嗎……哼！", "防衛廳長官")
	await novel_interface.show_dialog("這可是4級的加密通訊！！\n妳怎麼……", "防衛廳長官")
	await novel_interface.show_dialog("就先別管這種小事啦～\n還是想想怎麼處理現在的問題吧！", "莉琉")
	await novel_interface.show_dialog("既然是4級加密頻道，就給我有話直說。這裡說的話又不會有其他人聽到——", "莉琉")
	await novel_interface.show_dialog("情報一律公開！！", "莉琉")
	await novel_interface.show_dialog("啊、是！長官！", "軍方長官")
	await novel_interface.show_dialog("目前研究中心周圍的監控設備全部失靈，並偵測到了大規模的時空波動……", "軍方長官")
	await novel_interface.show_dialog("時空波動？\n那是……？", "防衛廳長官")
	await novel_interface.show_dialog("《都市災害對策法》裡說得很明確了吧……", "莉琉")
	await novel_interface.show_dialog("難道因為那是不向公眾公開的機密條例，所以連防衛廳也不看了嗎？", "莉琉")
	await novel_interface.show_dialog("唔……難、難道是……\n『異質物』收容失效……？", "防衛廳長官")
	await novel_interface.show_dialog("再加上昨晚『洛斯金盃』突然消失的狀況……", "莉琉")
	await novel_interface.show_dialog("……已經有六年沒發生過這種事了吧？", "莉琉")
	await novel_interface.show_dialog("你們要考慮最糟的可能性——", "莉琉")
	await novel_interface.show_dialog("我、我明白了……", "防衛廳長官")
	await novel_interface.show_dialog("我們立刻解除內層封鎖，並以演習的名義進行疏散……", "防衛廳長官")
	await novel_interface.show_dialog("好，軍方在外圍部署得如何了？", "莉琉")
	await novel_interface.show_dialog("特殊作戰部隊正在異變區域周圍兩公里範圍內部署重火力，但現在還無法確認威脅等級。", "軍方長官")
	await novel_interface.show_dialog("報導管制呢？", "莉琉")
	await novel_interface.show_dialog("按照協議，正在執行C-13劇本。", "軍方長官")
	await novel_interface.show_dialog("好，那麼現在開始由秘密情報局（SID）接管異變核心區。", "莉琉")
	await novel_interface.show_dialog("你們也馬上行動！", "莉琉")
	await novel_interface.show_dialog("是！", "軍方通訊")
	await novel_interface.show_dialog("好、好吧……\n你們自己小心。", "防衛廳長官")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
