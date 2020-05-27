/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - frame-work
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`frame-work` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `frame-work`;

/*Table structure for table `category_news` */

DROP TABLE IF EXISTS `category_news`;

CREATE TABLE `category_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category_news` */

insert  into `category_news`(`id`,`name`,`deleted`) values 
(2,'Du lịch',0),
(3,'Kinh tế',0),
(4,'K-pop',0),
(6,'Văn hóa',0),
(7,'Kinh dị|5ec77ad496c757',1),
(8,'Kinh khủng|5ec64dd6380588',1),
(12,'Thể thao',0),
(15,'Xã hội',0),
(16,'zc|5eccd0bab140516',1),
(17,'Thời trang',0);

/*Table structure for table `cores_department` */

DROP TABLE IF EXISTS `cores_department`;

CREATE TABLE `cores_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depID` int(11) DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stt` tinyint(4) DEFAULT '1',
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_department` */

insert  into `cores_department`(`id`,`depCode`,`depName`,`depID`,`path`,`stt`,`deleted`) values 
(2,'trien-khai','Trien khai',3,'/3/2/',1,0),
(3,'kinh-doanh','Kinh Doanh',0,'/3/',1,0),
(4,'hanh-chinh','Hanh chinh',2,'/3/2/4/',1,0),
(5,'tes','tes',0,'/5/',1,0),
(7,'adasdsad','sdasd',0,'/7/',1,0),
(11,'asdasdasdasd|11569b4a0f24585','asdsad',3,'/3/11/',1,1),
(12,'tatata|125ebb782d7adcc','tets',3,'/3/12/',0,1),
(13,'adad|135eba67ebd69a4|135eba67f1e9aa8|135eba67f63e8','abcd',0,'/13/',1,1);

/*Table structure for table `cores_group` */

DROP TABLE IF EXISTS `cores_group`;

CREATE TABLE `cores_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stt` tinyint(4) DEFAULT '1',
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_group` */

insert  into `cores_group`(`id`,`groupCode`,`groupName`,`stt`,`deleted`) values 
(1,'g1','Nhom 3',1,0),
(2,'g2','Nhom 2',1,0),
(3,'g3|56b1fc1ec50eb3','Nhom 3',1,1),
(4,'g456b1fad5cb22a4|56b1fb10ad7ba4','g4',1,1),
(5,'g3|5ec62cf779c5a5','Nhom 2',1,1),
(6,'g4|5ec398bebb4186','Nhom 1',1,1),
(7,'g6|5ec3555a4066d7','nhóm 3',0,1),
(8,'g5|5ec35594a2d188','333',1,1),
(9,'g5|5ec355ce3ebc49','222',1,1),
(10,'g5|5ec35edbd8a7610','6',1,1),
(11,'g4|5ec62ac939bf011','Nhom 4',1,1);

/*Table structure for table `cores_group_permission` */

DROP TABLE IF EXISTS `cores_group_permission`;

CREATE TABLE `cores_group_permission` (
  `groupID` int(11) NOT NULL,
  `permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`groupID`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_group_permission` */

insert  into `cores_group_permission`(`groupID`,`permission`) values 
(1,'quyen1'),
(1,'vietnhap');

/*Table structure for table `cores_group_user` */

DROP TABLE IF EXISTS `cores_group_user`;

CREATE TABLE `cores_group_user` (
  `userID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  PRIMARY KEY (`groupID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_group_user` */

insert  into `cores_group_user`(`userID`,`groupID`) values 
(1,1),
(6,1),
(1,4),
(1,5);

/*Table structure for table `cores_preference` */

DROP TABLE IF EXISTS `cores_preference`;

CREATE TABLE `cores_preference` (
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `preference` text COLLATE utf8_unicode_ci,
  `userID` int(11) DEFAULT '0',
  PRIMARY KEY (`uri`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_preference` */

/*Table structure for table `cores_storage` */

DROP TABLE IF EXISTS `cores_storage`;

CREATE TABLE `cores_storage` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `val` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_storage` */

/*Table structure for table `cores_user` */

DROP TABLE IF EXISTS `cores_user`;

CREATE TABLE `cores_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jobTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depID` int(11) DEFAULT NULL,
  `account` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stt` tinyint(4) DEFAULT '1',
  `isAdmin` tinyint(4) DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqAccount` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_user` */

insert  into `cores_user`(`id`,`fullName`,`jobTitle`,`depID`,`account`,`pass`,`email`,`phone`,`stt`,`isAdmin`,`deleted`) values 
(1,'Admin','Admin',0,'admin','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,1,1,0),
(4,'test','test',3,'test','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,1,0,0),
(6,'Dương Tuấn Anh','job',3,'duongtuananh','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,0,0,0),
(7,'tets','test',3,'tets|75eba5d9d883f5','202cb962ac59075b964b07152d234b70',NULL,NULL,0,0,1);

/*Table structure for table `cores_user_permission` */

DROP TABLE IF EXISTS `cores_user_permission`;

CREATE TABLE `cores_user_permission` (
  `userID` int(11) NOT NULL,
  `permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`userID`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cores_user_permission` */

insert  into `cores_user_permission`(`userID`,`permission`) values 
(1,'bientap'),
(1,'MANAGE_USERS'),
(1,'quyen1'),
(1,'quyen2'),
(1,'vietnhap'),
(3,'MANAGE_USERS'),
(4,'MANAGE_USERS'),
(4,'quyen1'),
(5,'vietnhap'),
(6,'bientap'),
(6,'quyen3'),
(6,'vietnhap');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cateID` int(10) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `cretedDate` date DEFAULT NULL,
  `iname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `news` */

insert  into `news`(`id`,`iurl`,`cateID`,`title`,`content`,`cretedDate`,`iname`) values 
(27,'upload/news/2020/05/27/5ecde01276aec.jpg',12,'\"Bom tấn\" thế kỷ suýt xảy ra: Messi rời Barca, tới Inter làm học trò Mourinho','<p><strong>Inter Milan nhắm Messi</strong></p>\n\n<p>&quot;Chỉ với một chữ nếu, người ta c&oacute; thể bỏ cả Paris v&agrave;o c&aacute;i chai&quot; - c&acirc;u ngạn ngữ kinh điển của người phương T&acirc;y. Nhưng quả thực, c&oacute; những chữ nếu sẽ l&agrave;m thay đổi cả thế giới. Với b&oacute;ng đ&aacute; cũng vậy. Nếu Lionel Messi rời&nbsp;<a href=\"https://www.24h.com.vn/barcelona-c48e1507.html\">Barcelona</a>...</p>\n\n<p><img alt=\"&amp;#34;Bom tấn&amp;#34; thế kỷ suýt xảy ra: Messi rời Barca, tới Inter làm học trò Mourinho - 1\" src=\"https://cdn.24h.com.vn/upload/2-2020/images/2020-05-26/maxresdefault-1590431115-560-width660height371.jpg\" /></p>\n\n<p>HLV Mourinho muốn đưa Messi đến Inter năm 2008</p>\n\n<p>&quot;Ch&uacute;ng t&ocirc;i đ&atilde; tiếp cận Messi nhưng cậu ấy kh&ocirc;ng muốn rời&nbsp;<a href=\"https://www.24h.com.vn/barcelona-c48e1507.html\">Barca</a>. Messi rất biết ơn Barca. Trong một số thương vụ, tiền kh&ocirc;ng phải yếu tố quyết định&quot;, cựu Gi&aacute;m đốc của CLB Inter Milan - &ocirc;ng Marco Branca tiết lộ với Libero về thương vụ &quot;bom tấn&quot; bất th&agrave;nh năm 2008.</p>\n\n<p>Ở thời điểm đ&oacute;, Inter Milan ho&agrave;n to&agrave;n nghi&ecirc;m t&uacute;c với thương vụ n&agrave;y. Đầu năm 2008, Chủ tịch Massimo Moratti c&ocirc;ng khai b&agrave;y tỏ sự ngưỡng mộ với Lionel Messi. &quot;Messi l&agrave; mơ ước của mọi đội b&oacute;ng. Cậu ấy l&agrave; người xuất sắc nhất. Nhưng thật tiếc Messi kh&ocirc;ng chịu rời Barca&quot;, Goal dẫn lời cựu Chủ tịch Inter mới đ&acirc;y.</p>\n\n<p>N&ecirc;n biết, Inter Milan c&oacute; những cơ sở nhất định để tự tin trong thương vụ n&agrave;y. Đầu năm 2008 khi Inter bắt đầu tiếp cận đến Messi, Barca đang ở giai đoạn tho&aacute;i tr&agrave;o thời Frank Rijkaard. Trong khi đ&oacute;, Messi tiến bộ kh&ocirc;ng ngừng v&agrave; đang tr&ecirc;n đ&agrave; trở th&agrave;nh si&ecirc;u sao mới của đội chủ s&acirc;n Nou Camp.</p>\n\n<p>Cũng bởi phong độ ch&oacute;i s&aacute;ng trong giai đoạn Barca sa s&uacute;t, Messi được ban l&atilde;nh đạo Inter nhắm đến để thay cho &quot;Ho&agrave;ng đế&quot; Adriano, người đang dần đ&aacute;nh mất m&igrave;nh&nbsp;sau nỗi đau mất cha, để kết hợp c&ugrave;ng Zlatan Ibrahimovic tr&ecirc;n h&agrave;ng c&ocirc;ng. Ph&iacute; ph&aacute; vỡ hợp đồng của ch&acirc;n s&uacute;t người Argentina với Barca khi đ&oacute; khoảng 200 triệu euro.</p>\n\n<p><strong>Lịch sử b&oacute;ng đ&aacute; su&yacute;t sang trang</strong></p>\n\n<p>Inter l&uacute;c n&agrave;y đ&atilde; bổ nhiệm Jose Mourinho v&agrave; đang đặt ra mục ti&ecirc;u chinh phục Champions League sau nhiều năm thống trị ở Serie A. Đội b&oacute;ng th&agrave;nh Milano khi đ&oacute; tr&agrave;n trề tham vọng, v&agrave; lại rất gi&agrave;u khi được Chủ tịch Moratti hậu thuẫn.&nbsp;</p>\n\n<p><img alt=\"&amp;#34;Bom tấn&amp;#34; thế kỷ suýt xảy ra: Messi rời Barca, tới Inter làm học trò Mourinho - 2\" src=\"https://cdn.24h.com.vn/upload/2-2020/images/2020-05-26/mini_messi-e-iniesta-copa-01-1590431115-281-width660height413.jpg\" /></p>\n\n<p>Messi ở lại v&agrave; gi&agrave;nh c&uacute; ăn 6 m&ugrave;a 2008/09 c&ugrave;ng Barcelona</p>\n\n<p>Ph&iacute;a Inter Milan hy vọng rằng họ c&oacute; thể thuyết phục Barcelona b&aacute;n Messi với gi&aacute; 100 triệu euro ở thời điểm đ&oacute;. Nếu thương vụ n&agrave;y xảy ra, Messi chứ kh&ocirc;ng phải Ronaldo, mới l&agrave; người giữ kỷ lục chuyển nhượng của b&oacute;ng đ&aacute; thế giới - đến khi MU chi&ecirc;u mộ Paul Pogba 105 triệu euro m&ugrave;a h&egrave; 2016.</p>\n\n<p>Đ&oacute; l&agrave; một khoản tiền khổng lồ tại thời điểm m&ugrave;a h&egrave; 2008. N&ecirc;n nhớ, Ronaldo d&ugrave; khi đ&oacute; nổi đ&igrave;nh nổi đ&aacute;m, cũng &quot;chỉ&quot; gia nhập Real Madrid với mức ph&iacute; 94 triệu euro&nbsp;v&agrave; giữ kỷ lục chuyển nhượng. Bởi vậy, đề nghị kể tr&ecirc;n đủ sức nặng để đưa Barcelona v&agrave;o b&agrave;n đ&agrave;m ph&aacute;n. D&ugrave; vậy, Messi lại kh&ocirc;ng hứng th&uacute; với viễn cảnh đến Italia chơi b&oacute;ng.</p>\n\n<p>Lionel Messi ở lại v&agrave; ngay sau phi&ecirc;n chợ h&egrave; 2008 ấy,&nbsp;<a href=\"https://www.24h.com.vn/pep-guardiola-den-man-city-c48e3792.html\">HLV Pep Guardiola</a>&nbsp;đ&atilde; mang đến những th&agrave;nh c&ocirc;ng vượt bậc cho Barcelona với c&uacute; ăn 6 v&ocirc; tiền kho&aacute;ng hậu m&ugrave;a 2008/09. Bản th&acirc;n Messi cũng chẳng phải mảy may hối hận, khi m&agrave; anh c&oacute; giai đoạn ẵm 4 danh hiệu Quả b&oacute;ng v&agrave;ng li&ecirc;n tiếp c&ugrave;ng với &ocirc;ng thầy Guardiola.</p>\n\n<p>Mua hụt Messi, đội b&oacute;ng của HLV Mourinho chi&ecirc;u mộ những cầu thủ ph&ugrave; hợp với triết l&yacute; chơi b&oacute;ng sức mạnh của &ocirc;ng thầy người Bồ Đ&agrave;o Nha. Sulley Muntari, Thiago Motta, Lucio lần lượt cập bến Giuseppe Meazza rồi tiếp theo l&agrave; Wesley Sneijder, Diego Milito, Samuel Eto&#39;o...</p>\n\n<p>Nếu đến Inter, Messi sẽ lỡ c&uacute; ăn 6 c&ugrave;ng Barcelona, hoặc đội b&oacute;ng n&agrave;y khi kh&ocirc;ng Messi cũng chẳng thể ăn 6. Trong khi đ&oacute;, d&ugrave; Inter kh&ocirc;ng mua được Messi nhưng đến năm 2010 cũng gi&agrave;nh c&uacute; ăn 3 c&ugrave;ng HLV Mourinho. Đ&aacute;ng ch&uacute; &yacute;, Inter của Mourinho đ&aacute;nh bại ch&iacute;nh Barca tr&ecirc;n h&agrave;nh tr&igrave;nh ăn 3 m&ugrave;a 2009/10.</p>\n','2020-05-27','5ecde01276aec.jpg'),
(29,'upload/news/2020/05/26/5eccde1758fa0.jpg',12,'Ronaldo ra chân cực đỉnh đưa bóng vào rổ, thu hút triệu view','<p>Mới đ&acirc;y tr&ecirc;n twitter của&nbsp;<a href=\"https://www.24h.com.vn/juventus-fc-c48e4450.html\">Juventus</a>&nbsp;đăng tải video Cristiano Ronaldo ph&ocirc; diễn kĩ thuật của m&igrave;nh tr&ecirc;n s&acirc;n tập. Trong đoạn video Ronaldo đ&atilde; d&ugrave;ng ch&acirc;n đưa b&oacute;ng kh&eacute;o l&eacute;o v&agrave;o rổ tr&ecirc;n cao, trước sự ngỡ ng&agrave;ng của c&aacute;c ph&oacute;ng vi&ecirc;n. Đoạn clip sau khi đăng tải đ&atilde; thu h&uacute;t hơn triệu lượt xem, tất cả đều b&agrave;y tỏ sự ngưỡng mộ trước kỹ năng đỉnh cao của si&ecirc;u sao người Bồ Đ&agrave;o Nha.</p>\n\n<p>Thậm ch&iacute; nhiều người c&ograve;n v&iacute; von Ronaldo d&ugrave;ng ch&acirc;n đưa b&oacute;ng v&agrave;o rổ xuất sắc chẳng k&eacute;m huyền thoại NBA Michael Jordan l&agrave; bao.</p>\n\n<p>Kỹ năng thuần thục của Ronaldo chứng tỏ trong khi c&aacute;ch ly do đại dịch COVID-19, khiến&nbsp;<a href=\"https://www.24h.com.vn/bong-da-c48.html\">b&oacute;ng đ&aacute;</a>&nbsp;phải dừng lại nhiều th&aacute;ng Ronaldo vẫn rất chăm chỉ luyện tập.</p>\n\n<p><img alt=\"Ronaldo ra chân cực đỉnh đưa bóng vào rổ, thu hút triệu view - 1\" src=\"https://cdn.24h.com.vn/upload/2-2020/images/2020-05-26/Ngau-hung-Ronaldo-Ra-chan-cuc-dinh-hao-huc-cho-tai-xuat-tai-Serie-A-ro-1590458808-749-width660height370.jpg\" /></p>\n\n<p>Ronaldo ph&ocirc; diễn kĩ thuật tr&ecirc;n s&acirc;n tập</p>\n\n<p>Hiện tại, Serie A vẫn sẽ tạm ho&atilde;n đến ng&agrave;y 14/6. Tuy nhi&ecirc;n, ng&agrave;y giải đấu n&agrave;y trở lại kh&ocirc;ng c&ograve;n xa, sau khi c&aacute;c CLB đ&atilde; được ph&eacute;p cho tập luyện trở lại.</p>\n\n<p>Tr&ecirc;n bảng xếp hạng Serie A t&iacute;nh đến v&ograve;ng 26 - trước khi tạm ho&atilde;n v&igrave; đại dịch, Juventus đang c&oacute; 63 điểm, hơn đội xếp thứ hai l&agrave; Lazio đ&uacute;ng 1 điểm. Bản th&acirc;n Ronaldo cũng đang ở trong cuộc đua với tiền đạo Ciro Immobile của Lazio cho danh hiệu Vua ph&aacute; lưới Serie A v&agrave; Chiếc gi&agrave;y v&agrave;ng ch&acirc;u &Acirc;u.</p>\n','2020-05-26','5eccde1758fa0.jpg'),
(31,'upload/news/2020/05/26/5ecce10fc0314.jpg',17,'Hoàng Thùy Linh diện đồ đi biển của Balmain 25 triệu đồng','<p><img alt=\"Hoàng Thùy Linh diện đồ đi biển của Balmain 25 triệu đồng - 6\" src=\"https://cdn.24h.com.vn/upload/2-2020/images/2020-05-25/do-boi-25-trieu-dong-ton-dang-nong-bong-cho-Hoang-Thuy-Linh-100761932_263149081402733_1211445884328345600_n-1590391361-654-width771height960.jpg\" /></p>\n\n<p>Để tăng th&ecirc;m sức h&uacute;t, những m&oacute;n phụ kiện trang sức nhỏ xinh từ mắt k&iacute;nh, v&ograve;ng tay, khuy&ecirc;n tai hay nhẫn... đều được c&ocirc; kết hợp t&agrave;i t&igrave;nh, vừa đủ.</p>\n\n<p><img alt=\"Hoàng Thùy Linh diện đồ đi biển của Balmain 25 triệu đồng - 7\" src=\"https://cdn.24h.com.vn/upload/2-2020/images/2020-05-25/do-boi-25-trieu-dong-ton-dang-nong-bong-cho-Hoang-Thuy-Linh-100610491_172164047558941_1859800287473041408_n-1590391361-887-width773height960.jpg\" /></p>\n\n<p>Chỉ cần xem qua những bức h&igrave;nh đi biển của Ho&agrave;ng Th&ugrave;y Linh, c&aacute;c n&agrave;ng nhanh tay bỏ t&uacute;i những kiểu l&ecirc;n đồ đi biển cực dễ lại đẹp kh&ocirc;ng điểm ch&ecirc;. Với những n&agrave;ng&nbsp;c&oacute; phần th&acirc;n tr&ecirc;n kh&ocirc;ng thon gọn, c&oacute; thể học c&ocirc; c&aacute;ch mix &aacute;o croptop ngắn tay với quần bơi cạp cao</p>\n','2020-05-26',NULL),
(32,'upload/news/2020/05/27/5ecdc8a81dabb.jpg',2,'mai châu','<p>đẹp</p>\n','2020-05-27',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
