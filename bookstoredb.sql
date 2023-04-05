-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 04, 2023 lúc 08:03 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookstoredb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `authorID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`authorID`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fujiko Fujio', NULL, NULL),
(2, 'Nguyễn Nhật Ánh', NULL, NULL),
(3, 'Stuart Redman', NULL, NULL),
(4, 'Gosho Aoyama', NULL, NULL),
(5, 'Eiichi Yamagishi', NULL, NULL),
(6, 'Dan Ariely', NULL, NULL),
(7, 'Chimamanda Ngozi Adichie', NULL, NULL),
(8, 'Đức Huy', NULL, NULL),
(9, 'Michio Kaku', NULL, NULL),
(10, 'Jesse Schell', NULL, NULL),
(11, 'Daynes Katie', NULL, NULL),
(12, 'Mickaël Launay', NULL, NULL),
(13, 'Niccolò Machiavelli', NULL, NULL),
(14, 'Nguyễn Bảo Trung', NULL, NULL),
(15, 'James Maclaine', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year_public` int(11) DEFAULT NULL,
  `total_page` int(11) DEFAULT NULL,
  `categoryID` int(11) NOT NULL,
  `publisher` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `hot` bit(1) NOT NULL,
  `news` bit(1) NOT NULL,
  `discount_percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `title`, `year_public`, `total_page`, `categoryID`, `publisher`, `description`, `price`, `quantity_sold`, `created_at`, `updated_at`, `active`, `hot`, `news`, `discount_percent`) VALUES
(1, 'Đôremon đi tìm miền đất hứa', 2006, 106, 1, 'Nhà xuất bản Kim Đồng', 'Chuyến phiêu lưu khám phá miền đất hứa đầy thú vị và vui tươi của Doremon và những người bạn.', 15000, 159, '2023-02-17', NULL, b'1', b'0', b'0', 15),
(2, 'English Vocabulary in Use: Pre-Intermediate and Intermediate Book with Answers: Vocabulary Reference and Practice (Kèm CD)', 2013, 264, 4, 'CAMBRIDGE UNIVERSITY', 'Vocabulary explanations and practice for pre-intermediate level (B1) learners of English. Perfect for both self-study and classroom activities. Quickly expand your vocabulary with over 100 units of easy to understand explanations and practice exercises. Be confident about what you are learning, thanks to Cambridge research into how English is really spoken and written, and get better at studying by yourself, with units on learning vocabulary, personalised practice and an easy to use answer key.\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 193000, 50, NULL, NULL, b'1', b'0', b'0', 10),
(3, 'Conan Thám tử lừng danh - Khúc nhạc cầu siêu', 2009, 105, 1, 'Nhà xuất bản Kim Đồng', 'Theo chân cuộc hành trình của cậu bé thám tử trong cơ thể bị thu nhỏ - Conan, khám phá những vụ án bí ẩn.', 25000, 50, NULL, NULL, b'1', b'1', b'1', 5),
(4, 'Truyện tranh Conan tuyển tập đặc biệt - Conan vs tổ chức áo đen', 2017, 200, 1, 'Kim Đồng', '', 36000, 125, NULL, NULL, b'1', b'1', b'0', 20),
(5, 'Thám tử lừng danh Conan - Tập 95', 2007, 125, 1, 'Kim Đồng', 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học.', 25000, 95, NULL, NULL, b'1', b'0', b'1', 15),
(6, 'Thám tử lừng danh Conan - Tập 80', 2007, 156, 1, 'Kim Đồng', 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học.', 25000, 58, NULL, NULL, b'1', b'1', b'1', 10),
(7, 'Usborne Big Picture Book of General Knowledge', 2013, 32, 4, 'USBORNE PUBLISHING', 'When were the first fireworks made? How many satellites have been sent into space? And what does the word kimono mean? Find out the answers to these questions and more in this stunningly illustrated book, guaranteed to keep fact-loving, question-asking children entertained for hours on end. Includes internet links to websites to find out even more.', 378000, 16, NULL, NULL, b'1', b'1', b'1', 0),
(8, 'Lift-the-Flap Very First Questions And Answers: Why Do I Have To Go To Bed?', 2020, 50, 4, 'USBORNE PUBLISHING', 'This charming book explains the dos and don\'ts for a good night\'s sleep. Discover what siestas are for, how sea otters sleep and why the dark doesn\'t need to be scary.', 176000, 9, NULL, NULL, b'1', b'0', b'1', 0),
(9, 'Nghệ Thuật Thiết Kế Game', 2015, 235, 7, 'Nhà Xuất Bản Lao Động', '“Nghệ thuật thiết kế Game” của tác giả Jesse Schell, giáo sư về công nghệ giải trí của Đại học Carnegie Mellon, CEO của Schell Games, từ lâu đã là một cuốn sách gối đầu giường dành cho những nhà thiết kế game trên thế giới. Những người làm việc trong ngành phát triển game Việt Nam thường tìm đến cuốn sách này bằng tiếng Anh để học hỏi và trang bị kiến thức cho mình.\r\n\r\nXét thấy tại Việt Nam còn thiếu những tựa sách chuyên ngành thiết kế game bằng tiếng Việt, từ đó dẫn đến những khoảng trống về tri thức cho ngành, đồng thời là một khó khăn thách thức  cho các bạn trẻ yêu thích ngành thiết kế game muốn tìm hiểu để dấn thân theo đam mê, Hiệp hội phát triển game Việt Nam, dưới sự tài trợ của 8 game studio (Athena, Amanotes, iKame, Falcon, Hiker Games, Sky Mavis, Zitga, Wolffun), đã mua bản quyền và hợp tác với nhà phát hành sách Alpha Books để cho ra mắt cuốn sách nói trên.\r\n\r\nNhận xét về cuốn sách này, một số tên tuổi hàng đầu trong ngành phát triển game đã viết :\r\n\r\n“Nghệ thuật thiết kế game là một trong số rất nhiều cuốn sách tôi thường xuyên tham khảo trong quá trình sản xuất. Bất kể bạn vừa mới bắt đầu hay đang tìm một góc nhìn mới mẻ cho quá trình thiết kế của mình,đây vẫn là một cuốn sách thiết yếu trong thư viện của bạn.”\r\n\r\n-          Neil Druckmann, Giám đốc Sáng tạo của game The Last of Us tại Naughty Dog\r\n\r\n“Trên bàn làm việc của người trong ngành game, các cuốn sách đến và đi rất nhanh, nhưng chúng đều được đặt phía trên “Nghệ thuật thiết kế game” của Jesse Schell vì đây là cuốn sách duy nhất còn sót lại.”\r\n\r\n-          Jason VandenBerghe, Giám đốc Sáng tạo, Ubisoft\r\n\r\nHiệp hội phát triển game Việt Nam kỳ vọng rằng, sự ra đời bản tiếng Việt của cuốn sách này , sẽ có những tác động tích cực tới ngành phát triển game Việt Nam trong thời gian tới. Giờ đây, những người có đam mê với ngành phát triển game đã có một hành trang tốt để bắt đầu hành trình dấn thân của mình.\r\n\r\nNgành công nghiệp phát triển game Việt Nam tuy vẫn còn non trẻ, những đã có những bước phát triển mạnh mẽ trong thời gian gần đây. Rất nhiều studio game Việt nam đang được xếp hạng top hàng đầu thế giới về lượt tải game trên các nền tảng Play Store, App Store. Nhu cầu nhân lực ngành phát triển game Việt Nam hiện đang rất lớn, đặc biệt trong lĩnh vực thiết kế game, do thiếu vắng các chương trình đào tạo chính quy. Ở các nước có ngành công nghiệp game phát triển như Mỹ, Trung Quốc, Nhật Bản, Hàn Quốc, những nhà thiết kế game hàng đầu đều được yêu quý, ngưỡng mộ và tôn trọng như những người ở trong các ngành công nghiệp nội dung khác. Mong rằng, những cú hích về tri thức như việc ra mắt tựa sách này, Việt Nam cũng sẽ sớm có những nhà thiết kế game được thế giới biết đến.', 499000, 169, NULL, NULL, b'1', b'0', b'1', 20),
(10, 'Các Thế Giới Song Song (Tái Bản 2018)', 2018, 480, 7, 'Nhà xuất bản Thế Giới', 'Một chuyến du hành đầy trí tuệ qua các vũ trụ, được dẫn dắt tài tình bởi \"thuyền trưởng\" Michio Kaku và độc giả có dịp chiêm ngưỡng vẻ đẹp kỳ vĩ của vũ trụ kể từ vụ nổ lớn, vượt qua những hố đen, lỗ sâu, bước vào các thế giới lượng tử từ muôn màu kỳ lạ nằm ngay trước mũi chúng ta, vốn dĩ tồn tại song song trên một màng bên ngoài không - thời gian bốn chiều, ngắm nhìn thực tại vật chất quen thuộc hoà quyện với thế giới của những điều kỳ diệu như năng lượng và vật chất tối, sự nảy chồi của các vũ trụ, những chiều không gian bí ẩn và sự biến ảo của các dây rung siêu nhỏ...\r\n\r\nDẫn chuyện lôi cuốn, kết hợp tường minh, sống động một lượng thông tin đồ sộ để khai mở những giới hạn tột cùng của trí  tưởng tượng, Kaku thực sự xứng đáng là \" nhà truyền giáo\" vĩ đại đã mang thế giới vật lý lý thuyết tới quảng đại quần chúng.', 109500, 332, NULL, NULL, b'1', b'0', b'1', 0),
(11, 'Toán Học, Một Thiên Tiểu Thuyết', 2019, 332, 7, 'Nhà xuất bản Thế Giới', 'Hầu hết mọi người đều thích toán, tiếc là họ không biết điều này!\r\n\r\nBởi ai mà chẳng thấy hấp dẫn với những mẩu chuyện kỳ thú về toán: như “giáo phái” toán học kỳ lạ của Pythagoras thời cổ đại hay những cuộc thăm dò hệ mặt trời bằng công cụ toán học đầy kịch tính thời cận đại, hoặc gần đây hơn là sự kiện máy tính AlphaGo giành chiến thắng trước kỳ thủ cờ vây số một thế giới Lee Sedol bằng những nước đi “thần thánh” sử dụng lý thuyết xác suất.\r\n\r\nToán học khai sinh vì lý do hữu dụng, hẳn nhiên. Vào thời tiền sử, người ta nghĩ ra những con số để đếm đàn gia súc, dùng hình học để đo ruộng đất, làm đường sá. Loài home sapiens chúng ta không ngừng tò mò muốn khám phá thế giới tự nhiên xung quanh, nên suốt mấy ngàn năm qua toán học đã tiến lên phía trước với những bước khổng lồ và ngày càng trừu tượng.\r\n\r\nMickaël Launaykhông chỉ cho người đọc thấy cái đẹp, chất thơ của toán học mà còn xác quyết một điều khác, rằng mọi người đều có thể yêu thích toán học và đều có thể cảm nhận được vẻ đẹp tự nhiên của nó. Cuốn sách này là một minh chứng cho điều đó.', 110000, 3369, NULL, NULL, b'1', b'1', b'0', 26),
(12, 'Kỹ Thuật Sửa Chữa Ô Tô - Nâng Cao (Tái Bản 2020)', 2020, 440, 7, 'Nhà Xuất Bản Bách Khoa Hà Nội', 'Căn cứ vào nhu cầu nâng cao tay nghề hiện nay, Huy Hoàng trân trọng giới thiệu tới bạn đọc cuốn sách Kỹ thuật sửa chữa ô tô nâng cao dành cho những người đang làm việc trong ngành công nghiệp sửa chữa và bảo dưỡng ô tô. Cuốn sách được trình bày rõ ràng, dễ hiểu, dễ thực hành, giúp người đọc nhanh chóng nắm vững kỹ thuật để nâng cao tay nghề.', 195000, 15, NULL, NULL, b'1', b'0', b'1', 25),
(13, 'Quân Vương – Thuật Cai Trị (Tái Bản)', 2018, 200, 5, 'Nhà Xuất Bản Thế Giới\r\n', 'Quân Vương – Thuật Cai Trị (Tái Bản 2018) là cuốn sách gối đầu giường của rất nhiều thế hệ chính trị gia và lãnh đạo trên thế giới.\r\n\r\nCuốn sách nhỏ của Niccolò Machiavelli đã hội tự những nguyên tắc làm nền móng cho khoa học quản trị nói chung và chính trị học nói riêng.\r\n\r\nNgười ta sẽ luôn đọc Quân vương chừng nào con người vẫn chưa thôi trò chơi nguy hiểm nhưng hấp dẫn có cái tên \"chính trị\".\r\n\r\nQua cuốn sách, độc giả sẽ tìm ra chân dung một vị quân vương hình mẫu : keo kiệt hay rộng lượng, độc ác hay nhân từ, thất hứa hay giữ lời nếu lời hứa đi ngược lại lợi ích của mình, phải làm gì để tránh bị dân chúng căm ghét, phải thực thi những hành động lớn lao để nâng cao uy tín của mình.\r\n\r\nCuốn sách bàn về khoa học chính trị của nhà ngoại giao, nhà triết học và nhà quân sự người Ý – Niccolò Machiavelli. Xuất hiện lần đầu tiên vào năm 1513 nhưng mãi đến năm 1532, ấn bản đầu tiên mới được chính thức xuất bản dưới sự cho phép của Giáo hoàng Clement VII.', 109000, 70, NULL, NULL, b'1', b'1', b'0', 30),
(14, 'Ngoan Cường Vượt Định Kiến', 2022, 112, 5, 'Nhà Xuất Bản Thanh Niên', 'Chắc hẳn trong chúng ta, ai cũng đều đã từng nghe những lời nói kiểu thế này:\r\n\r\n“Đàn ông 30 tuổi mà chưa có nhà, có xe là thất bại”\r\n\r\n“Con gái phải ngoan ngoãn, nghe lời, dịu dàng và biết làm chiều lòng người khác”\r\n\r\nTất cả những câu nói quen thuộc đó đều xuất phát từ những định kiến đã “ăn sâu bám rễ” trong quan niệm của nhiều người. Để có mặt trên cuộc đời này đã là một điều vô cùng quý giá vậy nên đâu cần sống chỉ để theo đuổi và làm chiều lòng kẻ khác.\r\n\r\nAi đó từng nói: “Điều quan trọng là những gì bạn muốn cho chính mình, chứ không phải những gì người khác muốn bạn làm” bởi vậy nên đừng lo sợ những lời bàn tán, đừng e dè những tiêu chuẩn đã không còn phù hợp. Dù bạn đang là ai, ở giới tính nào, tuổi tác ra sao thì bạn vẫn xứng đáng được sống trọn vẹn.\r\n\r\n“Ngoan Cường Vượt Định Kiến” dành cho những ai muốn phá bỏ những vùng an toàn và bước vào một cuộc sống tự do. Cùng với đó cuốn sách còn đem đến những thực trạng về định kiến hiện nay, và cách để chúng ta vượt qua chúng. Ánh nắng mặt trời không thể đốt cháy mọi thứ nếu không xuyên qua kính lúp. Bạn không thể sống là chính mình nếu như bạn vẫn lo sợ về việc người khác nghĩ gì về bạn.Hãy nhớ rằng “Định kiến sẽ vẫn còn nhưng nếu như bạn sẵn sàng phá vỡ để sống cho chính mình thì sẽ không bị nó khuất phục”.', 79000, 299, NULL, NULL, b'1', b'1', b'0', 29),
(15, 'Phi Lý Trí (Tái Bản)', 2018, 404, 5, 'Nhà Xuất Bản Lao Động\r\n', 'Là một trong những cuốn sách của Dan Ariely là một cuốn sách đặc biệt hấp dẫn và đầy cảm hứng. Nó buộc người đọc phải suy nghĩ kỹ hơn về tất cả những hành vi, những sai lầm của mình để sống hợp lý và tốt đẹp hơn.\r\n\r\nTại sao chúng ta luôn tự hứa là sẽ ăn kiêng để rồi ý nghĩ ấy vụt biến ngay khi chiếc xe chở đồ tráng miệng đi qua? Tại sao đôi khi chúng ta hào hứng mua sắm những thứ không thật sự cần đến? Tại sao chúng ta vẫn cảm thấy đau đầu sau khi dùng loại aspirin có giá 1 xu nhưng cơn đau đầu ấy lại biến mất nếu thuốc đó đắt gấp 50 lần? Tại sao những tín đồ được yêu cầu nhớ lại Mười điều răn của Chúa có xu hướng thành thật (ít nhất là ngay sau đó) hơn những người không được yêu cầu làm vậy? Hoặc tại sao các quy tắc danh dự lại làm tăng mức độ gian lận nơi công sở? Khi đọc tới những trang cuối của cuốn sách này, bạn sẽ có câu trả lời cho các câu hỏi trên và nhiều câu hỏi khác ‒ những câu hỏi có ý nghĩa nhất định đối với cuộc sống, công việc kinh doanh và thế giới quan của bạn.', 169000, 658, NULL, NULL, b'1', b'1', b'0', 30),
(16, 'Siêu Nhí Biết Tuốt - 101 Bí Ẩn Kích Thích Tò Mò Của Các Bạn Nhỏ', 2020, 120, 8, 'Nhà Xuất Bản Hà Nội', 'Cuốn sách khoa học dễ thương dành cho các bé ham mê tìm hiểu bao gồm 101 câu hỏi về cuộc sống hàng ngày từ các bạn học sinh trên khắp thế giới được tập hợp đầy đủ. Ở lứa tuổi này của các bé, các nhà khoa học nhí luôn tràn trề hy vọng, cùng những ngây thơ trong sáng buổi ban đầu. Đứng trước thế giới với bao điều kỳ diệu mang trong mình sự tò mò, khát vọng tìm hiểu, câu nói thường thấy nhất ở trẻ là \"Vì sao?\"\r\n“Tại sao mặt trăng luôn đi theo ta?”, “Tại sao bò tót lại ghét màu đỏ?’’, “Ai Cập ở đâu?” hay “Ai đã đi vòng quanh thế giới?” Trẻ con quan sát thế giới xung quanh và luôn luôn đặt câu hỏi về những băn khoăn của mình. Đây là điều mà người trưởng thành không dễ dàng làm được.\r\nCũng xuất phát từ những suy nghĩ trên, chúng tôi đã thu thập rộng rãi, lựa chọn kĩ càng các câu hỏi mà các em nhỏ cảm thấy hứng thú để đưa ra bộ sách Siêu nhí Biết tuốt, mang lại cho các em những câu trả lời theo từng chủ đề. Cuốn sách chắc chắn sẽ đem đến một thế giới khoa học đầy niềm vui, hài hước, thú vị, làm thỏa mãn trí tò mò của các nhà khoa học nhí.', 203000, 1012, NULL, NULL, b'1', b'1', b'0', 40),
(17, 'Những Người Hàng Xóm - Nguyễn Nhật Ánh', 2022, 232, 10, 'NXB Trẻ', 'Câu chuyện đi theo lời kể của một anh chàng mới lấy vợ, chuẩn bị đi làm và có ý thích viết văn. Anh chàng yêu vợ theo cách của mình, khen ngợi sùng bái người yêu cũng theo cách của mình, nhưng nhìn cuộc đời theo cách sống của những người hàng xóm. Sống trong tình yêu của vợ đầy mùi thơm và nhiều vị ngọt. Chứng kiến tình yêu của anh cảnh sát với cô bạn gái ngành y; mối tình thứ hai của người phụ nữ tốt bụng phát thanh viên ngôn ngữ ký hiệu. Và được chiêm nghiệm trong tình yêu đắm đuối mỗi ngày của ông họa sĩ già thương nhớ người vợ xinh đẹp-người mẫu, nàng thơ của ông.\r\n\r\nNhư một cuốn phim đầy màu sắc với âm điệu dịu dàng, êm ả. Cuộc sống bình yên của những người yêu thương nhau. Bài học về tình người đứng phía sau bài học về nghề viết, và cả trong câu chuyện về… một lối kinh doanh nhà cực kỳ đặc biệt! \r\n\r\nCâu chuyện mở ra sẽ là bất ngờ với bạn đọc “ruột” của Nguyễn Nhật Ánh, và kết thúc trong một sự dịu dàng nhẹ nhõm lòng, bởi nhà văn đã nhắc lại cho ta nhớ:  cuộc sống luôn thật là tươi đẹp biết bao. Khép sách lại, bạn sẽ nhận được niềm vui bình yên.\r\n\r\nVài đoạn trích trong tác phẩm:\r\n\r\n“…Nếu con biết cách mở cửa sổ, đời sống sẽ tràn vào trang viết của con. Đôi khi chúng ta vẫn nhìn đấy, nhưng chúng ta không thấy. Nếu trái tim con đập vì con người, thậm chí đập vì một con chim, con sẽ nhìn thấy rất nhiều thứ”…\r\n\r\n“…Ruben là người tử tế. Người tử tế cao hơn người đàng hoàng một bậc. Người đàng hoàng sống ngay ngắn, không làm hại ai. Còn người tử tế là người sẵn sàng chịu thiệt thòi vì người khác.\r\n\r\nTôi không rõ định nghĩa của ông Jakob chính xác đến mức nào nhưng tôi biết câu chuyện của ông đang làm tôi cảm động…”\r\n\r\nRất nhiều những câu chuyện cảm động nho nhỏ, có khi chỉ là tình tiết, hay một câu nói… trong khắp từng chương sách khiến bạn đọc vẫn có thể nhận ngay ra “chất văn” của nhà văn mình yêu quý - Nguyễn Nhật Ánh. Mặc dù cuốn sách này được ông viết theo một cách khác, hoàn toàn mới lạ, gây ngạc nhiên từ cảnh quan cho đến nhân vật.\r\n\r\nVà ắt nhiên - có một bài thơ dịu ngọt từ một tình yêu đáng ngưỡng mộ dài cả gần thế kỷ.\r\n\r\nNgoài ra, qua tác phẩm tác giả còn đề cập những đặc trưng của Việt Nam và Bỉ qua món ăn, qua danh lam thắng cảnh…\r\n\r\nQuà tặng kèm sách:\r\n\r\nCho phiên bản bìa mềm gồm:\r\n\r\n- 1 thẻ treo bằng nhựa dẻo xinh xắn (1 trong 5 mẫu ngẫu nhiên).\r\n\r\n- 1 bookmark bằng giấy cứng.\r\n\r\nCho phiên bản bìa cứng gồm:\r\n\r\n- 1 thẻ treo bằng nhựa dẻo xinh xắn (1 trong 5 mẫu ngẫu nhiên).\r\n\r\n- 1 bookmark bằng giấy cứng.\r\n\r\n- 1 postcard\r\n\r\nĐẶC BIỆT: Có 50 postcard có lời chúc và chữ ký do nhà văn Nguyễn Nhật Ánh tự tay viết được đặt ngẫu nhiên trong 50 quyển sách phát hành toàn quốc', 110000, 2734, NULL, NULL, b'1', b'0', b'1', 30),
(18, 'Hạ đỏ (Tái Bản 2022)', 2022, 184, 10, 'NXB Trẻ', 'Mùa hè năm đó, Chương được bố mẹ cho về quê chơi. Ở đây, cậu được biết đến những trò chơi thú vị cùng hai đứa em con nhà dì của mình, những trò chơi mà Chương chẳng thể kiếm ở đâu được khi còn sống ở thành phố. Rồi Chương gặp Út Thêm và phải lòng cô bé, Chương thích sự nhẹ nhàng ở Út Thêm và chỉ muốn được nhìn thấy cô mỗi ngày. Ngày qua ngày, Chương đã đi qua nhiều cung bậc cảm xúc khi bắt đầu biết rung động trước một người con gái, cậu muốn dành những điều thật vui vẻ và tốt đẹp gửi đến cho cô. Chương trở lại thành phố sau những ngày hè nắng cháy, hoa cỏ may trắng muốt mọc đầy trên con đường cậu đi qua mỗi ngày để đến nhà Út Thêm bám đầy gấu quần cậu, như mối tình đầu da diết mà cậu mang trong lòng.', 38000, 277, NULL, NULL, b'1', b'0', b'1', 21),
(19, 'Nhà (Tái Bản)', 2020, 208, 10, 'Nhà Xuất Bản Thế Giới', '\"Có nhiều người đã trải qua biết bao lần thăng trầm, đã hiểu được thế nào là mái nhà thế nào là mái ấ họ sẽ đi thật chậm, nương vào nhau mà bước. Họ hiểu ai cũng có lỡ lầm, không trọn vẹ, vì thế họ biết giữ nhau bằng sự rộng lượng và bao dung.\"\r\n\r\nKhác với tác phẩm đầu tiên kể về những câu chuyện như mảnh đất chưa được vỡ hoang để mọi người đến chiêm nghiệm, nhìn lại cuộc sống hằng ngày của mình và nảy sinh ước muốn gieo trồng thì ở Nhà – mảnh đất ấy đã có những mầm xanh hy vọng, những cây cổ thụ vững chãi, những đóa hoa tươi thắm, những bóng mát thảnh thơ Khi đọc Nhà, ta cứ như đang được tưới tẩm những giọt nước trong ngần, giúp lòng chuyển hóa và thăng hoa.\r\n\r\nChắc hẳn tác giả phải đi nhiều lắm, phải chạm nhiều lắm và phải khóc nhiều lắm mới có thể viết ra được như vậy, bởi Nhà như chiếc lá đã chín cùng với tháng năm. Trong Nhà vẫn là những câu chuyện sinh lão bệnh tử của bác sĩ và bệnh nhân, vẫn là những giọt nước mắt, những nụ cười giữa cuộc đời quá nhiều chìm nổi, thay đổ nhưng Nguyễn Bảo Trung đã nhuộm vào đó một tình thương, một tấm lòng “mong mọi người hãy sống thiết tha với nhau hơn nữa, hãy là NHÀ thật sự để người thương có thể trở về. Bởi biết đâu, chớp mắt một cái chỉ còn lại tro tàn”.', 109000, 4265, NULL, NULL, b'1', b'1', b'0', 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookauthor`
--

CREATE TABLE `bookauthor` (
  `bookID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bookauthor`
--

INSERT INTO `bookauthor` (`bookID`, `authorID`) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 15),
(8, 11),
(9, 10),
(10, 9),
(11, 12),
(12, 8),
(13, 13),
(14, 7),
(15, 6),
(17, 2),
(18, 2),
(19, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookimage`
--

CREATE TABLE `bookimage` (
  `imageID` int(11) NOT NULL,
  `path` text NOT NULL,
  `bookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bookimage`
--

INSERT INTO `bookimage` (`imageID`, `path`, `bookID`) VALUES
(1, '/web/images/book/truyen-tranh/conan-80.jpg', 6),
(2, '/web/images/book/truyen-tranh/conan-95.jpg', 5),
(5, '/web/images/book/truyen-tranh/conan-special-1.jpg', 4),
(6, '/web/images/book/truyen-tranh/conan-khuc-nhac-sieu-cau.jpg', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalMoney` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cartitem`
--

CREATE TABLE `cartitem` (
  `cartID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'truyen-tranh', 'Truyện tranh', '2023-02-17', NULL),
(2, 'chinh-tri', 'Chính trị - Pháp lý', NULL, NULL),
(3, 'giao-khoa', 'Giáo khoa - Giáo trình', NULL, NULL),
(4, 'tieng-anh', 'Tiếng Anh', NULL, NULL),
(5, 'tam-ly', 'Tâm lý - Giới tính', NULL, NULL),
(6, 'lich-su', 'Lịch sử', NULL, NULL),
(7, 'khoa-hoc', 'Khoa học - Kỹ thuật', NULL, NULL),
(8, 'tre-em', 'Trẻ em', '2023-03-02', NULL),
(9, 'kinh-doanh', 'Kinh doanh', NULL, NULL),
(10, 'van-hoc', 'Văn học', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderline`
--

CREATE TABLE `orderline` (
  `orderID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `address` text NOT NULL,
  `totalMoney` int(11) NOT NULL,
  `quatity` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`roleID`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roleuser`
--

CREATE TABLE `roleuser` (
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roleuser`
--

INSERT INTO `roleuser` (`userID`, `roleID`) VALUES
(1, 1),
(2, 2),
(1, 1),
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `password` varchar(70) NOT NULL,
  `avatar_path` text DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `confirm_token` varchar(10) DEFAULT NULL,
  `is_enable` bit(1) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userID`, `email`, `fullname`, `username`, `birthdate`, `gender`, `phone`, `password`, `avatar_path`, `status`, `confirm_token`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'camhong41201@gmail.com', NULL, 'cmhg', NULL, b'0', NULL, '$2a$10$ZSJrWIVKH4xoBGNBKIF20uWkpTXsKvcR7nZMhXJYzIRe525tSGPLi', NULL, b'0', '349251', b'1', NULL, NULL),
(2, 'camhongdev@gmail.com', NULL, 'tito', NULL, b'0', NULL, '$2a$10$3mqd.QRrtnWEzS/baMpSb.pggtq6tkO25bqjV18qJaJJJ90ZPFjkq', NULL, b'0', '337625', b'1', NULL, NULL),
(3, '19130063@st.hcmuaf.edu.vn', NULL, 'hyuny', NULL, b'0', NULL, '$2a$10$3yEsbRix243ts7CltkgD5.Yxlk03zhVLUOoIq6gXNjOPkTPW8ebdO', NULL, b'0', '794103', b'1', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_book_cat` (`categoryID`);

--
-- Chỉ mục cho bảng `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD PRIMARY KEY (`bookID`,`authorID`),
  ADD KEY `fk_author` (`authorID`);

--
-- Chỉ mục cho bảng `bookimage`
--
ALTER TABLE `bookimage`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `bookID` (`bookID`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`cartID`,`bookID`),
  ADD KEY `fk_cart_book` (`bookID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Chỉ mục cho bảng `orderline`
--
ALTER TABLE `orderline`
  ADD PRIMARY KEY (`orderID`,`bookID`),
  ADD KEY `fk_book_order` (`bookID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`,`userID`),
  ADD KEY `fk_user_order` (`userID`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Chỉ mục cho bảng `roleuser`
--
ALTER TABLE `roleuser`
  ADD KEY `fk_user` (`userID`),
  ADD KEY `fk_role` (`roleID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `authorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `bookimage`
--
ALTER TABLE `bookimage`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_cat` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Các ràng buộc cho bảng `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`);

--
-- Các ràng buộc cho bảng `bookimage`
--
ALTER TABLE `bookimage`
  ADD CONSTRAINT `bookimage_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Các ràng buộc cho bảng `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `fk_cart` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`),
  ADD CONSTRAINT `fk_cart_book` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`);

--
-- Các ràng buộc cho bảng `orderline`
--
ALTER TABLE `orderline`
  ADD CONSTRAINT `fk_book_order` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_order` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Các ràng buộc cho bảng `roleuser`
--
ALTER TABLE `roleuser`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
