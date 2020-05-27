-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2017 at 05:18 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `framework`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `pk` int(11) NOT NULL,
  `categoryfk` int(255) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `stt` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`pk`, `categoryfk`, `title`, `content`, `stt`) VALUES
(1, 1, 'The First', 'Nguyễn Công Doanh', 1),
(2, 1, 'The Second', 'Lương Hồng Hưởng', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `pk` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`pk`, `name`) VALUES
(1, 'Nguyễn Chelsea');

-- --------------------------------------------------------

--
-- Table structure for table `cores_department`
--

CREATE TABLE `cores_department` (
  `id` int(11) NOT NULL,
  `depCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depID` int(11) DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stt` tinyint(4) DEFAULT '1',
  `deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores_department`
--

INSERT INTO `cores_department` (`id`, `depCode`, `depName`, `depID`, `path`, `stt`, `deleted`) VALUES
(2, 'trien-khai|2597af3f9dae4c|2597af40685874|2597af409', 'Trien khai', 0, '/2/', 1, 1),
(3, 'kinh-doanh|3597af3d9b8b5a|3597af3e6b9da2|3597af3f2', 'Kinh Doanh', 0, '/3/', 1, 1),
(4, 'hanh-chinh|4597af3d9b907b|4597af3e6ba24c|4597af3f2', 'Hanh chinh', 0, '/4/', 1, 1),
(5, 'tes|5597af3d9b94ab|5597af3e6ba5fc|5597af3f20a24e|5', 'tes', 0, '/5/', 1, 1),
(7, 'adasdsad|7597af3d9b98d8|7597af3e6ba98e|7597af3f20a', 'sdasd abc', 0, '/7/', 1, 1),
(11, 'asdasdasdasd|11569b4a0f24585', 'asdsad', 0, '/11/', 1, 1),
(12, 'DD|12597af3bf0c190|12597af3d9b9cf6|12597af3e6bad01', 'ĐẢM BẢO CHẤT LƯỢNG', 0, '/12/', 1, 1),
(13, 'KS|13597af3f9dc8d7|13597af40687e70|13597af4099f7f7', 'KIỂM SOÁT CHẤT LƯƠNG', 0, '/13/', 1, 1),
(14, 'KT|14597af3d9ba116|14597af3e6bb064|14597af3f20ad1c', 'KIỂM THỬ PHẦN MỀM', 0, '/14/', 1, 1),
(15, 'dv1|15597af996a9852', 'Đơn Vị 1', 0, '/15/', 1, 1),
(16, 'dv2|16597af99ee059e', 'Đơn Vị 2', 0, '/16/', 1, 1),
(17, 'dv3|17597af48ab170e', 'Đơn Vị 3', 0, '/17/', 1, 1),
(18, 'dv3|18597af9936cc09', 'Đơn Vị 3', 0, '/18/', 1, 1),
(19, 'dv1', 'Đơn Vị 1', 0, '/19/', 1, 0),
(20, 'dv2', 'Đơn Vị 2', 0, '/20/', 1, 0),
(21, 'dv3', 'Đơn Vị 3', 22, '/22/21/', 1, 0),
(22, 'No', 'Đơn Vị 1a', 0, '/22/', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cores_group`
--

CREATE TABLE `cores_group` (
  `id` int(11) NOT NULL,
  `groupCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stt` tinyint(4) DEFAULT '1',
  `deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores_group`
--

INSERT INTO `cores_group` (`id`, `groupCode`, `groupName`, `stt`, `deleted`) VALUES
(1, 'g1', 'Nhom 1', 1, 0),
(2, 'g2|597af323b7cf22', 'Nhom 2', 1, 1),
(3, 'g3|56b1fc1ec50eb3', 'Nhom 3', 1, 1),
(4, 'g456b1fad5cb22a4|56b1fb10ad7ba4', 'g4', 1, 1),
(5, 'g3|597af3c3356205', 'sddasd', 1, 1),
(6, '134', 'nhóm Vân', 1, 0),
(7, '112|597b058fdcf597', 'Nhóm 5', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cores_group_permission`
--

CREATE TABLE `cores_group_permission` (
  `groupID` int(11) NOT NULL,
  `permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores_group_permission`
--

INSERT INTO `cores_group_permission` (`groupID`, `permission`) VALUES
(1, 'quyen1'),
(1, 'vietnhap'),
(2, 'bientap'),
(2, 'quyen1'),
(2, 'vietnhap');

-- --------------------------------------------------------

--
-- Table structure for table `cores_group_user`
--

CREATE TABLE `cores_group_user` (
  `userID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores_group_user`
--

INSERT INTO `cores_group_user` (`userID`, `groupID`) VALUES
(1, 1),
(5, 1),
(13, 1),
(22, 1),
(11, 2),
(13, 2),
(17, 2),
(18, 2),
(1, 4),
(17, 6),
(18, 6),
(21, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cores_preference`
--

CREATE TABLE `cores_preference` (
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `preference` text COLLATE utf8_unicode_ci,
  `userID` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cores_storage`
--

CREATE TABLE `cores_storage` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `val` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cores_user`
--

CREATE TABLE `cores_user` (
  `id` int(11) NOT NULL,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depID` int(11) DEFAULT NULL,
  `account` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stt` tinyint(4) DEFAULT '1',
  `isAdmin` tinyint(4) DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores_user`
--

INSERT INTO `cores_user` (`id`, `fullName`, `jobTitle`, `depID`, `account`, `pass`, `email`, `phone`, `stt`, `isAdmin`, `deleted`) VALUES
(1, 'Admin', 'Admin', 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 1, 0),
(4, 'test', 'test', 0, 'test|4597a9d4191cda', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 0, 0, 1),
(6, 'Dương Tuấn Anh Thich an ca kho', 'job abc', 0, 'duongtuananh|6597a9d419ce24', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 0, 0, 1),
(7, 'Nguyễn Thị Vân abcd', 'Co ban ca kho ccvv', 0, 'nguyenthivan|759771353005e0|75977136034dad', 'd452f36a2ae31f1b9517630ba8756005', NULL, NULL, 1, 0, 1),
(8, 'vân kaka', 'vankaka', 0, 'van kaka|8597713604546f', 'e5ab110581e7dd1ad02e75e64949c8fe', NULL, NULL, 1, 0, 1),
(9, 'Nguyễn Hà Tên vvv', 'bac sỹ', 0, 'khongcoten|959771337281ca|959771353102a9|959771360', 'fcea920f7412b5da7be0cf42b8c93759', NULL, NULL, 1, 0, 1),
(10, 'Si đa Doanh', 'gss', 0, 'doanhsida|10597a96f4b3a50', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 0, 1),
(11, 'Nguyên Thanh Hiền', 'GS', 0, 'nguyenthanhhien|11597af3d996985|11597af3e68f63e|11', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 0, 1),
(12, 'Nguyen Thi Van vvv', 'No', 0, 'van kaka|1259795e8339062', 'c71c71dcb1205ca1a9d8c6fe2b51cb23', NULL, NULL, 1, 0, 1),
(13, 'Nguyễn Công Doanh', 'No', 0, 'DoanhNC|13597af3f9b66a6|13597af40648815|13597af409', '899452673e98863992a8642f7a6451f0', NULL, NULL, 1, 0, 1),
(14, 'Doanh bán cá khô', 'No', 0, 'doanhkaka|14597af3f9ba590|14597af4064cab5|14597af4', '62de108c870d02aa4d6afc3afaebcbf8', NULL, NULL, 1, 0, 1),
(16, 'Doanh 2', 'No', 0, 'abc|16597af3f1d8f61|16597af3f9be878|16597af406509f', '899452673e98863992a8642f7a6451f0', NULL, NULL, 1, 0, 1),
(17, 'Nguyễn Hà Thành', 'PGS.TS', 0, 'nguyenthanh|17597af3f1e11cc|17597af3f9c27bc|17597a', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 0, 1),
(18, 'Nguyễn Dương Nam', 'GS', 0, 'nguyenduongnam|18597af3f1e93df|18597af3f9c6aa9|185', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 0, 1),
(19, 'Doanh dở', 'No', 0, 'doanh|19597af9a76028c|19597af9afa22c3', '62de108c870d02aa4d6afc3afaebcbf8', NULL, NULL, 1, 0, 1),
(20, 'Vân - Cô Bé Bán Cá Khô', 'No1', 19, 'VanNT|20597aff263c4b0', 'c71c71dcb1205ca1a9d8c6fe2b51cb23', NULL, NULL, 1, 0, 1),
(21, 'Nguyễn Công Doanh', 'No', 0, 'DoanhNC', '899452673e98863992a8642f7a6451f0', NULL, NULL, 1, 0, 0),
(22, 'Doanh dở', 'bán cói', 21, 'doanhdo', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cores_user_permission`
--

CREATE TABLE `cores_user_permission` (
  `userID` int(11) NOT NULL,
  `permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores_user_permission`
--

INSERT INTO `cores_user_permission` (`userID`, `permission`) VALUES
(1, 'bientap'),
(1, 'MANAGE_USERS'),
(1, 'quyen1'),
(1, 'quyen2'),
(1, 'vietnhap'),
(3, 'MANAGE_USERS'),
(4, 'MANAGE_USERS'),
(5, 'vietnhap'),
(6, 'bientap'),
(6, 'duyet'),
(6, 'quyen1'),
(6, 'quyen2'),
(6, 'quyen3'),
(6, 'vietnhap'),
(10, 'vietnhap'),
(11, 'bientap'),
(11, 'quyen1'),
(11, 'vietnhap'),
(13, 'bientap'),
(13, 'vietnhap'),
(14, 'bientap'),
(14, 'duyet'),
(14, 'quyen1'),
(14, 'quyen2'),
(14, 'quyen3'),
(14, 'vietnhap'),
(16, 'bientap'),
(16, 'duyet'),
(16, 'quyen1'),
(16, 'quyen2'),
(16, 'quyen3'),
(16, 'vietnhap'),
(17, 'quyen1'),
(17, 'quyen2'),
(17, 'vietnhap'),
(18, 'bientap'),
(18, 'quyen1'),
(18, 'vietnhap'),
(21, 'quyen3'),
(21, 'vietnhap'),
(22, 'bientap'),
(22, 'quyen1'),
(22, 'vietnhap');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `cores_department`
--
ALTER TABLE `cores_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cores_group`
--
ALTER TABLE `cores_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cores_group_permission`
--
ALTER TABLE `cores_group_permission`
  ADD PRIMARY KEY (`groupID`,`permission`);

--
-- Indexes for table `cores_group_user`
--
ALTER TABLE `cores_group_user`
  ADD PRIMARY KEY (`groupID`,`userID`);

--
-- Indexes for table `cores_preference`
--
ALTER TABLE `cores_preference`
  ADD PRIMARY KEY (`uri`,`id`);

--
-- Indexes for table `cores_storage`
--
ALTER TABLE `cores_storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cores_user`
--
ALTER TABLE `cores_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unqAccount` (`account`);

--
-- Indexes for table `cores_user_permission`
--
ALTER TABLE `cores_user_permission`
  ADD PRIMARY KEY (`userID`,`permission`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cores_department`
--
ALTER TABLE `cores_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `cores_group`
--
ALTER TABLE `cores_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cores_user`
--
ALTER TABLE `cores_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
