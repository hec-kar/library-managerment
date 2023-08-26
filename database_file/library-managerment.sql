-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 12:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library-managerment`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertNewBorrow` (IN `p_card_id` VARCHAR(10), IN `p_librarian_id` VARCHAR(10))   BEGIN
    INSERT INTO borrows (borrow_id, card_id, librarian_id, take_date, due_date, return_date, status) 
    VALUES (NULL, p_card_id, p_librarian_id, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 14 DAY), NULL, '0');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertNewBorrowBook` (IN `p_borrow_id` INT, IN `p_borrow_book` INT)   BEGIN
	INSERT INTO borrow_book(borrow_id, book_id) 
	VALUES (p_borrow_id , p_borrow_book);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `genre_id` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publication` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `genre_id`, `author`, `publication`, `quantity`) VALUES
(1, 'Giáo trình Lịch sử tôn giáo thế giới', 'LS', 'Đặng Văn Chương', 'Nxb. Đại học Huế, 2020', 10),
(2, 'Từ ngữ chỉ màu sắc trong tiếng Pa Cô', 'NV', 'Trương Thị Cúc', 'Nxb. Trường Đại học Khoa học, 2022', 3),
(3, 'Giáo trình Lập trình nâng cao với C/C++', 'CNTT', 'Trương Công Tuấn', 'Nxb. Đại học Huế, 2021', 15),
(4, 'Giáo trình lập trình hướng đối tượng', 'CNTT', 'Trương Công Tuấn', 'Nxb. Trường Đại học Khoa học, 2018', 4),
(5, 'Cấu trúc dữ liệu và giải thuật', 'CNTT', 'Đỗ Xuân Lôi', 'Nxb. Giáo dục, 1993', 20),
(6, 'Cơ sở công nghệ phần mềm', 'CNTT', 'Lương Mạnh Bá', 'Nxb. Khoa học và Kỹ thuật, 2010', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `borrow_id` int(11) NOT NULL,
  `card_id` varchar(10) NOT NULL,
  `librarian_id` varchar(10) NOT NULL,
  `take_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`borrow_id`, `card_id`, `librarian_id`, `take_date`, `due_date`, `return_date`, `status`) VALUES
(38, '20T1020501', 'THUTHU1', '2023-05-17', '2023-05-31', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `borrow_book`
--

CREATE TABLE `borrow_book` (
  `borrow_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` varchar(10) NOT NULL,
  `genre_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
('CNTT', 'Công Nghệ Thông Tin'),
('DLDC', 'Địa Lý - Địa Chất'),
('KT', 'Kiến Trúc'),
('LLCT', 'Lý Luận Chính Trị'),
('LS', 'Lịch Sử'),
('MT', 'Môi Trường'),
('NV', 'Ngữ Văn'),
('TOAN', 'Toán Học'),
('VL', 'Vật Lý');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `librarian_id` varchar(10) NOT NULL,
  `librarian_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`librarian_id`, `librarian_name`, `address`, `phone_number`, `username`, `password`) VALUES
('THUTHU1', 'Ngô Tiến Phong', '44 Nguyễn Huệ', '0123456789', 'phong5141', '123456'),
('THUTHU2', 'Ngô Bảo Mật', '4/34 đường Bảo Mật', '0123456789', 'baomat', '123123');

-- --------------------------------------------------------

--
-- Table structure for table `library_card`
--

CREATE TABLE `library_card` (
  `card_id` varchar(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_card`
--

INSERT INTO `library_card` (`card_id`, `full_name`, `address`, `phone_number`) VALUES
('20T1020501', 'Trần Thanh Long', 'Hà Nội', '0987654321'),
('20T1020502', 'Ngô Tiến Phong', 'Huế', '0123456789');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_borrowsstatistics`
-- (See below for the actual view)
--
CREATE TABLE `vw_borrowsstatistics` (
`borrow_id` int(11)
,`card_id` varchar(10)
,`take_date` date
,`return_date` date
,`book_name` varchar(50)
,`genre_id` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_select_bookandgenre`
-- (See below for the actual view)
--
CREATE TABLE `vw_select_bookandgenre` (
`book_id` int(11)
,`book_name` varchar(50)
,`genre_id` varchar(10)
,`genre_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_borrowsstatistics`
--
DROP TABLE IF EXISTS `vw_borrowsstatistics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_borrowsstatistics`  AS SELECT `borrows`.`borrow_id` AS `borrow_id`, `borrows`.`card_id` AS `card_id`, `borrows`.`take_date` AS `take_date`, `borrows`.`return_date` AS `return_date`, `book`.`book_name` AS `book_name`, `book`.`genre_id` AS `genre_id` FROM ((`borrows` join `borrow_book` on(`borrows`.`borrow_id` = `borrow_book`.`borrow_id`)) join `book` on(`book`.`book_id` = `borrow_book`.`book_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `vw_select_bookandgenre`
--
DROP TABLE IF EXISTS `vw_select_bookandgenre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_select_bookandgenre`  AS SELECT `book`.`book_id` AS `book_id`, `book`.`book_name` AS `book_name`, `genre`.`genre_id` AS `genre_id`, `genre`.`genre_name` AS `genre_name` FROM (`genre` join `book` on(`genre`.`genre_id` = `book`.`genre_id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_genre_book` (`genre_id`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `fk_libaryCard_borrows` (`card_id`),
  ADD KEY `fk_libarian` (`librarian_id`);

--
-- Indexes for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD KEY `fk_borrow_book` (`borrow_id`),
  ADD KEY `fk_book_borrow` (`book_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`librarian_id`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `library_card`
--
ALTER TABLE `library_card`
  ADD PRIMARY KEY (`card_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_genre_book` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `fk_libarian` FOREIGN KEY (`librarian_id`) REFERENCES `librarian` (`librarian_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_libaryCard_borrows` FOREIGN KEY (`card_id`) REFERENCES `library_card` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD CONSTRAINT `fk_book_borrow` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_borrow_book` FOREIGN KEY (`borrow_id`) REFERENCES `borrows` (`borrow_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
