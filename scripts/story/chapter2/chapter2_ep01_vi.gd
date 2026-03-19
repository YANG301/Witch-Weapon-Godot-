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
	await novel_interface.show_dialog("Bạn đã nói gì cơ?! Vành đai phòng thủ 'Aegis' rõ ràng thuộc thẩm quyền của Cục Phòng vệ Đô thị (MD) của chúng tôi!", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Dựa trên cơ sở nào mà bạn nắm quyền chỉ huy?\nTrừ khi bạn cho tôi một lý do thuyết phục, đừng mong tôi dỡ bỏ lệnh phong tỏa của cảnh sát!!", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Nó được phân loại. Tôi không thể và cũng không cần phải giải thích điều đó với bạn!", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Bây giờ đây là vấn đề của quân đội.\nBạn sẽ hợp tác.", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Tôi từ chối! Hoạt động này nằm dưới sự chỉ huy của Cục Quốc phòng!!\nKhông trừ khi có lệnh hành chính từ Thượng viện...!", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Ahem, để tôi nói điều này...", "Giọng nữ")
	await novel_interface.show_dialog("Cậu vẫn đang lãng phí thời gian vào thứ vô nghĩa này à?", "Giọng nữ")
	await novel_interface.show_dialog("Giọng nói đó là—\nMariru... Sĩ quan Mariru?!", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Vâng, thưa cô!", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Cục Tình báo Mật đã tách khỏi quân đội từ lâu nên bạn không cần gọi tôi là 'Sĩ quan'.", "Mariru")
	await novel_interface.show_dialog("Mariru... Hừm!", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Đây là thông tin liên lạc được mã hóa cấp 4!!\nSao bạn lại làm vậy...", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Hãy tạm quên chi tiết tầm thường đó đi~\nHãy nghĩ xem chúng ta sẽ xử lý tình huống trước mắt như thế nào.", "Mariru")
	await novel_interface.show_dialog("Nếu đây là kênh được mã hóa cấp 4 thì hãy nói rõ ràng. Dù sao thì cũng không có ai khác đang lắng nghe ở đây—", "Mariru")
	await novel_interface.show_dialog("Tôi muốn tiết lộ mọi thông tin tình báo!!", "Mariru")
	await novel_interface.show_dialog("Vâng, thưa cô!", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Hiện tại, tất cả hệ thống giám sát xung quanh trung tâm nghiên cứu đều đã ngừng hoạt động và chúng tôi đã phát hiện ra những biến động không thời gian quy mô lớn...", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Biến động không thời gian?\nĐiều đó có nghĩa là gì...?", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Luật Ứng phó Thảm họa Đô thị nêu khá rõ ràng phải không ...?", "Mariru")
	await novel_interface.show_dialog("Đừng nói với tôi là Cục Quốc phòng thậm chí không thèm đọc các đạo luật mật chỉ vì chúng không mở cửa cho công chúng?", "Mariru")
	await novel_interface.show_dialog("Ugh... Đ-đừng nói với tôi đây là...\nmột thất bại quản thúc liên quan đến 'Substance H'...?", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Và trên hết, Ross Goblet đột nhiên biến mất vào đêm qua...", "Mariru")
	await novel_interface.show_dialog("...Không có chuyện gì như thế này xảy ra ở New Opulentia trong sáu năm rồi, phải không?", "Mariru")
	await novel_interface.show_dialog("Bạn cần phải xem xét trường hợp xấu nhất—", "Mariru")
	await novel_interface.show_dialog("Tôi-tôi hiểu rồi...", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Chúng tôi sẽ dỡ bỏ lệnh phong tỏa bên trong ngay lập tức và sơ tán dân thường dưới hình thức diễn tập...", "Cán bộ Cục Quốc phòng")
	await novel_interface.show_dialog("Tốt. Việc triển khai bên ngoài của quân đội diễn ra như thế nào?", "Mariru")
	await novel_interface.show_dialog("Các đơn vị hoạt động đặc biệt đang triển khai hỏa lực mạnh trong bán kính hai km xung quanh vùng dị thường, nhưng chúng tôi vẫn chưa thể xác nhận mức độ đe dọa.", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Còn việc kiểm soát phương tiện truyền thông thì sao?", "Mariru")
	await novel_interface.show_dialog("Theo giao thức, chúng tôi đang thực thi C-13.", "Sĩ quan quân đội")
	await novel_interface.show_dialog("Tốt. Sau đó, kể từ thời điểm này, Cục Tình báo Mật (SID) sẽ tiếp quản vùng lõi dị thường.", "Mariru")
	await novel_interface.show_dialog("Tất cả các bạn cũng di chuyển ra ngoài ngay lập tức!", "Mariru")
	await novel_interface.show_dialog("Vâng!", "Truyền thông quân sự")
	await novel_interface.show_dialog("Đ-được rồi...\nTốt nhất là các bạn nên cẩn thận.", "Cán bộ Cục Quốc phòng")

	print("=== 第二章第1话结束 ===")

	# 调用剧情结束函数
	await novel_interface.end_story_episode(0.5)
