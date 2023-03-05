-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 05, 2023 lúc 06:28 AM
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`authorID`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fujiko Fujio', NULL, NULL),
(2, 'Nguyễn Nhật Ánh', NULL, NULL),
(3, 'Stuart Redman', NULL, NULL);

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
  `publisher` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `hot` bit(1) NOT NULL,
  `news` bit(1) NOT NULL,
  `discount_percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `title`, `year_public`, `total_page`, `categoryID`, `publisher`, `description`, `price`, `quantity_sold`, `created_at`, `updated_at`, `active`, `hot`, `news`, `discount_percent`) VALUES
(1, 'Đôremon đi tìm miền đất hứa', 2006, 106, 1, 'Nhà xuất bản Kim Đồng', 'Chuyến phiêu lưu khám phá miền đất hứa đầy thú vị và vui tươi của Doremon và những người bạn.', 15000, 159, '2023-02-17 09:41:44', NULL, b'1', b'0', b'0', 15),
(2, 'English Vocabulary in Use: Pre-Intermediate and Intermediate Book with Answers: Vocabulary Reference and Practice (Kèm CD)', 2013, 264, 4, 'CAMBRIDGE UNIVERSITY', 'Vocabulary explanations and practice for pre-intermediate level (B1) learners of English. Perfect for both self-study and classroom activities. Quickly expand your vocabulary with over 100 units of easy to understand explanations and practice exercises. Be confident about what you are learning, thanks to Cambridge research into how English is really spoken and written, and get better at studying by yourself, with units on learning vocabulary, personalised practice and an easy to use answer key.\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 193000, 50, NULL, NULL, b'1', b'0', b'0', 10),
(3, 'Conan Thám tử lừng danh - Khúc nhạc cầu siêu', 2009, 105, 1, 'Nhà xuất bản Kim Đồng', 'Theo chân cuộc hành trình của cậu bé thám tử trong cơ thể bị thu nhỏ - Conan, khám phá những vụ án bí ẩn.', 25000, 50, NULL, NULL, b'1', b'1', b'1', 5),
(4, 'Truyện tranh Conan tuyển tập đặc biệt - Conan vs tổ chức áo đen', 2017, 200, 1, 'Kim Đồng', '', 36000, 25, NULL, NULL, b'1', b'1', b'0', 20),
(5, 'Thám tử lừng danh Conan - Tập 95', 2007, 125, 1, 'Kim Đồng', 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học.', 25000, 50, NULL, NULL, b'1', b'0', b'1', 15),
(6, 'Thám tử lừng danh Conan - Tập 80', 2007, 156, 1, 'Kim Đồng', 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học.', 25000, 16, NULL, NULL, b'1', b'1', b'1', 10),
(7, 'Usborne Big Picture Book of General Knowledge', 2013, 32, 4, 'USBORNE PUBLISHING', 'When were the first fireworks made? How many satellites have been sent into space? And what does the word kimono mean? Find out the answers to these questions and more in this stunningly illustrated book, guaranteed to keep fact-loving, question-asking children entertained for hours on end. Includes internet links to websites to find out even more.', 378000, 16, NULL, NULL, b'1', b'1', b'1', 0),
(8, 'Lift-the-Flap Very First Questions And Answers: Why Do I Have To Go To Bed?', 2020, 50, 4, 'USBORNE PUBLISHING', 'This charming book explains the dos and don\'ts for a good night\'s sleep. Discover what siestas are for, how sea otters sleep and why the dark doesn\'t need to be scary.', 176000, 9, NULL, NULL, b'1', b'0', b'1', 0);

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
(2, 3);

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
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'truyen-tranh', 'Truyện tranh', '2023-02-17 09:37:05', NULL),
(2, 'chinh-tri', 'Chính trị - Pháp lý', NULL, NULL),
(3, 'giao-khoa', 'Giáo khoa - Giáo trình', NULL, NULL),
(4, 'tieng-anh', 'Tiếng Anh', NULL, NULL),
(5, 'tam-ly', 'Tâm lý - Giới tính', NULL, NULL),
(6, 'lich-su', 'Lịch sử', NULL, NULL),
(7, 'khoa-hoc', 'Khoa học - Kỹ thuật', NULL, NULL),
(8, 'tre-em', 'Trẻ em', '2023-03-02 19:22:24', NULL),
(9, 'kinh-doanh', 'Kinh doanh', NULL, NULL),
(10, 'nau-an', 'Nấu ăn', NULL, NULL);

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
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `totalMoney` int(11) NOT NULL,
  `quatity` int(11) NOT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `avatar_path` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleID` int(11) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `fk_role_user` (`roleID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `authorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

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
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role_user` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
