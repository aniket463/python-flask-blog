/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.5.17 : Database - cordingthunder
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cordingthunder` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cordingthunder`;

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone_num` varchar(120) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `date` datetime DEFAULT NULL,
  `email` varchar(1000) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `phone_num` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `contact` */

insert  into `contact`(`sno`,`name`,`phone_num`,`msg`,`date`,`email`) values 
(1,'vishal','12345','tadaa','2020-02-03 17:03:35','my@emi.com'),
(52,'souvik alu','897598479','jhdjkfhoidhf','2020-02-12 16:33:52','souvik.alu48@gmail.com'),
(54,'ROKI','9841512017','hi i want to join with your blog page.','2020-02-12 16:36:28','rokidey11211@gmail.com'),
(55,'sourav patra','3659845632','hi i am sourav','2020-02-12 16:39:30','patrasourav@gmailcom'),
(56,'sourav jana','567438632','gjhgku','2020-02-16 06:12:15','sourav@janagmail.com'),
(57,'soureav janaq','4563545','fjhgfs','2020-02-16 06:14:24','sourav@jana.com'),
(58,'vishal','12345','','2020-02-16 06:21:14',''),
(59,'vishal','12345','','2020-02-16 06:21:51','broadlink.rk@gmail.com'),
(60,'asvt sd','6643432','cfghfs','2020-02-21 13:25:13','fsafa@fsdgfszd');

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `sno` int(50) DEFAULT NULL,
  `name` tinytext,
  `phone_num` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mes` tinytext,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contacts` */

insert  into `contacts`(`sno`,`name`,`phone_num`,`email`,`mes`,`date`) values 
(1,'aniket','7003392448','i@gmail.com','ssfsfdzfazrf','2020-02-02 19:47:31');

/*Table structure for table `human` */

DROP TABLE IF EXISTS `human`;

CREATE TABLE `human` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `human` */

insert  into `human`(`id`,`name`) values 
(1,'vishal');

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `sno` int(10) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `tagline` text,
  `slug` varchar(25) DEFAULT NULL,
  `content` text,
  `img_file` varchar(12) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `posts` */

insert  into `posts`(`sno`,`title`,`tagline`,`slug`,`content`,`img_file`,`date`) values 
(1,'THus is 1st post','fst','fst-post','Let’s read in detail about this Article 15;\r\n\r\nFundamental Rights are guaranteed to all persons by the constitution of India without any discrimination of caste, religion, sex etc. These rights entitle an individual to live the life with dignity. Fundamental Rights are meant for promoting the idea of democracy.\r\n\r\nOriginally the constitution provided 7 Fundamental Rights but as of now there are just 6 Fundamental Rights in force. They are;\r\n','about-bg.jpg','2020-03-22 21:36:40'),
(2,'This is my second post THANK','cool post','second-postS','Go to your school website and look up your school policy and rules. If your school’s website does not list the policies and rules, or your school doesn’t have a website, ask your teacher where you can find this information.\r\n\r\nYou could also write about why there isn’t a school website or why the school policies and rules are not listed on the website.\r\n\r\nIf you are able to find your school’s policies and rules, choose a specific rule or policy and write down, in your own words, what the policy or rule is. Do you agree with it? Why? How do you think this policy or rule affects the students at your school? Do you think it is a good or bad policy or rule? Why?','about-bg.jpg','2020-03-22 13:22:05'),
(3,'This is my third post','sexy and hot after editing','third-post','I write sexy stories which I find incredibly arousing to me, in the hope that other people will find them intoxicatingly evocative, too. Written filth is a medium which entices and stimulates like no other. We interpret the written word according to our experiences, our preferences… our kinks. Characters with deep personalities but vague physical outlines are fleshed out by your own imagination, depending on exactly how you’d like them to look. They are given voices by your own mind, speaking the words as written on the page, whispering erotica to you in a perfect growl or purr.','about-bg.jpg','2020-03-05 00:30:33'),
(4,'This is my fourth post','anything','fourth-post','The Article 15 is mentioned as the Fundamental Right in India. Currently it is a buzz in Indian cinema world because a movie released on this article.\r\n\r\nRecently a movie is released based on the “Article 15” of the Indian constitution namely “Article 15”. This movie is based on the “Dalit atrocities” and discrimination against the person of this particular caste. The movie is directed and produced by the Anubhav Sinha and its date of release was 28th June 2019.\r\n\r\nIn the light of this movie we are publishing this story which explains that what are the key provisions in the \"article  15\" of the Indian constitution.\r\n\r\nLet’s read in detail about this Article 15;\r\n\r\nFundamental Rights are guaranteed to all persons by the constitution of India without any discrimination of caste, religion, sex etc. These rights entitle an individual to live the life with dignity. Fundamental Rights are meant for promoting the idea of democracy.\r\n\r\nOriginally the constitution provided 7 Fundamental Rights but as of now there are just 6 Fundamental Rights in force. They are;\r\n\r\n1. Rights to equality (Article 14-18)\r\n\r\n2. Rights to freedom (Article 19-22)\r\n\r\n3. Right against exploitation (Article 23-24)\r\n\r\n4. Right to freedom of religion (Article 25-28)\r\n\r\n5. Cultural and educational rights (Article 29-30)\r\n\r\n6. Rights to constitutional remedies (Article 32)\r\n\r\nFeatures and Provisions of article 15 are;','about-bg.jpg','2020-02-20 20:45:17'),
(5,'This is my third post','something','fifth-post','  \r\nPeople seen lining up outside a pharmacy store in China.\r\nOfficials want to know roughly when the outbreak will peak so they can prepare hospitals.Credit: SOPA Images/LightRocket/Getty\r\n\r\nCoronavirus infections in China continue to swell by thousands a day, prompting epidemiologists to estimate when the outbreak will peak. Some suggest the climax, when the number of new infections in a single day reaches its highest point, will happen any time now. Others say that it is months away and that the virus will infect millions — or in one estimate hundreds of millions — of people first.\r\n\r\nPublic health officials want to know roughly when the peak will be — and how many will be infected — so that they can prepare hospitals and know when it will be safe to lift travel restrictions. Wuhan, the city at the centre of the epidemic, and several other nearby cities have been on lockdown since late','about-bg.jpg','2020-02-20 20:47:24'),
(6,'This is 6','six','six-post','Let’s read in detail about this Article 15;\r\n\r\nFundamental Rights are guaranteed to all persons by the constitution of India without any discrimination of caste, religion, sex etc. These rights entitle an individual to live the life with dignity. Fundamental Rights are meant for promoting the idea of democracy.\r\n\r\nOriginally the constitution provided 7 Fundamental Rights but as of now there are just 6 Fundamental Rights in force. They are;\r\n','about-bg.jpg','2020-03-22 21:44:04'),
(7,'This is &','seven','seven-post','Let’s read in detail about this Article 15;\r\n\r\nFundamental Rights are guaranteed to all persons by the constitution of India without any discrimination of caste, religion, sex etc. These rights entitle an individual to live the life with dignity. Fundamental Rights are meant for promoting the idea of democracy.\r\n\r\nOriginally the constitution provided 7 Fundamental Rights but as of now there are just 6 Fundamental Rights in force. They are;\r\n','about-bg.jpg','2020-03-22 21:45:31'),
(8,'THIS IS 8','Eight','Eight-post','I write sexy stories which I find incredibly arousing to me, in the hope that other people will find them intoxicatingly evocative, too. Written filth is a medium which entices and stimulates like no other. We interpret the written word according to our experiences, our preferences… our kinks. Characters with deep personalities but vague physical outlines are fleshed out by your own imagination, depending on exactly how you’d like them to look. They are given voices by your own mind, speaking the words as written on the page, whispering erotica to you in a perfect growl or purr.','about-bg.jpg','2020-03-22 21:46:42'),
(10,'THIS is tenth post','ten','ten-post','Go to your school website and look up your school policy and rules. If your school’s website does not list the policies and rules, or your school doesn’t have a website, ask your teacher where you can find this information.\r\n\r\nYou could also write about why there isn’t a school website or why the school policies and rules are not listed on the website.\r\n\r\nIf you are able to find your school’s policies and rules, choose a specific rule or policy and write down, in your own words, what the policy or rule is. Do you agree with it? Why? How do you think this policy or rule affects the students at your school? Do you think it is a good or bad policy or rule? Why?','about-bg.jpg','2020-03-22 21:48:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
