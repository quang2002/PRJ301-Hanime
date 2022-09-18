USE [Hanime];
GO

-- password: hanimeadmin
EXEC [sp_create_account] 
'quang', 
'918d01eac57b2f00e89c847543efaea7c01baae09a782cd822629bac9039c92b', 
'quangtdhe163060@fpt.edu.vn',
0, 
1;

EXEC [sp_create_account] 
'tung', 
'918d01eac57b2f00e89c847543efaea7c01baae09a782cd822629bac9039c92b', 
'tunglvhe163594@fpt.edu.vn',
0, 
1;

EXEC [sp_create_account] 
'thanh', 
'918d01eac57b2f00e89c847543efaea7c01baae09a782cd822629bac9039c92b', 
'thanhvphs153257@fpt.edu.vn',
0, 
1;


-- Welcome message
INSERT INTO [Notification] VALUES
(N'Welcome to Hanime!', NULL, 0, '#', DEFAULT)

-- Categories
INSERT INTO [Category]([Name], [Description]) VALUES 
(N'Action', N'Là thể loại có nội dung hành động, đánh đấm hoặc sử dụng nhiều loại vũ khí và nhiều băng nhóm giang hồ đối địch với nhau. Truyện thường mang đến cảm giác mạnh cho người đọc, có thể là những cảnh đánh nhau tất tay, máu me và không dành cho những người yếu tim hoặc tâm lý yếu.'),
(N'Comedy', N'Là thể loại chứa đựng nhiều tình tiết hài hước, dễ khiến độc giả bật cười, tuy nhiên, thể loại này không chỉ dừng lại ở đó, đan xen giữa những yếu tố gây cười là những bài học về cuộc sống không thể bỏ qua.'),
(N'Mystery', N'Là thể loại luôn khiến cho người xem có cảm giác thích thú tò mò, đôi khi phải “xoắn não” để phân tích những tình tiết trong phim. Các chủ đề quen thuộc trong anime thuộc thể loại này thường là án mạng, những tội ác, các sự kiện trong quá khứ, kí ức hay hành động của con người,… Với cách xây dựng cốt truyện ly kì, thể loại Mystery luôn khiến người xem phải chăm trú, tập trung vào từng cảnh phim, đôi khi phải ngẫm nghĩ, suy luận về những vấn đề trong phim.'),
(N'Romance', N'Là những câu chuyện về tình yêu. Ớ đây chúng ta sẽ lấy ví dụ như tình yêu giữa một người con trai và con gái, bên cạnh đó đặc điểm thể loại này là kích thích trí tưởng tượng của bạn về tình yêu. Đây cũng là thể loại mà nói dễ hiểu là "lãng mạng, mơ mộng, bay bổng".'),
(N'Fiction', N'Là từ chỉ mọi loại tác phẩm, mà trong một phần hay xuyên suốt toàn bộ, chúng nói về các thông tin và sự kiện không có thật. Những tác phẩm này là do hư cấu nên hay dựa trên các giả thuyết — nói cách khác, chúng là sản phẩm của trí tưởng tượng của tác giả.'),
(N'Isekai', N'là một tiểu thể loại light novel, manga, anime và video game kỳ ảo (fantasy) của Nhật Bản, xoay quanh một người bình thường được đưa đến hoặc bị mắc kẹt trong một vũ trụ song song. Isekai bao gồm hay không chỉ có thể loại xuyên không hay chuyển sinh (sinh ra ở một thế giới khác).'),
(N'Harem', N'Harem là một thể loại của anime và manga, trong đó tập trung vào nhân vật chính, thường là tình yêu, gắn kết với 2 hoặc nhiều hơn nhân vật khác giới hoặc cùng giới[1] Dạng phổ biến nhất của harem là một nhân vật nam chính và một nhóm nhân vật nữ[2] Một số biến thể gần đây của harem cho phép cả mối quan hệ thân mật giữa nhiều nhân vật cùng giới là yuri harem và yaoi harem.'),
(N'Fantasy', N'Fantasy thường xuất hiện các yếu tố chỉ có trong tưởng tượng như phép thuật, thần chú, các nàng tiên, phù thủy, quái vật, quỷ vương, rồng, các vị thần, hiệp sĩ, anh hùng,... Đúng như ý nghĩa của nó, thể loại fantasy tạo nên một thế giới khiến chúng ta tha hồ thỏa mãn trí tưởng tượng, đó là lí do tại sao fantasy được coi là một trong những thể loại được yêu thích nhất trên toàn thế giới.'),
(N'Psychological thriller', N'Là một thể loại mà yếu tố căng thẳng thường xuyên được các nhà làm phim khai thác để cuốn người xem vào bí ẩn cuối cùng.')


-- SPY x Family
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES
(N'SPY x FAMILY', N'Đặc vụ "Twilight" của Westalis được cử trà trộn vào nước địch để thám sát kẻ thù đang có âm mưu phá hoại nền hòa bình đông tây. Vì tính chất của nhiệm vụ, bậc thầy cải trang Twilight bắt buộc phải lập gia đình và có con thì mới có thể tiếp cận được mục tiêu. Với một kẻ chưa từng có người thân và luôn làm việc một mình, Twilight sớm tìm thấy mình mắc kẹt trong chuyện gia đình dở khóc dở cười.', 'https://res.cloudinary.com/quang2002/image/upload/spy-x-family_phgcz5')

INSERT INTO [FilmCategory] VALUES 
(1, 1), 
(1, 2)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'SPY x FAMILY - Tập 1', NULL, 'https://mega.nz/embed/D15BnYKb#l71Zb6rQ7vvt-etkutYUv07eGRkfVnv5v6M30ppygNE', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 2', NULL, 'https://mega.nz/embed/m5QzyRxB#bfFm2UWdVUjPZczeh0yO2YlctwiXv1mLukGdt_eIRVg', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 3', NULL, 'https://mega.nz/embed/uxoCRZJC#wXNgLQ984_Ynqnr-YJP7dZM2Ntpbz8Nsd_cyYLAd20A', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 4', NULL, 'https://mega.nz/embed/G0Bm3YJJ#iZ08o9UKejzJoVsMAA9HZR6_BYRPSwxYi0vVsQPK9EU', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 5', NULL, 'https://mega.nz/embed/2pBhGJRR#J4kMOG85CDSYniHm1F7mZkTEWQ9tIeRMjbUynFpZovI', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 6', NULL, 'https://mega.nz/embed/a05HDaqZ#3QyS-x_ssP5-oNxOgJGlNToWih7baE4mdNC7CxgjbSg', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 7', NULL, 'https://mega.nz/embed/bkBwVYLA#QbQ0WOEXUz1T86CpfZMhPmVma3N7ZLpibcu-lKZk_6E', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 8', NULL, 'https://mega.nz/embed/3xgSSQqZ#czPW8wOcN8DFllr8DKuYJEZegwuBpwe-Hc9kJQfV9Hk', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 9', NULL, 'https://mega.nz/embed/r9IEgQzT#T2xWm03M_znH2f6MfjPw7jo9kGh5pS5n51mEerYr5pw', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 10', NULL, 'https://mega.nz/embed/msRVlQBJ#-SE7PKVSXoK0DR4G6Gq_sueB2RUY8MjRy_n8UJUXYhA', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 11', NULL, 'https://mega.nz/embed/KwAEXLjJ#FaossxmWntnbdYld2meXcIrqMYF8qAOAQTdWdc-W2ck', GETDATE(), 30, 0, 1),
(N'SPY x FAMILY - Tập 12', NULL, 'https://mega.nz/embed/KwAEXLjJ#FaossxmWntnbdYld2meXcIrqMYF8qAOAQTdWdc-W2ck', GETDATE(), 30, 0, 1)


-- Suy Luận Hư Cấu
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES
(N'Suy Luận Hư Cấu', N'Kotoko Iwanaga là một cô gái đã được "Yêu ma" tôn làm thần trí tuệ để đứng ra giải quyết những vẫn đề chúng gặp phải mỗi ngày. Cô dính tiếng sét ái tình với  Kuro Sakuragawa, người bị chúng "Yêu ma" khiếp sợ. Tổ hợp hai người khác thường từ đó ngày ngày giải quyết các sự vụ của "Yêu quái" tạo nêu những câu chuyện "Tình yêu x Truyền thuyết x Bí ẩn"! Liệu hai người họ sẽ gặp những chuyện gì, tình yêu của họ sẽ tới được đâu?', 'https://res.cloudinary.com/quang2002/image/upload/in_spectre_smjhfm')

INSERT INTO [FilmCategory] VALUES
(2, 3),
(2, 4),
(2, 5)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Suy Luận Hư Cấu - Tập 1', NULL, 'https://mega.nz/embed/T9pRUSIa#apeWst4aN606LeQnFHH3B1u1kER9lLK-F-VU7LYUz1M', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 2', NULL, 'https://mega.nz/embed/Ww42DRra#e-ELxdc6vioWPPjP4j9avEWOBeBlKbagx5la_MpZOuU', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 3', NULL, 'https://mega.nz/embed/KhwxBByI#x4RM1sUphL75CkDMh6iKH9qIzU_q8YbRtExL9yV3DyI', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 4', NULL, 'https://mega.nz/embed/flo3xAaA#owxMcXYuJvGHInmMv2qaRHyoQ2riN0hnEtLfXRCFXUo', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 5', NULL, 'https://mega.nz/embed/2ogX1RqY#-cQMjy8Ui3b0MwgHZ2D469DtHJgnBfXYJsoCuvOHOTU', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 6', NULL, 'https://mega.nz/embed/DxpknSrL#9AwMvVUQwxzQr6R8cIV85PRLBg0CFHH-HQGC_owvUKs', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 7', NULL, 'https://mega.nz/embed/rhJDFahD#2Av-18cqDsMIzPAeLiGfoT8OR4GkpQfu8_mYrHE96Wk', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 8', NULL, 'https://mega.nz/embed/745XFLIR#b35glg8QAvQc9KAXBDjZ1Q3oqwfDmpqblk19RGqM4aM', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 9', NULL, 'https://mega.nz/embed/z9Y0EAoQ#8u3jn_9Q7Gp9_S0_kWBK-vQ2oPEnXzk1t0cDk8oKhPo', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 10', NULL, 'https://mega.nz/embed/zthi1KjA#z0oqgJOd0QgFmJPe6U7V7fajsN--HS_voelifx2ITrk', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 11', NULL, 'https://mega.nz/embed/upZklB7L#UdQX1AAAXOLnX3HWpmIez6kazFJI5XaQL5xrTk_fogg', GETDATE(), 30, 0, 2),
(N'Suy Luận Hư Cấu - Tập 12', NULL, 'https://mega.nz/embed/b8ZjwLqA#Gmt-pqeaATwQ-Npa8kDQG6rwD-KJjuA7hk4rFLluR1w', GETDATE(), 30, 0, 2)


-- Lúc đó tôi đã chuyển sinh thành Slime OAD
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES
(N'Lúc đó tôi đã chuyển sinh thành Slime OAD', N'Satoru Mikami vốn đang có cuộc sống bình lặng thì bị một gã côn đồ đâm chết trên phố. Anh kết thúc cuộc đời ở tuổi 37. Bỗng nhiên khi lấy lại ý thức, anh không thể nghe, cũng không thể nhìn thấy gì. Anh phát hiện ra mình đã chuyển sinh thành một con Slime. Anh bắt đầu tận hưởng cuộc đời mới của mình, tuy cũng chưa hài lòng lắm vì mình thuộc giống quái vật cấp thấp nhất. Tuy nhiên, cuộc chạm trán với một con quái vật cấp thảm họa, "Bạo Phong Long Veldora", đã khiến cuộc đời chú Slime bé nhỏ thay đổi hoàn toàn. Veldora đặt cho anh một cái tên mới là Rimuru. Và kể từ đây, Rimuru bắt đầu cuộc hành trình khám phá thế giới mới, bị cuốn vào trận chiến giữa tộc Yêu tinh và tộc Nha Lang, gặp gỡ thêm nhiều bạn bè và chạm trán với nhiều kẻ thù hùng mạnh. Huyền thoại về chú Slime mạnh nhất sắp sửa được mở ra.', 'https://res.cloudinary.com/quang2002/image/upload/72e24c93e7b0c336fa188eb1201565e1_vu42zf')

INSERT INTO [FilmCategory] VALUES
(3, 1),
(3, 6),
(3, 7),
(3, 8)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Lúc đó tôi đã chuyển sinh thành Slime OAD - Tập 1', NULL, 'https://www.youtube.com/embed/56gjkZylRXM', GETDATE(), 30, 0, 3),
(N'Lúc đó tôi đã chuyển sinh thành Slime OAD - Tập 2', NULL, 'https://www.youtube.com/embed/eml23y1nJ98', GETDATE(), 30, 0, 3),
(N'Lúc đó tôi đã chuyển sinh thành Slime OAD - Tập 3', NULL, 'https://www.youtube.com/embed/5KOx8gRQ3x4', GETDATE(), 30, 0, 3),
(N'Lúc đó tôi đã chuyển sinh thành Slime OAD - Tập 4', NULL, 'https://www.youtube.com/embed/yv2AvGw1QMA', GETDATE(), 30, 0, 3),
(N'Lúc đó tôi đã chuyển sinh thành Slime OAD - Tập 5', NULL, 'https://www.youtube.com/embed/Ev2KTEnQcRc', GETDATE(), 30, 0, 3)


-- Shikimori-san của tôi không chỉ dễ thương
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES
(N'Shikimori-san của tôi không chỉ dễ thương', N'Izumi là một nam sinh trung học bị xui xẻo bẩm sinh. Bạn gái của cậu là một cô bạn cùng lớp tên là Shikimori. Shikimori rất xinh đẹp, dễ thương và tràn đầy tình yêu, tuy nhiên mỗi khi Izumi gặp rắc rối, cô lại trở thành người bạn gái ngầu nhất trên đời! Cuộc sống thường ngày dễ thương và đầy những pha kỳ thú của Shikimori, Izumi và những người bạn sẽ bắt đầu tại đây.', 'https://i.ytimg.com/vi/jjd_anr5KwU/maxresdefault.jpg')

INSERT INTO [FilmCategory] VALUES
(4, 2),
(4, 4)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 1', NULL, 'https://www.youtube.com/embed/jjd_anr5KwU', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 2', NULL, 'https://www.youtube.com/embed/4MS6DEzmil8', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 3', NULL, 'https://www.youtube.com/embed/VJvIyTaPV0c', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 4', NULL, 'https://www.youtube.com/embed/CP0nXvaoaRY', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 5', NULL, 'https://www.youtube.com/embed/yuawQtBI8XY', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 6', NULL, 'https://www.youtube.com/embed/zK8paGzCAp4', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 7', NULL, 'https://www.youtube.com/embed/VrBXF_ipsuY', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 8', NULL, 'https://www.youtube.com/embed/MWjwHpp0ods', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 9', NULL, 'https://www.youtube.com/embed/Dddl2qfh7pg', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 10', NULL, 'https://www.youtube.com/embed/ke-FCP-yDyo', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 11', NULL, 'https://www.youtube.com/embed/zhLj1Z4lBQ4', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 12', NULL, 'https://www.youtube.com/embed/Ykz7cKzDfWU', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 13', NULL, 'https://www.youtube.com/embed/W0XYldBdilo', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 14', NULL, 'https://www.youtube.com/embed/j9GSaO7rCVE', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 15', NULL, 'https://www.youtube.com/embed/i0-X1jCIdKo', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 16', NULL, 'https://www.youtube.com/embed/UXxdX9NNmro', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 17', NULL, 'https://www.youtube.com/embed/FsvWCC5x7Vo', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 18', NULL, 'https://www.youtube.com/embed/SaZ6fvWvz1U', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 19', NULL, 'https://www.youtube.com/embed/aIs6jdGmk64', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 20', NULL, 'https://www.youtube.com/embed/U4X-WQXJgYg', GETDATE(), 30, 0, 4),
(N'Shikimori-san của tôi không chỉ dễ thương - Tập 21', NULL, 'https://www.youtube.com/embed/d-9SBBFzMxg', GETDATE(), 30, 0, 4)


-- Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A', N'Varvatos là Ma Vương mạnh nhất lịch sử đã được lưu danh trong thần thoại. Quá chán nản với kiếp làm vua dài đằng đẵng bởi sức mạnh đã khiến mà trở nên cô độc, cậu đã chuyển sinh thành một dân làng tên Ard Meteor ở 1000 năm sau. Tuy nhiên, tương lai lại là nơi mà nền văn minh ma pháp đã suy tàn. Ma pháp cũng đã suy yếu đi nhiều. Ard và người bạn thơ ấu Ireena đã nhập học tại học viện ma pháp. Dù cậu có muốn không tỏ ra là người đặc biệt, nhưng sức mạnh của cậu lại quá đỗi khác thường. Những lời khiêu chiến, những lời đồn đại cứ vậy mà tới không ngừng. Thế rồi, Ma Tộc từng một thời thống trị thế giới đã bắt đầu có hành động mờ ám... Liệu cựu Ma Vương có thể mang lại hòa bình và sống một cuộc đời bình dị chăng?', 'https://cdn.myanimelist.net/s/common/uploaded_files/1615037475-de748543fba24f4553c983172690afce.jpeg')

INSERT INTO [FilmCategory] VALUES
(5, 6),
(5, 8)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 1', NULL, 'https://www.youtube.com/embed/SEqXVmAEKDM', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 2', NULL, 'https://www.youtube.com/embed/nLbhlBLb9H0', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 3', NULL, 'https://www.youtube.com/embed/2yRZ8FVGt-M', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 4', NULL, 'https://www.youtube.com/embed/qZ8lW75atLE', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 5', NULL, 'https://www.youtube.com/embed/5LHYRhT457c', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 6', NULL, 'https://www.youtube.com/embed/f3bag_WvTSA', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 7', NULL, 'https://www.youtube.com/embed/sVn4weDhve4', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 8', NULL, 'https://www.youtube.com/embed/dJx3Dg6VU6g', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 9', NULL, 'https://www.youtube.com/embed/Dobx3YNAXJE', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 10', NULL, 'https://www.youtube.com/embed/dIUutoYSzbo', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 11', NULL, 'https://www.youtube.com/embed/cJELTC1ibtA', GETDATE(), 30, 0, 5),
(N'Đại ma vương mạnh nhất lịch sử chuyển sinh thành dân làng A - Tập 12', NULL, 'https://www.youtube.com/embed/1Yr-WbjozVo', GETDATE(), 30, 0, 5)

-- Chào mừng đến với lớp học đề cao thực lực
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES (N'Chào mừng đến với lớp học đề cao thực lực', N'Truyện kể về trường cao trung Koudo Ikusei, một ngôi trường danh tiếng với cơ sở vật chất cực kì hiện đại, nơi 100% học sinh sẽ đỗ đại học hoặc tìm được việc làm. Học sinh nơi đây có thể hưởng mọi quyền lợi và tự do cá nhân. Việc chi tiêu trong trường được thanh toán bằng điểm tích lũy. Nhưng sự thật thì các quyền lợi này chỉ dành cho những học sinh cao cấp. Nhân vật chính là Ayanokoji Kiyotaka – thành viên của lớp D, là nơi các học sinh "yếu kém" bị đào thải, không ai coi trọng. Ayanokoji sẽ làm gì để tồn tại trong ngôi trường này?', 'https://preview.redd.it/s2frn7kz9ou31.jpg?width=640&crop=smart&auto=webp&s=40d98be1411e93d49ca528fe54d61424b4c062dc')

INSERT INTO [FilmCategory] VALUES
(6, 9)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 1', NULL, 'https://www.youtube.com/embed/iTTrFraNlQU', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 2', NULL, 'https://www.youtube.com/embed/vyqR9PTaOHQ', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 3', NULL, 'https://www.youtube.com/embed/O-07O6VmbXU', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 4', NULL, 'https://www.youtube.com/embed/e8_ajRczIk8', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 5', NULL, 'https://www.youtube.com/embed/8ngy6FSr6y0', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 6', NULL, 'https://www.youtube.com/embed/MByujm1ioBs', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 7', NULL, 'https://www.youtube.com/embed/dGocwf453a4', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 8', NULL, 'https://www.youtube.com/embed/FEFNv-oEOHc', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 9', NULL, 'https://www.youtube.com/embed/pdyo60IO_yQ', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 10', NULL, 'https://www.youtube.com/embed/jJyLyNxS50E', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 11', NULL, 'https://www.youtube.com/embed/mK0Qq5Tez-k', GETDATE(), 30, 0, 6),
(N'Chào mừng đến với lớp học đề cao thực lực - Tập 12', NULL, 'https://www.youtube.com/embed/rEpI6l7K9QI', GETDATE(), 30, 0, 6)


--Mob Psycho 100
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES (N'Mob Psycho 100', N'Shigeo "MOB" Kageyama là một học sinh trung học năm hai bình thường, muốn sống một đời bình dị.Tuy là một người dễ dàng mất hút trong đám đông, nhưng cậu lại có siêu năng lực bẩm sinh mạnh mẽ hơn người.Mob chỉ muốn có một tuổi thanh xuân yên bình nên đã luôn cố gắng kìm nén, nhưng bao trận chiến lại tới khiến cảm xúc của cậu bùng nổ.Những ngày thanh xuân trở nên thật hỗn loạn, tương lai nào sẽ đón đợi Mob?','https://i-amp.ex-cdn.com/mgn.vn/files/news/2021/10/23/mob-psycho-100-mua-3-duoc-an-dinh-voi-vi-tri-dao-dien-moi-031418.jpg')

INSERT INTO [FilmCategory] VALUES
(7, 1),
(7, 2), 
(7, 5)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Mob Psycho 100 - Tập 1',  NULL, 'https://www.youtube.com/embed/WIYYejrlwko', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 2',  NULL, 'https://www.youtube.com/embed/qpnWYtC_Wgo', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 3',  NULL, 'https://www.youtube.com/embed/l8_2N4Uz4Cc', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 4',  NULL, 'https://www.youtube.com/embed/owePrHRQWPw', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 5',  NULL, 'https://www.youtube.com/embed/1XlTnvmFs50', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 6',  NULL, 'https://www.youtube.com/embed/XgVdMbMepus', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 7',  NULL, 'https://www.youtube.com/embed/HzN3k9RKtvM', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 8',  NULL, 'https://www.youtube.com/embed/ad2oXHb80FI', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 9',  NULL, 'https://www.youtube.com/embed/KkbiZCCKJKk', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 10', NULL, 'https://www.youtube.com/embed/QTO57kAIJFU', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 11', NULL, 'https://www.youtube.com/embed/oBLPcQjpmNg', GETDATE(), 30, 0, 7),
(N'Mob Psycho 100 - Tập 12', NULL, 'https://www.youtube.com/embed/HcSxd2c3s5w', GETDATE(), 30, 0, 7)


-- Cạo râu xong, tôi nhặt gái về nhà
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES (N'Cạo râu xong, tôi nhặt gái về nhà', N'Yoshida là một nhân viên văn phòng 26 tuổi, vừa bị crush suốt 5 năm trời từ chối. Trên đường mượn rượu giải sầu về, anh nhìn thấy một nữ sinh trung học đang ngồi bên xó đường. <br> - "Sao em lại ngồi đây?". <br> - "Nè... Em cho anh xơi đó. <br> Cho em ở nhà anh được không?"', 'https://otakukart.com/wp-content/uploads/2021/04/featured.png')

INSERT INTO [FilmCategory] VALUES
(8, 2),
(8, 4)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 1',	NULL, 'https://www.youtube.com/embed/Naags4krqLE', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 2',	NULL, 'https://www.youtube.com/embed/T5VX7zNfuYw', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 3',	NULL, 'https://www.youtube.com/embed/KusOWH8nUcY', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 4',	NULL, 'https://www.youtube.com/embed/DrW4pGY0SuU', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 5',	NULL, 'https://www.youtube.com/embed/pJVIKwlMs60', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 6',	NULL, 'https://www.youtube.com/embed/sBRtgcCWhQ8', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 7',	NULL, 'https://www.youtube.com/embed/xrJA6VlOZbg', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 8',	NULL, 'https://www.youtube.com/embed/1OR75vt0S8Y', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 9',	NULL, 'https://www.youtube.com/embed/nkaJaHg9iVU', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 10', NULL, 'https://www.youtube.com/embed/NlO3OW3Zjys', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 11', NULL, 'https://www.youtube.com/embed/Vh2mjlTFwZE', GETDATE(), 30, 0, 8),
(N'Cạo râu xong, tôi nhặt gái về nhà - Tập 12', NULL, 'https://www.youtube.com/embed/GlshF2au6eQ', GETDATE(), 30, 0, 8)


-- Cuộc Phiêu Lưu Kỳ Bí của JoJo
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES (N'Cuộc Phiêu Lưu Kỳ Bí của JoJo', N'Năm 2001 tại thành phố Naples của Ý, Giorno Giovanna - con trai của DIO, nhưng là hậu duệ của Jonathan Joestar, có ước mơ trở thành Gangstar để loại bỏ những kẻ buôn ma túy cho trẻ em từ nội bộ bên trong.','https://wallpaperaccess.com/full/2671779.jpg')

INSERT INTO [FilmCategory] VALUES
(9, 1),
(9, 5),
(9, 8)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 1',  NULL, 'https://www.youtube.com/embed/Feh5s45JRP0', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 2',  NULL, 'https://www.youtube.com/embed/MW3-JUEIX_M', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 3',  NULL, 'https://www.youtube.com/embed/126tjRE1tNY', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 4',  NULL, 'https://www.youtube.com/embed/7eoO8E0hZ4w', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 5',  NULL, 'https://www.youtube.com/embed/0TmY585tHtU', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 6',  NULL, 'https://www.youtube.com/embed/SrFAJy-Cw8o', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 7',  NULL, 'https://www.youtube.com/embed/BAE2Ph7_gR0', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 8',  NULL, 'https://www.youtube.com/embed/RdmMYbdKAq8', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 9',  NULL, 'https://www.youtube.com/embed/LQ7DMNIhxf8', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 10', NULL, 'https://www.youtube.com/embed/Nw5V6mAizfE', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 11', NULL, 'https://www.youtube.com/embed/z0wKF-4AYBY', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 12', NULL, 'https://www.youtube.com/embed/nwjJmZoT6lU', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 13', NULL, 'https://www.youtube.com/embed/nZ5DhBc9Hig', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 14', NULL, 'https://www.youtube.com/embed/6SZ34rC2X2c', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 15', NULL, 'https://www.youtube.com/embed/RvJCXXk0hqE', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 16', NULL, 'https://www.youtube.com/embed/e_nFSu_JQXU', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 17', NULL, 'https://www.youtube.com/embed/362HU4Dy9qM', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 18', NULL, 'https://www.youtube.com/embed/igAXlNxroJA', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 19', NULL, 'https://www.youtube.com/embed/FHoV1jPIIIg', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 20', NULL, 'https://www.youtube.com/embed/NhCn4e3MZak', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 21', NULL, 'https://www.youtube.com/embed/32l774pvhyI', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 22', NULL, 'https://www.youtube.com/embed/_SQoKXYFeCo', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 23', NULL, 'https://www.youtube.com/embed/neTud2-uDCY', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 24', NULL, 'https://www.youtube.com/embed/gTKEg4yj9fY', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 25', NULL, 'https://www.youtube.com/embed/99Bt3I9s2X8', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 26', NULL, 'https://www.youtube.com/embed/JPOGRGPIyEk', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 27', NULL, 'https://www.youtube.com/embed/jOx5mQzO564', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 28', NULL, 'https://www.youtube.com/embed/Iy5z0thuxnM', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 29', NULL, 'https://www.youtube.com/embed/VyQUjK-sFe8', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 30', NULL, 'https://www.youtube.com/embed/wf8D9kN9Stw', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 31', NULL, 'https://www.youtube.com/embed/llMTDY03GOM', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 32', NULL, 'https://www.youtube.com/embed/06FR2hbPYno', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 33', NULL, 'https://www.youtube.com/embed/xmGfayMaKDg', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 34', NULL, 'https://www.youtube.com/embed/1GuCivf7niQ', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 35', NULL, 'https://www.youtube.com/embed/qfUcNEIT6xM', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 36', NULL, 'https://www.youtube.com/embed/XFvwS19l52Q', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 37', NULL, 'https://www.youtube.com/embed/jl1P0_bLyfY', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 38', NULL, 'https://www.youtube.com/embed/X9PA-Af4Qaw', GETDATE(), 30, 0, 9),
(N'Cuộc Phiêu Lưu Kỳ Bí của JoJo - Tập 39', NULL, 'https://www.youtube.com/embed/mrn_avdLR4I', GETDATE(), 30, 0, 9)


-- Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES (N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác', N'Câu chuyện kể về Natsuki Subaru, một chàng trai tuổi teen đã bỏ học làm NEET bỗng nhiên được triệu hồi đến một thế giới khác. Tại đây, cậu được ban cho sức mạnh ""Trở về từ cái chết"". Mỗi lần chết đi, cậu sẽ quay trở lại một mốc thời gian xác định nào đó. Điều đặc biệt là cậu không được phép tiết lộ với bất cứ ai về sức mạnh này.Trong một thế giới tàn khốc, nơi tính mạng của những người quan trọng với mình liên tục bị đe dọa, một mình gánh trên vai một trọng trách lớn lao, Natsuki Subaru bắt đầu cuộc hành trình của mình.', 'https://cdn.akamai.steamstatic.com/steam/apps/1277510/capsule_616x353.jpg?t=1611984622')

INSERT INTO [FilmCategory] VALUES
(10, 6),
(10, 7),
(10, 8)

INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 1',  NULL, 'https://www.youtube.com/embed/IC-z4hAFcmc', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 2',  NULL, 'https://www.youtube.com/embed/ataqfG6ohOo', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 3',  NULL, 'https://www.youtube.com/embed/DWwbwtjfvbQ', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 4',  NULL, 'https://www.youtube.com/embed/otx-GpMdgWQ', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 5',  NULL, 'https://www.youtube.com/embed/j-IR7lQNMzg', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 6',  NULL, 'https://www.youtube.com/embed/tTf_tiaA9YU', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 7',  NULL, 'https://www.youtube.com/embed/cLr_sNbf11U', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 8',  NULL, 'https://www.youtube.com/embed/dbJFkk5x7J0', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 9',  NULL, 'https://www.youtube.com/embed/XLT60WAEmUY', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 10', NULL, 'https://www.youtube.com/embed/xF7pvcqO9rw', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 11', NULL, 'https://www.youtube.com/embed/WahDysYhgZY', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 12', NULL, 'https://www.youtube.com/embed/pdRwhME1v_0', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 13', NULL, 'https://www.youtube.com/embed/aSxPNbuPnRI', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 14', NULL, 'https://www.youtube.com/embed/BznkAUwiOjU', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 15', NULL, 'https://www.youtube.com/embed/_uN_Ub55-hg', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 16', NULL, 'https://www.youtube.com/embed/2UIQE4Qtr6A', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 17', NULL, 'https://www.youtube.com/embed/GCI8pSwGYuI', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 18', NULL, 'https://www.youtube.com/embed/n4zDReKbs40', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 19', NULL, 'https://www.youtube.com/embed/Qh4D9QsdU_M', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 20', NULL, 'https://www.youtube.com/embed/xPpHB4f6ifw', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 21', NULL, 'https://www.youtube.com/embed/W3mcof-GT4M', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 22', NULL, 'https://www.youtube.com/embed/NZCz70HT_FA', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 23', NULL, 'https://www.youtube.com/embed/EQGlQaZp_6U', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 24', NULL, 'https://www.youtube.com/embed/LO77ZQ1oUUk', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 25', NULL, 'https://www.youtube.com/embed/9pGKhvuwTmY', GETDATE(), 30, 0, 10),
(N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác - Tập 26', NULL, 'https://www.youtube.com/embed/zFU6-hKmmPg', GETDATE(), 30, 0, 10)
