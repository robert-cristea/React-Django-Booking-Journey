/*
SQLyog Community v13.1.5  (32 bit)
MySQL - 10.4.13-MariaDB : Database - natoosa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `account_emailaddress` */

DROP TABLE IF EXISTS `account_emailaddress`;

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_emailaddress` */

/*Table structure for table `account_emailconfirmation` */

DROP TABLE IF EXISTS `account_emailconfirmation`;

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_emailconfirmation` */

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add site',7,'add_site'),
(26,'Can change site',7,'change_site'),
(27,'Can delete site',7,'delete_site'),
(28,'Can view site',7,'view_site'),
(29,'Can add email address',8,'add_emailaddress'),
(30,'Can change email address',8,'change_emailaddress'),
(31,'Can delete email address',8,'delete_emailaddress'),
(32,'Can view email address',8,'view_emailaddress'),
(33,'Can add email confirmation',9,'add_emailconfirmation'),
(34,'Can change email confirmation',9,'change_emailconfirmation'),
(35,'Can delete email confirmation',9,'delete_emailconfirmation'),
(36,'Can view email confirmation',9,'view_emailconfirmation'),
(37,'Can add social account',10,'add_socialaccount'),
(38,'Can change social account',10,'change_socialaccount'),
(39,'Can delete social account',10,'delete_socialaccount'),
(40,'Can view social account',10,'view_socialaccount'),
(41,'Can add social application',11,'add_socialapp'),
(42,'Can change social application',11,'change_socialapp'),
(43,'Can delete social application',11,'delete_socialapp'),
(44,'Can view social application',11,'view_socialapp'),
(45,'Can add social application token',12,'add_socialtoken'),
(46,'Can change social application token',12,'change_socialtoken'),
(47,'Can delete social application token',12,'delete_socialtoken'),
(48,'Can view social application token',12,'view_socialtoken'),
(49,'Can add Token',13,'add_token'),
(50,'Can change Token',13,'change_token'),
(51,'Can delete Token',13,'delete_token'),
(52,'Can view Token',13,'view_token'),
(53,'Can add city feature',14,'add_cityfeature'),
(54,'Can change city feature',14,'change_cityfeature'),
(55,'Can delete city feature',14,'delete_cityfeature'),
(56,'Can view city feature',14,'view_cityfeature'),
(57,'Can add user city',15,'add_usercity'),
(58,'Can change user city',15,'change_usercity'),
(59,'Can delete user city',15,'delete_usercity'),
(60,'Can view user city',15,'view_usercity'),
(61,'Can add user feature',16,'add_userfeature'),
(62,'Can change user feature',16,'change_userfeature'),
(63,'Can delete user feature',16,'delete_userfeature'),
(64,'Can view user feature',16,'view_userfeature');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$150000$eamqBPXF8J9f$Ow9H/TSLD20/gJJBlHiWgEWkutctRvmaHC+2XdR02cs=',NULL,1,'admin','','','admin@email.com',1,1,'2021-05-27 16:15:18.020739');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `authtoken_token` */

DROP TABLE IF EXISTS `authtoken_token`;

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authtoken_token` */

/*Table structure for table `cities_features` */

DROP TABLE IF EXISTS `cities_features`;

CREATE TABLE `cities_features` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(40) NOT NULL,
  `country` varchar(40) NOT NULL,
  `short_description` varchar(400) NOT NULL,
  `sites` varchar(400) NOT NULL,
  `picture` varchar(400) NOT NULL,
  `solo` smallint(5) unsigned NOT NULL,
  `couple` smallint(5) unsigned NOT NULL,
  `family` smallint(5) unsigned NOT NULL,
  `friends` smallint(5) unsigned NOT NULL,
  `mid_week` smallint(5) unsigned NOT NULL,
  `weekend` smallint(5) unsigned NOT NULL,
  `long_weekend` smallint(5) unsigned NOT NULL,
  `weekish` smallint(5) unsigned NOT NULL,
  `2_weeks` smallint(5) unsigned NOT NULL,
  `3_weeks` smallint(5) unsigned NOT NULL,
  `4_weeks` smallint(5) unsigned NOT NULL,
  `beach` smallint(5) unsigned NOT NULL,
  `city_life` smallint(5) unsigned NOT NULL,
  `nature` smallint(5) unsigned NOT NULL,
  `countryside` smallint(5) unsigned NOT NULL,
  `surprise` smallint(5) unsigned NOT NULL,
  `other` smallint(5) unsigned NOT NULL,
  `adventures` smallint(5) unsigned NOT NULL,
  `shopping` smallint(5) unsigned NOT NULL,
  `romantic` smallint(5) unsigned NOT NULL,
  `ski` smallint(5) unsigned NOT NULL,
  `remote` smallint(5) unsigned NOT NULL,
  `wildlife` smallint(5) unsigned NOT NULL,
  `hiking` smallint(5) unsigned NOT NULL,
  `road_trip` smallint(5) unsigned NOT NULL,
  `festivals` smallint(5) unsigned NOT NULL,
  `nightlife` smallint(5) unsigned NOT NULL,
  `holidays` smallint(5) unsigned NOT NULL,
  `vivid` smallint(5) unsigned NOT NULL,
  `cultural_experience` smallint(5) unsigned NOT NULL,
  `camping` smallint(5) unsigned NOT NULL,
  `surfing` smallint(5) unsigned NOT NULL,
  `honeymoon` smallint(5) unsigned NOT NULL,
  `scuba_diving` smallint(5) unsigned NOT NULL,
  `budget_low` smallint(5) unsigned NOT NULL,
  `budget_normal` smallint(5) unsigned NOT NULL,
  `budget_high` smallint(5) unsigned NOT NULL,
  `1_passengers` smallint(5) unsigned NOT NULL,
  `2_passengers` smallint(5) unsigned NOT NULL,
  `3_passengers` smallint(5) unsigned NOT NULL,
  `4_passengers` smallint(5) unsigned NOT NULL,
  `5_passengers` smallint(5) unsigned NOT NULL,
  `6_passengers` smallint(5) unsigned NOT NULL,
  `january` smallint(5) unsigned NOT NULL,
  `february` smallint(5) unsigned NOT NULL,
  `march` smallint(5) unsigned NOT NULL,
  `april` smallint(5) unsigned NOT NULL,
  `may` smallint(5) unsigned NOT NULL,
  `june` smallint(5) unsigned NOT NULL,
  `july` smallint(5) unsigned NOT NULL,
  `august` smallint(5) unsigned NOT NULL,
  `september` smallint(5) unsigned NOT NULL,
  `october` smallint(5) unsigned NOT NULL,
  `november` smallint(5) unsigned NOT NULL,
  `december` smallint(5) unsigned NOT NULL,
  `comp_allgirls` smallint(5) unsigned NOT NULL,
  `comp_allboys` smallint(5) unsigned NOT NULL,
  `comp_elderly` smallint(5) unsigned NOT NULL,
  `comp_kids_babies` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `cities_features` */

insert  into `cities_features`(`city_id`,`city_name`,`country`,`short_description`,`sites`,`picture`,`solo`,`couple`,`family`,`friends`,`mid_week`,`weekend`,`long_weekend`,`weekish`,`2_weeks`,`3_weeks`,`4_weeks`,`beach`,`city_life`,`nature`,`countryside`,`surprise`,`other`,`adventures`,`shopping`,`romantic`,`ski`,`remote`,`wildlife`,`hiking`,`road_trip`,`festivals`,`nightlife`,`holidays`,`vivid`,`cultural_experience`,`camping`,`surfing`,`honeymoon`,`scuba_diving`,`budget_low`,`budget_normal`,`budget_high`,`1_passengers`,`2_passengers`,`3_passengers`,`4_passengers`,`5_passengers`,`6_passengers`,`january`,`february`,`march`,`april`,`may`,`june`,`july`,`august`,`september`,`october`,`november`,`december`,`comp_allgirls`,`comp_allboys`,`comp_elderly`,`comp_kids_babies`) values 
(1,'New Orleans,  Louisiana','USA','From its world-class gastronomy and eclectic art scene to its distinctive architecture and neighborhoods, New Orleans is like no other city.  Add in its jazzy soundtrack and tropical climate, this is a destination everyone can enjoy. ','Mardi Gras festival, French quarter, St. Louis Cathedral, Jackson Square, New Orleans Museum of Art','https://media.timeout.com/images/105486247/1372/772/image.jpg',0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0),
(2,'Kerry','Ireland','Kerry renowned the world over for its beautiful scenery, mountains, lakes, beautiful sandy beaches, cliffs and rocky headlands.','Blasket Islands, Lakes of Killarney, Skellig Michael, Carrauntoohil','https://www.irishtimes.com/polopoly_fs/1.4202470.1584124322!/image/image.jpg_gen/derivatives/box_620_330/image.jpg',0,1,1,0,1,1,1,1,0,0,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,1,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1),
(3,'Marrakesh','Morocco','Prepare for your senses to be slapped. Marrakesh\'\'s heady sights and sounds will dazzle, frazzle and enchant.','Djemaa El Fna, Jardin Majorelle, Bahia Palace','https://www.tripsavvy.com/thmb/6kYA8HfhOT78C-Dg9kSX1KCeGcY=/950x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1147478209-893cd8912819414ba115c0003d5c857b.jpg',0,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,0),
(4,'Sydney','Australia','Seek out some sunshine and good times in Australia\'\'s Harbour City.','Beach, Opera house, Manly ferry','https://www.roadaffair.com/wp-content/uploads/2017/12/sydney-opera-house-australia-shutterstock_557938795-1024x683.jpg',1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,1,1,0,1,0,0,0,0,0,0,0,1,1,1,0,0,1,0,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(5,'The Maldives','The Maldives','Unrivalled luxury, stunning white-sand beaches and an amazing underwater world make Maldives an obvious choice for a true holiday of a lifetime.','Maafushi, Meeru Island, Hulhumale','https://media.nomadicmatt.com/maldivestopkristin.jpg',0,1,1,0,1,1,1,1,0,0,0,1,0,1,0,1,1,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,0,1,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1),
(6,'Paris','France','Paris is unarguably one of the most beautiful cities in the world, the capital of France, of art and of fashion.','Eiffel tower, Lourve museum, Norte-Dame cathedral','https://www.cia-france.com/media/1558/parcarou1_720x500.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,1,0,0,1,0,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,1,1,1,1),
(7,'Cape Town','South Africa','Known as the Mother City, Cape Town is the oldest city in South Africa. Perched between the ocean and the mountain, with a national park as its heart, there is nowhere like Cape Town.','Table mountain, Beaches, Pinguin-watching','https://www.andbeyond.com/wp-content/uploads/sites/5/cape-town-aerial-view-greenpoint-stadium.jpg',0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,1,0,1,0,1,0,1,0,1,0,0,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(8,'Dubai','U.A.E','This city of high-rises and shopping malls has transformed itself from a desert outpost to a destination du-jour, where tourists flock for sales bargains, sunshine, and family fun. ','Burj Khalifa, Dubai Mall,  Dubai Museum','https://www.breakingtravelnews.com/images/sized/images/uploads/tourism/Downtown_Dubai_by_Emaar_-_NS-700x536.jpg',0,1,1,1,1,1,1,1,0,0,0,1,1,0,0,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,0,1,0,1,0,0,1,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,1,1,1),
(9,'Bora Bora','French Polynesia','Bora Bora is one of the few places on earth that everyone hopes to witness in their lifetime - and once you see it, you are forever enamored.','Matira beach, Mount Otemanu, Turtle centre','https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/16/38/163813_v3.jpeg',0,1,1,0,1,1,1,1,0,0,0,1,0,1,0,1,1,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,0,1,0,1,1,0,1,0,0,0,0,1,1,1,1,1,1,1,1,0,1,1,1,1),
(10,'New York City, New York','USA','In addition to being called the Big Apple, New York City is known as being The City That Never Sleeps. The city is full of action-packed entertainment attractions.','Central park, Empire state Building, Statue of Liberty, Times square','https://www.letsgo2.com/blog/wp-content/uploads/2015/04/new_york_1-1068x710.jpg',1,1,1,1,1,1,1,1,1,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,1,0,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,1,1,1,1,1,1),
(11,'Dubrovnik','Croatia','Often called the Pearl of the Adriatic, this small city on the Dalmatian coast has it all.','Walls of Dubrovnik, Lokrum, Stradum','https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/Croatia/Dubrovnik/dubrovnik-city-walls-lead-guide.jpg',1,1,1,1,1,1,1,1,1,0,0,1,1,0,1,1,1,1,1,1,0,0,0,0,1,0,0,1,0,1,0,1,0,0,0,1,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1),
(12,'Edinburgh','Scotland','Edinburgh is Scotland\'\'s compact, hilly capital. It has a medieval Old Town and elegant Georgian New Town with gardens and neoclassical buildings. ','Edinburgh Castle, Royal Mile ','https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/United%20Kingdom/Scotland/Edinburgh/edinburgh-lead-image-guide.jpg',1,1,1,1,1,1,1,1,0,0,0,1,1,0,1,1,1,0,1,0,0,0,0,0,1,0,1,1,1,1,0,1,0,0,1,0,0,1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1),
(13,'Rome','Italy','Rome is famous for having amazing foods such as spaghetti, lasagna, pizza and gelato. This Capital of Italy is well known for historic sites such as the Colosseum, Trevi Fountain and Vatican City.','Colosseum, St. peter\'\'s Basilica, Vatican','https://static.dw.com/image/46300373_303.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,1,0,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
(14,'Hawaii','USA','Whether you like hiking, biking, kayaking, sailing, swimming, or just sitting on the beach, Hawaii is the state for you. Near the water, you can relax as palm trees blow in the island breeze. ','Volcanoes national park, Diamond head, Hanauma bay ','https://www.flightcentre.ca/blog/wp-content/uploads/2018/09/fc-blog-header-620x350.jpg',1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,0,0,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,1),
(15,'Leh','india','Few places in India are at once so traveler friendly and enchanting as mountain-framed, Leh.','Pangong Tso, Thiksey Monastery, Shanti Stupa,  Stakna Monastery','https://moxtain.s3.ap-south-1.amazonaws.com/blogs/PlacesToVisitInLeh-Ladakh/pangong-lake-ladakh.jpg',1,1,0,1,0,0,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,0,0,0,1,1,0,1,1,0,1,0,1,0,0,1,1,1,1,0,1,0,0,0,0,0,1,1,0),
(16,'Wanaka','New Zealand','The town of Wanka has variety of activities and entertainment options. Surrounded by spectacular scenery, you can go on a variety of treks and day trips.','Roys Peak, Puzzling World, Treble Cone Ski Area, Cardrona Alpine Resort','https://www.earthsattractions.com/wp-content/uploads/2019/11/lake_wanaka_tree.jpg',1,1,1,0,0,0,0,1,1,0,0,1,0,1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,0,1,1,0,1,0,0,0,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0),
(17,'Aucklands','New Zealand','Auckland is the city of many lovers, according to its Māori name, Tāmaki Makaurau. Those lovers so desired this place that they fought over it for centuries','Auckland Zoo, Queen Street, SkyCity Auckland, Cornwall Park','https://wallpapers.lunean.com/images/wallpaperCollection/auckland_new_zealand_city_skyline_at_sunset.jpg',0,1,1,1,0,0,0,1,1,1,0,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,1,0,1,0,0,1,0,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,0),
(18,'Tokyo','Japan','Yoking past and future, Tokyo dazzles with its traditional culture and passion for everything new.','Sky tree, Kinryu-zan Senso-ji, Tokyo Disneyland, The Imperial Palace','https://pbs.twimg.com/media/EKFpiuQXkAEbSGT.jpg',1,1,1,1,0,0,0,1,1,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,0,1,0,0,1,0,0,0,1,1,1,1,1,1,1,0,0,1,1,0,0,0,0,1,1,1,0,1,1,1,1),
(19,'Antarctica','Antarctica','No place on Earth compares to this vast white wilderness of elemental forces: snow, ice, water, rock. Antarctica is simply stunning.',' Antarctic Peninsula, the Falkland Islands, South Georgia','https://lovelytab.com/wp-content/uploads/2019/01/aurora-1190254.jpg',0,1,0,0,0,0,0,1,1,0,0,0,0,1,0,1,1,1,0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,1,0),
(20,'Vancouver','Canada','Explorable neighborhoods, drink-and-dine delights and memorable cultural and outdoor activities framed by striking natural vistas – there\'\'s a superfluity of reasons to fall for this ocean-fringed metropolis.','Vancouver Aquarium, Grouse Mountain, Granville Island','https://yescycle.com/wp-content/uploads/2020/01/vancouver-canada.jpg',1,1,1,0,0,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,1,1,1,1,0,1,0,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,0),
(21,'Los Angeles,  California','USA','Ruggedly good looking, deeply creative, with a sunny disposition to boot. If LA were on Tinder, the app would crash.','Disneyland, Griffith Park, Holywood, Universal Studio Tour','https://i.pinimg.com/originals/92/7e/f4/927ef46b67cf3663d5256a17a31f4ecd.jpg',1,1,1,1,0,0,0,1,1,1,0,1,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(22,'Kruger National Park','South Africa','Kruger is one of the world\'\'s greatest wildlife watching destinations. All of Africa\'\'s iconic safari species share the bushveld.','River and Bush Walks, Kruger Tablets, Hippo Pool','https://cdn.kimkim.com/files/a/content_articles/featured_photos/22d8dd5c4ae3a3626e0cf30b0cc97e48bc14c72d/big-5b902d4507219d542102a964d62a091b.jpg',0,1,1,1,0,0,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,1,1,0,1,0,0,0,0,1,0,0,1,0,0,0,1,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1),
(23,'Santorini','Greece','Santorini is famous for its cliff-side homes, which are painted blazing white with deep blue roofs. If you are looking for a romantic getaway, this is the place.','Fira, Oia, Caldera, Akrotiri Archaeological Site, Red Beach','https://www.purevacations.com/wp-content/uploads/2019/06/Architecture-of-Santorini-1024x683.jpg',0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,0,0,1,0,1,0,0,0,0,1,1,1,1,0,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,0),
(24,'Singapore','Singapore','Celebrating its melting pot of cultures, Singapore has that spark, and it\'\'s fast becoming one of Asia\'\'s hit-list destinations.','Gardens by the Bay, Merlion, Orchard Road, Night Safari','https://www.tripsavvy.com/thmb/38660cN_DXJPwAd9jRSKDqPETcY=/2121x1193/smart/filters:no_upscale()/singapore-skyline-5bfad49a46e0fb005184dcde.jpg',0,1,0,1,0,0,0,0,1,1,0,0,1,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,1,0),
(25,'London','England','One of the world\'\'s most visited cities, London has something for everyone: from history and culture to fine food and good times.','london tower, big ben, Hyde Park, Buckingham Palace','https://lp-cms-production.imgix.net/image_browser/london-big-ben.jpg',0,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,0,1,0,0,1,0,0,1,0,0,1,1,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1),
(26,'Petra','Jordan','Petra, the great Ancient City that lies half-hidden in the wind-blown landscape in southern Jordan, is one of the world\'\'s most treasured Unesco Heritage Sites.','al-Siq, Ad-Deir,  High Place of Sacrifice, Royal Tombs','https://cdn.pling.com/img/4/0/0/8/debc46a923efb3f23a0043af76b6e87188c8.jpg',0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,0,1,1,0,0,0,0,1,1,0,1,1,1,0),
(27,'Hong Kong','Hong Kong','Hong Kong welcomes with an iconic skyline, a legendary kitchen, and lush, protected nature where rare birds and colorful traditions thrive.','Star Ferry, Hong Kong Skyline, Victoria Peak, Big Buddha, Wong Tai Sin Temple','https://www.china-briefing.com/news/wp-content/uploads/2020/12/Hong-Kong.jpg',0,1,1,1,0,0,0,1,1,0,0,0,1,0,0,1,1,0,1,0,0,1,0,0,0,1,1,1,0,1,0,0,1,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1),
(28,'Barbados','Barbabos','Barbados is know for its tropical beaches and pirate history. It is the birthplace of Rihanna and rum.','The Beaches of Carlisle Bay, Downtown Bridgetown, Bathsheba Bay, Animal Flower Cave','https://i.pinimg.com/originals/d5/1c/1a/d51c1ae16d081bd88b39312b172a2f71.jpg',1,1,1,1,0,0,0,1,1,0,0,1,0,1,0,1,1,1,0,1,0,0,1,1,1,1,1,0,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,1,0,1),
(29,'Amsterdam','Netherland','With its picturesque canal network, rich history and thrumming cultural scene, the capital of the Netherlands is one of the world\'\'s most vibrant cities.','Rijksmuseum, Van Gogh museum, Vondelpark','https://www.telegraph.co.uk/content/dam/insurance/2016/04/06/amsterdam.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,1,0,1,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,1,0,1,1,1,1),
(30,'Santiago','Chile','Surprising, cosmopolitan, energetic, sophisticated and worldly, Santiago is a city of syncopated cultural currents, madhouse parties, expansive museums and top-flight restaurants.','Cerro San Cristobal, Museo Chileno, Cerro Santa Lucia','https://cdn.getyourguide.com/img/location/5cced31b8e609.jpeg/88.jpg',0,1,1,1,0,0,0,1,1,1,0,1,1,1,0,1,1,1,1,0,1,0,0,1,1,1,1,0,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,0,0),
(31,'Cairo','Egypt','Cairo is magnificent, beautiful and, at time, infuriating. From above, the distorted roar of the muezzins call to prayer echoes out from duelling minarets.','Pyramids of Giza, Egyptian Museum, Khan Al Khalili, Bab Zuweila','https://res.klook.com/image/upload/u_activities:wizj33bw0kt3xspjcvp1,w_1.0,ar_3:2,c_scale,e_blur:10000/c_fill,w_750,h_500,f_auto/w_80,x_15,y_15,g_south_west,l_klook_water/activities/wizj33bw0kt3xspjcvp1.jpg',0,1,1,1,1,1,1,1,0,0,0,1,0,1,0,1,1,1,0,0,0,0,0,1,1,0,0,1,1,1,0,0,0,1,1,0,0,0,1,1,1,1,1,0,0,1,1,0,0,0,0,0,1,1,0,1,1,1,1),
(32,'Copenhagen','Denmark','Copenhagen is the epitome of Scandi cool. Modernist lamps light New Nordic tables, bridges buzz with cycling commuters and eye-candy locals dive into pristine waterways.','National Nuseet, Torvehallerne KBH, Tivoli Gardens','https://www.dryarn.com/assets/uploads/header-facebook-copenhagen-cph0416.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,1,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1),
(33,'Seoul','Korea','Fashion- and technology-forward but also deeply traditional, this dynamic city mashes up palaces, temples, cutting-edge design and mountain trails, all to a nonstop K-Pop beat.','Seoul Tower, Bukchon Hanok Village, National Museum of Korea, Lotte World Tower','https://www.onsemi.com/site/images/location-seoul-korea.png',1,1,1,1,0,0,0,1,1,1,0,0,1,1,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1),
(34,'Laucala Island Resort','Fiji','exploring the archipelago\'\'s exquisite beaches, undersea marvels, lush interiors and fascinating culture shouldn\'\'t be rushed.','Blue Lagoon Cruise, Mamanuca Islands, Taveuni Island, Beqa Lagoon','https://wallpaperaccess.com/full/326552.jpg',0,1,1,1,0,0,0,1,1,1,0,0,1,0,0,1,1,1,0,1,0,0,1,1,1,1,1,0,1,1,1,1,1,1,0,0,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,0),
(35,'Providencia','Colombia','Providencia, is a wonderfully remote and traditional Caribbean island with breathtaking scenery, gorgeous golden-sand beaches, friendly locals and superb diving.','El Pico Natural Regional Park, Bahia Suroeste, Cayo Cangrejo, Santa Catalina','https://d2p1cf6997m1ir.cloudfront.net/media/c83opt/18/9f/189fc1188a6330b2c967c1dcae762652.jpg',1,1,1,1,0,0,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,0,0,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0),
(36,'Lisbon','Portugal','Seven cinematic hillsides overlooking the Rio Tejo cradle Lisbon\'\'s postcard-perfect panorama of cobbled alleyways, ancient ruins and white-domed cathedrals – a captivating scene crafted over centuries.','Mosteiro Dos Jeronimos, Castelo De sao Jorge, Alfama, Sintra','https://nltimes.nl/sites/nltimes.nl/files/styles/news_article_full/public/2020/07/depositphotos_65044493_l-2015.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,0,1,1,1,0,1,1,0,0,0,1,0,1,1,1,1,0,0,0,1,0,0,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,0,0,1,1,1,1,1,1,1),
(37,'Hanoi','Vietnam','Hanoi has a fascinating history that combines French and Chinese colonisation with Vietnamese culture. Beautiful lakes, interesting historical attractions and excellent food make Hanoi a great destination for anyone visiting Vietnam.','Day cruises, Old quater, hoa lo prison museum, temple of literature','https://i.natgeofe.com/n/39181071-db55-488f-bd54-707759ad924e/river-hanoi-vietnam_3x2.jpg',0,1,1,1,0,0,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,0,1,1,0,0),
(38,'Paro Valley','Bhutan','The historical town of Paro lies at the centre of a valley rich in sacred sites and ancient buildings, and forms part of the core of exceptional destinations in Bhutan.','paro dzong, the national museum, the weekend market, the archery ground','https://cdn.odysseytraveller.com/app/uploads/2019/12/GettyImages-908708200.jpg',0,1,0,1,0,0,0,1,1,0,0,1,1,1,0,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,0,1,1,1,0,0,1,0,1,0,1,0,1,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,1),
(39,'Ibiza','Spain','Besides being the clubbing capital of the world, Ibiza also boasts amazing natural beauty, a superb climate and several UNESCO World Heritage Sites.','dalt vila, platja de ses salines, stonehenge, trucador peninsula, puig de missa','https://www.ibiza-spotlight.com/sites/default/files/styles/auto_1500_width/public/article-images/133814/slideshow-1558344087.jpg',1,1,0,1,1,1,1,1,0,0,0,1,1,0,0,1,1,1,1,1,0,0,0,0,1,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,0,0),
(40,'Tulum','Mexico','Tulum is the ultimate bohemian adult\'\'s playground. Set amongst gorgeous blue waters and Yucatan jungle lies this magical destination.','Paradise beach, Gran Cenote, Parque Nacional Tulum','https://www.senatorrivieracancunsparesort.com/wp-content/uploads/2019/11/tulum2-1280x720.jpg',1,1,0,1,0,0,0,1,1,0,0,1,0,1,1,0,0,0,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,0,1,1,1,0,1,0,1,0,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0),
(41,'Moscow','Russia','The capital of Russia is an exciting, sparkling city which attracts visitors from all over the world. It\'\'s a city of contrasts, where Soviet architecture mixes with fancy shops, and old Ladas and kitschy Bentleys drown in chaotic traffic.','Red Square, St. Basil\'\'s Cathedral, The Moscow Kremlin','https://a.cdn-hotels.com/gdcs/production29/d1375/234f7170-c9f4-4cee-a372-1a198e388483.jpg',0,1,0,0,0,0,1,1,1,0,0,0,1,0,0,0,0,1,0,1,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,1,1),
(42,'Rio de Janeiro','Brazil','Rio is unlike any other place in the world, with more natural beauty per square inch, and more flip-flops per capita - than any major city.','Christ the Redeemer, Sugarloaf Mountain, Corcovado','https://cdn.kimkim.com/files/a/content_articles/featured_photos/bebd0b5587ac0ae1d0eb3fb7c3dbdc9f97229f19/big-0e55433ac1af491607a650308fc9844b.jpg',1,1,0,1,0,0,0,1,1,1,1,1,1,1,1,0,0,1,0,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,0,1,0,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0),
(43,'Havana','Cuba','A city trapped in time, Havana captures the imagination like no other. Faded glamour meets careful colonial-era reconstruction with a backdrop of irresistible color.','Old Havana, Fusterlandia, Fusterlandia, Cigar factory, Museum of the Revolution','https://www.besttimetovisit.co.za/uploads/2018/06/beste-reistijd-havana-cuba-1200x675.jpg',0,1,0,1,0,0,1,1,1,1,0,1,1,0,0,0,0,1,0,1,0,1,1,0,0,0,0,0,1,1,0,1,1,1,0,1,0,0,1,0,1,0,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,0),
(44,'Cuzco','Peru','City and Inca region, south-central Peru. It is one of the oldest continuously inhabited cities in the Western Hemisphere. ','Machu Picchu, La Catedral, Plaza de Armas','https://lp-cms-production.imgix.net/2019-06/9b0206e3ee0ac4b4b39d4d07b2080bd4-machu-picchu.jpg',1,1,0,1,0,0,0,0,1,1,1,0,0,1,1,0,0,1,0,0,0,1,1,1,1,0,1,0,1,1,1,0,1,0,1,0,0,1,1,0,1,0,1,0,0,0,1,1,1,1,1,1,0,0,0,1,1,0,0),
(45,'Buenos Aires','Argentina','Buenos Aires combines faded colonial architecture with Latin passion. Sexy and alive, this beautiful city gets under your skin.','Plaza de Mayo, Casa Rosada, The Recoleta Cemetery, La Boca','https://www.jta.org/wp-content/uploads/2020/08/8-21-20-buenosaires.jpg',1,1,0,1,0,0,0,1,1,1,1,0,1,0,0,0,0,1,1,1,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,1,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0),
(46,'Shanghai','China','Few cities in the world evoke so much history, excess, glamour, mystique and exotic promise in name alone.','The Bund, Yuyuan Gardens & Bazaar, Shanghai Tower, Jade Buddha Temple,  Tianzifang','https://cdn2.veltra.com/ptr/20180717090145_1855187404_13442_0.jpg',1,1,1,0,0,0,0,1,1,1,0,0,1,0,1,0,0,1,1,1,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,1,0,1,1,1,0,1,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0),
(47,'Yellowstone','USA','Yellowstone National Park is a United States National Park and a UNESCO World Heritage Site.','National Park, geysers, hot springs and other thermal areas','https://www.visittheusa.com/sites/default/files/styles/hero_l_x2/public/images/hero_media_image/2016-10/Yellowstone.jpg',0,1,1,0,0,0,0,1,1,1,0,0,0,1,1,0,0,1,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,1,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1),
(48,'Tel Aviv','Israel','Israel\'\'s largest metropolitan area, serves as a hub for innovation, culture and creativity. Nonstop City is more than just a slogan. With the city\'\'s beautiful beaches, diverse cultural scene, top-notch cuisine, and vibrant nightlife.','Carmel Market,Port of Jaffa, Neve Tzedek , Sharona Market','https://i1.wp.com/www.touristisrael.com/wp-content/uploads/2020/06/Best-areas-to-stay-in-Tel-Aviv-scaled-e1593008399620.jpg',1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,0,1,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,0,0),
(49,'Jerusalem','Israel','A city of tradition, religion, and history, but also, increasingly, of modern culture and heritage, it is a city with so much to offer that you could spend years here and still not see everything. There is no other place like it. ','Jerusalem’s Old City, Western Wall, Via Dolorosa, Church of the Holy Sepulchre, Machane Yehuda Market','https://meyda.education.gov.il/files/pop/6443/%D7%99%D7%A8%D7%95%D7%A9%D7%9C%D7%99%D7%9D-%D7%A2%D7%91%D7%A8%D7%99%D7%AA-%D7%99%D7%A1%D7%95%D7%93%D7%99.jpg',1,0,1,0,1,1,1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,1,0,1,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1),
(50,'Barcelona','Spain','Barcelona is the second largest city in Spain and is a vibrant city, full of entertainment and diverse nightlife.','Sagrada Familia, Park Guell, the Gothic Quarter, the Rambla and La Boqueria Market, Magic Fountain, Espanya Square, Camp Nou','https://lp-cms-production.imgix.net/2021-02/shutterstockRF_1347219839.jpg',1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0,0,1,0,1,0,0,0,0,0,1,1,1,1,0,0,1,1,1,0,1,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,1,0,1,1),
(51,'Berlin','Germany','Berlin, the capital of Germany and the country\'\'s largest city, is also a major center of politics, culture, media, and science.','The Brandenburg Gate, The Rebuilt Reichstag, Museum Island, Berlin Wall Memorial, German Historical Museum, Berliner Fernsehturm: Berlin\'\'s Television Tower, Jewish Museum Berlin','https://www.leaders-in-law.com/wp-content/uploads/2020/07/BERLIN.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,0,1,0,1,1,1),
(52,'Chiang Mai','Thailand','Chiang Mai is a land of misty mountains and colourful hill tribes, a playground for seasoned travellers, a paradise for shoppers and a delight for adventurers.','Doi Suthep, Chiang Mai Old City, Night Safari, Wiang Kum Kam, the Underground Ancient City, Karen Long Neck Tribe & Chiang Dao Cave','https://www.lametayel-thailand.com/wp-content/uploads/2016/08/chiang-mai-thailand.jpg',1,1,1,1,0,0,0,1,1,1,1,1,0,1,1,0,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,0,1,0,0,1,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1),
(53,'Beijing','China','From ancient walled capital to showpiece megacity in barely a century, Beijing has history stretching back 3 millennia. ','The Great Wall of China, Beijing National Stadium, Beijing Zoo','https://www.planetware.com/wpimages/2018/09/china-beijing-attractions-great-wall-of-china.jpg',1,1,1,0,0,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,0,1,1,1,0,1,0,0,0,1,1,1,0,0,0,1,1,0,0,0,1,1,0),
(54,'Budapest','Hungary','They call Budapest the Paris of the East and we certainly think it lives up to its reputation.','Szimpla Kert, Fishermans Bastion, Szechenyi Spa Baths','https://dailynewshungary.com/wp-content/uploads/2019/10/Budapest-Hungary-Parliament-building-e1588084568208.jpg',0,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(55,'Cinque Terre','Italy','Few places in Italy are as memorable as the Cinque Terre, a land and culture so unique that it has been protected as a national park and designated a UNESCO World Heritage Site.','Monterosso al Mare, Vernazza, Corniglia','https://thenomadvisor.com/wp-content/uploads/2020/02/cinqueterre.jpg',0,1,1,0,0,0,1,1,1,0,0,1,0,1,1,1,1,0,0,1,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,0,0,1,1,0,1,0,0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1),
(56,'Las Vegas,  Nevada','USA','The Entertainment Capital of the World. Famous for its mega casino-hotels and associated activities.','The Venetian Casino and Grand Canal, Bellagio Casino and Fountains, MGM Grand Casino','https://assets.simpleviewcms.com/simpleview/image/upload/c_fill,h_900,q_75,w_1600/v1/clients/lasvegas/strip4_89c32e94-f471-4162-aa4c-a18b84c73ba6.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(57,'Matterhorn','Switzerland','The Matterhorn is a mountain of the Alps with a near-symmetric pyramidal peak that is commonly believed to have inspiration for the shape of Toblerone chocolate.','Matterhorn, Gornergrat, Matterhorn glacier paradise','https://img.locationscout.net/images/2020-06/the-matterhorn-switzerland-italy_l.jpeg',1,1,1,1,0,0,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,1,0,0,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,0),
(58,'Aspen Mountain, Colorado','USA','Aspen Mountain, and its famous black-diamond terrain, 336 trails and 42 lifts, made Aspen one of the popular ski resorts in west US.','Ski, Aspen Highlands, Glenwood Springs','https://media.cntraveler.com/photos/5fda74245344ec5351d1fca8/master/pass/AspenColorado-2020-GettyImages-956105512.jpg',0,1,1,1,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1),
(59,'Whistler Blackcomb','Canada','By many measures it is the largest ski resort in North America and has the greatest uphill lift capacity.','Whistler Olympic Park, Whistler Blackcomb, Peak 2 Peak Gondola','https://img6.onthesnow.com/image/xl/14/whistler_blackcomb_canada_3_140729.jpg',0,1,1,1,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,1,1),
(60,'St Anton','Austria','St. Anton am Arlberg is an Austrian village in the Tyrolean Alps. It\'\'s known as a gateway to the Arlberg ski region and is often called the “cradle of alpine skiing” for its role in inventing the sport.','Valluga, Rendl, Run of Fame','https://img6.onthesnow.com/image/xl/36/st_anton_arlberg_366743.jpg',0,1,1,1,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1),
(61,'Val dIsere','France','Val dIsere is a ski resort in the French Alps, near the Italian border. With nearby Tignes, it is part of the Espace Killy ski area.','Bellevarde, Le Fornet, Val dIsere Snowpark','https://s3.eu-west-2.amazonaws.com/investorsinproperty/France/Val+d%27Isere+and+Tignes/Resort/Val+dIsere+Banner+2.jpg',0,1,1,1,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1),
(62,'Courchevel','France','Courchevel is a French Alps ski resort. It is a part of Les Trois Vallees, the largest linked ski areas in the world.','Indiens Piste, Big Air Bag, Night Skiing','https://www.topsnowtravel.com/wp-content/uploads/2020/03/IMG_1170-1200x800.jpg',0,1,1,1,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1),
(63,'Toronto','Canada','Toronto is one of the worlds most culturally diverse cities, and proudly so. You will hear more than 140 languages and dialects spoken on the streets in this City of Neighborhoods.','Toronto Islands, St. Lawrence Market, CN Tower','https://cdn.britannica.com/31/76031-050-162E5900/CN-Tower-rest-skyline-Toronto-world-structure.jpg',1,1,1,1,1,1,1,1,1,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0,1,1,0,1,1,1,0,0,0,0,1,1,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1),
(64,'Venice','Italy','With its historical canals, gondolas, and winding streets, Venice is considered one of the most romantic and most famous cities in the world.','Piazza San Marco, Saint Marks Basilica, Doges Palace','https://www.besttimetovisit.co.za/uploads/2019/01/beste-reistijd-venetie-italie-640x360.jpg',0,1,1,1,1,1,1,0,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,1,0,1,1),
(65,'Madrid','Spain','The magical city of Madrid, the capital of Spain, is a must. There is a electric energy running through the city and everyone seems to be living their best life.','Parque del Retiro, Santiago Bernabeu Stadium, Prado National Museum','https://lp-cms-production.imgix.net/features/2019/06/shutterstockRF_378537616-8e1299019a15.jpg',1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(8,'account','emailaddress'),
(9,'account','emailconfirmation'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(13,'authtoken','token'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'sites','site'),
(10,'socialaccount','socialaccount'),
(11,'socialaccount','socialapp'),
(12,'socialaccount','socialtoken'),
(14,'vacation','cityfeature'),
(15,'vacation','usercity'),
(16,'vacation','userfeature');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2021-05-27 16:12:39.839692'),
(2,'auth','0001_initial','2021-05-27 16:12:41.601793'),
(3,'account','0001_initial','2021-05-27 16:12:48.709199'),
(4,'account','0002_email_max_length','2021-05-27 16:12:51.011331'),
(5,'admin','0001_initial','2021-05-27 16:12:51.306348'),
(6,'admin','0002_logentry_remove_auto_add','2021-05-27 16:12:53.408468'),
(7,'admin','0003_logentry_add_action_flag_choices','2021-05-27 16:12:53.441470'),
(8,'contenttypes','0002_remove_content_type_name','2021-05-27 16:12:54.020503'),
(9,'auth','0002_alter_permission_name_max_length','2021-05-27 16:12:55.427583'),
(10,'auth','0003_alter_user_email_max_length','2021-05-27 16:12:56.194627'),
(11,'auth','0004_alter_user_username_opts','2021-05-27 16:12:56.226629'),
(12,'auth','0005_alter_user_last_login_null','2021-05-27 16:12:56.878666'),
(13,'auth','0006_require_contenttypes_0002','2021-05-27 16:12:56.911668'),
(14,'auth','0007_alter_validators_add_error_messages','2021-05-27 16:12:56.933670'),
(15,'auth','0008_alter_user_username_max_length','2021-05-27 16:12:57.003674'),
(16,'auth','0009_alter_user_last_name_max_length','2021-05-27 16:12:57.078678'),
(17,'auth','0010_alter_group_name_max_length','2021-05-27 16:12:57.678712'),
(18,'auth','0011_update_proxy_permissions','2021-05-27 16:12:57.700713'),
(19,'authtoken','0001_initial','2021-05-27 16:12:57.865723'),
(20,'authtoken','0002_auto_20160226_1747','2021-05-27 16:12:59.262803'),
(21,'sessions','0001_initial','2021-05-27 16:12:59.415812'),
(22,'sites','0001_initial','2021-05-27 16:13:00.399868'),
(23,'sites','0002_alter_domain_unique','2021-05-27 16:13:00.561877'),
(24,'socialaccount','0001_initial','2021-05-27 16:13:01.563934'),
(25,'socialaccount','0002_token_max_lengths','2021-05-27 16:13:08.298320'),
(26,'socialaccount','0003_extra_data_default_dict','2021-05-27 16:13:08.345322'),
(27,'vacation','0001_initial','2021-05-27 16:13:09.259375');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

/*Table structure for table `django_site` */

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `django_site` */

insert  into `django_site`(`id`,`domain`,`name`) values 
(1,'example.com','example.com');

/*Table structure for table `socialaccount_socialaccount` */

DROP TABLE IF EXISTS `socialaccount_socialaccount`;

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `socialaccount_socialaccount` */

/*Table structure for table `socialaccount_socialapp` */

DROP TABLE IF EXISTS `socialaccount_socialapp`;

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `socialaccount_socialapp` */

/*Table structure for table `socialaccount_socialapp_sites` */

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `socialaccount_socialapp_sites` */

/*Table structure for table `socialaccount_socialtoken` */

DROP TABLE IF EXISTS `socialaccount_socialtoken`;

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `socialaccount_socialtoken` */

/*Table structure for table `user_cities_matching` */

DROP TABLE IF EXISTS `user_cities_matching`;

CREATE TABLE `user_cities_matching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `city_name` varchar(150) NOT NULL,
  `matching_score` int(11) NOT NULL,
  `users_rating` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_cities_matching` */

/*Table structure for table `users_features` */

DROP TABLE IF EXISTS `users_features`;

CREATE TABLE `users_features` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` char(39) NOT NULL,
  `time_stamp` datetime(6) NOT NULL,
  `solo` smallint(5) NOT NULL,
  `couple` smallint(5) unsigned NOT NULL,
  `family` smallint(5) unsigned NOT NULL,
  `friends` smallint(5) unsigned NOT NULL,
  `mid_week` smallint(5) unsigned NOT NULL,
  `weekend` smallint(5) unsigned NOT NULL,
  `long_weekend` smallint(5) unsigned NOT NULL,
  `weekish` smallint(5) unsigned NOT NULL,
  `2_weeks` smallint(5) unsigned NOT NULL,
  `3_weeks` smallint(5) unsigned NOT NULL,
  `4_weeks` smallint(5) unsigned NOT NULL,
  `beach` smallint(5) unsigned NOT NULL,
  `city_life` smallint(5) unsigned NOT NULL,
  `nature` smallint(5) unsigned NOT NULL,
  `countryside` smallint(5) unsigned NOT NULL,
  `surprise` smallint(5) unsigned NOT NULL,
  `other` smallint(5) unsigned NOT NULL,
  `adventures` smallint(5) unsigned NOT NULL,
  `shopping` smallint(5) unsigned NOT NULL,
  `romantic` smallint(5) unsigned NOT NULL,
  `ski` smallint(5) unsigned NOT NULL,
  `remote` smallint(5) unsigned NOT NULL,
  `wildlife` smallint(5) unsigned NOT NULL,
  `hiking` smallint(5) unsigned NOT NULL,
  `road_trip` smallint(5) unsigned NOT NULL,
  `festivals` smallint(5) unsigned NOT NULL,
  `nightlife` smallint(5) unsigned NOT NULL,
  `holidays` smallint(5) unsigned NOT NULL,
  `vivid` smallint(5) unsigned NOT NULL,
  `cultural_experience` smallint(5) unsigned NOT NULL,
  `camping` smallint(5) unsigned NOT NULL,
  `surfing` smallint(5) unsigned NOT NULL,
  `honeymoon` smallint(5) unsigned NOT NULL,
  `scuba_diving` smallint(5) unsigned NOT NULL,
  `budget_low` smallint(5) unsigned NOT NULL,
  `budget_normal` smallint(5) unsigned NOT NULL,
  `budget_high` smallint(5) unsigned NOT NULL,
  `1_passengers` smallint(5) unsigned NOT NULL,
  `2_passengers` smallint(5) unsigned NOT NULL,
  `3_passengers` smallint(5) unsigned NOT NULL,
  `4_passengers` smallint(5) unsigned NOT NULL,
  `5_passengers` smallint(5) unsigned NOT NULL,
  `6_passengers` smallint(5) unsigned NOT NULL,
  `january` smallint(5) unsigned NOT NULL,
  `february` smallint(5) unsigned NOT NULL,
  `march` smallint(5) unsigned NOT NULL,
  `april` smallint(5) unsigned NOT NULL,
  `may` smallint(5) unsigned NOT NULL,
  `june` smallint(5) unsigned NOT NULL,
  `july` smallint(5) unsigned NOT NULL,
  `august` smallint(5) unsigned NOT NULL,
  `september` smallint(5) unsigned NOT NULL,
  `october` smallint(5) unsigned NOT NULL,
  `november` smallint(5) unsigned NOT NULL,
  `december` smallint(5) unsigned NOT NULL,
  `comp_allgirls` smallint(5) unsigned NOT NULL,
  `comp_allboys` smallint(5) unsigned NOT NULL,
  `comp_elderly` smallint(5) unsigned NOT NULL,
  `comp_kids_babies` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `users_features` */

insert  into `users_features`(`user_id`,`user_ip`,`time_stamp`,`solo`,`couple`,`family`,`friends`,`mid_week`,`weekend`,`long_weekend`,`weekish`,`2_weeks`,`3_weeks`,`4_weeks`,`beach`,`city_life`,`nature`,`countryside`,`surprise`,`other`,`adventures`,`shopping`,`romantic`,`ski`,`remote`,`wildlife`,`hiking`,`road_trip`,`festivals`,`nightlife`,`holidays`,`vivid`,`cultural_experience`,`camping`,`surfing`,`honeymoon`,`scuba_diving`,`budget_low`,`budget_normal`,`budget_high`,`1_passengers`,`2_passengers`,`3_passengers`,`4_passengers`,`5_passengers`,`6_passengers`,`january`,`february`,`march`,`april`,`may`,`june`,`july`,`august`,`september`,`october`,`november`,`december`,`comp_allgirls`,`comp_allboys`,`comp_elderly`,`comp_kids_babies`) values 
(1,'127.0.0.1','2021-05-27 16:16:58.228471',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(2,'127.0.0.1','2021-05-27 16:17:49.252389',1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,0,0),
(3,'127.0.0.1','2021-05-27 17:06:11.392382',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
