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
(53,'Can add user',14,'add_user'),
(54,'Can change user',14,'change_user'),
(55,'Can delete user',14,'delete_user'),
(56,'Can view user',14,'view_user'),
(57,'Can add city',15,'add_city'),
(58,'Can change city',15,'change_city'),
(59,'Can delete city',15,'delete_city'),
(60,'Can view city',15,'view_city'),
(61,'Can add user city',16,'add_usercity'),
(62,'Can change user city',16,'change_usercity'),
(63,'Can delete user city',16,'delete_usercity'),
(64,'Can view user city',16,'view_usercity');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(150) NOT NULL,
  `country` varchar(150) NOT NULL,
  `short_description` varchar(1000) NOT NULL,
  `sites` varchar(100) NOT NULL,
  `picture` varchar(150) NOT NULL DEFAULT 'null',
  `solo` smallint(5) unsigned NOT NULL,
  `couple` smallint(5) unsigned NOT NULL,
  `family` smallint(5) unsigned NOT NULL,
  `friends` smallint(5) unsigned NOT NULL,
  `weekend` smallint(5) unsigned NOT NULL,
  `long_weekend` smallint(5) unsigned NOT NULL,
  `weekish` smallint(5) unsigned NOT NULL,
  `midweek` smallint(5) unsigned NOT NULL,
  `two_weeks` smallint(5) unsigned NOT NULL,
  `three_weeks` smallint(5) unsigned NOT NULL,
  `four_weeks` smallint(5) unsigned NOT NULL,
  `five_weeks` smallint(5) unsigned NOT NULL,
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
  `coltural_experience` smallint(5) unsigned NOT NULL,
  `camping` smallint(5) unsigned NOT NULL,
  `surfing` smallint(5) unsigned NOT NULL,
  `honeymoon` smallint(5) unsigned NOT NULL,
  `scuba_diving` smallint(5) unsigned NOT NULL,
  `budget_low` smallint(5) unsigned NOT NULL,
  `budget_normal` smallint(5) unsigned NOT NULL,
  `budget_high` smallint(5) unsigned NOT NULL,
  `one_passengers` smallint(5) unsigned NOT NULL,
  `two_passengers` smallint(5) unsigned NOT NULL,
  `three_passengers` smallint(5) unsigned NOT NULL,
  `four_passengers` smallint(5) unsigned NOT NULL,
  `five_passengers` smallint(5) unsigned NOT NULL,
  `six_passengers` smallint(5) unsigned NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `cities_features` */

insert  into `cities_features`(`id`,`city_name`,`country`,`short_description`,`sites`,`picture`,`solo`,`couple`,`family`,`friends`,`weekend`,`long_weekend`,`weekish`,`midweek`,`two_weeks`,`three_weeks`,`four_weeks`,`five_weeks`,`beach`,`city_life`,`nature`,`countryside`,`surprise`,`other`,`adventures`,`shopping`,`romantic`,`ski`,`remote`,`wildlife`,`hiking`,`road_trip`,`festivals`,`nightlife`,`holidays`,`vivid`,`coltural_experience`,`camping`,`surfing`,`honeymoon`,`scuba_diving`,`budget_low`,`budget_normal`,`budget_high`,`one_passengers`,`two_passengers`,`three_passengers`,`four_passengers`,`five_passengers`,`six_passengers`,`january`,`february`,`march`,`april`,`may`,`june`,`july`,`august`,`september`,`october`,`november`,`december`,`comp_allgirls`,`comp_allboys`,`comp_elderly`,`comp_kids_babies`) values 
(1,'New Orleans,  Louisiana','USA','From its world-class?gastronomy?and eclectic?art scene?to its distinctive?architecture?and?neighborhoods, New Orleans is like no other city. ?Add in its jazzy soundtrack and tropical climate, this is a destination everyone can enjoy.?','Mardi Gras festival and others, french quarter, St. Louis Cathedral, Jackson Square, New Orleans Mus','Shanghai.jpg',0,1,0,1,1,1,0,0,0,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0),
(2,'Kerry','Ireland','Kerry renowned the world over for its beautiful scenery, mountains, lakes, beautiful sandy beaches, cliffs and rocky headlands','Blasket Islands, Lakes of Killarney, Skellig Michael, Carrauntoohil','Shanghai.jpg',0,1,1,0,1,1,0,0,0,0,0,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,0,0,1,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1),
(3,'Marrakesh','Morocco','Prepare for your senses to be slapped. Marrakesh\'s heady sights and sounds will dazzle, frazzle and enchant','Djemaa El Fna, Jardin Majorelle, Bahia Palace','Shanghai.jpg',0,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,0),
(4,'Sydney','Australia','Seek out some sunshine and good times in Australia\'s Harbour City','Beach, opera house, manly ferry','',1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,1,1,0,1,0,0,0,0,0,0,0,1,1,1,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(5,'The Maldives','The Maldives','Ilands know for their clear emerald waters and beautiful beaches that stretch as far as the eye can see','Maafushi, meeru island, Hulhumale','',0,1,1,0,1,1,0,0,0,0,0,0,1,0,1,0,1,1,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1),
(6,'Paris','France','Paris is unarguably one of the most beautiful cities in the world, the capital of France, of art and of fashion','Eiffel tower, Lourve museum, Norte-Dame cathedral','',1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,1,1,1),
(7,'Cape Town','South Africa','Known as the ?Mother City?, Cape Town is the oldest city in South Africa. Perched between the ocean and the mountain, with a national park as its heart, there is nowhere like Cape Town','Table mountain, beaches, pinguin-watching','',0,1,1,1,1,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,1,1,1,1),
(8,'Dubai','U.A.E','This city of high-rises and shopping malls has transformed itself from a desert outpost to a destination du-jour, where tourists flock for sales bargains, sunshine, and family fun.?','Burj Khalifa, Dubai Mall,  Dubai Museum','',0,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,0,1,0,1,0,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,1,1,1),
(9,'Bora Bora','French Polynesia','Bora Bora is one of the few places on earth that everyone hopes to witness in their lifetime?and once you see it, you are forever enamored.','Matira beach, Mount Otemanu, Turtle centre','',0,1,1,0,1,1,0,0,0,0,0,0,1,0,1,0,1,1,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,1,1,1,1),
(10,'New York City, New York','USA','In addition to being called the ?Big Apple,??New York?City is known as being ?The City That?Never Sleeps.??The city is full of action-packed entertainment attractions.','Central park, Empire state Building, Statue of Liberty, Times square','Shanghai.jpg',1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,1,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,1,1,1,1,1),
(11,'Dubrovnik','Croatia','it?s hard to imagine anyone becoming jaded by the city?s limestone streets, baroque buildings and the endless shimmer of the Adriatic, or failing to be inspired by a walk along the ancient city walls that protected the capital of a sophisticated republic for centuries.','Walls of Dubrovnik, Lokrum, Stradum','Yellowstone.jpg',1,1,1,1,1,1,0,0,1,0,0,0,1,1,0,1,1,1,1,1,1,0,0,0,0,1,0,0,1,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1),
(12,'Edinburgh','Scotland','Edinburgh is Scotland\'s compact, hilly capital. It has a medieval Old Town and elegant Georgian New Town with gardens and neoclassical buildings.?','Edinburgh Castle, Royal Mile ','Tel_Aviv.jpg',1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,1,1,1,0,1,0,0,0,0,0,1,0,1,1,1,1,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1),
(13,'Rome','Italy','Rome?is?famous for?having amazing foods such as spaghetti, lasagna, pizza and gelato. This Capital of Italy is well known for historic sites such as the Colosseum, Trevi Fountain and Vatican City.','Colosseum, st. peter\'s Basilica, Vatican','Barcelona.jpg',1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,1,1,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,1,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
(14,'Hawaii','USA','Whether you like hiking, biking, kayaking, sailing, swimming, or just sitting on the beach, Hawaii is the state for you. Near the water, you can relax as palm trees blow in the island breeze.?','Hawai\'i volcanoes national park, Diamond head, Hanauma bay ','Copenhagen.jpeg',1,1,1,1,1,1,0,0,1,0,0,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,0,0,1,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,1),
(15,'Leh','india','Few places in India are at once so traveler friendly and enchanting as mountain-framed, Leh.','Pangong Tso, Thiksey Monastery, Shanti Stupa,  Stakna Monastery','Leh.jpg',1,1,0,1,0,1,0,0,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,0,0,0,0,0,1,1,0),
(16,'Barbados','Barbabos','Barbados is know for its tropical beaches and pirate history. It is the birthplace of Rihanna and rum.','The Beaches of Carlisle Bay, Downtown Bridgetown, Bathsheba Bay, Animal Flower Cave','Barbados.jpeg',1,1,1,1,0,0,0,0,1,0,0,0,1,0,1,0,1,1,1,0,1,0,0,1,1,1,1,1,0,1,1,1,1,1,1,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,1,0,1,0,1),
(17,'Amsterdam','Netherland','With its picturesque canal network, rich history and thrumming cultural scene, the capital of the Netherlands is one of the world?s most vibrant cities.','rijksmuseum, van gogh museum, the beach in amsterdam, vondelpark, anna frank\'s house','Amsterdam.jpeg',1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,0,1,1,1,1),
(18,'Santiago','Chile','Surprising, cosmopolitan, energetic, sophisticated and worldly, Santiago is a city of syncopated cultural currents, madhouse parties, expansive museums and top-flight restaurants. No wonder 40% of Chileans call the leafy capital city home.','cerro san cristobal, museo chileno, cerro santa lucia, vina cousino macul','Santiago.jpeg',0,1,1,1,0,0,0,0,1,1,0,0,1,1,1,0,1,1,1,1,0,1,0,0,1,1,1,1,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,1,1,0,0),
(19,'Cairo','Egypt','Cairo is magnificent, beautiful and, at time, infuriating. From above, the distorted roar of the muezzins\' call to prayer echoes out from duelling minarets. Below, car horns bellow tuneless symphonies amid avenues of faded 19th-century grandeur while donkey carts rattle down dusty lanes lined with colossal Fatimid and Mamluk monuments.','pyramids of giza, egyptian museum, khan al khalili, coptic museum, bab zuweila','Cairo.png',0,1,1,1,1,1,0,0,0,0,0,0,1,0,1,0,1,1,1,0,0,0,0,0,1,1,0,0,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,1,1),
(20,'Copenhagen','Denmark','Copenhagen is the epitome of Scandi cool. Modernist lamps light New Nordic tables, bridges buzz with cycling commuters and eye-candy locals dive into pristine waterways.','nationalmuseet, torvehallerne KBH, tivoli gardens, rosenborg slot','Copenhagen.jpeg',1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1),
(21,'Seoul','Korea','Fashion- and technology-forward but also deeply traditional, this dynamic city mashes up palaces, temples, cutting-edge design and mountain trails, all to a nonstop K-Pop beat.','Seoul Tower, Bukchon Hanok Village, National Museum of Korea,Lotte World Tower, Gyeongbokgung Palace','',1,1,1,1,0,0,0,0,1,1,0,0,0,1,1,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1),
(22,'Laucala Island Resort','Fiji','exploring the archipelago?s exquisite beaches, undersea marvels, lush interiors and fascinating culture shouldn?t be rushed.','Blue Lagoon Cruise, Mamanuca Islands, Taveuni Island, Beqa Lagoon','',0,1,1,1,0,0,0,0,1,1,0,0,0,1,0,0,1,1,1,0,1,0,0,1,1,1,1,1,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1),
(23,'Shanghai','China','Shanghai: few cities in the world evoke so much history, excess, glamour, mystique and exotic promise in name alone.','The Bund, Yuyuan Gardens & Bazaar, Shanghai Tower, Jade Buddha Temple,  Tianzifang','Shanghai.jpg',1,1,1,0,0,0,0,0,1,1,0,0,0,1,0,1,0,0,1,1,1,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,1,0,1,1,1,1,1,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0),
(24,'Yellowstone','USA','Yellowstone National Park?is a?United States National Park?and a?UNESCO World Heritage Site.','National Park, geysers, hot springs and other thermal areas','Yellowstone.jpg',0,1,1,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,1,0,1,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1),
(25,'Tel Aviv','Israel','Tel Aviv, Israel?s largest metropolitan area, serves as a hub for innovation, culture and creativity. ?Tel Aviv Nonstop City? is more than just a slogan. With the city?s beautiful beaches, diverse cultural scene, top-notch cuisine, and vibrant nightlife, there?s always something to see and do here.','Carmel Market,Port of Jaffa, Neve Tzedek , Sharona Market\n','Tel_Aviv.jpg',1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,0,1,0,1,1,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,0,0),
(26,'Jerusalem','Israel','Jerusalem is totally unique ? there is no other place like it. A city of tradition, religion, and history, but also, increasingly, of modern culture and heritage, it is a city with so much to offer that you could spend years here and still not see everything.','Jerusalem?s Old City, Western Wall, Via Dolorosa, Church of the Holy Sepulchre, Machane Yehuda Marke','',1,0,1,0,1,1,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1),
(27,'Barcelona','Spain','Barcelona is the second largest city in Spain and is a vibrant city, full of entertainment and diverse nightlife.','Sagrada Familia, Park Guell, the Gothic Quarter, the Rambla and La Boqueria Market, the ?Magic Fount','Barcelona.jpg',1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,0,1,0,0,0,0,0,1,1,1,1,0,0,1,1,1,0,1,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,0,1,0,1,1),
(28,'Berlin','Germany','Berlin, the capital of Germany and the country\'s largest city, is also a major center of politics, culture, media, and science.','The Brandenburg Gate, The Rebuilt Reichstag, Museum Island, Berlin Wall Memorial, German Historical ','',1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,1,0,1,1,1),
(29,'Chiang Mai','Thailand','Chiang Mai is a land of misty mountains and colourful hill tribes, a playground for seasoned travellers, a paradise for shoppers and a delight for adventurers.','Doi Suthep, Chiang Mai Old City, Night Safari, Wiang Kum Kam, the Underground Ancient City, Karen Lo','Chiang_Mai.jpg',1,1,1,1,0,0,0,0,1,1,1,1,1,0,1,1,0,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,0,1,0,0,1,0,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0),
(30,'Wanaka','New Zealand','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(31,'Aucklands','New Zealand','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(32,'Tokyo','Japan','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(33,'Antarctica','Antarctica','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(34,'Vancouver','Canada','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(35,'Los Angeles,  California','USA','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(36,'Kruger National Park','South Africa','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(37,'Santorini','Greece','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(38,'Singapore','Singapore','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(39,'London','England','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(40,'Petra','Jordan','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(41,'Hong Kong','Hong Kong','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(42,'Providencia','Colombia','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(43,'Virunga National Park','Democratic Republic of Congo','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(44,'Lisbon','Portugal','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(45,'Hanoi','Vietnam','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(46,'Paro Valley','Bhutan','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(47,'Ibiza','Spain','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(48,'Tulum','Mexico','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(49,'Moscow','Russia','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(50,'Rio de Janeiro','Brazil','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(51,'Havana','Cuba','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(52,'Machu Picchu','Peru','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(53,'Buenos Aires','Argentina','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(54,'Beijing','China','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(55,'Budapest','Hungary','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(56,'Cinque Terre','Italy','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(57,'Las Vegas,  Nevada','USA','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(58,'Matterhorn','Switzerland','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(59,'Aspen Mountain, Colorado','USA','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(60,'Whistler Blackcomb','Canada','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(61,'St Anton','Austria','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(62,'Val d\'Is?re','France','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(63,'Courchevel','France','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(64,'Toronto','Canada','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(65,'Venice','Italy','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

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
(15,'vacation','city'),
(14,'vacation','user'),
(16,'vacation','usercity');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2021-05-18 08:00:58.443493'),
(2,'auth','0001_initial','2021-05-18 08:00:59.587558'),
(3,'account','0001_initial','2021-05-18 08:01:07.101988'),
(4,'account','0002_email_max_length','2021-05-18 08:01:09.514126'),
(5,'admin','0001_initial','2021-05-18 08:01:09.812143'),
(6,'admin','0002_logentry_remove_auto_add','2021-05-18 08:01:10.893205'),
(7,'admin','0003_logentry_add_action_flag_choices','2021-05-18 08:01:11.088216'),
(8,'contenttypes','0002_remove_content_type_name','2021-05-18 08:01:11.719252'),
(9,'auth','0002_alter_permission_name_max_length','2021-05-18 08:01:12.476296'),
(10,'auth','0003_alter_user_email_max_length','2021-05-18 08:01:13.552357'),
(11,'auth','0004_alter_user_username_opts','2021-05-18 08:01:13.606360'),
(12,'auth','0005_alter_user_last_login_null','2021-05-18 08:01:14.036385'),
(13,'auth','0006_require_contenttypes_0002','2021-05-18 08:01:14.059386'),
(14,'auth','0007_alter_validators_add_error_messages','2021-05-18 08:01:14.090388'),
(15,'auth','0008_alter_user_username_max_length','2021-05-18 08:01:14.161392'),
(16,'auth','0009_alter_user_last_name_max_length','2021-05-18 08:01:14.244397'),
(17,'auth','0010_alter_group_name_max_length','2021-05-18 08:01:15.585473'),
(18,'auth','0011_update_proxy_permissions','2021-05-18 08:01:15.625476'),
(19,'authtoken','0001_initial','2021-05-18 08:01:15.797486'),
(20,'authtoken','0002_auto_20160226_1747','2021-05-18 08:01:17.010555'),
(21,'sessions','0001_initial','2021-05-18 08:01:17.879605'),
(22,'sites','0001_initial','2021-05-18 08:01:18.389634'),
(23,'sites','0002_alter_domain_unique','2021-05-18 08:01:18.653649'),
(24,'socialaccount','0001_initial','2021-05-18 08:01:20.294743'),
(25,'socialaccount','0002_token_max_lengths','2021-05-18 08:01:23.926951'),
(26,'socialaccount','0003_extra_data_default_dict','2021-05-18 08:01:24.002955'),
(27,'vacation','0001_initial','2021-05-18 08:01:24.284971'),
(28,'vacation','0002_auto_20210409_2233','2021-05-18 08:01:24.533985'),
(29,'vacation','0003_auto_20210409_2239','2021-05-18 08:01:27.607161'),
(30,'vacation','0004_auto_20210514_2133','2021-05-18 08:01:28.047186'),
(31,'vacation','0005_auto_20210518_1457','2021-05-18 08:01:28.296200'),
(32,'vacation','0006_city','2021-05-18 17:22:33.538742'),
(33,'vacation','0007_usercity','2021-05-18 17:22:34.467795');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `user_cities_matching` */

insert  into `user_cities_matching`(`id`,`user_id`,`city_name`,`matching_score`,`users_rating`) values 
(1,10,'Paris',94,4),
(2,10,'New York',60,2),
(3,10,'Rome',89,1),
(4,10,'Berlin',80,5),
(5,11,'Paris',44,1),
(6,11,'New York',57,2),
(7,11,'Rome',78,3),
(8,11,'Berlin',34,4),
(9,20,'New Orleans,  Louisiana',41,4),
(18,20,'Kerry',94,3),
(19,37,'New Orleans,  Louisiana',39,4),
(20,37,'Kerry',49,2),
(21,45,'Barbados',96,3),
(22,45,'Amsterdam',84,5);

/*Table structure for table `users_features` */

DROP TABLE IF EXISTS `users_features`;

CREATE TABLE `users_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` char(39) NOT NULL,
  `time_stamp` datetime(6) NOT NULL,
  `solo` smallint(5) unsigned NOT NULL,
  `couple` smallint(5) unsigned NOT NULL,
  `family` smallint(5) unsigned NOT NULL,
  `friends` smallint(5) unsigned NOT NULL,
  `weekend` smallint(5) unsigned NOT NULL,
  `long_weekend` smallint(5) unsigned NOT NULL,
  `weekish` smallint(5) unsigned NOT NULL,
  `midweek` smallint(5) unsigned NOT NULL,
  `two_weeks` smallint(5) unsigned NOT NULL,
  `three_weeks` smallint(5) unsigned NOT NULL,
  `four_weeks` smallint(5) unsigned NOT NULL,
  `five_weeks` smallint(5) unsigned NOT NULL,
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
  `coltural_experience` smallint(5) unsigned NOT NULL,
  `camping` smallint(5) unsigned NOT NULL,
  `surfing` smallint(5) unsigned NOT NULL,
  `honeymoon` smallint(5) unsigned NOT NULL,
  `budget_low` smallint(5) unsigned NOT NULL,
  `budget_normal` smallint(5) unsigned NOT NULL,
  `budget_high` smallint(5) unsigned NOT NULL,
  `one_passengers` smallint(5) unsigned NOT NULL,
  `two_passengers` smallint(5) unsigned NOT NULL,
  `three_passengers` smallint(5) unsigned NOT NULL,
  `four_passengers` smallint(5) unsigned NOT NULL,
  `five_passengers` smallint(5) unsigned NOT NULL,
  `six_passengers` smallint(5) unsigned NOT NULL,
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
  `scuba_diving` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `users_features` */

insert  into `users_features`(`id`,`user_ip`,`time_stamp`,`solo`,`couple`,`family`,`friends`,`weekend`,`long_weekend`,`weekish`,`midweek`,`two_weeks`,`three_weeks`,`four_weeks`,`five_weeks`,`beach`,`city_life`,`nature`,`countryside`,`surprise`,`other`,`adventures`,`shopping`,`romantic`,`ski`,`remote`,`wildlife`,`hiking`,`road_trip`,`festivals`,`nightlife`,`holidays`,`vivid`,`coltural_experience`,`camping`,`surfing`,`honeymoon`,`budget_low`,`budget_normal`,`budget_high`,`one_passengers`,`two_passengers`,`three_passengers`,`four_passengers`,`five_passengers`,`six_passengers`,`january`,`february`,`march`,`april`,`may`,`june`,`july`,`august`,`september`,`october`,`november`,`december`,`comp_allgirls`,`comp_allboys`,`comp_elderly`,`comp_kids_babies`,`scuba_diving`) values 
(33,'127.0.0.1','2021-05-21 08:24:52.625399',1,1,1,1,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0),
(34,'127.0.0.1','2021-05-21 08:27:23.624036',1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(35,'127.0.0.1','2021-05-21 15:03:32.393532',1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(36,'127.0.0.1','2021-05-21 15:05:54.591665',1,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(37,'127.0.0.1','2021-05-21 15:07:54.767538',1,1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(38,'127.0.0.1','2021-05-21 15:15:01.707958',1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(39,'127.0.0.1','2021-05-21 15:22:44.271415',1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(40,'127.0.0.1','2021-05-21 15:16:54.029382',1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(41,'127.0.0.1','2021-05-21 15:18:30.622907',1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(42,'127.0.0.1','2021-05-21 15:22:39.455140',0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(43,'127.0.0.1','2021-05-21 15:23:22.832621',0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(44,'127.0.0.1','2021-05-21 15:23:51.812278',1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(45,'127.0.0.1','2021-05-21 17:00:53.141239',1,1,0,1,1,0,1,1,1,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
