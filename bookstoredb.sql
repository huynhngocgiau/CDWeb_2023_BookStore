-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 26, 2023 lúc 03:40 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.0.19

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
                          `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                          `author_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
                          `created_at` date DEFAULT NULL,
                          `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`authorID`, `name`, `author_code`, `created_at`, `updated_at`) VALUES
                                                                                         (16, 'Nguyễn Nhật Ánh', 'nguyen-nhat-anh', '2023-04-09', '2023-04-19'),
                                                                                         (18, 'Fujiko F. Fujio', 'fujiko-fujio', '2023-04-08', '2023-04-19'),
                                                                                         (19, 'Gosho Aoyama', 'gosho-aoyama', '2023-04-09', NULL),
                                                                                         (22, 'Antoine De Saint-Exupéry', 'antoine-de-saint-exupery', '2023-04-22', '2023-04-22'),
                                                                                         (24, 'Minette Walters', 'minette-walters', '2023-04-25', NULL),
                                                                                         (25, 'Luis Sepulveda', 'luis-sepulveda', '2023-04-25', NULL),
                                                                                         (26, 'R. J. Palacio', 'palacio', '2023-04-25', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
                        `id` int(11) NOT NULL,
                        `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
                        `year_public` int(11) DEFAULT NULL,
                        `total_page` int(11) DEFAULT NULL,
                        `categoryID` int(11) NOT NULL,
                        `authorID` int(11) NOT NULL,
                        `publisher` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
                        `description` text COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `book` (`id`, `title`, `year_public`, `total_page`, `categoryID`, `authorID`, `publisher`, `description`, `price`, `quantity_sold`, `created_at`, `updated_at`, `active`, `hot`, `news`, `discount_percent`) VALUES
                                                                                                                                                                                                                             (3, 'Conan Thám tử lừng danh - Khúc nhạc cầu siêu', 2009, 105, 1, 19, 'Nhà xuất bản Kim Đồng', 'Theo chân cuộc hành trình của cậu bé thám tử trong cơ thể bị thu nhỏ - Conan, khám phá những vụ án bí ẩn.', 25000, 50, NULL, NULL, b'1', b'1', b'1', 5),
                                                                                                                                                                                                                             (4, 'Truyện tranh Conan tuyển tập đặc biệt - Conan vs tổ chức áo đen', 2017, 200, 1, 19, 'Kim Đồng', '', 36000, 125, NULL, NULL, b'1', b'1', b'0', 20),
                                                                                                                                                                                                                             (6, 'Thám tử lừng danh Conan - Tập 80', 2007, 156, 1, 19, 'Kim Đồng', 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học.', 25000, 60, NULL, NULL, b'1', b'1', b'1', 10),
                                                                                                                                                                                                                             (20, 'Doraemon - Truyện ngắn - Kỉ niệm về bà', 0, 0, 1, 18, 'Kim Đồng', 'Doraemon - Truyện ngắn - Kỉ niệm về bà', 20000, 30, NULL, NULL, b'1', b'0', b'1', 0),
                                                                                                                                                                                                                             (21, 'Doraemon Truyện ngắn - Tập 44', 0, 0, 1, 18, 'Kim Đồng', 'Doraemon Truyện ngắn - Tập 44', 20000, 31, NULL, NULL, b'1', b'0', b'1', 0),
                                                                                                                                                                                                                             (22, 'Doraemon truyện ngắn - Tập 13', 0, 0, 1, 18, 'Kim Đồng', 'Doraemon truyện ngắn - Tập 13', 21000, 30, NULL, NULL, b'1', b'0', b'1', 10),
                                                                                                                                                                                                                             (24, 'Conan Thám tử lừng danh tập 1', 0, 55, 1, 19, 'Kim Đồng', 'Conan Thám tử lừng danh tập 1', 20000, 101, NULL, NULL, b'1', b'1', b'1', 10),
                                                                                                                                                                                                                             (26, 'Những Người Hàng Xóm - Nguyễn Nhật Ánh', 0, 232, 10, 16, 'NXB Trẻ', 'Câu chuyện đi theo lời kể của một anh chàng mới lấy vợ, chuẩn bị đi làm và có ý thích viết văn. Anh chàng yêu vợ theo cách của mình, khen ngợi sùng bái người yêu cũng theo cách của mình, nhưng nhìn cuộc đời theo cách sống của những người hàng xóm. Sống trong tình yêu của vợ đầy mùi thơm và nhiều vị ngọt. Chứng kiến tình yêu của anh cảnh sát với cô bạn gái ngành y; mối tình thứ hai của người phụ nữ tốt bụng phát thanh viên ngôn ngữ ký hiệu. Và được chiêm nghiệm trong tình yêu đắm đuối mỗi ngày của ông họa sĩ già thương nhớ người vợ xinh đẹp-người mẫu, nàng thơ của ông.\r\n\r\nNhư một cuốn phim đầy màu sắc với âm điệu dịu dàng, êm ả. Cuộc sống bình yên của những người yêu thương nhau. Bài học về tình người đứng phía sau bài học về nghề viết, và cả trong câu chuyện về… một lối kinh doanh nhà cực kỳ đặc biệt! \r\n\r\nCâu chuyện mở ra sẽ là bất ngờ với bạn đọc “ruột” của Nguyễn Nhật Ánh, và kết thúc trong một sự dịu dàng nhẹ nhõm lòng, bởi nhà văn đã nhắc lại cho ta nhớ:  cuộc sống luôn thật là tươi đẹp biết bao. Khép sách lại, bạn sẽ nhận được niềm vui bình yên.\r\n\r\nVài đoạn trích trong tác phẩm:\r\n\r\n“…Nếu con biết cách mở cửa sổ, đời sống sẽ tràn vào trang viết của con. Đôi khi chúng ta vẫn nhìn đấy, nhưng chúng ta không thấy. Nếu trái tim con đập vì con người, thậm chí đập vì một con chim, con sẽ nhìn thấy rất nhiều thứ”…\r\n\r\n“…Ruben là người tử tế. Người tử tế cao hơn người đàng hoàng một bậc. Người đàng hoàng sống ngay ngắn, không làm hại ai. Còn người tử tế là người sẵn sàng chịu thiệt thòi vì người khác.\r\n\r\nTôi không rõ định nghĩa của ông Jakob chính xác đến mức nào nhưng tôi biết câu chuyện của ông đang làm tôi cảm động…”\r\n\r\nRất nhiều những câu chuyện cảm động nho nhỏ, có khi chỉ là tình tiết, hay một câu nói… trong khắp từng chương sách khiến bạn đọc vẫn có thể nhận ngay ra “chất văn” của nhà văn mình yêu quý - Nguyễn Nhật Ánh. Mặc dù cuốn sách này được ông viết theo một cách khác, hoàn toàn mới lạ, gây ngạc nhiên từ cảnh quan cho đến nhân vật.\r\n\r\nVà ắt nhiên - có một bài thơ dịu ngọt từ một tình yêu đáng ngưỡng mộ dài cả gần thế kỷ.\r\n\r\nNgoài ra, qua tác phẩm tác giả còn đề cập những đặc trưng của Việt Nam và Bỉ qua món ăn, qua danh lam thắng cảnh…', 110000, 321, NULL, NULL, b'1', b'1', b'1', 33),
                                                                                                                                                                                                                             (27, 'Mắt biếc - Nguyễn Nhật Ánh', 0, 300, 10, 16, 'NXB Trẻ', 'Mắt biếc là một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn Nguyễn Nhật Ánh. Tác phẩm này cũng đã được dịch giả Kato Sakae dịch sang tiếng Nhật để giới thiệu với độc giả Nhật Bản.\r\n\r\n“Tôi gửi tình yêu cho mùa hè, nhưng mùa hè không giữ nổi. Mùa hè chỉ biết ra hoa, phượng đỏ sân trường và tiếng ve nỉ non trong lá. Mùa hè ngây ngô, giống như tôi vậy. Nó chẳng làm được những điều tôi ký thác. Nó để Hà Lan đốt tôi, đốt rụi. Trái tim tôi cháy thành tro, rơi vãi trên đường về.”\r\n\r\n… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc buồn, rất buồn khi xuyên suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn…', 110000, 150, NULL, NULL, b'1', b'0', b'1', 15),
                                                                                                                                                                                                                             (28, 'Ngày Xưa Có Một Chuyện Tình: Truyện Dài', 0, 344, 10, 16, 'NXB Trẻ', 'Ngày Xưa Có Một Chuyện Tình là tác phẩm mới tinh thứ 2 trong năm 2016 của nhà văn Nguyễn Nhật Ánh dài hơn 300 trang, được coi là tập tiếp theo của tập truyện Mắt biếc. Có một tình yêu dữ dội, với em,  của một người yêu em hơn chính bản thân mình - là anh.\r\n\r\nNgày xưa có một chuyện tình có phải là một câu chuyện cảm động  khi người ta yêu nhau, nỗi khát khao một hạnh phúc êm đềm ấm áp đến thế; hay đơn giản chỉ là chuyện ba người - anh, em, và người ấy…?\r\n\r\nBạn hãy mở sách ra, để chứng kiến làn gió tình yêu chảy qua như rải nắng trên khuôn mặt mùa đông của cô gái; nụ hôn đầu tiên ngọt mật, cái ôm đầu tiên, những giọt nước mắt và cái ôm xiết cuối cùng… rồi sẽ tìm thấy câu trả lời, cho riêng mình.', 120000, 100, NULL, NULL, b'1', b'1', b'1', 10),
                                                                                                                                                                                                                             (29, 'Kẻ nặn sáp', 0, 352, 10, 24, 'IPM', 'Mẹ tôi luôn nói, không bao giờ được tin một người đàn ông có dái tai nằm thấp hơn khuôn miệng. Đó là dấu hiệu của bọn tội phạm. Nhìn ông ta xem.\r\n\r\nRất nhiều nhận định nghe đáng ngờ và đầy cảm tính như thế lại tồn tại sắt đá khắp câu chuyện này, giăng lên mê lộ khiến không những độc giả mà chính các nhân vật cũng phải bối rối và lạc đường trên hành trình đi tìm thật-giả.\r\n\r\nCách đây bốn năm, một cô gái trẻ bị kết án sát nhân, khi người ta tìm thấy thi thể mẹ và em cô giữa thảm máu lênh láng trên sàn bếp, được chặt thành từng mảnh rồi ráp lại, nhưng có lẽ do loạn trí, một số mảnh đã bị ráp nhầm từ người nọ sang người kia.\r\n\r\nDù thế nào, sự cố cũng đưa cô gái từ ngôi nhà từng bình yên đẹp đẽ đến thẳng trại giam. Và ở đó năm qua năm, cô dần biến thành một con quỷ cái đáng gờm với biệt danh Kẻ nặn sáp. Những mẩu nến, những vụn đất sét tựu hình người dưới các ngón tay cô như nghiền ngẫm cả hờn oán lẫn cầu nguyện, cho đến một ngày, thiên thần cứu rỗi quả đã xuất hiện trước cửa nhà giam  với mái tóc đỏ rực và niềm tin mong manh rằng có chuyện oan sai ở đây.\r\n\r\nBức tranh tàn sát lập thể bốn năm về trước, nay được tái hiện lần nữa, và các chi tiết gớm ghiếc chưa từng hé lộ giờ mới lỉa chỉa bung ra như những cọng rơm bục khỏi vỏ gối cũ.\r\n\r\nNhưng trong một ngàn sự thật, chỉ có một điều là thật sự. Thiên thần liệu có đủ sáng suốt và đức tin để trả mọi thứ về đúng chỗ?', 115000, 52, NULL, NULL, b'1', b'0', b'1', 10),
                                                                                                                                                                                                                             (30, 'Hoàng tử bé (Tái bản 2019)', 0, 102, 8, 22, 'Nhà Xuất Bản Hội Nhà Văn', 'Hoàng tử bé được viết ở New York trong những ngày tác giả sống lưu vong và được xuất bản lần đầu tiên tại New York vào năm 1943, rồi đến năm 1946 mới được xuất bản tại Pháp. Không nghi ngờ gì, đây là tác phẩm nổi tiếng nhất, được đọc nhiều nhất và cũng được yêu mến nhất của Saint-Exupéry. Cuốn sách được bình chọn là tác phẩm hay nhất thế kỉ 20 ở Pháp, đồng thời cũng là cuốn sách Pháp được dịch và được đọc nhiều nhất trên thế giới. Với 250 ngôn ngữ dịch khác nhau kể cả phương ngữ cùng hơn 200 triệu bản in trên toàn thế giới, Hoàng tử bé được coi là một trong những tác phẩm bán chạy nhất của nhân loại.\r\n\r\nỞ Việt Nam, Hoàng tử bé được dịch và xuất bản khá sớm. Từ năm 1966 đã có đồng thời hai bản dịch: Hoàng tử bé của Bùi Giáng do An Tiêm xuất bản và Cậu hoàng con của Trần Thiện Đạo do Khai Trí xuất bản. Từ đó đến nay đã có thêm nhiều bản dịch Hoàng tử bé mới của các dịch giả khác nhau. Bản dịch Hoàng tử bé lần này, xuất bản nhân dịp kỷ niệm 70 năm Hoàng tử bé ra đời, cũng là ấn bản đầu tiên được Gallimard chính thức chuyển nhượng bản quyền tại Việt Nam, hy vọng sẽ góp phần làm phong phú thêm việc dịch và tiếp nhận tác phẩm quan trọng này với các thế hệ độc giả.', 51000, 321, NULL, NULL, b'1', b'1', b'0', 0),
                                                                                                                                                                                                                             (31, 'Truyện đọc tiếng Anh - Story of a Seagull and the Cat', 0, 128, 4, 25, 'Harper Collins Publ. UK', 'Sau một vụ tràn dầu, một con hải âu đang hấp hối lên bờ để đẻ quả trứng cuối cùng và đáp xuống ban công, nơi nó gặp Zorba, một con mèo đen lớn từ cảng Hamburg. Con mèo hứa với con hải âu sẽ chăm sóc trứng, không ăn hải âu con một khi nó nở và - khó nhất trong tất cả - sẽ dạy con hải âu biết bay. Zorba và những người bạn mèo của mình sẽ thực hiện lời hứa và cho Lucky - con hải âu nhỏ được nhận nuôi, sức mạnh để khám phá bản chất thật của nó?\r\n\r\nMột câu chuyện cảm động, nâng cao ý thức về môi trường một cách mạnh mẽ!', 290000, 66, NULL, NULL, b'1', b'0', b'1', 10),
                                                                                                                                                                                                                             (32, 'Truyện đọc tiếng Anh - Wonder', 0, 121, 4, 26, 'Penguin Random House UK', '\"My name is August. I won\'t describe what I look like. Whatever you\'re thinking, it\'s probably worse.\" Auggie wants to be an ordinary ten-year-old. He does ordinary things - eating ice cream, playing on his Xbox. He feels ordinary - inside. But ordinary kids don\'t make other ordinary kids run away screaming in playgrounds. Ordinary kids aren\'t stared at wherever they go. Born with a terrible facial abnormality, Auggie has been home-schooled by his parents his whole life. Now, for the first time, he\'s being sent to a real school - and he\'s dreading it. All he wants is to be accepted - but can he convince his new classmates that he\'s just like them, underneath it all? Wonder is a funny, frank, astonishingly moving debut to read in one sitting, pass on to others, and remember long after the final page.', 288000, 12, NULL, NULL, b'1', b'0', b'1', 30),
(33, 'Truyện thiếu nhi tiếng Anh - Usborne 10 Ten-Minute Fairy Tales', 0, 256, 4, 26, 'USBORNE PUBLISHING', '10 Ten-Minute Fairy Tales A magical collection of fairy tales, featuring retellings of favourites such as Aladdin, Little Red Riding Hood and Snow White and the Seven Dwarfs. Each charming story in this hardback book is beautifully illustrated and takes just ten minutes to read – the perfect length for snuggling up and enjoying at bedtime.', 468000, 10, NULL, NULL, b'1', b'0', b'0', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookimage`
--

CREATE TABLE `bookimage` (
                             `imageID` int(11) NOT NULL,
                             `path` text COLLATE utf8_unicode_ci NOT NULL,
                             `bookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bookimage`
--

INSERT INTO `bookimage` (`imageID`, `path`, `bookID`) VALUES
                                                          (9, 'admin/img/bookupload/doremon-13.jpg', 22),
                                                          (10, 'admin/img/bookupload/conan-khuc-nhac-cau-sieu.jpg', 3),
                                                          (11, 'admin/img/bookupload/conan-special-1.jpg', 4),
                                                          (12, 'admin/img/bookupload/doremon-ki-niem-ve-ba.jpg', 20),
                                                          (13, 'admin/img/bookupload/conan-80.jpg', 6),
                                                          (14, 'admin/img/bookupload/doremon-44.jpg', 21),
                                                          (16, 'admin/img/bookupload/conan-1.jpg', 24),
                                                          (22, 'admin/img/bookupload/conan-1a.jpg', 24),
                                                          (23, 'admin/img/bookupload/nhung-nguoi-hang-xom.jpg', 26),
                                                          (24, 'admin/img/bookupload/mat-biec.jpg', 27),
                                                          (25, 'admin/img/bookupload/ngay-xua-co-mot-chuyen-tinh.jpg', 28),
                                                          (26, 'admin/img/bookupload/ke-nan-sap.jpg', 29),
                                                          (27, 'admin/img/bookupload/hoang-tu-be.jpg', 30),
                                                          (28, 'admin/img/bookupload/the-story-of-a-seagull-and-the-cat.jpg', 31),
                                                          (29, 'admin/img/bookupload/wonder.jpg', 32),
                                                          (30, 'admin/img/bookupload/fairy-tales.jpg', 33);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
                        `cartID` int(11) NOT NULL,
                        `quantity` int(11) DEFAULT NULL,
                        `userID` int(11) DEFAULT NULL,
                        `bookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
                            `categoryID` int(11) NOT NULL,
                            `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
                            `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
                                                                                      (10, 'van-hoc', 'Văn học', NULL, NULL),
                                                                                      (12, 'tieng-viet', 'Tiếng Việt', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderline`
--

CREATE TABLE `orderline` (
                             `id` int(11) NOT NULL,
                             `quantity` int(11) DEFAULT NULL,
                             `total_price` int(11) DEFAULT NULL,
                             `bookID` int(11) DEFAULT NULL,
                             `orderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderline`
--

INSERT INTO `orderline` (`id`, `quantity`, `total_price`, `bookID`, `orderID`) VALUES
                                                                                   (13, 1, 20000, 21, 11),
                                                                                   (14, 1, 18000, 24, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
                          `orderID` int(11) NOT NULL,
                          `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                          `created_at` date DEFAULT NULL,
                          `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                          `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                          `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                          `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                          `total_price` int(11) DEFAULT NULL,
                          `updated_at` date DEFAULT NULL,
                          `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`orderID`, `address`, `created_at`, `name`, `note`, `phone`, `status`, `total_price`, `updated_at`, `userID`) VALUES
    (11, '36 Lê Hồng Phong', '2023-04-24', NULL, '', NULL, 'Đang xử lý..', 53000, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
                        `roleID` int(11) NOT NULL,
                        `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
                                                (3, 2),
                                                (2, 2),
                                                (2, 1),
                                                (1, 1),
                                                (1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
                         `userID` int(11) NOT NULL,
                         `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
                         `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
                         `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
                         `birthdate` date DEFAULT NULL,
                         `gender` bit(1) DEFAULT NULL,
                         `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
                         `password` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
                         `status` bit(1) DEFAULT NULL,
                         `confirm_token` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
                         `is_enable` bit(1) DEFAULT NULL,
                         `created_at` date DEFAULT NULL,
                         `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userID`, `email`, `fullname`, `username`, `birthdate`, `gender`, `phone`, `password`, `status`, `confirm_token`, `is_enable`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                    (1, 'camhong41201@gmail.com', 'Nguyen Van A', 'cmhg', '2023-04-15', b'1', '0783456781', '$2a$10$ZSJrWIVKH4xoBGNBKIF20uWkpTXsKvcR7nZMhXJYzIRe525tSGPLi', b'1', '349251', b'1', NULL, '2023-04-24'),
                                                                                                                                                                                    (2, 'camhongdev@gmail.com', 'Nguyễn Tí Tò', 'tito', '2004-06-05', b'1', '0312312319', '$2a$10$3mqd.QRrtnWEzS/baMpSb.pggtq6tkO25bqjV18qJaJJJ90ZPFjkq', b'1', '337625', b'1', NULL, '2023-04-22'),
                                                                                                                                                                                    (3, '19130063@st.hcmuaf.edu.vn', NULL, 'hyuny', NULL, b'0', NULL, '$2a$12$Dvd8rJCJcLjq1hLmTmlD7uCa.3gEnPxEe0FhvyR8GMcXrLQZqsYeu', b'1', '794103', b'1', NULL, NULL);

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
  ADD KEY `fk_book_cat` (`categoryID`),
  ADD KEY `FKhcj0e0ky3ftaweqnllqfwbn99` (`authorID`);

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
  ADD KEY `fk_cart_user` (`userID`),
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
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKcyl1xgylw2sa0k3oqighqgd56` (`bookID`),
  ADD KEY `fk_order` (`orderID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
    ADD PRIMARY KEY (`orderID`),
  ADD KEY `FKpnm1eeupqm4tykds7k3okqegv` (`userID`);

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
    MODIFY `authorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `bookimage`
--
ALTER TABLE `bookimage`
    MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
    MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
    MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `orderline`
--
ALTER TABLE `orderline`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
    MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
    ADD CONSTRAINT `FKhcj0e0ky3ftaweqnllqfwbn99` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `fk_book_cat` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Các ràng buộc cho bảng `bookimage`
--
ALTER TABLE `bookimage`
    ADD CONSTRAINT `bookimage_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
    ADD CONSTRAINT `fk_cart_book` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Các ràng buộc cho bảng `orderline`
--
ALTER TABLE `orderline`
    ADD CONSTRAINT `FKcyl1xgylw2sa0k3oqighqgd56` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FKdouy9nmjxe36by2xqq0t5pqxf` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderid`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
    ADD CONSTRAINT `FKpnm1eeupqm4tykds7k3okqegv` FOREIGN KEY (`userid`) REFERENCES `users` (`userID`);

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
