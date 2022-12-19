DROP TABLE IF EXISTS addons;

CREATE TABLE `addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO addons VALUES('1','affiliate','affiliate_system','1.2','1','affiliate_banner.jpg','2020-07-27 07:18:09','2022-02-16 22:53:41');
INSERT INTO addons VALUES('2','refund','refund_request','1.0','1','refund_request.png','2020-07-27 07:20:18','2020-07-27 07:20:18');


DROP TABLE IF EXISTS addresses;

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `delivery_location` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO addresses VALUES('1','','8','2','123','Nepal','qwe','123','123','0','2022-04-17 08:52:17','2022-04-17 11:08:00');
INSERT INTO addresses VALUES('2','','8','2','wert','Nepal','wert','12341234','1234','0','2022-04-17 11:56:22','2022-04-17 11:56:22');
INSERT INTO addresses VALUES('3','','8','1','asdf','Nepal','asdfas','123','1234','0','2022-04-17 12:00:07','2022-04-17 12:00:07');
INSERT INTO addresses VALUES('4','','8','2','q','Nepal','a','1','123','0','2022-04-17 12:07:39','2022-04-17 12:07:39');
INSERT INTO addresses VALUES('5','','8','2','11','Nepal','11','11','11','0','2022-04-17 13:12:37','2022-04-17 13:12:37');
INSERT INTO addresses VALUES('6','','3','2','1','Nepal','1','1','1','0','2022-04-18 12:16:22','2022-04-18 12:16:22');
INSERT INTO addresses VALUES('12','','276','1','12','Nepal','31231','23123','123','0','2022-04-24 12:05:14','2022-04-24 12:05:14');
INSERT INTO addresses VALUES('13','','276','1','z','Nepal','z','12','22','0','2022-04-24 12:08:41','2022-04-24 12:08:41');
INSERT INTO addresses VALUES('16','','276','1','Dhumbarahi','Nepal','Kathmandu','4600','9845590200','0','2022-05-03 10:24:25','2022-05-03 10:24:25');


DROP TABLE IF EXISTS affiliate_configs;

CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO affiliate_configs VALUES('1','verification_form','[{"type":"text","label":"Name"},{"type":"text","label":"Email"},{"type":"text","label":"Address"},{"type":"text","label":"Phone no"}]','2020-03-09 15:41:21','2022-01-04 14:58:00');


DROP TABLE IF EXISTS affiliate_options;

CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO affiliate_options VALUES('2','user_registration_first_purchase','','20','1','2020-03-03 10:53:37','2020-03-05 09:41:30');
INSERT INTO affiliate_options VALUES('3','product_sharing','{"commission":"3","commission_type":"percent"}','20','1','2020-03-08 07:40:03','2020-08-24 07:14:33');
INSERT INTO affiliate_options VALUES('4','category_wise_affiliate','[{"category_id":"1","commission":"3","commission_type":"percent"},{"category_id":"2","commission":"3","commission_type":"percent"},{"category_id":"3","commission":"3","commission_type":"percent"},{"category_id":"4","commission":"3","commission_type":"percent"},{"category_id":"5","commission":"3","commission_type":"percent"},{"category_id":"6","commission":"3","commission_type":"percent"},{"category_id":"7","commission":"3","commission_type":"percent"},{"category_id":"8","commission":"3","commission_type":"percent"},{"category_id":"9","commission":"3","commission_type":"percent"},{"category_id":"10","commission":"3","commission_type":"percent"},{"category_id":"11","commission":"3","commission_type":"percent"}]','0','1','2020-03-08 07:40:03','2021-06-01 09:39:37');
INSERT INTO affiliate_options VALUES('5','category_wise_affiliate','','0','0','2020-07-27 09:05:43','2020-07-27 09:05:43');


DROP TABLE IF EXISTS affiliate_payments;

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO affiliate_payments VALUES('2','1','20','Paypal','','2020-03-10 07:49:30','2020-03-10 07:49:30');
INSERT INTO affiliate_payments VALUES('3','1','30','Bank','','2020-07-27 09:57:35','2020-07-27 09:57:35');


DROP TABLE IF EXISTS affiliate_users;

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO affiliate_users VALUES('1','demo@gmail.com','123456','8','[{"type":"text","label":"Your name","value":"Nostrum dicta sint l"},{"type":"text","label":"Email","value":"Aut perferendis null"},{"type":"text","label":"Full Address","value":"Voluptatem Sit dolo"},{"type":"text","label":"Phone Number","value":"Ut ad beatae occaeca"},{"type":"text","label":"How will you affiliate?","value":"Porro sint soluta u"}]','0','1','2020-03-09 11:20:07','2020-09-07 15:15:54');
INSERT INTO affiliate_users VALUES('2','','','23','[{"type":"text","label":"Your name","value":"Yogesh badayak"},{"type":"text","label":"Email","value":"yogeshbadayak1@gmail.com"},{"type":"text","label":"Full Address","value":"Attariya"},{"type":"text","label":"Phone Number","value":"9809465434"},{"type":"text","label":"How will you affiliate?","value":"via my website"},{"type":"text","label":null,"value":"jpt"},{"type":"select","label":null,"value":null}]','0','1','2020-08-24 07:25:38','2020-09-07 15:15:58');
INSERT INTO affiliate_users VALUES('3','','','75','[{"type":"select","label":"Suscipit saepe nulla","value":null},{"type":"text","label":"Et harum optio libe","value":"w3worldxyz@gmail.com"},{"type":"multi_select","label":"Odio quos ipsa aut","value":"[\"Autem ad obcaecati d\",\"Vel rerum distinctio\",\"Voluptates et magnam\"]"}]','0','1','2020-09-12 21:04:16','2020-10-29 11:53:49');
INSERT INTO affiliate_users VALUES('4','','','65','[{"type":"select","label":"Suscipit saepe nulla","value":null},{"type":"text","label":"Et harum optio libe","value":"yogeshbadayak1@gmail.com"},{"type":"multi_select","label":"Odio quos ipsa aut","value":"[\"Voluptates et magnam\"]"}]','0','1','2020-10-29 11:51:12','2020-10-29 11:53:38');
INSERT INTO affiliate_users VALUES('5','','','133','[{"type":"select","label":"Suscipit saepe nulla","value":null},{"type":"text","label":"Et harum optio libe","value":"???"},{"type":"multi_select","label":"Odio quos ipsa aut","value":"[\"Voluptates et magnam\"]"}]','0','0','2020-11-20 20:38:52','2020-11-20 20:38:52');
INSERT INTO affiliate_users VALUES('6','','','12','[{"type":"text","label":"Name","value":"muniraj"},{"type":"text","label":"Email","value":"piratemuniraj@mail.com"},{"type":"text","label":"Address","value":"bhaktapur"},{"type":"text","label":"Phone no","value":"0000000000"}]','0','0','2022-01-04 14:41:05','2022-01-04 14:58:42');
INSERT INTO affiliate_users VALUES('7','','','230','[{"type":"select","label":"Suscipit saepe nulla","value":null},{"type":"text","label":"Et harum optio libe","value":"What is Lorem Ipsum?"},{"type":"multi_select","label":"Odio quos ipsa aut","value":"[\"Vel rerum distinctio\",\"Voluptates et magnam\"]"}]','0','0','2022-01-04 14:54:32','2022-01-04 14:55:38');
INSERT INTO affiliate_users VALUES('8','','','237','[{"type":"text","label":"Name","value":"prasun"},{"type":"text","label":"Email","value":"prasundahal@gmail.com"},{"type":"text","label":"Address","value":"ktm"},{"type":"text","label":"Phone no","value":"0000000000"}]','0','1','2022-01-04 15:03:20','2022-01-04 15:04:13');
INSERT INTO affiliate_users VALUES('9','','','244','[{"type":"text","label":"Name","value":"Aaeronn Bhatta"},{"type":"text","label":"Email","value":"durbarmart1@gmail.com"},{"type":"text","label":"Address","value":"Kalanki"},{"type":"text","label":"Phone no","value":"+19840068322"}]','0','1','2022-01-19 21:12:15','2022-01-19 21:33:38');
INSERT INTO affiliate_users VALUES('10','','','241','[{"type":"text","label":"Name","value":"Bipin Joshi"},{"type":"text","label":"Email","value":"joshibipin2052@gmail.com"},{"type":"text","label":"Address","value":"test address"},{"type":"text","label":"Phone no","value":"9845520200"}]','0','0','2022-01-20 15:24:44','2022-01-28 11:14:55');


DROP TABLE IF EXISTS app_settings;

CREATE TABLE `app_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO app_settings VALUES('1','Active eCommerce','uploads/logo/matggar.png','1','symbol','https://facebook.com','https://twitter.com','https://instagram.com','https://youtube.com','https://google.com','2019-08-04 22:24:15','2019-08-04 22:24:18');


DROP TABLE IF EXISTS attributes;

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO attributes VALUES('1','Size','2020-02-24 11:40:07','2020-02-24 11:40:07');
INSERT INTO attributes VALUES('2','Fabric','2020-02-24 11:40:13','2020-02-24 11:40:13');
INSERT INTO attributes VALUES('3','Storage','2020-06-03 23:42:07','2020-06-03 23:42:07');
INSERT INTO attributes VALUES('4','Memory','2020-06-03 23:42:20','2020-06-03 23:42:20');
INSERT INTO attributes VALUES('5','Capacity','2020-06-04 01:24:10','2020-06-04 01:24:10');
INSERT INTO attributes VALUES('6','Load capacity','2020-06-04 01:24:23','2020-06-04 01:24:23');
INSERT INTO attributes VALUES('7','Wheel','2020-06-04 01:24:35','2020-06-04 01:24:35');
INSERT INTO attributes VALUES('8','Weight','2020-06-04 01:24:46','2020-06-04 01:24:46');
INSERT INTO attributes VALUES('9','sleeve','2020-06-04 01:24:59','2020-06-04 01:24:59');
INSERT INTO attributes VALUES('10','Lace','2020-06-04 01:25:31','2020-06-04 01:25:31');
INSERT INTO attributes VALUES('11','Bulbs','2020-06-04 01:25:42','2020-06-04 01:25:42');


DROP TABLE IF EXISTS banners;

CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO banners VALUES('5','uploads/banners/QlemkcQxDKFJMnfERO9vauswnFtyB3DoPrtS4tNx.jpeg','#','1','1','2019-03-12 11:43:41','2022-02-01 11:55:57');
INSERT INTO banners VALUES('9','uploads/banners/HGSDNhP9tXpuihLyVq2p8pK7jCbEGNyFcCSdd6GG.jpeg','#','1','1','2019-06-11 10:45:15','2020-06-03 20:26:36');
INSERT INTO banners VALUES('10','uploads/banners/banner.jpg','#','1','1','2019-06-11 10:45:24','2022-03-30 21:29:57');
INSERT INTO banners VALUES('12','uploads/banners/ODbQKBCfsjYC5p5sbGgMCLPq8oNqPFPbT5VrxSS6.jpeg','#','1','1','2020-06-03 23:34:59','2022-03-30 09:14:36');
INSERT INTO banners VALUES('14','uploads/banners/4OsyWD3wfCwE4jIZUs0TdcVZH7Nr3LfDA23q2rq2.png','#','2','1','2020-06-07 00:36:51','2022-02-01 11:57:13');
INSERT INTO banners VALUES('15','uploads/banners/ud9Xb75FWg0cQgyNyL6Oh5pgWmt7TO9p6jFkIXO9.jpeg','#','2','1','2020-06-07 00:38:04','2020-12-09 11:55:33');
INSERT INTO banners VALUES('16','uploads/banners/jRWVqebYR6vtZH8nkkPVnFrchR1qSQ96K0Luq05C.png','#','1','0','2022-01-04 11:08:18','2022-03-30 09:14:37');
INSERT INTO banners VALUES('17','uploads/banners/f8tPxaRUgaEwp2KzN26crijuUirLRzt9TwfCwpqs.png','#','1','0','2022-01-04 11:09:55','2022-02-01 11:55:54');


DROP TABLE IF EXISTS blog;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `published` int(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS brands;

CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO brands VALUES('1','Acer','uploads/brands/3tXH1PR2HHzVYXisSnzpnsyf7dYZh2xrH1Fez5w1.png','1','ascer','Acer product','','2019-03-12 11:50:56','2020-06-03 23:15:14');
INSERT INTO brands VALUES('2','Apple','uploads/brands/sEkaIm2fidDwOknvjpviQE7qBavx9JRBj16D9ByE.png','1','apple','Apple Company in nepal','','2019-03-12 11:51:13','2020-06-03 23:14:27');
INSERT INTO brands VALUES('3','Adidas','uploads/brands/eaYA6YMPMBLAmWMHmBgcWDHW13uLL70kpyzdqwxs.png','1','Adidas-NK2sJ','adidas products','','2020-06-03 23:16:19','2020-06-04 00:59:13');
INSERT INTO brands VALUES('4','Asus','uploads/brands/yQ5TbnYMzTdIzUJr8o0DExywEwhb3IhpM9uGx19B.png','1','Asus-TcgNt','asus prodcut','asus nepal','2020-06-03 23:17:30','2020-06-04 00:59:13');
INSERT INTO brands VALUES('5','TITAN','uploads/brands/CLHJI3hbdKjw1jvhoO82PnuEAEvyQCCTrpx5IiCi.jpeg','1','TITAN-uuwjK','Titan product','Titan nepal','2020-06-04 17:36:29','2020-06-04 20:37:21');
INSERT INTO brands VALUES('6','Usupso','uploads/brands/JCmLiP6uPmOFDMlOYt8dMPk49i7pkz9pNsaf76iG.png','0','Usupso-PnUYk','Usupso product','Usupso product in Nepal','2020-06-04 17:40:02','2020-06-04 17:42:18');
INSERT INTO brands VALUES('7','Nyptra','uploads/brands/FaBojd1ziTcLdkuiCwBPrGDpXPhUye5HHy12bW1n.png','1','Nyptra-cjQ7q','Nyptra pant','Nyptra pant in Nepal','2020-06-04 17:41:57','2020-06-04 20:37:21');
INSERT INTO brands VALUES('8','Jhonson','uploads/brands/RGe47tDwiUAfo1TbElVFF7uvKJcl64YYIRpmsaTe.png','0','Jhonson-KAJTk','Jhonson product','Jhonson products in Nepal','2020-06-04 17:44:35','2020-06-04 17:44:35');
INSERT INTO brands VALUES('9','Oppo','uploads/brands/VOlBhwwo5rkehErIzXIHYIem0jNDm2tStbAyQjcB.png','0','Oppo-KZGOb','Oppo moble','Oppo mobile in Nepal','2020-06-04 17:49:13','2020-06-04 17:49:13');
INSERT INTO brands VALUES('10','KTM Bike','uploads/brands/DoG5KgWVP3Th2D5R1nYSUgm5mxJxW7k26L66fDXp.png','0','KTM-Bike-Bq4FZ','KTM RC 200','KTM Bikes in Nepal','2020-06-05 22:16:30','2020-06-05 22:16:30');
INSERT INTO brands VALUES('11','Alda','uploads/brands/AaPLg9KuuLtOjHRs93WMlCLb38tFvNn7RwjUYgrj.jpeg','0','Alda-mk2SB','Alda Products','Buy Alda Products','2020-06-08 15:09:35','2020-06-08 15:09:35');
INSERT INTO brands VALUES('12','Baltra','uploads/brands/k4nuHBWbg34H3HIcaQz7RNGz6a1ZrQgecVFNUpq2.jpeg','0','Baltra-gSgtG','Bultra Products','Buy Baltra prodcuts','2020-06-08 15:10:06','2020-06-08 15:10:06');
INSERT INTO brands VALUES('13','Brother','uploads/brands/X3GEscpHPnMrHHcgRu5ihHcQLY8x8hYW4ZuFrdwz.jpeg','0','Brother-qDRRR','brother products','buy brother products','2020-06-08 15:10:51','2020-06-08 15:11:01');
INSERT INTO brands VALUES('14','Capella','uploads/brands/sz4NpZ21QeJgwhQ9RPTiTWdyVcUIXaNT94J84xo1.jpeg','0','Capella-8KKnw','capella product','buy capella products','2020-06-08 15:11:31','2020-06-08 15:11:31');
INSERT INTO brands VALUES('15','CG','uploads/brands/9Euiu1y0yQzFuoSw6JJAL4Kfc2mIr0mSNcFgfL0I.jpeg','0','CG-wzxEL','cg products','Buy CG brands products','2020-06-08 15:12:02','2020-06-08 15:12:02');
INSERT INTO brands VALUES('16','Dekha Herbals','uploads/brands/cDlKHyWLb0RbMHreml7hUpGlgbbx3w0DRsEuHnON.jpeg','0','Dekha-Herbals-4tmBR','dekha herbals','Buy dekha-herbals','2020-06-08 15:15:00','2020-06-08 15:15:00');
INSERT INTO brands VALUES('17','Digicom','uploads/brands/Hp3Zcby0FsXpuDOwwz1O1NCLcS1fAiPmomaHxvAp.jpeg','0','Digicom-4TedT','digicome','Get digicom products','2020-06-08 15:15:42','2020-06-08 15:15:42');
INSERT INTO brands VALUES('18','Eset Antivirus','uploads/brands/IrZ3xbS3FsUI4lZtrEborR00gKFtQe8qoREexwe9.jpeg','0','Eset-Antivirus-M87FV','Eset Antivirus','Eset Antivirus','2020-06-08 15:16:15','2020-06-08 15:16:15');
INSERT INTO brands VALUES('19','Feber','uploads/brands/dZv5JYjDvJG9jedzJp3KyhMyLOg3RPIp5Jq5wyNR.jpeg','0','Feber-L6emm','Feber','Feber','2020-06-08 15:16:39','2020-06-08 15:16:39');
INSERT INTO brands VALUES('20','Happy Feet','uploads/brands/DMzFcr7rAVoNXwz0FlZObPMjHeJZav3qPoKsuEEf.jpeg','0','Happy-Feet-sZaRv','Happy Feet','Happy Feet','2020-06-08 15:16:59','2020-06-08 15:16:59');
INSERT INTO brands VALUES('21','Holistic Health','uploads/brands/8hJrio093yIRs8F8KP36PEzZXWXk1uEOYcbepVHi.jpeg','0','Holistic-Health-z0bEF','Holistic Health','Holistic Health','2020-06-08 15:17:26','2020-06-08 15:17:26');
INSERT INTO brands VALUES('22','Johnnie Walker','uploads/brands/WjUqO2tCK4HzTJ176qk7kEsJu9shCLl6fDGqFoKn.jpeg','0','Johnnie-Walker-h6QQZ','Johnnie Walker','Johnnie Walker','2020-06-08 15:17:54','2020-06-08 15:17:54');
INSERT INTO brands VALUES('23','Juwas','uploads/brands/XHzojAHRgNp1YISFwZXMfB6nJopoxr6cO6WFd2MB.jpeg','0','Juwas-4jtRW','Juwas','Juwas','2020-06-08 15:18:15','2020-06-08 15:18:15');
INSERT INTO brands VALUES('24','Kaku','uploads/brands/Qaqz7yIfAvfM9nYKmohVATdMrX4vUFKzRcMZL8ON.jpeg','0','Kaku-gIE2T','Kaku','Kaku','2020-06-08 15:18:34','2020-06-08 15:18:34');
INSERT INTO brands VALUES('25','Kaspersky','uploads/brands/35oOHJaYpNtbaIvdPSerIDpFu4PKsfTXL662lZtA.jpeg','0','Kaspersky-4J1Tj','Kaspersky','Kaspersky','2020-06-08 15:18:54','2020-06-08 15:18:54');
INSERT INTO brands VALUES('26','Kent','uploads/brands/eHplokr8GeZ4J6LbnwizXSTBDYKO8IKAQHTaWnST.jpeg','0','Kent-BGUbf','kent','kent','2020-06-08 15:19:08','2020-06-08 15:19:08');
INSERT INTO brands VALUES('27','Livpure Water','uploads/brands/kUUJZmKLwfDNkiVY7oi7iRZeyA1skuvLlYlXEzr6.jpeg','0','Livpure-Water-DFYJC','Livpure Water','Livpure Water','2020-06-08 15:19:36','2020-06-08 15:19:36');
INSERT INTO brands VALUES('28','Mely','uploads/brands/bGzZc99r0N34phFnH73Q2qui6UT0NEaFT1NfPLn5.jpeg','0','Mely-Sm7fZ','mely','mely','2020-06-08 15:19:53','2020-06-08 15:19:53');
INSERT INTO brands VALUES('29','Naviforce','uploads/brands/t1JIoRtIdPvynkYGI42YjH1BWz7r3koj4SslKVGP.jpeg','0','Naviforce-Rs6uJ','Naviforce','Naviforce','2020-06-08 15:20:19','2020-06-08 15:20:19');
INSERT INTO brands VALUES('30','Nikon','uploads/brands/tt7yLjAXIfByQrch5Ptc3FD0QRbUepC9TFZMmnS5.jpeg','0','Nikon-ogoKH','Nikon products','Nikon Products','2020-06-08 15:20:43','2020-06-08 15:20:43');
INSERT INTO brands VALUES('31','Ptron','uploads/brands/kkoQ8hbbQvq9elU0YrP1SPCALmXwGwf270ubXwZS.jpeg','0','Ptron-ir2uz','ptron','ptron','2020-06-08 15:21:05','2020-06-08 15:21:05');
INSERT INTO brands VALUES('32','Samsung','uploads/brands/nGyGINIlPYemGc10KRZ9CnVP02PxegVjaeJqOa40.jpeg','0','Samsung-JHjHY','Samsung','Samsung','2020-06-08 15:21:24','2020-06-08 15:21:24');
INSERT INTO brands VALUES('33','SRI','uploads/brands/QjRjCIhNSHZWsPoITZMzLN1zcAFvSeCuTLdDJfy5.jpeg','0','SRI-47goK','sri','sri','2020-06-08 15:21:39','2020-06-08 15:21:39');
INSERT INTO brands VALUES('34','Tenda','uploads/brands/pqnOk8FDY9g1izSelCQJP3PwcR4IxrQZM408BFEj.jpeg','0','Tenda-ARX36','tenda products','tenda products','2020-06-08 15:22:03','2020-06-08 15:22:03');
INSERT INTO brands VALUES('35','Tesla','uploads/brands/PPc1kxaq0SmiroXoV9vyzxOfcFO8G3D6JOFjhjpG.jpeg','0','Tesla-mGjI7','tesla products','Tesla','2020-06-08 15:22:22','2020-06-08 15:22:22');
INSERT INTO brands VALUES('36','totolink','uploads/brands/EPRj4sScHpmTZFw6TLCCkDxTs251SCiuhdvWcvgT.jpeg','0','totolink-lNa5z','totolink prodcuts','totolink products','2020-06-08 15:22:48','2020-06-08 15:22:48');
INSERT INTO brands VALUES('37','Transcend','uploads/brands/jryVFKkjzZ0jYLK668eXHY5aSG3W0FhmA2hidNo8.jpeg','0','Transcend-NpnfC','transcend','Transcend','2020-06-08 15:23:15','2020-06-08 15:23:15');
INSERT INTO brands VALUES('38','View Sonic','uploads/brands/WMcTr9uvzVvJ5E5kFcpZdzdTiRc70HARID2wIOTb.jpeg','0','View-Sonic-KN3I3','view sonic','view sonic','2020-06-08 15:23:56','2020-06-08 15:23:56');
INSERT INTO brands VALUES('39','Virjeans','uploads/brands/CCzJvxFgdO3n9RgkcVddWcOAr6tGuc52iRE1Z52b.jpeg','0','Virjeans-zqbsM','Virjeans','Virjeans','2020-06-08 15:24:22','2020-06-08 15:24:22');
INSERT INTO brands VALUES('40','Amul','uploads/brands/H3p2zV97vRl6Zn3kL2D4ezEFy14hKi6QYRpBUiPv.jpeg','0','Amul-GLqoQ','amul products','Amul Products','2020-06-08 17:16:08','2020-06-08 17:16:08');
INSERT INTO brands VALUES('41','Bikano','uploads/brands/Kv19WdzW9OKYg4f0tVj3Hoo3FCQUUfGCokk9x4xF.jpeg','0','Bikano-KVFO1','bikano product','bikano products','2020-06-08 17:16:36','2020-06-08 17:16:36');
INSERT INTO brands VALUES('42','DDC','uploads/brands/G072rDPrXcg0Mkm7d1oe8F5qzMIOAY5hmwlgsOSx.jpeg','0','DDC-eNHNm','ddc products','DDC products','2020-06-08 17:17:37','2020-06-08 17:17:37');
INSERT INTO brands VALUES('43','Hulas','uploads/brands/DlBFy6R84w53RIiyntodBM74o9bkY8nem8uer9zS.jpeg','0','Hulas-inbUL','hulas products','Hulas','2020-06-08 17:18:17','2020-06-08 17:18:17');
INSERT INTO brands VALUES('44','Aoyu','uploads/brands/jTobfBKdgp3LgD4gZp30Olbb9SCYOgpGEASFZtcA.jpeg','0','None-JsKaN','Aoyu','Aoyu Face Cleanser','2020-06-08 19:06:56','2020-06-08 19:19:09');
INSERT INTO brands VALUES('45','RoHS','uploads/brands/69A4b9qeg21srSp5ywKFqtqpr4Xf2YsI7lyyzi1M.jpeg','0','RoHS-iLy9P','RoHS LED light','RoHS LED light','2020-06-08 19:32:12','2020-06-08 19:32:12');
INSERT INTO brands VALUES('46','Autumnz','uploads/brands/pJgNYD8mDq87pMWF9nROWvzkQzC0pJSJycHbjgfS.png','0','Autumnz-c20ze','Autumnz','Autumnz (Baby Detergent)','2020-06-08 19:45:51','2020-06-08 19:45:51');
INSERT INTO brands VALUES('47','CASIO','uploads/brands/UG6C2J07pC5h9bD9Hug48YXX8P37KkpIavppSnPE.jpeg','0','CASIO-pkqgW','CASIO watch','CASIO watch in Nepal','2020-06-08 19:52:08','2020-06-08 19:52:08');
INSERT INTO brands VALUES('48','Kilofly','uploads/brands/2aw47WDHAQGKUXFtcXpVj5d08ML7yofT2KTwbUWO.jpeg','0','Kilofly-mrrSJ','Kilofy','Kilofly product','2020-06-08 20:20:27','2020-06-08 20:20:27');
INSERT INTO brands VALUES('49','Sprite','uploads/brands/2M4JByDruZx4D0cYRAJuXRXXDTP309JgbmxoPs36.jpeg','0','Sprite-Q0qPe','Sprite','Sprite products','2020-06-08 20:24:37','2020-06-08 20:24:37');
INSERT INTO brands VALUES('50','Nescafe','uploads/brands/4poVyrlnF8y9DzpaRAPhiV1AgUDGT3OeJR8yXzKd.jpeg','0','Nescafe-ecdko','Coffee Products','Coffee','2020-06-09 14:04:39','2020-06-09 14:05:15');
INSERT INTO brands VALUES('51','BRU Instant Coffee','uploads/brands/pqidXBuaU6bEsmnFOvUtT7pAr94hT8a4AUYaLqr7.jpeg','0','BRU-Instant-Coffee-Hpi8q','Coffee Products','BRU Instant Coffee products in Nepal','2020-06-09 14:07:06','2020-06-09 14:07:06');
INSERT INTO brands VALUES('52','MacCoffe','uploads/brands/hHfxgxE0Wm33B1knSIpu1PWjVgPHV2l1YlJ25xAY.jpeg','0','MacCoffe-HmxQI','Coffee Products','MacCoffee products in Nepal','2020-06-09 14:12:37','2020-06-09 14:12:37');
INSERT INTO brands VALUES('53','Red Cherry Coffee( JUAS)','uploads/brands/z4FL5tv73xKDkTZ8D4GKOrNw6Gh442h3QpTcPGee.jpeg','0','Red-Cherry-Coffee-Cv5qo','Coffee Products','Red Cherry Coffee Beans','2020-06-09 14:15:47','2020-06-09 19:14:57');
INSERT INTO brands VALUES('54','Super-Coffee','uploads/brands/LwTorEjomb05m4wHzcctGVXL86jMK2yMY03Slt0n.jpeg','0','Super-Coffee-iinxJ','Coffee Products','Coffee products in Nepal','2020-06-09 14:18:47','2020-06-09 14:18:47');
INSERT INTO brands VALUES('56','DEXE','uploads/brands/99JUQB01DhWnh3zb72PWGy3lyF8BTZ0IOZq3BxZY.png','0','DEXE-wFD25','DEXE','DEXe hair shampoo products','2020-06-09 18:34:35','2020-06-09 18:34:35');
INSERT INTO brands VALUES('57','Kemei','uploads/brands/SMc8AYFP7CEMgW1hzPRRS974Lk0xW8HXG26fTStz.png','0','Kemei-shXBH','Kemei','','2020-07-18 20:45:36','2020-07-18 20:45:36');
INSERT INTO brands VALUES('58','Progemei','uploads/brands/SgHtCqf9rMSZrkaqGOWmR9sWra57h7uuoTiyo1HD.png','0','Progemei-GQCvt','Progemei','','2020-07-21 17:08:46','2020-07-21 17:08:46');
INSERT INTO brands VALUES('59','JBL','uploads/brands/Aql47OhoHLRrBlw1bec7dEZNV2tSAZIyWmIu94Fn.gif','0','JBL-8LVTd','JBL','','2020-07-21 17:09:42','2020-07-21 17:09:42');
INSERT INTO brands VALUES('60','ROMOSS','uploads/brands/EYJFY3ZvzaAHVZx7WhW6a8SnzMm2ZqqyPSxpLZ1u.png','0','ROMOSS-SEOgZ','Romoss','','2020-10-27 14:22:18','2020-10-27 14:22:18');
INSERT INTO brands VALUES('62','SMC','uploads/brands/eLMWnaT7Y6YPGe5VmgGK2CXeypyvJ4r5m3I9SmWH.jpeg','0','SMC-LxgXZ','SMC','','2021-06-01 12:56:31','2021-06-01 12:56:31');
INSERT INTO brands VALUES('63','V-trek','uploads/brands/ajakRvdQ1ZcI8ioGUT7b7Yg23zk9XOsVwSfnk1zb.jpeg','0','V-trek-TslSl','V-trek logo','V-trek logo','2021-08-20 14:20:26','2021-08-20 14:20:26');
INSERT INTO brands VALUES('64','CG Electronic','uploads/brands/bWDobOzicSfKaFHMnvF11hEV4S6HsXnTm1IEMIwC.jpg','0','CG-Electronic-HtHX8','CG Electronic','','2022-04-04 08:44:33','2022-04-04 09:46:22');


DROP TABLE IF EXISTS business_settings;

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO business_settings VALUES('1','home_default_currency','1','2018-10-16 07:20:52','2019-01-28 07:11:53');
INSERT INTO business_settings VALUES('2','system_default_currency','29','2018-10-16 07:21:58','2020-06-03 19:59:04');
INSERT INTO business_settings VALUES('3','currency_format','1','2018-10-17 08:46:59','2018-10-17 08:46:59');
INSERT INTO business_settings VALUES('4','symbol_format','1','2018-10-17 08:46:59','2019-01-20 07:55:55');
INSERT INTO business_settings VALUES('5','no_of_decimals','2','2018-10-17 08:46:59','2020-06-07 01:02:57');
INSERT INTO business_settings VALUES('6','product_activation','1','2018-10-28 07:23:37','2019-02-04 06:56:41');
INSERT INTO business_settings VALUES('7','vendor_system_activation','1','2018-10-28 13:29:16','2022-02-21 17:44:51');
INSERT INTO business_settings VALUES('8','show_vendors','1','2018-10-28 13:29:47','2019-02-04 06:56:13');
INSERT INTO business_settings VALUES('9','paypal_payment','0','2018-10-28 13:30:16','2019-01-31 10:54:10');
INSERT INTO business_settings VALUES('10','stripe_payment','0','2018-10-28 13:30:47','2018-11-14 07:36:51');
INSERT INTO business_settings VALUES('11','cash_payment','1','2018-10-28 13:31:05','2020-06-04 16:42:35');
INSERT INTO business_settings VALUES('12','payumoney_payment','0','2018-10-28 13:31:27','2019-03-05 11:26:36');
INSERT INTO business_settings VALUES('13','best_selling','1','2018-12-24 13:58:44','2019-02-14 11:14:13');
INSERT INTO business_settings VALUES('14','paypal_sandbox','0','2019-01-16 18:29:18','2019-01-16 18:29:18');
INSERT INTO business_settings VALUES('15','sslcommerz_sandbox','1','2019-01-16 18:29:18','2019-03-14 05:52:26');
INSERT INTO business_settings VALUES('16','sslcommerz_payment','0','2019-01-24 15:24:07','2019-01-29 11:58:46');
INSERT INTO business_settings VALUES('17','vendor_commission','00','2019-01-31 12:03:04','2020-07-25 10:55:02');
INSERT INTO business_settings VALUES('18','verification_form','[{"type":"text","label":"Your name"},{"type":"text","label":"Shop name"},{"type":"text","label":"Email"},{"type":"text","label":"License No"},{"type":"text","label":"Full Address"},{"type":"text","label":"Phone Number"},{"type":"file","label":"Tax Papers"},{"type":"file","label":"test"},{"type":"radio","label":"test","options":"[\"nsa\",\"sda\"]"}]','2019-02-03 17:21:58','2022-01-04 13:48:19');
INSERT INTO business_settings VALUES('19','google_analytics','1','2019-02-06 18:07:35','2020-06-07 00:02:03');
INSERT INTO business_settings VALUES('20','facebook_login','1','2019-02-07 18:36:59','2020-06-03 21:29:13');
INSERT INTO business_settings VALUES('21','google_login','1','2019-02-07 18:37:10','2020-06-03 21:29:12');
INSERT INTO business_settings VALUES('22','twitter_login','0','2019-02-07 18:37:20','2019-02-08 08:17:56');
INSERT INTO business_settings VALUES('23','payumoney_payment','1','2019-03-05 17:23:17','2019-03-05 17:23:17');
INSERT INTO business_settings VALUES('24','payumoney_sandbox','1','2019-03-05 17:23:17','2019-03-05 11:24:18');
INSERT INTO business_settings VALUES('36','facebook_chat','1','2019-04-15 17:30:04','2020-06-06 12:14:23');
INSERT INTO business_settings VALUES('37','email_verification','1','2019-04-30 13:15:07','2020-06-03 21:07:22');
INSERT INTO business_settings VALUES('38','wallet_system','1','2019-05-19 13:50:44','2022-03-11 14:00:50');
INSERT INTO business_settings VALUES('39','coupon_system','1','2019-06-11 15:31:18','2020-06-03 21:07:11');
INSERT INTO business_settings VALUES('40','current_version','3.0','2019-06-11 15:31:18','2019-06-11 15:31:18');
INSERT INTO business_settings VALUES('41','instamojo_payment','0','2019-07-06 15:43:03','2019-07-06 15:43:03');
INSERT INTO business_settings VALUES('42','instamojo_sandbox','1','2019-07-06 15:43:43','2019-07-06 15:43:43');
INSERT INTO business_settings VALUES('43','razorpay','0','2019-07-06 15:43:43','2019-07-06 15:43:43');
INSERT INTO business_settings VALUES('44','paystack','0','2019-07-21 18:45:38','2019-07-21 18:45:38');
INSERT INTO business_settings VALUES('45','pickup_point','1','2019-10-17 17:35:39','2020-06-03 21:07:15');
INSERT INTO business_settings VALUES('46','maintenance_mode','0','2019-10-17 17:36:04','2022-12-11 23:26:34');
INSERT INTO business_settings VALUES('47','voguepay','0','2019-10-17 17:36:24','2019-10-17 17:36:24');
INSERT INTO business_settings VALUES('48','voguepay_sandbox','0','2019-10-17 17:36:38','2019-10-17 17:36:38');
INSERT INTO business_settings VALUES('50','category_wise_commission','1','2020-01-21 13:07:47','2022-03-25 17:06:29');
INSERT INTO business_settings VALUES('51','conversation_system','1','2020-01-21 13:08:21','2020-01-21 13:08:21');
INSERT INTO business_settings VALUES('52','guest_checkout_active','1','2020-01-22 13:21:38','2020-01-22 13:21:38');
INSERT INTO business_settings VALUES('53','facebook_pixel','1','2020-01-22 17:28:58','2020-06-06 12:32:45');
INSERT INTO business_settings VALUES('55','classified_product','0','2020-05-13 18:46:05','2022-03-11 14:00:44');
INSERT INTO business_settings VALUES('56','pos_activation_for_seller','1','2020-07-17 17:51:34','2020-07-17 17:51:34');
INSERT INTO business_settings VALUES('57','shipping_type','product_wise_shipping','2020-07-17 17:51:34','2022-04-18 23:04:18');
INSERT INTO business_settings VALUES('58','flat_rate_shipping_cost','10','2020-07-17 17:51:34','2022-04-15 09:28:21');
INSERT INTO business_settings VALUES('59','shipping_cost_admin','00','2020-07-17 17:51:34','2020-12-12 10:14:41');
INSERT INTO business_settings VALUES('60','refund_request_time','3','2019-03-12 10:43:23','2019-03-12 10:43:23');
INSERT INTO business_settings VALUES('61','refund_request_time','3','2019-03-12 10:43:23','2019-03-12 10:43:23');
INSERT INTO business_settings VALUES('62','club_point_convert_rate','10','2019-03-12 11:43:23','2019-03-12 11:43:23');
INSERT INTO business_settings VALUES('63','esewa_payment','{"value":1,"esewa_key":"EPAYTEST","esewa_secret":"EPAYTEST"}','2022-04-28 14:01:01','2022-04-28 14:01:01');


DROP TABLE IF EXISTS careers;

CREATE TABLE `careers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `published` int(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO careers VALUES('2','asdfasdf','','asf','1','2022-04-15 10:55:49','2022-04-15 10:55:49');


DROP TABLE IF EXISTS carts;

CREATE TABLE `carts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO carts VALUES('51','241','136','','299.96','11.98','100','1','2022-12-09 22:28:40','2022-12-09 22:28:40');


DROP TABLE IF EXISTS categories;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO categories VALUES('1','Women's Fashion','0','uploads/categories/banner/Wgoc9xAp4MfZbIQITwvu1vYkagKvVh1gKb46LIQW.jpeg','uploads/categories/icon/g6SDifaQNR5A8iw3R6GQ7diEQ7UUw73WvT6pU7wG.png','1','1','0','women-clothing-fashion','Demo category 1','','2022-04-04 13:17:12','2022-04-04 11:17:12');
INSERT INTO categories VALUES('2','Babies & Toys','0','uploads/categories/banner/5yw4Ry1qTuAIG45L983nFpiBPhW57OBlAnohEMhI.jpg','uploads/categories/icon/oI9UvPtonFrnVycYODrYE1NcFILqMICn6pn5Fjyh.png','1','0','0','baby-care','Demo category 2','','2022-04-04 13:17:39','2022-04-04 11:17:39');
INSERT INTO categories VALUES('3','Groceries & Pets','0','uploads/categories/banner/FsXKIOKrNMxcewG8G3QYnqsIfi9c1nD685ZhP5x7.jpeg','uploads/categories/icon/rKAPw5rNlS84JtD9ZQqn366jwE11qyJqbzAe5yaA.png','1','0','0','grocery-shopasdf','Online Grocery Shopping and Delivery in Kathmandu | Buy fresh food items, personal care, baby products and more.','Nepal online grocery, nepal bazaar, best bazaar, daily bazaar, daily shop, large shop, np shop, shop, online store, buy, sell, home shop, Meat, Oil, rice, Free home delivery, Fresh vegetables, formalin free, free return,','2022-04-22 11:55:09','2022-04-22 11:55:09');
INSERT INTO categories VALUES('4','Men's Fashion','0','uploads/categories/banner/VUgoVdeVZdHuqsNTFJ6pK9pIhypAOiSFssOXA7cJ.jpeg','uploads/categories/icon/mjjJVj1ElABTVLQF9XSJNTYrfnqJnakr6i0W7qi0.jpg','1','1','0','men-clothing-fashion','','','2022-04-04 13:16:37','2022-04-04 11:16:37');
INSERT INTO categories VALUES('6','Health & Beauty','0','uploads/categories/banner/bMO38EKuVhD1zze5qWWcKpfXByGUqDsF9WCTmqxp.jpg','uploads/categories/icon/wMuRpN4dbNqUZT6WIB2EcqUkV2LRHvP5Bbp8Vo4f.png','1','0','0','Health--Beauty','','','2022-04-04 13:02:39','2022-04-04 11:02:39');
INSERT INTO categories VALUES('7','Home & Lifestyles','0','uploads/categories/banner/DpGXFrfnWcHQwYmKhAhkG3KEf7JhsYFFAh5V9Q7y.jpeg','uploads/categories/icon/retyjPyMNovi3G5JkvMqL4eHL6gpNx52Sc6Hqksv.png','1','0','0','kitchen-appliances','','','2022-04-04 16:57:19','2022-04-04 14:57:19');
INSERT INTO categories VALUES('8','Automotive & Moterbike','0','uploads/categories/banner/IjwkqDsQ9hj2hF2DdDwGJ6Xly2hpCJrunaPXxtmB.jpeg','uploads/categories/icon/pZfBnAybzFGDBRZS1XdCczSJDAygLxRnZiu0gDDs.png','1','0','0','vehicle-essentials','','','2022-04-04 13:08:22','2022-04-04 11:08:22');
INSERT INTO categories VALUES('9','Sports & Outdoor','0','uploads/categories/banner/FQmEwmSlt30Z1YDCWKkamx1oXQjz3SWN2aBKSpWE.jpeg','uploads/categories/icon/iHujBAVtmyCztyvexvT8a1FZjaSduKZ8Qejo1sIj.png','1','1','0','sport-outdoor','','','2022-04-04 13:16:14','2022-04-04 11:16:14');
INSERT INTO categories VALUES('11','Electronic Accessories','0','uploads/categories/banner/hr0X9uJKDggqrI7zhT3X69i4J6jg3P98WnI7Vmpk.jpg','uploads/categories/icon/qWVd577DAA804FnQkV6E9ys2xwXozkRHZCcIzKAA.png','1','0','0','cellphones-tabs','','','2022-04-04 13:03:34','2022-04-04 11:03:34');
INSERT INTO categories VALUES('16','Electronic Devices','0','uploads/categories/banner/3g6VlNLZK6NzrMaDo1yMEQ80Z5RGinnVwlNNb0oM.jpg','uploads/categories/icon/DKJB83jRXiHJXznxnN92SE7UTKscGjEOAWFzqJ7D.jpeg','1','1','1','Electronics-and-Electric-Q6MRN','Electronics and Electric','Electronics  and Electric Products','2022-04-04 11:50:48','2022-04-04 09:50:48');
INSERT INTO categories VALUES('17','TV & Home Appliances','10','uploads/categories/banner/RnhbdFUFVHOBviKMnkZt4k1EUn64jITXEo1F3Vpv.jpg','uploads/categories/icon/iEochCf1omWdgSDxQBxeGnLlGxi54RUItvrn6PJi.png','1','1','0','Category-A-fcKNo','Category A','','2022-04-04 16:57:19','2022-04-04 14:57:19');
INSERT INTO categories VALUES('21','Watches & Accessories','0','uploads/categories/banner/GKBbgTI5Apy17pRbOEX4NOs95NuK8vBATyf2BdHE.jpg','uploads/categories/icon/bxZgACCH6uwWwrfxzlrR4kHiDkLUebV70w4lR00b.jpg','1','0','1','Watches--Accessories','Watches & Accessories','','2022-04-04 13:15:12','2022-04-04 11:15:12');


DROP TABLE IF EXISTS club_point_details;

CREATE TABLE `club_point_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS club_points;

CREATE TABLE `club_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS colors;

CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO colors VALUES('1','IndianRed','#CD5C5C','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('2','LightCoral','#F08080','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('3','Salmon','#FA8072','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('4','DarkSalmon','#E9967A','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('5','LightSalmon','#FFA07A','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('6','Crimson','#DC143C','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('7','Red','#FF0000','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('8','FireBrick','#B22222','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('9','DarkRed','#8B0000','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('10','Pink','#FFC0CB','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('11','LightPink','#FFB6C1','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('12','HotPink','#FF69B4','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('13','DeepPink','#FF1493','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('14','MediumVioletRed','#C71585','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('15','PaleVioletRed','#DB7093','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('16','LightSalmon','#FFA07A','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('17','Coral','#FF7F50','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('18','Tomato','#FF6347','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('19','OrangeRed','#FF4500','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('20','DarkOrange','#FF8C00','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('21','Orange','#FFA500','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('22','Gold','#FFD700','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('23','Yellow','#FFFF00','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('24','LightYellow','#FFFFE0','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('25','LemonChiffon','#FFFACD','2018-11-05 07:57:26','2018-11-05 07:57:26');
INSERT INTO colors VALUES('26','LightGoldenrodYellow','#FAFAD2','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('27','PapayaWhip','#FFEFD5','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('28','Moccasin','#FFE4B5','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('29','PeachPuff','#FFDAB9','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('30','PaleGoldenrod','#EEE8AA','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('31','Khaki','#F0E68C','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('32','DarkKhaki','#BDB76B','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('33','Lavender','#E6E6FA','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('34','Thistle','#D8BFD8','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('35','Plum','#DDA0DD','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('36','Violet','#EE82EE','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('37','Orchid','#DA70D6','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('38','Fuchsia','#FF00FF','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('39','Magenta','#FF00FF','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('40','MediumOrchid','#BA55D3','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('41','MediumPurple','#9370DB','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('42','Amethyst','#9966CC','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('43','BlueViolet','#8A2BE2','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('44','DarkViolet','#9400D3','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('45','DarkOrchid','#9932CC','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('46','DarkMagenta','#8B008B','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('47','Purple','#800080','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('48','Indigo','#4B0082','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('49','SlateBlue','#6A5ACD','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('50','DarkSlateBlue','#483D8B','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('51','MediumSlateBlue','#7B68EE','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('52','GreenYellow','#ADFF2F','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('53','Chartreuse','#7FFF00','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('54','LawnGreen','#7CFC00','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('55','Lime','#00FF00','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('56','LimeGreen','#32CD32','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('57','PaleGreen','#98FB98','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('58','LightGreen','#90EE90','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('59','MediumSpringGreen','#00FA9A','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('60','SpringGreen','#00FF7F','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('61','MediumSeaGreen','#3CB371','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('62','SeaGreen','#2E8B57','2018-11-05 07:57:27','2018-11-05 07:57:27');
INSERT INTO colors VALUES('63','ForestGreen','#228B22','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('64','Green','#008000','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('65','DarkGreen','#006400','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('66','YellowGreen','#9ACD32','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('67','OliveDrab','#6B8E23','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('68','Olive','#808000','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('69','DarkOliveGreen','#556B2F','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('70','MediumAquamarine','#66CDAA','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('71','DarkSeaGreen','#8FBC8F','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('72','LightSeaGreen','#20B2AA','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('73','DarkCyan','#008B8B','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('74','Teal','#008080','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('75','Aqua','#00FFFF','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('76','Cyan','#00FFFF','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('77','LightCyan','#E0FFFF','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('78','PaleTurquoise','#AFEEEE','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('79','Aquamarine','#7FFFD4','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('80','Turquoise','#40E0D0','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('81','MediumTurquoise','#48D1CC','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('82','DarkTurquoise','#00CED1','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('83','CadetBlue','#5F9EA0','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('84','SteelBlue','#4682B4','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('85','LightSteelBlue','#B0C4DE','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('86','PowderBlue','#B0E0E6','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('87','LightBlue','#ADD8E6','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('88','SkyBlue','#87CEEB','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('89','LightSkyBlue','#87CEFA','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('90','DeepSkyBlue','#00BFFF','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('91','DodgerBlue','#1E90FF','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('92','CornflowerBlue','#6495ED','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('93','MediumSlateBlue','#7B68EE','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('94','RoyalBlue','#4169E1','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('95','Blue','#0000FF','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('96','MediumBlue','#0000CD','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('97','DarkBlue','#00008B','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('98','Navy','#000080','2018-11-05 07:57:28','2018-11-05 07:57:28');
INSERT INTO colors VALUES('99','MidnightBlue','#191970','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('100','Cornsilk','#FFF8DC','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('101','BlanchedAlmond','#FFEBCD','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('102','Bisque','#FFE4C4','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('103','NavajoWhite','#FFDEAD','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('104','Wheat','#F5DEB3','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('105','BurlyWood','#DEB887','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('106','Tan','#D2B48C','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('107','RosyBrown','#BC8F8F','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('108','SandyBrown','#F4A460','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('109','Goldenrod','#DAA520','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('110','DarkGoldenrod','#B8860B','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('111','Peru','#CD853F','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('112','Chocolate','#D2691E','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('113','SaddleBrown','#8B4513','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('114','Sienna','#A0522D','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('115','Brown','#A52A2A','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('116','Maroon','#800000','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('117','White','#FFFFFF','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('118','Snow','#FFFAFA','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('119','Honeydew','#F0FFF0','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('120','MintCream','#F5FFFA','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('121','Azure','#F0FFFF','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('122','AliceBlue','#F0F8FF','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('123','GhostWhite','#F8F8FF','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('124','WhiteSmoke','#F5F5F5','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('125','Seashell','#FFF5EE','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('126','Beige','#F5F5DC','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('127','OldLace','#FDF5E6','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('128','FloralWhite','#FFFAF0','2018-11-05 07:57:29','2018-11-05 07:57:29');
INSERT INTO colors VALUES('129','Ivory','#FFFFF0','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('130','AntiqueWhite','#FAEBD7','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('131','Linen','#FAF0E6','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('132','LavenderBlush','#FFF0F5','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('133','MistyRose','#FFE4E1','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('134','Gainsboro','#DCDCDC','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('135','LightGrey','#D3D3D3','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('136','Silver','#C0C0C0','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('137','DarkGray','#A9A9A9','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('138','Gray','#808080','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('139','DimGray','#696969','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('140','LightSlateGray','#778899','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('141','SlateGray','#708090','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('142','DarkSlateGray','#2F4F4F','2018-11-05 07:57:30','2018-11-05 07:57:30');
INSERT INTO colors VALUES('143','Black','#000000','2018-11-05 07:57:30','2018-11-05 07:57:30');


DROP TABLE IF EXISTS commissions;

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `commission_rate` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

INSERT INTO commissions VALUES('98','3','36','10','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('99','6','36','15','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('100','10','36','29','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('101','16','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('102','2','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('103','11','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('104','5','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('105','9','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('106','1','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('107','20','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('108','17','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('109','4','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('110','8','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('111','18','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('112','7','36','0','2022-04-01 15:48:08','2022-04-01 15:48:08');
INSERT INTO commissions VALUES('113','3','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('114','7','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('115','17','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('116','2','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('117','1','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('118','4','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('119','9','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('120','21','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('121','8','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('122','11','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('123','6','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO commissions VALUES('124','16','39','0','2022-04-07 06:38:11','2022-04-07 06:38:11');


DROP TABLE IF EXISTS conversations;

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO conversations VALUES('1','19','12','Johnson Powder','1','1','2020-06-04 16:40:14','2020-06-04 16:45:23');
INSERT INTO conversations VALUES('2','24','12','Johnson Powder','1','1','2020-07-01 09:17:14','2020-07-01 17:25:05');
INSERT INTO conversations VALUES('3','23','27','Dual USB car charger','1','1','2020-07-08 06:32:10','2020-07-08 06:33:01');
INSERT INTO conversations VALUES('4','23','12','Progemei 3 in 1 trimmer','1','1','2020-07-21 07:23:16','2020-07-24 05:59:12');
INSERT INTO conversations VALUES('5','12','12','Men's Luggage bag','1','0','2020-09-10 14:37:19','2020-09-10 14:37:19');
INSERT INTO conversations VALUES('6','12','12','Men's Luggage bag','1','0','2020-09-10 14:38:00','2020-09-10 14:38:00');
INSERT INTO conversations VALUES('7','12','12','Men's Luggage bag','1','0','2020-09-10 14:40:01','2020-09-10 14:40:01');
INSERT INTO conversations VALUES('8','148','79','AOC E970Sw 19" monitor','1','0','2020-11-26 06:52:58','2020-11-26 06:52:58');
INSERT INTO conversations VALUES('9','148','79','FrontTech Multimeda speaker(2.1 channel)','1','0','2020-11-26 06:53:32','2020-11-26 06:53:32');
INSERT INTO conversations VALUES('10','77','77','Pearl Green Tea','1','0','2021-06-01 13:11:33','2021-06-01 13:11:33');
INSERT INTO conversations VALUES('11','12','12','Hot shaper 10mm slim belt','1','0','2022-01-03 15:34:33','2022-01-03 15:34:33');
INSERT INTO conversations VALUES('12','241','77','Pearl Green Tea1','1','0','2022-01-19 15:12:45','2022-01-19 15:12:45');
INSERT INTO conversations VALUES('13','241','77','Pearl Green Tea1','1','0','2022-01-19 15:12:46','2022-01-19 15:12:46');
INSERT INTO conversations VALUES('14','241','3','seller digital product','1','1','2022-01-20 14:29:28','2022-01-20 14:29:45');
INSERT INTO conversations VALUES('15','245','3','seller digital product','1','1','2022-01-20 14:37:41','2022-01-20 14:38:30');
INSERT INTO conversations VALUES('16','245','3','Red Cherry Himalayan Arabica Coffee - 250 Gm','1','1','2022-01-20 14:43:49','2022-01-20 14:44:10');
INSERT INTO conversations VALUES('17','8','3','seller product test','1','1','2022-03-11 14:43:04','2022-03-11 14:43:51');


DROP TABLE IF EXISTS countries;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO countries VALUES('1','AF','Afghanistan','0','','2022-02-16 22:49:58');
INSERT INTO countries VALUES('2','AL','Albania','0','','2020-10-20 18:56:24');
INSERT INTO countries VALUES('3','DZ','Algeria','0','','2020-10-20 18:56:27');
INSERT INTO countries VALUES('4','DS','American Samoa','0','','2020-10-20 18:56:29');
INSERT INTO countries VALUES('5','AD','Andorra','0','','2020-10-20 18:56:30');
INSERT INTO countries VALUES('6','AO','Angola','0','','2020-10-20 18:56:30');
INSERT INTO countries VALUES('7','AI','Anguilla','0','','2020-10-20 18:56:31');
INSERT INTO countries VALUES('8','AQ','Antarctica','0','','2020-10-20 18:56:33');
INSERT INTO countries VALUES('9','AG','Antigua and Barbuda','0','','2020-10-20 18:56:34');
INSERT INTO countries VALUES('10','AR','Argentina','0','','2020-10-20 18:56:35');
INSERT INTO countries VALUES('11','AM','Armenia','0','','2020-10-20 18:56:36');
INSERT INTO countries VALUES('12','AW','Aruba','0','','2020-10-20 18:56:37');
INSERT INTO countries VALUES('13','AU','Australia','0','','2020-10-20 18:56:39');
INSERT INTO countries VALUES('14','AT','Austria','0','','2020-10-20 18:56:40');
INSERT INTO countries VALUES('15','AZ','Azerbaijan','0','','2020-10-20 18:56:40');
INSERT INTO countries VALUES('16','BS','Bahamas','0','','2020-10-20 18:56:46');
INSERT INTO countries VALUES('17','BH','Bahrain','0','','2020-10-20 18:56:46');
INSERT INTO countries VALUES('18','BD','Bangladesh','0','','2020-10-20 18:56:48');
INSERT INTO countries VALUES('19','BB','Barbados','0','','2020-10-20 18:56:48');
INSERT INTO countries VALUES('20','BY','Belarus','0','','2020-10-20 18:56:49');
INSERT INTO countries VALUES('21','BE','Belgium','0','','2020-10-20 18:56:51');
INSERT INTO countries VALUES('22','BZ','Belize','0','','2020-10-20 18:56:52');
INSERT INTO countries VALUES('23','BJ','Benin','0','','2020-10-20 18:56:53');
INSERT INTO countries VALUES('24','BM','Bermuda','0','','2020-10-20 18:56:56');
INSERT INTO countries VALUES('25','BT','Bhutan','0','','2020-10-20 18:56:57');
INSERT INTO countries VALUES('26','BO','Bolivia','0','','2020-10-20 18:56:57');
INSERT INTO countries VALUES('27','BA','Bosnia and Herzegovina','0','','2020-10-20 18:56:58');
INSERT INTO countries VALUES('28','BW','Botswana','0','','2020-10-20 18:57:00');
INSERT INTO countries VALUES('29','BV','Bouvet Island','0','','2020-10-20 18:57:00');
INSERT INTO countries VALUES('30','BR','Brazil','0','','2020-10-20 18:57:01');
INSERT INTO countries VALUES('31','IO','British Indian Ocean Territory','0','','2020-10-20 18:57:08');
INSERT INTO countries VALUES('32','BN','Brunei Darussalam','0','','2020-10-20 18:57:09');
INSERT INTO countries VALUES('33','BG','Bulgaria','0','','2020-10-20 18:57:11');
INSERT INTO countries VALUES('34','BF','Burkina Faso','0','','2020-10-20 18:57:12');
INSERT INTO countries VALUES('35','BI','Burundi','0','','2020-10-20 18:57:13');
INSERT INTO countries VALUES('36','KH','Cambodia','0','','2020-10-20 18:57:13');
INSERT INTO countries VALUES('37','CM','Cameroon','0','','2020-10-20 18:57:14');
INSERT INTO countries VALUES('38','CA','Canada','0','','2020-10-20 18:57:15');
INSERT INTO countries VALUES('39','CV','Cape Verde','0','','2020-10-20 18:57:15');
INSERT INTO countries VALUES('40','KY','Cayman Islands','0','','2020-10-20 18:57:16');
INSERT INTO countries VALUES('41','CF','Central African Republic','0','','2020-10-20 18:57:17');
INSERT INTO countries VALUES('42','TD','Chad','0','','2020-10-20 18:57:19');
INSERT INTO countries VALUES('43','CL','Chile','0','','2020-10-20 18:57:20');
INSERT INTO countries VALUES('44','CN','China','0','','2020-10-20 18:57:21');
INSERT INTO countries VALUES('45','CX','Christmas Island','0','','2020-10-20 18:57:22');
INSERT INTO countries VALUES('46','CC','Cocos (Keeling) Islands','0','','2020-10-20 18:57:27');
INSERT INTO countries VALUES('47','CO','Colombia','0','','2020-10-20 18:57:27');
INSERT INTO countries VALUES('48','KM','Comoros','0','','2020-10-20 18:57:29');
INSERT INTO countries VALUES('49','CG','Congo','0','','2020-10-20 18:57:30');
INSERT INTO countries VALUES('50','CK','Cook Islands','0','','2020-10-20 18:57:30');
INSERT INTO countries VALUES('51','CR','Costa Rica','0','','2020-10-20 18:57:32');
INSERT INTO countries VALUES('52','HR','Croatia (Hrvatska)','0','','2020-10-20 18:57:33');
INSERT INTO countries VALUES('53','CU','Cuba','0','','2020-10-20 18:57:35');
INSERT INTO countries VALUES('54','CY','Cyprus','0','','2020-10-20 18:57:37');
INSERT INTO countries VALUES('55','CZ','Czech Republic','0','','2020-10-20 18:57:37');
INSERT INTO countries VALUES('56','DK','Denmark','0','','2020-10-20 18:57:38');
INSERT INTO countries VALUES('57','DJ','Djibouti','0','','2020-10-20 18:57:39');
INSERT INTO countries VALUES('58','DM','Dominica','0','','2020-10-20 18:57:40');
INSERT INTO countries VALUES('59','DO','Dominican Republic','0','','2020-10-20 18:57:41');
INSERT INTO countries VALUES('60','TP','East Timor','0','','2020-10-20 18:57:41');
INSERT INTO countries VALUES('61','EC','Ecuador','0','','2020-10-20 18:57:47');
INSERT INTO countries VALUES('62','EG','Egypt','0','','2020-10-20 18:57:48');
INSERT INTO countries VALUES('63','SV','El Salvador','0','','2020-10-20 18:57:49');
INSERT INTO countries VALUES('64','GQ','Equatorial Guinea','0','','2020-10-20 18:57:50');
INSERT INTO countries VALUES('65','ER','Eritrea','0','','2020-10-20 18:57:51');
INSERT INTO countries VALUES('66','EE','Estonia','0','','2020-10-20 18:57:51');
INSERT INTO countries VALUES('67','ET','Ethiopia','0','','2020-10-20 18:57:52');
INSERT INTO countries VALUES('68','FK','Falkland Islands (Malvinas)','0','','2020-10-20 18:57:53');
INSERT INTO countries VALUES('69','FO','Faroe Islands','0','','2020-10-20 18:57:55');
INSERT INTO countries VALUES('70','FJ','Fiji','0','','2020-10-20 18:57:56');
INSERT INTO countries VALUES('71','FI','Finland','0','','2020-10-20 18:57:57');
INSERT INTO countries VALUES('72','FR','France','0','','2020-10-20 18:57:58');
INSERT INTO countries VALUES('73','FX','France, Metropolitan','0','','2020-10-20 18:57:59');
INSERT INTO countries VALUES('74','GF','French Guiana','0','','2020-10-20 18:58:00');
INSERT INTO countries VALUES('75','PF','French Polynesia','0','','2020-10-20 18:58:01');
INSERT INTO countries VALUES('76','TF','French Southern Territories','0','','2020-10-20 18:58:07');
INSERT INTO countries VALUES('77','GA','Gabon','0','','2020-10-20 18:58:08');
INSERT INTO countries VALUES('78','GM','Gambia','0','','2020-10-20 18:58:10');
INSERT INTO countries VALUES('79','GE','Georgia','0','','2020-10-20 18:58:10');
INSERT INTO countries VALUES('80','DE','Germany','0','','2020-10-20 18:58:12');
INSERT INTO countries VALUES('81','GH','Ghana','0','','2020-10-20 18:58:11');
INSERT INTO countries VALUES('82','GI','Gibraltar','0','','2020-10-20 18:58:13');
INSERT INTO countries VALUES('83','GK','Guernsey','0','','2020-10-20 18:58:14');
INSERT INTO countries VALUES('84','GR','Greece','0','','2020-10-20 18:58:18');
INSERT INTO countries VALUES('85','GL','Greenland','0','','2020-10-20 18:58:19');
INSERT INTO countries VALUES('86','GD','Grenada','0','','2020-10-20 18:58:19');
INSERT INTO countries VALUES('87','GP','Guadeloupe','0','','2020-10-20 18:58:20');
INSERT INTO countries VALUES('88','GU','Guam','0','','2020-10-20 18:58:21');
INSERT INTO countries VALUES('89','GT','Guatemala','0','','2020-10-20 18:58:21');
INSERT INTO countries VALUES('90','GN','Guinea','0','','2020-10-20 18:58:22');
INSERT INTO countries VALUES('91','GW','Guinea-Bissau','0','','2020-10-20 18:58:26');
INSERT INTO countries VALUES('92','GY','Guyana','0','','2020-10-20 18:58:27');
INSERT INTO countries VALUES('93','HT','Haiti','0','','2020-10-20 18:58:27');
INSERT INTO countries VALUES('94','HM','Heard and Mc Donald Islands','0','','2020-10-20 18:58:28');
INSERT INTO countries VALUES('95','HN','Honduras','0','','2020-10-20 18:58:28');
INSERT INTO countries VALUES('96','HK','Hong Kong','0','','2020-10-20 18:58:29');
INSERT INTO countries VALUES('97','HU','Hungary','0','','2020-10-20 18:58:30');
INSERT INTO countries VALUES('98','IS','Iceland','0','','2020-10-20 18:58:30');
INSERT INTO countries VALUES('99','IN','India','0','','2020-10-20 18:58:31');
INSERT INTO countries VALUES('100','IM','Isle of Man','0','','2020-10-20 18:58:33');
INSERT INTO countries VALUES('101','ID','Indonesia','0','','2020-10-20 18:58:35');
INSERT INTO countries VALUES('102','IR','Iran (Islamic Republic of)','0','','2020-10-20 18:58:36');
INSERT INTO countries VALUES('103','IQ','Iraq','0','','2020-10-20 18:58:37');
INSERT INTO countries VALUES('104','IE','Ireland','0','','2020-10-20 18:58:38');
INSERT INTO countries VALUES('105','IL','Israel','0','','2020-10-20 18:58:38');
INSERT INTO countries VALUES('106','IT','Italy','0','','2020-10-20 18:58:43');
INSERT INTO countries VALUES('107','CI','Ivory Coast','0','','2020-10-20 18:58:43');
INSERT INTO countries VALUES('108','JE','Jersey','0','','2020-10-20 18:58:44');
INSERT INTO countries VALUES('109','JM','Jamaica','0','','2020-10-20 18:58:44');
INSERT INTO countries VALUES('110','JP','Japan','0','','2020-10-20 18:58:45');
INSERT INTO countries VALUES('111','JO','Jordan','0','','2020-10-20 18:58:46');
INSERT INTO countries VALUES('112','KZ','Kazakhstan','0','','2020-10-20 18:58:46');
INSERT INTO countries VALUES('113','KE','Kenya','0','','2020-10-20 18:58:47');
INSERT INTO countries VALUES('114','KI','Kiribati','0','','2020-10-20 18:58:54');
INSERT INTO countries VALUES('115','KP','Korea, Democratic People's Republic of','0','','2020-10-20 18:58:49');
INSERT INTO countries VALUES('116','KR','Korea, Republic of','0','','2020-10-20 18:58:49');
INSERT INTO countries VALUES('117','XK','Kosovo','0','','2020-10-20 18:58:51');
INSERT INTO countries VALUES('118','KW','Kuwait','0','','2020-10-20 18:58:55');
INSERT INTO countries VALUES('119','KG','Kyrgyzstan','0','','2020-10-20 18:58:56');
INSERT INTO countries VALUES('120','LA','Lao People's Democratic Republic','0','','2020-10-20 18:58:57');
INSERT INTO countries VALUES('121','LV','Latvia','0','','2020-10-20 18:59:01');
INSERT INTO countries VALUES('122','LB','Lebanon','0','','2020-10-20 18:59:02');
INSERT INTO countries VALUES('123','LS','Lesotho','0','','2020-10-20 18:59:03');
INSERT INTO countries VALUES('124','LR','Liberia','0','','2020-10-20 18:59:03');
INSERT INTO countries VALUES('125','LY','Libyan Arab Jamahiriya','0','','2020-10-20 18:59:05');
INSERT INTO countries VALUES('126','LI','Liechtenstein','0','','2020-10-20 18:59:05');
INSERT INTO countries VALUES('127','LT','Lithuania','0','','2020-10-20 18:59:09');
INSERT INTO countries VALUES('128','LU','Luxembourg','0','','2020-10-20 18:59:08');
INSERT INTO countries VALUES('129','MO','Macau','0','','2020-10-20 18:59:09');
INSERT INTO countries VALUES('130','MK','Macedonia','0','','2020-10-20 18:59:09');
INSERT INTO countries VALUES('131','MG','Madagascar','0','','2020-10-20 18:59:10');
INSERT INTO countries VALUES('132','MW','Malawi','0','','2020-10-20 18:59:11');
INSERT INTO countries VALUES('133','MY','Malaysia','0','','2020-10-20 18:59:14');
INSERT INTO countries VALUES('134','MV','Maldives','0','','2020-10-20 18:59:12');
INSERT INTO countries VALUES('135','ML','Mali','0','','2020-10-20 18:59:15');
INSERT INTO countries VALUES('136','MT','Malta','0','','2020-10-20 18:59:22');
INSERT INTO countries VALUES('137','MH','Marshall Islands','0','','2020-10-20 18:59:23');
INSERT INTO countries VALUES('138','MQ','Martinique','0','','2020-10-20 18:59:24');
INSERT INTO countries VALUES('139','MR','Mauritania','0','','2020-10-20 18:59:25');
INSERT INTO countries VALUES('140','MU','Mauritius','0','','2020-10-20 18:59:29');
INSERT INTO countries VALUES('141','TY','Mayotte','0','','2020-10-20 18:59:28');
INSERT INTO countries VALUES('142','MX','Mexico','0','','2020-10-20 18:59:31');
INSERT INTO countries VALUES('143','FM','Micronesia, Federated States of','0','','2020-10-20 18:59:32');
INSERT INTO countries VALUES('144','MD','Moldova, Republic of','0','','2020-10-20 18:59:34');
INSERT INTO countries VALUES('145','MC','Monaco','0','','2020-10-20 18:59:35');
INSERT INTO countries VALUES('146','MN','Mongolia','0','','2020-10-20 18:59:36');
INSERT INTO countries VALUES('147','ME','Montenegro','0','','2020-10-20 18:59:37');
INSERT INTO countries VALUES('148','MS','Montserrat','0','','2020-10-20 18:59:37');
INSERT INTO countries VALUES('149','MA','Morocco','0','','2020-10-20 18:59:38');
INSERT INTO countries VALUES('150','MZ','Mozambique','0','','2020-10-20 18:59:39');
INSERT INTO countries VALUES('151','MM','Myanmar','0','','2020-10-20 18:59:44');
INSERT INTO countries VALUES('152','NA','Namibia','0','','2020-10-20 18:59:45');
INSERT INTO countries VALUES('153','NR','Nauru','0','','2020-10-20 18:59:47');
INSERT INTO countries VALUES('154','NP','Nepal','1','','');
INSERT INTO countries VALUES('155','NL','Netherlands','0','','2020-10-20 18:59:49');
INSERT INTO countries VALUES('156','AN','Netherlands Antilles','0','','2020-10-20 18:59:50');
INSERT INTO countries VALUES('157','NC','New Caledonia','0','','2020-10-20 18:59:51');
INSERT INTO countries VALUES('158','NZ','New Zealand','0','','2020-10-20 18:59:52');
INSERT INTO countries VALUES('159','NI','Nicaragua','0','','2020-10-20 18:59:54');
INSERT INTO countries VALUES('160','NE','Niger','0','','2020-10-20 18:59:55');
INSERT INTO countries VALUES('161','NG','Nigeria','0','','2020-10-20 18:59:56');
INSERT INTO countries VALUES('162','NU','Niue','0','','2020-10-20 18:59:56');
INSERT INTO countries VALUES('163','NF','Norfolk Island','0','','2020-10-20 18:59:57');
INSERT INTO countries VALUES('164','MP','Northern Mariana Islands','0','','2020-10-20 18:59:58');
INSERT INTO countries VALUES('165','NO','Norway','0','','2020-10-20 18:59:58');
INSERT INTO countries VALUES('166','OM','Oman','0','','2020-10-20 19:00:05');
INSERT INTO countries VALUES('167','PK','Pakistan','0','','2020-10-20 19:00:06');
INSERT INTO countries VALUES('168','PW','Palau','0','','2020-10-20 19:00:06');
INSERT INTO countries VALUES('169','PS','Palestine','0','','2020-10-20 19:00:08');
INSERT INTO countries VALUES('170','PA','Panama','0','','2020-10-20 19:00:09');
INSERT INTO countries VALUES('171','PG','Papua New Guinea','0','','2020-10-20 19:00:10');
INSERT INTO countries VALUES('172','PY','Paraguay','0','','2020-10-20 19:00:10');
INSERT INTO countries VALUES('173','PE','Peru','0','','2020-10-20 19:00:11');
INSERT INTO countries VALUES('174','PH','Philippines','0','','2020-10-20 19:00:12');
INSERT INTO countries VALUES('175','PN','Pitcairn','0','','2020-10-20 19:00:14');
INSERT INTO countries VALUES('176','PL','Poland','0','','2020-10-20 19:00:15');
INSERT INTO countries VALUES('177','PT','Portugal','0','','2020-10-20 19:00:17');
INSERT INTO countries VALUES('178','PR','Puerto Rico','0','','2020-10-20 19:00:18');
INSERT INTO countries VALUES('179','QA','Qatar','0','','2020-10-20 19:00:19');
INSERT INTO countries VALUES('180','RE','Reunion','0','','2020-10-20 19:00:20');
INSERT INTO countries VALUES('181','RO','Romania','0','','2020-10-20 19:00:25');
INSERT INTO countries VALUES('182','RU','Russian Federation','0','','2020-10-20 19:00:26');
INSERT INTO countries VALUES('183','RW','Rwanda','0','','2020-10-20 19:00:29');
INSERT INTO countries VALUES('184','KN','Saint Kitts and Nevis','0','','2020-10-20 19:00:30');
INSERT INTO countries VALUES('185','LC','Saint Lucia','0','','2020-10-20 19:00:32');
INSERT INTO countries VALUES('186','VC','Saint Vincent and the Grenadines','0','','2020-10-20 19:00:32');
INSERT INTO countries VALUES('187','WS','Samoa','0','','2020-10-20 19:00:33');
INSERT INTO countries VALUES('188','SM','San Marino','0','','2020-10-20 19:00:34');
INSERT INTO countries VALUES('189','ST','Sao Tome and Principe','0','','2020-10-20 19:00:36');
INSERT INTO countries VALUES('190','SA','Saudi Arabia','0','','2020-10-20 19:00:36');
INSERT INTO countries VALUES('191','SN','Senegal','0','','2020-10-20 19:00:37');
INSERT INTO countries VALUES('192','RS','Serbia','0','','2020-10-20 19:00:41');
INSERT INTO countries VALUES('193','SC','Seychelles','0','','2020-10-20 19:00:40');
INSERT INTO countries VALUES('194','SL','Sierra Leone','0','','2020-10-20 19:00:41');
INSERT INTO countries VALUES('195','SG','Singapore','0','','2020-10-20 19:00:42');
INSERT INTO countries VALUES('196','SK','Slovakia','0','','2020-10-20 19:00:46');
INSERT INTO countries VALUES('197','SI','Slovenia','0','','2020-10-20 19:00:47');
INSERT INTO countries VALUES('198','SB','Solomon Islands','0','','2020-10-20 19:00:48');
INSERT INTO countries VALUES('199','SO','Somalia','0','','2020-10-20 19:00:48');
INSERT INTO countries VALUES('200','ZA','South Africa','0','','2020-10-20 19:00:49');
INSERT INTO countries VALUES('201','GS','South Georgia South Sandwich Islands','0','','2020-10-20 19:00:50');
INSERT INTO countries VALUES('202','SS','South Sudan','0','','2020-10-20 19:00:50');
INSERT INTO countries VALUES('203','ES','Spain','0','','2020-10-20 19:00:51');
INSERT INTO countries VALUES('204','LK','Sri Lanka','0','','2020-10-20 19:00:52');
INSERT INTO countries VALUES('205','SH','St. Helena','0','','2020-10-20 19:00:53');
INSERT INTO countries VALUES('206','PM','St. Pierre and Miquelon','0','','2020-10-20 19:00:54');
INSERT INTO countries VALUES('207','SD','Sudan','0','','2020-10-20 19:00:55');
INSERT INTO countries VALUES('208','SR','Suriname','0','','2020-10-20 19:01:00');
INSERT INTO countries VALUES('209','SJ','Svalbard and Jan Mayen Islands','0','','2020-10-20 19:00:56');
INSERT INTO countries VALUES('210','SZ','Swaziland','0','','2020-10-20 19:00:59');
INSERT INTO countries VALUES('211','SE','Sweden','0','','2020-10-20 19:01:05');
INSERT INTO countries VALUES('212','CH','Switzerland','0','','2020-10-20 19:01:05');
INSERT INTO countries VALUES('213','SY','Syrian Arab Republic','0','','2020-10-20 19:01:07');
INSERT INTO countries VALUES('214','TW','Taiwan','0','','2020-10-20 19:01:07');
INSERT INTO countries VALUES('215','TJ','Tajikistan','0','','2020-10-20 19:01:08');
INSERT INTO countries VALUES('216','TZ','Tanzania, United Republic of','0','','2020-10-20 19:01:10');
INSERT INTO countries VALUES('217','TH','Thailand','0','','2020-10-20 19:01:10');
INSERT INTO countries VALUES('218','TG','Togo','0','','2020-10-20 19:01:10');
INSERT INTO countries VALUES('219','TK','Tokelau','0','','2020-10-20 19:01:12');
INSERT INTO countries VALUES('220','TO','Tonga','0','','2020-10-20 19:01:19');
INSERT INTO countries VALUES('221','TT','Trinidad and Tobago','0','','2020-10-20 19:01:13');
INSERT INTO countries VALUES('222','TN','Tunisia','0','','2020-10-20 19:01:15');
INSERT INTO countries VALUES('223','TR','Turkey','0','','2020-10-20 19:01:15');
INSERT INTO countries VALUES('224','TM','Turkmenistan','0','','2020-10-20 19:01:16');
INSERT INTO countries VALUES('225','TC','Turks and Caicos Islands','0','','2020-10-20 19:01:21');
INSERT INTO countries VALUES('226','TV','Tuvalu','0','','2020-10-20 19:01:25');
INSERT INTO countries VALUES('227','UG','Uganda','0','','2020-10-20 19:01:27');
INSERT INTO countries VALUES('228','UA','Ukraine','0','','2020-10-20 19:01:27');
INSERT INTO countries VALUES('229','AE','United Arab Emirates','0','','2020-10-20 19:01:28');
INSERT INTO countries VALUES('230','GB','United Kingdom','0','','2020-10-20 19:01:28');
INSERT INTO countries VALUES('231','US','United States','0','','2020-10-20 19:01:29');
INSERT INTO countries VALUES('232','UM','United States minor outlying islands','0','','2020-10-20 19:01:30');
INSERT INTO countries VALUES('233','UY','Uruguay','0','','2020-10-20 19:01:32');
INSERT INTO countries VALUES('234','UZ','Uzbekistan','0','','2020-10-20 19:01:34');
INSERT INTO countries VALUES('235','VU','Vanuatu','0','','2020-10-20 19:01:34');
INSERT INTO countries VALUES('236','VA','Vatican City State','0','','2020-10-20 19:01:36');
INSERT INTO countries VALUES('237','VE','Venezuela','0','','2020-10-20 19:01:37');
INSERT INTO countries VALUES('238','VN','Vietnam','0','','2020-10-20 19:01:38');
INSERT INTO countries VALUES('239','VG','Virgin Islands (British)','0','','2020-10-20 19:01:42');
INSERT INTO countries VALUES('240','VI','Virgin Islands (U.S.)','0','','2020-10-20 19:01:40');
INSERT INTO countries VALUES('241','WF','Wallis and Futuna Islands','0','','2020-10-20 19:01:48');
INSERT INTO countries VALUES('242','EH','Western Sahara','0','','2020-10-20 19:01:51');
INSERT INTO countries VALUES('243','YE','Yemen','0','','2020-10-20 19:01:52');
INSERT INTO countries VALUES('244','ZR','Zaire','0','','2020-10-20 19:01:53');
INSERT INTO countries VALUES('245','ZM','Zambia','0','','2020-10-20 19:01:54');
INSERT INTO countries VALUES('246','ZW','Zimbabwe','0','','2020-10-20 19:01:54');
INSERT INTO countries VALUES('247','AF','Afghanistan','0','','2020-10-20 19:01:55');
INSERT INTO countries VALUES('248','AL','Albania','0','','2020-10-20 19:01:57');
INSERT INTO countries VALUES('249','DZ','Algeria','0','','2020-10-20 19:01:58');
INSERT INTO countries VALUES('250','DS','American Samoa','0','','2020-10-20 19:02:00');
INSERT INTO countries VALUES('251','AD','Andorra','0','','2020-10-20 19:02:00');
INSERT INTO countries VALUES('252','AO','Angola','0','','2020-10-20 19:02:02');
INSERT INTO countries VALUES('253','AI','Anguilla','0','','2020-10-20 19:02:03');
INSERT INTO countries VALUES('254','AQ','Antarctica','0','','2020-10-20 19:02:05');
INSERT INTO countries VALUES('255','AG','Antigua and Barbuda','0','','2020-10-20 19:02:05');
INSERT INTO countries VALUES('256','AR','Argentina','0','','2020-10-20 19:02:55');
INSERT INTO countries VALUES('257','AM','Armenia','0','','2020-10-20 19:02:56');
INSERT INTO countries VALUES('258','AW','Aruba','0','','2020-10-20 19:02:56');
INSERT INTO countries VALUES('259','AU','Australia','0','','2020-10-20 19:02:57');
INSERT INTO countries VALUES('260','AT','Austria','0','','2020-10-20 19:02:58');
INSERT INTO countries VALUES('261','AZ','Azerbaijan','0','','2020-10-20 19:02:58');
INSERT INTO countries VALUES('262','BS','Bahamas','0','','2020-10-20 19:03:04');
INSERT INTO countries VALUES('263','BH','Bahrain','0','','2020-10-20 19:03:00');
INSERT INTO countries VALUES('264','BD','Bangladesh','0','','2020-10-20 19:03:02');
INSERT INTO countries VALUES('265','BB','Barbados','0','','2020-10-20 19:03:05');
INSERT INTO countries VALUES('266','BY','Belarus','0','','2020-10-20 19:03:06');
INSERT INTO countries VALUES('267','BE','Belgium','0','','2020-10-20 19:03:08');
INSERT INTO countries VALUES('268','BZ','Belize','0','','2020-10-20 19:03:09');
INSERT INTO countries VALUES('269','BJ','Benin','0','','2020-10-20 19:03:11');
INSERT INTO countries VALUES('270','BM','Bermuda','0','','2020-10-20 19:03:11');
INSERT INTO countries VALUES('271','BT','Bhutan','0','','2020-10-20 19:02:37');
INSERT INTO countries VALUES('272','BO','Bolivia','0','','2020-10-20 19:02:38');
INSERT INTO countries VALUES('273','BA','Bosnia and Herzegovina','0','','2020-10-20 19:02:38');
INSERT INTO countries VALUES('274','BW','Botswana','0','','2020-10-20 19:02:40');
INSERT INTO countries VALUES('275','BV','Bouvet Island','0','','2020-10-20 19:02:40');
INSERT INTO countries VALUES('276','BR','Brazil','0','','2020-10-20 19:02:42');
INSERT INTO countries VALUES('277','IO','British Indian Ocean Territory','0','','2020-10-20 19:02:43');
INSERT INTO countries VALUES('278','BN','Brunei Darussalam','0','','2020-10-20 19:02:46');
INSERT INTO countries VALUES('279','BG','Bulgaria','0','','2020-10-20 19:02:45');
INSERT INTO countries VALUES('280','BF','Burkina Faso','0','','2020-10-20 19:02:46');
INSERT INTO countries VALUES('281','BI','Burundi','0','','2020-10-20 19:02:47');
INSERT INTO countries VALUES('282','KH','Cambodia','0','','2020-10-20 19:02:48');
INSERT INTO countries VALUES('283','CM','Cameroon','0','','2020-10-20 19:02:49');
INSERT INTO countries VALUES('284','CA','Canada','0','','2020-10-20 19:02:49');
INSERT INTO countries VALUES('285','CV','Cape Verde','0','','2020-10-20 19:02:51');
INSERT INTO countries VALUES('286','KY','Cayman Islands','0','','2020-10-20 19:02:31');
INSERT INTO countries VALUES('287','CF','Central African Republic','0','','2020-10-20 19:02:30');
INSERT INTO countries VALUES('288','TD','Chad','0','','2020-10-20 19:02:26');
INSERT INTO countries VALUES('289','CL','Chile','0','','2020-10-20 19:02:25');
INSERT INTO countries VALUES('290','CN','China','0','','2020-10-20 19:02:25');
INSERT INTO countries VALUES('291','CX','Christmas Island','0','','2020-10-20 19:02:24');
INSERT INTO countries VALUES('292','CC','Cocos (Keeling) Islands','0','','2020-10-20 19:02:24');
INSERT INTO countries VALUES('293','CO','Colombia','0','','2020-10-20 19:02:21');
INSERT INTO countries VALUES('294','KM','Comoros','0','','2020-10-20 19:02:21');
INSERT INTO countries VALUES('295','CG','Congo','0','','2020-10-20 19:02:20');
INSERT INTO countries VALUES('296','CK','Cook Islands','0','','2020-10-20 19:02:19');


DROP TABLE IF EXISTS coupon_usages;

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coupon_usages VALUES('1','24','1','2020-09-08 21:16:39','2020-09-08 21:16:39');
INSERT INTO coupon_usages VALUES('2','23','2','2020-11-06 16:41:57','2020-11-06 16:41:57');
INSERT INTO coupon_usages VALUES('3','23','4','2020-11-09 09:44:29','2020-11-09 09:44:29');
INSERT INTO coupon_usages VALUES('4','112','4','2020-11-10 20:02:47','2020-11-10 20:02:47');
INSERT INTO coupon_usages VALUES('5','153','2','2020-11-28 03:03:29','2020-11-28 03:03:29');
INSERT INTO coupon_usages VALUES('6','230','8','2022-01-04 14:45:52','2022-01-04 14:45:52');
INSERT INTO coupon_usages VALUES('7','237','8','2022-01-07 15:15:12','2022-01-07 15:15:12');
INSERT INTO coupon_usages VALUES('9','276','9','2022-04-22 14:38:30','2022-04-22 14:38:30');


DROP TABLE IF EXISTS coupons;

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `new_customer` int(6) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `added_by` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coupons VALUES('1','cart_base','covid19','{"min_buy":"1000","max_discount":"10000"}','0','50','amount','1650305700','1651688100','241','1','2020-06-04 01:21:37','2022-04-19 10:06:52');
INSERT INTO coupons VALUES('2','product_base','CLOSETNEPAL','[{"category_id":"8","subcategory_id":"21","subsubcategory_id":"78","product_id":"111"}]','0','100','amount','1604620800','1606694400','','','2020-11-06 16:40:21','2020-11-06 16:40:21');
INSERT INTO coupons VALUES('3','product_base','CLOSET20','[{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"85"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"90"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"91"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"92"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"93"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"94"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"95"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"96"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"97"},{"category_id":"4","subcategory_id":"79","subsubcategory_id":"88","product_id":"100"}]','0','100','amount','1604620800','1606694400','','','2020-11-06 18:13:59','2020-11-06 18:13:59');
INSERT INTO coupons VALUES('4','product_base','DISH','[{"category_id":"7","subcategory_id":"68","subsubcategory_id":"83","product_id":"101"}]','0','50','amount','1604707200','1606694400','','','2020-11-07 06:40:45','2020-11-07 06:40:45');
INSERT INTO coupons VALUES('5','product_base','STEAM','[{"category_id":"6","subcategory_id":"48","subsubcategory_id":"72","product_id":"105"}]','0','100','amount','1604707200','1606694400','','','2020-11-07 06:57:18','2020-11-07 06:57:18');
INSERT INTO coupons VALUES('6','product_base','HOT','[{"category_id":"6","subcategory_id":"50","subsubcategory_id":"37","product_id":"116"}]','0','50','amount','1604707200','1606694400','','','2020-11-07 08:04:55','2020-11-07 08:45:25');
INSERT INTO coupons VALUES('8','product_base','test','[{"category_id":"4","subcategory_id":"29","subsubcategory_id":"94","product_id":"147"}]','0','50','percent','1647388800','1647993600','241','1','2022-01-04 14:38:41','2022-03-16 09:54:53');
INSERT INTO coupons VALUES('9','cart_base','hello','{"min_buy":"100","max_discount":"1000"}','0','100','amount','1650564900','1651515300','241','admin','2022-04-22 14:36:28','2022-04-22 14:36:28');


DROP TABLE IF EXISTS currencies;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO currencies VALUES('1','U.S. Dollar','$','1','0','USD','2018-10-09 17:20:08','2020-06-04 16:52:57');
INSERT INTO currencies VALUES('2','Australian Dollar','$','1.28','0','AUD','2018-10-09 17:20:08','2020-06-04 16:52:58');
INSERT INTO currencies VALUES('5','Brazilian Real','R$','3.25','0','BRL','2018-10-09 17:20:08','2020-06-04 16:52:59');
INSERT INTO currencies VALUES('6','Canadian Dollar','$','1.27','0','CAD','2018-10-09 17:20:08','2020-06-04 16:53:00');
INSERT INTO currencies VALUES('7','Czech Koruna','Kč','20.65','0','CZK','2018-10-09 17:20:08','2020-06-04 16:53:01');
INSERT INTO currencies VALUES('8','Danish Krone','kr','6.05','0','DKK','2018-10-09 17:20:08','2020-06-04 16:53:01');
INSERT INTO currencies VALUES('9','Euro','€','0.85','0','EUR','2018-10-09 17:20:08','2020-06-04 16:53:03');
INSERT INTO currencies VALUES('10','Hong Kong Dollar','$','7.83','0','HKD','2018-10-09 17:20:08','2020-06-04 16:53:04');
INSERT INTO currencies VALUES('11','Hungarian Forint','Ft','255.24','0','HUF','2018-10-09 17:20:08','2020-06-04 16:53:05');
INSERT INTO currencies VALUES('12','Israeli New Sheqel','₪','3.48','0','ILS','2018-10-09 17:20:08','2020-06-04 16:53:07');
INSERT INTO currencies VALUES('13','Japanese Yen','¥','107.12','0','JPY','2018-10-09 17:20:08','2020-06-04 16:53:26');
INSERT INTO currencies VALUES('14','Malaysian Ringgit','RM','3.91','0','MYR','2018-10-09 17:20:08','2020-06-04 16:53:21');
INSERT INTO currencies VALUES('15','Mexican Peso','$','18.72','0','MXN','2018-10-09 17:20:08','2020-06-04 16:53:20');
INSERT INTO currencies VALUES('16','Norwegian Krone','kr','7.83','0','NOK','2018-10-09 17:20:08','2020-06-04 16:53:19');
INSERT INTO currencies VALUES('17','New Zealand Dollar','$','1.38','0','NZD','2018-10-09 17:20:08','2020-06-04 16:53:17');
INSERT INTO currencies VALUES('18','Philippine Peso','₱','52.26','0','PHP','2018-10-09 17:20:08','2020-06-04 16:53:15');
INSERT INTO currencies VALUES('19','Polish Zloty','zł','3.39','0','PLN','2018-10-09 17:20:08','2020-06-04 16:53:14');
INSERT INTO currencies VALUES('20','Pound Sterling','£','0.72','0','GBP','2018-10-09 17:20:08','2020-06-04 16:53:13');
INSERT INTO currencies VALUES('21','Russian Ruble','руб','55.93','0','RUB','2018-10-09 17:20:08','2020-06-04 16:53:12');
INSERT INTO currencies VALUES('22','Singapore Dollar','$','1.32','0','SGD','2018-10-09 17:20:08','2020-06-04 16:53:11');
INSERT INTO currencies VALUES('23','Swedish Krona','kr','8.19','0','SEK','2018-10-09 17:20:08','2020-06-04 16:53:31');
INSERT INTO currencies VALUES('24','Swiss Franc','CHF','0.94','0','CHF','2018-10-09 17:20:08','2020-06-04 16:53:32');
INSERT INTO currencies VALUES('26','Thai Baht','฿','31.39','0','THB','2018-10-09 17:20:08','2020-06-04 16:53:33');
INSERT INTO currencies VALUES('27','Taka','৳','84','0','BDT','2018-10-09 17:20:08','2020-06-04 16:53:34');
INSERT INTO currencies VALUES('28','Indian Rupee','Rs','68.45','0','Rupee','2019-07-07 16:18:46','2020-06-04 16:53:35');
INSERT INTO currencies VALUES('29','Nepalese rupee','Rs','120','1','NPR','2020-06-03 19:58:31','2020-06-03 19:58:52');


DROP TABLE IF EXISTS customer_packages;

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(28,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customer_packages VALUES('1','free','0','8','uploads/customer_package/ctdXkwgHCE94WUefStaIEHBHmZsRRRI8XKTiyeWS.png','2020-06-04 00:26:55','2022-01-04 13:53:52');
INSERT INTO customer_packages VALUES('2','Silver','800','15','uploads/customer_package/y7lI9K9H88xFzxL7V3OiCe2TToGAvvMYeq8V1Lgj.png','2020-06-04 00:27:58','2022-01-04 13:54:02');
INSERT INTO customer_packages VALUES('3','Gold','1200','20','uploads/customer_package/hmlhYy43RMaVpx5JKEulbYY8cvgJnPZa2ReKEVmU.png','2020-06-04 00:28:29','2020-06-04 00:28:29');
INSERT INTO customer_packages VALUES('4','Platinum','1500','30','uploads/customer_package/pPnPWvk4YEQXGUuUj4nCthWI9oj0FWgENZJ5Purl.png','2020-06-04 00:29:06','2020-06-04 00:29:06');


DROP TABLE IF EXISTS customer_products;

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(28,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customer_products VALUES('9','testanother','1','1','seller','3','1','30','','','["uploads\/customer_products\/photos\/hBhIs9M3kCevZRc9ZyCC9jA5B3SFQsdfNZEeBSnW.jpg"]','uploads/customer_products/thumbnail/eVN3llZmLjOBKNvMna436hrMmXLzeWylu5uPKFK0.jpg','new','bhaktapur','youtube','','piece','pant,test','<p>sadadasdasdasdasdsa</p><p>asdasdasdadsadsa<br></p>','1499.99','','','uploads/customer_products/meta/lojMBcpwgPzLzNx9tgzVnCrFGzB5VWDYYrVkTEYF.jpg','','testanother-7rmr8','2022-01-04 13:26:13','2022-01-28 15:20:56');
INSERT INTO customer_products VALUES('11','tests','1','1','customer','237','1','30','','','["uploads\/customer_products\/photos\/wtFnQQJsIHzkXB1FPfCBdm6twNTIfO0rGCod21WD.png"]','uploads/customer_products/thumbnail/6KcALsf5v6uOTk6uB53ndNTjxOmjcaFOlB0Fz5cw.png','new','sadsadas','youtube','','piece','sad','<p>sadasdas</p><p>sadasdsa</p><p>dasdasdsa</p><p>saddsad</p><p>s<br></p>','800','','','uploads/customer_products/meta/aGgwmrMTeuVr9nO9ylj3FqiYdndQhLUlKOPIjF0Z.png','','tests-xaovz','2022-01-04 15:32:55','2022-01-04 15:34:46');


DROP TABLE IF EXISTS customers;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers VALUES('4','8','2019-08-01 16:20:09','2019-08-01 16:20:09');
INSERT INTO customers VALUES('5','21','2020-06-06 15:30:25','2020-06-06 15:30:25');
INSERT INTO customers VALUES('6','23','2020-06-30 10:17:56','2020-06-30 10:17:56');
INSERT INTO customers VALUES('7','24','2020-07-01 09:15:38','2020-07-01 09:15:38');
INSERT INTO customers VALUES('9','26','2020-07-01 09:37:15','2020-07-01 09:37:15');
INSERT INTO customers VALUES('10','30','2020-07-02 19:13:36','2020-07-02 19:13:36');
INSERT INTO customers VALUES('11','32','2020-07-11 20:14:10','2020-07-11 20:14:10');
INSERT INTO customers VALUES('12','33','2020-07-13 21:23:15','2020-07-13 21:23:15');
INSERT INTO customers VALUES('13','34','2020-07-16 18:50:43','2020-07-16 18:50:43');
INSERT INTO customers VALUES('15','37','2020-07-21 14:47:27','2020-07-21 14:47:27');
INSERT INTO customers VALUES('16','38','2020-07-22 01:21:35','2020-07-22 01:21:35');
INSERT INTO customers VALUES('17','39','2020-07-22 11:22:32','2020-07-22 11:22:32');
INSERT INTO customers VALUES('19','41','2020-07-23 15:50:09','2020-07-23 15:50:09');
INSERT INTO customers VALUES('20','42','2020-07-23 19:52:00','2020-07-23 19:52:00');
INSERT INTO customers VALUES('22','44','2020-07-28 04:41:22','2020-07-28 04:41:22');
INSERT INTO customers VALUES('23','45','2020-07-28 05:04:32','2020-07-28 05:04:32');
INSERT INTO customers VALUES('24','46','2020-07-28 10:45:16','2020-07-28 10:45:16');
INSERT INTO customers VALUES('25','47','2020-07-30 10:54:51','2020-07-30 10:54:51');
INSERT INTO customers VALUES('26','48','2020-07-30 11:38:09','2020-07-30 11:38:09');
INSERT INTO customers VALUES('27','49','2020-07-31 12:06:30','2020-07-31 12:06:30');
INSERT INTO customers VALUES('28','50','2020-08-07 14:46:27','2020-08-07 14:46:27');
INSERT INTO customers VALUES('29','51','2020-08-10 12:29:53','2020-08-10 12:29:53');
INSERT INTO customers VALUES('30','52','2020-08-14 18:53:34','2020-08-14 18:53:34');
INSERT INTO customers VALUES('31','53','2020-08-15 07:09:28','2020-08-15 07:09:28');
INSERT INTO customers VALUES('32','54','2020-08-16 09:02:45','2020-08-16 09:02:45');
INSERT INTO customers VALUES('33','55','2020-08-19 07:12:46','2020-08-19 07:12:46');
INSERT INTO customers VALUES('34','56','2020-08-19 19:50:35','2020-08-19 19:50:35');
INSERT INTO customers VALUES('35','57','2020-08-20 22:58:50','2020-08-20 22:58:50');
INSERT INTO customers VALUES('36','58','2020-09-02 10:03:55','2020-09-02 10:03:55');
INSERT INTO customers VALUES('37','59','2020-09-06 09:51:43','2020-09-06 09:51:43');
INSERT INTO customers VALUES('38','60','2020-09-06 10:07:01','2020-09-06 10:07:01');
INSERT INTO customers VALUES('39','61','2020-09-06 10:08:06','2020-09-06 10:08:06');
INSERT INTO customers VALUES('40','62','2020-09-06 10:33:20','2020-09-06 10:33:20');
INSERT INTO customers VALUES('41','63','2020-09-06 12:07:35','2020-09-06 12:07:35');
INSERT INTO customers VALUES('42','65','2020-09-08 22:19:03','2020-09-08 22:19:03');
INSERT INTO customers VALUES('47','70','2020-09-10 14:23:31','2020-09-10 14:23:31');
INSERT INTO customers VALUES('48','71','2020-09-11 08:36:57','2020-09-11 08:36:57');
INSERT INTO customers VALUES('49','72','2020-09-11 09:10:45','2020-09-11 09:10:45');
INSERT INTO customers VALUES('51','74','2020-09-11 19:00:51','2020-09-11 19:00:51');
INSERT INTO customers VALUES('52','75','2020-09-12 21:04:16','2020-09-12 21:04:16');
INSERT INTO customers VALUES('53','76','2020-09-15 12:36:51','2020-09-15 12:36:51');
INSERT INTO customers VALUES('55','78','2020-09-27 17:50:20','2020-09-27 17:50:20');
INSERT INTO customers VALUES('57','80','2020-09-30 10:49:23','2020-09-30 10:49:23');
INSERT INTO customers VALUES('58','81','2020-10-01 12:08:37','2020-10-01 12:08:37');
INSERT INTO customers VALUES('59','82','2020-10-01 15:29:44','2020-10-01 15:29:44');
INSERT INTO customers VALUES('60','83','2020-10-12 10:14:39','2020-10-12 10:14:39');
INSERT INTO customers VALUES('61','84','2020-10-16 12:02:11','2020-10-16 12:02:11');
INSERT INTO customers VALUES('62','85','2020-10-16 14:37:36','2020-10-16 14:37:36');
INSERT INTO customers VALUES('63','88','2020-10-19 18:55:14','2020-10-19 18:55:14');
INSERT INTO customers VALUES('64','89','2020-10-19 19:16:27','2020-10-19 19:16:27');
INSERT INTO customers VALUES('65','90','2020-10-20 09:41:39','2020-10-20 09:41:39');
INSERT INTO customers VALUES('66','91','2020-10-20 11:24:49','2020-10-20 11:24:49');
INSERT INTO customers VALUES('67','92','2020-10-20 12:14:11','2020-10-20 12:14:11');
INSERT INTO customers VALUES('68','93','2020-10-20 14:24:36','2020-10-20 14:24:36');
INSERT INTO customers VALUES('69','94','2020-10-20 15:38:19','2020-10-20 15:38:19');
INSERT INTO customers VALUES('70','95','2020-10-22 09:27:17','2020-10-22 09:27:17');
INSERT INTO customers VALUES('71','96','2020-10-23 04:39:02','2020-10-23 04:39:02');
INSERT INTO customers VALUES('73','98','2020-10-27 11:57:09','2020-10-27 11:57:09');
INSERT INTO customers VALUES('74','99','2020-10-29 21:23:50','2020-10-29 21:23:50');
INSERT INTO customers VALUES('75','100','2020-10-30 19:24:29','2020-10-30 19:24:29');
INSERT INTO customers VALUES('76','101','2020-11-01 17:18:32','2020-11-01 17:18:32');
INSERT INTO customers VALUES('77','102','2020-11-03 17:58:30','2020-11-03 17:58:30');
INSERT INTO customers VALUES('78','103','2020-11-04 14:52:04','2020-11-04 14:52:04');
INSERT INTO customers VALUES('79','104','2020-11-05 15:37:01','2020-11-05 15:37:01');
INSERT INTO customers VALUES('81','106','2020-11-06 15:54:25','2020-11-06 15:54:25');
INSERT INTO customers VALUES('82','107','2020-11-08 04:17:12','2020-11-08 04:17:12');
INSERT INTO customers VALUES('83','108','2020-11-08 09:34:42','2020-11-08 09:34:42');
INSERT INTO customers VALUES('84','109','2020-11-08 14:48:36','2020-11-08 14:48:36');
INSERT INTO customers VALUES('85','110','2020-11-09 06:42:14','2020-11-09 06:42:14');
INSERT INTO customers VALUES('86','111','2020-11-09 08:54:03','2020-11-09 08:54:03');
INSERT INTO customers VALUES('87','112','2020-11-10 04:35:43','2020-11-10 04:35:43');
INSERT INTO customers VALUES('88','113','2020-11-10 06:19:13','2020-11-10 06:19:13');
INSERT INTO customers VALUES('89','114','2020-11-10 07:25:52','2020-11-10 07:25:52');
INSERT INTO customers VALUES('90','115','2020-11-10 12:24:47','2020-11-10 12:24:47');
INSERT INTO customers VALUES('91','116','2020-11-10 14:45:40','2020-11-10 14:45:40');
INSERT INTO customers VALUES('92','117','2020-11-11 10:31:59','2020-11-11 10:31:59');
INSERT INTO customers VALUES('93','118','2020-11-11 14:43:27','2020-11-11 14:43:27');
INSERT INTO customers VALUES('94','119','2020-11-11 21:57:06','2020-11-11 21:57:06');
INSERT INTO customers VALUES('95','120','2020-11-13 12:01:08','2020-11-13 12:01:08');
INSERT INTO customers VALUES('96','121','2020-11-13 14:13:37','2020-11-13 14:13:37');
INSERT INTO customers VALUES('97','122','2020-11-14 05:50:16','2020-11-14 05:50:16');
INSERT INTO customers VALUES('98','123','2020-11-18 09:24:41','2020-11-18 09:24:41');
INSERT INTO customers VALUES('99','124','2020-11-18 10:27:47','2020-11-18 10:27:47');
INSERT INTO customers VALUES('100','125','2020-11-18 11:29:43','2020-11-18 11:29:43');
INSERT INTO customers VALUES('101','126','2020-11-18 17:02:43','2020-11-18 17:02:43');
INSERT INTO customers VALUES('102','127','2020-11-18 23:34:41','2020-11-18 23:34:41');
INSERT INTO customers VALUES('103','128','2020-11-19 01:36:33','2020-11-19 01:36:33');
INSERT INTO customers VALUES('104','129','2020-11-19 02:05:31','2020-11-19 02:05:31');
INSERT INTO customers VALUES('105','130','2020-11-19 11:48:47','2020-11-19 11:48:47');
INSERT INTO customers VALUES('106','131','2020-11-19 19:36:55','2020-11-19 19:36:55');
INSERT INTO customers VALUES('107','132','2020-11-20 06:33:20','2020-11-20 06:33:20');
INSERT INTO customers VALUES('108','134','2020-11-21 06:36:21','2020-11-21 06:36:21');
INSERT INTO customers VALUES('109','135','2020-11-21 08:25:56','2020-11-21 08:25:56');
INSERT INTO customers VALUES('110','137','2020-11-21 20:05:23','2020-11-21 20:05:23');
INSERT INTO customers VALUES('111','138','2020-11-21 22:52:44','2020-11-21 22:52:44');
INSERT INTO customers VALUES('112','139','2020-11-23 15:23:16','2020-11-23 15:23:16');
INSERT INTO customers VALUES('113','140','2020-11-24 10:18:36','2020-11-24 10:18:36');
INSERT INTO customers VALUES('114','141','2020-11-24 17:27:49','2020-11-24 17:27:49');
INSERT INTO customers VALUES('115','143','2020-11-24 18:29:50','2020-11-24 18:29:50');
INSERT INTO customers VALUES('117','145','2020-11-25 12:19:52','2020-11-25 12:19:52');
INSERT INTO customers VALUES('118','146','2020-11-25 12:22:18','2020-11-25 12:22:18');
INSERT INTO customers VALUES('119','147','2020-11-25 16:55:16','2020-11-25 16:55:16');
INSERT INTO customers VALUES('120','148','2020-11-26 06:48:58','2020-11-26 06:48:58');
INSERT INTO customers VALUES('121','149','2020-11-26 19:19:13','2020-11-26 19:19:13');
INSERT INTO customers VALUES('122','150','2020-11-26 19:21:34','2020-11-26 19:21:34');
INSERT INTO customers VALUES('123','151','2020-11-26 22:16:57','2020-11-26 22:16:57');
INSERT INTO customers VALUES('124','152','2020-11-27 07:21:41','2020-11-27 07:21:41');
INSERT INTO customers VALUES('125','153','2020-11-28 02:57:45','2020-11-28 02:57:45');
INSERT INTO customers VALUES('126','154','2020-11-28 19:50:23','2020-11-28 19:50:23');
INSERT INTO customers VALUES('127','155','2020-11-29 12:06:24','2020-11-29 12:06:24');
INSERT INTO customers VALUES('128','156','2020-11-30 08:40:14','2020-11-30 08:40:14');
INSERT INTO customers VALUES('129','157','2020-11-30 22:51:33','2020-11-30 22:51:33');
INSERT INTO customers VALUES('130','158','2020-12-01 19:14:42','2020-12-01 19:14:42');
INSERT INTO customers VALUES('131','159','2020-12-03 13:54:24','2020-12-03 13:54:24');
INSERT INTO customers VALUES('132','160','2020-12-04 09:57:29','2020-12-04 09:57:29');
INSERT INTO customers VALUES('133','161','2020-12-05 10:21:58','2020-12-05 10:21:58');
INSERT INTO customers VALUES('134','162','2020-12-05 12:25:50','2020-12-05 12:25:50');
INSERT INTO customers VALUES('135','163','2020-12-05 18:57:44','2020-12-05 18:57:44');
INSERT INTO customers VALUES('136','164','2020-12-06 16:20:10','2020-12-06 16:20:10');
INSERT INTO customers VALUES('137','165','2020-12-06 19:09:53','2020-12-06 19:09:53');
INSERT INTO customers VALUES('138','166','2020-12-06 22:07:58','2020-12-06 22:07:58');
INSERT INTO customers VALUES('139','167','2020-12-07 06:15:06','2020-12-07 06:15:06');
INSERT INTO customers VALUES('140','168','2020-12-07 08:59:06','2020-12-07 08:59:06');
INSERT INTO customers VALUES('141','169','2020-12-07 15:02:40','2020-12-07 15:02:40');
INSERT INTO customers VALUES('142','170','2020-12-07 16:05:32','2020-12-07 16:05:32');
INSERT INTO customers VALUES('143','171','2020-12-07 16:19:31','2020-12-07 16:19:31');
INSERT INTO customers VALUES('144','172','2020-12-07 17:02:47','2020-12-07 17:02:47');
INSERT INTO customers VALUES('145','173','2020-12-07 19:07:12','2020-12-07 19:07:12');
INSERT INTO customers VALUES('146','174','2020-12-08 06:26:16','2020-12-08 06:26:16');
INSERT INTO customers VALUES('147','175','2020-12-08 06:52:50','2020-12-08 06:52:50');
INSERT INTO customers VALUES('148','176','2020-12-08 11:16:30','2020-12-08 11:16:30');
INSERT INTO customers VALUES('149','177','2020-12-08 16:24:50','2020-12-08 16:24:50');
INSERT INTO customers VALUES('150','178','2020-12-08 17:31:12','2020-12-08 17:31:12');
INSERT INTO customers VALUES('151','179','2020-12-08 18:33:37','2020-12-08 18:33:37');
INSERT INTO customers VALUES('152','180','2020-12-09 09:39:20','2020-12-09 09:39:20');
INSERT INTO customers VALUES('153','181','2020-12-09 11:03:33','2020-12-09 11:03:33');
INSERT INTO customers VALUES('154','182','2020-12-10 09:30:52','2020-12-10 09:30:52');
INSERT INTO customers VALUES('155','183','2020-12-10 18:37:59','2020-12-10 18:37:59');
INSERT INTO customers VALUES('156','184','2020-12-10 20:03:10','2020-12-10 20:03:10');
INSERT INTO customers VALUES('157','185','2020-12-11 06:59:29','2020-12-11 06:59:29');
INSERT INTO customers VALUES('158','186','2020-12-12 07:02:28','2020-12-12 07:02:28');
INSERT INTO customers VALUES('159','187','2020-12-12 17:41:18','2020-12-12 17:41:18');
INSERT INTO customers VALUES('160','188','2020-12-12 21:28:49','2020-12-12 21:28:49');
INSERT INTO customers VALUES('161','189','2020-12-13 06:28:05','2020-12-13 06:28:05');
INSERT INTO customers VALUES('162','190','2020-12-28 05:47:54','2020-12-28 05:47:54');
INSERT INTO customers VALUES('163','191','2021-01-13 18:36:17','2021-01-13 18:36:17');
INSERT INTO customers VALUES('164','192','2021-01-18 08:53:29','2021-01-18 08:53:29');
INSERT INTO customers VALUES('165','193','2021-01-30 21:52:39','2021-01-30 21:52:39');
INSERT INTO customers VALUES('166','194','2021-02-09 02:25:39','2021-02-09 02:25:39');
INSERT INTO customers VALUES('167','195','2021-02-19 15:25:04','2021-02-19 15:25:04');
INSERT INTO customers VALUES('168','196','2021-02-20 13:55:56','2021-02-20 13:55:56');
INSERT INTO customers VALUES('169','197','2021-03-01 20:42:11','2021-03-01 20:42:11');
INSERT INTO customers VALUES('170','198','2021-03-13 06:54:09','2021-03-13 06:54:09');
INSERT INTO customers VALUES('171','199','2021-03-23 01:05:02','2021-03-23 01:05:02');
INSERT INTO customers VALUES('172','200','2021-04-27 07:18:23','2021-04-27 07:18:23');
INSERT INTO customers VALUES('173','201','2021-05-06 06:28:25','2021-05-06 06:28:25');
INSERT INTO customers VALUES('174','203','2021-07-29 19:27:43','2021-07-29 19:27:43');
INSERT INTO customers VALUES('181','213','2021-12-08 11:39:37','2021-12-08 11:39:37');
INSERT INTO customers VALUES('195','230','2021-12-14 05:00:01','2021-12-14 05:00:01');
INSERT INTO customers VALUES('200','237','2022-01-03 14:55:35','2022-01-03 14:55:35');
INSERT INTO customers VALUES('203','240','2022-01-04 15:00:31','2022-01-04 15:00:31');
INSERT INTO customers VALUES('204','242','2022-01-05 09:56:20','2022-01-05 09:56:20');
INSERT INTO customers VALUES('205','244','2022-01-19 21:12:15','2022-01-19 21:12:15');
INSERT INTO customers VALUES('206','245','2022-01-20 14:32:56','2022-01-20 14:32:56');
INSERT INTO customers VALUES('207','246','2022-02-01 10:24:08','2022-02-01 10:24:08');
INSERT INTO customers VALUES('208','247','2022-02-14 05:42:16','2022-02-14 05:42:16');
INSERT INTO customers VALUES('209','248','2022-02-14 05:44:04','2022-02-14 05:44:04');
INSERT INTO customers VALUES('210','249','2022-02-14 05:45:05','2022-02-14 05:45:05');
INSERT INTO customers VALUES('211','251','2022-03-21 15:09:15','2022-03-21 15:09:15');
INSERT INTO customers VALUES('212','252','2022-03-24 21:38:52','2022-03-24 21:38:52');
INSERT INTO customers VALUES('213','253','2022-03-27 19:10:51','2022-03-27 19:10:51');
INSERT INTO customers VALUES('214','254','2022-03-28 09:19:45','2022-03-28 09:19:45');
INSERT INTO customers VALUES('215','255','2022-03-28 12:10:01','2022-03-28 12:10:01');
INSERT INTO customers VALUES('216','257','2022-03-31 10:05:54','2022-03-31 10:05:54');
INSERT INTO customers VALUES('217','258','2022-03-31 11:27:32','2022-03-31 11:27:32');
INSERT INTO customers VALUES('218','260','2022-04-03 17:19:09','2022-04-03 17:19:09');
INSERT INTO customers VALUES('219','261','2022-04-03 17:26:30','2022-04-03 17:26:30');
INSERT INTO customers VALUES('220','262','2022-04-03 17:28:02','2022-04-03 17:28:02');
INSERT INTO customers VALUES('221','263','2022-04-03 17:28:33','2022-04-03 17:28:33');
INSERT INTO customers VALUES('222','264','2022-04-03 17:29:07','2022-04-03 17:29:07');
INSERT INTO customers VALUES('223','265','2022-04-03 17:30:18','2022-04-03 17:30:18');
INSERT INTO customers VALUES('224','266','2022-04-04 07:33:58','2022-04-04 07:33:58');
INSERT INTO customers VALUES('225','267','2022-04-04 07:39:41','2022-04-04 07:39:41');
INSERT INTO customers VALUES('226','268','2022-04-04 08:01:28','2022-04-04 08:01:28');
INSERT INTO customers VALUES('227','269','2022-04-04 12:22:14','2022-04-04 12:22:14');
INSERT INTO customers VALUES('228','271','2022-04-18 12:00:24','2022-04-18 12:00:24');


DROP TABLE IF EXISTS delivery_boys;

CREATE TABLE `delivery_boys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) DEFAULT 1,
  `availability_status` tinyint(4) DEFAULT 1,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vechile_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vechile_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vechile_registration_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vechile_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driving_license_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vechile_rc_book_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gpay_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO delivery_boys VALUES('1','Amar','','Singh','amarsingh@gmail.com','9800000000','1643355148.png','1996-05-15','A+','5','$2y$10$ULGBBcY0UJXaKedJiOk7Xe8Ju6d3ziJ/.z79EZQa0q4QIrGGp3RGG','1','1','harisiddhi','Dhapakhel','154','3','56600','Pulsar','Amar Singh','Red','457874554','','1643355148.png','1643355148.jpeg','','','','','','','2022-01-28 07:32:28','2022-01-28 07:32:28');


DROP TABLE IF EXISTS failed_jobs;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS faqs;

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `published` int(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO faqs VALUES('1','asdf22','asdf22','1','2022-04-14 18:31:09','2022-04-15 04:30:33');
INSERT INTO faqs VALUES('3','zxc','<em>zxc</em>','1','2022-04-14 19:34:04','2022-04-14 19:34:04');


DROP TABLE IF EXISTS flash_deal_products;

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO flash_deal_products VALUES('18','1','2','0','amount','2020-06-07 01:05:02','2020-06-07 01:05:02');
INSERT INTO flash_deal_products VALUES('73','2','13','0','amount','2020-08-24 10:33:57','2020-08-24 10:33:57');
INSERT INTO flash_deal_products VALUES('74','2','14','0','amount','2020-08-24 10:33:57','2020-08-24 10:33:57');
INSERT INTO flash_deal_products VALUES('75','2','16','0','amount','2020-08-24 10:33:57','2020-08-24 10:33:57');
INSERT INTO flash_deal_products VALUES('76','2','17','0','amount','2020-08-24 10:33:57','2020-08-24 10:33:57');
INSERT INTO flash_deal_products VALUES('77','2','38','20','percent','2020-08-24 10:33:57','2020-08-24 10:33:57');
INSERT INTO flash_deal_products VALUES('78','2','41','360','amount','2020-08-24 10:33:57','2020-08-24 10:33:57');
INSERT INTO flash_deal_products VALUES('80','3','58','0','amount','2020-10-18 13:24:04','2020-10-18 13:24:04');
INSERT INTO flash_deal_products VALUES('96','4','19','0','amount','2022-01-03 15:18:51','2022-01-03 15:18:51');
INSERT INTO flash_deal_products VALUES('97','4','26','0','amount','2022-01-03 15:18:51','2022-01-03 15:18:51');
INSERT INTO flash_deal_products VALUES('98','4','32','250','amount','2022-01-03 15:18:51','2022-01-03 15:18:51');
INSERT INTO flash_deal_products VALUES('101','5','20','10','amount','2022-01-03 15:19:41','2022-01-03 15:19:41');
INSERT INTO flash_deal_products VALUES('102','5','28','0','amount','2022-01-03 15:19:41','2022-01-03 15:19:41');
INSERT INTO flash_deal_products VALUES('103','5','32','250','amount','2022-01-03 15:19:41','2022-01-03 15:19:41');
INSERT INTO flash_deal_products VALUES('104','6','29','0','amount','2022-01-03 15:20:33','2022-01-03 15:20:33');
INSERT INTO flash_deal_products VALUES('153','7','118','0','amount','2022-02-01 13:34:17','2022-02-01 13:34:17');
INSERT INTO flash_deal_products VALUES('154','7','127','0','amount','2022-02-01 13:34:17','2022-02-01 13:34:17');
INSERT INTO flash_deal_products VALUES('155','7','137','0','amount','2022-02-01 13:34:17','2022-02-01 13:34:17');
INSERT INTO flash_deal_products VALUES('156','7','138','0','amount','2022-02-01 13:34:17','2022-02-01 13:34:17');
INSERT INTO flash_deal_products VALUES('157','7','146','0','amount','2022-02-01 13:34:17','2022-02-01 13:34:17');
INSERT INTO flash_deal_products VALUES('169','9','78','700','amount','2022-04-15 05:03:59','2022-04-15 05:03:59');
INSERT INTO flash_deal_products VALUES('220','8','71','500','amount','2022-04-24 00:17:36','2022-04-24 00:17:36');
INSERT INTO flash_deal_products VALUES('221','8','88','500','amount','2022-04-24 00:17:36','2022-04-24 00:17:36');
INSERT INTO flash_deal_products VALUES('222','8','118','450','amount','2022-04-24 00:17:36','2022-04-24 00:17:36');
INSERT INTO flash_deal_products VALUES('223','8','119','450','amount','2022-04-24 00:17:36','2022-04-24 00:17:36');
INSERT INTO flash_deal_products VALUES('224','8','126','0','amount','2022-04-24 00:17:36','2022-04-24 00:17:36');
INSERT INTO flash_deal_products VALUES('225','8','140','5','percent','2022-04-24 00:17:36','2022-04-24 00:17:36');


DROP TABLE IF EXISTS flash_deals;

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO flash_deals VALUES('1','summer rose Party Dancing casual Dress Girl Christmas Pageant','1591488000','1594080000','0','0','#fff','white','uploads/offers/banner/XXyZLB7lecCvGen6avrMxsrgt4rVsCJIcQz8EQX1.jpeg','summer-rose-party-dancing-casual-dress-girl-christmas-pageant-rds2v','2020-06-07 00:24:13','2022-01-03 15:20:20');
INSERT INTO flash_deals VALUES('2','Party Dancing casual Dress Girl Christmas Pageant','1596240000','1601424000','0','0','#ffc300','white','uploads/offers/banner/IPsOFwq8KnzzyNWk8dPuioSxhlHdunS2AaTYHQxh.jpeg','party-dancing-casual-dress-girl-christmas-pageant-lwyyx','2020-06-07 00:30:26','2022-01-03 15:20:14');
INSERT INTO flash_deals VALUES('3','d','0','0','0','0','#FFFFFF','white','uploads/offers/banner/4pt6ha2NbMBjZCkEJDBjo3u3jm7MkyQIISCdqpW0.jpeg','d-gla8u','2020-10-18 13:20:58','2022-01-03 15:20:12');
INSERT INTO flash_deals VALUES('4','khatra jutta','1641168000','1641427200','0','0','#FFFFFF','white','uploads/offers/banner/qp863xbejAuVEWRENoRgiCwMys7M78nceAyR2kkK.jpeg','khatra-jutta-qvemc','2020-10-18 13:35:49','2022-01-03 15:20:11');
INSERT INTO flash_deals VALUES('5','test','1641168000','1641945600','0','0','#fff','white','uploads/offers/banner/0ixqlpIvRIqgjHkrvSPgYxhcvmIpp91dnc1rzFIM.jpg','test-jbuwq','2022-01-03 14:57:09','2022-02-18 11:17:05');
INSERT INTO flash_deals VALUES('6','Cofee','1641168000','1641340800','0','0','#FFFFFF','white','uploads/offers/banner/cWZx9ZbK20b5akUKFFFoEQoUntmTfperjtbmXNls.jpg','cofee-dq9cc','2022-01-03 15:20:33','2022-02-18 11:17:05');
INSERT INTO flash_deals VALUES('7','featured flash deal','0','1644019200','0','0','blue','dark','uploads/offers/banner/wZmt4dxFPDzXbSfmkr5UOkbaKonDqZJGlSJdIaER.jpg','ila-richmond-bgz5d','2022-01-04 11:59:58','2022-02-11 06:56:32');
INSERT INTO flash_deals VALUES('8','Bru','1650154500','1651299300','1','1','#FFFFFF','white','uploads/offers/banner/laPj78GgxFi5vx9x05MA3uhpjCEE8nT0UQEvrWw0.png','bru-me8d2','2022-02-11 06:57:20','2022-04-24 00:17:36');
INSERT INTO flash_deals VALUES('9','q','1649980800','1650127680','0','0','q','white','','q-2yhx5','2022-04-15 05:03:59','2022-04-15 05:03:59');


DROP TABLE IF EXISTS general_settings;

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pop_img` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pop_status` int(11) NOT NULL DEFAULT 0,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO general_settings VALUES('1','uploads/banners/LdhryUWqq849jWzEAlv1s1kv9pLbIWMRuYLWuxXj.png','0','48','uploads/logo/O1ei4rBQrNnQbphOLS6JJfmbl4ankLwVRQJGq9tv.jpg','uploads/logo/O1ei4rBQrNnQbphOLS6JJfmbl4ankLwVRQJGq9tv.jpg','uploads/logo/O1ei4rBQrNnQbphOLS6JJfmbl4ankLwVRQJGq9tv.jpg','uploads/logo/O1ei4rBQrNnQbphOLS6JJfmbl4ankLwVRQJGq9tv.jpg','uploads/logo/O1ei4rBQrNnQbphOLS6JJfmbl4ankLwVRQJGq9tv.jpg','Sewa Express','Kathmandu','Be a member of Sewa family and get exciting products at exciting prices.','9863667252','info@sewa.com','https://www.facebook.com/sewa','https://www.instagram.com/','https://www.twitter.com/','https://www.youtube.com/channel/','https://www.googleplus.com','2022-12-11 19:38:10','2022-12-11 19:38:10');


DROP TABLE IF EXISTS home_categories;

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO home_categories VALUES('1','7','null','1','2019-03-12 12:23:23','2022-04-04 09:49:36');
INSERT INTO home_categories VALUES('2','2','["10"]','1','2019-03-12 12:29:54','2022-03-27 09:21:45');
INSERT INTO home_categories VALUES('3','1','null','1','2020-07-30 14:35:02','2022-01-04 11:41:19');
INSERT INTO home_categories VALUES('4','3','null','1','2020-08-01 12:39:16','2022-03-27 09:21:46');
INSERT INTO home_categories VALUES('5','4','null','1','2020-08-01 12:39:29','2022-01-04 13:06:15');
INSERT INTO home_categories VALUES('7','6','null','1','2020-08-01 12:39:49','2022-03-27 09:21:47');
INSERT INTO home_categories VALUES('8','8','null','1','2020-08-01 12:40:23','2022-03-27 09:21:48');
INSERT INTO home_categories VALUES('10','16','null','1','2022-03-30 09:21:39','2022-03-30 09:21:39');
INSERT INTO home_categories VALUES('11','9','null','1','2022-04-04 09:33:16','2022-04-04 09:33:16');


DROP TABLE IF EXISTS jobs;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO jobs VALUES('1','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:23:\"piratemuniraj@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-11052035\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-11052035.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-11052035.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639480046','1639480046');
INSERT INTO jobs VALUES('2','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:18:\"plamsal6@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-11052035\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-11052035.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-11052035.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639480046','1639480046');
INSERT INTO jobs VALUES('3','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:23:\"piratemuniraj@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-11203719\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-11203719.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-11203719.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639480964','1639480964');
INSERT INTO jobs VALUES('4','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:23:\"piratemuniraj@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-11332438\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-11332438.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-11332438.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639481737','1639481737');
INSERT INTO jobs VALUES('5','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:23:\"piratemuniraj@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-11482275\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-11482275.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-11482275.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639482626','1639482626');
INSERT INTO jobs VALUES('6','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:23:\"piratemuniraj@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-12000333\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-12000333.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-12000333.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639483327','1639483327');
INSERT INTO jobs VALUES('7','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":9:{s:5:\"email\";s:18:\"plamsal6@gmail.com\";s:5:\"array\";a:6:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-12000333\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-12000333.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-12000333.pdf\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639483327','1639483327');
INSERT INTO jobs VALUES('8','default','{"displayName":"App\\Jobs\\SendInvoiceEmail","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\Jobs\\SendInvoiceEmail","command":"O:25:\"App\\Jobs\\SendInvoiceEmail\":8:{s:5:\"array\";a:7:{s:4:\"view\";s:14:\"emails.invoice\";s:7:\"subject\";s:32:\"Order Placed - 20211214-12145981\";s:4:\"from\";s:27:\"muniraj.nextnepal@gmail.com\";s:7:\"content\";s:67:\"Hi. A new order has been placed. Please check the attached invoice.\";s:4:\"file\";s:66:\"E:\\NextNepal\\multiecom\\public\\invoices\/Order#20211214-12145981.pdf\";s:9:\"file_name\";s:27:\"Order#20211214-12145981.pdf\";s:5:\"email\";s:27:\"munirajrajbanshi5@gmail.com\";}s:6:\"\u0000*\u0000job\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:7:\"chained\";a:0:{}}"}}','0','','1639484224','1639484224');


DROP TABLE IF EXISTS languages;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO languages VALUES('1','English','en','0','2019-01-20 17:58:20','2020-08-11 21:44:10');
INSERT INTO languages VALUES('2','Nepali','np','0','2022-03-21 11:23:12','2022-03-22 14:36:06');


DROP TABLE IF EXISTS links;

CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO links VALUES('1','Warranty','#','2022-01-04 15:23:46','2022-01-04 14:23:46');
INSERT INTO links VALUES('2','Full Refund','#','2020-06-08 14:25:20','2020-06-08 14:25:20');
INSERT INTO links VALUES('3','Referral','#','2020-06-08 14:26:28','2020-06-08 14:26:28');
INSERT INTO links VALUES('4','Extra Link','#','2022-03-16 10:41:25','2022-03-16 09:41:25');


DROP TABLE IF EXISTS locations;

CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `district` bigint(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(8,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO locations VALUES('1','3','Thimi','shop online','20','','2022-04-17 07:55:50','2022-04-17 12:56:52');
INSERT INTO locations VALUES('2','2','Chabahil','shop online','10','','2022-04-17 07:56:07','2022-04-17 12:56:35');


DROP TABLE IF EXISTS manual_payment_methods;

CREATE TABLE `manual_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS messages;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

INSERT INTO messages VALUES('1','1','19','https://almandu.com/product/Johnson-Powder-aHjaH

Hello provider this is test msg','2020-06-04 16:40:14','2020-06-04 16:40:14');
INSERT INTO messages VALUES('2','1','12','can you please pay money for the prodcut','2020-06-04 16:45:43','2020-06-04 16:45:43');
INSERT INTO messages VALUES('3','2','24','Can I use for adults also?','2020-07-01 09:17:14','2020-07-01 09:17:14');
INSERT INTO messages VALUES('4','2','12','yes you can','2020-07-01 17:25:23','2020-07-01 17:25:23');
INSERT INTO messages VALUES('5','3','23','explain please','2020-07-08 06:32:10','2020-07-08 06:32:10');
INSERT INTO messages VALUES('6','3','27','Type on google','2020-07-08 06:33:22','2020-07-08 06:33:22');
INSERT INTO messages VALUES('7','4','23','https://closetnepal.com.np/product/Progemei-3-in-1-trimmer-KNVRa','2020-07-21 07:23:16','2020-07-21 07:23:16');
INSERT INTO messages VALUES('8','5','12','what is this','2020-09-10 14:37:19','2020-09-10 14:37:19');
INSERT INTO messages VALUES('9','6','12','https://closetnepal.com.np/product/Mens-Luggage-bag-crFLf
what is this','2020-09-10 14:38:00','2020-09-10 14:38:00');
INSERT INTO messages VALUES('10','7','12','https://closetnepal.com.np/product/Mens-Luggage-bag-crFLf','2020-09-10 14:40:01','2020-09-10 14:40:01');
INSERT INTO messages VALUES('11','8','148','I need a gaming mouse. Do you have them ?','2020-11-26 06:52:58','2020-11-26 06:52:58');
INSERT INTO messages VALUES('12','9','148','https://closetnepal.com.np/product/FrontTech-Multimeda-speaker21-channel-viiZC

How many speakers does it have ?','2020-11-26 06:53:32','2020-11-26 06:53:32');
INSERT INTO messages VALUES('13','10','77','https://smartbigmart.com/product/Pearl-Green-Tea-ACSSP

Stock Not available','2021-06-01 13:11:33','2021-06-01 13:11:33');
INSERT INTO messages VALUES('14','11','12','http://durbarmart.nextnepal.org/product/Hot-shaper-10mm-slim-belt-G6uW7','2022-01-03 15:34:33','2022-01-03 15:34:33');
INSERT INTO messages VALUES('15','12','241','http://durbarmart.nextnepal.org/product/Pearl-Green-Tea1-ACSSP
Hello','2022-01-19 15:12:45','2022-01-19 15:12:45');
INSERT INTO messages VALUES('16','13','241','http://durbarmart.nextnepal.org/product/Pearl-Green-Tea1-ACSSP
Hello','2022-01-19 15:12:46','2022-01-19 15:12:46');
INSERT INTO messages VALUES('17','14','241','test','2022-01-20 14:29:28','2022-01-20 14:29:28');
INSERT INTO messages VALUES('18','14','3','test reply','2022-01-20 14:29:59','2022-01-20 14:29:59');
INSERT INTO messages VALUES('19','15','245','hey','2022-01-20 14:37:41','2022-01-20 14:37:41');
INSERT INTO messages VALUES('20','15','3','hey','2022-01-20 14:38:36','2022-01-20 14:38:36');
INSERT INTO messages VALUES('21','15','3','hey','2022-01-20 14:38:39','2022-01-20 14:38:39');
INSERT INTO messages VALUES('22','15','3','aaa','2022-01-20 14:39:05','2022-01-20 14:39:05');
INSERT INTO messages VALUES('23','16','245','http://durbarmart.nextnepal.org/product/Red-Cherry-Himalayan-Arabica-Coffee---250-Gm-N61KQ','2022-01-20 14:43:49','2022-01-20 14:43:49');
INSERT INTO messages VALUES('24','16','3','utik7ykg','2022-02-01 10:03:04','2022-02-01 10:03:04');
INSERT INTO messages VALUES('25','17','8','http://sewa-digital.nextnepal.org/product/seller-product-test-alJ1V

This is a query test message','2022-03-11 14:43:04','2022-03-11 14:43:04');
INSERT INTO messages VALUES('26','17','3','Thanks for the query customer.','2022-03-11 14:44:03','2022-03-11 14:44:03');


DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2021_12_14_102858_create_jobs_table','2');


DROP TABLE IF EXISTS oauth_access_tokens;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO oauth_access_tokens VALUES('00e35389540956aa555a20ad344312a8c2b6f0d654036846132ab02d7bc6d4bfa7fd7cf0b14ae789','120','1','Personal Access Token','[]','0','2020-11-27 17:48:04','2020-11-27 17:48:04','2022-10-28 13:03:04');
INSERT INTO oauth_access_tokens VALUES('05cf110aae9d31c118cadf764c1f704ace181ecccd73ab4205a2a9f7aa9fd6a345251290a671b353','95','1','Personal Access Token','[]','0','2020-10-22 09:27:32','2020-10-22 09:27:32','2022-09-22 05:42:32');
INSERT INTO oauth_access_tokens VALUES('0696d8822e2469e03709187e87367c9c07a0d345f057b8ddaf014ba704fe059e81b00558db80be5f','84','1','Personal Access Token','[]','0','2020-10-19 18:50:33','2020-10-19 18:50:33','2022-09-19 15:05:33');
INSERT INTO oauth_access_tokens VALUES('07216d8a54c7532abf086c2dc2de6d8dc53092b9da2b483239296fb6c5e3ea7a34584fd0ea9d6357','58','1','Personal Access Token','[]','0','2020-09-11 08:47:41','2020-09-11 08:47:41','2022-08-12 05:02:41');
INSERT INTO oauth_access_tokens VALUES('089167e931d278844838228ca5ec9611c212f68c1131c44e98796010709de1a5058a286312dc79e1','8','1','Personal Access Token','[]','0','2020-07-18 23:17:12','2020-07-18 23:17:12','2022-06-18 19:32:12');
INSERT INTO oauth_access_tokens VALUES('097c64f1338c7dc5f5f1e82a45fa0e7753562830b05b2b7bb69a8ff17c4c9e20ffc952a986e24ff9','65','1','Personal Access Token','[]','0','2020-10-21 18:49:31','2020-10-21 18:49:31','2022-09-21 15:04:31');
INSERT INTO oauth_access_tokens VALUES('0b3bcbb3cf37ae37c0f4652ce375fa2c8d5adb2dd0e5848c9ae9539f9bafe96f582c2fb5b944adf8','139','1','Personal Access Token','[]','0','2020-11-23 15:23:16','2020-11-23 15:23:16','2022-10-24 10:38:16');
INSERT INTO oauth_access_tokens VALUES('0ca7a28c8186eb0db120b37d92a944c1dd5c6fb57368d95b92c8d226b6e069aa477a595b86087e8b','123','1','Personal Access Token','[]','0','2020-11-28 07:55:10','2020-11-28 07:55:10','2022-10-29 03:10:10');
INSERT INTO oauth_access_tokens VALUES('0d530a9e69d1e95ca76dd5d63f5a42969e318039f280caf3cae15761bf9ceb79036f8a4f1e299977','58','1','Personal Access Token','[]','0','2020-09-20 14:05:08','2020-09-20 14:05:08','2022-08-21 10:20:08');
INSERT INTO oauth_access_tokens VALUES('0f37619c9298cc9628c61fdc91f3522e67ccccd025111b2a334c3bd460a45e27320fc7e2ad4fa247','8','1','Personal Access Token','[]','0','2022-03-28 13:11:26','2022-03-28 13:11:26','2024-02-26 09:26:26');
INSERT INTO oauth_access_tokens VALUES('0f5cde4c459942b312aa5500859a5f6cd10aa16ba7ce451d93ed27d1d14052f82e0609cb62eed950','97','1','Personal Access Token','[]','0','2020-10-23 14:40:31','2020-10-23 14:40:31','2022-09-23 10:55:31');
INSERT INTO oauth_access_tokens VALUES('0fdc3921b3a39db3c3daf7ff91b525b1c0918a261c411d428d8cdfdf5ff87a2ef8463ec1f9d406bb','66','1','Personal Access Token','[]','0','2020-09-09 15:43:28','2020-09-09 15:43:28','2022-08-10 11:58:28');
INSERT INTO oauth_access_tokens VALUES('0fed7daf213c4497153f459667eed38156cfbd5cd632e49fe9a1d32387733f1567c2f29d1bd568fe','8','1','Personal Access Token','[]','0','2022-03-28 13:10:08','2022-03-28 13:10:08','2024-02-26 09:25:08');
INSERT INTO oauth_access_tokens VALUES('11d6a059aec2b7e8dce4c234a1bb0d09c94341d77869dcf9c6eca5683d09383f14add4c02e28ca74','8','1','Personal Access Token','[]','0','2022-04-20 11:00:22','2022-04-20 11:00:22','2024-03-20 11:00:22');
INSERT INTO oauth_access_tokens VALUES('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46','1','1','Personal Access Token','[]','0','2019-07-30 10:36:13','2019-07-30 10:36:13','2020-07-30 10:51:13');
INSERT INTO oauth_access_tokens VALUES('12f141705f24ea7ec6da57325ee8edea562ef56a0023e1d79917c29816dd35b28dae099f4b6bbfa8','189','1','Personal Access Token','[]','0','2020-12-13 06:28:05','2020-12-13 06:28:05','2022-11-13 01:43:05');
INSERT INTO oauth_access_tokens VALUES('13a59886eeb23c32e344af4e30d3033a73740a41e2f4d6d0fbc7eb64cd2998add28c05b113e115b7','25','1','Personal Access Token','[]','0','2020-10-27 10:07:52','2020-10-27 10:07:52','2022-09-27 05:22:52');
INSERT INTO oauth_access_tokens VALUES('1562d6f08e6e086de8cd88edd76ce43534bd6128ebe4274af2f6d7c8614ed0068bf79358f3ebd56f','66','1','Personal Access Token','[]','0','2020-09-10 06:44:02','2020-09-10 06:44:02','2022-08-11 02:59:02');
INSERT INTO oauth_access_tokens VALUES('157de5d8f23b26925a51e0e97a5023798001a9770ae8e9534791d5efad03279dac09ef6c3de70597','252','1','Personal Access Token','[]','0','2022-03-28 09:41:54','2022-03-28 09:41:54','2024-02-26 05:56:54');
INSERT INTO oauth_access_tokens VALUES('170a5cb3d9b3f109f83b0a6898335531b3d3c88386e1dadcefb3de38b3ea3f658a13f22cd1eac31e','8','1','Personal Access Token','[]','0','2022-04-03 11:30:24','2022-04-03 11:30:24','2024-03-03 07:45:24');
INSERT INTO oauth_access_tokens VALUES('1950b520984abc1ecacb398154f806647661f212c261fcf5b5592e3aca92743bfc89b64f3b1a2559','87','1','Personal Access Token','[]','0','2020-11-12 15:41:00','2020-11-12 15:41:00','2022-10-13 10:56:00');
INSERT INTO oauth_access_tokens VALUES('1ba3c60353635c06da722669870c88cee886ad4f118b11bdd69ae41a85f759f909ad356dfa6a9428','20','1','Personal Access Token','[]','0','2020-10-16 15:29:33','2020-10-16 15:29:33','2022-09-16 11:44:33');
INSERT INTO oauth_access_tokens VALUES('1bda476c4f6ef6ad1697d122ea37ef1701bf495896b41f861fa12d6c380a883c1797cf8954f144bd','20','1','Personal Access Token','[]','0','2020-10-18 15:36:04','2020-10-18 15:36:04','2022-09-18 11:51:04');
INSERT INTO oauth_access_tokens VALUES('1d9e57dc0032f1a158dc3cbaff75240e54ca4f7b1776b0d9462e7620f0833268032e873ce74f3bb5','79','1','Personal Access Token','[]','0','2020-11-15 21:47:21','2020-11-15 21:47:21','2022-10-16 17:02:21');
INSERT INTO oauth_access_tokens VALUES('1dc5c021d94d7a0ccbef0c37e56a40af53a1994dd827982614f7c506d8f21d9615b6e101f11db0a1','8','1','Personal Access Token','[]','0','2022-04-27 11:30:02','2022-04-27 11:30:02','2024-03-27 11:30:02');
INSERT INTO oauth_access_tokens VALUES('1defa8c1d0d8b93c842aad086ea85c98e65cb1e3c1876353ff85f4857d3745d145a5f5dfb1e65692','87','1','Personal Access Token','[]','0','2020-10-24 12:55:49','2020-10-24 12:55:49','2022-09-24 09:10:49');
INSERT INTO oauth_access_tokens VALUES('1f5bf21661d562e2ab9a3532997d3f9e501abc2187f8395db5d1abc1938dff7c3ea0fdc43a9d227a','58','1','Personal Access Token','[]','0','2020-09-03 17:56:08','2020-09-03 17:56:08','2022-08-04 14:11:08');
INSERT INTO oauth_access_tokens VALUES('1f678fbc72378c096736bc92b64644fc8c20369232fb050a07d467e394a4f891a48d9fefda5e0d75','159','1','Personal Access Token','[]','0','2020-12-03 13:54:43','2020-12-03 13:54:43','2022-11-03 09:09:43');
INSERT INTO oauth_access_tokens VALUES('20c8c742c79ee524fc80f224e2b8fdb37386179f0d16ff5bbd195b6c3535adafe9ec96fd73a52034','8','1','Personal Access Token','[]','0','2022-04-19 10:01:32','2022-04-19 10:01:32','2024-03-19 10:01:32');
INSERT INTO oauth_access_tokens VALUES('20d36e0d38a6c9789bfb9602a2613f6a3d5b9d1c8600aa9f02a8d2bcf360f6d7e29baf31538595c8','84','1','Personal Access Token','[]','0','2020-10-16 12:02:25','2020-10-16 12:02:25','2022-09-16 08:17:25');
INSERT INTO oauth_access_tokens VALUES('213e2520689067a96c5745328196e008d8c9518365723f7e8e7af4aa572f1c67dfba612aef18db39','66','1','Personal Access Token','[]','0','2020-09-09 15:17:35','2020-09-09 15:17:35','2022-08-10 11:32:35');
INSERT INTO oauth_access_tokens VALUES('248ae44151973f8e01b01bf316a8e8a16aa76f54abd8b0273b3d235736d9cccbfaa9d09ac275ded2','84','1','Personal Access Token','[]','0','2020-10-19 15:52:45','2020-10-19 15:52:45','2022-09-19 12:07:45');
INSERT INTO oauth_access_tokens VALUES('24c27962451818f42e12b484eefe42900875b9b2113aea2ff17311763c7cb833109dd1a9c9b7a389','84','1','Personal Access Token','[]','0','2020-10-20 05:49:20','2020-10-20 05:49:20','2022-09-20 02:04:20');
INSERT INTO oauth_access_tokens VALUES('24ddbe3def94bbd04376ec39ffffca86f40d2a3e739d265eed31053ac5d6f40f5839f8f879cf5af2','58','1','Personal Access Token','[]','0','2020-09-13 17:07:21','2020-09-13 17:07:21','2022-08-14 13:22:21');
INSERT INTO oauth_access_tokens VALUES('25d762647970af8b0d4ce3b4571372394250c122a216ea63be1796a65c3970741a67eb9ce176eb9a','8','1','Personal Access Token','[]','0','2022-03-28 13:02:55','2022-03-28 13:02:55','2024-02-26 09:17:55');
INSERT INTO oauth_access_tokens VALUES('260f750b467143e9ce5c232da19d0b88000cd8f89c765a6152a230b8a426c493d585533d9f10e65a','58','1','Personal Access Token','[]','0','2020-09-20 13:46:20','2020-09-20 13:46:20','2022-08-21 10:01:20');
INSERT INTO oauth_access_tokens VALUES('26dbf5a703b2eb746837d289d9aa0f5d8950055530f63669125b6ce24388b11143083e7ff766567b','85','1','Personal Access Token','[]','0','2020-10-16 15:31:00','2020-10-16 15:31:00','2022-09-16 11:46:00');
INSERT INTO oauth_access_tokens VALUES('27fefc15e4d27b94b2151359e22859d26775c33698244120dc9c1698c676c8b24a087f5a07b4e471','20','1','Personal Access Token','[]','0','2020-10-18 15:40:16','2020-10-18 15:40:16','2022-09-18 11:55:16');
INSERT INTO oauth_access_tokens VALUES('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504','1','1','Personal Access Token','[]','1','2019-08-04 11:45:04','2019-08-04 11:45:04','2020-08-04 12:00:04');
INSERT INTO oauth_access_tokens VALUES('294a6d0e1959206642e14631b57b24fd79d4779754a4b13ae8a98186400b4a83a692aea02d20a28d','8','1','Personal Access Token','[]','0','2022-04-03 13:27:54','2022-04-03 13:27:54','2024-03-03 09:42:54');
INSERT INTO oauth_access_tokens VALUES('2a5e72c7f19870e079600ec420e22359ec50f1670b1f4e332b1c7846b11b812e8ab30ddbfce9dce6','8','1','Personal Access Token','[]','0','2022-04-03 12:20:27','2022-04-03 12:20:27','2024-03-03 08:35:27');
INSERT INTO oauth_access_tokens VALUES('2c2d257b5a587def24e528df1a975a484a5d794cc41f0ae8226fcc22d0e7d986b8a636ee73a04297','20','1','Personal Access Token','[]','0','2020-09-10 13:21:44','2020-09-10 13:21:44','2022-08-11 09:36:44');
INSERT INTO oauth_access_tokens VALUES('2d4298f2a1cbb935e888327be6d0ac1b687251293c259995c15bf66e770de40a9a155da11a1c2b2f','84','1','Personal Access Token','[]','0','2020-10-18 08:48:47','2020-10-18 08:48:47','2022-09-18 05:03:48');
INSERT INTO oauth_access_tokens VALUES('2de1996effd31864d4bbdc2f199028d5bb0decd7a0186ba66d4feff0352ff986f235fafcebe8f39d','165','1','Personal Access Token','[]','0','2020-12-06 19:09:53','2020-12-06 19:09:53','2022-11-06 14:24:53');
INSERT INTO oauth_access_tokens VALUES('2e2355a7a9e8848872c4d7ee8514655b673c854370e900b9418de5bed7a8d6d097495146ae82fbe0','132','1','Personal Access Token','[]','0','2020-11-20 06:33:20','2020-11-20 06:33:20','2022-10-21 01:48:20');
INSERT INTO oauth_access_tokens VALUES('2e5693dae392e5a4f70529808a3288527c080a392b8309e11b596ca52f02500ca462bc8d02f59e38','20','1','Personal Access Token','[]','0','2020-09-11 09:38:37','2020-09-11 09:38:37','2022-08-12 05:53:37');
INSERT INTO oauth_access_tokens VALUES('2ea5b291134512ef731f2b3c23d3981412d5dff373726215736874da8775f843afe8d5e07cb36c35','27','1','Personal Access Token','[]','0','2020-12-11 06:57:21','2020-12-11 06:57:21','2022-11-11 02:12:21');
INSERT INTO oauth_access_tokens VALUES('2f7bdd640b81ef350d1f2067fe4ff3eb8e2d1dccf2b0ae6092a376159cce02e0ee625c60e292594b','122','1','Personal Access Token','[]','0','2020-11-14 05:50:16','2020-11-14 05:50:16','2022-10-15 01:05:16');
INSERT INTO oauth_access_tokens VALUES('3012a16942937eecf8604ef10eaed6bc02f8a5415ffaf6dd2fd2c28125b63e297495c43c83869e80','20','1','Personal Access Token','[]','0','2020-10-19 19:29:30','2020-10-19 19:29:30','2022-09-19 15:44:30');
INSERT INTO oauth_access_tokens VALUES('306e305ed3fd3209d2f1e11754610eb28f797244935673ccbfefd9818b6b2fc51845bab796d1e468','252','1','Personal Access Token','[]','0','2022-03-27 19:15:33','2022-03-27 19:15:33','2024-02-25 15:30:33');
INSERT INTO oauth_access_tokens VALUES('308f0e1177fb20b60a6a406ebb44d7d3138cb3e69c7713f8a083dd48baef29bb5e6a2bf919981c2a','123','1','Personal Access Token','[]','0','2020-11-18 09:24:41','2020-11-18 09:24:41','2022-10-19 04:39:41');
INSERT INTO oauth_access_tokens VALUES('30d2d0e7e84ef8338b97988cf9d403bb1369f546786c9f71b3d233aa2a952c14b6b746608e33f9bf','20','1','Personal Access Token','[]','0','2020-09-10 14:18:30','2020-09-10 14:18:30','2022-08-11 10:33:30');
INSERT INTO oauth_access_tokens VALUES('33253d7b3c267e600b92dba4c0454f7fba91ad7d74a795a68bb3cfefe94d70d907f107872455b1df','87','1','Personal Access Token','[]','0','2020-10-21 19:43:43','2020-10-21 19:43:43','2022-09-21 15:58:43');
INSERT INTO oauth_access_tokens VALUES('35c35b5f53f988a5c3ed2e1dcbb37a6c1b59fb851fba7f252d50ffafb96add6b2ac7a33333be421e','172','1','Personal Access Token','[]','0','2020-12-07 17:03:08','2020-12-07 17:03:08','2022-11-07 12:18:08');
INSERT INTO oauth_access_tokens VALUES('3628068fdb57af60f73a528493e483c7fc3a044c73d1b21a77a9f92a5f30bf4b575db4e03a5f922e','66','1','Personal Access Token','[]','0','2020-09-11 08:56:49','2020-09-11 08:56:49','2022-08-12 05:11:49');
INSERT INTO oauth_access_tokens VALUES('36b5605433e77778af5e0ad4b0657f032c480c24e9502039c8d6377e9a53d5d8bf4f2e760fe6b56f','8','1','Personal Access Token','[]','0','2022-04-04 07:43:58','2022-04-04 07:43:58','2024-03-04 03:58:58');
INSERT INTO oauth_access_tokens VALUES('37b9d3db83911d0efdf705e02b0772f91b8614fd46a41084f998acbbb8c38f2f245ca2b6db3b8931','84','1','Personal Access Token','[]','0','2020-11-04 14:27:58','2020-11-04 14:27:58','2022-10-05 09:42:58');
INSERT INTO oauth_access_tokens VALUES('393cfca1cf440ac558b6e254d6d3cea10eec9b18e3d6ce10747536cd392716521031e426b8eaa60a','169','1','Personal Access Token','[]','0','2020-12-07 15:02:40','2020-12-07 15:02:40','2022-11-07 10:17:40');
INSERT INTO oauth_access_tokens VALUES('3a4b23bcb054d78bbdf445401704ee7a050528de1942b610378c8aa80da09f704a284df30d12947c','155','1','Personal Access Token','[]','0','2020-11-29 12:06:56','2020-11-29 12:06:56','2022-10-30 07:21:56');
INSERT INTO oauth_access_tokens VALUES('3cb53d709ec6836069d5b6d5aa89ae016a981fae930f55b6090150818f507a76bb4ad67a022e0c8b','84','1','Personal Access Token','[]','0','2020-10-18 15:35:40','2020-10-18 15:35:40','2022-09-18 11:50:40');
INSERT INTO oauth_access_tokens VALUES('3ef36b7f30bd7bee86d8d840e1ef23a06ee064174b449e1841650ed0b5202ff902c253e3337ad589','106','1','Personal Access Token','[]','0','2020-11-06 15:54:25','2020-11-06 15:54:25','2022-10-07 11:09:25');
INSERT INTO oauth_access_tokens VALUES('400c6aae000a08c60a56784c3e6341403f876e38a7e13b186761b14c3284893e580dad5c55914d53','8','1','Personal Access Token','[]','0','2022-03-28 14:57:46','2022-03-28 14:57:46','2024-02-26 11:12:46');
INSERT INTO oauth_access_tokens VALUES('410e6c3589808abe3e95d3d95c6a6b5f8d102256015d9295667c574bd95f74e030dbf6906a4e822d','8','1','Personal Access Token','[]','0','2022-03-28 12:55:32','2022-03-28 12:55:32','2024-02-26 09:10:32');
INSERT INTO oauth_access_tokens VALUES('411f1134c4551f8ff0018adb7f7b0d3b9825caa6b3a5a63dca246e1eec1638067e1d09ab6a68280f','84','1','Personal Access Token','[]','0','2020-10-24 12:56:43','2020-10-24 12:56:43','2022-09-24 09:11:43');
INSERT INTO oauth_access_tokens VALUES('41c186fb02210de37b610fb65bb06872f1efa8739eb28709453fa5c2ecedd0002c30c909275b0a99','58','1','Personal Access Token','[]','0','2020-09-06 09:40:18','2020-09-06 09:40:18','2022-08-07 05:55:18');
INSERT INTO oauth_access_tokens VALUES('434ed00520c4f7ae1d4a91b3bd0f600400371577c0c44d55027ccf843688e01c2aff55e23db2eb77','120','1','Personal Access Token','[]','0','2020-11-26 14:40:57','2020-11-26 14:40:57','2022-10-27 09:55:57');
INSERT INTO oauth_access_tokens VALUES('44a867861bfb11036a5369f45a5de27a28162f51f721992895016ad56e9fa0741615f32c0acaf951','84','1','Personal Access Token','[]','0','2020-10-22 09:35:05','2020-10-22 09:35:05','2022-09-22 05:50:05');
INSERT INTO oauth_access_tokens VALUES('478d3302ee94561b6c61d76526c75dfb63328f0550948032254be60032c391cbc9ef1014d6af4e1e','58','1','Personal Access Token','[]','0','2020-09-10 08:44:19','2020-09-10 08:44:19','2022-08-11 04:59:19');
INSERT INTO oauth_access_tokens VALUES('482ffa73f72688a0dfce79b3fa3056303e18af86e4fe371489f4fe08b836799510cc3a08bfd5c08d','8','1','Personal Access Token','[]','0','2022-03-31 07:43:23','2022-03-31 07:43:23','2024-02-29 03:58:23');
INSERT INTO oauth_access_tokens VALUES('4890cf96b1c0d81f7ea76785388f625773677f164f7541e3ce1b5ed9e668dc7b5fe371937073a589','8','1','Personal Access Token','[]','0','2022-03-28 12:00:41','2022-03-28 12:00:41','2024-02-26 08:15:41');
INSERT INTO oauth_access_tokens VALUES('49c09b65efd2557111cb14af7974dfac2a1cbdd33707fdefe3db2efa589a7e360cee253f67c4d91f','120','1','Personal Access Token','[]','0','2020-11-26 14:21:23','2020-11-26 14:21:23','2022-10-27 09:36:23');
INSERT INTO oauth_access_tokens VALUES('49c8952d4947e126176329a13d6ac68f79fbfbda82c63496087224b5b091798435083d465d0b4e9a','8','1','Personal Access Token','[]','0','2022-03-29 12:18:07','2022-03-29 12:18:07','2024-02-27 08:33:07');
INSERT INTO oauth_access_tokens VALUES('4af5e27862cfe689a5ddcb92a8b2dedcf113472689a4ff53d5985b058713418e4a488f1d0ccbd0ba','252','1','Personal Access Token','[]','0','2022-03-27 19:15:13','2022-03-27 19:15:13','2024-02-25 15:30:13');
INSERT INTO oauth_access_tokens VALUES('4b840013c4fefbe4d4a725c390211dd5b49664fcf3d7e32ffed7040c7c71eae58f11271fc2277997','68','1','Personal Access Token','[]','0','2020-09-09 12:32:36','2020-09-09 12:32:36','2022-08-10 08:47:36');
INSERT INTO oauth_access_tokens VALUES('4bdf469b008e8ef61c92c238fce02c760734f06e93378cb0250c29b80d8c97daf9f0cb8d3b880964','101','1','Personal Access Token','[]','0','2020-11-01 17:18:32','2020-11-01 17:18:32','2022-10-02 12:33:32');
INSERT INTO oauth_access_tokens VALUES('4c5c3145b88cbef0afe7726f8c9f4b6736a097dce657d38d5aa133e850a0cef0574ac8dd6e7af2aa','20','1','Personal Access Token','[]','0','2020-11-19 22:38:17','2020-11-19 22:38:17','2022-10-20 17:53:17');
INSERT INTO oauth_access_tokens VALUES('532520ee0dd339dd515b12c65c492577096f31fa55d169aa01245583fcb53f05e661e0264687dcd2','173','1','Personal Access Token','[]','0','2020-12-07 19:07:12','2020-12-07 19:07:12','2022-11-07 14:22:12');
INSERT INTO oauth_access_tokens VALUES('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf','1','1','Personal Access Token','[]','0','2019-07-13 12:29:28','2019-07-13 12:29:28','2020-07-13 12:44:28');
INSERT INTO oauth_access_tokens VALUES('536ea0bc4ec77aecc6d8abba352c957d8b5366af9c79643c21bb4def3c0d1ec58954ad9a767c8eae','66','1','Personal Access Token','[]','0','2020-09-10 14:21:57','2020-09-10 14:21:57','2022-08-11 10:36:57');
INSERT INTO oauth_access_tokens VALUES('5427377d97c7d29b46c55e6d28aea831021d9ac03c67b52e628945dd4c1dd343a77d40027aee4d41','20','1','Personal Access Token','[]','0','2020-09-10 12:52:40','2020-09-10 12:52:40','2022-08-11 09:07:40');
INSERT INTO oauth_access_tokens VALUES('54c81e84ff620714dbfa99d823a6fa2457240336460509c251f21a3dc61b1b6db1ea582b048abc39','73','1','Personal Access Token','[]','0','2020-09-11 11:10:39','2020-09-11 11:10:39','2022-08-12 07:25:39');
INSERT INTO oauth_access_tokens VALUES('5514b5c133e16de6626452647506b4f97ddb664920b17dd5883db35ac2c4d57a7a3b08df9190ee8c','20','1','Personal Access Token','[]','0','2020-12-01 19:09:29','2020-12-01 19:09:29','2022-11-01 14:24:29');
INSERT INTO oauth_access_tokens VALUES('562cea18d5b63f8cae72965dc3097185fa07d3b0e0a649ccd8963c8cac4f7a8f7e85168bbf0cbb82','8','1','Personal Access Token','[]','0','2022-03-28 13:05:16','2022-03-28 13:05:16','2024-02-26 09:20:16');
INSERT INTO oauth_access_tokens VALUES('5693a22e5156d9517181d31b6ff5a8ffaaea42ea4c7a310427bdfc582ab9902fe133e6a490bd59aa','183','1','Personal Access Token','[]','0','2020-12-10 18:37:59','2020-12-10 18:37:59','2022-11-10 13:52:59');
INSERT INTO oauth_access_tokens VALUES('5695945f25ee951033a9b2526ed0dfb6c8aa97fd1c1fef37ef57dfb9c79f3125a1e2fe67ffcabbf2','8','1','Personal Access Token','[]','0','2022-03-28 12:51:31','2022-03-28 12:51:31','2024-02-26 09:06:31');
INSERT INTO oauth_access_tokens VALUES('56e6a1d6b0116905b1c824cf265d9afaee395c11a6cf0310a367fa7edf8155f1027480c490962726','8','1','Personal Access Token','[]','0','2022-03-21 15:05:13','2022-03-21 15:05:13','2024-02-19 10:20:13');
INSERT INTO oauth_access_tokens VALUES('58bea1b63327270d9eb9bd4500d8e53e12ce78a9667579166c4d61d37c12ed29f7eba373cbaac498','58','1','Personal Access Token','[]','0','2020-09-13 13:18:52','2020-09-13 13:18:52','2022-08-14 09:33:52');
INSERT INTO oauth_access_tokens VALUES('58f2a19f40aac5b948c654d8e30c79e5fd417ceb9a35b5ca2f335caa8714e3e1c8be6b3110cb5bce','58','1','Personal Access Token','[]','0','2020-09-07 10:11:32','2020-09-07 10:11:32','2022-08-08 06:26:32');
INSERT INTO oauth_access_tokens VALUES('59731bde55b04c0fd076db57418ffba761137c8f3d43519e043b23bef11f282f819cf9a22b64bfb7','66','1','Personal Access Token','[]','0','2020-09-11 08:56:26','2020-09-11 08:56:26','2022-08-12 05:11:26');
INSERT INTO oauth_access_tokens VALUES('5aae53f90aa53167578bcca8700fb5c61da201953d5aa1459195a4ed3013fa6c78504026dd69dcee','85','1','Personal Access Token','[]','0','2020-10-16 14:38:00','2020-10-16 14:38:00','2022-09-16 10:53:00');
INSERT INTO oauth_access_tokens VALUES('5d78165acd18815e8d915ee15ed31397c2031bd4d7c65f9299d8a0f4eaefc6ce45d6d09da61b42fc','87','1','Personal Access Token','[]','0','2020-11-05 11:27:39','2020-11-05 11:27:39','2022-10-06 06:42:39');
INSERT INTO oauth_access_tokens VALUES('5e960cf3a8c746231ee2d0bd3557caf347f813aeb786462e10431f96eb7d0ffd0fc0c9c365d067a0','182','1','Personal Access Token','[]','0','2020-12-10 09:31:15','2020-12-10 09:31:15','2022-11-10 04:46:15');
INSERT INTO oauth_access_tokens VALUES('5f798edfb9f9b8c5018fc4fc0a06e194c9963968e094fce50db831a82d55752c72773bbb31cbd079','8','1','Personal Access Token','[]','0','2022-03-28 13:15:07','2022-03-28 13:15:07','2024-02-26 09:30:07');
INSERT INTO oauth_access_tokens VALUES('601fc7a20c92396a006ef9402d86e46d0cd86fc60ff856b24f51b5ccdf0c2cf303b83ce549028f1e','66','1','Personal Access Token','[]','0','2020-09-10 12:52:21','2020-09-10 12:52:21','2022-08-11 09:07:21');
INSERT INTO oauth_access_tokens VALUES('619a8aa62109874f73a085d62044fa72637efd2022d817716d48be496384b11220e97296e9107a2d','66','1','Personal Access Token','[]','0','2020-09-10 08:25:32','2020-09-10 08:25:32','2022-08-11 04:40:32');
INSERT INTO oauth_access_tokens VALUES('643e8ec2ffc621fc3a15a40038bb8e0cacec9c82b0a864081f528fd364338a9ebe7c021ff5c20714','20','1','Personal Access Token','[]','0','2020-11-23 21:51:28','2020-11-23 21:51:28','2022-10-24 17:06:28');
INSERT INTO oauth_access_tokens VALUES('6449b5d55d43fbd182cee0886df410436bc7404beeafb479b4f40ed767444002deba88eec7b78586','252','1','Personal Access Token','[]','0','2022-03-28 09:05:47','2022-03-28 09:05:47','2024-02-26 05:20:47');
INSERT INTO oauth_access_tokens VALUES('64adda668a31e258aa9dbe903d6ca470f8b93d792211d287c9340c0aac7bd3a77678e93910c83cdb','8','1','Personal Access Token','[]','0','2022-03-28 13:01:46','2022-03-28 13:01:46','2024-02-26 09:16:46');
INSERT INTO oauth_access_tokens VALUES('65334743bf614be31b53b24e84f2f919fec1ed3ab35513247973047f81ea81048fb9a3cb2afb6a2f','58','1','Personal Access Token','[]','0','2020-09-13 15:48:44','2020-09-13 15:48:44','2022-08-14 12:03:44');
INSERT INTO oauth_access_tokens VALUES('654d056f6727491bc47ec4d1d9090d2a02646b6ae28269acf2a9e37f15ac6710f8cd7d3b4c064ab2','58','1','Personal Access Token','[]','0','2020-09-04 14:49:13','2020-09-04 14:49:13','2022-08-05 11:04:13');
INSERT INTO oauth_access_tokens VALUES('65c1b908f460ad3c83238e618d7b06cbe08886a798a5194707fc9156d6173df1ef5c7ea7a81de7f2','58','1','Personal Access Token','[]','0','2020-09-09 12:13:15','2020-09-09 12:13:15','2022-08-10 08:28:15');
INSERT INTO oauth_access_tokens VALUES('66a3e9ce766d17babe2ce0f7cf9d8d6c054f45bc48699d297c32355d676d6c8cdda7a8566b66d51d','188','1','Personal Access Token','[]','0','2020-12-12 21:28:49','2020-12-12 21:28:49','2022-11-12 16:43:49');
INSERT INTO oauth_access_tokens VALUES('67df7e6d9e7f69555fe53a2ce527cf4e0891a7ff34442f5b865350d8a3c02cb7757cc867f37c871c','87','1','Personal Access Token','[]','0','2020-11-12 15:44:03','2020-11-12 15:44:03','2022-10-13 10:59:03');
INSERT INTO oauth_access_tokens VALUES('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b','1','1','Personal Access Token','[]','1','2019-08-04 13:08:06','2019-08-04 13:08:06','2020-08-04 13:23:06');
INSERT INTO oauth_access_tokens VALUES('6c40ded33b12e7f2246160e267efb48a979eb850cb010a8376606ba3ef34361308baecc2909ee7b0','71','1','Personal Access Token','[]','0','2020-09-11 08:43:14','2020-09-11 08:43:14','2022-08-12 04:58:14');
INSERT INTO oauth_access_tokens VALUES('6c9cc377ddcccaabe5303c17cc47d5ced76df90dcac0abc7cad06a40738119176bf982353a384867','69','1','Personal Access Token','[]','0','2020-09-09 12:35:54','2020-09-09 12:35:54','2022-08-10 08:50:54');
INSERT INTO oauth_access_tokens VALUES('6cbfd68ddded10b1d003dfa15b8c44f8da166658b012d9bde49857be4560702f7ffc9e31baea5d2b','84','1','Personal Access Token','[]','0','2020-10-19 11:03:48','2020-10-19 11:03:48','2022-09-19 07:18:48');
INSERT INTO oauth_access_tokens VALUES('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0','1','1','Personal Access Token','[]','1','2019-08-04 13:17:12','2019-08-04 13:17:12','2020-08-04 13:32:12');
INSERT INTO oauth_access_tokens VALUES('6de58c0a4de203206daa791848ed8fed7b3976aa2315a57ac84c5731e0b10fd9c5203bd9f9a280b0','93','1','Personal Access Token','[]','0','2020-10-20 14:24:36','2020-10-20 14:24:36','2022-09-20 10:39:37');
INSERT INTO oauth_access_tokens VALUES('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa','1','1','Personal Access Token','[]','0','2019-08-08 08:20:26','2019-08-08 08:20:26','2020-08-08 08:35:26');
INSERT INTO oauth_access_tokens VALUES('70431fb60a188e43b88140d61c2a37e8fd5bb32a15c0b7ef2816f1c1c1b68c97403cc62cd221dc8e','8','1','Personal Access Token','[]','0','2022-03-28 13:08:52','2022-03-28 13:08:52','2024-02-26 09:23:53');
INSERT INTO oauth_access_tokens VALUES('7193cc1491a8acfaf97c61c992971432e0aae3066280a4bca823b55d1f02fce77507d54fc29c94dd','8','1','Personal Access Token','[]','0','2022-03-28 12:43:14','2022-03-28 12:43:14','2024-02-26 08:58:14');
INSERT INTO oauth_access_tokens VALUES('71965b43b5fb7d04fee1cda87fd7f37003ac628906932e659bd1d95a87cb62a0e6362d63826e4179','8','1','Personal Access Token','[]','0','2022-03-28 15:00:09','2022-03-28 15:00:09','2024-02-26 11:15:09');
INSERT INTO oauth_access_tokens VALUES('71d1b8771476448095b4faa334cb8ac5e73e5a015da8379b1c053caf08e3e2ad98b26feaf7ff6e9b','66','1','Personal Access Token','[]','0','2020-09-09 18:23:21','2020-09-09 18:23:21','2022-08-10 14:38:21');
INSERT INTO oauth_access_tokens VALUES('72205d29de5455efdc8a919c3587e8823225badbbe0de05bc210835ec7e84056be15d712826b9b5b','8','1','Personal Access Token','[]','0','2022-04-01 15:41:06','2022-04-01 15:41:06','2024-03-01 11:56:06');
INSERT INTO oauth_access_tokens VALUES('730a769ee817c73f9868a28b51eed1e02955960ab64dec4c9926e8a2e4504009f420b167d06a7245','87','1','Personal Access Token','[]','0','2020-10-20 12:16:44','2020-10-20 12:16:44','2022-09-20 08:31:44');
INSERT INTO oauth_access_tokens VALUES('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0','1','1','Personal Access Token','[]','1','2019-08-04 13:14:44','2019-08-04 13:14:44','2020-08-04 13:29:44');
INSERT INTO oauth_access_tokens VALUES('77e15a9e31f36afccc1c6aeeb7479c42d492b71b735cea1f39fa59fbc60cf87979c11d7c49de53bf','20','1','Personal Access Token','[]','0','2020-10-19 11:01:02','2020-10-19 11:01:02','2022-09-19 07:16:02');
INSERT INTO oauth_access_tokens VALUES('78053f665fcd7dafd24c577ffacfc847b4dbcdfe665bc5c338c3169030310382392bffd812766800','66','1','Personal Access Token','[]','0','2020-09-10 05:58:59','2020-09-10 05:58:59','2022-08-11 02:13:59');
INSERT INTO oauth_access_tokens VALUES('781172367999f0e3d3240fcff6cc835c6d306a9e8b2b9fdaea63437d5608fa69fde531127b801f8d','137','1','Personal Access Token','[]','0','2020-11-21 20:05:23','2020-11-21 20:05:23','2022-10-22 15:20:23');
INSERT INTO oauth_access_tokens VALUES('7839f0317c244f46acc494781bbfbaf2901ca2d0e1b475c34ade388638a4ff464287ce0a3e2be4a3','91','1','Personal Access Token','[]','0','2020-10-20 11:25:14','2020-10-20 11:25:14','2022-09-20 07:40:14');
INSERT INTO oauth_access_tokens VALUES('78eb4eee76520c447531c79d77260e62d09538b25c8a21ef57621d9342048e5f9d3a08b6683c54b1','130','1','Personal Access Token','[]','0','2020-11-19 11:48:48','2020-11-19 11:48:48','2022-10-20 07:03:48');
INSERT INTO oauth_access_tokens VALUES('79a652aac1efb1efbc55937dc64ef9b83a2174eab7b7f73ed66fbcda31369f344a2fee73f6a2c9ef','8','1','Personal Access Token','[]','0','2022-03-28 12:01:30','2022-03-28 12:01:30','2024-02-26 08:16:31');
INSERT INTO oauth_access_tokens VALUES('7ad843eac1edcd17c22c77fa57203b7fa025afb62fe07e9984e8b7f08a09855fc932001be79ab142','58','1','Personal Access Token','[]','0','2020-09-03 17:55:41','2020-09-03 17:55:41','2022-08-04 14:10:41');
INSERT INTO oauth_access_tokens VALUES('7ae14da7863366f901dc082e3afc9c425ca8abdf8287a971f5a429e8d7b3d031ddb8822f9e9e017b','66','1','Personal Access Token','[]','0','2020-09-09 18:22:48','2020-09-09 18:22:48','2022-08-10 14:37:48');
INSERT INTO oauth_access_tokens VALUES('7b0444d1cbf77e5b514c213a7f79a9fba6378e59c097f3ed640473120e23bbe26230b02a8dfca841','8','1','Personal Access Token','[]','0','2022-03-28 14:53:27','2022-03-28 14:53:27','2024-02-26 11:08:27');
INSERT INTO oauth_access_tokens VALUES('7b3cb01d25aba41e074fbc65c2c560414c2f6325bab47627d9b370a84f8f2ea698675674e11feb36','58','1','Personal Access Token','[]','0','2020-09-08 14:52:49','2020-09-08 14:52:49','2022-08-09 11:07:49');
INSERT INTO oauth_access_tokens VALUES('7be33d74496f0abe2ed4a64b6c134aa8b851374858c40815d981d47ecde903546a0193a7285002f6','12','1','Personal Access Token','[]','0','2020-09-13 14:17:28','2020-09-13 14:17:28','2022-08-14 10:32:28');
INSERT INTO oauth_access_tokens VALUES('7d4e4009526b75a9ab5b774e788a98398dd9bdee085c498f3bca352ce3efb1192e949c9f506b5f5c','58','1','Personal Access Token','[]','0','2020-10-01 07:18:12','2020-10-01 07:18:12','2022-09-01 03:33:12');
INSERT INTO oauth_access_tokens VALUES('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0','1','1','Personal Access Token','[]','1','2019-07-22 07:52:47','2019-07-22 07:52:47','2020-07-22 08:07:47');
INSERT INTO oauth_access_tokens VALUES('8206313fe58ad743f4d366f71cc7a15a882a865f8bcb47f4fba600468fab44fd4cd7eeac1f15a8c9','87','1','Personal Access Token','[]','0','2020-11-12 15:38:58','2020-11-12 15:38:58','2022-10-13 10:53:58');
INSERT INTO oauth_access_tokens VALUES('832d410a8c5ed47225cdc5f4765a37b7983799471be5869e86f9210896db86c0cb1afc10537af86d','171','1','Personal Access Token','[]','0','2020-12-07 16:27:03','2020-12-07 16:27:03','2022-11-07 11:42:03');
INSERT INTO oauth_access_tokens VALUES('8377e10343c9c4fa0570fde1d0e66f79c898b8cd39502d25c8ff877f268e49649bc3863064d17e7b','8','1','Personal Access Token','[]','0','2022-03-28 13:03:35','2022-03-28 13:03:35','2024-02-26 09:18:35');
INSERT INTO oauth_access_tokens VALUES('83a40fdf01169175f7b27bfb2292d6cee0a5e96064d5ed55bbef6f4efffa7915722f97098a85c215','20','1','Personal Access Token','[]','0','2020-10-16 15:50:47','2020-10-16 15:50:47','2022-09-16 12:05:47');
INSERT INTO oauth_access_tokens VALUES('84576b651b826b5353e10dca0f3a7e0700667e5f9548dde06c662180043310a75f495cb4412bd8b8','8','1','Personal Access Token','[]','0','2022-03-28 12:47:06','2022-03-28 12:47:06','2024-02-26 09:02:06');
INSERT INTO oauth_access_tokens VALUES('850f4ad20cd1b8ddd73e77ad421b03e8f8b1383293ded89384182eca75167d39f285786e5f3ad25c','58','1','Personal Access Token','[]','0','2020-09-11 09:04:42','2020-09-11 09:04:42','2022-08-12 05:19:42');
INSERT INTO oauth_access_tokens VALUES('864fcbd30205cc5eedc448973cbd7db2243f3e4b0810757f5bd02e6ef64600262b27e93ea7be0c0c','66','1','Personal Access Token','[]','0','2020-09-10 08:22:45','2020-09-10 08:22:45','2022-08-11 04:37:45');
INSERT INTO oauth_access_tokens VALUES('871c7768d2aed19b63ef64b7cee63742c89716b109092fa884f8bc230ddec074e533bfbea2a5db96','70','1','Personal Access Token','[]','0','2020-09-10 14:23:52','2020-09-10 14:23:52','2022-08-11 10:38:52');
INSERT INTO oauth_access_tokens VALUES('87be6bb25259715235ca303bfe91c89350f1fa94ce19869e44f64b1a6ff4cbdb7d8f040f05d0aa9f','84','1','Personal Access Token','[]','0','2020-10-18 08:34:04','2020-10-18 08:34:04','2022-09-18 04:49:04');
INSERT INTO oauth_access_tokens VALUES('88d75541aaecbbd045eb5439f621640cb0b135996da0e6629de67da9ad652d596ae4ba06492dc4cb','58','1','Personal Access Token','[]','0','2020-10-12 09:44:38','2020-10-12 09:44:38','2022-09-12 05:59:38');
INSERT INTO oauth_access_tokens VALUES('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad','1','1','Personal Access Token','[]','1','2019-08-04 11:50:05','2019-08-04 11:50:05','2020-08-04 12:05:05');
INSERT INTO oauth_access_tokens VALUES('8a6ca97aac0441091f67f60b8b494a22e7f5cb6d4d8e5ef19e5a19ff0ca8681972442452b54d7f71','84','1','Personal Access Token','[]','0','2020-11-26 14:40:05','2020-11-26 14:40:05','2022-10-27 09:55:06');
INSERT INTO oauth_access_tokens VALUES('8ac75ef76f5d2b6be0a561dfe27cb0e0a1b8ebf2b532417aab8795bb9a149093b493e7b65a73709b','20','1','Personal Access Token','[]','0','2020-09-10 13:19:43','2020-09-10 13:19:43','2022-08-11 09:34:43');
INSERT INTO oauth_access_tokens VALUES('8ad05251523c9b6f51ff8a7d2316385785e6c90a67ea212702bcd76243e5a5dc7982e14af20b4f19','20','1','Personal Access Token','[]','0','2020-09-11 08:58:39','2020-09-11 08:58:39','2022-08-12 05:13:39');
INSERT INTO oauth_access_tokens VALUES('8ae3fba7d1a188f4bdeec02767049fd2b67db811c8e2be7e9986c4059c0a1f47426b5a911248b736','84','1','Personal Access Token','[]','0','2020-10-22 09:24:12','2020-10-22 09:24:12','2022-09-22 05:39:12');
INSERT INTO oauth_access_tokens VALUES('8cb6a1730a57235dd3b2d000b415a14198b614ffac7c46a7a96b406d39936a58586ab48bde86c167','58','1','Personal Access Token','[]','0','2020-09-20 14:13:57','2020-09-20 14:13:57','2022-08-21 10:28:57');
INSERT INTO oauth_access_tokens VALUES('8d26007146b18067f93e5738247caa51ec93b95c2dd87025f6e5379f1ed2c7e124e44b9863789aa0','87','1','Personal Access Token','[]','0','2020-12-08 12:40:18','2020-12-08 12:40:18','2022-11-08 07:55:18');
INSERT INTO oauth_access_tokens VALUES('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a','1','1','Personal Access Token','[]','1','2019-08-04 12:29:35','2019-08-04 12:29:35','2020-08-04 12:44:35');
INSERT INTO oauth_access_tokens VALUES('8e60ed2897e8d1f6111b41b84bd09365e14cfda5a6615f9257bb15dbb9fe244903080292564f820f','131','1','Personal Access Token','[]','0','2020-11-19 19:37:12','2020-11-19 19:37:12','2022-10-20 14:52:12');
INSERT INTO oauth_access_tokens VALUES('8e8d44e769fc4ca42281da2997c76cd0e3b9f8ae23be3a1fa3d48c02ee802d8927a437aeddd9916c','66','1','Personal Access Token','[]','0','2020-09-09 15:17:07','2020-09-09 15:17:07','2022-08-10 11:32:07');
INSERT INTO oauth_access_tokens VALUES('8ea9b3460823fe19f23e5693e927e2115df7ca1a6d1c43c2fb2c0a0c20859db050db1ce7998c0e4b','20','1','Personal Access Token','[]','0','2020-09-10 14:19:21','2020-09-10 14:19:21','2022-08-11 10:34:21');
INSERT INTO oauth_access_tokens VALUES('8f22e3d1080a9b589c14c1eff44319c7510784a5acf4581ca8c7db7a21cd4efef55bcb6ff367d713','20','1','Personal Access Token','[]','0','2020-09-10 14:20:14','2020-09-10 14:20:14','2022-08-11 10:35:14');
INSERT INTO oauth_access_tokens VALUES('9090bef8fd3c0ce0eea7224f1106fc36883e4fb15da56ddc9a61a1709c9acba49955c20603e5f337','66','1','Personal Access Token','[]','0','2020-09-10 06:25:33','2020-09-10 06:25:33','2022-08-11 02:40:33');
INSERT INTO oauth_access_tokens VALUES('90d80f6f135db163f37626cec4f2cef9b8dc9546b1a4fb92fe0dab38447124715218cd20dad43856','92','1','Personal Access Token','[]','0','2020-10-20 12:14:11','2020-10-20 12:14:11','2022-09-20 08:29:11');
INSERT INTO oauth_access_tokens VALUES('91cd11e912196b9a0841feb6882763d76a60712d93b7a870c8d170bedccd82a240fd1fdefa1d1ebb','66','1','Personal Access Token','[]','0','2020-09-11 09:22:40','2020-09-11 09:22:40','2022-08-12 05:37:40');
INSERT INTO oauth_access_tokens VALUES('923dbb53ee9939d8a06ef8dfe239bd7f88da8e75f31afa3183205efc2775fccb1d84605ca9fb5b0b','66','1','Personal Access Token','[]','0','2020-09-09 12:07:45','2020-09-09 12:07:45','2022-08-10 08:22:45');
INSERT INTO oauth_access_tokens VALUES('9297a12b8d8d8553378e74de7e8628d8f08b049e8f369d68476239b8677065f818a5176d6d80ffc2','66','1','Personal Access Token','[]','0','2020-09-10 08:24:05','2020-09-10 08:24:05','2022-08-11 04:39:05');
INSERT INTO oauth_access_tokens VALUES('92bd08fd28862634a6a1f31a6e07738a6c29c37b138dc72461c091db1f3a1e8a175281da93fe6c9c','107','1','Personal Access Token','[]','0','2020-11-08 04:17:12','2020-11-08 04:17:12','2022-10-08 23:32:12');
INSERT INTO oauth_access_tokens VALUES('93b2f4fa599241aa1cc5d9e5561720ee1f5cd61baaeb752deefd97dded3183d6cb91bef735ab7562','58','1','Personal Access Token','[]','0','2020-10-16 11:56:49','2020-10-16 11:56:49','2022-09-16 08:11:49');
INSERT INTO oauth_access_tokens VALUES('9406b09e31e8dc2bb4a9798809b112c7abc900dba63ff89baeba40f98daa3ce9755857c7fa6baf8b','252','1','Personal Access Token','[]','0','2022-03-28 09:28:25','2022-03-28 09:28:25','2024-02-26 05:43:25');
INSERT INTO oauth_access_tokens VALUES('972db96ca4285b72db599bb213970caa72618340fc5ef05faeaeb5cc897e4c35cd1482317c056b84','8','1','Personal Access Token','[]','0','2022-03-28 12:47:37','2022-03-28 12:47:37','2024-02-26 09:02:37');
INSERT INTO oauth_access_tokens VALUES('98f240fe35b9487f2c419544f79b77f7b21fedd46389729a257dde2d99e2556dc20c61e98a392b84','84','1','Personal Access Token','[]','0','2020-10-16 12:41:21','2020-10-16 12:41:21','2022-09-16 08:56:21');
INSERT INTO oauth_access_tokens VALUES('9cb6ca5db3f3c898a990eaad6b9093cff9b3846c7094be1bf3c68f2e78c03e8f4f604694ed03dbe5','87','1','Personal Access Token','[]','0','2020-11-12 15:41:15','2020-11-12 15:41:15','2022-10-13 10:56:15');
INSERT INTO oauth_access_tokens VALUES('9da32d508d3c80d6b0599649fcbe05cc1c18a128c265cb63ed7cc16160d30e503246546a32615079','87','1','Personal Access Token','[]','0','2020-12-08 12:41:16','2020-12-08 12:41:16','2022-11-08 07:56:16');
INSERT INTO oauth_access_tokens VALUES('9f3893852487b7ae986445a03315c84a6a4ef1b00b7a8c0cb4e2114914299008fb1f2300ff4ec2a1','66','1','Personal Access Token','[]','0','2020-09-09 15:22:21','2020-09-09 15:22:21','2022-08-10 11:37:21');
INSERT INTO oauth_access_tokens VALUES('9feb9e8d0c0669b3924dfb7e9258b31a77934c3e6988d4b0b3f9d157498c53cfc3abe928a6ec6585','84','1','Personal Access Token','[]','0','2020-10-19 19:18:01','2020-10-19 19:18:01','2022-09-19 15:33:01');
INSERT INTO oauth_access_tokens VALUES('a10d28ed02be9a5fd6191e544f696715173cdbdf9ca99f5dd2932bb7693eb478a1d795be72bce5bc','8','1','Personal Access Token','[]','0','2020-07-18 23:17:12','2020-07-18 23:17:12','2022-06-18 19:32:12');
INSERT INTO oauth_access_tokens VALUES('a15db040458f7a7ad9b411b25d2c235f7843f27e9129b20b1b931bec53063cf5264069eabb0f7b46','33','1','Personal Access Token','[]','0','2020-11-08 18:13:25','2020-11-08 18:13:25','2022-10-09 13:28:25');
INSERT INTO oauth_access_tokens VALUES('a172efafc9998d8a95c0a119fde659e0620a7693449f4ee85d819fd6d8a811ed7b4f738f642908d8','103','1','Personal Access Token','[]','0','2020-11-04 14:52:18','2020-11-04 14:52:18','2022-10-05 10:07:18');
INSERT INTO oauth_access_tokens VALUES('a2038e4abe3abb050d71f3fe9551447b9455c6c205c206cc17b0406b38226435718ad2895a45b80d','8','1','Personal Access Token','[]','0','2022-03-28 14:54:58','2022-03-28 14:54:58','2024-02-26 11:09:58');
INSERT INTO oauth_access_tokens VALUES('a3098d0e08548ab2e355216aba124a6098c13137ec96b6109fc61d86c4e20d5245a22f08653bd3c9','87','1','Personal Access Token','[]','0','2020-10-20 12:13:27','2020-10-20 12:13:27','2022-09-20 08:28:27');
INSERT INTO oauth_access_tokens VALUES('a4b29451652cfa10e6c8e7849afbb39c3472448b436ca1905a9f91348180951eb3e576b5374c4ecd','66','1','Personal Access Token','[]','0','2020-09-09 15:38:36','2020-09-09 15:38:36','2022-08-10 11:53:36');
INSERT INTO oauth_access_tokens VALUES('a7abe4faa8a99a2798d7324553e804881b182dfcd3041fa96d2f93ebb11c99ed5fb98464efeffa37','8','1','Personal Access Token','[]','0','2022-03-28 12:52:59','2022-03-28 12:52:59','2024-02-26 09:07:59');
INSERT INTO oauth_access_tokens VALUES('aaad7379c0f370650ebec79479d790358949196bd32409cb4d1715f2fd8cf6c8d0f5f300009ea7a7','128','1','Personal Access Token','[]','0','2020-11-19 01:37:02','2020-11-19 01:37:02','2022-10-19 20:52:02');
INSERT INTO oauth_access_tokens VALUES('ab95bb5c66b4f5a882bd74fd3ecb351c9e20f701a5642b0fdadd46a57032ffa78cc481d2c5905db0','66','1','Personal Access Token','[]','0','2020-09-09 12:12:25','2020-09-09 12:12:25','2022-08-10 08:27:25');
INSERT INTO oauth_access_tokens VALUES('ac488035671503f8caee2dd7c7ec5bb68100d44e7e86ea385f41419db2bcc51a2b8ae561307d01e4','8','1','Personal Access Token','[]','0','2022-04-21 17:46:17','2022-04-21 17:46:17','2024-03-21 17:46:17');
INSERT INTO oauth_access_tokens VALUES('b1512a215b1ba0618dbd6a2c1dc273d500a87af25d89fcc927c67fb13c0065d5bed153e51b585ad8','58','1','Personal Access Token','[]','0','2020-09-06 10:53:17','2020-09-06 10:53:17','2022-08-07 07:08:17');
INSERT INTO oauth_access_tokens VALUES('b1dab4005c7ebb87f9a8ce46e1db0fa9bde3d5173355ea98379966a678a8f6499d27886448c07d55','58','1','Personal Access Token','[]','0','2020-09-09 12:18:14','2020-09-09 12:18:14','2022-08-10 08:33:14');
INSERT INTO oauth_access_tokens VALUES('b1ffe0e4a133d7da6f96d7423f23c80407333c22048b9f00272f4f3749ce0c769f06d5436cf733e0','117','1','Personal Access Token','[]','0','2020-11-11 10:32:12','2020-11-11 10:32:12','2022-10-12 05:47:12');
INSERT INTO oauth_access_tokens VALUES('b2ba6d6fd81a8d1882edb87bdb540a9fb6a1e4cd74a1bfc7773fce5b617bef0be7983dce0fb3a816','66','1','Personal Access Token','[]','0','2020-09-10 06:09:53','2020-09-10 06:09:53','2022-08-11 02:24:53');
INSERT INTO oauth_access_tokens VALUES('b356b87f49e3531035b2b2b448fbb1c3c899eb1bb0abf38ca8d762bc26003c728eba5de14799e86f','20','1','Personal Access Token','[]','0','2020-09-11 08:57:10','2020-09-11 08:57:10','2022-08-12 05:12:10');
INSERT INTO oauth_access_tokens VALUES('b6d89c1c17bb2a0cf18d0c467a8a599ab1d86dc7d32812bee96b83abe3fb966c4f3d5615212437af','84','1','Personal Access Token','[]','0','2020-10-20 12:31:46','2020-10-20 12:31:46','2022-09-20 08:46:46');
INSERT INTO oauth_access_tokens VALUES('b7046c01d11e64f15bd7dd7f9ba36baa1ff7d440ff8512ae1754f5ffcef7974b243e492ab1eebf06','252','1','Personal Access Token','[]','0','2022-03-24 21:39:43','2022-03-24 21:39:43','2024-02-22 16:54:43');
INSERT INTO oauth_access_tokens VALUES('b80f6a811bb4b20d67d5f6948c13efb94224de4899d9be4f26d0a52e1c9feb8c7be26a502e6a1fa2','73','1','Personal Access Token','[]','0','2020-09-11 11:06:04','2020-09-11 11:06:04','2022-08-12 07:21:05');
INSERT INTO oauth_access_tokens VALUES('b964bb588e2969152c84289a4f60e21b704a81fdd99da678570d5a23a41c2c3ee38d7259813e73be','123','1','Personal Access Token','[]','0','2020-12-07 19:18:21','2020-12-07 19:18:21','2022-11-07 14:33:21');
INSERT INTO oauth_access_tokens VALUES('b972930539df680ec98bea062f8a648058e1feb0e8572a949799239bfc3129e796c4fe00a0acc680','20','1','Personal Access Token','[]','0','2020-10-16 15:50:15','2020-10-16 15:50:15','2022-09-16 12:05:15');
INSERT INTO oauth_access_tokens VALUES('ba58fe64e9153479d0ebb8eebe58a15da14178ebce76b736dc706e88275143a15101c0afd42bc590','58','1','Personal Access Token','[]','0','2020-09-03 20:48:45','2020-09-03 20:48:45','2022-08-04 17:03:45');
INSERT INTO oauth_access_tokens VALUES('bc7b0622a00aa0bd6ca5c48e9578458cf96340573aa92cc84c54f129b94d125ec15bf67f3423e61c','84','1','Personal Access Token','[]','0','2020-10-18 08:43:23','2020-10-18 08:43:23','2022-09-18 04:58:23');
INSERT INTO oauth_access_tokens VALUES('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a','1','1','Personal Access Token','[]','1','2019-08-04 12:59:32','2019-08-04 12:59:32','2020-08-04 13:14:32');
INSERT INTO oauth_access_tokens VALUES('be3590ae788cec5464f37a1ee263d6b5d07ddf18b76a3bd35dbb969fb43778933068781244230ee3','276','1','Personal Access Token','[]','0','2022-05-03 11:06:47','2022-05-03 11:06:47','2024-04-02 11:06:48');
INSERT INTO oauth_access_tokens VALUES('be63c0f68675811be30fe9b348c48d6cff656d6a1f00063491c948229131c905d5559ae35b3f7722','58','1','Personal Access Token','[]','0','2020-09-06 15:02:33','2020-09-06 15:02:33','2022-08-07 11:17:33');
INSERT INTO oauth_access_tokens VALUES('c04ed3b48f52405c27fd2f819c702ed669020144261ae79dc0586de1823aaaf92b24125ba1595935','168','1','Personal Access Token','[]','0','2020-12-07 08:59:06','2020-12-07 08:59:06','2022-11-07 04:14:07');
INSERT INTO oauth_access_tokens VALUES('c1eb8cde8cfa85cd13dc0d2293ccb772109ef357365293436a1d2ab1222285d374a4aa91fbd6e6c6','102','1','Personal Access Token','[]','0','2020-11-03 17:58:49','2020-11-03 17:58:49','2022-10-04 13:13:49');
INSERT INTO oauth_access_tokens VALUES('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d','1','1','Personal Access Token','[]','1','2019-07-30 07:30:31','2019-07-30 07:30:31','2020-07-30 07:45:31');
INSERT INTO oauth_access_tokens VALUES('c2ad041c506a7a7f27bd791efe2e19c3eb8a23d1fcd1dd033dd56f50d88a641bf499fc9af8c31f77','124','1','Personal Access Token','[]','0','2020-11-18 10:28:04','2020-11-18 10:28:04','2022-10-19 05:43:04');
INSERT INTO oauth_access_tokens VALUES('c6263cc7f302eb5b9bae4e429699a22d4dd07dcd19fb42359e1c2671ebe60b4d415d605767fe9778','58','1','Personal Access Token','[]','0','2020-09-19 18:28:45','2020-09-19 18:28:45','2022-08-20 14:43:45');
INSERT INTO oauth_access_tokens VALUES('c735eb909552de21b7c0e3ed63e52e1e9942db0b64c738c7a03f8167d6e586c8662369ed05ca3dd0','8','1','Personal Access Token','[]','0','2022-03-31 12:41:23','2022-03-31 12:41:23','2024-02-29 08:56:23');
INSERT INTO oauth_access_tokens VALUES('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777','1','1','Personal Access Token','[]','1','2019-08-05 10:47:59','2019-08-05 10:47:59','2020-08-05 11:02:59');
INSERT INTO oauth_access_tokens VALUES('c750f7d6da94d067ce634097ec8dca83fe4f95ed4a364b2e5d03e0769d4d7150567048df28656787','58','1','Personal Access Token','[]','0','2020-09-18 13:57:23','2020-09-18 13:57:23','2022-08-19 10:12:23');
INSERT INTO oauth_access_tokens VALUES('c8c8987c79be12deae0ca4f52f062b24fcf903d2dce762af35a81592f9823a69766d5184084f6732','252','1','Personal Access Token','[]','0','2022-03-27 19:11:07','2022-03-27 19:11:07','2024-02-25 15:26:07');
INSERT INTO oauth_access_tokens VALUES('ca8872d08110f7189dc4b2dbd7f638391788457898e18ae0e127987282c1fc0fe3672ca10ba79940','120','1','Personal Access Token','[]','0','2020-11-13 12:01:18','2020-11-13 12:01:18','2022-10-14 07:16:18');
INSERT INTO oauth_access_tokens VALUES('ca91563001c9f763c4c1379acdd45adad010173be1aaf84e43b44351abc5a2ff98d80058530cfee2','85','1','Personal Access Token','[]','0','2020-10-18 08:32:26','2020-10-18 08:32:26','2022-09-18 04:47:26');
INSERT INTO oauth_access_tokens VALUES('cb334401436c356f53ea6d403e73e50a78aa81184067c0b4c7010cf0adad90af080ce41e18f29b72','87','1','Personal Access Token','[]','0','2020-11-12 15:39:26','2020-11-12 15:39:26','2022-10-13 10:54:26');
INSERT INTO oauth_access_tokens VALUES('ccb08d3aa110b36fa4e788894340d01883f9093eb583d6b56d41d6eea2e590a33b05af77e417634a','85','1','Personal Access Token','[]','0','2020-10-16 15:09:34','2020-10-16 15:09:34','2022-09-16 11:24:34');
INSERT INTO oauth_access_tokens VALUES('cd832ef1bea1dadbf957261b7d6ea7a2735f7c07b13ebdb2143c63fc0a9a9fa0a4f08da0a144cdea','71','1','Personal Access Token','[]','0','2020-09-11 08:36:58','2020-09-11 08:36:58','2022-08-12 04:51:58');
INSERT INTO oauth_access_tokens VALUES('cdd4662155e70965f23f28d1ba9ad79e23023efeb69a4b495112324d8e800b67ec440c88b6f84023','94','1','Personal Access Token','[]','0','2020-10-20 15:38:19','2020-10-20 15:38:19','2022-09-20 11:53:19');
INSERT INTO oauth_access_tokens VALUES('ce828b5b426b44cc2525e292a0d72760ef7fc4715f49f035fadf289858362ef7a2c4ae638d54549d','66','1','Personal Access Token','[]','0','2020-09-10 08:37:28','2020-09-10 08:37:28','2022-08-11 04:52:28');
INSERT INTO oauth_access_tokens VALUES('cec70173f856be118a8baed24e796a16709bea1a613f29951035dbecd989f80cf8089be2cff0a24b','84','1','Personal Access Token','[]','0','2020-10-20 14:56:30','2020-10-20 14:56:30','2022-09-20 11:11:30');
INSERT INTO oauth_access_tokens VALUES('cedf21e114a803a4861c600f99a262511e66aaee3633e271ba73a41edbc1b4c0f6c9c41786630e34','87','1','Personal Access Token','[]','0','2020-11-19 11:09:29','2020-11-19 11:09:29','2022-10-20 06:24:29');
INSERT INTO oauth_access_tokens VALUES('cf1d4b8ace221330d96f0a9c7c2b6c9270053cb7cded410c898205301d3ce65b07aa00fbc7e70dd6','88','1','Personal Access Token','[]','0','2020-10-19 18:55:58','2020-10-19 18:55:58','2022-09-19 15:10:58');
INSERT INTO oauth_access_tokens VALUES('cf5b24546b3dc36efe304ab4b393a3500e29159c2ab3b6111c2a34ce6bb104428d89f46e786fa27a','87','1','Personal Access Token','[]','0','2020-10-19 10:07:40','2020-10-19 10:07:40','2022-09-19 06:22:40');
INSERT INTO oauth_access_tokens VALUES('cfd156d9cbb72b784f0bcd4ac5b69c6e61181f9389199451c2b66ffe9732fdc34dcd710a327f7098','58','1','Personal Access Token','[]','0','2020-09-04 10:11:42','2020-09-04 10:11:42','2022-08-05 06:26:42');
INSERT INTO oauth_access_tokens VALUES('d026d4a1039f24e709cfd54b3bbbefd91d6172fb8736b565a2a3b3fcca866af8105d7a86b06b2538','66','1','Personal Access Token','[]','0','2020-09-11 09:05:43','2020-09-11 09:05:43','2022-08-12 05:20:43');
INSERT INTO oauth_access_tokens VALUES('d08bcda96e9d431b2e375944910d395e9367411272f162faa416e1614307d1c2e38bb7984e9ca51c','66','1','Personal Access Token','[]','0','2020-09-09 12:08:40','2020-09-09 12:08:40','2022-08-10 08:23:40');
INSERT INTO oauth_access_tokens VALUES('d0df7a8551718123ccc0f694a3957dff5ca79de49c702e569ca4822038d193c62d400fdc1108c235','8','1','Personal Access Token','[]','0','2022-03-31 12:40:44','2022-03-31 12:40:44','2024-02-29 08:55:44');
INSERT INTO oauth_access_tokens VALUES('d133e347a0a28070c5ba00b58969c8c91f1d7e9a08b1768766bc3b53cf75181fd7f3fb84bad99ab4','158','1','Personal Access Token','[]','0','2020-12-01 19:14:42','2020-12-01 19:14:42','2022-11-01 14:29:42');
INSERT INTO oauth_access_tokens VALUES('d1ac1f7c21b4f5eeb5ca1d4812b0c5c7f6dc8fc655c3422a4410e27eaafd0bc7683cddd73a758278','8','1','Personal Access Token','[]','0','2022-03-28 12:55:00','2022-03-28 12:55:00','2024-02-26 09:10:00');
INSERT INTO oauth_access_tokens VALUES('d3c1563b8b2880b48472f72b794473257ecf400ccb843a02ca5aefcca7628233b3ff17206c29e78a','66','1','Personal Access Token','[]','0','2020-09-10 08:58:31','2020-09-10 08:58:31','2022-08-11 05:13:31');
INSERT INTO oauth_access_tokens VALUES('d446b096cfdc2d6d7ae67970da2d7cfe2b936b6f4cf3ea7da93a221718a4c7dc85c192f14a8cc865','8','1','Personal Access Token','[]','0','2022-03-28 13:10:53','2022-03-28 13:10:53','2024-02-26 09:25:53');
INSERT INTO oauth_access_tokens VALUES('d5284876c44318c4635338655173d4eed4b16cb8ebedba5940348731be022ca60ca0ea9215f75407','166','1','Personal Access Token','[]','0','2020-12-06 22:08:23','2020-12-06 22:08:23','2022-11-06 17:23:23');
INSERT INTO oauth_access_tokens VALUES('d7707d4d172f30a7851dd6aaf127ffbda71f814e99945b452f9d20a5de0e09cb4a0369c6bad4ef44','67','1','Personal Access Token','[]','0','2020-09-09 12:30:47','2020-09-09 12:30:47','2022-08-10 08:45:47');
INSERT INTO oauth_access_tokens VALUES('d7d3f27fc2fc49c81bb9f9a1e5ca6279e1cc8251e7b88f69be45d01b6374238dc3e2d71cefe41900','253','1','Personal Access Token','[]','1','2022-03-28 09:56:13','2022-03-28 09:56:13','2024-02-26 06:11:13');
INSERT INTO oauth_access_tokens VALUES('d89a9f53cefae311d66139457695cf69a49cb402f5d3d88d58c72eb2d18c921ac4e7bd8921852358','58','1','Personal Access Token','[]','0','2020-09-04 11:07:04','2020-09-04 11:07:04','2022-08-05 07:22:04');
INSERT INTO oauth_access_tokens VALUES('d8d4cb73e6b31d855ef1b426fef50ab2260d53cbc43a545e8e99b9aad4e79296b0bae073340a8897','20','1','Personal Access Token','[]','0','2020-10-19 13:38:17','2020-10-19 13:38:17','2022-09-19 09:53:17');
INSERT INTO oauth_access_tokens VALUES('d911d83596f18f7bac14515e5a73b13eb166100d0763cb03e3a96a264ae456ca06168f06d23d409f','140','1','Personal Access Token','[]','0','2020-11-24 10:19:08','2020-11-24 10:19:08','2022-10-25 05:34:09');
INSERT INTO oauth_access_tokens VALUES('d960ad34fce3aedfc6de26d28faf1407dbd498fa761def2248e14db06c8d98e6cd416c91613781d7','65','1','Personal Access Token','[]','0','2020-10-23 04:25:21','2020-10-23 04:25:21','2022-09-23 00:40:21');
INSERT INTO oauth_access_tokens VALUES('d9a0e54476eca8ae5c064f07a9f66670b497899772b85a901f1a1cf831217e30b91f07848fbb2554','84','1','Personal Access Token','[]','0','2020-10-19 10:12:39','2020-10-19 10:12:39','2022-09-19 06:27:39');
INSERT INTO oauth_access_tokens VALUES('db1e3d121eea715439edf3a03bc01398e607a458b60d610b1e087d162fe486717e1d58687d90378e','58','1','Personal Access Token','[]','0','2020-09-02 10:06:49','2020-09-02 10:06:49','2022-08-03 06:21:49');
INSERT INTO oauth_access_tokens VALUES('db2791ce53e585da2f8aaff86a0d60c8601fb6be003a2ba6b47002a5133d3b09245dc3d3705c5a1b','84','1','Personal Access Token','[]','0','2020-10-18 12:42:18','2020-10-18 12:42:18','2022-09-18 08:57:18');
INSERT INTO oauth_access_tokens VALUES('dca5986179ae670f497a1291c087ffefe6458c74646eef2a279274a0e286d0ee9732a725f9cfde32','185','1','Personal Access Token','[]','0','2020-12-11 06:59:29','2020-12-11 06:59:29','2022-11-11 02:14:29');
INSERT INTO oauth_access_tokens VALUES('dd536ef93dffd49db1d0ced69d3bf5447bd07990557def564470bfb4a1c549b039a8ae513f3e62d2','58','1','Personal Access Token','[]','0','2020-09-06 10:33:38','2020-09-06 10:33:38','2022-08-07 06:48:38');
INSERT INTO oauth_access_tokens VALUES('dd9c4cbc65f47c02ddce5df37d515a5b07720b6e6a38b3c70fa1b202d0c720863bdd0fca7bbecf5d','58','1','Personal Access Token','[]','0','2020-09-03 15:52:38','2020-09-03 15:52:38','2022-08-04 12:07:38');
INSERT INTO oauth_access_tokens VALUES('ddaeb4ea531609d36c552f6dfb1567db88fdd992de2447d84d59775fa45e6171602542911bf5af15','87','1','Personal Access Token','[]','0','2020-11-13 12:01:39','2020-11-13 12:01:39','2022-10-14 07:16:39');
INSERT INTO oauth_access_tokens VALUES('def095b101194e7d5c21129a55b4f02fcf726d90e089eabba8f2eb85dca70ffe748cff86736908ea','71','1','Personal Access Token','[]','0','2020-09-11 08:44:06','2020-09-11 08:44:06','2022-08-12 04:59:06');
INSERT INTO oauth_access_tokens VALUES('df5f98903df2a8eac416a3961bb2c592b4433cf58fd62ac33af2927769f04e4f8279992dd9f730cb','59','1','Personal Access Token','[]','0','2020-09-06 09:52:29','2020-09-06 09:52:29','2022-08-07 06:07:29');
INSERT INTO oauth_access_tokens VALUES('e23f5a4b0a08d18f2c8045d51183ceef4d1208e42aaa8a46bc8191663463084bc0141f2b7f1f1de5','184','1','Personal Access Token','[]','0','2020-12-10 20:03:10','2020-12-10 20:03:10','2022-11-10 15:18:10');
INSERT INTO oauth_access_tokens VALUES('e2f770c2549c269bfd61419fab7e533883bfb0b0b8a816b9bca7c374d9abadfbbaa990048f8bd513','8','1','Personal Access Token','[]','0','2022-04-03 13:12:15','2022-04-03 13:12:15','2024-03-03 09:27:15');
INSERT INTO oauth_access_tokens VALUES('e4d5b1cb79b92013397f48c925da69458b8429592590fb22c4c2b34bdce8171e0c6ae8183fcbe63c','20','1','Personal Access Token','[]','0','2020-09-10 12:47:03','2020-09-10 12:47:03','2022-08-11 09:02:03');
INSERT INTO oauth_access_tokens VALUES('e54c129e0d9ca9bc041b527a6702e922302012d44e82cf880cecb0f76e1c2513f1366b5769a35a62','8','1','Personal Access Token','[]','0','2022-03-28 12:55:14','2022-03-28 12:55:14','2024-02-26 09:10:14');
INSERT INTO oauth_access_tokens VALUES('e5a29f4557ec86e1118be651e6b198bf6fb62b056704277f21e16136c5f31935360672f7364b349f','180','1','Personal Access Token','[]','0','2020-12-09 09:39:20','2020-12-09 09:39:20','2022-11-09 04:54:20');
INSERT INTO oauth_access_tokens VALUES('e5ba559aca18463c2b4418076592d117eb20673a91d65875944f2e53fd3b139a3fd18c5afdc14b95','58','1','Personal Access Token','[]','0','2020-09-13 13:01:00','2020-09-13 13:01:00','2022-08-14 09:16:00');
INSERT INTO oauth_access_tokens VALUES('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4','1','1','Personal Access Token','[]','1','2019-07-15 08:38:40','2019-07-15 08:38:40','2020-07-15 08:53:40');
INSERT INTO oauth_access_tokens VALUES('e817548280c9fdcbb1162e1d79d20c847d2af76d33cb091a5186f59aabbe17c69483265ea93aab4f','187','1','Personal Access Token','[]','0','2020-12-12 17:41:18','2020-12-12 17:41:18','2022-11-12 12:56:18');
INSERT INTO oauth_access_tokens VALUES('e836dbbcc084473fd02b7683bacb9ea515888538262481d5d28a7813dbb12e619b6e116d826211ba','25','1','Personal Access Token','[]','0','2020-10-23 04:29:36','2020-10-23 04:29:36','2022-09-23 00:44:36');
INSERT INTO oauth_access_tokens VALUES('e83f6f5ded8dd8397e5a7b4bffc9e19fa03272ebd250ae97e9b63adfccdea3f5a6297f7f34f5f3ff','66','1','Personal Access Token','[]','0','2020-09-10 06:44:52','2020-09-10 06:44:52','2022-08-11 02:59:52');
INSERT INTO oauth_access_tokens VALUES('e85bc7502d16c8b8e2353b074dbec5d3603a8b3567acf308d0b47e626ac75904f80a0608f2383556','20','1','Personal Access Token','[]','0','2020-11-21 20:11:44','2020-11-21 20:11:44','2022-10-22 15:26:44');
INSERT INTO oauth_access_tokens VALUES('e98335fc7f93eb3f0eabfe9a75bb736161814af41a91334ffeb139f4d6a06bcc261da62ab493e11e','66','1','Personal Access Token','[]','0','2020-09-10 08:31:04','2020-09-10 08:31:04','2022-08-11 04:46:04');
INSERT INTO oauth_access_tokens VALUES('ea4b536e0191015a20f842d4a0cd3d5570e7af08b56a094bb71596ba5ea5f3e3e3dd70e60d18c6b8','121','1','Personal Access Token','[]','0','2020-11-13 14:13:50','2020-11-13 14:13:50','2022-10-14 09:28:50');
INSERT INTO oauth_access_tokens VALUES('ec042b41888510baec880e7ba431e3346e53cb945af85b61fe039fa605abcfcccdb5d7054c640814','58','1','Personal Access Token','[]','0','2020-09-04 14:03:30','2020-09-04 14:03:30','2022-08-05 10:18:30');
INSERT INTO oauth_access_tokens VALUES('ec14cd9dccbb3ab59e80508049e0ffe0e42371652d283a1acedd1a134d924175fdf6c0845b908d35','8','1','Personal Access Token','[]','0','2022-03-28 12:52:06','2022-03-28 12:52:06','2024-02-26 09:07:06');
INSERT INTO oauth_access_tokens VALUES('ec673f367858a6dcf9b7c590ef7687ff9fe586759f540634e961b8fe3e8dd5efbae365d76662f2f9','74','1','Personal Access Token','[]','0','2020-09-11 19:00:51','2020-09-11 19:00:51','2022-08-12 15:15:52');
INSERT INTO oauth_access_tokens VALUES('ec9f28838581579b8dff7b215a873fd5a444970e6db3e1e73f3ea46cbe3d2359c63b3ff3abf3aba1','84','1','Personal Access Token','[]','0','2020-10-18 08:36:15','2020-10-18 08:36:15','2022-09-18 04:51:15');
INSERT INTO oauth_access_tokens VALUES('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e','1','1','Personal Access Token','[]','1','2019-07-13 12:21:45','2019-07-13 12:21:45','2020-07-13 12:36:45');
INSERT INTO oauth_access_tokens VALUES('f01a69b2f4871488a450d2c1241a892e49b9d88bdec3a8714ff23d228a8f883606c59588fc0dbc96','99','1','Personal Access Token','[]','0','2020-10-29 21:23:50','2020-10-29 21:23:50','2022-09-29 16:38:50');
INSERT INTO oauth_access_tokens VALUES('f0b1bae1d64ca37825adad5dfd68628d033c225f0f63354231a49f113f52e8f75d8b1fed5e10c8f4','8','1','Personal Access Token','[]','0','2022-03-28 12:50:37','2022-03-28 12:50:37','2024-02-26 09:05:37');
INSERT INTO oauth_access_tokens VALUES('f0b5a47dd2262f7b8418401cc42edff47a58bb359f55dff9afe4dadf546d32ad47873266f72f2259','20','1','Personal Access Token','[]','0','2020-09-10 15:42:15','2020-09-10 15:42:15','2022-08-11 11:57:15');
INSERT INTO oauth_access_tokens VALUES('f16a6cfa374cbfb6485ce559e3e16b1c03e48a7166309beeb519978aae0ff71157e1f0c4c51189fa','84','1','Personal Access Token','[]','0','2020-10-18 08:35:32','2020-10-18 08:35:32','2022-09-18 04:50:32');
INSERT INTO oauth_access_tokens VALUES('f1c8bdf236d8f93e5974f1a7d952070c4a0d60699cdcbd66bec0b22b42ef9fa72b94771db8740be2','66','1','Personal Access Token','[]','0','2020-09-09 15:21:17','2020-09-09 15:21:17','2022-08-10 11:36:17');
INSERT INTO oauth_access_tokens VALUES('f5e91814a544d8dd12d6e65d95ac6471d5f275ef799d7c0265b1100637254da1b138c63d38ca0004','83','1','Personal Access Token','[]','0','2020-10-12 10:14:58','2020-10-12 10:14:58','2022-09-12 06:29:58');
INSERT INTO oauth_access_tokens VALUES('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948','1','1','Personal Access Token','[]','1','2019-08-04 13:07:01','2019-08-04 13:07:01','2020-08-04 13:22:01');
INSERT INTO oauth_access_tokens VALUES('f7e4158d1888c2708f74d360a850636b0f098c768da34b2f3cca951790b43b46233c71fa0465748e','8','1','Personal Access Token','[]','0','2022-03-28 12:44:09','2022-03-28 12:44:09','2024-02-26 08:59:09');
INSERT INTO oauth_access_tokens VALUES('f8221c627e9b2443c6601580659ff56f2fcb1d78e65cc20ec1fce1c1e0b6b0286851ee0cc5aae634','84','1','Personal Access Token','[]','0','2020-11-09 09:09:42','2020-11-09 09:09:42','2022-10-10 04:24:42');
INSERT INTO oauth_access_tokens VALUES('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30','1','1','Personal Access Token','[]','1','2019-07-30 12:23:49','2019-07-30 12:23:49','2020-07-30 12:38:49');
INSERT INTO oauth_access_tokens VALUES('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79','1','1','Personal Access Token','[]','1','2019-08-04 13:13:55','2019-08-04 13:13:55','2020-08-04 13:28:55');
INSERT INTO oauth_access_tokens VALUES('f969c2789c6cffc6dad8f483411ffa3faf8aa62c6fb95d500d06edbbbe665ab9f4c4bf29adc5ecfe','25','1','Personal Access Token','[]','0','2020-10-20 18:22:39','2020-10-20 18:22:39','2022-09-20 14:37:39');
INSERT INTO oauth_access_tokens VALUES('fa0d42f97bcf045d8b15109ace0d19fd638bdf5d48220f977f09829510291b34593c227b28b9ef98','108','1','Personal Access Token','[]','0','2020-11-08 09:35:00','2020-11-08 09:35:00','2022-10-09 04:50:00');
INSERT INTO oauth_access_tokens VALUES('fa94d9dc6900e26578d051e4a92d967dd459fd370f01c2d09aff82d31e51aec3ee3d7e70c3eff85c','179','1','Personal Access Token','[]','0','2020-12-08 18:33:37','2020-12-08 18:33:37','2022-11-08 13:48:37');
INSERT INTO oauth_access_tokens VALUES('fde9e29a02a54f06ed9dde71ef412a3e45270131ef45514b7ca754b466689cdddd5f88628c9f1dc1','174','1','Personal Access Token','[]','0','2020-12-08 06:26:54','2020-12-08 06:26:54','2022-11-08 01:41:54');
INSERT INTO oauth_access_tokens VALUES('fef09d81fbc6554b2d4f21df4646730c34b7e3bdba24c5fe18f037416af36e336fe8f47e79218cf0','175','1','Personal Access Token','[]','0','2020-12-08 06:52:50','2020-12-08 06:52:50','2022-11-08 02:07:50');


DROP TABLE IF EXISTS oauth_auth_codes;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS oauth_clients;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO oauth_clients VALUES('1','','Laravel Personal Access Client','eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj','http://localhost','1','0','0','2019-07-13 12:02:34','2019-07-13 12:02:34');
INSERT INTO oauth_clients VALUES('2','','Laravel Password Grant Client','WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77','http://localhost','0','1','0','2019-07-13 12:02:34','2019-07-13 12:02:34');


DROP TABLE IF EXISTS oauth_personal_access_clients;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO oauth_personal_access_clients VALUES('1','1','2019-07-13 12:02:34','2019-07-13 12:02:34');


DROP TABLE IF EXISTS oauth_refresh_tokens;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS order_details;

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO order_details VALUES('1','1','12','117','','400','0','0','1','unpaid','pending','home_delivery','','','2022-04-13 10:51:35','2022-04-13 10:51:35');
INSERT INTO order_details VALUES('2','1','12','122','','1050','0','0','3','unpaid','pending','home_delivery','','','2022-04-13 10:51:36','2022-04-13 10:51:36');
INSERT INTO order_details VALUES('3','2','12','137','','17.6','2.29','10','1','unpaid','pending','home_delivery','','','2022-04-15 10:14:40','2022-04-15 10:14:40');
INSERT INTO order_details VALUES('4','3','12','84','','650','0','10','1','unpaid','pending','home_delivery','','','2022-04-15 10:18:18','2022-04-15 10:18:18');
INSERT INTO order_details VALUES('5','4','217','142','10','20','0','5','1','unpaid','pending','home_delivery','','','2022-04-17 08:52:55','2022-04-17 08:52:55');
INSERT INTO order_details VALUES('6','4','12','122','','350','0','5','1','unpaid','pending','home_delivery','','','2022-04-17 08:52:55','2022-04-17 08:52:55');
INSERT INTO order_details VALUES('7','5','12','122','','350','0','10','1','unpaid','pending','home_delivery','','','2022-04-17 12:58:15','2022-04-17 12:58:15');
INSERT INTO order_details VALUES('8','6','12','88','39','1500','0','10','1','unpaid','pending','home_delivery','','','2022-04-18 12:17:15','2022-04-18 12:17:15');
INSERT INTO order_details VALUES('9','17','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-18 23:16:11','2022-04-18 23:16:11');
INSERT INTO order_details VALUES('10','17','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-18 23:16:11','2022-04-18 23:16:11');
INSERT INTO order_details VALUES('11','18','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-19 00:34:58','2022-04-19 00:34:58');
INSERT INTO order_details VALUES('12','19','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-19 00:37:56','2022-04-19 00:37:56');
INSERT INTO order_details VALUES('13','20','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-19 00:40:26','2022-04-19 00:40:26');
INSERT INTO order_details VALUES('14','21','12','88','40','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-19 00:57:58','2022-04-19 00:57:58');
INSERT INTO order_details VALUES('15','22','3','155','','1800','0','100','2','unpaid','pending','','','','2022-04-19 11:31:30','2022-04-19 11:31:30');
INSERT INTO order_details VALUES('16','23','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-19 12:05:59','2022-04-19 12:05:59');
INSERT INTO order_details VALUES('17','24','12','119','','1000','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 15:04:58','2022-04-19 15:04:58');
INSERT INTO order_details VALUES('18','25','12','119','','1000','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 15:07:05','2022-04-19 15:07:05');
INSERT INTO order_details VALUES('19','26','12','117','','400','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 16:09:30','2022-04-19 16:09:30');
INSERT INTO order_details VALUES('20','27','12','117','','400','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 16:12:31','2022-04-19 16:12:31');
INSERT INTO order_details VALUES('21','28','12','84','','3250','0','50','5','unpaid','pending','home_delivery','','','2022-04-19 16:21:33','2022-04-19 16:21:33');
INSERT INTO order_details VALUES('22','29','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 16:30:02','2022-04-19 16:30:02');
INSERT INTO order_details VALUES('23','30','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 17:06:02','2022-04-19 17:06:02');
INSERT INTO order_details VALUES('24','32','12','74','','700','0','0','1','unpaid','pending','home_delivery','','','2022-04-19 17:29:07','2022-04-19 17:29:07');
INSERT INTO order_details VALUES('25','33','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-19 17:35:57','2022-04-19 17:35:57');
INSERT INTO order_details VALUES('26','34','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:50:39','2022-04-21 14:50:39');
INSERT INTO order_details VALUES('27','34','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:50:39','2022-04-21 14:50:39');
INSERT INTO order_details VALUES('28','34','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:50:39','2022-04-21 14:50:39');
INSERT INTO order_details VALUES('29','35','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:53:17','2022-04-21 14:53:17');
INSERT INTO order_details VALUES('30','35','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:53:17','2022-04-21 14:53:17');
INSERT INTO order_details VALUES('31','35','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:53:17','2022-04-21 14:53:17');
INSERT INTO order_details VALUES('32','36','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:54:48','2022-04-21 14:54:48');
INSERT INTO order_details VALUES('33','36','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:54:48','2022-04-21 14:54:48');
INSERT INTO order_details VALUES('34','36','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:54:48','2022-04-21 14:54:48');
INSERT INTO order_details VALUES('35','37','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:17','2022-04-21 14:55:17');
INSERT INTO order_details VALUES('36','37','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:17','2022-04-21 14:55:17');
INSERT INTO order_details VALUES('37','37','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:17','2022-04-21 14:55:17');
INSERT INTO order_details VALUES('38','38','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:41','2022-04-21 14:55:41');
INSERT INTO order_details VALUES('39','38','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:41','2022-04-21 14:55:41');
INSERT INTO order_details VALUES('40','38','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:41','2022-04-21 14:55:41');
INSERT INTO order_details VALUES('41','39','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:42','2022-04-21 14:55:42');
INSERT INTO order_details VALUES('42','39','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:42','2022-04-21 14:55:42');
INSERT INTO order_details VALUES('43','39','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:55:42','2022-04-21 14:55:42');
INSERT INTO order_details VALUES('44','40','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 14:56:10','2022-04-21 14:56:10');
INSERT INTO order_details VALUES('45','40','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 14:56:10','2022-04-21 14:56:10');
INSERT INTO order_details VALUES('46','40','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 14:56:10','2022-04-21 14:56:10');
INSERT INTO order_details VALUES('47','41','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:06:46','2022-04-21 15:06:46');
INSERT INTO order_details VALUES('48','41','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:06:46','2022-04-21 15:06:46');
INSERT INTO order_details VALUES('49','41','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:06:46','2022-04-21 15:06:46');
INSERT INTO order_details VALUES('50','42','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:18:41','2022-04-21 15:18:41');
INSERT INTO order_details VALUES('51','42','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:18:41','2022-04-21 15:18:41');
INSERT INTO order_details VALUES('52','42','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:18:41','2022-04-21 15:18:41');
INSERT INTO order_details VALUES('53','43','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:18:49','2022-04-21 15:18:49');
INSERT INTO order_details VALUES('54','43','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:18:49','2022-04-21 15:18:49');
INSERT INTO order_details VALUES('55','43','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:18:49','2022-04-21 15:18:49');
INSERT INTO order_details VALUES('56','44','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:07','2022-04-21 15:19:07');
INSERT INTO order_details VALUES('57','44','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:07','2022-04-21 15:19:07');
INSERT INTO order_details VALUES('58','44','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:07','2022-04-21 15:19:07');
INSERT INTO order_details VALUES('59','45','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:14','2022-04-21 15:19:14');
INSERT INTO order_details VALUES('60','45','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:14','2022-04-21 15:19:14');
INSERT INTO order_details VALUES('61','45','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:14','2022-04-21 15:19:14');
INSERT INTO order_details VALUES('62','46','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:20','2022-04-21 15:19:20');
INSERT INTO order_details VALUES('63','46','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:20','2022-04-21 15:19:20');
INSERT INTO order_details VALUES('64','46','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:20','2022-04-21 15:19:20');
INSERT INTO order_details VALUES('65','47','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:35','2022-04-21 15:19:35');
INSERT INTO order_details VALUES('66','47','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:35','2022-04-21 15:19:35');
INSERT INTO order_details VALUES('67','47','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:35','2022-04-21 15:19:35');
INSERT INTO order_details VALUES('68','48','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:43','2022-04-21 15:19:43');
INSERT INTO order_details VALUES('69','48','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:43','2022-04-21 15:19:43');
INSERT INTO order_details VALUES('70','48','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:19:43','2022-04-21 15:19:43');
INSERT INTO order_details VALUES('71','49','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:26','2022-04-21 15:20:26');
INSERT INTO order_details VALUES('72','49','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:26','2022-04-21 15:20:26');
INSERT INTO order_details VALUES('73','49','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:26','2022-04-21 15:20:26');
INSERT INTO order_details VALUES('74','50','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:36','2022-04-21 15:20:36');
INSERT INTO order_details VALUES('75','50','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:36','2022-04-21 15:20:36');
INSERT INTO order_details VALUES('76','50','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:36','2022-04-21 15:20:36');
INSERT INTO order_details VALUES('77','51','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:43','2022-04-21 15:20:43');
INSERT INTO order_details VALUES('78','51','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:43','2022-04-21 15:20:43');
INSERT INTO order_details VALUES('79','51','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:20:43','2022-04-21 15:20:43');
INSERT INTO order_details VALUES('80','52','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:16','2022-04-21 15:21:16');
INSERT INTO order_details VALUES('81','52','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:16','2022-04-21 15:21:16');
INSERT INTO order_details VALUES('82','52','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:16','2022-04-21 15:21:16');
INSERT INTO order_details VALUES('83','53','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:19','2022-04-21 15:21:19');
INSERT INTO order_details VALUES('84','53','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:19','2022-04-21 15:21:19');
INSERT INTO order_details VALUES('85','53','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:19','2022-04-21 15:21:19');
INSERT INTO order_details VALUES('86','54','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:34','2022-04-21 15:21:34');
INSERT INTO order_details VALUES('87','54','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:34','2022-04-21 15:21:34');
INSERT INTO order_details VALUES('88','54','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:21:34','2022-04-21 15:21:34');
INSERT INTO order_details VALUES('89','55','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:23:39','2022-04-21 15:23:39');
INSERT INTO order_details VALUES('90','55','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:23:39','2022-04-21 15:23:39');
INSERT INTO order_details VALUES('91','55','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:23:39','2022-04-21 15:23:39');
INSERT INTO order_details VALUES('92','56','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:34','2022-04-21 15:26:34');
INSERT INTO order_details VALUES('93','56','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:34','2022-04-21 15:26:34');
INSERT INTO order_details VALUES('94','56','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:34','2022-04-21 15:26:34');
INSERT INTO order_details VALUES('95','57','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:46','2022-04-21 15:26:46');
INSERT INTO order_details VALUES('96','57','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:46','2022-04-21 15:26:46');
INSERT INTO order_details VALUES('97','57','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:46','2022-04-21 15:26:46');
INSERT INTO order_details VALUES('98','58','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:53','2022-04-21 15:26:53');
INSERT INTO order_details VALUES('99','58','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:53','2022-04-21 15:26:53');
INSERT INTO order_details VALUES('100','58','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:26:53','2022-04-21 15:26:53');
INSERT INTO order_details VALUES('101','59','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:27:24','2022-04-21 15:27:24');
INSERT INTO order_details VALUES('102','59','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:27:24','2022-04-21 15:27:24');
INSERT INTO order_details VALUES('103','59','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:27:24','2022-04-21 15:27:24');
INSERT INTO order_details VALUES('104','60','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:01','2022-04-21 15:28:01');
INSERT INTO order_details VALUES('105','60','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:01','2022-04-21 15:28:01');
INSERT INTO order_details VALUES('106','60','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:01','2022-04-21 15:28:01');
INSERT INTO order_details VALUES('107','61','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:49','2022-04-21 15:28:49');
INSERT INTO order_details VALUES('108','61','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:49','2022-04-21 15:28:49');
INSERT INTO order_details VALUES('109','61','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:49','2022-04-21 15:28:49');
INSERT INTO order_details VALUES('110','62','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:53','2022-04-21 15:28:53');
INSERT INTO order_details VALUES('111','62','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:53','2022-04-21 15:28:53');
INSERT INTO order_details VALUES('112','62','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:28:53','2022-04-21 15:28:53');
INSERT INTO order_details VALUES('113','63','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:31:49','2022-04-21 15:31:49');
INSERT INTO order_details VALUES('114','63','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:31:49','2022-04-21 15:31:49');
INSERT INTO order_details VALUES('115','63','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:31:49','2022-04-21 15:31:49');
INSERT INTO order_details VALUES('116','64','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:31:56','2022-04-21 15:31:56');
INSERT INTO order_details VALUES('117','64','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:31:56','2022-04-21 15:31:56');
INSERT INTO order_details VALUES('118','64','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:31:56','2022-04-21 15:31:56');
INSERT INTO order_details VALUES('119','65','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:39:45','2022-04-21 15:39:45');
INSERT INTO order_details VALUES('120','65','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:39:45','2022-04-21 15:39:45');
INSERT INTO order_details VALUES('121','65','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:39:45','2022-04-21 15:39:45');
INSERT INTO order_details VALUES('122','66','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:43:39','2022-04-21 15:43:39');
INSERT INTO order_details VALUES('123','66','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:43:39','2022-04-21 15:43:39');
INSERT INTO order_details VALUES('124','66','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:43:39','2022-04-21 15:43:39');
INSERT INTO order_details VALUES('125','67','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-21 15:43:41','2022-04-21 15:43:41');
INSERT INTO order_details VALUES('126','67','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-21 15:43:41','2022-04-21 15:43:41');
INSERT INTO order_details VALUES('127','67','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-21 15:43:41','2022-04-21 15:43:41');
INSERT INTO order_details VALUES('128','68','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-22 10:30:38','2022-04-22 10:30:38');
INSERT INTO order_details VALUES('129','68','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-22 10:30:38','2022-04-22 10:30:38');
INSERT INTO order_details VALUES('130','68','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-22 10:30:38','2022-04-22 10:30:38');
INSERT INTO order_details VALUES('131','69','3','155','','900','0','100','1','unpaid','pending','home_delivery','','','2022-04-22 10:32:24','2022-04-22 10:32:24');
INSERT INTO order_details VALUES('132','69','12','88','39','1500','0','20','1','unpaid','pending','home_delivery','','','2022-04-22 10:32:24','2022-04-22 10:32:24');
INSERT INTO order_details VALUES('133','69','12','71','','600','0','0','1','unpaid','pending','home_delivery','','','2022-04-22 10:32:24','2022-04-22 10:32:24');
INSERT INTO order_details VALUES('134','70','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-22 14:38:30','2022-04-22 14:38:30');
INSERT INTO order_details VALUES('135','71','12','140','DarkGreen-M','95','0','0','1','unpaid','pending','home_delivery','','','2022-04-24 12:20:32','2022-04-24 12:20:32');
INSERT INTO order_details VALUES('136','72','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:22:46','2022-04-24 20:22:46');
INSERT INTO order_details VALUES('137','73','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:23:21','2022-04-24 20:23:21');
INSERT INTO order_details VALUES('138','74','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:24:54','2022-04-24 20:24:54');
INSERT INTO order_details VALUES('139','75','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:26:11','2022-04-24 20:26:11');
INSERT INTO order_details VALUES('140','76','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:29:18','2022-04-24 20:29:18');
INSERT INTO order_details VALUES('141','77','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:30:36','2022-04-24 20:30:36');
INSERT INTO order_details VALUES('142','78','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:33:17','2022-04-24 20:33:17');
INSERT INTO order_details VALUES('143','79','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:35:54','2022-04-24 20:35:54');
INSERT INTO order_details VALUES('144','80','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:37:27','2022-04-24 20:37:27');
INSERT INTO order_details VALUES('145','81','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:39:07','2022-04-24 20:39:07');
INSERT INTO order_details VALUES('146','82','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:42:25','2022-04-24 20:42:25');
INSERT INTO order_details VALUES('147','83','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:43:55','2022-04-24 20:43:55');
INSERT INTO order_details VALUES('148','84','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:46:49','2022-04-24 20:46:49');
INSERT INTO order_details VALUES('149','85','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:49:39','2022-04-24 20:49:39');
INSERT INTO order_details VALUES('150','86','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:51:36','2022-04-24 20:51:36');
INSERT INTO order_details VALUES('151','87','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 20:54:07','2022-04-24 20:54:07');
INSERT INTO order_details VALUES('152','88','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 21:03:45','2022-04-24 21:03:45');
INSERT INTO order_details VALUES('153','89','12','137','','17.6','2.29','0','1','unpaid','pending','home_delivery','','','2022-04-24 21:34:12','2022-04-24 21:34:12');
INSERT INTO order_details VALUES('154','90','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:46:27','2022-04-25 14:46:27');
INSERT INTO order_details VALUES('155','90','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:46:27','2022-04-25 14:46:27');
INSERT INTO order_details VALUES('156','91','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:48:44','2022-04-25 14:48:44');
INSERT INTO order_details VALUES('157','91','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:48:45','2022-04-25 14:48:45');
INSERT INTO order_details VALUES('158','92','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:49:52','2022-04-25 14:49:52');
INSERT INTO order_details VALUES('159','92','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:49:52','2022-04-25 14:49:52');
INSERT INTO order_details VALUES('160','93','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:50:16','2022-04-25 14:50:16');
INSERT INTO order_details VALUES('161','93','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:50:16','2022-04-25 14:50:16');
INSERT INTO order_details VALUES('162','94','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:50:29','2022-04-25 14:50:29');
INSERT INTO order_details VALUES('163','94','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:50:29','2022-04-25 14:50:29');
INSERT INTO order_details VALUES('164','95','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:00','2022-04-25 14:51:00');
INSERT INTO order_details VALUES('165','95','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:00','2022-04-25 14:51:00');
INSERT INTO order_details VALUES('166','96','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:19','2022-04-25 14:51:19');
INSERT INTO order_details VALUES('167','96','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:19','2022-04-25 14:51:19');
INSERT INTO order_details VALUES('168','97','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:28','2022-04-25 14:51:28');
INSERT INTO order_details VALUES('169','97','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:28','2022-04-25 14:51:28');
INSERT INTO order_details VALUES('170','98','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:38','2022-04-25 14:51:38');
INSERT INTO order_details VALUES('171','98','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:51:38','2022-04-25 14:51:38');
INSERT INTO order_details VALUES('172','99','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:52:01','2022-04-25 14:52:01');
INSERT INTO order_details VALUES('173','99','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:52:01','2022-04-25 14:52:01');
INSERT INTO order_details VALUES('174','100','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:52:53','2022-04-25 14:52:53');
INSERT INTO order_details VALUES('175','100','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:52:53','2022-04-25 14:52:53');
INSERT INTO order_details VALUES('176','101','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:54:37','2022-04-25 14:54:37');
INSERT INTO order_details VALUES('177','101','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:54:37','2022-04-25 14:54:37');
INSERT INTO order_details VALUES('178','102','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:55:51','2022-04-25 14:55:51');
INSERT INTO order_details VALUES('179','102','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:55:51','2022-04-25 14:55:51');
INSERT INTO order_details VALUES('180','103','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:56:43','2022-04-25 14:56:43');
INSERT INTO order_details VALUES('181','103','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:56:43','2022-04-25 14:56:43');
INSERT INTO order_details VALUES('182','104','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:57:17','2022-04-25 14:57:17');
INSERT INTO order_details VALUES('183','104','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:57:17','2022-04-25 14:57:17');
INSERT INTO order_details VALUES('184','105','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:04','2022-04-25 14:58:04');
INSERT INTO order_details VALUES('185','105','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:04','2022-04-25 14:58:04');
INSERT INTO order_details VALUES('186','106','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:20','2022-04-25 14:58:20');
INSERT INTO order_details VALUES('187','106','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:20','2022-04-25 14:58:20');
INSERT INTO order_details VALUES('188','107','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:35','2022-04-25 14:58:35');
INSERT INTO order_details VALUES('189','107','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:35','2022-04-25 14:58:35');
INSERT INTO order_details VALUES('190','108','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:51','2022-04-25 14:58:51');
INSERT INTO order_details VALUES('191','108','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 14:58:51','2022-04-25 14:58:51');
INSERT INTO order_details VALUES('192','109','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:03:54','2022-04-25 15:03:54');
INSERT INTO order_details VALUES('193','109','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:03:54','2022-04-25 15:03:54');
INSERT INTO order_details VALUES('194','110','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:04:09','2022-04-25 15:04:09');
INSERT INTO order_details VALUES('195','110','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:04:09','2022-04-25 15:04:09');
INSERT INTO order_details VALUES('196','111','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:04:39','2022-04-25 15:04:39');
INSERT INTO order_details VALUES('197','111','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:04:39','2022-04-25 15:04:39');
INSERT INTO order_details VALUES('198','112','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:04:59','2022-04-25 15:04:59');
INSERT INTO order_details VALUES('199','112','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:04:59','2022-04-25 15:04:59');
INSERT INTO order_details VALUES('200','113','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:06:01','2022-04-25 15:06:01');
INSERT INTO order_details VALUES('201','113','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:06:01','2022-04-25 15:06:01');
INSERT INTO order_details VALUES('202','114','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:07:38','2022-04-25 15:07:38');
INSERT INTO order_details VALUES('203','114','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:07:39','2022-04-25 15:07:39');
INSERT INTO order_details VALUES('204','115','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:07:40','2022-04-25 15:07:40');
INSERT INTO order_details VALUES('205','115','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:07:40','2022-04-25 15:07:40');
INSERT INTO order_details VALUES('206','116','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:08:40','2022-04-25 15:08:40');
INSERT INTO order_details VALUES('207','116','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:08:40','2022-04-25 15:08:40');
INSERT INTO order_details VALUES('208','117','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:08:55','2022-04-25 15:08:55');
INSERT INTO order_details VALUES('209','117','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:08:55','2022-04-25 15:08:55');
INSERT INTO order_details VALUES('210','118','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:10:06','2022-04-25 15:10:06');
INSERT INTO order_details VALUES('211','118','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:10:06','2022-04-25 15:10:06');
INSERT INTO order_details VALUES('212','119','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:10:28','2022-04-25 15:10:28');
INSERT INTO order_details VALUES('213','119','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:10:28','2022-04-25 15:10:28');
INSERT INTO order_details VALUES('214','120','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:10:46','2022-04-25 15:10:46');
INSERT INTO order_details VALUES('215','120','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:10:46','2022-04-25 15:10:46');
INSERT INTO order_details VALUES('216','121','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:11:39','2022-04-25 15:11:39');
INSERT INTO order_details VALUES('217','121','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:11:39','2022-04-25 15:11:39');
INSERT INTO order_details VALUES('218','122','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:11:46','2022-04-25 15:11:46');
INSERT INTO order_details VALUES('219','122','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:11:46','2022-04-25 15:11:46');
INSERT INTO order_details VALUES('220','123','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:10','2022-04-25 15:12:10');
INSERT INTO order_details VALUES('221','123','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:10','2022-04-25 15:12:10');
INSERT INTO order_details VALUES('222','124','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:32','2022-04-25 15:12:32');
INSERT INTO order_details VALUES('223','124','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:32','2022-04-25 15:12:32');
INSERT INTO order_details VALUES('224','125','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:43','2022-04-25 15:12:43');
INSERT INTO order_details VALUES('225','125','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:43','2022-04-25 15:12:43');
INSERT INTO order_details VALUES('226','126','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:53','2022-04-25 15:12:53');
INSERT INTO order_details VALUES('227','126','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:12:53','2022-04-25 15:12:53');
INSERT INTO order_details VALUES('228','127','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:13:54','2022-04-25 15:13:54');
INSERT INTO order_details VALUES('229','127','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:13:54','2022-04-25 15:13:54');
INSERT INTO order_details VALUES('230','128','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:14:02','2022-04-25 15:14:02');
INSERT INTO order_details VALUES('231','128','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:14:02','2022-04-25 15:14:02');
INSERT INTO order_details VALUES('232','129','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:14:05','2022-04-25 15:14:05');
INSERT INTO order_details VALUES('233','129','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:14:05','2022-04-25 15:14:05');
INSERT INTO order_details VALUES('234','130','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:14:45','2022-04-25 15:14:45');
INSERT INTO order_details VALUES('235','130','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:14:45','2022-04-25 15:14:45');
INSERT INTO order_details VALUES('236','131','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:07','2022-04-25 15:15:07');
INSERT INTO order_details VALUES('237','131','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:07','2022-04-25 15:15:07');
INSERT INTO order_details VALUES('238','132','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:13','2022-04-25 15:15:13');
INSERT INTO order_details VALUES('239','132','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:13','2022-04-25 15:15:13');
INSERT INTO order_details VALUES('240','133','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:17','2022-04-25 15:15:17');
INSERT INTO order_details VALUES('241','133','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:17','2022-04-25 15:15:17');
INSERT INTO order_details VALUES('242','134','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:31','2022-04-25 15:15:31');
INSERT INTO order_details VALUES('243','134','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:31','2022-04-25 15:15:31');
INSERT INTO order_details VALUES('244','135','12','149','full-asd','84.84','25.45','9.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:44','2022-04-25 15:15:44');
INSERT INTO order_details VALUES('245','135','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 15:15:44','2022-04-25 15:15:44');
INSERT INTO order_details VALUES('246','136','12','149','full-asd','84.84','25.45','9.98','1','paid','pending','home_delivery','','','2022-04-25 15:16:51','2022-04-25 15:41:09');
INSERT INTO order_details VALUES('247','136','12','152','AntiqueWhite-l-20','200','0','49.98','1','paid','pending','home_delivery','','','2022-04-25 15:16:51','2022-04-25 15:41:09');
INSERT INTO order_details VALUES('248','137','12','152','AntiqueWhite-l-20','200','0','49.98','1','paid','pending','home_delivery','','','2022-04-25 15:45:52','2022-04-25 15:46:20');
INSERT INTO order_details VALUES('249','137','12','136','','299.96','11.98','100','1','paid','pending','home_delivery','','','2022-04-25 15:45:52','2022-04-25 15:46:20');
INSERT INTO order_details VALUES('250','138','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 17:22:06','2022-04-25 17:22:06');
INSERT INTO order_details VALUES('251','138','12','136','','299.96','11.98','100','1','unpaid','pending','home_delivery','','','2022-04-25 17:22:06','2022-04-25 17:22:06');
INSERT INTO order_details VALUES('252','139','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 17:27:08','2022-04-25 17:27:08');
INSERT INTO order_details VALUES('253','139','12','136','','299.96','11.98','100','1','unpaid','pending','home_delivery','','','2022-04-25 17:27:08','2022-04-25 17:27:08');
INSERT INTO order_details VALUES('254','140','12','152','AntiqueWhite-l-20','200','0','49.98','1','unpaid','pending','home_delivery','','','2022-04-25 17:38:12','2022-04-25 17:38:12');
INSERT INTO order_details VALUES('255','140','12','136','','299.96','11.98','100','1','unpaid','pending','home_delivery','','','2022-04-25 17:38:12','2022-04-25 17:38:12');
INSERT INTO order_details VALUES('256','141','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:53:34','2022-04-25 17:53:34');
INSERT INTO order_details VALUES('257','142','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:54:36','2022-04-25 17:54:36');
INSERT INTO order_details VALUES('258','143','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:55:18','2022-04-25 17:55:18');
INSERT INTO order_details VALUES('259','144','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:55:44','2022-04-25 17:55:44');
INSERT INTO order_details VALUES('260','145','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:56:17','2022-04-25 17:56:17');
INSERT INTO order_details VALUES('261','146','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:57:12','2022-04-25 17:57:12');
INSERT INTO order_details VALUES('262','147','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:57:36','2022-04-25 17:57:36');
INSERT INTO order_details VALUES('263','148','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:57:42','2022-04-25 17:57:42');
INSERT INTO order_details VALUES('264','149','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:58:25','2022-04-25 17:58:25');
INSERT INTO order_details VALUES('265','150','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:59:02','2022-04-25 17:59:02');
INSERT INTO order_details VALUES('266','151','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-04-25 17:59:08','2022-04-25 17:59:08');
INSERT INTO order_details VALUES('267','152','12','84','','650','0','50','1','paid','pending','home_delivery','','','2022-04-25 18:02:18','2022-04-25 18:04:13');
INSERT INTO order_details VALUES('268','153','12','136','','299.96','11.98','100','1','paid','pending','home_delivery','','','2022-04-25 18:08:43','2022-04-25 18:08:53');
INSERT INTO order_details VALUES('269','154','12','136','','299.96','11.98','100','1','paid','pending','home_delivery','','','2022-04-25 18:11:27','2022-04-25 18:12:21');
INSERT INTO order_details VALUES('270','155','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:43:41','2022-04-26 14:43:41');
INSERT INTO order_details VALUES('271','156','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:44:59','2022-04-26 14:44:59');
INSERT INTO order_details VALUES('272','157','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:47:36','2022-04-26 14:47:36');
INSERT INTO order_details VALUES('273','158','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:49:11','2022-04-26 14:49:11');
INSERT INTO order_details VALUES('274','159','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:51:39','2022-04-26 14:51:39');
INSERT INTO order_details VALUES('275','160','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:52:43','2022-04-26 14:52:43');
INSERT INTO order_details VALUES('276','161','12','122','','350','0','0','1','unpaid','pending','home_delivery','','','2022-04-26 14:54:51','2022-04-26 14:54:51');
INSERT INTO order_details VALUES('277','162','12','88','39','1500','0','20','1','unpaid','pending','','','','2022-04-27 11:53:39','2022-04-27 11:53:39');
INSERT INTO order_details VALUES('278','162','12','122','','350','0','0','1','unpaid','pending','','','','2022-04-27 11:53:39','2022-04-27 11:53:39');
INSERT INTO order_details VALUES('279','163','12','78','','1800','0','0','1','unpaid','pending','','','','2022-04-27 12:51:50','2022-04-27 12:51:50');
INSERT INTO order_details VALUES('280','164','12','78','','1800','0','0','1','unpaid','pending','','','','2022-04-27 13:36:16','2022-04-27 13:36:16');
INSERT INTO order_details VALUES('281','165','12','78','','1800','0','0','1','unpaid','pending','','','','2022-04-27 13:40:40','2022-04-27 13:40:40');
INSERT INTO order_details VALUES('282','166','12','140','DarkGreen-M','95','0','0','1','unpaid','pending','home_delivery','','','2022-04-28 14:01:41','2022-04-28 14:01:41');
INSERT INTO order_details VALUES('283','167','12','140','DarkGreen-M','95','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 10:48:18','2022-05-02 10:48:18');
INSERT INTO order_details VALUES('284','168','12','140','DarkGreen-M','95','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 10:54:07','2022-05-02 10:54:07');
INSERT INTO order_details VALUES('285','169','12','140','DarkGreen-M','95','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 10:56:32','2022-05-02 10:56:32');
INSERT INTO order_details VALUES('286','170','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:28:55','2022-05-02 11:28:55');
INSERT INTO order_details VALUES('287','171','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:29:21','2022-05-02 11:29:21');
INSERT INTO order_details VALUES('288','172','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:33:55','2022-05-02 11:33:55');
INSERT INTO order_details VALUES('289','173','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:34:17','2022-05-02 11:34:17');
INSERT INTO order_details VALUES('290','174','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:35:45','2022-05-02 11:35:45');
INSERT INTO order_details VALUES('291','175','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:36:09','2022-05-02 11:36:09');
INSERT INTO order_details VALUES('292','176','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:36:56','2022-05-02 11:36:56');
INSERT INTO order_details VALUES('293','177','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:38:37','2022-05-02 11:38:37');
INSERT INTO order_details VALUES('294','178','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:41:24','2022-05-02 11:41:24');
INSERT INTO order_details VALUES('295','179','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:42:44','2022-05-02 11:42:44');
INSERT INTO order_details VALUES('296','180','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:43:05','2022-05-02 11:43:05');
INSERT INTO order_details VALUES('297','181','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:44:09','2022-05-02 11:44:09');
INSERT INTO order_details VALUES('298','182','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:44:18','2022-05-02 11:44:18');
INSERT INTO order_details VALUES('299','183','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:45:30','2022-05-02 11:45:30');
INSERT INTO order_details VALUES('300','184','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:45:33','2022-05-02 11:45:33');
INSERT INTO order_details VALUES('301','185','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:46:30','2022-05-02 11:46:30');
INSERT INTO order_details VALUES('302','186','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:48:47','2022-05-02 11:48:47');
INSERT INTO order_details VALUES('303','187','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:49:26','2022-05-02 11:49:26');
INSERT INTO order_details VALUES('304','188','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:49:42','2022-05-02 11:49:42');
INSERT INTO order_details VALUES('305','189','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:49:58','2022-05-02 11:49:58');
INSERT INTO order_details VALUES('306','190','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:50:15','2022-05-02 11:50:15');
INSERT INTO order_details VALUES('307','191','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:50:59','2022-05-02 11:50:59');
INSERT INTO order_details VALUES('308','192','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:52:04','2022-05-02 11:52:04');
INSERT INTO order_details VALUES('309','192','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 11:52:04','2022-05-02 11:52:04');
INSERT INTO order_details VALUES('310','193','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 11:54:26','2022-05-02 11:54:26');
INSERT INTO order_details VALUES('311','193','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 11:54:26','2022-05-02 11:54:26');
INSERT INTO order_details VALUES('312','194','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:07:42','2022-05-02 12:07:42');
INSERT INTO order_details VALUES('313','194','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:07:42','2022-05-02 12:07:42');
INSERT INTO order_details VALUES('314','195','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:08:38','2022-05-02 12:08:38');
INSERT INTO order_details VALUES('315','195','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:08:38','2022-05-02 12:08:38');
INSERT INTO order_details VALUES('316','196','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:09:48','2022-05-02 12:09:48');
INSERT INTO order_details VALUES('317','196','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:09:48','2022-05-02 12:09:48');
INSERT INTO order_details VALUES('318','197','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:10:15','2022-05-02 12:10:15');
INSERT INTO order_details VALUES('319','197','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:10:15','2022-05-02 12:10:15');
INSERT INTO order_details VALUES('320','198','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:10:32','2022-05-02 12:10:32');
INSERT INTO order_details VALUES('321','198','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:10:32','2022-05-02 12:10:32');
INSERT INTO order_details VALUES('322','199','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:11:46','2022-05-02 12:11:46');
INSERT INTO order_details VALUES('323','199','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:11:46','2022-05-02 12:11:46');
INSERT INTO order_details VALUES('324','200','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:12:19','2022-05-02 12:12:19');
INSERT INTO order_details VALUES('325','200','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:12:19','2022-05-02 12:12:19');
INSERT INTO order_details VALUES('326','201','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:13:18','2022-05-02 12:13:18');
INSERT INTO order_details VALUES('327','201','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:13:18','2022-05-02 12:13:18');
INSERT INTO order_details VALUES('328','202','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:13:25','2022-05-02 12:13:25');
INSERT INTO order_details VALUES('329','202','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:13:25','2022-05-02 12:13:25');
INSERT INTO order_details VALUES('330','203','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:13:28','2022-05-02 12:13:28');
INSERT INTO order_details VALUES('331','203','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:13:28','2022-05-02 12:13:28');
INSERT INTO order_details VALUES('332','204','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:17:24','2022-05-02 12:17:24');
INSERT INTO order_details VALUES('333','204','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:17:24','2022-05-02 12:17:24');
INSERT INTO order_details VALUES('334','205','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:17:35','2022-05-02 12:17:35');
INSERT INTO order_details VALUES('335','205','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:17:35','2022-05-02 12:17:35');
INSERT INTO order_details VALUES('336','206','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:17:38','2022-05-02 12:17:38');
INSERT INTO order_details VALUES('337','206','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:17:38','2022-05-02 12:17:38');
INSERT INTO order_details VALUES('338','207','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:18:45','2022-05-02 12:18:45');
INSERT INTO order_details VALUES('339','207','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:18:45','2022-05-02 12:18:45');
INSERT INTO order_details VALUES('340','208','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:20:57','2022-05-02 12:20:57');
INSERT INTO order_details VALUES('341','208','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:20:57','2022-05-02 12:20:57');
INSERT INTO order_details VALUES('342','209','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:21:24','2022-05-02 12:21:24');
INSERT INTO order_details VALUES('343','209','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:21:24','2022-05-02 12:21:24');
INSERT INTO order_details VALUES('344','210','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:21:53','2022-05-02 12:21:53');
INSERT INTO order_details VALUES('345','210','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:21:53','2022-05-02 12:21:53');
INSERT INTO order_details VALUES('346','211','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:28:26','2022-05-02 12:28:26');
INSERT INTO order_details VALUES('347','211','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:28:26','2022-05-02 12:28:26');
INSERT INTO order_details VALUES('348','212','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:28:54','2022-05-02 12:28:54');
INSERT INTO order_details VALUES('349','212','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:28:54','2022-05-02 12:28:54');
INSERT INTO order_details VALUES('350','213','12','84','','650','0','50','1','unpaid','pending','home_delivery','','','2022-05-02 12:29:14','2022-05-02 12:29:14');
INSERT INTO order_details VALUES('351','213','12','82','','1000','0','0','1','unpaid','pending','home_delivery','','','2022-05-02 12:29:14','2022-05-02 12:29:14');
INSERT INTO order_details VALUES('352','214','12','151','','350','0','29.99','1','unpaid','pending','home_delivery','','','2022-05-03 10:25:27','2022-05-03 10:25:27');
INSERT INTO order_details VALUES('353','215','12','151','','350','0','29.99','1','unpaid','pending','home_delivery','','','2022-05-03 10:38:44','2022-05-03 10:38:44');
INSERT INTO order_details VALUES('354','216','12','151','','350','0','29.99','1','unpaid','pending','home_delivery','','','2022-05-03 10:40:26','2022-05-03 10:40:26');
INSERT INTO order_details VALUES('355','217','12','151','','350','0','29.99','1','unpaid','pending','home_delivery','','','2022-05-03 10:40:32','2022-05-03 10:40:32');
INSERT INTO order_details VALUES('356','218','3','127','Amethyst-regular-soft','180','0','100','1','unpaid','pending','home_delivery','','','2022-05-03 10:42:59','2022-05-03 10:42:59');
INSERT INTO order_details VALUES('357','220','12','82','','1000','0','0','1','unpaid','pending','','','','2022-05-03 11:21:14','2022-05-03 11:21:14');
INSERT INTO order_details VALUES('358','221','12','82','','1000','0','0','1','unpaid','pending','','','','2022-05-03 11:22:35','2022-05-03 11:22:35');
INSERT INTO order_details VALUES('359','222','12','82','','1000','0','0','1','unpaid','pending','','','','2022-05-03 11:23:04','2022-05-03 11:23:04');
INSERT INTO order_details VALUES('360','223','12','82','','1000','0','0','1','unpaid','pending','','','','2022-05-03 11:23:46','2022-05-03 11:23:46');
INSERT INTO order_details VALUES('361','224','12','82','','1000','0','0','1','unpaid','pending','','','','2022-05-03 11:26:34','2022-05-03 11:26:34');


DROP TABLE IF EXISTS orders;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_payment` int(1) NOT NULL DEFAULT 0,
  `manual_payment_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `location_charge` double NOT NULL DEFAULT 0,
  `coupon_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO orders VALUES('1','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"Purano Thimi, Bhaktapur","country":"Nepal","city":"Bhaktapur","postal_code":"55400","phone":"9803127288","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1450','0','0','20220413-10513553','1649847095','0','0','0','0','2022-04-13 10:51:35','2022-04-13 10:51:36');
INSERT INTO orders VALUES('2','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"g","country":"Nepal","city":"g","postal_code":"2","phone":"2","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','29.89','0','0','20220415-10144093','1650017680','0','0','0','0','2022-04-15 10:14:40','2022-04-15 10:14:40');
INSERT INTO orders VALUES('3','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"g","country":"Nepal","city":"g","postal_code":"2","phone":"2","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','660','0','0','20220415-10181895','1650017898','0','0','0','0','2022-04-15 10:18:18','2022-04-15 10:18:18');
INSERT INTO orders VALUES('4','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"123","country":"Nepal","city":"qwe","postal_code":"123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','380','0','0','20220417-08525599','1650185575','0','1','1','0','2022-04-17 08:52:55','2022-04-17 11:00:54');
INSERT INTO orders VALUES('5','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"asdf","country":"Nepal","city":"asdfas","postal_code":"123","phone":"1234","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','360','0','0','20220417-12581584','1650200295','0','0','0','0','2022-04-17 12:58:15','2022-04-17 12:58:15');
INSERT INTO orders VALUES('6','3','','{"name":"Mr. Seller","email":"joshibipin2052@gmail.com","address":"1","country":"Nepal","city":"1","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1510','0','0','20220418-12171529','1650284235','0','0','0','0','2022-04-18 12:17:15','2022-04-18 12:17:15');
INSERT INTO orders VALUES('7','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23015276','1650302212','0','0','0','0','2022-04-18 23:01:52','2022-04-18 23:01:52');
INSERT INTO orders VALUES('8','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23021440','1650302234','0','0','0','0','2022-04-18 23:02:14','2022-04-18 23:02:14');
INSERT INTO orders VALUES('9','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23052520','1650302425','0','0','0','0','2022-04-18 23:05:25','2022-04-18 23:05:25');
INSERT INTO orders VALUES('10','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23064172','1650302501','0','0','0','0','2022-04-18 23:06:41','2022-04-18 23:06:41');
INSERT INTO orders VALUES('11','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23065825','1650302518','0','0','0','0','2022-04-18 23:06:58','2022-04-18 23:06:58');
INSERT INTO orders VALUES('12','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23073933','1650302559','0','0','0','0','2022-04-18 23:07:39','2022-04-18 23:07:39');
INSERT INTO orders VALUES('13','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23074181','1650302561','0','0','0','0','2022-04-18 23:07:41','2022-04-18 23:07:41');
INSERT INTO orders VALUES('14','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23113051','1650302790','0','0','0','0','2022-04-18 23:11:30','2022-04-18 23:11:30');
INSERT INTO orders VALUES('15','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23114314','1650302803','0','0','0','0','2022-04-18 23:11:43','2022-04-18 23:11:43');
INSERT INTO orders VALUES('16','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','0','0','20220418-23151555','1650303015','0','0','0','0','2022-04-18 23:15:15','2022-04-18 23:15:15');
INSERT INTO orders VALUES('17','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"11","delivery_location":"2","country":"Nepal","city":"11","postal_code":"11","phone":"11","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1569.89','10','0','20220418-23161135','1650303071','0','0','0','0','2022-04-18 23:16:11','2022-04-18 23:16:11');
INSERT INTO orders VALUES('18','3','','{"name":"Mr. Seller","email":"joshibipin2052@gmail.com","address":"1","delivery_location":"2","country":"Nepal","city":"1","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1550','10','0','20220419-00345884','1650307798','0','0','0','0','2022-04-19 00:34:58','2022-04-19 00:34:58');
INSERT INTO orders VALUES('19','3','','{"name":"Mr. Seller","email":"joshibipin2052@gmail.com","address":"1","delivery_location":"2","country":"Nepal","city":"1","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1550','10','0','20220419-00375627','1650307976','0','0','0','0','2022-04-19 00:37:56','2022-04-19 00:37:56');
INSERT INTO orders VALUES('20','3','','{"name":"Mr. Seller","email":"joshibipin2052@gmail.com","address":"1","delivery_location":"2","country":"Nepal","city":"1","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1550','10','0','20220419-00402683','1650308126','1','1','1','0','2022-04-19 00:40:26','2022-04-19 00:50:58');
INSERT INTO orders VALUES('21','3','','{"name":"Mr. Seller","email":"joshibipin2052@gmail.com","address":"1","delivery_location":"2","country":"Nepal","city":"1","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1530','10','0','20220419-00575895','1650309178','1','0','0','0','2022-04-19 00:57:58','2022-04-19 00:58:30');
INSERT INTO orders VALUES('22','8','','{"name":"Mr.Seller","email":"joshibipin2052@gmail.com","address":"1","delivery_location":"2","country":"Nepal","city":"1","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1550','10','50','20220419-113130','1650347190','0','1','1','0','2022-04-19 11:31:30','2022-04-19 11:31:30');
INSERT INTO orders VALUES('23','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','360','10','0','20220419-12055937','1650349259','0','0','0','0','2022-04-19 12:05:59','2022-04-19 12:05:59');
INSERT INTO orders VALUES('24','276','','{"name":"123","email":"jawasa3467@aikusy.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1060','10','0','20220419-15045899','1650359998','0','0','0','0','2022-04-19 15:04:58','2022-04-19 15:04:59');
INSERT INTO orders VALUES('25','276','','{"name":"123","email":"jawasa3467@aikusy.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','1060','10','0','20220419-15070543','1650360125','0','0','0','0','2022-04-19 15:07:05','2022-04-19 15:07:05');
INSERT INTO orders VALUES('26','276','','{"name":"123","email":"jawasa3467@aikusy.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','460','10','0','20220419-16093059','1650363870','0','0','0','0','2022-04-19 16:09:30','2022-04-19 16:09:30');
INSERT INTO orders VALUES('27','276','','{"name":"123","email":"jawasa3467@aikusy.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','460','10','0','20220419-16123120','1650364051','0','0','0','0','2022-04-19 16:12:31','2022-04-19 16:12:31');
INSERT INTO orders VALUES('28','276','','{"name":"123","email":"jawasa3467@aikusy.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','3310','10','0','20220419-16213328','1650364593','0','0','0','0','2022-04-19 16:21:33','2022-04-19 16:21:33');
INSERT INTO orders VALUES('29','276','','{"name":"123","email":"jawasa3467@aikusy.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','710','10','0','20220419-16300221','1650365102','0','0','0','0','2022-04-19 16:30:02','2022-04-19 16:30:02');
INSERT INTO orders VALUES('30','276','','{"name":"123","email":"joshibipin2052@gmail.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','710','10','0','20220419-17060263','1650367262','0','0','0','0','2022-04-19 17:06:02','2022-04-19 17:06:02');
INSERT INTO orders VALUES('31','276','','{"name":"123","email":"joshibipin2052@gmail.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','10','10','0','20220419-17080777','1650367387','0','0','0','0','2022-04-19 17:08:07','2022-04-19 17:08:07');
INSERT INTO orders VALUES('32','276','','{"name":"123","email":"joshibipin2052@gmail.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','710','10','0','20220419-17290786','1650368647','0','1','1','0','2022-04-19 17:29:07','2022-04-19 17:39:10');
INSERT INTO orders VALUES('33','276','','{"name":"123","email":"joshibipin2052@gmail.com","address":"q","delivery_location":"2","country":"Nepal","city":"q","postal_code":"1","phone":"1","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','710','10','0','20220419-17355788','1650369057','0','1','1','0','2022-04-19 17:35:57','2022-04-19 17:39:08');
INSERT INTO orders VALUES('34','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14503955','1650531939','0','0','0','0','2022-04-21 14:50:39','2022-04-21 14:50:39');
INSERT INTO orders VALUES('35','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14531736','1650532097','0','0','0','0','2022-04-21 14:53:17','2022-04-21 14:53:17');
INSERT INTO orders VALUES('36','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14544884','1650532188','0','0','0','0','2022-04-21 14:54:48','2022-04-21 14:54:48');
INSERT INTO orders VALUES('37','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14551798','1650532217','0','0','0','0','2022-04-21 14:55:17','2022-04-21 14:55:17');
INSERT INTO orders VALUES('38','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14554190','1650532241','0','0','0','0','2022-04-21 14:55:41','2022-04-21 14:55:41');
INSERT INTO orders VALUES('39','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14554252','1650532242','0','0','0','0','2022-04-21 14:55:42','2022-04-21 14:55:42');
INSERT INTO orders VALUES('40','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-14561086','1650532270','0','0','0','0','2022-04-21 14:56:10','2022-04-21 14:56:10');
INSERT INTO orders VALUES('41','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15064674','1650532906','0','0','0','0','2022-04-21 15:06:46','2022-04-21 15:06:46');
INSERT INTO orders VALUES('42','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15184195','1650533621','0','0','0','0','2022-04-21 15:18:41','2022-04-21 15:18:41');
INSERT INTO orders VALUES('43','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15184925','1650533629','0','0','0','0','2022-04-21 15:18:49','2022-04-21 15:18:49');
INSERT INTO orders VALUES('44','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15190751','1650533647','0','0','0','0','2022-04-21 15:19:07','2022-04-21 15:19:07');
INSERT INTO orders VALUES('45','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15191476','1650533654','0','0','0','0','2022-04-21 15:19:14','2022-04-21 15:19:14');
INSERT INTO orders VALUES('46','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15192086','1650533660','0','0','0','0','2022-04-21 15:19:20','2022-04-21 15:19:20');
INSERT INTO orders VALUES('47','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15193547','1650533675','0','0','0','0','2022-04-21 15:19:35','2022-04-21 15:19:35');
INSERT INTO orders VALUES('48','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15194332','1650533683','0','0','0','0','2022-04-21 15:19:43','2022-04-21 15:19:43');
INSERT INTO orders VALUES('49','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15202627','1650533726','0','0','0','0','2022-04-21 15:20:26','2022-04-21 15:20:26');
INSERT INTO orders VALUES('50','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15203697','1650533736','0','0','0','0','2022-04-21 15:20:36','2022-04-21 15:20:36');
INSERT INTO orders VALUES('51','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15204357','1650533743','0','0','0','0','2022-04-21 15:20:43','2022-04-21 15:20:43');
INSERT INTO orders VALUES('52','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15211630','1650533776','0','0','0','0','2022-04-21 15:21:16','2022-04-21 15:21:16');
INSERT INTO orders VALUES('53','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15211951','1650533779','0','0','0','0','2022-04-21 15:21:19','2022-04-21 15:21:19');
INSERT INTO orders VALUES('54','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15213448','1650533794','0','0','0','0','2022-04-21 15:21:34','2022-04-21 15:21:34');
INSERT INTO orders VALUES('55','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15233968','1650533919','0','0','0','0','2022-04-21 15:23:39','2022-04-21 15:23:39');
INSERT INTO orders VALUES('56','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15263438','1650534094','0','0','0','0','2022-04-21 15:26:34','2022-04-21 15:26:34');
INSERT INTO orders VALUES('57','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15264691','1650534106','0','0','0','0','2022-04-21 15:26:46','2022-04-21 15:26:46');
INSERT INTO orders VALUES('58','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15265320','1650534113','0','0','0','0','2022-04-21 15:26:53','2022-04-21 15:26:53');
INSERT INTO orders VALUES('59','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15272455','1650534144','0','0','0','0','2022-04-21 15:27:24','2022-04-21 15:27:24');
INSERT INTO orders VALUES('60','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15280196','1650534181','0','0','0','0','2022-04-21 15:28:01','2022-04-21 15:28:01');
INSERT INTO orders VALUES('61','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15284972','1650534229','0','0','0','0','2022-04-21 15:28:49','2022-04-21 15:28:49');
INSERT INTO orders VALUES('62','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15285220','1650534232','0','0','0','0','2022-04-21 15:28:52','2022-04-21 15:28:53');
INSERT INTO orders VALUES('63','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15314918','1650534409','0','0','0','0','2022-04-21 15:31:49','2022-04-21 15:31:49');
INSERT INTO orders VALUES('64','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15315664','1650534416','0','0','0','0','2022-04-21 15:31:56','2022-04-21 15:31:56');
INSERT INTO orders VALUES('65','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15394588','1650534885','0','0','0','0','2022-04-21 15:39:45','2022-04-21 15:39:45');
INSERT INTO orders VALUES('66','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15433988','1650535119','0','0','0','0','2022-04-21 15:43:39','2022-04-21 15:43:39');
INSERT INTO orders VALUES('67','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"q","delivery_location":"2","country":"Nepal","city":"a","postal_code":"1","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','3130','10','0','20220421-15434160','1650535121','0','0','0','0','2022-04-21 15:43:41','2022-04-21 15:43:41');
INSERT INTO orders VALUES('68','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"123","delivery_location":"2","country":"Nepal","city":"qwe","postal_code":"123","phone":"123","checkout_type":"logged"}','esewa','0','','unpaid','','3130','10','0','20220422-10303896','1650602738','1','0','0','0','2022-04-22 10:30:38','2022-04-28 14:08:52');
INSERT INTO orders VALUES('69','8','','{"name":"Mr Buyer","email":"customer@example.com","address":"123","delivery_location":"2","country":"Nepal","city":"qwe","postal_code":"123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','3130','10','0','20220422-10322478','1650602844','1','0','0','0','2022-04-22 10:32:24','2022-04-22 14:39:20');
INSERT INTO orders VALUES('70','276','','{"name":"123","email":"joshibipin2052@gmail.com","address":"qweq","delivery_location":"2","country":"Nepal","city":"weqwe","postal_code":"qwe","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','610','10','100','20220422-14382959','1650617609','1','1','1','0','2022-04-22 14:38:29','2022-04-22 14:39:38');
INSERT INTO orders VALUES('71','276','','{"name":"123","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','115','20','0','20220424-12203259','1650782132','1','0','0','0','2022-04-24 12:20:32','2022-04-24 13:22:32');
INSERT INTO orders VALUES('72','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20224634','1650811066','0','0','0','0','2022-04-24 20:22:46','2022-04-24 20:22:46');
INSERT INTO orders VALUES('73','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20232172','1650811101','0','0','0','0','2022-04-24 20:23:21','2022-04-24 20:23:21');
INSERT INTO orders VALUES('74','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20245447','1650811194','0','0','0','0','2022-04-24 20:24:54','2022-04-24 20:24:54');
INSERT INTO orders VALUES('75','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20261140','1650811271','0','0','0','0','2022-04-24 20:26:11','2022-04-24 20:26:11');
INSERT INTO orders VALUES('76','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20291874','1650811458','0','0','0','0','2022-04-24 20:29:18','2022-04-24 20:29:18');
INSERT INTO orders VALUES('77','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20303629','1650811536','0','0','0','0','2022-04-24 20:30:36','2022-04-24 20:30:36');
INSERT INTO orders VALUES('78','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20331776','1650811697','0','0','0','0','2022-04-24 20:33:17','2022-04-24 20:33:17');
INSERT INTO orders VALUES('79','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20355443','1650811854','0','0','0','0','2022-04-24 20:35:54','2022-04-24 20:35:54');
INSERT INTO orders VALUES('80','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20372778','1650811947','0','0','0','0','2022-04-24 20:37:27','2022-04-24 20:37:27');
INSERT INTO orders VALUES('81','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20390732','1650812047','0','0','0','0','2022-04-24 20:39:07','2022-04-24 20:39:07');
INSERT INTO orders VALUES('82','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20422524','1650812245','0','0','0','0','2022-04-24 20:42:25','2022-04-24 20:42:25');
INSERT INTO orders VALUES('83','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20435561','1650812335','0','0','0','0','2022-04-24 20:43:55','2022-04-24 20:43:55');
INSERT INTO orders VALUES('84','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20464928','1650812509','0','0','0','0','2022-04-24 20:46:49','2022-04-24 20:46:49');
INSERT INTO orders VALUES('85','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20493994','1650812679','0','0','0','0','2022-04-24 20:49:39','2022-04-24 20:49:39');
INSERT INTO orders VALUES('86','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20513692','1650812796','0','0','0','0','2022-04-24 20:51:36','2022-04-24 20:51:36');
INSERT INTO orders VALUES('87','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-20540790','1650812947','0','0','0','0','2022-04-24 20:54:07','2022-04-24 20:54:07');
INSERT INTO orders VALUES('88','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-21034598','1650813525','0','0','0','0','2022-04-24 21:03:45','2022-04-24 21:03:45');
INSERT INTO orders VALUES('89','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','','20','0','20220424-21341240','1650815352','0','0','0','0','2022-04-24 21:34:12','2022-04-24 21:34:12');
INSERT INTO orders VALUES('90','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14462755','1650877287','0','0','0','0','2022-04-25 14:46:27','2022-04-25 14:46:27');
INSERT INTO orders VALUES('91','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14484479','1650877424','0','0','0','0','2022-04-25 14:48:44','2022-04-25 14:48:45');
INSERT INTO orders VALUES('92','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14495263','1650877492','0','0','0','0','2022-04-25 14:49:52','2022-04-25 14:49:52');
INSERT INTO orders VALUES('93','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14501638','1650877516','0','0','0','0','2022-04-25 14:50:16','2022-04-25 14:50:16');
INSERT INTO orders VALUES('94','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14502973','1650877529','0','0','0','0','2022-04-25 14:50:29','2022-04-25 14:50:29');
INSERT INTO orders VALUES('95','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14510021','1650877560','0','0','0','0','2022-04-25 14:51:00','2022-04-25 14:51:00');
INSERT INTO orders VALUES('96','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14511965','1650877579','0','0','0','0','2022-04-25 14:51:19','2022-04-25 14:51:19');
INSERT INTO orders VALUES('97','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14512862','1650877588','0','0','0','0','2022-04-25 14:51:28','2022-04-25 14:51:28');
INSERT INTO orders VALUES('98','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14513831','1650877598','0','0','0','0','2022-04-25 14:51:38','2022-04-25 14:51:38');
INSERT INTO orders VALUES('99','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14520116','1650877621','0','0','0','0','2022-04-25 14:52:01','2022-04-25 14:52:01');
INSERT INTO orders VALUES('100','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14525340','1650877673','0','0','0','0','2022-04-25 14:52:53','2022-04-25 14:52:53');
INSERT INTO orders VALUES('101','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14543752','1650877777','0','0','0','0','2022-04-25 14:54:37','2022-04-25 14:54:37');
INSERT INTO orders VALUES('102','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14555135','1650877851','0','0','0','0','2022-04-25 14:55:51','2022-04-25 14:55:51');
INSERT INTO orders VALUES('103','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14564358','1650877903','0','0','0','0','2022-04-25 14:56:43','2022-04-25 14:56:43');
INSERT INTO orders VALUES('104','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14571763','1650877937','0','0','0','0','2022-04-25 14:57:17','2022-04-25 14:57:17');
INSERT INTO orders VALUES('105','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14580464','1650877984','0','0','0','0','2022-04-25 14:58:04','2022-04-25 14:58:04');
INSERT INTO orders VALUES('106','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14582056','1650878000','0','0','0','0','2022-04-25 14:58:20','2022-04-25 14:58:20');
INSERT INTO orders VALUES('107','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14583548','1650878015','0','0','0','0','2022-04-25 14:58:35','2022-04-25 14:58:35');
INSERT INTO orders VALUES('108','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-14585148','1650878031','0','0','0','0','2022-04-25 14:58:51','2022-04-25 14:58:51');
INSERT INTO orders VALUES('109','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15035460','1650878334','0','0','0','0','2022-04-25 15:03:54','2022-04-25 15:03:54');
INSERT INTO orders VALUES('110','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15040988','1650878349','0','0','0','0','2022-04-25 15:04:09','2022-04-25 15:04:09');
INSERT INTO orders VALUES('111','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15043927','1650878379','0','0','0','0','2022-04-25 15:04:39','2022-04-25 15:04:39');
INSERT INTO orders VALUES('112','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15045910','1650878399','0','0','0','0','2022-04-25 15:04:59','2022-04-25 15:04:59');
INSERT INTO orders VALUES('113','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15060147','1650878461','0','0','0','0','2022-04-25 15:06:01','2022-04-25 15:06:01');
INSERT INTO orders VALUES('114','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15073866','1650878558','0','0','0','0','2022-04-25 15:07:38','2022-04-25 15:07:39');
INSERT INTO orders VALUES('115','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15074038','1650878560','0','0','0','0','2022-04-25 15:07:40','2022-04-25 15:07:40');
INSERT INTO orders VALUES('116','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15084037','1650878620','0','0','0','0','2022-04-25 15:08:40','2022-04-25 15:08:40');
INSERT INTO orders VALUES('117','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15085535','1650878635','0','0','0','0','2022-04-25 15:08:55','2022-04-25 15:08:55');
INSERT INTO orders VALUES('118','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15100685','1650878706','0','0','0','0','2022-04-25 15:10:06','2022-04-25 15:10:06');
INSERT INTO orders VALUES('119','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15102841','1650878728','0','0','0','0','2022-04-25 15:10:28','2022-04-25 15:10:28');
INSERT INTO orders VALUES('120','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15104675','1650878746','0','0','0','0','2022-04-25 15:10:46','2022-04-25 15:10:46');
INSERT INTO orders VALUES('121','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15113997','1650878799','0','0','0','0','2022-04-25 15:11:39','2022-04-25 15:11:39');
INSERT INTO orders VALUES('122','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15114663','1650878806','0','0','0','0','2022-04-25 15:11:46','2022-04-25 15:11:46');
INSERT INTO orders VALUES('123','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15121059','1650878830','0','0','0','0','2022-04-25 15:12:10','2022-04-25 15:12:10');
INSERT INTO orders VALUES('124','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15123228','1650878852','0','0','0','0','2022-04-25 15:12:32','2022-04-25 15:12:32');
INSERT INTO orders VALUES('125','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15124338','1650878863','0','0','0','0','2022-04-25 15:12:43','2022-04-25 15:12:43');
INSERT INTO orders VALUES('126','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15125379','1650878873','0','0','0','0','2022-04-25 15:12:53','2022-04-25 15:12:53');
INSERT INTO orders VALUES('127','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15135415','1650878934','0','0','0','0','2022-04-25 15:13:54','2022-04-25 15:13:54');
INSERT INTO orders VALUES('128','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15140238','1650878942','0','0','0','0','2022-04-25 15:14:02','2022-04-25 15:14:02');
INSERT INTO orders VALUES('129','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15140534','1650878945','0','0','0','0','2022-04-25 15:14:05','2022-04-25 15:14:05');
INSERT INTO orders VALUES('130','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15144550','1650878985','0','0','0','0','2022-04-25 15:14:45','2022-04-25 15:14:45');
INSERT INTO orders VALUES('131','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15150727','1650879007','0','0','0','0','2022-04-25 15:15:07','2022-04-25 15:15:07');
INSERT INTO orders VALUES('132','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15151355','1650879013','0','0','0','0','2022-04-25 15:15:13','2022-04-25 15:15:13');
INSERT INTO orders VALUES('133','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15151752','1650879017','0','0','0','0','2022-04-25 15:15:17','2022-04-25 15:15:17');
INSERT INTO orders VALUES('134','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15153195','1650879031','0','0','0','0','2022-04-25 15:15:31','2022-04-25 15:15:31');
INSERT INTO orders VALUES('135','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','unpaid','','390.25','20','0','20220425-15154448','1650879044','0','0','0','0','2022-04-25 15:15:44','2022-04-25 15:15:44');
INSERT INTO orders VALUES('136','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','paid','[{"utf8":"\u2713","auth_cv_result":"M","req_card_number":"xxxxxxxxxxxx3721","req_locale":"en","signature":"mCPsvyd+WH2TnvBMIlXTEEnIBWKXRgRgNxQOlcKcksw=","req_card_type_selection_indicator":"1","auth_trans_ref_no":"6508794204226903904004","payer_authentication_enroll_veres_enrolled":"U","req_bill_to_surname":"RpCxYgIM9a","req_bill_to_address_city":"UuPE1MFLQx","payer_authentication_proof_xml":"&lt;AuthProof&gt;&lt;Time&gt;2022 Apr 25 09:37:01&lt;\/Time&gt;&lt;DSUrl&gt;https:\/\/merchantacsstag.cardinalcommerce.com\/MerchantACSWeb\/vereq.jsp?acqid=CYBS&lt;\/DSUrl&gt;&lt;VEReqProof&gt;&lt;Message id=&quot;7MNslrJeW8c6dNiCwAc0&quot;&gt;&lt;VEReq&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;pan&gt;XXXXXXXXXXXX3721&lt;\/pan&gt;&lt;Merchant&gt;&lt;acqBIN&gt;469216&lt;\/acqBIN&gt;&lt;merID&gt;100710070000263&lt;\/merID&gt;&lt;\/Merchant&gt;&lt;Browser&gt;&lt;deviceCategory&gt;0&lt;\/deviceCategory&gt;&lt;accept&gt;*\/*&lt;\/accept&gt;&lt;userAgent&gt;Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/100.0.4896.127 Safari\/537.36&lt;\/userAgent&gt;&lt;\/Browser&gt;&lt;\/VEReq&gt;&lt;\/Message&gt;&lt;\/VEReqProof&gt;&lt;VEResProof&gt;&lt;Message id=&quot;na&quot;&gt;&lt;VERes&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;CH&gt;&lt;enrolled&gt;U&lt;\/enrolled&gt;&lt;acctID&gt;&lt;\/acctID&gt;&lt;\/CH&gt;&lt;url&gt;&lt;\/url&gt;&lt;protocol&gt;ThreeDSecure&lt;\/protocol&gt;&lt;\/VERes&gt;&lt;\/Message&gt;&lt;\/VEResProof&gt;&lt;\/AuthProof&gt;","req_card_expiry_date":"12-2022","auth_cavv_result":"2","merchant_advice_code":"01","card_type_name":"Visa","reason_code":"100","auth_amount":"390.25","auth_response":"00","bill_trans_ref_no":"6508794204226903904004","req_bill_to_forename":"q6MZ9J5ptN","req_payment_method":"card","request_token":"Axj\/\/wSTYNeqM6y56I8EAJos2asHDdy0ZMGjJk2csGblg0YMGiiOOIDTrAFRHHEBp1kGEJhxIQ4ZNJMvRi1c83DBtJsGvVGdZc9EeCAAlhBJ","auth_cavv_result_raw":"2","auth_time":"2022-04-25T093701Z","req_amount":"390.25","req_bill_to_email":"joshibipin2052@gmail.com","payer_authentication_reason_code":"100","auth_avs_code_raw":"Y","payer_authentication_enroll_e_commerce_indicator":"internet","transaction_id":"6508794204226903904004","req_currency":"NPR","req_card_type":"001","decision":"ACCEPT","message":"Request was processed successfully.","signed_field_names":"transaction_id,decision,req_access_key,req_profile_id,req_transaction_uuid,req_transaction_type,req_reference_number,req_amount,req_currency,req_locale,req_payment_method,req_bill_to_forename,req_bill_to_surname,req_bill_to_email,req_bill_to_address_line1,req_bill_to_address_city,req_bill_to_address_country,req_card_number,req_card_type,req_card_type_selection_indicator,req_card_expiry_date,card_type_name,message,reason_code,auth_avs_code,auth_avs_code_raw,auth_response,auth_amount,auth_code,auth_cavv_result,auth_cavv_result_raw,auth_cv_result,auth_cv_result_raw,auth_trans_ref_no,auth_time,request_token,merchant_advice_code,bill_trans_ref_no,payer_authentication_proof_xml,payer_authentication_reason_code,payer_authentication_enroll_e_commerce_indicator,payer_authentication_enroll_veres_enrolled,signed_field_names,signed_date_time","req_transaction_uuid":"20220425-15165138","auth_avs_code":"Y","auth_code":"831000","req_bill_to_address_country":"NP","req_transaction_type":"sale","req_access_key":"cd7ac9c06b2b3bc8915cb8c08d2e2a93","auth_cv_result_raw":"M","req_profile_id":"AC9E8149-F889-4C78-893B-EAF207B3C7AC","req_reference_number":"2022-04-2503:16","signed_date_time":"2022-04-25T09:37:01Z","req_bill_to_address_line1":"2rJHBbYxVT"}]','390.25','20','0','20220425-15165138','1650879111','0','0','0','1','2022-04-25 15:16:51','2022-04-25 15:41:09');
INSERT INTO orders VALUES('137','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"5768","delivery_location":"1","country":"Nepal","city":"5786","postal_code":"7869","phone":"678","checkout_type":"logged"}','nic','0','','paid','[{"utf8":"\u2713","auth_cv_result":"M","req_card_number":"xxxxxxxxxxxx3721","req_locale":"en","signature":"pIgDCy\/HFBju515poU6B52moEEnt3zM4tmbhi4g3cqg=","req_card_type_selection_indicator":"1","auth_trans_ref_no":"6508808768646723304005","payer_authentication_enroll_veres_enrolled":"U","req_bill_to_surname":"Joshi","req_bill_to_address_city":"Kathmandu","payer_authentication_proof_xml":"&lt;AuthProof&gt;&lt;Time&gt;2022 Apr 25 10:01:17&lt;\/Time&gt;&lt;DSUrl&gt;https:\/\/merchantacsstag.cardinalcommerce.com\/MerchantACSWeb\/vereq.jsp?acqid=CYBS&lt;\/DSUrl&gt;&lt;VEReqProof&gt;&lt;Message id=&quot;ktbFcTlNIOC5XkxNLia0&quot;&gt;&lt;VEReq&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;pan&gt;XXXXXXXXXXXX3721&lt;\/pan&gt;&lt;Merchant&gt;&lt;acqBIN&gt;469216&lt;\/acqBIN&gt;&lt;merID&gt;100710070000263&lt;\/merID&gt;&lt;\/Merchant&gt;&lt;Browser&gt;&lt;deviceCategory&gt;0&lt;\/deviceCategory&gt;&lt;accept&gt;*\/*&lt;\/accept&gt;&lt;userAgent&gt;Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/100.0.4896.127 Safari\/537.36&lt;\/userAgent&gt;&lt;\/Browser&gt;&lt;\/VEReq&gt;&lt;\/Message&gt;&lt;\/VEReqProof&gt;&lt;VEResProof&gt;&lt;Message id=&quot;na&quot;&gt;&lt;VERes&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;CH&gt;&lt;enrolled&gt;U&lt;\/enrolled&gt;&lt;acctID&gt;&lt;\/acctID&gt;&lt;\/CH&gt;&lt;url&gt;&lt;\/url&gt;&lt;protocol&gt;ThreeDSecure&lt;\/protocol&gt;&lt;\/VERes&gt;&lt;\/Message&gt;&lt;\/VEResProof&gt;&lt;\/AuthProof&gt;","req_card_expiry_date":"12-2022","auth_cavv_result":"2","merchant_advice_code":"01","card_type_name":"Visa","reason_code":"100","auth_amount":"681.92","auth_response":"00","bill_trans_ref_no":"6508808768646723304005","req_bill_to_forename":"Bipin","req_payment_method":"card","request_token":"Axj\/\/wSTYNfd8e\/3mnpFAJos2asHDhg4btnDZo2bsmbNg0YMGqiOOIGA0wFRHHEDAacGEYUwEIcMmkmXoxauebhg2k2DX3fHv95p6RQAiTfj","auth_cavv_result_raw":"2","auth_time":"2022-04-25T100118Z","req_amount":"681.92","req_bill_to_email":"joshibipin2052@gmail.com","payer_authentication_reason_code":"100","auth_avs_code_raw":"Y","payer_authentication_enroll_e_commerce_indicator":"internet","transaction_id":"6508808768646723304005","req_currency":"NPR","req_card_type":"001","decision":"ACCEPT","message":"Request was processed successfully.","signed_field_names":"transaction_id,decision,req_access_key,req_profile_id,req_transaction_uuid,req_transaction_type,req_reference_number,req_amount,req_currency,req_locale,req_payment_method,req_bill_to_forename,req_bill_to_surname,req_bill_to_email,req_bill_to_address_line1,req_bill_to_address_city,req_bill_to_address_country,req_card_number,req_card_type,req_card_type_selection_indicator,req_card_expiry_date,card_type_name,message,reason_code,auth_avs_code,auth_avs_code_raw,auth_response,auth_amount,auth_code,auth_cavv_result,auth_cavv_result_raw,auth_cv_result,auth_cv_result_raw,auth_trans_ref_no,auth_time,request_token,merchant_advice_code,bill_trans_ref_no,payer_authentication_proof_xml,payer_authentication_reason_code,payer_authentication_enroll_e_commerce_indicator,payer_authentication_enroll_veres_enrolled,signed_field_names,signed_date_time","req_transaction_uuid":"20220425-15455272","auth_avs_code":"Y","auth_code":"831000","req_bill_to_address_country":"NP","req_transaction_type":"sale","req_access_key":"cd7ac9c06b2b3bc8915cb8c08d2e2a93","auth_cv_result_raw":"M","req_profile_id":"AC9E8149-F889-4C78-893B-EAF207B3C7AC","req_reference_number":"2022-04-2503:45","signed_date_time":"2022-04-25T10:01:18Z","req_bill_to_address_line1":"Sukehdara"}]','681.92','20','0','20220425-15455272','1650880852','0','1','1','1','2022-04-25 15:45:52','2022-04-25 15:48:47');
INSERT INTO orders VALUES('138','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','681.92','20','0','20220425-17220676','1650886626','0','0','0','0','2022-04-25 17:22:06','2022-04-25 17:22:06');
INSERT INTO orders VALUES('139','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"z","delivery_location":"1","country":"Nepal","city":"z","postal_code":"12","phone":"22","checkout_type":"logged"}','nic','0','','unpaid','','681.92','20','0','20220425-17270866','1650886928','0','0','0','0','2022-04-25 17:27:08','2022-04-25 17:27:08');
INSERT INTO orders VALUES('140','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"z","delivery_location":"1","country":"Nepal","city":"z","postal_code":"12","phone":"22","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','681.92','20','0','20220425-17381259','1650887592','0','0','0','0','2022-04-25 17:38:12','2022-04-25 17:38:12');
INSERT INTO orders VALUES('141','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17533493','1650888514','0','0','0','0','2022-04-25 17:53:34','2022-04-25 17:53:34');
INSERT INTO orders VALUES('142','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17543641','1650888576','0','0','0','0','2022-04-25 17:54:36','2022-04-25 17:54:36');
INSERT INTO orders VALUES('143','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17551836','1650888618','0','0','0','0','2022-04-25 17:55:18','2022-04-25 17:55:18');
INSERT INTO orders VALUES('144','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17554357','1650888643','0','0','0','0','2022-04-25 17:55:43','2022-04-25 17:55:44');
INSERT INTO orders VALUES('145','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17561784','1650888677','0','0','0','0','2022-04-25 17:56:17','2022-04-25 17:56:17');
INSERT INTO orders VALUES('146','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17571264','1650888732','0','0','0','0','2022-04-25 17:57:12','2022-04-25 17:57:12');
INSERT INTO orders VALUES('147','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17573677','1650888756','0','0','0','0','2022-04-25 17:57:36','2022-04-25 17:57:36');
INSERT INTO orders VALUES('148','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17574256','1650888762','0','0','0','0','2022-04-25 17:57:42','2022-04-25 17:57:42');
INSERT INTO orders VALUES('149','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17582517','1650888805','0','0','0','0','2022-04-25 17:58:25','2022-04-25 17:58:25');
INSERT INTO orders VALUES('150','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17590227','1650888842','0','0','0','0','2022-04-25 17:59:02','2022-04-25 17:59:02');
INSERT INTO orders VALUES('151','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220425-17590813','1650888848','0','0','0','0','2022-04-25 17:59:08','2022-04-25 17:59:08');
INSERT INTO orders VALUES('152','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','paid','[{"utf8":"\u2713","auth_cv_result":"M","req_card_number":"xxxxxxxxxxxx3721","req_locale":"en","signature":"6SuBySKNd3wqoYvqZ89oB9TcFnSuVSFuDVoYfuqM9YM=","req_card_type_selection_indicator":"1","auth_trans_ref_no":"6508891500546183404006","payer_authentication_enroll_veres_enrolled":"U","req_bill_to_surname":"Joshi","req_bill_to_address_city":"Kathmandu","payer_authentication_proof_xml":"&lt;AuthProof&gt;&lt;Time&gt;2022 Apr 25 12:19:10&lt;\/Time&gt;&lt;DSUrl&gt;https:\/\/merchantacsstag.cardinalcommerce.com\/MerchantACSWeb\/vereq.jsp?acqid=CYBS&lt;\/DSUrl&gt;&lt;VEReqProof&gt;&lt;Message id=&quot;s2Ezbvl8Ba290294owG0&quot;&gt;&lt;VEReq&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;pan&gt;XXXXXXXXXXXX3721&lt;\/pan&gt;&lt;Merchant&gt;&lt;acqBIN&gt;469216&lt;\/acqBIN&gt;&lt;merID&gt;100710070000263&lt;\/merID&gt;&lt;\/Merchant&gt;&lt;Browser&gt;&lt;deviceCategory&gt;0&lt;\/deviceCategory&gt;&lt;accept&gt;*\/*&lt;\/accept&gt;&lt;userAgent&gt;Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/100.0.4896.127 Safari\/537.36&lt;\/userAgent&gt;&lt;\/Browser&gt;&lt;\/VEReq&gt;&lt;\/Message&gt;&lt;\/VEReqProof&gt;&lt;VEResProof&gt;&lt;Message id=&quot;na&quot;&gt;&lt;VERes&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;CH&gt;&lt;enrolled&gt;U&lt;\/enrolled&gt;&lt;acctID&gt;&lt;\/acctID&gt;&lt;\/CH&gt;&lt;url&gt;&lt;\/url&gt;&lt;protocol&gt;ThreeDSecure&lt;\/protocol&gt;&lt;\/VERes&gt;&lt;\/Message&gt;&lt;\/VEResProof&gt;&lt;\/AuthProof&gt;","req_card_expiry_date":"12-2022","auth_cavv_result":"2","merchant_advice_code":"01","card_type_name":"Visa","reason_code":"100","auth_amount":"720.00","auth_response":"00","bill_trans_ref_no":"6508891500546183404006","req_bill_to_forename":"Bipin","req_payment_method":"card","request_token":"Axj\/\/wSTYNkD3ilehBnmAJos2asHDhyxasGDVo2YuGbRg0YMGyiOOIQ3NwFRHHEIbm8GEYygEIcMmkmXoxauebhg2k2DZA94pXoQZ5gALSVU","auth_cavv_result_raw":"2","auth_time":"2022-04-25T121911Z","req_amount":"720","req_bill_to_email":"joshibipin2052@gmail.com","payer_authentication_reason_code":"100","auth_avs_code_raw":"Y","payer_authentication_enroll_e_commerce_indicator":"internet","transaction_id":"6508891500546183404006","req_currency":"NPR","req_card_type":"001","decision":"ACCEPT","message":"Request was processed successfully.","signed_field_names":"transaction_id,decision,req_access_key,req_profile_id,req_transaction_uuid,req_transaction_type,req_reference_number,req_amount,req_currency,req_locale,req_payment_method,req_bill_to_forename,req_bill_to_surname,req_bill_to_email,req_bill_to_address_line1,req_bill_to_address_city,req_bill_to_address_country,req_card_number,req_card_type,req_card_type_selection_indicator,req_card_expiry_date,card_type_name,message,reason_code,auth_avs_code,auth_avs_code_raw,auth_response,auth_amount,auth_code,auth_cavv_result,auth_cavv_result_raw,auth_cv_result,auth_cv_result_raw,auth_trans_ref_no,auth_time,request_token,merchant_advice_code,bill_trans_ref_no,payer_authentication_proof_xml,payer_authentication_reason_code,payer_authentication_enroll_e_commerce_indicator,payer_authentication_enroll_veres_enrolled,signed_field_names,signed_date_time","req_transaction_uuid":"20220425-18021831","auth_avs_code":"Y","auth_code":"831000","req_bill_to_address_country":"NP","req_transaction_type":"sale","req_access_key":"cd7ac9c06b2b3bc8915cb8c08d2e2a93","auth_cv_result_raw":"M","req_profile_id":"AC9E8149-F889-4C78-893B-EAF207B3C7AC","req_reference_number":"2022-04-2506:02","signed_date_time":"2022-04-25T12:19:11Z","req_bill_to_address_line1":"Sukehdara"}]','720','20','0','20220425-18021831','1650889038','0','0','0','1','2022-04-25 18:02:18','2022-04-25 18:04:13');
INSERT INTO orders VALUES('153','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"z","delivery_location":"1","country":"Nepal","city":"z","postal_code":"12","phone":"22","checkout_type":"logged"}','nic','0','','paid','[{"utf8":"\u2713","auth_cv_result":"M","req_card_number":"xxxxxxxxxxxx3721","req_locale":"en","signature":"NNaoYLzJO5XFM\/I5VAbl+JIfLW83P4KpTXXNDbt3jO4=","req_card_type_selection_indicator":"1","auth_trans_ref_no":"6508894305956202204006","payer_authentication_enroll_veres_enrolled":"U","req_bill_to_surname":"Joshi","req_bill_to_address_city":"Kathmandu","payer_authentication_proof_xml":"&lt;AuthProof&gt;&lt;Time&gt;2022 Apr 25 12:23:50&lt;\/Time&gt;&lt;DSUrl&gt;https:\/\/merchantacsstag.cardinalcommerce.com\/MerchantACSWeb\/vereq.jsp?acqid=CYBS&lt;\/DSUrl&gt;&lt;VEReqProof&gt;&lt;Message id=&quot;0CTT4SfagQh0tvrvs7N0&quot;&gt;&lt;VEReq&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;pan&gt;XXXXXXXXXXXX3721&lt;\/pan&gt;&lt;Merchant&gt;&lt;acqBIN&gt;469216&lt;\/acqBIN&gt;&lt;merID&gt;100710070000263&lt;\/merID&gt;&lt;\/Merchant&gt;&lt;Browser&gt;&lt;deviceCategory&gt;0&lt;\/deviceCategory&gt;&lt;accept&gt;*\/*&lt;\/accept&gt;&lt;userAgent&gt;Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/100.0.4896.127 Safari\/537.36&lt;\/userAgent&gt;&lt;\/Browser&gt;&lt;\/VEReq&gt;&lt;\/Message&gt;&lt;\/VEReqProof&gt;&lt;VEResProof&gt;&lt;Message id=&quot;na&quot;&gt;&lt;VERes&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;CH&gt;&lt;enrolled&gt;U&lt;\/enrolled&gt;&lt;acctID&gt;&lt;\/acctID&gt;&lt;\/CH&gt;&lt;url&gt;&lt;\/url&gt;&lt;protocol&gt;ThreeDSecure&lt;\/protocol&gt;&lt;\/VERes&gt;&lt;\/Message&gt;&lt;\/VEResProof&gt;&lt;\/AuthProof&gt;","req_card_expiry_date":"12-2022","auth_cavv_result":"2","merchant_advice_code":"01","card_type_name":"Visa","reason_code":"100","auth_amount":"431.94","auth_response":"00","bill_trans_ref_no":"6508894305956202204006","req_bill_to_forename":"Bipin","req_payment_method":"card","request_token":"Axj\/\/wSTYNkN1arKIstmAJos2asHDhy0ZsGrlq2ZMGTJg0YMGyiOOIRKmgFRHHEIlTUGEKi6IQ4ZNJMvRi1c83DBtJsGyG6tVlEWWzAAxitj","auth_cavv_result_raw":"2","auth_time":"2022-04-25T122351Z","req_amount":"431.94","req_bill_to_email":"joshibipin2052@gmail.com","payer_authentication_reason_code":"100","auth_avs_code_raw":"Y","payer_authentication_enroll_e_commerce_indicator":"internet","transaction_id":"6508894305956202204006","req_currency":"NPR","req_card_type":"001","decision":"ACCEPT","message":"Request was processed successfully.","signed_field_names":"transaction_id,decision,req_access_key,req_profile_id,req_transaction_uuid,req_transaction_type,req_reference_number,req_amount,req_currency,req_locale,req_payment_method,req_bill_to_forename,req_bill_to_surname,req_bill_to_email,req_bill_to_address_line1,req_bill_to_address_city,req_bill_to_address_country,req_card_number,req_card_type,req_card_type_selection_indicator,req_card_expiry_date,card_type_name,message,reason_code,auth_avs_code,auth_avs_code_raw,auth_response,auth_amount,auth_code,auth_cavv_result,auth_cavv_result_raw,auth_cv_result,auth_cv_result_raw,auth_trans_ref_no,auth_time,request_token,merchant_advice_code,bill_trans_ref_no,payer_authentication_proof_xml,payer_authentication_reason_code,payer_authentication_enroll_e_commerce_indicator,payer_authentication_enroll_veres_enrolled,signed_field_names,signed_date_time","req_transaction_uuid":"20220425-18084348","auth_avs_code":"Y","auth_code":"831000","req_bill_to_address_country":"NP","req_transaction_type":"sale","req_access_key":"cd7ac9c06b2b3bc8915cb8c08d2e2a93","auth_cv_result_raw":"M","req_profile_id":"AC9E8149-F889-4C78-893B-EAF207B3C7AC","req_reference_number":"2022-04-2506:08","signed_date_time":"2022-04-25T12:23:51Z","req_bill_to_address_line1":"Sukehdara"}]','431.94','20','0','20220425-18084348','1650889423','0','0','0','1','2022-04-25 18:08:43','2022-04-25 18:08:53');
INSERT INTO orders VALUES('154','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"z","delivery_location":"1","country":"Nepal","city":"z","postal_code":"12","phone":"22","checkout_type":"logged"}','nic','0','','paid','[{"utf8":"\u2713","auth_cv_result":"M","req_card_number":"xxxxxxxxxxxx3721","req_locale":"en","signature":"1soBDsLKAYMTio5TA6lB8EJd++iqpinRlROXUjKVO6g=","req_card_type_selection_indicator":"1","auth_trans_ref_no":"6508896375456725304002","payer_authentication_enroll_veres_enrolled":"U","req_bill_to_surname":"Joshi","req_bill_to_address_city":"Kathmandu","payer_authentication_proof_xml":"&lt;AuthProof&gt;&lt;Time&gt;2022 Apr 25 12:27:18&lt;\/Time&gt;&lt;DSUrl&gt;https:\/\/merchantacsstag.cardinalcommerce.com\/MerchantACSWeb\/vereq.jsp?acqid=CYBS&lt;\/DSUrl&gt;&lt;VEReqProof&gt;&lt;Message id=&quot;VoU5XbemigkhlJ3L5K80&quot;&gt;&lt;VEReq&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;pan&gt;XXXXXXXXXXXX3721&lt;\/pan&gt;&lt;Merchant&gt;&lt;acqBIN&gt;469216&lt;\/acqBIN&gt;&lt;merID&gt;100710070000263&lt;\/merID&gt;&lt;\/Merchant&gt;&lt;Browser&gt;&lt;deviceCategory&gt;0&lt;\/deviceCategory&gt;&lt;accept&gt;*\/*&lt;\/accept&gt;&lt;userAgent&gt;Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/100.0.4896.127 Safari\/537.36&lt;\/userAgent&gt;&lt;\/Browser&gt;&lt;\/VEReq&gt;&lt;\/Message&gt;&lt;\/VEReqProof&gt;&lt;VEResProof&gt;&lt;Message id=&quot;na&quot;&gt;&lt;VERes&gt;&lt;version&gt;1.0.2&lt;\/version&gt;&lt;CH&gt;&lt;enrolled&gt;U&lt;\/enrolled&gt;&lt;acctID&gt;&lt;\/acctID&gt;&lt;\/CH&gt;&lt;url&gt;&lt;\/url&gt;&lt;protocol&gt;ThreeDSecure&lt;\/protocol&gt;&lt;\/VERes&gt;&lt;\/Message&gt;&lt;\/VEResProof&gt;&lt;\/AuthProof&gt;","req_card_expiry_date":"12-2022","auth_cavv_result":"2","merchant_advice_code":"01","card_type_name":"Visa","reason_code":"100","auth_amount":"431.94","auth_response":"00","bill_trans_ref_no":"6508896375456725304002","req_bill_to_forename":"Bipin","req_payment_method":"card","request_token":"Axj\/\/wSTYNkVL93trYLCAJos2asHDhy2Zt2rRq2bsmrNg0YMGSiOOIRXTgFRHHEIrp0GEKi6IQ4ZNJMvRi1c83DBtJsGyKl+721sFhAAJw4c","auth_cavv_result_raw":"2","auth_time":"2022-04-25T122718Z","req_amount":"431.94","req_bill_to_email":"joshibipin2052@gmail.com","payer_authentication_reason_code":"100","auth_avs_code_raw":"Y","payer_authentication_enroll_e_commerce_indicator":"internet","transaction_id":"6508896375456725304002","req_currency":"NPR","req_card_type":"001","decision":"ACCEPT","message":"Request was processed successfully.","signed_field_names":"transaction_id,decision,req_access_key,req_profile_id,req_transaction_uuid,req_transaction_type,req_reference_number,req_amount,req_currency,req_locale,req_payment_method,req_bill_to_forename,req_bill_to_surname,req_bill_to_email,req_bill_to_address_line1,req_bill_to_address_city,req_bill_to_address_country,req_card_number,req_card_type,req_card_type_selection_indicator,req_card_expiry_date,card_type_name,message,reason_code,auth_avs_code,auth_avs_code_raw,auth_response,auth_amount,auth_code,auth_cavv_result,auth_cavv_result_raw,auth_cv_result,auth_cv_result_raw,auth_trans_ref_no,auth_time,request_token,merchant_advice_code,bill_trans_ref_no,payer_authentication_proof_xml,payer_authentication_reason_code,payer_authentication_enroll_e_commerce_indicator,payer_authentication_enroll_veres_enrolled,signed_field_names,signed_date_time","req_transaction_uuid":"20220425-18112779","auth_avs_code":"Y","auth_code":"831000","req_bill_to_address_country":"NP","req_transaction_type":"sale","req_access_key":"cd7ac9c06b2b3bc8915cb8c08d2e2a93","auth_cv_result_raw":"M","req_profile_id":"AC9E8149-F889-4C78-893B-EAF207B3C7AC","req_reference_number":"2022-04-2506:11","signed_date_time":"2022-04-25T12:27:18Z","req_bill_to_address_line1":"Sukehdara"}]','431.94','20','0','20220425-18112779','1650889587','0','0','0','1','2022-04-25 18:11:27','2022-04-25 18:12:21');
INSERT INTO orders VALUES('155','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','370','20','0','20220426-14434165','1650963521','0','0','0','0','2022-04-26 14:43:41','2022-04-26 14:43:41');
INSERT INTO orders VALUES('156','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','370','20','0','20220426-14445949','1650963599','0','0','0','0','2022-04-26 14:44:59','2022-04-26 14:44:59');
INSERT INTO orders VALUES('157','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','370','20','0','20220426-14473675','1650963756','0','0','0','0','2022-04-26 14:47:36','2022-04-26 14:47:36');
INSERT INTO orders VALUES('158','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','370','20','0','20220426-14491160','1650963851','0','0','0','0','2022-04-26 14:49:11','2022-04-26 14:49:11');
INSERT INTO orders VALUES('159','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','370','20','0','20220426-14513928','1650963999','0','0','0','0','2022-04-26 14:51:39','2022-04-26 14:51:39');
INSERT INTO orders VALUES('160','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','370','20','0','20220426-14524395','1650964063','0','0','0','0','2022-04-26 14:52:43','2022-04-26 14:52:43');
INSERT INTO orders VALUES('161','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','paid','asfasf','370','20','0','20220426-14545146','1650964191','0','0','0','0','2022-04-26 14:54:51','2022-04-27 11:35:49');
INSERT INTO orders VALUES('162','8','','null','nic','0','','unpaid','','245','0','0','20220427-115339','1651039719','0','1','1','0','2022-04-27 11:53:39','2022-04-27 11:53:39');
INSERT INTO orders VALUES('163','8','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','esewa','0','','unpaid','','245','20','0','20220427-125150','1651043210','0','1','1','0','2022-04-27 12:51:50','2022-04-27 12:51:50');
INSERT INTO orders VALUES('164','8','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','245','20','0','20220427-013616','1651045876','0','1','1','0','2022-04-27 13:36:16','2022-04-27 13:36:16');
INSERT INTO orders VALUES('165','8','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','245','20','0','20220427-014040','1651046140','0','1','1','0','2022-04-27 13:40:40','2022-04-27 13:40:40');
INSERT INTO orders VALUES('166','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','115','20','0','20220428-14014115','1651133801','0','0','0','0','2022-04-28 14:01:41','2022-04-28 14:01:41');
INSERT INTO orders VALUES('167','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','115','20','0','20220502-10481813','1651467798','0','0','0','0','2022-05-02 10:48:18','2022-05-02 10:48:18');
INSERT INTO orders VALUES('168','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','115','20','0','20220502-10540715','1651468147','0','0','0','0','2022-05-02 10:54:07','2022-05-02 10:54:07');
INSERT INTO orders VALUES('169','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','115','20','0','20220502-10563272','1651468292','0','0','0','0','2022-05-02 10:56:32','2022-05-02 10:56:32');
INSERT INTO orders VALUES('170','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11285572','1651470235','0','0','0','0','2022-05-02 11:28:55','2022-05-02 11:28:55');
INSERT INTO orders VALUES('171','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11292157','1651470261','0','0','0','0','2022-05-02 11:29:21','2022-05-02 11:29:21');
INSERT INTO orders VALUES('172','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11335574','1651470535','0','0','0','0','2022-05-02 11:33:55','2022-05-02 11:33:55');
INSERT INTO orders VALUES('173','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11341791','1651470557','0','0','0','0','2022-05-02 11:34:17','2022-05-02 11:34:17');
INSERT INTO orders VALUES('174','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11354581','1651470645','0','0','0','0','2022-05-02 11:35:45','2022-05-02 11:35:45');
INSERT INTO orders VALUES('175','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11360984','1651470669','0','0','0','0','2022-05-02 11:36:09','2022-05-02 11:36:09');
INSERT INTO orders VALUES('176','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11365640','1651470716','0','0','0','0','2022-05-02 11:36:56','2022-05-02 11:36:56');
INSERT INTO orders VALUES('177','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11383739','1651470817','0','0','0','0','2022-05-02 11:38:37','2022-05-02 11:38:37');
INSERT INTO orders VALUES('178','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11412493','1651470984','0','0','0','0','2022-05-02 11:41:24','2022-05-02 11:41:24');
INSERT INTO orders VALUES('179','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11424419','1651471064','0','0','0','0','2022-05-02 11:42:44','2022-05-02 11:42:44');
INSERT INTO orders VALUES('180','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11430540','1651471085','0','0','0','0','2022-05-02 11:43:05','2022-05-02 11:43:05');
INSERT INTO orders VALUES('181','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11440950','1651471149','0','0','0','0','2022-05-02 11:44:09','2022-05-02 11:44:09');
INSERT INTO orders VALUES('182','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11441884','1651471158','0','0','0','0','2022-05-02 11:44:18','2022-05-02 11:44:18');
INSERT INTO orders VALUES('183','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11453094','1651471230','0','0','0','0','2022-05-02 11:45:30','2022-05-02 11:45:30');
INSERT INTO orders VALUES('184','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11453326','1651471233','0','0','0','0','2022-05-02 11:45:33','2022-05-02 11:45:33');
INSERT INTO orders VALUES('185','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11463066','1651471290','0','0','0','0','2022-05-02 11:46:30','2022-05-02 11:46:30');
INSERT INTO orders VALUES('186','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11484768','1651471427','0','0','0','0','2022-05-02 11:48:47','2022-05-02 11:48:47');
INSERT INTO orders VALUES('187','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11492684','1651471466','0','0','0','0','2022-05-02 11:49:26','2022-05-02 11:49:26');
INSERT INTO orders VALUES('188','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11494222','1651471482','0','0','0','0','2022-05-02 11:49:42','2022-05-02 11:49:42');
INSERT INTO orders VALUES('189','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11495843','1651471498','0','0','0','0','2022-05-02 11:49:58','2022-05-02 11:49:58');
INSERT INTO orders VALUES('190','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11501558','1651471515','0','0','0','0','2022-05-02 11:50:15','2022-05-02 11:50:15');
INSERT INTO orders VALUES('191','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','720','20','0','20220502-11505929','1651471559','0','0','0','0','2022-05-02 11:50:59','2022-05-02 11:50:59');
INSERT INTO orders VALUES('192','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-11520446','1651471624','0','0','0','0','2022-05-02 11:52:04','2022-05-02 11:52:04');
INSERT INTO orders VALUES('193','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-11542698','1651471766','0','0','0','0','2022-05-02 11:54:26','2022-05-02 11:54:26');
INSERT INTO orders VALUES('194','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12074221','1651472562','0','0','0','0','2022-05-02 12:07:42','2022-05-02 12:07:42');
INSERT INTO orders VALUES('195','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12083825','1651472618','0','0','0','0','2022-05-02 12:08:38','2022-05-02 12:08:38');
INSERT INTO orders VALUES('196','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12094886','1651472688','0','0','0','0','2022-05-02 12:09:48','2022-05-02 12:09:48');
INSERT INTO orders VALUES('197','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12101561','1651472715','0','0','0','0','2022-05-02 12:10:15','2022-05-02 12:10:15');
INSERT INTO orders VALUES('198','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12103228','1651472732','0','0','0','0','2022-05-02 12:10:32','2022-05-02 12:10:32');
INSERT INTO orders VALUES('199','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12114621','1651472806','0','0','0','0','2022-05-02 12:11:46','2022-05-02 12:11:46');
INSERT INTO orders VALUES('200','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12121923','1651472839','0','0','0','0','2022-05-02 12:12:19','2022-05-02 12:12:19');
INSERT INTO orders VALUES('201','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12131819','1651472898','0','0','0','0','2022-05-02 12:13:18','2022-05-02 12:13:18');
INSERT INTO orders VALUES('202','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12132531','1651472905','0','0','0','0','2022-05-02 12:13:25','2022-05-02 12:13:25');
INSERT INTO orders VALUES('203','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12132826','1651472908','0','0','0','0','2022-05-02 12:13:28','2022-05-02 12:13:28');
INSERT INTO orders VALUES('204','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12172488','1651473144','0','0','0','0','2022-05-02 12:17:24','2022-05-02 12:17:24');
INSERT INTO orders VALUES('205','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12173527','1651473155','0','0','0','0','2022-05-02 12:17:35','2022-05-02 12:17:35');
INSERT INTO orders VALUES('206','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12173818','1651473158','0','0','0','0','2022-05-02 12:17:38','2022-05-02 12:17:38');
INSERT INTO orders VALUES('207','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12184515','1651473225','0','0','0','0','2022-05-02 12:18:45','2022-05-02 12:18:45');
INSERT INTO orders VALUES('208','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12205766','1651473357','0','0','0','0','2022-05-02 12:20:57','2022-05-02 12:20:57');
INSERT INTO orders VALUES('209','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12212415','1651473384','0','0','0','0','2022-05-02 12:21:24','2022-05-02 12:21:24');
INSERT INTO orders VALUES('210','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12215319','1651473413','0','0','0','0','2022-05-02 12:21:53','2022-05-02 12:21:53');
INSERT INTO orders VALUES('211','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12282696','1651473806','0','0','0','0','2022-05-02 12:28:26','2022-05-02 12:28:26');
INSERT INTO orders VALUES('212','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12285438','1651473834','0','0','0','0','2022-05-02 12:28:54','2022-05-02 12:28:54');
INSERT INTO orders VALUES('213','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"12","delivery_location":"1","country":"Nepal","city":"31231","postal_code":"23123","phone":"123","checkout_type":"logged"}','nic','0','','unpaid','','1720','20','0','20220502-12291432','1651473854','0','0','0','0','2022-05-02 12:29:14','2022-05-02 12:29:14');
INSERT INTO orders VALUES('214','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','nic','0','','unpaid','','399.99','20','0','20220503-10252773','1651552827','0','0','0','0','2022-05-03 10:25:27','2022-05-03 10:25:27');
INSERT INTO orders VALUES('215','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','nic','0','','unpaid','','399.99','20','0','20220503-10384487','1651553624','0','0','0','0','2022-05-03 10:38:44','2022-05-03 10:38:44');
INSERT INTO orders VALUES('216','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','nic','0','','unpaid','','399.99','20','0','20220503-10402696','1651553726','0','0','0','0','2022-05-03 10:40:26','2022-05-03 10:40:26');
INSERT INTO orders VALUES('217','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','nic','0','','unpaid','','399.99','20','0','20220503-10403124','1651553731','0','0','0','0','2022-05-03 10:40:31','2022-05-03 10:40:32');
INSERT INTO orders VALUES('218','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','300','20','0','20220503-10425920','1651553879','1','0','0','0','2022-05-03 10:42:59','2022-05-03 11:29:21');
INSERT INTO orders VALUES('219','276','','null','','0','','','','-5','0','0','20220503-112029','1651556129','0','1','1','0','2022-05-03 11:20:29','2022-05-03 11:20:29');
INSERT INTO orders VALUES('220','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','217','20','0','20220503-112114','1651556174','0','1','1','0','2022-05-03 11:21:14','2022-05-03 11:21:14');
INSERT INTO orders VALUES('221','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','217','20','0','20220503-112235','1651556255','0','1','1','0','2022-05-03 11:22:35','2022-05-03 11:22:35');
INSERT INTO orders VALUES('222','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','217','20','0','20220503-112304','1651556284','0','1','1','0','2022-05-03 11:23:04','2022-05-03 11:23:04');
INSERT INTO orders VALUES('223','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','217','20','0','20220503-112346','1651556326','0','1','1','0','2022-05-03 11:23:46','2022-05-03 11:23:46');
INSERT INTO orders VALUES('224','276','','{"name":"1234567","email":"joshibipin2052@gmail.com","address":"Dhumbarahi","delivery_location":"1","country":"Nepal","city":"Kathmandu","postal_code":"4600","phone":"9845590200","checkout_type":"logged"}','cash_on_delivery','0','','unpaid','','217','20','0','20220503-112634','1651556494','1','1','1','0','2022-05-03 11:26:34','2022-05-03 11:30:44');


DROP TABLE IF EXISTS pages;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO pages VALUES('13','About','about','content','','','','','2022-03-25 08:19:56','2022-03-25 08:19:56','','','','');


DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO password_resets VALUES('pramodlamsal@yahoo.com','$2y$10$9HCcaY8EVKkLcPWNSZLTvu.A8hbfAgus7wMC3HtqiNnuYW2Ssgz3.','2020-06-04 13:02:46','');
INSERT INTO password_resets VALUES('customer@example.com','KWCUYCk8L8W8OFkHFLBgoOPw21KuOUbIUGm5zk5FjOvzJ8v8XpDS3ynhzPzY','2022-04-20 17:32:00','2022-04-20 17:36:22');
INSERT INTO password_resets VALUES('joshibipin2052@gmail.com','$2y$10$DeaYeVE95Tn7WK9WowergOlEsK02YCJxiIZOb.XfgqEvF6.Ne0YdW','2022-05-03 09:52:22','');


DROP TABLE IF EXISTS payments;

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payments VALUES('1','1','46','','cash','','2022-03-25 16:49:55','2022-03-25 16:49:55');


DROP TABLE IF EXISTS pickup_points;

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO pickup_points VALUES('4','5','Kohalpur Stores','Near hotel City Plaza, New road, Banke','9815650318','','','2020-09-08 06:10:53','2022-01-04 14:39:34');
INSERT INTO pickup_points VALUES('5','1','Attariya Store','Attariya, kailali','9812727525','1','','2020-11-22 06:57:27','2020-11-22 06:57:27');


DROP TABLE IF EXISTS policies;

CREATE TABLE `policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO policies VALUES('1','support_policy','Support','2022-03-30 11:16:24','2022-03-30 09:16:24');
INSERT INTO policies VALUES('2','return_policy','njknkjn','2022-01-04 15:14:36','2022-01-04 14:14:36');
INSERT INTO policies VALUES('4','seller_policy','this is policy','2022-01-04 15:14:03','2022-01-04 14:14:03');
INSERT INTO policies VALUES('5','terms','<p>The domain name www.closetnepal.com.np&nbsp;is owned by Closet Nepal Private Limited.&nbsp;Your use of this e-commerce portal and services and tools are governed by the following terms and conditions (Terms of Use) as applicable to the website. When you visit the website, you are subject to the policies that are applicable here.</p><p>For the purpose of these Terms of Use, wherever the context so requires ‘You’ or ‘User’ or ‘Visitor’ will mean any natural or legal person who has agreed to become a member of the site by signing up. Closet Nepal&nbsp;allows user to surf the website or making purchases without registering on the website. The term “we”, “us”, “our” will mean Closet Nepal.</p><p>When you use Closet Nepal, we collect and store your personal information which is provided by you from time to time. Our primary goal in doing so is to provide you a safe, efficient, and customized experience. This allows us to provide services and features that most likely meet your needs. If you choose to buy on the website, we collect information about your buying behavior.</p><p>If you choose to mail us or leave feedback, we will collect that information you provide to us. We retain this information as necessary to resolve disputes, provide customer support and troubleshoot problems as permitted by law.In our efforts to continually improve our product and service offerings, we collect and analyze demographic and profile data about our users’ activity on our website.Our website may link to other websites too. These links are provided for your convenience to provide further information. Closet Nepal&nbsp;is not responsible for the practices, term of use or the content of those linked websites.</p><p>This website contains materials which are owned by us. These materials include, but are not limited to, the design, look, appearance, data, and graphics. Reproduction is prohibited other than in accordance with the copyright law. Unauthorized use of this site may give rise to a claim for damages. Products at this e-commerce portal&nbsp;sold by respective sellers. All materials on this site are protected by copyrights, trademarks, and other intellectual property rights. Material on website is solely for personal and non-commercial use of users. Without the prior written consent of the owner, modification or use of the materials on any other website is violation of the law, and is prohibited.</p><p>We reserve the right to change, modify, add or remove portions of these Terms of Use at any time without any prior written notice. If we decide to change the terms of use, we will post those changes on this page so that you are always aware of what information we collect and how we use it.</p>','2020-08-30 14:17:31','2020-08-30 12:17:31');
INSERT INTO policies VALUES('6','privacy_policy','<p>This privacy policy sets out how Closet Nepal uses and protects any information that you give here when you use this website. We view protection of your privacy as a very important principle. We are committed to ensuring your privacy here. Your information will only be used in accordance with this privacy statement whenever we ask you to provide any information by which you can be identified while using this website.
</p><p>
You will be required to enter a valid phone number while signing up and placing an order on Closet Nepal. By registering your phone number with us, you consent to be contacted by us via phone calls and/or SMS, in case of any order or delivery related updates. </p><p>Closet Nepal will not use your personal information to initiate any promotional phone call or SMS. We store and process your information in computers that are protected by physical as well as reasonable technological security measures. Closet Nepal&nbsp;may change this privacy policy from time to time if needed by updating this page. Please check this page periodically to ensure that you are happy with our privacy policy.</p>','2020-08-30 14:14:59','2020-08-30 12:14:59');


DROP TABLE IF EXISTS product_stocks;

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO product_stocks VALUES('1','11','16inch','SB2i2sddmFB-16inch','12000','10','2020-06-07 00:50:11','2020-06-07 00:50:11');
INSERT INTO product_stocks VALUES('2','11','20inch','SB2i2sddmFB-20inch','13000','10','2020-06-07 00:50:11','2020-06-07 00:50:11');
INSERT INTO product_stocks VALUES('3','12','Aqua-16inch','SB2i2sddmFB-Aqua-16inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('4','12','Aqua-20inch','SB2i2sddmFB-Aqua-20inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('5','12','Blue-16inch','SB2i2sddmFB-Blue-16inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('6','12','Blue-20inch','SB2i2sddmFB-Blue-20inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('7','12','DarkOrange-16inch','SB2i2sddmFB-DarkOrange-16inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('8','12','DarkOrange-20inch','SB2i2sddmFB-DarkOrange-20inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('9','12','Yellow-16inch','SB2i2sddmFB-Yellow-16inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('10','12','Yellow-20inch','SB2i2sddmFB-Yellow-20inch','11000','10','2020-06-07 01:00:56','2020-06-07 01:00:56');
INSERT INTO product_stocks VALUES('11','18','White','A2G65-6S5LCLW7L-White','425','10','2020-06-08 19:40:30','2020-06-08 19:40:30');
INSERT INTO product_stocks VALUES('13','13','Black','KMCCP-Black','2500','6','2020-06-08 20:22:06','2020-10-19 11:04:49');
INSERT INTO product_stocks VALUES('14','46','4gm','t-4gm','1200','10','2020-08-01 12:37:58','2020-08-01 12:37:58');
INSERT INTO product_stocks VALUES('16','47','Black','MLb-Black','1550','7','2020-09-12 06:38:17','2020-09-12 06:39:00');
INSERT INTO product_stocks VALUES('17','55','Black','FMsc-Black','3700','1','2020-10-14 15:36:48','2020-10-14 15:36:48');
INSERT INTO product_stocks VALUES('18','58','Amethyst-12','D-Amethyst-12','560','20','2020-10-18 13:19:20','2020-10-18 13:28:51');
INSERT INTO product_stocks VALUES('19','58','Amethyst-13','D-Amethyst-13','100','2','2020-10-18 13:19:20','2020-10-18 13:25:20');
INSERT INTO product_stocks VALUES('20','58','Amethyst-14','D-Amethyst-14','100','2','2020-10-18 13:19:20','2020-10-18 13:25:20');
INSERT INTO product_stocks VALUES('21','58','Amethyst-15','D-Amethyst-15','100','2','2020-10-18 13:19:20','2020-10-18 13:25:20');
INSERT INTO product_stocks VALUES('22','58','Amethyst-16','D-Amethyst-16','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('23','58','AntiqueWhite-12','D-AntiqueWhite-12','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('24','58','AntiqueWhite-13','D-AntiqueWhite-13','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('25','58','AntiqueWhite-14','D-AntiqueWhite-14','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('26','58','AntiqueWhite-15','D-AntiqueWhite-15','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('27','58','AntiqueWhite-16','D-AntiqueWhite-16','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('28','58','Aqua-12','D-Aqua-12','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('29','58','Aqua-13','D-Aqua-13','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('30','58','Aqua-14','D-Aqua-14','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('31','58','Aqua-15','D-Aqua-15','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('32','58','Aqua-16','D-Aqua-16','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('33','58','BlueViolet-12','D-BlueViolet-12','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('34','58','BlueViolet-13','D-BlueViolet-13','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('35','58','BlueViolet-14','D-BlueViolet-14','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('36','58','BlueViolet-15','D-BlueViolet-15','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('37','58','BlueViolet-16','D-BlueViolet-16','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('38','58','Brown-12','D-Brown-12','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('39','58','Brown-13','D-Brown-13','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('40','58','Brown-14','D-Brown-14','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('41','58','Brown-15','D-Brown-15','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('42','58','Brown-16','D-Brown-16','100','10','2020-10-18 13:19:20','2020-10-18 13:19:20');
INSERT INTO product_stocks VALUES('43','58','Chocolate-12','D-Chocolate-12','100','10','2020-10-18 13:27:00','2020-10-18 13:27:00');
INSERT INTO product_stocks VALUES('44','58','Chocolate-13','D-Chocolate-13','100','10','2020-10-18 13:27:00','2020-10-18 13:27:00');
INSERT INTO product_stocks VALUES('45','58','Chocolate-14','D-Chocolate-14','100','10','2020-10-18 13:27:00','2020-10-18 13:27:00');
INSERT INTO product_stocks VALUES('46','58','Chocolate-15','D-Chocolate-15','100','10','2020-10-18 13:27:00','2020-10-18 13:27:00');
INSERT INTO product_stocks VALUES('47','59','Aqua-10','kj-Aqua-10','1000','20','2020-10-18 13:34:56','2020-10-18 13:34:56');
INSERT INTO product_stocks VALUES('48','60','S','Hs1sb-S','1200','17','2020-10-20 12:22:39','2021-12-14 12:15:00');
INSERT INTO product_stocks VALUES('49','60','M','Hs1sb-M','1200','10','2020-10-20 12:22:39','2020-11-06 08:00:40');
INSERT INTO product_stocks VALUES('50','60','L','Hs1sb-L','1200','10','2020-10-20 12:22:39','2020-11-06 08:00:40');
INSERT INTO product_stocks VALUES('51','60','XL','Hs1sb-XL','1200','10','2020-10-20 12:22:39','2020-11-06 08:00:40');
INSERT INTO product_stocks VALUES('52','60','2XL','Hs1sb-2XL','1200','9','2020-10-20 12:22:39','2020-11-06 08:00:40');
INSERT INTO product_stocks VALUES('53','60','3XL','Hs1sb-3XL','1200','10','2020-10-20 12:22:39','2020-11-06 08:00:40');
INSERT INTO product_stocks VALUES('54','78','10000mAh','RS6LPB2UHCPCwDUOP&3IEBPCfii&S-10000mAh','2100','10','2020-10-27 14:24:34','2020-10-27 14:27:04');
INSERT INTO product_stocks VALUES('55','78','20000mAh','RS6LPB2UHCPCwDUOP&3IEBPCfii&S-20000mAh','2500','10','2020-10-27 14:24:34','2020-10-27 14:27:04');
INSERT INTO product_stocks VALUES('65','85','39','SSfm-39','3200','1','2020-11-02 13:31:57','2020-11-02 13:43:39');
INSERT INTO product_stocks VALUES('66','87','37','sssfm-37','2200','1','2020-11-02 13:42:22','2020-11-02 13:42:22');
INSERT INTO product_stocks VALUES('67','87','38','sssfm-38','2200','2','2020-11-02 13:42:22','2020-11-02 13:42:22');
INSERT INTO product_stocks VALUES('68','87','39','sssfm-39','2200','1','2020-11-02 13:42:22','2020-11-02 13:42:22');
INSERT INTO product_stocks VALUES('69','87','40','sssfm-40','2200','1','2020-11-02 13:42:22','2020-11-02 13:42:22');
INSERT INTO product_stocks VALUES('70','88','39','Sssfg-39','2000','-30','2020-11-02 13:48:46','2022-04-27 11:53:39');
INSERT INTO product_stocks VALUES('71','88','40','Sssfg-40','2000','9','2020-11-02 13:48:46','2022-04-19 00:57:58');
INSERT INTO product_stocks VALUES('72','89','39','sfmss-39','3000','1','2020-11-02 13:53:18','2020-11-06 13:10:27');
INSERT INTO product_stocks VALUES('73','90','39','sssfm-39','2500','1','2020-11-02 13:57:43','2020-11-02 13:57:43');
INSERT INTO product_stocks VALUES('74','91','41','sssfm-41','250','1','2020-11-02 14:03:44','2020-11-02 14:03:44');
INSERT INTO product_stocks VALUES('75','92','42','sssfm-42','2800','1','2020-11-02 14:07:06','2020-11-02 14:07:06');
INSERT INTO product_stocks VALUES('76','93','38','sssfm-38','2600','1','2020-11-02 14:11:59','2020-11-02 14:11:59');
INSERT INTO product_stocks VALUES('77','94','39','sssfm-39','3000','1','2020-11-02 14:18:24','2020-11-02 14:18:24');
INSERT INTO product_stocks VALUES('78','95','40','sssfm-40','2500','1','2020-11-02 14:23:48','2020-11-02 14:23:48');
INSERT INTO product_stocks VALUES('79','95','42','sssfm-42','2500','1','2020-11-02 14:23:48','2020-11-02 14:23:48');
INSERT INTO product_stocks VALUES('80','96','39','sssfm-39','3000','1','2020-11-02 14:26:56','2020-11-02 14:26:56');
INSERT INTO product_stocks VALUES('81','97','39','sssfm-39','2200','1','2020-11-02 14:30:34','2020-11-02 14:30:34');
INSERT INTO product_stocks VALUES('82','97','42','sssfm-42','2200','2','2020-11-02 14:30:34','2020-11-02 14:30:34');
INSERT INTO product_stocks VALUES('83','98','39','sssfm-39','2500','1','2020-11-02 14:34:17','2020-11-02 14:34:17');
INSERT INTO product_stocks VALUES('84','99','39','sssfm-39','2500','1','2020-11-02 14:34:17','2020-11-02 14:34:17');
INSERT INTO product_stocks VALUES('85','100','39','sssfm-39','2500','1','2020-11-02 14:34:17','2020-11-02 14:34:17');
INSERT INTO product_stocks VALUES('86','115','m','s-m','1150','10','2020-11-06 14:43:37','2020-11-06 14:43:37');
INSERT INTO product_stocks VALUES('87','115','l','s-l','1150','10','2020-11-06 14:43:37','2020-11-06 14:43:37');
INSERT INTO product_stocks VALUES('88','115','xl','s-xl','1150','10','2020-11-06 14:43:37','2020-11-06 14:43:37');
INSERT INTO product_stocks VALUES('91','124','10-100','RE-10-100','663','10','2021-01-20 14:22:52','2021-01-20 14:22:52');
INSERT INTO product_stocks VALUES('92','125','10-10','JN-10-10','96','10','2021-01-21 12:23:29','2021-01-21 12:23:29');
INSERT INTO product_stocks VALUES('94','132','v-trek','3vlt-v-trek','24000','10','2021-08-20 14:40:34','2021-08-20 14:40:34');
INSERT INTO product_stocks VALUES('95','133','v-trek','3vlt-v-trek','24000','10','2021-08-20 14:41:07','2021-08-20 14:41:07');
INSERT INTO product_stocks VALUES('96','134','Black-1','4svt-Black-1','45000','10','2021-08-20 15:32:36','2021-08-20 15:32:36');
INSERT INTO product_stocks VALUES('97','135','Black','4vt-Black','45000','10','2021-08-20 16:07:50','2021-08-20 16:07:50');
INSERT INTO product_stocks VALUES('98','140','AliceBlue-M','IPA-AliceBlue-M','100','-3','2021-12-13 06:32:16','2021-12-14 12:32:32');
INSERT INTO product_stocks VALUES('99','140','DarkGreen-M','IPA-DarkGreen-M','100','5','2021-12-13 06:32:16','2022-05-02 10:56:32');
INSERT INTO product_stocks VALUES('101','142','10','SP-10','20','0','2021-12-15 05:41:40','2022-04-17 08:52:55');
INSERT INTO product_stocks VALUES('102','143','15','NSP-15','50','1','2021-12-15 05:42:35','2021-12-15 07:07:32');
INSERT INTO product_stocks VALUES('104','147','Black-l','VSRDBD/JP(7WB-Black-l','2500','7','2022-01-04 13:02:59','2022-01-07 15:15:12');
INSERT INTO product_stocks VALUES('105','147','Black-xl','VSRDBD/JP(7WB-Black-xl','2500','10','2022-01-04 13:02:59','2022-01-04 13:02:59');
INSERT INTO product_stocks VALUES('106','147','Black-xxl','VSRDBD/JP(7WB-Black-xxl','2500','10','2022-01-04 13:02:59','2022-01-04 13:02:59');
INSERT INTO product_stocks VALUES('107','147','DarkBlue-l','VSRDBD/JP(7WB-DarkBlue-l','2500','10','2022-01-04 13:02:59','2022-01-04 13:02:59');
INSERT INTO product_stocks VALUES('108','147','DarkBlue-xl','VSRDBD/JP(7WB-DarkBlue-xl','2500','10','2022-01-04 13:02:59','2022-01-04 13:02:59');
INSERT INTO product_stocks VALUES('109','147','DarkBlue-xxl','VSRDBD/JP(7WB-DarkBlue-xxl','2500','10','2022-01-04 13:02:59','2022-01-04 13:02:59');
INSERT INTO product_stocks VALUES('110','145','CadetBlue-24','VK-CadetBlue-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('111','145','DarkCyan-24','CM-DarkCyan-24','987','10','2022-01-04 13:14:01','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('112','145','DarkMagenta-24','VK-DarkMagenta-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('113','145','DarkOrchid-24','CM-DarkOrchid-24','987','10','2022-01-04 13:14:01','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('114','145','DarkTurquoise-24','VK-DarkTurquoise-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('115','145','FireBrick-24','CM-FireBrick-24','987','10','2022-01-04 13:14:01','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('116','145','Gold-24','VK-Gold-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('117','145','LightCyan-24','VK-LightCyan-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('118','145','Linen-24','CM-Linen-24','987','10','2022-01-04 13:14:01','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('119','145','MediumOrchid-24','VK-MediumOrchid-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('120','145','MintCream-24','CM-MintCream-24','987','10','2022-01-04 13:14:01','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('121','145','Olive-24','VK-Olive-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('122','145','Plum-24','CM-Plum-24','987','10','2022-01-04 13:14:01','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('123','145','Silver-24','VK-Silver-24','116','10','2022-01-04 13:14:01','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('124','145','CadetBlue-529','VK-CadetBlue-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('125','145','DarkCyan-529','CM-DarkCyan-529','987','10','2022-01-04 13:14:45','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('126','145','DarkMagenta-529','VK-DarkMagenta-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('127','145','DarkOrchid-529','CM-DarkOrchid-529','987','10','2022-01-04 13:14:45','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('128','145','DarkTurquoise-529','VK-DarkTurquoise-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('129','145','FireBrick-529','CM-FireBrick-529','987','10','2022-01-04 13:14:45','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('130','145','Gold-529','VK-Gold-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('131','145','LightCyan-529','VK-LightCyan-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('132','145','Linen-529','CM-Linen-529','987','10','2022-01-04 13:14:45','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('133','145','MediumOrchid-529','VK-MediumOrchid-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('134','145','MintCream-529','CM-MintCream-529','987','10','2022-01-04 13:14:45','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('135','145','Olive-529','VK-Olive-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('136','145','Plum-529','CM-Plum-529','987','10','2022-01-04 13:14:45','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('137','145','Silver-529','VK-Silver-529','116','10','2022-01-04 13:14:45','2022-01-04 13:14:45');
INSERT INTO product_stocks VALUES('138','145','Azure-24','CM-Azure-24','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('139','145','Azure-529','CM-Azure-529','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('140','145','Azure-173','CM-Azure-173','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('141','145','Bisque-24','CM-Bisque-24','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('142','145','Bisque-529','CM-Bisque-529','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('143','145','Bisque-173','CM-Bisque-173','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('144','145','Black-24','CM-Black-24','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('145','145','Black-529','CM-Black-529','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('146','145','Black-173','CM-Black-173','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('147','145','BlanchedAlmond-24','CM-BlanchedAlmond-24','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('148','145','BlanchedAlmond-529','CM-BlanchedAlmond-529','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('149','145','BlanchedAlmond-173','CM-BlanchedAlmond-173','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('150','145','Blue-24','CM-Blue-24','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('151','145','Blue-529','CM-Blue-529','987','10','2022-01-04 13:15:25','2022-01-04 13:15:25');
INSERT INTO product_stocks VALUES('152','145','Blue-173','CM-Blue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('153','145','BurlyWood-24','CM-BurlyWood-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('154','145','BurlyWood-529','CM-BurlyWood-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('155','145','BurlyWood-173','CM-BurlyWood-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('156','145','Chocolate-24','CM-Chocolate-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('157','145','Chocolate-529','CM-Chocolate-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('158','145','Chocolate-173','CM-Chocolate-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('159','145','Coral-24','CM-Coral-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('160','145','Coral-529','CM-Coral-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('161','145','Coral-173','CM-Coral-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('162','145','CornflowerBlue-24','CM-CornflowerBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('163','145','CornflowerBlue-529','CM-CornflowerBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('164','145','CornflowerBlue-173','CM-CornflowerBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('165','145','Cornsilk-24','CM-Cornsilk-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('166','145','Cornsilk-529','CM-Cornsilk-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('167','145','Cornsilk-173','CM-Cornsilk-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('168','145','Crimson-24','CM-Crimson-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('169','145','Crimson-529','CM-Crimson-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('170','145','Crimson-173','CM-Crimson-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('171','145','DarkCyan-173','CM-DarkCyan-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('172','145','DarkGoldenrod-24','CM-DarkGoldenrod-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('173','145','DarkGoldenrod-529','CM-DarkGoldenrod-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('174','145','DarkGoldenrod-173','CM-DarkGoldenrod-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('175','145','DarkKhaki-24','CM-DarkKhaki-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('176','145','DarkKhaki-529','CM-DarkKhaki-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('177','145','DarkKhaki-173','CM-DarkKhaki-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('178','145','DarkOrange-24','CM-DarkOrange-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('179','145','DarkOrange-529','CM-DarkOrange-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('180','145','DarkOrange-173','CM-DarkOrange-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('181','145','DarkOrchid-173','CM-DarkOrchid-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('182','145','DarkRed-24','CM-DarkRed-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('183','145','DarkRed-529','CM-DarkRed-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('184','145','DarkRed-173','CM-DarkRed-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('185','145','DarkSalmon-24','CM-DarkSalmon-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('186','145','DarkSalmon-529','CM-DarkSalmon-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('187','145','DarkSalmon-173','CM-DarkSalmon-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('188','145','DarkSeaGreen-24','CM-DarkSeaGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('189','145','DarkSeaGreen-529','CM-DarkSeaGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('190','145','DarkSeaGreen-173','CM-DarkSeaGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('191','145','DarkSlateBlue-24','CM-DarkSlateBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('192','145','DarkSlateBlue-529','CM-DarkSlateBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('193','145','DarkSlateBlue-173','CM-DarkSlateBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('194','145','DeepPink-24','CM-DeepPink-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('195','145','DeepPink-529','CM-DeepPink-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('196','145','DeepPink-173','CM-DeepPink-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('197','145','FireBrick-173','CM-FireBrick-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('198','145','GhostWhite-24','CM-GhostWhite-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('199','145','GhostWhite-529','CM-GhostWhite-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('200','145','GhostWhite-173','CM-GhostWhite-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('201','145','Gray-24','CM-Gray-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('202','145','Gray-529','CM-Gray-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('203','145','Gray-173','CM-Gray-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('204','145','Indigo-24','CM-Indigo-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('205','145','Indigo-529','CM-Indigo-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('206','145','Indigo-173','CM-Indigo-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('207','145','Lavender-24','CM-Lavender-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('208','145','Lavender-529','CM-Lavender-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('209','145','Lavender-173','CM-Lavender-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('210','145','LightCoral-24','CM-LightCoral-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('211','145','LightCoral-529','CM-LightCoral-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('212','145','LightCoral-173','CM-LightCoral-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('213','145','LightGreen-24','CM-LightGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('214','145','LightGreen-529','CM-LightGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('215','145','LightGreen-173','CM-LightGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('216','145','LightPink-24','CM-LightPink-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('217','145','LightPink-529','CM-LightPink-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('218','145','LightPink-173','CM-LightPink-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('219','145','LightSalmon-24','CM-LightSalmon-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('220','145','LightSalmon-529','CM-LightSalmon-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('221','145','LightSalmon-173','CM-LightSalmon-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('222','145','LightSeaGreen-24','CM-LightSeaGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('223','145','LightSeaGreen-529','CM-LightSeaGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('224','145','LightSeaGreen-173','CM-LightSeaGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('225','145','LimeGreen-24','CM-LimeGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('226','145','LimeGreen-529','CM-LimeGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('227','145','LimeGreen-173','CM-LimeGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('228','145','Linen-173','CM-Linen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('229','145','MediumBlue-24','CM-MediumBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('230','145','MediumBlue-529','CM-MediumBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('231','145','MediumBlue-173','CM-MediumBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('232','145','MediumPurple-24','CM-MediumPurple-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('233','145','MediumPurple-529','CM-MediumPurple-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('234','145','MediumPurple-173','CM-MediumPurple-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('235','145','MediumSeaGreen-24','CM-MediumSeaGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('236','145','MediumSeaGreen-529','CM-MediumSeaGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('237','145','MediumSeaGreen-173','CM-MediumSeaGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('238','145','MediumSlateBlue-24','CM-MediumSlateBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('239','145','MediumSlateBlue-529','CM-MediumSlateBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('240','145','MediumSlateBlue-173','CM-MediumSlateBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('241','145','MediumSpringGreen-24','CM-MediumSpringGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('242','145','MediumSpringGreen-529','CM-MediumSpringGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('243','145','MediumSpringGreen-173','CM-MediumSpringGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('244','145','MediumVioletRed-24','CM-MediumVioletRed-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('245','145','MediumVioletRed-529','CM-MediumVioletRed-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('246','145','MediumVioletRed-173','CM-MediumVioletRed-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('247','145','MintCream-173','CM-MintCream-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('248','145','Moccasin-24','CM-Moccasin-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('249','145','Moccasin-529','CM-Moccasin-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('250','145','Moccasin-173','CM-Moccasin-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('251','145','Navy-24','CM-Navy-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('252','145','Navy-529','CM-Navy-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('253','145','Navy-173','CM-Navy-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('254','145','OrangeRed-24','CM-OrangeRed-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('255','145','OrangeRed-529','CM-OrangeRed-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('256','145','OrangeRed-173','CM-OrangeRed-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('257','145','Orchid-24','CM-Orchid-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('258','145','Orchid-529','CM-Orchid-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('259','145','Orchid-173','CM-Orchid-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('260','145','PaleTurquoise-24','CM-PaleTurquoise-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('261','145','PaleTurquoise-529','CM-PaleTurquoise-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('262','145','PaleTurquoise-173','CM-PaleTurquoise-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('263','145','Pink-24','CM-Pink-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('264','145','Pink-529','CM-Pink-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('265','145','Pink-173','CM-Pink-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('266','145','Plum-173','CM-Plum-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('267','145','PowderBlue-24','CM-PowderBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('268','145','PowderBlue-529','CM-PowderBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('269','145','PowderBlue-173','CM-PowderBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('270','145','RosyBrown-24','CM-RosyBrown-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('271','145','RosyBrown-529','CM-RosyBrown-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('272','145','RosyBrown-173','CM-RosyBrown-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('273','145','RoyalBlue-24','CM-RoyalBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('274','145','RoyalBlue-529','CM-RoyalBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('275','145','RoyalBlue-173','CM-RoyalBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('276','145','SaddleBrown-24','CM-SaddleBrown-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('277','145','SaddleBrown-529','CM-SaddleBrown-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('278','145','SaddleBrown-173','CM-SaddleBrown-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('279','145','SeaGreen-24','CM-SeaGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('280','145','SeaGreen-529','CM-SeaGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('281','145','SeaGreen-173','CM-SeaGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('282','145','SkyBlue-24','CM-SkyBlue-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('283','145','SkyBlue-529','CM-SkyBlue-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('284','145','SkyBlue-173','CM-SkyBlue-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('285','145','Turquoise-24','CM-Turquoise-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('286','145','Turquoise-529','CM-Turquoise-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('287','145','Turquoise-173','CM-Turquoise-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('288','145','Violet-24','CM-Violet-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('289','145','Violet-529','CM-Violet-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('290','145','Violet-173','CM-Violet-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('291','145','Wheat-24','CM-Wheat-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('292','145','Wheat-529','CM-Wheat-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('293','145','Wheat-173','CM-Wheat-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('294','145','YellowGreen-24','CM-YellowGreen-24','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('295','145','YellowGreen-529','CM-YellowGreen-529','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('296','145','YellowGreen-173','CM-YellowGreen-173','987','10','2022-01-04 13:15:26','2022-01-04 13:15:26');
INSERT INTO product_stocks VALUES('297','149','full-asd','RC-full-asd','303','-37','2022-01-04 15:10:43','2022-04-25 15:16:51');
INSERT INTO product_stocks VALUES('333','155','Amethyst-L-soft','T-Amethyst-L-soft','1000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('334','155','Amethyst-L-hard','T-Amethyst-L-hard','2000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('335','155','Amethyst-M-soft','T-Amethyst-M-soft','3000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('336','155','Amethyst-M-hard','T-Amethyst-M-hard','4000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('337','155','Amethyst-S-soft','T-Amethyst-S-soft','5000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('338','155','Amethyst-S-hard','T-Amethyst-S-hard','6000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('339','155','Aqua-L-soft','T-Aqua-L-soft','7000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('340','155','Aqua-L-hard','T-Aqua-L-hard','8000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('341','155','Aqua-M-soft','T-Aqua-M-soft','9000','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('342','155','Aqua-M-hard','T-Aqua-M-hard','1020','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('343','155','Aqua-S-soft','T-Aqua-S-soft','1120','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('344','155','Aqua-S-hard','T-Aqua-S-hard','10420','10','2022-03-31 10:50:59','2022-03-31 10:50:59');
INSERT INTO product_stocks VALUES('345','127','Amethyst-regular-soft','PGT-Amethyst-regular-soft','200','9','2022-04-01 15:19:02','2022-05-03 10:42:59');
INSERT INTO product_stocks VALUES('346','127','Amethyst-regular-hard','PGT-Amethyst-regular-hard','100','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('347','127','Amethyst-large-soft','PGT-Amethyst-large-soft','300','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('348','127','Amethyst-large-hard','PGT-Amethyst-large-hard','400','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('349','127','AntiqueWhite-regular-soft','PGT-AntiqueWhite-regular-soft','500','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('350','127','AntiqueWhite-regular-hard','PGT-AntiqueWhite-regular-hard','600','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('351','127','AntiqueWhite-large-soft','PGT-AntiqueWhite-large-soft','700','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('352','127','AntiqueWhite-large-hard','PGT-AntiqueWhite-large-hard','800','10','2022-04-01 15:19:02','2022-04-01 15:19:02');
INSERT INTO product_stocks VALUES('353','158','---','AP----','3','10','2022-12-09 00:58:54','2022-12-09 00:58:54');
INSERT INTO product_stocks VALUES('354','159','---','AP----','3','10','2022-12-09 01:01:42','2022-12-09 01:01:42');
INSERT INTO product_stocks VALUES('355','161','---','TL----','226','10','2022-12-09 01:03:01','2022-12-09 01:03:01');
INSERT INTO product_stocks VALUES('389','162','z--','FB-z--22','271','10','2022-12-09 01:29:45','2022-12-09 01:29:45');
INSERT INTO product_stocks VALUES('425','163','AliceBlue','q-AliceBlue','0','10','2022-12-14 00:31:06','2022-12-14 00:31:06');
INSERT INTO product_stocks VALUES('426','163','Aqua','q-Aqua','0','10','2022-12-14 00:31:06','2022-12-14 00:31:06');
INSERT INTO product_stocks VALUES('428','152','Beige','L2-Beige','1000','10','2022-12-16 00:24:14','2022-12-16 00:24:14');
INSERT INTO product_stocks VALUES('429','152','Black','L2-Black','1000','10','2022-12-16 00:24:14','2022-12-16 00:24:14');
INSERT INTO product_stocks VALUES('430','152','BlanchedAlmond','L2-BlanchedAlmond','1000','10','2022-12-16 00:24:14','2022-12-16 00:24:14');


DROP TABLE IF EXISTS products;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flash_deal_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `specs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL,
  `purchase_price` double(8,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_images` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `made_in_nepal` int(11) NOT NULL DEFAULT 0,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `earn_point` double(8,2) NOT NULL DEFAULT 0.00,
  `refundable` int(1) NOT NULL DEFAULT 0,
  `warranty` int(11) NOT NULL DEFAULT 0,
  `warranty_time` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO products VALUES('19','200ml Dexe Anti Hair Loss Shampoo','','seller','3','6','46','52','56','["uploads\/products\/photos\/QxLVMyaDG07k7uLGTsEo9b9e7fLSZM9pFdBYUL6N.jpeg"]','uploads/products/thumbnail/VQKZazzCeeYtyiZVN7PlPaD5goWO92ytVooc6yNS.jpeg','uploads/products/featured/RyUbMLhWd2a3ElHgVMBbi1My8T5al5Ec5sz1kADh.jpeg','uploads/products/flash_deal/ctyl7Dzc98YGW3fJhaVPezZ9uir0SsjT7FRq69xz.jpeg','youtube','','Shampoo','<p>Reduce physical and mental stress</p><p>
Soothe scalp problems
</p><p>Protect and nourish the hair</p><p>Easy to use<br></p>','','340','250','0','[]','[]','[]','','','0','0','0','5','200ml','0','amount','0','amount','free','0','0','Anti Hair Loss Shampoo','0','Anti Hair Loss Shampoo','uploads/products/meta/XWOaadnWz0ECt5TomZZo9nbWX0bhNKOOXlzSuK99.jpeg','','200ml-Dexe-Anti-Hair-Loss-Shampoo-K1QBo','0','0','0','','0','','0','','','2020-06-07 23:03:16','2020-10-20 11:43:46');
INSERT INTO products VALUES('26','Nescafe Classic Coffee Packet','','seller','3','3','33','14','50','["uploads\/products\/photos\/zGiTu3plJ3SB9C4Hr9ZgOxis7QltuuIl238Kk4C4.jpeg"]','uploads/products/thumbnail/OcbzNUXREKnBj0WcROD75qFdztXleNzYubShzFzI.jpeg','uploads/products/featured/OdxscGd9BK8EW7BMMOQDF4H07iRYs7pMZDlZA0ut.jpeg','uploads/products/flash_deal/D4rPymaqCTXw2KqFZNhhMbDe2mhnlq6SSssF9mwy.jpeg','youtube','','Nescafe coffee | coffee','<p>50 gm
</p><p>No fatigue , No harm, Reduce Appetite &amp; Weight Loss
</p><p>Energy Booster, Increase Metabolism, Promote healthy skin
</p><p>Give clear results if follow instructions, not advertise more than it says
</p><p>Expiry - May/2021</p>','','195','80','0','[]','[]','[]','','','0','0','0','15','50gm','0','amount','0','amount','free','0','0','Nescafe coffee','0','Nescafe coffee products in Nepal','uploads/products/meta/TlKUGpAdYnb8HKnVYR3U8BfDpfo48m8pk8Cq6eJM.jpeg','','Nescafe-Classic-Coffee-Packet-sccth','0','0','0','','0','','0','','','2020-06-09 18:51:44','2020-10-20 11:43:26');
INSERT INTO products VALUES('27','BRU Instant Coffee Pouch  - 50gm','','seller','3','3','33','14','51','["uploads\/products\/photos\/cenwNAjWYdOgCCKGn3ZWsn8ZenQXOLBw1aWSyV1m.jpeg"]','uploads/products/thumbnail/z9cOvVHYfABkgUxgACdNwgrVesYw2EHe2lKVOcJ7.jpeg','uploads/products/featured/x4F2n6adnXSJK4xVUDTylYitAo3JyjUCFHNXB3Hr.jpeg','uploads/products/flash_deal/9wEdgxsptDsPwjVPd8EzmAPXY3NYEUejySk6wnoa.jpeg','youtube','','BRU Coffee','<ul><li>Healthy and nutritious
</li><li>No fatigue ,No harm
</li><li>Can be used anytime
</li><li>Instant and tasty</li><li>Easy to use and prepare</li></ul>','','140','80','0','[]','[]','[]','','','0','0','0','10','50gm','0','amount','0','amount','free','0','0','BRU Coffee','0','BRU Coffee in Nepal','uploads/products/meta/QqaecUZTIsSgEsv6sgYk9mSP1D8wZb5s5tlsMUCG.jpeg','','BRU-Instant-Coffee-Pouch----50gm-YNVPa','0','0','0','','0','','0','','','2020-06-09 18:58:57','2020-10-20 11:43:20');
INSERT INTO products VALUES('28','Maccoffee Original-50 gm','','seller','3','3','33','14','52','["uploads\/products\/photos\/KesnjKrcviAyenQMqBrWCWJJVZvoLnCFUvqmiNdH.jpeg"]','uploads/products/thumbnail/vecaq9yCMRnyZXwtQccsBN3rQO4P9zegl7h6elLg.jpeg','uploads/products/featured/XUDKUKnhI9SZxGnFuN57r5tQBJAhwUoUUFLFgCKE.jpeg','uploads/products/flash_deal/yPX7EJntoiDJFW0Ld6rXkHcgBl5t3auCTdKMr98H.jpeg','youtube','','MacCoffee | Coffee','<ul><li>Healthy and nutritious
</li><li>No fatigue , No harm, Reduce Appetite &amp; Weight Loss
</li><li>Energy Booster, Increase Metabolism, Promote healthy skin
</li><li>Give clear results if follow instructions, not advertise more than it says</li></ul>','','180','120','0','[]','[]','[]','','','0','0','0','14','50gm','0','amount','0','amount','free','0','1','MacCoffee','0','Mac Coffee in Nepal','uploads/products/meta/0JNrGQk2ftpCQ9AsGbijcwlEC4iiSyA5YpmS8AHB.jpeg','','Maccoffee-Original-50-gm-n3oXx','0','0','0','','0','','0','','','2020-06-09 19:06:14','2020-10-20 11:43:19');
INSERT INTO products VALUES('29','Red Cherry Himalayan Arabica Coffee - 250 Gm','','seller','3','3','33','14','53','["uploads\/products\/photos\/M0FdoMZCBWuorGMBp7jgxxr6RsNLBczRQKYHoELD.webp"]','uploads/products/thumbnail/iVmxnzjSz9xSm8qvmHeKpMDwxYY1YMwdv4MEHQPZ.webp','uploads/products/featured/uwaT2TUuq2ruTTQX9XkKnjBcSjlEfE5lW4ecIuFN.webp','uploads/products/flash_deal/2Uwb2TW45p2YfFuUhJDjR06ees7VcT9FK1q2gZJP.webp','youtube','','Arabica coffee| Coffee','<ul><li>250 gm coarse ground powder.
</li><li>100% Arabica Nepali Coffee.
</li><li>Roasted in traditional slow gourmet.
</li><li>Less acidic, more bitter, and more highly caffeinated.</li><li>Easy and healthy to use<br></li></ul>','','700','615','0','[]','[]','[]','','','0','1','0','0','250gm','0','amount','0','amount','free','0','0','Red Cherry Himalayan Arabica Coffee | Coffee and many more','0','Red Cherry Himalayan Arabica Coffee products in Nepal','uploads/products/meta/gm6GZvpWSrAgo6cPVTIfqd0HmNzrnokoxtEOeGt1.webp','','Red-Cherry-Himalayan-Arabica-Coffee---250-Gm-N61KQ','0','0','0','','0','','0','','','2020-06-09 19:16:35','2022-01-20 14:43:31');
INSERT INTO products VALUES('34','Dual USB car Charger','','seller','27','11','4','','','["uploads\/products\/photos\/YMatr2DrOtWLVMJiYoyaocKSAsCuWXmXFwG88oMF.jpeg"]','uploads/products/thumbnail/9miQKNC0qM8VpKzMa2Xwu9TSak4dawh27xZ79TP2.jpeg','uploads/products/featured/hc6C2lBMdbpCe92VrFNGdokKtLcnmNxy0JiAMpAP.jpeg','uploads/products/flash_deal/obMtCNcKLIHFgrcVYjBuPOfaPm7b8dRrfGfTJz3U.jpeg','youtube','','Car charger','','','940','650','0','[]','[]','[]','','','0','0','0','5','pc','140','amount','0','amount','flat_rate','49.99','0','dual usb car charger price in nepal','0','Buy dual ub car charger at very reasonable price at Closet Nepal.We offers variety of car charger at very raesonable price.','','','Dual-USB-car-Charger-ISUuk','0','0','0','','0','','0','','','2020-07-13 08:05:40','2020-10-20 11:43:05');
INSERT INTO products VALUES('36','Kemei rechargeable epilator','','admin','12','6','2','71','57','["uploads\/products\/photos\/FHq8z00Utehdw8szoVT2RKQWjjRQ74LnTz2Lpz8O.jpeg","uploads\/products\/photos\/UlUJD46riBnR0OMhjPfC9wK251CZB1FaYuDGHfm6.jpeg","uploads\/products\/photos\/6pUBiNgnYvQ1aNCmzfB1k9oLwOdJNIPrQfnFyr0v.jpeg","uploads\/products\/photos\/S2SWs1QeDxHbdmSxfGjiL0T2OtCl5cb33frR0qWp.jpeg"]','uploads/products/thumbnail/7ZkxT3E7BGvCett0AEDDHPxgsZrWiPYAXdQfMxSo.jpeg','uploads/products/featured/5bMdVLAb38Ofrz9WCrb3VZL4cKxujfTmeAuteWsL.jpeg','uploads/products/flash_deal/hHG4LMDke1gMt83J6LYQcbRn7nlfh7yBpsqklydW.jpeg','youtube','','epilator,kemei','<div style="box-sizing: content-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif, Heiti; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;"><strong style="box-sizing: border-box; font-weight: 700 !important;">Description:</strong></span></div><ul style="box-sizing: border-box; list-style: disc; margin: 0px; padding: 0px; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; padding-inline-start: 40px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif, Heiti; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Washable</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Smart light</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Rechargeable, cordless use</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Easy to use anywhere and anytime</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Delicate appearance, easy to carry</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Reduce the skin sensation to avoid discomfort</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">Remove unwanted hair from legs, face, underarms</span></li></ul><div style="box-sizing: content-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif, Heiti; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</div><div style="box-sizing: content-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif, Heiti; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</div><div style="box-sizing: content-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif, Heiti; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;"><strong style="box-sizing: border-box; font-weight: 700 !important;">Package Content:&nbsp;</strong></span></div><ol style="box-sizing: border-box; list-style: decimal; margin: 0px; padding: 0px; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; padding-inline-start: 40px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif, Heiti; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">1 x Hair Epilator,&nbsp;</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">1 x Bag,&nbsp;</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">1 x Brush,&nbsp;</span></li><li style="box-sizing: border-box; margin-left: 0px;"><span style="box-sizing: border-box; max-width: 100%; word-break: break-word; font-family: georgia, serif;">1 x Bilingual User Manual in English and Chinese &nbsp; &nbsp;</span></li></ol><br>','','1500','750','0','[]','[]','[]','','','0','0','1','884','Pc','350','amount','0','amount','free','0','8','rechargeable epilator','0','buy rechargeable epilator online at closet nepal.Choose variety of products from Closet nepal','','','Kemei-rechargeable-epilator-yYdno','0','1','0','','0','','0','','','2020-07-18 20:58:33','2022-02-07 12:30:00');
INSERT INTO products VALUES('41','JBL XB-450 Headphone','','admin','12','11','4','','59','["uploads\/products\/photos\/R7zzcYo9NxpCv1vzYbkOXn89lZIpKLQBV06KYDWf.jpeg"]','uploads/products/thumbnail/jpjbotFoEd0L0BvnlQoQUDn9t33qYmo0ftxahOHz.jpeg','uploads/products/featured/FdIVoAvaULq6S0cintXcDAfZZcf8wEd1nq6I8PyV.jpeg','uploads/products/flash_deal/QZJFnilvOQB6tho1uBzhAuJXgs2mgKP6Hcil0pic.jpeg','youtube','','jbl headphone,headphones','<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 2.857em; color: rgb(104, 108, 111); font-family: &quot;Open Sans&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.14px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><strong style="box-sizing: border-box; font-weight: 700; margin-bottom: 0px;">General Features</strong></p><ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(104, 108, 111); font-family: &quot;Open Sans&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.14px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><li style="box-sizing: border-box;">In-line mic for hands-free calling</li><li style="box-sizing: border-box;">Cushioned earpads for long-wearing comfort</li><li style="box-sizing: border-box;">Flashy metallic finish housing</li><li style="box-sizing: border-box;">30mm dynamic driver unit for powerful extra bass sound</li><li style="box-sizing: border-box; margin-bottom: 0px;">JBL Headset, Earphones</li></ul>','','800','349.99','0','[]','[]','[]','','','0','0','1','0','pc','349.99','amount','0','amount','flat_rate','50','4','JBl headphones','0','Buy jbl headphones at very reasonable price at closet nepal.','','','JBL-XB-450-Headphone-vldP7','0','1','0','','0','','0','','','2020-07-21 17:17:03','2022-02-07 12:29:56');
INSERT INTO products VALUES('42','Vegetable Chopper','','admin','12','7','68','83','57','["uploads\/products\/photos\/c4HfzHsQ94kWI3UdRVr6bYh8FoH3drPGPNxZCS0o.jpeg","uploads\/products\/photos\/qMylGGPm5upR5BMaf3lAuqbzFN9w3CbNgZdfHY0z.jpeg","uploads\/products\/photos\/0IM0cLih0UAxTmpXpZGi2hEmMetdfY8JNkVY43Wv.jpeg","uploads\/products\/photos\/5Qh5EJNkqr8g7IoOmAE6N3zJTVEiiCcZxmd07C1L.jpeg"]','uploads/products/thumbnail/JABW9wclbNouGmEOoLiUvWlZBA7rlZVx9waXI4kq.jpeg','uploads/products/featured/KAIWsUjz1O8NpOghfCn1ydRVH4Olctb8eJkg5F4Q.jpeg','uploads/products/flash_deal/KSa9KqVHi0Pa5DQRGCzugmOVUNoGTcjue6VYKNym.jpeg','youtube','','vegetable chopper,keema machine','<p>Product Discription&nbsp;<br></p>','','1500','650','0','[]','[]','[]','','','0','0','0','0','pc','400','amount','0','amount','flat_rate','50','1','Vegetable Chopper','0','Buy Keema maker vegetable chopper from closet nepal at very exciting price.','','','Vegetable-Chopper-s9owE','0','1','0','','0','','0','','','2020-07-22 06:54:38','2020-09-24 11:25:11');
INSERT INTO products VALUES('71','Combo pack of pubg trigger and finger sleeves','','admin','12','11','4','','','["uploads\/products\/photos\/9Ke0E7xcfd7GkJWG5ZRUUVUUjSHPruuheV4SVlfK.jpeg","uploads\/products\/photos\/csVi5Vam4ojUmzmEMW6qugRLyWjvMj7Jz4NJqpUQ.jpeg","uploads\/products\/photos\/uoYFrN79GhNrzjgOW6QnhusJeeyUYlPEU4AA7DcY.png"]','uploads/products/thumbnail/FU878N07B39koOioHBhhUv3zuUDPPjk0Su7o8xFK.png','uploads/products/featured/PR4PJPgIUn8QtO6JkxUatmyBz8TkXXd1A9Jpuspg.png','uploads/products/flash_deal/9kksd1uziCHStJnWO8LB9UsRtrIkeLaMnA9fPBF2.png','youtube','','pubg tiggerr,finger sleeve cap,finger sleeves','<h2 class="pdp-mod-section-title outer-title" data-spm-anchor-id="a2a0e.pdp.0.i1.30fc59e7X1VRG3" style="margin: 0px; padding: 0px 24px; font-weight: 500; font-family: Roboto-Medium; font-size: 16px; line-height: 52px; color: rgb(33, 33, 33); letter-spacing: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; height: 52px; background: rgb(250, 250, 250);">Product details of Combo Pack Of Finger Sleeve Cap And Trigger For Sweat Breathable Full Touch Screen To Mobile Pubg/Call Off Duty/Free Fire Game Trigger Battle Royal Sensitive Shoot And Aim Supports</h2><div class="pdp-product-detail" data-spm="product_detail" style="margin: 0px; padding: 0px; position: relative;"><div class="pdp-product-desc height-limit" data-spm-anchor-id="a2a0e.pdp.product_detail.i0.30fc59e7X1VRG3" style="margin: 0px; padding: 5px 14px 5px 24px; height: 780px; overflow-y: hidden; box-sizing: border-box; background-color: rgb(255, 255, 255);"><div class="html-content pdp-product-highlights" style="margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;"><ul class="" style="margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;"><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Combo pack</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">touch smoothly run</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">finger sleeve cap and fastest firing sensored</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Trigger for sweat breathable</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Suitable for all types android and IOS Mobile -1 pair</li></ul></div><div class="html-content detail-content" style="margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245); color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;"><br class="Apple-interchange-newline"></div></div></div><br>','','1000','0','0','[]','[]','[]','','','0','1','1','-15','pc','400','amount','0','amount','','0','44','','0','','','','Combo-pack-of-pubg-trigger-and-finger-sleeves-cJ9MP','0','0','0','','0','','0','','','2020-10-23 11:48:14','2022-04-22 10:32:24');
INSERT INTO products VALUES('74','Blood Circulation mat','','admin','12','6','1','','','["uploads\/products\/photos\/3KcoXA8OqFcAbEij5VW3dDLt0pPyNhD0x0UmzeYJ.jpeg"]','uploads/products/thumbnail/jrp9fgBFD0DMIg4DXxHzbiQl7wg4P1ItDYiZJNiz.jpeg','uploads/products/featured/wUt8OMWWyAQFmDd0IJgLp2K8dQ3pk5k0kdsBv6lU.jpeg','uploads/products/flash_deal/m2U6zRDO4XSONDd9g7hUsXd80FpH0shwyaFdnx29.jpeg','youtube','','blood circulation mat','<div class="html-content pdp-product-highlights" data-spm-anchor-id="a2a0e.pdp.product_detail.i1.7d5e2b57LUr7gM" style="margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;"><ul class="" style="margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;"><li class="" data-spm-anchor-id="a2a0e.pdp.product_detail.i2.7d5e2b57LUr7gM" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">This Yoga Mat is designed to give you the most comfortable yoga experience possible. The extra thick mat protects joints without compromising support or stability</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Ideal For yoga, floor-exercises, pilates</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Anti slip, durable, light weight</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Easy to roll up to carry anywhere, washable</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Non-slip bottom provides stability during yoga or workout</li></ul></div><div class="html-content detail-content" style="margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245);"><p style="margin: 0px; padding: 0px; font-size: 14px;">ALL-ROUNDER- Soft, Lightweight, Anti-Slip, Washable and Easy to Carry Mat which is perfect for Yoga, Cardio, Pilates, Meditation or Stretching. EASY TO CLEAN AND CARE FOR. Wash your mat by simply wiping down with water. and hang to dry. DO NOT BLEACH, DO NOT IRON. and It provides padding and support which helps you perform the posture comfortably.</p></div><div class="pdp-mod-specification" style="margin: 16px 0px 0px; padding: 0px 0px 10px; border-bottom: 1px solid rgb(239, 240, 245); font-size: 14px;"><h2 class="pdp-mod-section-title " style="margin: 0px; padding: 0px; font-weight: 500; font-family: Roboto-Medium; font-size: 16px; line-height: 19px; color: rgb(33, 33, 33); letter-spacing: normal; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">Specifications of Yoga Mat</h2><div class="pdp-general-features" style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><br class="Apple-interchange-newline"></div></div><br>','','900','0','0','[]','[]','[]','','','0','1','1','0','pc','200','amount','0','amount','','0','3','','0','','','','Blood-Circulation-mat-OYLBT','0','1','0','','0','','0','','','2020-10-23 11:55:21','2022-04-19 17:29:07');
INSERT INTO products VALUES('78','ROMOSS Sense 6S Li-Polymer Power Bank, 20000mAh Ultra High Capacity Portable Charger with Dual USB Output Ports & 3 Inputs, External Battery Pack Compatible for iPhone, iPad & Samsung','','admin','12','11','4','','60','["uploads\/products\/photos\/07XKKWLYepJx2tZ5Vsu8Svebosmrmq7ZEY73DtKE.jpeg"]','uploads/products/thumbnail/nTLGiLoxLu6t7eYQpeTxpekX84EpAQZzFdM2ya11.jpeg','uploads/products/featured/HE6ZWD25PWvyJ4NXW0haB9Z2JUROVJurOj8mWpY4.jpeg','uploads/products/flash_deal/spd1C44dtfpdJD1DoJZIksPqMe9sLI7VXaanTsI4.jpeg','youtube','','power bank,romoss powerbank','<h1 class="a-size-base-plus a-text-bold" style="box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-weight: 700 !important; font-size: 16px !important; line-height: 24px !important; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">About this item</h1><ul class="a-unordered-list a-vertical a-spacing-mini" style="box-sizing: border-box; margin: 0px 0px 0px 18px; color: rgb(17, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><li style="box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="box-sizing: border-box; color: rgb(17, 17, 17);">The ROMOSS Advantage: With more than 15 years of experience and technology accumulation in the field of power supply manufacturing.</span></li><li style="box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="box-sizing: border-box; color: rgb(17, 17, 17);">4X Faster than Conventional Chargers -- Charges QC-support devices up to 80% in just 35 minutes. ROMOSS exclusive fit+ two-way fast charging technology to deliver a max speed charge to any device, support Max 18W Input.</span></li><li style="box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="box-sizing: border-box; color: rgb(17, 17, 17);">Power for Days -- 20000mAh capacity battery charger charges an iPhone X for 7.3 times, and 3 output ports (USB*2 and Type-C) allow you charge 3 devices at a time.</span></li><li style="box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="box-sizing: border-box; color: rgb(17, 17, 17);">Life Gets Easier -- With 3 different input port options, you can conveniently carry just one cable to charge both the power bank and your phone.</span></li><li style="box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="box-sizing: border-box; color: rgb(17, 17, 17);">What You Get: Sense 6+ 20000mAh Portable Battery Charger, User Manual, our worry-free 12-month and friendly service.<span>&nbsp;</span></span></li></ul><br>','','2500','1500','1','["5"]','[{"attribute_id":"5","values":["10000mAh","20000mAh"]}]','[]','','','0','1','0','999','pc','700','amount','0','amount','','0','3','','0','','','','ROMOSS-Sense-6S-Li-Polymer-Power-Bank-20000mAh-Ultra-High-Capacity-Portable-Charger-with-Dual-USB-Output-Ports--3-Inputs-External-Battery-Pack-Compatible-for-iPhone-iPad--Samsung-0eKTm','0','1','0','','0','','0','','','2020-10-23 12:25:46','2022-04-27 13:40:40');
INSERT INTO products VALUES('82','Survival pocket hammer','','admin','12','9','63','','','["uploads\/products\/photos\/tsbwygQ9ovX4l9I0tmSS1U7NyBNOFoyQosA8W2ol.jpeg"]','uploads/products/thumbnail/8ke2CDimCulH4LEXxjhYNn18DOuz9tYWF8RpuhfV.jpeg','uploads/products/featured/osNXZ6xtSvuNwirdbOEIqp4SypcBlN1DsbwDHLeA.jpeg','uploads/products/flash_deal/2hGGC88LhiQesaAzQNd6BR927k2WSEL9vSpSLjpz.jpeg','youtube','','pocket hammer','<div class="html-content pdp-product-highlights" data-spm-anchor-id="a2a0e.pdp.product_detail.i1.5eef1e4aSepZ3D" style="margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;"><ul class="" style="margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;"><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Manufactured from high qulaity stainless steel. Comes with a carry pouch</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">This multi-tool is a "must tool" for home projects, outdoor recreation, survival &amp; gift ideas</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Functions include a knife, mini saw, nail file, bottle opener, hammer, combination pliers, wire stripper and a screwdriver</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Unlockable folding blade</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Blade under 3 inches</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">No need to fumble around trying to find the right tool for the job.</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">This ultimate hammer tool has 9 tools in 1. Includes: hammer, screwdriver, saw, knife, bottle opener, file, wedge and pliers.</li><li class="" style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Made from high quality stainless steel and comes with a nylon carrying pouch.</li></ul></div><div class="html-content detail-content" style="margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245); color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;"><ul style="margin: 0px; padding: 0px; list-style: none;"><li style="margin: 0px; padding: 0px;">Tools Incude: 1 Hammer, 2 pliers, 1 Claw, 1 Bottle Opener, 2 Saws, 2 Flat Head Screwdrivers, 1 Phillips Screwdriver, 4 Wrenches, 1 Wire Stripper, 1 File, 1 Knife, 1 Wire Cutter,</li><li style="margin: 0px; padding: 0px;">An entire toolbox in the palm of your hand</li><li style="margin: 0px; padding: 0px;">No need to haul out a heavy toolbox at home</li><li style="margin: 0px; padding: 0px;">Tough enough to survive the harshest conditions</li></ul></div><br>','','1200','0','0','[]','[]','[]','','','0','1','0','5549','pc','200','amount','0','amount','','0','27','','0','','','','Survival-pocket-hammer-5egli','0','1','0','','0','','0','','','2020-10-30 13:35:13','2022-05-03 11:26:34');
INSERT INTO products VALUES('84','Electric Jug 2 Litre','','admin','12','7','68','','','["uploads\/products\/photos\/I9tEd3OtaXEW9vbElQKjEJc3wyNTpNw0z0KtC14u.jpeg","uploads\/products\/photos\/3fRo7h33V7IsLwDR32anKdLqlbgfov5U6RWF4wva.jpeg","uploads\/products\/photos\/slEbC200mrAwMHqcS5Ldec54zkk0bS7mpO6m23xz.jpeg"]','uploads/products/thumbnail/p57KRAhcV0joKpBgIuPGTbfy31RmSAMb6l3YX6oy.jpeg','uploads/products/featured/P4Icip2ZgusSpxw2t2l4OWNE53wvSfmGB8PZfNvr.jpeg','uploads/products/flash_deal/lqtdBYRJs965hJnScume307Pwv7q0lIr0wW2pgFW.jpeg','youtube','','','<ul class="" style="margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; font-size: 12px;"><li style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid; font-size: 14px;"><strong>Features:</strong></li><li style="margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid; font-size: 14px;"><br></li><li class="" style="font-size: 14px; margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Features : Power indicator light that lights up as it begins to boil water and automatic shut-off after boiling ; Its water level indicator enables you to easily measure the amount of water you need</li><li class="" style="font-size: 14px; margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">kettle electric 2 litre; Automatic cut off will not function when the lid is open</li><li class="" style="font-size: 14px; margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Troubleshooting guidelines: i)Never operate the appliance empty ii) Never lift the kettle from the base when the unit is in operation.</li><li class="" style="font-size: 14px; margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Cattle Electric with Power - 1500 watts and Capacity - 2L</li><li class="" style="font-size: 14px; margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;">Max 3 differentiators Great Features - i)Automatic Cutoff ii) 360 Degree<span>&nbsp;</span></li></ul>','','1000','500','0','[]','[]','[]','','','0','1','1','-23','pc','350','amount','0','amount','flat_rate','50','69','','0','','','','Electric-Jug-2-Litre-lI5fH','0','1','0','','0','','0','','','2020-11-01 20:52:27','2022-05-02 12:29:14');
INSERT INTO products VALUES('88','Sport shoes shoes for girls','','admin','12','1','78','','','["uploads\/products\/photos\/MhcvgObXA9mnwRztmpgAAY6QhYJ0J7fTkJg6TWlP.jpeg"]','null','uploads/products/featured/Ef39ACZD1YKSg8VVcWDEajYyLi91CEytKpSLExf0.jpeg','uploads/products/flash_deal/3DXzPSvxMZJidf0lUGeUODO0AnuXymbN3LhOijk2.jpeg','youtube','','sport shoes ,shoes for girls','','','2000','0','1','["1"]','[{"attribute_id":"1","values":["39","40"]}]','[]','','','0','1','0','99999','pc','500','amount','0','amount','flat_rate','20','43','','0','','','','Sport-shoes-shoes-for-girls-oMkQY','0','1','0','','0','','0','','','2020-11-02 13:48:46','2022-04-27 11:53:39');
INSERT INTO products VALUES('114','Cup','','seller','97','7','7','18','','["uploads\/products\/photos\/BJ4ifzw0u7jQNaKLTvDv3Vb5igr4bCBTDpehnEsX.png"]','uploads/products/thumbnail/RYCiakXza9RlQVPqNPhdtleLPEukQuyTsP47uelp.png','uploads/products/featured/huxgQBHABgsP5jHMD4oHgrgVLjpeMMu6sWeS3TDX.png','uploads/products/flash_deal/1ua2Z0fYkufJSbZYAGrISnfEA2MBZLM7SnTj0FA6.png','youtube','','Magic mug ,Cup,Mug','Magic mug print, cup print, mouse pad, key ring, pillow print etc print &amp; All mobile Accessories Earphone ,charger,memory card ,card reader, pen drive, cover, glass, speaker, OTG, battery , Power bank, Data cable headphone etc Available.<br>','','350','300','0','[]','[]','[]','','','1','1','0','0','No brand','50','amount','0','amount','free','0','0','Magic mug print, cup print, mouse pad, key ring, pillow print etc print & All mobile Accessories Earphone ,charger,memory card ,card reader, pen drive, cover, glass, speaker, OTG, battery , Power bank, Data cable headphone etc Available.','0','Magic mug print, cup print, mouse pad, key ring, pillow print etc print & All mobile Accessories Earphone ,charger,memory card ,card reader, pen drive, cover, glass, speaker, OTG, battery , Power bank, Data cable headphone etc Available.','uploads/products/meta/iCF5cXyGvOQ4P94DNykve750yNA1IHlVTAP7oNF9.png','','Cup-NkJNh','0','0','0','','0','','0','','','2020-11-06 10:31:52','2021-08-20 13:02:38');
INSERT INTO products VALUES('115','shirt','','seller','105','4','29','','','[]','','','','youtube','','double pocket shirt','cotton double pocket shirt','','1150','800','1','["1"]','[{"attribute_id":"1","values":["m","l","xl"]}]','[]','','','1','0','0','0','pcs','150','amount','0','amount','free','0','0','','0','','','','shirt-tgX3u','0','0','0','','0','','0','','','2020-11-06 14:43:37','2021-08-20 13:02:37');
INSERT INTO products VALUES('117','ClouDisk 16GB memory card','','admin','12','11','4','','5','["uploads\/products\/photos\/ulBVBHkOshdDWHolzniS5bOP7t3HviyKIMTVCjzv.png"]','null','uploads/products/featured/eAVgViOi2hKfmubAiAz6gecS0m0PrxEYXtg938w3.png','uploads/products/flash_deal/Q1LcJ7cEKY0RvuCDAaDUVFDoizllfub6GSxa6pQH.png','youtube','','memory card,SD Card,16gb memory card','','','850','310','0','[]','[]','[]','','','0','1','1','0','pc','450','amount','0','amount','flat_rate','50','4','','1','','','','ClouDisk-16GB-memory-card-IZWMc','0','1','0','3-5 daysvvv','0','','0','','','2020-11-20 16:26:36','2022-04-25 09:25:39');
INSERT INTO products VALUES('118','ClouDisk 32GB Memory Card','','admin','12','11','4','','','["uploads\/products\/photos\/u01EkFkbBFNOOhu0sUR7zv5OYxLKDsp1R8LnC6vc.png"]','uploads/products/thumbnail/e2dJXSUzCojS4QMuqSKPR7jF7bhHmRgwrNQ6bSaf.png','uploads/products/featured/XpTLyVnMpTae4m3L7idRvJ4LzP3jWisRoqaozzYy.png','uploads/products/flash_deal/6ixa3h05Ww1oL0CT1bXJTliELIBv5lnn0lumPcgM.png','youtube','','32gb memory card','','','950','380','0','[]','[]','[]','','','0','1','0','0','pc','450','amount','0','amount','flat_rate','50','0','','0','','','','ClouDisk-32GB-Memory-Card-1QUFM','0','0','0','','0','','0','','','2020-11-20 16:31:38','2020-12-07 12:22:53');
INSERT INTO products VALUES('119','SanDisk 64Gb Pendrive','','admin','12','11','4','','','["uploads\/products\/photos\/FUtPWw0FWFBKYVIcN7kEYLPHpwP4jDdEvMTMhvyj.png"]','uploads/products/thumbnail/Fs8kz0hpk3f9rxveWFwHz8UrE8akw1HECjXs2jiC.png','uploads/products/featured/SvVdHRelkKMnFSs8VG3yd2Cq39SIf11aONeQK3jN.png','uploads/products/flash_deal/3MUcOs1yzhtc0ty2JgjIQBdnqgERb6DouFVNiUAM.png','youtube','','pendrive,64gb pendrive','','','1450','850','0','[]','[]','[]','','','0','1','0','-1','pc','450','amount','0','amount','flat_rate','50','3','','0','','','','SanDisk-64Gb-Pendrive-jqqPt','0','0','0','','0','','0','','','2020-11-20 16:36:35','2022-04-19 15:07:05');
INSERT INTO products VALUES('122','Magic Silicon Gloves','','admin','12','7','68','83','','["uploads\/products\/photos\/jVgOIt3BWtSYACi9xiBDiLkZX51LSfbIMg27jK0G.jpeg","uploads\/products\/photos\/Rgx6crh1czLyzNxThIeVoaOzu2A5kKaeq5Z1aYyv.jpeg"]','uploads/products/thumbnail/yLe8N4amxhiDBvYkGcfCiYlq1vcWX2TnlP88IGN1.jpeg','uploads/products/featured/xdulPI0dBU9w6w5hg3vMFahGL0AAsCaBq8Fs4gvE.jpeg','uploads/products/flash_deal/M9vWI24UNozSpYfjXJ8dHraC6lNSlmSa1TCgQ1uM.jpeg','youtube','','gloves,silicon gloves,dish washing gloves,kada wala gloves','','','600','200','0','[]','[]','[]','','','0','1','1','83','pc','250','amount','0','amount','flat_rate','0','15','','0','','','','Magic-Silicon-Gloves-NyT2E','0','1','0','','0','','0','','','2020-12-08 20:42:57','2022-04-27 11:53:39');
INSERT INTO products VALUES('126','1','','seller','77','3','76','84','','["uploads\/products\/photos\/YsdllVBKi2xBH5juNGKvwv0Y5TPxYRCAj6Kyu5mh.jpeg"]','uploads/products/thumbnail/4tXEB3xSYr2cQhHIet7fFpOmQqxBPDqp5TOxxE4m.jpeg','uploads/products/featured/mGaIVPMP075FwLivaxMOxczTreo9CrRI3fHMg9py.jpeg','uploads/products/flash_deal/VPsZ6nAcCV97MLIYJyISIILQ4KvzIwUOEqufxbbg.jpeg','youtube','','Frenchaige','','','100','0','0','[]','[]','[]','','','1','1','0','0','pic','0','amount','0','amount','free','0','0','','0','','','','Frenchaigy--Wanted-A2K79','0','1','0','','0','','0','','','2021-05-31 18:45:24','2021-08-20 13:02:33');
INSERT INTO products VALUES('127','Pearl Green Tea1','','seller','3','3','80','91','62','["uploads\/products\/photos\/KUPTeAP6v0gkPuev9o1khh1jUzYj2IrkUehOolUz.jpeg","uploads\/products\/photos\/5RqAQbqMu3jkJb4dItuWfInhgOFPCw7Qc9Aw6J3g.jpg","uploads\/products\/photos\/RxE2fFC8131HkQuKflj2lftKW7utHy4RRh0Xmufj.jpg","uploads\/products\/photos\/TG4HgZgTfUK3IbGKoJjKhILq1VagH1g8MzPQNrAq.png","uploads\/products\/photos\/GJsy2KIRtY7TMS0UCVhyVOTBh4FAe7QOPaMZj05t.png","uploads\/products\/photos\/5Cth6nFzymz5wFyGPBjFA35OVM8YNasQWY35XRxp.jpg"]','null','uploads/products/featured/IeTE3SEZK8K0H5MXzXMTBj23ErSLOGTwPUL16nuQ.jpeg','uploads/products/flash_deal/tUmhg14vW9cK1h05SAnQ5SBABRBMyYCyfO5L1Bug.jpeg','youtube','','Green Tea','','','900','500','1','["1","2"]','[{"attribute_id":"1","values":["regular","large"]},{"attribute_id":"2","values":["soft","hard"]}]','["#9966CC","#FAEBD7"]','','','1','1','1','0','pic','10','percent','0','amount','flat_rate','100','32','Pearl Green Tea','0','','','','Pearl-Green-Tea1-ACSSP','0','1','0','','0','','0','','','2021-06-01 13:04:59','2022-05-03 10:42:59');
INSERT INTO products VALUES('136','test pramod','','admin','12','1','30','','2','["uploads\/products\/photos\/uyLl7u5cQMPJNPOeWdI8LUWxvnoNtWh7NYpojhEs.png"]','uploads/products/thumbnail/A6GG31QuNAKDWLWrulp1Bd4k2OTvc2nSRCXwIo7k.png','uploads/products/featured/LhXABzV09YDGfyLq0kQKXjPnZpgM9uuxiqQI0orF.png','uploads/products/flash_deal/2tSSyce4LsfMHVjmYddQ3FEQ31cUkiUFkZ4Bkzj3.png','youtube','','test','test','','299.96','200','0','[]','[]','[]','','','0','1','0','187','kg','0','amount','11.98','amount','flat_rate','100','8','test one','0','test one','uploads/products/meta/NvSy9QjOKkCojtX1ecj9RttO7EzhryLKRqySCr9d.png','','test-pramod-j3LJY','0','1','0','','0','','0','','','2021-08-20 17:30:05','2022-04-25 18:11:27');
INSERT INTO products VALUES('137','tes new','','admin','12','3','33','11','3','["uploads\/products\/photos\/RCyPv4omppacQLnTREBtPqMbgIL5WtO7CrKKSyCa.png"]','null','uploads/products/featured/KHSLBnvATaxT3czIleZlrj0TPxq2OUYtdeieWdFR.png','uploads/products/flash_deal/DCUX3qWyjtLyCKDx4WPJjf6HCG5F5jwSWY5VNpqT.png','youtube','','','teafaf','','22','20','0','[]','[]','[]','','','0','1','0','-9','pc','20','percent','13','percent','','0','20','daff','0','afadfa','','','tes-new-mnUrE','0','1','0','','0','','0','','','2021-08-20 20:40:22','2022-04-24 21:34:12');
INSERT INTO products VALUES('140','InHouse Product A','','admin','12','17','83','93','1','["uploads\/products\/photos\/0KjtQEcEJdu9LXbQi1XPjKBNs3PoCxl98hMR728s.jpg"]','uploads/products/thumbnail/VTHcXnBef40zRa1v14X2FoEHhKCsh375qUwOsSCB.jpg','','','youtube','','','','','100','60','1','["1"]','[{"attribute_id":"1","values":["M"]}]','["#F0F8FF","#006400"]','','','0','1','1','-1','pc','5','percent','0','percent','flat_rate','0','19','InHouse Product','0','','','','InHouse-Product-A-3Bufh','0','0','0','','0','','0','','','2021-12-13 06:32:15','2022-05-02 10:56:32');
INSERT INTO products VALUES('142','Seller Product','','seller','217','17','83','93','1','[]','','','','youtube','','acer,laptop,seller product','','','20','0','1','["1"]','[{"attribute_id":"1","values":["10"]}]','[]','','','0','1','0','20','pc','0','amount','0','amount','free','0','10','','0','','','','Seller-Product-HWphV','0','1','0','','0','','0','','','2021-12-13 09:18:42','2022-04-17 08:52:55');
INSERT INTO products VALUES('143','New Seller Product','','seller','217','17','83','93','1','["uploads\/products\/photos\/h5zGAJ6uR0w1nFAbQltiFLPqD44aZ09Ps0L2w7sn.jpg"]','uploads/products/thumbnail/gZaKDi6zZISivpQwkaLwgU8RDLuowLC8Mtjsy6jn.jpg','','','youtube','','acer,laptop,new seller product','','','50','35','1','["1"]','[{"attribute_id":"1","values":["15"]}]','[]','','','0','1','0','0','pc','0','amount','0','amount','free','0','9','','0','','','','New-Seller-Product-FobKL','0','1','0','','0','','0','','','2021-12-13 09:37:03','2021-12-15 07:07:32');
INSERT INTO products VALUES('144','Seller Product Again','','seller','217','17','83','93','','','','','','youtube','','laptop,seller product again','','','0','0','0','[]','[]','[]','','','0','0','0','0','pc','0','amount','0','amount','free','0','0','','0','','','','Seller-Product-Again-NBVWn','0','1','0','','0','','0','','','2021-12-13 10:29:28','2021-12-13 10:29:28');
INSERT INTO products VALUES('147','Virjeans Stretchy Ripped Design Biker Denim / Jeans Pant (Vjc 711) Washed Blue','','admin','12','4','29','94','','["uploads\/products\/photos\/dYEszA82YrJlb17a3HacJzWbW4Lo9wmzQyYQQoFb.jpg","uploads\/products\/photos\/l4WcaRYsWXeRtigNB9RZ3TyW3hA9MLduGGekgrjw.jpg"]','uploads/products/thumbnail/tHPzRVrCIsFwDhF6zmgteWNGVzbIpxUaQHpO8WLb.jpg','uploads/products/featured/wIdQGFLJXZvW7NBR5FjJiIQdOW1FeQOz8Vqx6zVu.jpg','uploads/products/flash_deal/kY8mS22kKf0th3roVWOmv2QQ86R7KxjGqwgbC9U9.jpg','youtube','','mens wear,mens jeans,mens pant','<div class="html-content pdp-product-highlights" style="box-sizing: border-box; color: rgb(49, 49, 49); font-family: Verdana, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><ul class="" style="box-sizing: border-box; margin: 10px 0px 0px; padding: 0px;"><li class="" style="box-sizing: border-box;">100% Genuine Product of Virjeans</li><li class="" style="box-sizing: border-box;">Material: Denim/ Jeans</li><li class="" style="box-sizing: border-box;">Stretchable Slim Fit Jeans</li><li class="" style="box-sizing: border-box;">Type: Casual / Classic</li><li class="" style="box-sizing: border-box;">Length: Full Length,</li><li class="" style="box-sizing: border-box;">For: Men</li><li class="" style="box-sizing: border-box;">Wash Care: Hand/Machine Wash, Do not bleach, Dry in shade</li></ul></div><div class="html-content detail-content" style="box-sizing: border-box; color: rgb(49, 49, 49); font-family: Verdana, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 1px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><p style="box-sizing: border-box; margin: 0px 0px 15px; color: rgb(119, 119, 119);"><strong style="box-sizing: border-box; font-weight: 700;">Size Guide (in inches):</strong></p><p style="box-sizing: border-box; margin: 0px 0px 15px; color: rgb(119, 119, 119);"><br style="box-sizing: border-box;"></p><div class="table-wrapper" style="box-sizing: border-box; max-width: 100%; overflow: auto;"><table border="1" cellpadding="0" cellspacing="0" style="box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; background-color: rgb(255, 255, 255); width: 812.5px; margin-bottom: 1em;"><colgroup style="box-sizing: border-box;"><col width="60" style="box-sizing: border-box;"><col width="60" style="box-sizing: border-box;"><col width="60" style="box-sizing: border-box;"></colgroup><tbody style="box-sizing: border-box;"><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">Size</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">Waist</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">Length</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">Bottom</td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">29</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">29''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">40''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">12''</td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">30</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">30''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">40''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">12''</td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">31</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">31''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">41''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">13''</td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">32</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">32''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">41''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">13''</td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">33</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">33''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">42''</td><td style="box-sizing: border-box; padding: 15px; text-align: center; border: 1px solid rgb(228, 228, 228);">14''</td></tr></tbody></table></div></div>','','2500','0','1','["1"]','[{"attribute_id":"1","values":["l","xl","xxl"]}]','["#000000","#00008B"]','','','0','0','0','0','piece','1099.99','amount','0','amount','free','0','3','Virjeans Stretchy Ripped Design Biker Denim / Jeans Pant (Vjc 711) Washed Blue','0','100% Genuine Product of VirjeansMaterial: Denim/ JeansStretchable Slim Fit JeansType: Casual / ClassicLength: Full Length,For: MenWash Care: Hand/Machine Wash, Do not bleach, Dry in shade','uploads/products/meta/6EOATKY5tgTzXN2EEoR91cCLlJCd3WpJlqaBC4g0.jpg','','Virjeans-Stretchy-Ripped-Design-Biker-Denim--Jeans-Pant-Vjc-711-Washed-Blue-gjps3','0','1','0','','0','','0','','','2022-01-04 13:02:59','2022-02-07 12:11:52');
INSERT INTO products VALUES('149','Lorem 3','','admin','12','8','21','','29','["uploads\/products\/photos\/eEMhSrBSfVGiIH1yTUccB4ntZArVgZ1ZwlyBDVgd.jpg"]','uploads/products/thumbnail/D6im5Y4upNtI7MZb8cSfR9ULB2Di2GLvPa4UK1tm.jpg','','','dailymotion','Quam mollitia amet','Sed qui esse placeat','Deleniti corporis ul.sadas','','303','554','1','["9","11"]','[{"attribute_id":"9","values":["full"]},{"attribute_id":"11","values":["asd"]}]','[]','','','0','1','0','53','piece','72','percent','30','percent','flat_rate','9.98','47','Expedita odio atque','0','Eum laborum quod dui','','','Rana-Clark-2TWcf','0','1','0','','0','','0','','','2022-01-04 15:10:43','2022-04-25 15:16:51');
INSERT INTO products VALUES('151','demo','','admin','12','1','30','','','["uploads\/products\/photos\/4FvrbF6zSmZdbZQhqObmYy2r9cu72NwOvYS7ByLf.jpg"]','uploads/products/thumbnail/KLxyZtTp3KkKAp9DPKgMloiv2kvWQRuNUkLJFE06.jpg','uploads/products/featured/2qp1jC0ei5aRlTfrg4bXR4KDMdXYJ9ryBp2gRWrG.jpg','','youtube','','sada,sadas','sadasdasda','','400','0','0','[]','[]','[]','','','0','1','1','13','piece','50','amount','0','amount','flat_rate','29.99','6','sadas','0','saddasdasdsaads','uploads/products/meta/t7auMiWmt0b2kZmasJ5fpC5ECHZGTvpJtPwcj17d.jpg','','demo-4nqAP','0','1','0','','0','','0','','','2022-01-04 15:19:01','2022-05-03 10:40:32');
INSERT INTO products VALUES('152','Lorem 2','','admin','12','1','30','','','["uploads\/products\/photos\/RnklskehlE4qvSDELEB0NEmx3FSmHQukjw7GqDeS.jpg","uploads\/products\/photos\/XFsS2M2N0YMsLeOVu3ElI5w9D4Xq0K6xJ1J0TE9v.jpg"]','null','uploads/products/featured/i9cxt1z8x2vWoKVAs7nOXydTQjMZS5df2H4fJ612.png','uploads/products/flash_deal/o2k6cKT6g31UgzIRn4BxupQfst7tZcapC9idjHQ0.png','youtube','','as,adsasd','sadasdas','','1000','0','1','[]','[]','["#F5F5DC","#000000","#FFEBCD"]','[{"name":"Black","code":"#000000","image":"uploads\/products\/photos\/0YIIfAE0ARw402rqiE26fCbpcRA8U0BSvIGxni4c.webp"},{"name":"Beige","code":"#F5F5DC","image":"uploads\/products\/photos\/1k7VVruJe4bJVcIMPjkc7e8y4d88Q8zbg5L9LD5b.jpg"},{"name":"BlanchedAlmond","code":"#FFEBCD","image":"uploads\/products\/photos\/eSk67OlUzNk2q5iZvpNTmDEtBWO8pxbzldAgy6xO.jpg"}]','','0','1','0','13','piece','0','amount','0','amount','','49.98','52','','0','','','','Lorem-2-ATleO','0','1','0','','0','','0','','','2022-01-04 15:40:59','2022-12-16 00:24:14');
INSERT INTO products VALUES('155','Lorem 1','','seller','3','1','30','85','1','["uploads\/products\/photos\/ShcgoGVuCjRwfUlfzccPR2H2rXbQEoVqtMOE6AbJ.jpg"]','null','uploads/products/featured/rbRFZtMYcMkn0M6r0iMWgMtMZ1UXJWFSZAkBbYHf.jpg','uploads/products/flash_deal/dNKNkeeYjA3zqQ2jXMdVpJ3fHSL4EEKBnzTg9wKV.jpg','youtube','https://www.youtube.com/watch?v=UVvXK1rq3ZU','test,watch,tv,jewellery','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wCEAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSgBBwcHCggKEwoKEygaFhooKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKP/CABEIAYECsAMBIgACEQEDEQH/xAA0AAABBQEBAQAAAAAAAAAAAAAAAQIDBAUGBwgBAQADAQEBAAAAAAAAAAAAAAABAgMEBQb/2gAMAwEAAhADEAAAAPqkAAAAAAAA4vtOMPmMetqsHgwkCMkQajyESSNGNTKpbU0+KystffNX5Qet9d3fke5nb67u/GGjNPsbU+M/Y9c/dX4O7vzyK1wlS5Vln17VchZI20NVRCDkSgoIoADgFEsVQQUQiOQQUSIolopUxHoIKlp7azWs5aAAAAAAAAAAAAAAAAAcb2XGnzSPLVaPBg8GDlGI9ER1rfN5a0MLsrvl+n5aek5c2xd/J6/K/MS93mTPL0e5lmvmr+0oWz7r235r098Pqix4l6/3+foVrNe+efXtV5QNkZaGjgRQERwIoAoqQUER7RBQaKCCggqCKCWI4qGPS09rYr2MtAAAAAAAAAAAAAAAAAOO7Hjj5sc4vVquUYPEMSVERpJmZ653Tp13m+nTs6F+NcHN7hYnzKh63PnbyfT9JdavmS+j0ji6vXVKTydrWy1afV4edOf0tP5N6t7HkVa9iDTOFr2WhBUBRwwUEFEjkUAURFBBQaKCCgiKAiiWDgajkT2c8E+V1ASAAAAAAAAAAAAAAAnIdfyJ84q5dcmD1SweIYPbVRdm9R53p72hBo5dM99LdoS0XLUisTy6ZwpbJpnwakFbZNTYq0viZ+9mV05jC7TMynlPevBu215vW4JYvU8yNkjLQ0c0cIoAAAIqOABIAIoo0UEFBooCKiUUBqKJ7GxXsZaAAAAAAAAAAAAAAAAAch1/ITHzsqrpm1VURHA2OaCk8v6PxHe+V6+lq0Neb3J4bFosXat3TOeRsl81FSashlhretVuVaXp0NKnW2LR1qNJ4bQr0sJ+h3RTe54jGPbaEAqFFsRFRAAkFAUAASAAKCCoIKo1HIlBQa1RPYWK9jLQAAAAAAAAAAAAAAAADkeu5KY+eAdpmiqCCgkM9Sss63nem8r19nSz9C827NW3aLNunNfO6+NbZubFXi9qGhQptsQ40lZ0KNqrFaFWzVrbE5nrsHCPcZmye34sLXsQ0QHq11iIohBUSKjgASoghVRUgAIoIKA1zQRVTGjkT19ivYy0AAAAAAAAAAAAAAAAA5LreSmPnsF1zRVVDRwNo38jPTb3cC/5nq62nR0b3t2MqTWvQWsPWY3nxTzSOq/Nm8xn04226lGzW9O4+lkK1yGM8Klp5+U+0ox3seKyN8aGiES9zHzAgWCKgOa4HK6ssJGDHCgC2NRyAoCI5BBRLEUT1s8E+V1ASAAAAAAAAAAAAAAAcl1vJzHz4ouuaKKhBSTcDoOS59us28LqOD0Zuc3uI23oeg18bv8AJ7zV5zoufo37efoxXEp6mXOmfwnSeS9XF1HofAdZyej0ZbfjelT1czOMXF0sXnv7LfzNH1/GbG5lqoo6A5FmAC0IAAkVZtT52hDUzOlwFqaqkwCpYIoIqoIKgrXIlgqJ6yxXsZaAAAAAAAAAAAAAAAAAcp1fJzHz8ou2KKqpQUQnPdG/m6cb0fmOv4fRfk9Cu9fJeC+k7HVz8p25FlbSvY97LWalZmvThPMfoSLSnm/a678doG268M/J2cTHTA3s6/y9cfd850Hb5yIid3lz2KekiGtq5smAloAUa17qzHoVrsN3E3MZagKkwgFiCgACCgNewQBbq54J8tAAAAAAAAAAAAAAAAAOU6vlJjwAU2yFHIaqgXKr89N7TrTeX7WroZ2jpWZxY0zh5/puTz03pacFN7O7yfT3xttmh0wc1jKXbXlrxali6mBS9Xtea6zPVt1Du8iNGs6OO5sYu2GXqZcmIMQ9Kzq3u2K2hExyWGzGrlaWfLMRW3hUUEVAFQEVAVr2iIot1U8E+WgAAAAAAAAAAAAAAAAHKdXysx4Cqm2Iqgiqojkca+nzW/w+npXci1x+tv3MrRvnPyPX5GmHNs6mWnRk9PS17889aemq2GOHHqnhYy+VHntirm2tSpf257dW1S7/ACIoVrxGhvct0MrmXpZcxHDIlLRtWGL6Wrg70xcV7hK0kVq5bHMvVRBKq1QAARRWqgIqLdXPBPloAAAAAAAAAAAAAAAAByvVcrMeCKLtig4QKKkVHC62Tdw6tYY/zPptzXwdma2c29i9HnaT/O8nP0PWNTgeuvw7NGzUpNCB9XDvsRx17Y17+bpX4tu5RvdXnrSnpb8sdWStWZeg5bXV6XOmhuYx7KzFXnr1u/puT6o1ZGyWitS0se0VGCXqogKqAogKIoCIOarVutngny0AAAAAAAAAAAAAAAAA5XquWmPBhTbEUVCKqpQVRJGOTs2snW8r6W5p5l7HptcX1ubvyfJ9Puul37eB934rXrn7Y+jcx4c7K2MTn9FYGwWpsblSb0PmrS1lvk+lLUiWQLGNs07MR0dhrrxHHJER1rFet4ur5XqE7ksctqx4HQ8/aKIxb0crFS4QHDQVWqKiKlWq1PXzwT5aAAAAAAAAAAAAAAAAAct1PLzHg7g2wFFkCqlBywaOEGnmvw6un0ec0/O97YrOn05vLK/oHOx7+J0sPVxntWIUeJSy7lDLrzpcZ7HuZc276HhTEa2gqT1IRo1R+1k9JakyK2xkb44R1rFatzpeZ6eLb00Ul6pz3Q89MZSwSWzlGrY5WiVVoOGqKMcOY5i3ZT17GWgAAAAAAAAAAAAAAAAJzHT8wjwpRejAVQFV0SjpN3LbGm6M5OzmqnU1Mt+V09Cnjtc0cOxOnUWOY19W1DnQSv08/RwvHkzc/W2H2OrdnHO0dG9tzZTtlL44VTos2+OQrk159Heo39KDFYNjdGMrT163Oq5bq4nbmilvDec6PnEYEtWS+dt0brQ8QWFaIcIJHMUexWLdpYr2MtAAAAAAAAAAAAAAAAAOY6fmZjwpwu2Ao4V5pU0v7cOj5/pV4LsNJpQXYWtOreWs1q+pdOZb1jJ05KbpKuW9Ktv6s5cztacmuNCzYlnJlh0l840sJaKcGhHDnaHSZamq9Dq42MWNCMGRZteaCLP6/kuzNORj7Qznei5w5mSB9s7skMl4eNBysUcNBVYqXNGJ7ievYy1UAAAAAAAAAAAAAAAAOZ6bmZjw1RdsFcjyTpMjpeH0bdhsWO0rlmVz4tGObZ77ikVsnmHvH2rG2QrLFckWUa+IfLE5FpYltWRFbY5j2oq0dOlW1C5mWNeaxER64K1GxZIXxJtdrx3al1zXWiLnOi5s5lWpal6WvPer0RB4xR7UQcNVKtErburFexS6gJAAAAAAAAAAAAAAAOZ6bmUeHqq9GBI2ettroMvY831rFDUzarco+9BjopPcySDnkloFIkPbHBW9wyG0ttriyGsY6xN65g26W23VbG+L0RtqsrzQ1nPztbFqvlKz18L2taEZHFtnsuR7CYsgWivzu9gnMxyQzW7ZqWNKSDVBWgqIiXjAewbW3oFmtZpoAAAAAAAAAAAAAAAABzPTc0jxBzX9HO65T2+bs2NbO0eTtu5Ojh1ak2Y+1dCOBZiVayrWZs+tDSzKUtNo4bs9da16SzbNHyTWyqNvNi2ZDqV4M0M2FXfXAszXTihmmtPK3M+t8TQyrXRx6DGt1xRiRVv13U4G/ek6oWilh6+NE85Ws05res0rdqSDVsVWoKiNS8YVlRqWn0WzVtZaAAAAAAAAAAAAAAAAAcz0vNzHiSslvSx0FPS831bd6nPMS83bbnrTsWETX1KD5skGljzN+jvYsUs3c+3E3LEdnXONkdaJ0XZ9aLdMlV85OjkaQMsMhVZaihA2dqWzQ1kuydenNHFWTq89Gxyxb0PWzdHXOUakxQyNTKiedo381W9bz7d6TjFscNSpUaiXo1EqjWnpdqrapooCQAAAAAAAAAAAAAAE5rpeZPFLNefh9KSxmV8t+tfyvTWpovjZelPQdjxrqZtiovuctzvOZ7ep7Xzz9AX5o3QaU0W3j3bSUuOrZ9XcZ/FJS3rNnl9i/FtPzbN8rTIhLolbJjWxwlrvhWgfFTraNVoa8lnTw+l15+7u07e2ckT60xVy9DMicLK08eIvXM27pSykQiVI0WelarFtNuHVjfpDm4Yv7xczNNgAAAAAAAAAAAAAAAACc10vN0v4qJNwepCsssWZs5Fu9NqFa9mjkU6kaajuJx6T21R/n/N6OP7Z82ewacvcamdg7Y9Hq8zrTXxHg+uu16MTZ9QtOTm+x5rNo9NvczqXrquoWLTOyKOUrYGxNmGswmrQ040sZsOZE7Hf+SdP0c3slnyW9rl6ZQ4ds16nHwMnPo1seCOu1pc6WbSV5ntMuLbbGnP1+ojrfmF6KtGmU7TRH0Hr5Wr2/LqAqAAAAAAAAAAAAAAAnN9JzdLeLT1n+f6zpKjYvo5OhiWjbdzGO06Sl5pl1nodXzbPtHRY9zuK2xu+foM79fnJo7+i6LzTWrbhegz5sr+kpwtq+XXZsd6K5+/C+NJ1jJtHDZavTbfE0pLDJpHKyx0cteG3FbOmy3Xrtd6TleltjvWKVjfznZenQTz9e7BHTAk7bVrJOyLo5qzCsVqEjeLIj0R7zqZmnv4oAgAAAAAAAAAAAAAABOY6fhqaeNnm7fP97vs7k7FdeioV1z2jraM1Nudq9tCtzVjXZXStNbcvFdS4pBHcZE1pJbU3yjWirao649DLa2Wb1Qti57JL1kcj7URVbMRQzVpiaeCTp40hkimI4Jq9dJOl5ffU663maPR5rqF+ojnK12nXqjbJFeEERKtESo0gjHpMsFSJ9608vU38UAQAAAAAAAAAAAAAAAcIFdflADi+kWwGWty+GdpXBS7kCqOMI2uNC1ZrAVqNCJdMFruhCqSUCeYFXoE0knC9ZAL1VoTSGEJiZwdPKyMIiOuEaN2wV6jSDfzH1wmmFSCvTFEF5agJRASgEEaEyIEPedQN/GAEAAAAAAB//8QAQRAAAQMCAwQEDAQGAgIDAAAAAQACAwQREiExBRBBUQYTQGEgIjAyMzVxcoKRsbIUI0KBFTQ2UnOhYtEk8ENT4f/aAAgBAQABPwHyfTL+m6z4PvG63hW8hRODTcqOvp4bY5W4uQN0zbtE0+POAE3pLQaMMjzzDf8AtM2/Sv8AGxtYG6lyj25Svt1cgeOYX8VhGRxjvw5Jm0YXZg3HMKKeOTzXAoeAU9OR7Kd4R1RQCOq4IaKn/l4/dH07P0x/pyr+D7xut4VvBe8M1KlqwDZounVTzq4NHyVTWE5CUfNPkLj4r3OumSVDc4sgPaVHtCodk9wtzRrpGt84HmEyqAz6zAb6G5HzF0KyQsuG42jjHIT/AK1VDtr8O+xdKL8nX+YWxdvQS/ll+I64rWsqKp6xutxzQO8p6cj2U7wjuCOu4Kn9BH7o+nZ+mH9O1fwfeN1t1lbfbwJpBG3vU0xcSdVN17vNyTqKTMudf2KOnY0/mE6qnpw4nqwMuKFE4tBGG3c1SUTmnxjl3i6bEyPIkd3ip9M1+bWBp5tyv+yljEWc8DrDSSI2IUrcbQbioj4Eizh/2o7jzJCOFicwuju2pKRrIKwGw0dpcKi2vTT2DZbnkckyRrtDvenI9lO+yO4I7goPQR+6Oz9MP6dq/g+8eRtudkLqoJlfgZmoaCwudUKIga/NSUIvmLqWhdwYc+SggfTzZ/l3HE3uqWQty46hNLJ22IvbUKoosNizNn0UMRAIwgjiEYG62NuSkoQfzIx3FSULjna/IjVUjiWmN4vlp/0oyBlfXzStkbZmprR1B6yPQO4hUlRHPGHRuBG56cj2k7zvg9BH7o7P0v8A6dq/g+8eSOQupZHzvws0uqKha1uYz4lMp2jKy/DtPCydSNc3Mey6fRC/LuKl2YH6DC5HZszfPu7lZR07rjI35pkEtrE5I0rwfFFrcU2ndfMErq2jUWHG6IbEbOaTHwI1CqacWEzCHAHzgjSskbiFhcajQoPdDKGk3HetmVppJhhJAdqFSzieIOCcnIo9n4o7zvg9BH7o7P0u/p6r+H7h4NlbdbdUOMp6tuTR5xWzqQCxso2AJrE1iEa6gO4IUgCFMvwgP6R8l+FHJOpu5PphyUlORmL/ALo04OViPZon0VhcZd4X5lA+0hLqZx5eaqyE6tFxqmnG3xuGh4ro3tAsd1EpvyKvdt05FHtB03ndxUHoI/dHZ+lv9PVfw/cPBt4Ez+AVNHidhGgOagjDQLJjVGxMamszTWJsaEawLAixOjBTmBPiHJOYBwU0Yc3C4XCEWD8s5xnze5VMJY8gKjqDFPgPtb3LZFYKmnaeNswnI9kPgcdwXFHTdbNQegj90dn6Wf0/VfD9w8jM/wD8i2uFbOiwsGLjqmaKJqjYgE0JgQCAVlZEIhOCcE8KQJwvkqhmJVcdnt4PBWwKksqbX9oRN0UezBFcPAC4qD0Efujs/Sz1BVfD9w8g82YSFGMdWW8jmqZtmqMXUYTUE1MQCt4DgnIp4UjbqQKRuSrjaZvtVFLhq2Pb+6iN4mnu3Hs53Bcd5UHoI/dHZ+lnqCq+H7h5CW+HLXgtmR3mkd36qFRBRBNQTAmob7olEpxTk5PUgzUgyW0oziaVRE/if3VN/Ls9iPaDuCO8qD0Efujs/Sv1BVfD9w8hLkwlbOaGwj2qAJgTE0JoKaghuurookBE3RTgn6pycFXM8UhQDBU3VL/Ls9iPagjvKg9BH7o7P0r9Q1Xw/cPIVJtGfYqNmCFoVPwTE1wCbIE14OSaU0oK6cVdSyWTpCV1xGqZUZ5rECE9OTjZTm4Ke21QxwHGxVOLU7PYij2nijvKg9BH7o7P0r9Q1Xw/cPIVI/LJ4KI3jYVAbBGe77BRtc7u9qwEcU0kKJyvbNNeidzinFCyIBUsQOiD3ROsb4UXXCcnBS69yDAXtH/IKP0bfYjuPaOKO8qD0Efujs/Sv1DVfD9w8htB9mtA4lUucDPYnuNg1upVJEGC51Tpg3RdfYapst1HJYqN4ITQrKV2ELESnuN1+I4E5oVY0vdNmvzspGh4QBbkrJwUwTHWmCheHxNI5Ioo+TsrK3k+KO7iioPQR+6Oz9KvUNV8P3DyG0nAWutnZ0jPYo23eDyTibWCrK6OnJbiwuGpPDvVPtKokn/KiNTF/cwW+uqpHB/ntMTuTh/0mhzXWcoTZyYdFZVVy4BP1sBmngvNox1jhqToFWmr63q46mhLh+m+d1DtGennwbShMHAOAJb81A4PZqCm6ZIhEKTJTH6Jx/OaOBWzXYqNndkij5O6BTMyup8VPFj5M7uKKg9BH7o7P0p9RVPw/cPIbfdgbEf+S2Sbxln9pUbc1PdrMhmm7PfX1X/kF/UNPmk+cVtOrh2NSMEMQMz/ABYmAf8AuSbNtZsTKiedobLfAwsFj3BbOq2yx+OLAHC9vFh5+xObhsoVwT2XlCr3WmbBHk5wuTyC6RT/AIangpY3mMS3u4A3tyy9q2pPsannpqeJzJ2uBxSBxGBwJyOX0XRyo/iNBNBP+Z1Vixx4tN7fRbMpHU3iYrsOYHLuTWdywJzVNkqp+ELZ/WVFUzCwljTmeCorMbhHy8G3kChdU+UgX6FMPG8twUHoI/dHZ+lPqKp+H7h5DbFMamA4RdwzC6PSGUyn2X9qiYnR3avGjNiABfVdM6V9QKaeMvwRktdg1F7Z/wClTUe2doyMhdNUGmhcJGtLyWj2cFsTZs0LpnVZAbJazL3OV9fmiMT7qMq6IzuqmJsliR4w0cNQttbOO0IWC4EkZu0nL9lV9EpJKqKVvUAtsXXcc87nJbF2QaFkgxue+Q+M4i1uQAUMIYg1OCep0+L8RKIh+6bJDQUt7exo4rZ9ZNPPeRnVi+QRO8JrbpzPINCiHjBDzVNqj5E7guO6D0Mfujs/Sn1FU/D9w8g0O8bAASqCBsU0j2CwfYlvIqFarqg7UL8KwG9j801hGTchzQZhCc+yidfNYrIOugLox8OC/Dg8whDbisAVrJykU5yUEvVlxaLyHIBfhiYy+bN/0UEQbgy33QKh0Txkna+FhumtsmahN8xTjxkfBPgHed0HoY/dHZ+lPqKp+H7h5Cm9KBzWDCbqJMCaFZBqeMlM68uEKAeKn3AUb7SWTBdWVtxTinqQ5Kc2BWwpDNjdK0ZnxfYpm3iyTRmijuiF1E1SJ2vgYgm2KDVhsgo/MVRqj4J8A7zug9DH7o7P0o9RVPw/cPINyIKNnRB44qIqMppTSgn+YnzQwfmTvbGCdXGwUcwAyORVVXQU0LpaqVkUY/U42Uc8NZTtnpnhzDmHBUb8cQO4q6urp6lVWfEfbktlUuBgKeLQpjePJORV1Cc1GVIn67nGyuSgmJgVkWqE3YqnVHwT4B3ndD6Jnujs/Sj1HU/D9w328Kjk8UxHjoojkg9McmFNTxdqqKVlQx0UoFiCM1s/Z/4KLq48m3vYaD2LaGx4K+34gYrebfOyggZTQtihGQFgAqJhZEAUU5Eq6Ls04qYqofht3mwCow6wBFlIcTwwcFazbJyJV1Cc1EU9P1RNlbdeyiN0xAKygNiWqpR8od0PoY/dHZ+k/qOp+H7h5FpsbphurqN6jddMTjkpgCmtRbkoRZRop5RKxK+aJVQc1TMD523GilDvFwG3MqFgBy+acU4pxRKid4yhKepNdxRRUBUSCsj4rgVUI+T4o7ofQx+6Oz9KPUdT8P3DyIVO64HdubfEoHIInJSHMIPAQfdB9nJj0TcJ5TnLEicliyUxzWzAHMLu9SEBqiGFgTk4pxRKa7NQPROSfmdxRRURs9Qpu6QZKQ3YCj5Pijpuh9DH7o7P0n9R1Pw/cPJQG2XFapuqiKjOSeclM7NVu2BA44SLA2z5qs6TClexs7msDh+lbP2jFWsBY4HvHFROsgck/NSZK9kXJzlhMj8IVNT4PEicWjjxTIbG73FyunFPKcUd1M/NF+W8oopps8Kn0TdzhknmwIR8kFxR03Q+iZ7o7P0n9R1Pw/cPJNNiFGboJhURyUjsltWtbBG7ESDbLJbXr3Vs+CK//absiqc0EtWzzX7Jc18Qc5gObQtg9JKWvtG53V1H9j8vkopQ4JynRcbonmiclRR3aXnimWaLBXV04pxTiiVdQvs5R557ynIoaql80Ju52iqMn+GNx3BHfB6GP3R2fpP6kqfh+4eTgfY2KaU0JidnkqxoETg4CxC2lRso6xtW0XaTZ2X+1TyMmjxNIKu1jMTlsGkb/E21L4wDbIEcEwcQhopdE/zk53BOJNgNSVGMDA0cArq6unFOKJRRCp47vTRYbyinIKj80Ju4qryf4J3DwBvCg9DH7o7P0n9SVPw/cPJhQvUbk2ysqpmOI2VTCGPLJG3Ye5R7PhhHW08zGHk2+X+rI0bBI2omm6wm5sXX/wBLZwJf1hFuAChFmgJ45KQqUXT8lRDE8vOgyCaVdXV0SnFHcFSsyvuO4opyaqLzAm7iq7UK6HgjcdwR3wehj90dn6TepKn4fuHkLKytuabFRSjmmSBNfcJpuFWUgkB+i/APvkf9qLZ77+Nb5qlp8GZzKGSe8EKR2ae42W0KlsERc85D/a2btAvjaHREexRytdxt7UDvKdvYLuCjFm7juKKKCovMCbuKr1dDysHoY/dHZ+k3qSp+H7h5ABCFxQp+aMCdEQi17HXaopb6fJMntqopkx4crDkrNtojYJ8ixklHvVZOyGNz5HANCjhl2jN1sgIiHmgqGAMaA0JkaZERxQjdzWBycCnb6Vt3X8AooooaKi9GE3cVtDRXTT5WD0Efujs/SX1LUfD9w8NjC42Chp7e1CNGNFqexdUOSfBZ+WSsRk8fusDgLszHJRTW1TJRbVdf3p0venSl7sLMyo48DfGOar6yOAZ5uPmtbmSo6KarkE1aLAZtiGgUcNhYCwTIc0yKybGsCwBOYpYeSIsUFSss3cd5RRQVH5gTdxVerppQ8hx8CD0Efujs/SX1JU/D9w8EIBUsNhnqmsyVk4IhOaiMlKLhRWkjzCMT4zeM3HIolj/PBY9FsgGWY7leTkfkmse/zjYLrYaVuoB79SjJU1OUDOrb/e8fQKl2cyE4zd8p1e7UpsSEabGmtQCsrIhOap4kxt3gJgs3cUUdxRQVIPECbuKrtzSh4YXFHdfNQegj90dn6Sepaj4fuHghUsdzcqNqtYbiEQnBEFYExljkgy66gOGYuvwMZ0BHsKNCLZPcjs/FrJIR7bKCghhN2Ri/M6oR2QYsKwoBBqtvITgntRGCQG2SBy3FHeUU3UKmHihN3OVZqjqmlDwwuO/iqf8Al4/dH07P0l9S1Hw/cPBYLusqdlgmDJHzUM1hTgi1YU1qazuTQmhWVlZWsgN4Q8IhOCkbdQuscB/ZXRRO87os3t9qgGSG56qk/wA8oJu8bjvOqOm7iqf+Xi90fTs/ST1LUfD9w8AKmbndRBNCe6zgOaZuLVgWBYU0IIHwSVZDc02WLggb+AUU8Ka4OIcE19xdXRO87qXOUKIZIbn6KpUnnlBNPkDuBRVN/Lxe6Pp2fpJ6lqPh+4eDTM0UYQCdnMPYm+CByWFAIDddXV/BvZPk/Na3mE16B3lFOUgTHYSW/JAq+4lHdQi8qj0Q3SnJVCm89ApnkDuCKpv5eL3B9Oz9JPU1R8P3DeFGLuCgFgo0Bkrfnn2Ibir7gbIHddEq9k+VrfOcAjWMHmgu/ZfiXnRoHtN0J5T/AG/JdbL3fJdZLz/0uvkGoBT5QXtdYggFQuu1MKvuJRKKeFUZZjgmOurq6uiVfNbNFySmb5jkp1P5yCZ4B3BcUdwKKpv5aL3B9Oz9I/U1R8P3DwKcXcotFEFwRP5zkHK+4jddByxKSdsfnHPlxTqw/pZ+5TpZHnzyPZkgy+eqZGmMQYsCwrAixWIN25Jk5Hnj9wmSBwuCsauijdPupTdRutlyTSrq6JV81s0fl3Td8pU6qNUCmFBDcVw3ncEVS/y0XuD6dn6R+pqj4fuHgUzLKMWUaxKR9qg+xB669g1e35oTxn/5G/NddHxe39jdNlY4+K4HuV0CpZ7eIzN/E8kACb69/NYUGdyaxBqaFwWoVkQnBWTmrByJB7kHyN/Vf2ps5HnD5JtQ093tWIHQogFTRghPaWSZ6FRuV1dEq6oBaJvsTd3BSlTKpQTEENx3X3HTcE5Uv8tF7g+nZ+kfqao+H7hvhZc3UQsmJhTip5Pz/FzsEGPkzecuSwAaBNc10gabDJdU22QU8LeWaZUW8V+ZGnenOkLTYYR/tR6ZcVGOCbZNbdBiOSxBBygdmW8t5RCIRCIVlZWt3exda5uuYQeHjJTMDghdjrIFEolMzcBzKpRZoTdx81SKZVOhQTECh4JKOm8qk/lYfcH07P0j9TVHw/cN0bcRUTbBMTVdSSmXJmTOfNMiFtETYAIAlSwtcO/gVSynEWP84f7U4RAbLGT/AHKRzer4aKBhwBMPjWQNskzRB1tVKU117FF9r9ybIRVM5OBBQer3R8AhHeU4WN25FNfjyOvJTsvmEx2SuiVSDFUMCg0TdzzknqVVHFBMKb4N0Sid10SqT+Uh9wfTs/SP1NUfD9wQF/YhIG+aCV17/wC0JtU4ahRVjD52XtUkplOBh8TieaY2wRVXdrQ5ouWm9lA9skQc03BCcbC6xhsody+imeC1bRmDBGL5l4UkwLQ2+ZKgGSlFqkd4U1w3EOChku0FF1094AN11ozsjJcE9yjlvURC/M/+/NCRRuV0DdG287ynJ44jVBwe1P8AEf3FYk45LZQxVBPIKLRDdKU9SqdAphTSrolXV1dEonJXV80SqP8AlIPcH07P0k9S1Hw/cE0c1cAJzlclRtJOZUIwhYslHJjHeMii26zppfF9G45jkeaeLrBfFfknbas+SDqpHSxnCbNP1W0YK2vLZS807GZho1/dbJnkj2tH1pJIuDc3VI8Ft1M69S1DNqp+PcU/zTzW2NpspYZOudgcBz19iptpMkjxNvnnciyrdtU9OwtfM3Gc7X0Wx678Qev/AEnxWA8uf7qKa6jkQkQesSusSunFYldEpxRcWG4/dSkPbcIPyT3ZLYguHO5lM0QQ1UpzTipSpyrppTSrq6uroyNGrgP3T6uBuszPmn7TpGayg/sv4vTc3fJfxSE5gEp21P7Yj81s5+PZ9M61rxNP+uz9I/U1R8P3Dfh5prblEYS0qEpqlGE9Y3XiOYQkBbcHJVb24SNVDPjgaeOhWMWOadCGwOkZ5zjiRlD4u9ST/htruk4Cxt87rZtQHxjCb3Cq3OY5snAHP2KGpa9mRUVQGOcHcyusD23Buun8zXTU8IsXC7j3LZ8U0os1zgOV1/BnOzw6qioqulH5Z8X+1UFab4Hiz+IUVQOahffNYkHLEsRWNYtxKcUSnFYlI7C9PfktjNw0zPYmK6DhzUkjb5uHzUlRENZG/NTVcP8A9gVRVxcyf2RqRe4aUK236f8AaO0HgZMCNdVO83A39k6orCPSfJPlqjrM5EPd50zj+6MF9SShSdy/CC+ma/DWIyWAM/SsbgPEWyM9lUd9epZ9B2fpF6mqPh+4KyARUan/AE9yjkAtmg8AJ8tuKZN4xjvrmE9pvmclXVrNnkda7DE82B5FP23G9wihxOLza9rAd6nqgynvcWR2gyKN7pDroE6Y1E73210XRyciFjH6gKfx2W4KBz4pCwuP/wCK7hLa9w7PWya1obcZH2rpnTt/ikcgyMjM/aFsCGzW31TImWGS6tttFV0jZG3tZ3cqOUwyYJ734HgVFOCmyIOQci5E7i+wReOYTpW/3BGZg/UpKho5p9W0fpcpKnG7JhFl1xIzaoNsysaA1gFkza9TJxsmVUz/ADpSgHH9bvmnUpfmXk+1S0KfRYNLosIRaSurB1QY1BgWALCFgHJYQiFZO1WBGNbK9WUn+Jv07P0h9T1Hw/cFxQKcmGymF2X5I5jDfMaFQTnDgk87geaJ71X1DaeHrSbBhxXUu1YcGLGD7FW1n8RqY2tzjYb3U08UbbmwVdtF2bIpSWclGHykF1yqCiJcLiwT4XU8UcsZtg1VJXNmjzNiNQqonE2VlzhysOITK1knVuYb8COKbMHM0P7rpRUCbauDP8poHzzWxMmtQPNGVv8AcF1reYVTGyZtiqYSQ5OdiHAptQQ3Jt02rl/sAX4uYaNanVdUTwH7Iz1R/XZF9SdZCvzTq4qzuasrLCi0ckWBFiAsoLXUACYrpzlKpdVZYVZELFZY1fcd1gTffsz1bS/4m/Ts/SL1PUfD9wV81dOKbImyWCqHBjrtP7FGsjLcxhc1S7aMXnRPN9LWW1doTV46prCyPjfUr/xYYgHkYgnbRwZU7f3RdPUHxi5ypdnyuObbKhoGxDxrXUHUxjUL8XEBYlTx0+LHBeN3/Em3y0UM8n6rFFtp+sjGE8RzQrJgLWCq6Xr53Sub47tSoWSMyYbINmOshTQeJuorWTQEAChYK/gWVtxTddxRRRURzVPmmAoAlEKQKVAbjuIWHeQreBsz1dTf4m/Ts/SQ4di1BP8Ax+4LrW/3BfiIxq8KWriH6wnVzL+LmjtHDo0lSV7ZcjGnRCTS4/dGmdq0+NzOadRuewtLiPZkm7IhBzzTNlxDzWhMowzSwQiI4rDZRtCbG08E+JtkGgIHNZp1+SA7lZAFMTShvG6ysrIopm4ooopmqpHKM3QRUoUwzQRHlNm+r6b/ABN+nZ+mxt0ZrCP+H3hFxPErXUoBNsmkIxA5hCM21TGkaqwsixEEbmsKwKNqAsjogEGi6aAi0KwVgsKYAgBvCG66uiUUU1XRRRRTdVSlQlA7pFOEEfKbM9XU3+Jv07P04/pes+D7wuO4JuqjQQR3lDVNRUe8abhoiuKGiG4bwh4J3DeUUUFS8FCmoqRT7ij5IrZnq6l/xN+nlP/EACkQAQACAgEEAQQDAQEBAQAAAAEAESExQRBRYXGBQJGh8CCxwdEw4fH/2gAIAQEAAT8Q/wDPkah3voqJ3gU4lSsmNajYpjf5icESPe19xKxNFH2llNf/AJECYshvfxYfYmMC3QtfYgWgs4J96EwbeiD+U/2ZEbaIH3iqjlsn7iEgH5BlhcGy8kVw66QwdLKlSpUqVKxK/hXVIkrECBBExDU8JaNGYJhF+UV9jc/bdn0+UzXRUqVKlQhJUSJArycEsA/1EMS0NB9LiYKjkdPs/wCQUO5IWfm/8jubcbT5QqUCPKgp9yOxw6TInhNfNTIV3CPkhopW4H9HyTGkVhmexzEQWkrfFGCFFDAzLoQmkMEMZXSpUrrWP4B1enHTmCJiGphDkiYigwlYqf6n77s+nFlDXRXU5gdFYiSpmWVojGW+jeI7OblxUVl9C2XL7mKDRvdQ6ytgbsv/APYeeK8Ao+Q9yxtdyBR9OYyJjkVpPwn5gtEXSN3lWMtKQr5KUFHsi1sFUz7Nf/USGptQ9OYr75Z5OGVTU91+YSJtwjqCGGJK61KldK6V1qVHoahKgnENTaHU0Sk2IZJhc/adj6cXI1KlSqlSvErmV94xUoqQCZ13xjR7ibCwX5i298ZTQN8OQPtFi56qCELLtRQDwSAPNVDjeTJqFQrJC/f+xmZbhzlMtWw7OyeI7G5waR5/bCUQxLoKa7Ji/iCJKCwYHfz55lhuWt458osBuCLVf8Zjqmxj2RUi7OpeP4NJX8q/hUJXR6hOYkrEJzNCGoEOuhtn7TsfUg1KlZlSpVypUoq0FrAQpixzBCisoblYrlW9oC0sVjECFlbZRtAzxwHzGHUYT9/qcC7ySv8AbA0l2CvxCWytFX+EgfMwKcePEDknIoxCiIUBDLG1+hf79xF6FyhyJ+sJApIkFgAUI/C8nuXksKmD47R5S01Nf/AVK/gdDoxlYgdEzGcQ10aQhtmsM3c5e8/ediP0wspwlSpXUrv0JWWLLs4uPHuBLs4Hg7SgrXMBcEN2N1pgJr5iOkIlJKClrgcw6xR8SlSrAJVPkhBm5GYLzHA8CxhqrpvZ7IyKtw4bPX+QA1CXld58H4hqIxTs+oNQbyDSBUAzxoypDmbf+YQ6VK6JiGoSo7iQMQjvoGpWWaQzcqP3nYj9KQ2E4ftyvEqV9oeEqVKjCbmGhheW7eYBYYxLPXdgJMNTAsmAlniBAaqINE8U2BHWJKGj5qKaFxsDQjzG4y2/D12ggU7GqzCjIubu7epYSsVmk31GP/ifxdQhOYImIagRh1NOoIww/QwfTG+n4doEqVAlVKj4y8EM42T5e33iKsuS5uDQ41Ew0YlFWEI4mqYbmLUwah0LZVCTUwLLyVX37wrL7wwKWnMXMyQhs5moWb9koCc9R6nRP4HV6kCcxjkhqbQUzlAiZjk6HAn6DsfUf1KlSpUqVEIW1ibIQPZ2/mUI3olo8Rr1DiVYYMS4hSVKiTZDhgqbPMASuJbL86qIikQW35l3XdDwxu/CPQ9To/wr+FdDfRMxJxCBmCBZBGExAZsT9B2Pp1U/UrpUqV0YdMseD3hbUGC5qHWMEwFkCiiDUNy6Gq6RlxgDmWTFMDpxlWGSXOvklal04YOi4CQmDsm0WP8AF689K68dDfRjDUJzNIGJymxEh0foOx9ObhzodKnmcTYs01HAM2V7ssQhUTjEdQExxHjEdm4MWRw3K1lgG4Wj0YIV8Ju1LMSwGbcZmVXsvHmXydn9QxjFhD/y4hOejExCBmO4kCbMAziHT+g7H04suvqZ6VKtlAvkssbaDcFsVKnOQjmax6uA+GLdR4gK7xEajhuo4wuO2JyW+I+0hoFUyY3HFTGs9p2piFYQj8EzndOgRjCHR/8ALnoziENx3GEIwIQsXp/Qdj6fKXO0JU103PmZsrhLo7GpULxMl4urOXsQq0R8IAECxDLLNsFTgywwxDPeXWZnhLbWIK6INSXzDBqJwsoyl3ykC69mIKzEdmJa7yavtAdu7PuACOB0PQsGH8X+Ffy4hOYziHQMQ1HaQ4n6DsR+my3epc/iVPjpXTARbcAL8SqBvaBxS1ZwQIFrl3DwQvYidC+1yuO78w6FlScznJpDlmOfmCWeJjgHtCplduYSRpwUiHAyssoOI22QhhZauoK9AjnxmaDUZ6iiwhD+D0CHQvV1EldOJxCcxlYgRIGIFRKU0n6TsR+mVJPUP4VELzxAGq3X2gGjeR+YSnCZVp5e0SZyAtDua1FNvasA9IQfZhgWcKQPkcITHZh7x6FxLsMxsXzKAQzLB1FHljnwSPUzeI+NK+7xZXo8iDMtLH5eH4hxLnmxO4w8jL0lJAWljrAsy4GTprh7wKWxtuLoepD+RSDMcJyy9InR1AhHcZxCJmaQcRI0n6TsfU/nqodCVUoljIWDMGuB0e6ldqdRouaXWvzxHC7HIjctcBf6xxWYhaFq1mhX4l7iiilzRlQzW4DUMsZGvBduPzFff37y1De4sZJq9wEj3CWV+f3UauVMAKKUW1H6xoUzQIRyq8ikaZaQCsPCG81lS8VH2zjay5tziU6p3ir1KDEFGyXOSnmFRoomB75lotXyKqLUWMC+mqh/Fl+I7S9jUxb1MiJ046G47jogYhHcTENRMxOE/Qdj6n86V1qCbBKuEYyRLMhrIf6mhhoBTyxA24Qc+GYL1UuQMNF0XzMPk5UAU0axgvLxKtTAxklQUW6W1CxKODsQBDtAJuFBPH9C/Qlk8rKwmUnDjXaZCmFFKAo1ldd1xKEiIgAegLc+bhmi4SYJXCxWOIuoOfAgZZhQc+BApVsTbXllhFhmGUpRxEpr+LGWMoWZfGGn1cQ6O46gYhucJx0Mcan6DsfTm5+qge/4VKgRUow8kuEek9k0Ll0ogBLF5jQCfCJVeyb+Jkc478zm7jC0xXcHCBgw84W2JYzhPhHH5hjl8SrRMHTqy5YgLDaEUWMfHgRHRQRcHqLMIzBYuAKYLqdExBjEVZgpPMzHqVLqITno4hDc4dDcwScT9B2Pp6t89dKOtXAmKGgVAgQM0xaqWNwazUrWAuXtvQIeTli0ncJlC+JQHZUpWYAelJQxTMgKXAWxwnarktiF7BHRyABHxF5iyxKCYH8O63AObnYQ+ILSbnuKx6hz/gIb6OITmaE4huHXT9B2PqL66V1CBcSRsbJuaUfTNFQO8KoCwQgu8vtG38RbCKSFiOE8TflIYvsXt8GWEvXKFnpz953nSJFV5ijVxvG0WKIqvOIiWSoCUZjEcDlQIVHAfdizFNp+ZMUWOoI8x2GjtCCRzBAzmNkoGDocdCc9BqE5ix0JrMVP3nY+nvjzPUroqVKgQJlEqFQvEoxHeZgG4pcX2l+wEGxhu4qtPCYOrq0MWss5uuGmeUO7KqpiO0Imnb8wRG7lOLmS00SikwLcxJDuq0gZViabq8wGtmTKEOCLfSeh2BNelWmTbHULJYJnUxRwlqc5Jv13Bi5i4hqEdx1DUNs1l4Z+w7H0/wD86NSpT0roQjGXI3LSnOSFm3PiE0XnvOBG48dCp7ZUUYxBdHWyCtF94qAiozKhldtytMS21NpFakXgdz3PMGvBCxlWVbWYv4QUCX1FZHUAuXqrMy15mQQ46HS8OfUd9JLhHcYahHcdQcTamsJ+w7H1C9fwMzmEMdFIXIpi15j5IDRHgTp7s2LhV3CumSUOaHUuqo1ozdd1HLhfXQNcty9MsllwYxtlAduVi6xmlRb5lyZl3QXHRrHKg7x2EGJUsc9cUxdRjuLiDiEZxDUuNkMT9h2PqDalda6VzAhBD3BPMF255goudw8VBRcs+EpHFXAY/tVoMkDgNe+YhfapLp3jAzcs9oRP5gU4gFmBUwtQC+SOqNzwD4ginNDg/iAcHMwC4BW5u12x6u8+ZRWJrKlyniBYoMGDFnENQYuZeGLEWEQOp+87H07rq2pUqoEqVCIjsxAJm4M+HcIdzhP5ikt4pWtn1F2LdYs27REzehdS+VTI91EHSMlZ7+XxAYOO8Q3RLU1mIrWo72R7S+blR6goAeodX83UmjKTMaRR1GK3q4F8xWkOJUFxk+YsGDmcxZeOg6DURU2I6hxP0HY+oXqBKlSulSuhKDRCU8wF9wPfHaH5NxbhIKaeGGmqEwM4MpyauzMVEKzFWrjMHc+WoiEla7zbW407Jb5RDTQQtEoh/AmbpZRWIe6GEJHUY6jmzMhiv1TXprDQy4MNy89HEU0xhqcouSb6P0HY+rXqVKlXKlQIqR5IC07OITWSo0CMDhcykC0MRg1xFsJ2/wDkE31eE5Ox7Fy5BgAr5sa32jikSLvJBC1TMSbla/sRZRvOk795bDqMXSVy+irBDHQ/wmmZl6JrKxDiYN0KXFzFxBxFmXmLEGLcUuDv3P0HY+nygAzAgSpUqV/AVKZvUcAiu/aY2b8wtlwKtwMAp2jDE6MHbR/Ep0Iu6bH4D+4aERxdUHqMN/iKS8/1KuU3GPMqOYAHK4CVlQ2pVVk4gEw3Blx9KwlQhmdFiPQpuzSG/VNOmk1PcMo5cvMvHQi5i4gwcxcEuG5+o7H1AtSpUCBAgRFoLYddV7jVlELoiDayw7fJwxxwTa4jYLfeKJeTiAF1cFpp9oZNIkxUI057RYBzL7gOC2r/AFAbX8Y7vlleKuYqm2FYR4IE5SjgYDYnSwnrECiLFi6FHuOBXpmvTXoGUyQZcXEIMdxcQl5i4nEGln6DsfUOmJUrUqBAhMdwzdHcsEC4AXUOCmopAApXcl0pHhhgQ3uZPUdAq8R3BGnL/JnH+0oAt2maue4DG44rPYP91LTitL8i8srCFoOJbTiFhUPtK9o9iC3jELKcx6HcFsoWuiixYoooMQ/ZhwdNZmffoyRS5xBhHcdQehcQbJyz9B2PqIKhCBBGUAtdQTRllYGYSrxLHxLRagQS0WwMmT3ATNZkZvmNn9MYrvhK/OmWB+ZZiVH5EeP9OUIvd32DbGrC7zK+5969Rvyub/4HglJbCCghFYgDqYulx10BRxLrQzGQOYRHiMUUUWPHRqSj0dWsyxLzMkUuDiDBzGOSKXGkHE2T952I/UUEqBBMXa1GAwQyaidPJUDMoTI1LSlW5Iw1CgMeSLPusQyp/Z/sg2OeB/lUrgvZWvlzAoAXDDVsAQtKZ3IUIFxIMGpcZIaOzMBCIjFiiixY8dBsO7KPVBjpgRWoqZ5mSPEvEHEGXmLLxFFqFxBsjv6n7bsj9OwEIECKR7ygxmc7cFPPMFsRvuVtViYNTLEt3xCW/umEKnhqNCVvOZviUHmAZg5qXbiCpkkDEupqL3m4nSoNkVk1n07TKPoLFiiw0vCUH1Neiwx2swHzHUVhDUHEUvMWoOIOZl0A4ix+y7I/T0VAgQS+w2zTRMGo3sUxCJZLSUouUvUOARNagriX8RazMsD7yqlBU03DRNSxGqfKXL44gx3Ai6d0AtiuAQcJcbdC4sWIsHp5lRmnR0oruYyWZig4gwi5i4gwcxal4lhEXmfo+yP02URVwgQLogaGoYVUoLjpdlCspIBWY1caWuJdFu0xcwCNcRyxLcSySq3CKw9zsSnkt9irhPqAkywaKijmZARJZnuLYxfQUXJLh7EFCadKFNGY+5M0WCDiDLjFxBg5i1BxHiPJP3HZ9QxUIOgqyBrz0Fs2j/XSZcxVCznEovcBERhUROKJwl2l+Wl+JjvNFD8/8m374/4myB6X/YsVZ8n/ANSt1fYgjF+BGOUid91/yVreamIthaXA6TISMF6sq31BA3CxGHoNE9gVMQg4lzImrNcdRQcQZeYpeIuhag4myLJP2vZ9TwQj28Q4S5tiVAHqJViArzFslUG3cwVWOMqGWFYLaGV8RK4ju3+D/seWDt/wgLZLtlG8MuqFpCAOIy+EzajfCuKlQUfpqGAJ4YWxMiWegwMKw4fMay5V8S8jDh1isdys1IOIczdFhmIfLMkwRYil5ilwMvMeCGossWp+l7Pp8+kCBbRuVBTcAYjrMaCMoHcMxZ3DDM9qX9oAV8oImZXyPsRKOd2H8xOZhqMsKbMg7+/EQJbOU5Uq1WcalrmLGgqHzmAQ5BqAAjYztg1qWGo+EB4ihvvBUxjb0XBsL5U2SrwqVrB8jCIq7xtl3OsYyTZlY8Jr0ulLLiwzu7MUeIsRTmKXiELmNgY8sWp+t7Pp3UgdFBDUpFQalR5hhvMdeLoW8GY1oeUD4O5iHWnDv3/yCVIK4gAcBmzFfMTKVUuez5iFgMv6xGKLHJgY4EO2rlTMqlBnEyAOYNZ+0G27Wen9/Es4i4hNQJYzYzPMPUTM1iruqh+WuZYFcYFQWcvOhkluyBKF4ilx0mLcWHoHH0FFzFxLxBmSKBl0sdk/Q9kfqEEPGBgDgqAq7jCuJQyMRXQwnHw8eeYHQV2IRBtoiLepaUAZDCPiPwy77HSTZ57wCsUPvZ/sKhaOUdQcSlrCYgo0iwDtAFDemW3UcIVTT7gC3KOI4I7uE/379IumUSvcpzKWZMTW6jqVAPaNYUfmEHAdxQoySyG5KhnJFNwUei5USPDHuZHpH0FBixcS4RkmBg1Gix0n7Xsjv6WpjMWAuuSwqme+iApQHlj2FPDEAS/sliHYfieP7h0AYIEa/EbWAq5OT7XBaWAkuFVeZo7PLfKr/wAYAbhypQd3JC0UwF5Tn8QqeoFLzfEOUNrQ7SmMiXBH+SztVKW7HJ2YS7ho+5uQlnoA/sQKq5blhzlzMwVEDmIUsGKlFTFytTDMQR6OmWHTpOzDZ3PzCxuVqWloj7wUJrBzOCKPce+sYJt0NIRtKGZEJyymBn6vsmvpnVMF/P1NAVK8h8sXbfmArKWoWHEbdtmrgZ8NQ8JKnFRbP5IuHvmNW8hw6gGaUo+IhGQRDgR4ZEfmZZ4tae6NfHeEz8pq4eWCcNQQ3of8gEHOJqOED1cZcKcEjWTqD6TyzxD6VJYB+8BNsW4eSCl6DkG1vsvwEFheYGIKhArDO6ModRGYI1xOy44kPUwYlFvTuTvF78TUd8zAO8tTkr0YmqLEUZExTFMkKKeZmmLoY0h8I39+EbxXsB/qEIp4TDhbzCDwoszCRt9rwZddjR2stfUAXiNpkuWW/aHoxOBC8HxEQFwEyTtEMWmA/S+0AkUXfiKAZD4lgNg+QxDECEALlbWHX4CZClDMoSlvlUEfNgu7gZpwHNoVAa3nMchDE+LjWsVsYxvkkMB98/adlWhB9rmEivJJ7mrZPjtG2B7JXMV5Rm706h5RXBctq5RGj3iV0weZTOWfahI1GlnDuYXvmd5omUbbPzmLBChBWoPbDWD7i0AfCDHL6bhrTK4i2RFvOICw/bFk+esufjZTLAPNA/yYah4x/U5ovKZlm95uVX2upvFe67iMi8MuWWrvLMw8Jcavcj7+njYQeUxQwAVDVuxYpiyVLjCC7PEYVQKv9n7/AJGIzG0tbi6lEBSjWO4fjzABKO8LtLLoKhp4glS62ZTiX0Z4djiJhwL5IhsLFNy0oMitj8olXCtSy1x8R6GDdn+4Ow0jub+yfaHgXDISoZSvAx8FVY4JCW5yP6PiEFJ4loZtjpCz4gd5go33l1tZyFHuKcl8wJSL7gWRArFeiIoJ8SrbY5XcvLcwc8KLIZQfUg42ew1L5XvO0rUBrslrbbjvAV+TLcIpbgFWVBFqCK1A1mFmJiyRt0gXFTtxRC4WwtsuBWCGjqqOvj9RAo4ahV8RUsKlywrjb0x3OmgafCManoaHSNaNO7uOABJdufxccSZLLRA+T7C/rLS4qcBFC24th8v9ERleBzGyBk8SdlNb8Yr5IfAxk2MK0gVzCX84x8xq2ig0OcfEtIGOCXNDDKm3J+EmaoXvKQUHlYXfzMwYaLOTTUw0DgzXmFPyIpT7yJkBNwLxGo+Ilww6r3zDnb8wQZ3AXA7nYJuBCpgrUpCkSDKUVCpGSNRxD2QDKcRrKOJxQDAMW57RfMcQzKjji5+l7fp1TQAtNj1D/EyUumBkROzKhaHHB4fHmOLu62MrDXkUL97iJXp4Dt4I3GbAczLKGrFTGwXXEBKjuksvzqlDdxqoZwlUlbhVf82D8n9JijE7FQQLsDSlVNirlSbRZzRR/UFEHxEBb8y/95DRZMDMAyEGiAikcyplPSJUUFxWP4ByqTQpgDoFZKhuEuWFkaijmCwBolURLiJCm5VdGfpe36c1lBtBDKL7iUp1vMyQnOGbMhlC6Pc2c9tfmB2KNW1Pnf3hBAUoyA8XBBLuFoCubbuBWL2RTH1E8U1Crn7xHEYzFRQENsIHC48giSwiwKtTsIUCNeo7NVK8wvoIQQ4QVFUGbjroUcce80QgQG4RIdMqgTNEiRifwY9Gfve36dHCJsbilf31i6J94V7ahDicQ3EKK9Q+CiGVyzSck7hMrpiC4olvHQGATPRKFURnEz6g2JTogQQlxQwxCk2lkeJkzDiMLqZx1AFTATFFxMxmRg6Viy5cuXLlxzElE/a9v0z0pdozbobTSbs4w1HXR/ZNfjp/3GOugb6zlNE3IdJx/CNfBCf8jNXppOIzlN5zm50NCadGjN/4R04PUePcOI7nfoTh6n7Pt/8AT//EAC4RAAICAAUEAgIBAgcAAAAAAAABAhEDEBIhMQQgQEETUSIyMGFxQlBSgZGhsf/aAAgBAgEBPwD+KiiU4x5H1CXCH1EvX/Y+qmnTSF1UvaIY6bp7f5DRRRRiz0KyWLJux48mtxtN7sfBGTQ5NmH1UoKnujDxY4i/HzV24uIoR/qScpu5GhDw74PgbFgS+x4LRokhLfdEZuErRhYixIqS8xduPPXOvrJISEihoaHElDY6XEcJaXw/MXPZJ0j22JWJCQlkxoZ6ItxmLjy1z2S2RQkbCENjlRqTJLKcd7Fx5a5KzxXpi2LiyEW92aY+jTRQkOkSipISadDQ1uLy1z2dR+jIoq2kR6NONtpEoODcWehx2SRHp4RScnyY+HoltuiSJDknKiDTiqzWbyXhrns6qWnDbMOWr8mW7uI+ok1paMTEb5PkXBGdjnKquyTbdy5HKyQ7tuPP/h0WpJpu+55Lw1z2YsNcXH7IfiqYpUKdmI9jb/cw5XsOVDneUnRFNQpnTQcU2/YxZuRZYvDXPb1EFF6l7JMiyUbocXdkI76ibLEybbVIgnJqOTZFjG7yWS8Nc9uPG4MkiA3sXbISJ82exMUJSaklsYUHFtyyZF7ks45Lw1z2tWYsHGTRHkq/ZBxS2JaXutmSJciILTFIsbLN82RyXPhrnuxsLWtuSqdPK6LbZZIwpRUvyYpJ8ZPJdkecl4a5XZiYqht7JY037ok2+WNNbikyMkSkqNWp7EnbqJGCj/cimhOS9in9idi4zZHnNeEuc8SSirG292c5NWKH2OD9EoS9iw2+Xt/QUElSEhIoohLS6fHYyOa8Jc5489Uq+iTpCRRQsmisrE85Iwp2qfrNkcmLwo8rKUtKbPdkxLtbHJGpM1EZOxFjYpaXYneceMmR8KPKy6iaS0/YiT4FItPLVpVsc2+Bq+RIaKGi2hSNmNGFK0MZHjOPhLknNQVslJzep5Sd7CgR2dMlFx3RKLtCYkme6JOi82ijdEZaXZdjFnEXg3p3Zi4jxHZqaIybIpDuLv0ST5RPGUlpRCakzSm2Ruh4iTJTtkZWJl9j2MGdqj3myIs3JLljxIr2fLH7/kn+ryZHYaNTktiU2o0J09iFqVFuMrRFu2iT/wAJ8f2xxcf7ClsIsssdEJKMrI40bFjRfB8n0iWK/SFiSNc37Lk/Y4yfs+M0I0MX8c/1ZZZexrRf+kWG+ZbH48R/5FpS3Y8SKdNjxkmfMlK6H1D9I+ZsUn9mp/Z+T9lMSIR2HFDiiCEMSKRQv55/qzQxolJrgbbLl6Y3fJRWw0hKxxGhLJZUIiqQxkORDF4U/wBWMZIefrNDPQskLKIsmQ5EMXObzXf/AP/EADIRAAIBAgUCAwgBBAMAAAAAAAECAAMRBBASITEgQTBAUQUTFCIyYXGRQhWBobEzUFL/2gAIAQMBAT8A8RULcCfDluYMKO5hwi25MOFHrGoFRcb/APS0aes2iUQBae7tEW4hQQ0xNFpUwgfddo9NkNm89fK8vKVMu1pTRUFhA0D+s96onvh6QVVMuphv2MdBUWxlRCjaT5EeLeXyw66VGRjQk5CKTLwNvMXTDDUOR0X8weOhRcxeBL5MYTkBBFyqAFIefNnjoXmLLw3EbILFpki94aZG8XaGX2h582eOikNTARRc2h9Fh1DmM281Wg3ioWgRl3jEEXl7xt1M75nxR4Z4yvBMP9YgPeBgiljH9pHVsCRBVWqAyzvEYA3MbG1WYhALCYbEGsnzbERjcwTSdNxHBDG+Z6SLeTPHRhV1VAvrHTTtFAK2bifBqGuDtEpBdlENIwrpMFGne4FopVRpUWEC7wCKosA3H+57UC6gVFtszmMj5M8Q50nKOG9IxD7iaIVImHUsTtxChv8AaV6ZX5oqaoKZEtEW5tK9hUupmMqa2sO2ZyCy0tDx5M8dODfUNJ7RKdxKlOwlByhNtoMQQbgzEVSwtKQvNG20ZYlgbmVXsCxh3MAzAghGR8meOnBvpqAeso8Sss0fNB7OfTrNgPuZXoFDY8yhttNItHXaPWRLqxsZiKoeyrkI0GQhyPHkzx0g23mFr61BjsCsQ2cbXlTCtVctV39PS3aVKDabHgD9RLAym21pVNheVW1sWloBkcxDxkePJnjqwuINFvsZrDrcS5U3lHG0qqAVDYjnbmYrF0RT00zc/i0AN7iIxExjOaelRe8KleRmegQ8QQ+TPRSompvwItBF7XiKB2ivbaDSeYaUWgYyhBvzFFhqaPUvGYekZFPaNR/8wi2x6BDxBDD5I8Z00LsBLBQAIpgmwgbTvExAUz4tSPT+0NdQbqLn1MaqWNzC0Jl5eVE1Lcc5iCNBkeoeIeM8OmlbnvLXy1zVNU3vAbTVDbKxzErppOod4MhGzPWPDPGSLqYLLdhF7y+VvSXtALmBYKbekNMwUzGTYQi2QjrrUiEZCNzkIfJHg5YWnc6+whiA7woTxArDtLHvNJY2EWmBzvAQvEZoGMvLmEAwoe0sRzEIldNLGCLGyEbnyR4lOmajaRFUIoVYd4i6RvCxmkMNQPEDBlsZTIAJIh3hJ7S214qagZaXyvAZYGPT1rbvCLbQQ5CNz1jw9JbYd5SorSWw5gUGFQDtDe14oDrbuIhCjeJhjT+YyrTKrCxSxhtee4235MCBAY4tkBCJpgEAMxFOx1DvOBeHIRs94Kbn6QT/AGi4OuwuEP6gwNc/xhBBsfDp/WPzDBDcxQbxEVDuYKWprjiAXUkxiGBEZAy78iFAQDCdIvDXPpNQf8zQbwi0AhHpAhgpsTsI+FqOhAEPs2uRsB+43s2qv1ECDBqD8z/4iYGg3Ln9T4GgObmfC4Zf43gFBOEH6groOFA/AgxhgxbGGuDzvH+o+HT+sfkS0HEQ2beaCD8sZARdor9ljFrWNzFSqWBCk2+0TDlhexH5gwBtt/uP7NdhyIPZAH1P/if0+mh5MGHpjtPd0x/EQaBwo/U1gcAfqF7yq5vaLUYd4tVpXYnvGES0LbTWYGB5hC9oBm3J8OkL1APuIKAPJgw69yYmHpn6hFpIvECr6CKoHEuIz+kVzbeawO094COJrjMIYYc6gu0AiiVRdYwsYp3l9swOhuT4dD/kX8iCCCCCLkeYIeIvGRhhyMPEbmDmCVfpj8xeYOIIIOhuT1f/2Q=="><br></p>','<table style="width: 100%;">
<tbody><tr>
	<td>A</td>
	<td>A</td>
	<td>S</td>
	<td>J</td></tr>
<tr>
	<td>B</td>
	<td>S</td>
	<td>F</td>
	<td>G</td></tr>
<tr>
	<td>V</td>
	<td>S</td>
	<td>D</td>
	<td>H</td></tr></tbody></table>','1000','1000','1','["1","2"]','[{"attribute_id":"1","values":["L","M","S"]},{"attribute_id":"2","values":["soft","hard"]}]','["#9966CC","#00FFFF","#00FFFF"]','','','0','1','0','0','kg','10','percent','0','amount','','100','59','Test','0','Testas','','uploads/products/pdf/Fah84eiv70z1pKf1P5ZaaxPJWFihehFrOPzihN2v.jpg','Test-b3sMo','0','0','0','','3.75','','0','','','2022-01-19 18:46:20','2022-04-22 10:32:24');
INSERT INTO products VALUES('156','bottle','','seller','276','1','78','','3','["uploads\/products\/photos\/PjGvRDHWMJvMapUY5rW4NFzrRBlugUgq5A3IAV38.jpg"]','null','uploads/products/featured/NHwAkecLwL4JF4vf8vyy2KbzqvInNfVtSKZnNFkn.jpg','uploads/products/flash_deal/TjSuziBM2zVeyiBnqqhYhUAWTK3Akgb5Ul2wtfw2.jpg','youtube','https://www.youtube.com/watch?v=oM46cigJJ_Q','a','10','10','100','0','0','[]','[]','[]','','','0','1','1','100','piece','10','amount','0','amount','','0','0','asdf','0','asdf','uploads/products/meta/SBlVTxfuaJhJRJOIWpCi4MKwg8OTcs9aoVTqPs0h.jpg','','bottle-t1ZFG','0','1','0','','0','','0','','','2022-04-24 13:10:57','2022-04-24 13:19:59');
INSERT INTO products VALUES('157','qwer','','seller','276','4','79','89','','[]','[]','','','youtube','','q','','','100','200','0','[]','[]','[]','','','0','1','0','100','piece','0','amount','0','amount','','0','0','qwer','1','qrwe','','','qwer-wXzMl','0','1','1','w','0','','0','','','2022-04-24 13:17:29','2022-04-25 00:49:14');
INSERT INTO products VALUES('158','2','','seller','77','11','4','','21','','','','','youtube','Neque itaque ad at d','Vitae sint sed face','','','200','0','1','[]','[]','[]','','','0','1','0','62','Distinctio Tenetur','72','amount','67','percent','flat_rate','57','0','Cupiditate veritatis','0','Quis culpa et assume','','','Alma-Paul-zhQlr','0','1','0','Architecto nihil est','0','','0','','','2022-12-01 00:58:54','2022-12-09 00:58:54');
INSERT INTO products VALUES('159','3','','seller','77','11','4','','21','','','','','youtube','Neque itaque ad at d','Vitae sint sed face','','','300','0','1','[]','[]','[]','','','0','1','0','62','Distinctio Tenetur','72','amount','67','percent','flat_rate','57','0','Cupiditate veritatis','0','Quis culpa et assume','','','Alma-Paul-onDv5','0','1','0','Architecto nihil est','0','','0','','','2022-12-05 00:00:00','2022-12-09 01:01:42');
INSERT INTO products VALUES('160','4','','seller','77','11','30','','21','','','','','youtube','Neque itaque ad at d','Vitae sint sed face','','','400','0','0','[]','[]','[]','','','0','1','0','62','Distinctio Tenetur','72','amount','67','percent','flat_rate','57','0','Cupiditate veritatis','0','Quis culpa et assume','','','Alma-Paul-5FlN5','0','1','0','Architecto nihil est','0','','0','','','2022-12-09 01:02:38','2022-12-09 01:02:38');
INSERT INTO products VALUES('161','Tanner Leon','','seller','272','17','83','','21','','','','','youtube','Tempor facere eaque','Neque repudiandae co','','','226','456','1','["4","5","9","10"]','[{"attribute_id":"4","values":[""]},{"attribute_id":"5","values":[""]},{"attribute_id":"9","values":[""]},{"attribute_id":"10","values":[""]}]','[]','','','0','1','0','87','Recusandae Qui assu','1','amount','6','amount','flat_rate','83','0','Rem minus ex minima','0','Expedita dolorem lau','','','Tanner-Leon-LUu8X','0','1','0','Magnam iste suscipit','0','','0','','','2022-12-09 01:03:01','2022-12-09 01:03:01');
INSERT INTO products VALUES('162','Fritz Brady','','seller','273','3','33','','18','[]','[]','','','dailymotion','Facilis anim est er','Aliquip saepe quisqu','','','271','273','1','["2","8","9"]','[{"attribute_id":"2","values":["z"]},{"attribute_id":"8","values":[""]},{"attribute_id":"9","values":[""]}]','[]','','','0','1','0','23','Delectus sint dolo','97','amount','8','amount','flat_rate','5','0','Qui quasi commodo do','0','Ipsam voluptates vit','','','Fritz-Brady-P7I0X','0','1','0','Eum occaecat facilis','0','','0','','','2022-12-09 01:29:04','2022-12-09 01:29:45');
INSERT INTO products VALUES('163','q','','admin','12','1','30','','','','','','','youtube','','','','','0','0','1','[]','[]','["#F0F8FF","#00FFFF"]','[{"name":"AliceBlue","code":"#F0F8FF","image":"uploads\/products\/photos\/5eHL6F4y12o2NJngNdZJMGWOENGYz6Cb1UjTevWH.jpg"},{"name":"Aqua","code":"#00FFFF","image":"uploads\/products\/photos\/INGGFNXyAUff14gHTRRFr1G4qivBGaeUcEHfHNGe.jpg"}]','','0','1','0','0','piece','0','amount','0','amount','flat_rate','0','0','','0','','','','q-52UaB','0','1','0','','0','','0','','','2022-12-14 00:31:06','2022-12-14 00:31:06');


DROP TABLE IF EXISTS recommends;

CREATE TABLE `recommends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO recommends VALUES('1','136','241','2022-04-23 22:25:31','2022-04-23 22:25:31');
INSERT INTO recommends VALUES('2','71','241','2022-04-23 23:53:52','2022-04-23 23:53:52');
INSERT INTO recommends VALUES('3','127','241','2022-04-23 23:58:12','2022-04-23 23:58:12');
INSERT INTO recommends VALUES('4','88','276','2022-04-24 11:12:38','2022-04-24 11:12:38');
INSERT INTO recommends VALUES('5','122','276','2022-04-24 21:58:46','2022-04-24 21:58:46');
INSERT INTO recommends VALUES('6','149','276','2022-04-24 21:58:49','2022-04-24 21:58:49');
INSERT INTO recommends VALUES('7','117','276','2022-04-25 00:02:34','2022-04-25 00:02:34');
INSERT INTO recommends VALUES('8','155','276','2022-04-25 16:04:39','2022-04-25 16:04:39');
INSERT INTO recommends VALUES('9','84','276','2022-04-26 17:30:46','2022-04-26 17:30:46');
INSERT INTO recommends VALUES('10','158','241','2022-12-09 01:05:44','2022-12-09 01:05:44');
INSERT INTO recommends VALUES('11','162','241','2022-12-11 19:35:58','2022-12-11 19:35:58');
INSERT INTO recommends VALUES('12','160','241','2022-12-11 19:36:30','2022-12-11 19:36:30');
INSERT INTO recommends VALUES('13','152','241','2022-12-12 23:30:08','2022-12-12 23:30:08');


DROP TABLE IF EXISTS refund_requests;

CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT 0,
  `admin_approval` int(1) NOT NULL DEFAULT 0,
  `refund_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO refund_requests VALUES('2','23','31','36','12','0','1','1400','I recieved damage product','1','0','2020-09-12 06:40:54','2022-04-01 16:23:37');


DROP TABLE IF EXISTS reviews;

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO reviews VALUES('1','155','8','5','Very nice product','1','1','2020-06-04 16:58:07','2022-04-18 12:17:42');
INSERT INTO reviews VALUES('2','155','8','2','good one','1','1','2020-06-04 16:58:07','2022-04-18 12:17:42');
INSERT INTO reviews VALUES('3','155','8','3','good one haha','1','1','2020-06-04 16:58:07','2022-04-18 12:17:42');
INSERT INTO reviews VALUES('4','155','241','5','asdf','1','1','2022-04-14 19:20:31','2022-04-18 12:17:42');


DROP TABLE IF EXISTS roles;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO roles VALUES('1','Manager','["1","2","3","4","5","6","7","10","11","13","14"]','2018-10-10 10:24:47','2020-06-04 15:52:57');
INSERT INTO roles VALUES('2','Accountant','["1","2","3","4","5","6","7","13","14"]','2018-10-10 10:37:09','2021-08-19 12:21:19');
INSERT INTO roles VALUES('3','Delivary Boy','["14"]','2021-08-16 14:51:06','2021-08-16 14:51:06');
INSERT INTO roles VALUES('4','Support','["1","2","3","4","5","6","7","13","14"]','2021-08-19 12:20:50','2021-08-19 12:20:50');


DROP TABLE IF EXISTS searches;

CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO searches VALUES('2','dcs','154','2020-03-08 06:14:09','2021-06-08 05:21:58');
INSERT INTO searches VALUES('3','das','168','2020-03-08 06:14:15','2021-08-18 22:49:04');
INSERT INTO searches VALUES('4','shoe','166','2020-06-05 22:39:59','2021-08-18 22:49:06');
INSERT INTO searches VALUES('5','Shampoo','145','2020-06-21 14:13:59','2021-06-08 05:22:00');
INSERT INTO searches VALUES('6','Book','4','2020-06-30 10:16:34','2020-11-10 15:49:26');
INSERT INTO searches VALUES('7','Meat','1','2020-06-30 10:16:48','2020-06-30 10:16:48');
INSERT INTO searches VALUES('8','s','1','2020-06-30 20:40:57','2020-06-30 20:40:57');
INSERT INTO searches VALUES('9','Mask','153','2020-07-03 14:22:28','2021-06-08 05:21:59');
INSERT INTO searches VALUES('10','Ask','1','2020-07-03 14:24:25','2020-07-03 14:24:25');
INSERT INTO searches VALUES('11','Roti maker','3','2020-07-05 20:37:47','2020-11-02 14:50:54');
INSERT INTO searches VALUES('12','Samsung A9 pro','1','2020-07-12 05:01:02','2020-07-12 05:01:02');
INSERT INTO searches VALUES('13','Wi fi','2','2020-07-12 05:05:25','2020-07-12 05:05:32');
INSERT INTO searches VALUES('14','Battery','1','2020-07-12 12:52:16','2020-07-12 12:52:16');
INSERT INTO searches VALUES('15','Shirt','8','2020-07-14 10:37:06','2020-11-06 14:47:30');
INSERT INTO searches VALUES('16','Brown rice','2','2020-07-14 13:40:14','2021-05-21 22:28:27');
INSERT INTO searches VALUES('17','Pc','1','2020-07-16 18:46:39','2020-07-16 18:46:39');
INSERT INTO searches VALUES('18','Cake','1','2020-07-16 18:46:52','2020-07-16 18:46:52');
INSERT INTO searches VALUES('19','watch','11','2020-07-21 08:08:17','2020-12-06 18:22:49');
INSERT INTO searches VALUES('20','Wallet','10','2020-07-21 14:43:46','2020-12-10 10:42:51');
INSERT INTO searches VALUES('21','Headphone','3','2020-07-23 20:44:19','2020-10-27 12:17:24');
INSERT INTO searches VALUES('22','Microphone','2','2020-07-23 20:44:43','2020-11-20 10:29:19');
INSERT INTO searches VALUES('23','Jacket','12','2020-07-23 20:45:19','2020-12-07 13:52:07');
INSERT INTO searches VALUES('24','nikesoose','1','2020-07-24 08:49:11','2020-07-24 08:49:11');
INSERT INTO searches VALUES('25','Daraz','7','2020-07-27 08:05:35','2020-10-18 14:38:39');
INSERT INTO searches VALUES('26','Headphones','2','2020-07-28 01:49:33','2020-09-12 12:31:04');
INSERT INTO searches VALUES('27','Gift','2','2020-07-28 10:38:02','2020-11-26 07:13:18');
INSERT INTO searches VALUES('28','Kurti','2','2020-07-29 06:33:43','2020-07-29 06:33:44');
INSERT INTO searches VALUES('29','Badminton shoes','1','2020-07-30 06:42:07','2020-07-30 06:42:07');
INSERT INTO searches VALUES('30','Shoes','13','2020-07-30 06:42:38','2020-12-08 11:37:21');
INSERT INTO searches VALUES('31','Closet','2','2020-07-31 02:10:11','2020-08-11 06:34:01');
INSERT INTO searches VALUES('32','computer','3','2020-08-02 15:37:52','2020-09-14 07:57:25');
INSERT INTO searches VALUES('33','Earphone','5','2020-08-02 15:40:29','2020-11-19 06:09:00');
INSERT INTO searches VALUES('34','Speaker','4','2020-08-02 18:27:11','2020-12-05 14:11:43');
INSERT INTO searches VALUES('35','Speaker bufar','2','2020-08-02 18:27:30','2020-08-02 18:27:48');
INSERT INTO searches VALUES('36','Dress','2','2020-08-02 19:36:37','2020-09-30 10:30:27');
INSERT INTO searches VALUES('37','Realme x2','1','2020-08-03 16:35:15','2020-08-03 16:35:15');
INSERT INTO searches VALUES('38','Earphones','9','2020-08-04 11:26:04','2020-10-01 21:19:38');
INSERT INTO searches VALUES('39','Google','2','2020-08-04 12:59:41','2020-11-21 06:28:48');
INSERT INTO searches VALUES('40','Tv','6','2020-08-05 09:09:11','2020-12-07 14:52:40');
INSERT INTO searches VALUES('41','nokia','1','2020-08-05 09:09:35','2020-08-05 09:09:35');
INSERT INTO searches VALUES('42','Running shoes','1','2020-08-06 10:46:29','2020-08-06 10:46:29');
INSERT INTO searches VALUES('43','Running spikes','1','2020-08-06 10:47:16','2020-08-06 10:47:16');
INSERT INTO searches VALUES('44','Boxer for men','2','2020-08-07 14:38:34','2020-08-07 14:38:39');
INSERT INTO searches VALUES('45','Boxer','2','2020-08-07 14:39:06','2020-08-07 14:40:52');
INSERT INTO searches VALUES('46','mixture grinder','2','2020-08-07 15:20:34','2020-08-07 15:20:42');
INSERT INTO searches VALUES('47','baby carier','3','2020-08-07 17:40:12','2020-08-07 17:40:20');
INSERT INTO searches VALUES('48','Intex mobile','8','2020-08-13 15:35:07','2020-08-13 15:35:34');
INSERT INTO searches VALUES('49','Intex+mobile','3','2020-08-13 15:35:07','2020-08-13 15:35:32');
INSERT INTO searches VALUES('50','Itel mobile','8','2020-08-13 17:02:53','2020-08-13 17:03:10');
INSERT INTO searches VALUES('51','Itel+mobile','2','2020-08-13 17:02:55','2020-08-13 17:03:12');
INSERT INTO searches VALUES('52','Mobile phone','12','2020-08-13 17:05:13','2020-10-19 06:41:43');
INSERT INTO searches VALUES('53','Mobile+phone+','1','2020-08-13 17:05:14','2020-08-13 17:05:14');
INSERT INTO searches VALUES('54','Slim belt','1','2020-08-14 12:32:00','2020-08-14 12:32:00');
INSERT INTO searches VALUES('55','Intex','11','2020-08-14 15:35:25','2020-08-14 15:35:34');
INSERT INTO searches VALUES('56','Boya','5','2020-08-15 06:47:26','2020-11-27 15:39:04');
INSERT INTO searches VALUES('57','Boya by m1','6','2020-08-15 06:48:32','2020-08-15 06:49:05');
INSERT INTO searches VALUES('58','acer','1','2020-08-15 06:49:17','2020-08-15 06:49:17');
INSERT INTO searches VALUES('59','Sandal','1','2020-08-15 09:08:25','2020-08-15 09:08:25');
INSERT INTO searches VALUES('60','Boya mic','2','2020-08-15 16:47:47','2020-08-15 16:47:54');
INSERT INTO searches VALUES('61','Mic','3','2020-08-15 16:48:01','2020-08-15 16:49:43');
INSERT INTO searches VALUES('62','Bag','8','2020-08-15 17:24:01','2020-12-07 07:25:46');
INSERT INTO searches VALUES('63','Boot','5','2020-08-15 17:24:08','2020-08-15 17:24:22');
INSERT INTO searches VALUES('64','mobile','6','2020-08-19 07:15:50','2020-12-06 10:14:59');
INSERT INTO searches VALUES('65','Gorilla tripod','2','2020-08-19 13:52:55','2020-08-19 13:53:08');
INSERT INTO searches VALUES('66','tripod','1','2020-08-19 13:53:21','2020-08-19 13:53:21');
INSERT INTO searches VALUES('67','shirt for men','1','2020-08-20 18:41:49','2020-08-20 18:41:49');
INSERT INTO searches VALUES('68','Belt','1','2020-08-20 21:20:29','2020-08-20 21:20:29');
INSERT INTO searches VALUES('69','Mouse','4','2020-08-21 08:36:35','2020-08-27 16:08:12');
INSERT INTO searches VALUES('70','computer mouse','1','2020-08-21 08:37:01','2020-08-21 08:37:01');
INSERT INTO searches VALUES('71','Grinder','2','2020-08-22 07:19:23','2020-08-22 07:19:27');
INSERT INTO searches VALUES('72','Women cloth','7','2020-08-22 13:41:55','2021-07-29 19:41:24');
INSERT INTO searches VALUES('73','Women clothing','1','2020-08-22 13:42:13','2020-08-22 13:42:13');
INSERT INTO searches VALUES('74','Guitar','8','2020-08-26 12:07:38','2020-08-26 12:10:43');
INSERT INTO searches VALUES('75','Keyboard','1','2020-08-28 14:07:26','2020-08-28 14:07:26');
INSERT INTO searches VALUES('76','Mike','1','2020-08-28 14:11:22','2020-08-28 14:11:22');
INSERT INTO searches VALUES('77','Sweat Slim Belt','3','2020-08-28 17:40:45','2020-10-01 18:50:52');
INSERT INTO searches VALUES('78','plastic pot','1','2020-09-03 19:05:25','2020-09-03 19:05:25');
INSERT INTO searches VALUES('79','3 in 1 trimmer','1','2020-09-03 23:01:35','2020-09-03 23:01:35');
INSERT INTO searches VALUES('80','leather bag','2','2020-09-06 06:35:26','2020-11-30 22:59:52');
INSERT INTO searches VALUES('81','Meansural cup','4','2020-09-06 23:53:49','2020-09-06 23:53:52');
INSERT INTO searches VALUES('82','Meansural+cup','1','2020-09-06 23:53:51','2020-09-06 23:53:51');
INSERT INTO searches VALUES('83','Pant','3','2020-09-08 19:03:23','2020-09-08 19:03:53');
INSERT INTO searches VALUES('84','Android app development','1','2020-09-08 21:24:17','2020-09-08 21:24:17');
INSERT INTO searches VALUES('85','Laptop','12','2020-09-08 21:30:23','2022-12-11 23:26:36');
INSERT INTO searches VALUES('86','Solar light','1','2020-09-09 12:07:48','2020-09-09 12:07:48');
INSERT INTO searches VALUES('87','Saree','1','2020-09-11 20:33:17','2020-09-11 20:33:17');
INSERT INTO searches VALUES('88','trimmer','5','2020-09-12 06:33:29','2020-11-30 09:20:08');
INSERT INTO searches VALUES('89','Dog','1','2020-09-12 12:29:40','2020-09-12 12:29:40');
INSERT INTO searches VALUES('90','purse','5','2020-09-12 21:07:00','2020-09-26 05:10:54');
INSERT INTO searches VALUES('91','hand purse','1','2020-09-14 18:01:23','2020-09-14 18:01:23');
INSERT INTO searches VALUES('92','ladiesbag','1','2020-09-14 18:01:37','2020-09-14 18:01:37');
INSERT INTO searches VALUES('93','Watches','3','2020-09-18 16:41:08','2020-11-18 07:27:08');
INSERT INTO searches VALUES('94','Sleeping bag','1','2020-09-29 16:04:11','2020-09-29 16:04:11');
INSERT INTO searches VALUES('95','face','1','2020-10-01 11:48:55','2020-10-01 11:48:55');
INSERT INTO searches VALUES('96','head phone with microphone','3','2020-10-02 10:43:26','2020-10-02 10:44:35');
INSERT INTO searches VALUES('97','realme','2','2020-10-03 10:57:58','2020-10-03 10:59:22');
INSERT INTO searches VALUES('98','Miksar','2','2020-10-04 17:50:52','2020-10-04 17:50:54');
INSERT INTO searches VALUES('99','Grender','1','2020-10-04 17:51:13','2020-10-04 17:51:13');
INSERT INTO searches VALUES('100','laptops','2','2020-10-05 09:39:59','2020-11-29 20:54:54');
INSERT INTO searches VALUES('101','oven','1','2020-10-05 10:19:01','2020-10-05 10:19:01');
INSERT INTO searches VALUES('102','Skin product','2','2020-10-05 17:52:33','2020-10-05 17:52:34');
INSERT INTO searches VALUES('103','a','1','2020-10-06 09:18:53','2020-10-06 09:18:53');
INSERT INTO searches VALUES('104','kayaplus','1','2020-10-07 08:56:46','2020-10-07 08:56:46');
INSERT INTO searches VALUES('105','Gimbal','1','2020-10-09 20:27:46','2020-10-09 20:27:46');
INSERT INTO searches VALUES('106','Hand watch','1','2020-10-09 21:14:42','2020-10-09 21:14:42');
INSERT INTO searches VALUES('107','Tshrt','3','2020-10-11 09:41:40','2020-10-11 09:41:58');
INSERT INTO searches VALUES('108','Cloth','2','2020-10-11 18:35:27','2020-10-11 18:35:40');
INSERT INTO searches VALUES('109','Shoes for girls','2','2020-10-17 09:09:42','2020-10-17 09:09:45');
INSERT INTO searches VALUES('110','Hair iron','1','2020-10-17 12:44:56','2020-10-17 12:44:56');
INSERT INTO searches VALUES('111','coats','1','2020-10-21 08:15:32','2020-10-21 08:15:32');
INSERT INTO searches VALUES('112','Nike','2','2020-10-22 09:28:17','2020-10-22 09:28:27');
INSERT INTO searches VALUES('113','pw.@mymandu123#','1','2020-10-23 10:18:08','2020-10-23 10:18:08');
INSERT INTO searches VALUES('114','sun','2','2020-10-27 11:50:28','2020-10-27 11:55:55');
INSERT INTO searches VALUES('115','sunglasses','1','2020-10-27 11:53:39','2020-10-27 11:53:39');
INSERT INTO searches VALUES('116','oil','1','2020-10-30 21:03:28','2020-10-30 21:03:28');
INSERT INTO searches VALUES('117','finger sleeve','1','2020-11-02 13:19:15','2020-11-02 13:19:15');
INSERT INTO searches VALUES('118','airpod','1','2020-11-02 14:54:25','2020-11-02 14:54:25');
INSERT INTO searches VALUES('119','airpod case','1','2020-11-02 14:54:35','2020-11-02 14:54:35');
INSERT INTO searches VALUES('120','Realme c11','4','2020-11-02 17:09:00','2020-11-02 17:09:58');
INSERT INTO searches VALUES('121','canvas','1','2020-11-03 12:45:19','2020-11-03 12:45:19');
INSERT INTO searches VALUES('122','stylish bag','2','2020-11-04 11:41:38','2020-12-09 06:34:43');
INSERT INTO searches VALUES('123','mens luggage bag','2','2020-11-05 19:19:34','2020-12-09 06:34:35');
INSERT INTO searches VALUES('124','Trouser sut for man','3','2020-11-05 20:09:41','2020-11-05 20:09:46');
INSERT INTO searches VALUES('125','Trouser','1','2020-11-05 20:09:54','2020-11-05 20:09:54');
INSERT INTO searches VALUES('126','latest shoes','2','2020-11-06 07:40:57','2020-11-07 18:32:54');
INSERT INTO searches VALUES('127','cup','1','2020-11-06 12:04:00','2020-11-06 12:04:00');
INSERT INTO searches VALUES('128','combo','1','2020-11-06 13:36:56','2020-11-06 13:36:56');
INSERT INTO searches VALUES('129','stemer','2','2020-11-07 06:49:14','2020-11-07 07:01:43');
INSERT INTO searches VALUES('130','gta 5','4','2020-11-07 18:31:10','2020-11-07 18:31:38');
INSERT INTO searches VALUES('131','games','1','2020-11-07 18:31:56','2020-11-07 18:31:56');
INSERT INTO searches VALUES('132','walet','1','2020-11-08 14:47:18','2020-11-08 14:47:18');
INSERT INTO searches VALUES('133','Exfoliator','3','2020-11-08 20:07:33','2020-11-08 20:07:52');
INSERT INTO searches VALUES('134','Boom','1','2020-11-10 15:49:07','2020-11-10 15:49:07');
INSERT INTO searches VALUES('135','t shirt','1','2020-11-10 18:13:28','2020-11-10 18:13:28');
INSERT INTO searches VALUES('136','Ram','1','2020-11-11 13:51:04','2020-11-11 13:51:04');
INSERT INTO searches VALUES('137','Finger sleeves','1','2020-11-11 19:01:22','2020-11-11 19:01:22');
INSERT INTO searches VALUES('138','Pubg','1','2020-11-11 19:01:38','2020-11-11 19:01:38');
INSERT INTO searches VALUES('139','Iphone 11','1','2020-11-11 19:30:37','2020-11-11 19:30:37');
INSERT INTO searches VALUES('140','Hoodies','4','2020-11-11 19:37:18','2020-11-18 17:27:08');
INSERT INTO searches VALUES('141','amazon alexa','1','2020-11-13 13:19:32','2020-11-13 13:19:32');
INSERT INTO searches VALUES('142','smart speaker','1','2020-11-13 13:20:27','2020-11-13 13:20:27');
INSERT INTO searches VALUES('143','Shoes for men','2','2020-11-13 14:58:11','2020-11-13 15:00:09');
INSERT INTO searches VALUES('144','Books','1','2020-11-13 21:29:32','2020-11-13 21:29:32');
INSERT INTO searches VALUES('145','Watch women','1','2020-11-15 22:43:44','2020-11-15 22:43:44');
INSERT INTO searches VALUES('146','Mens wear','1','2020-11-17 07:42:39','2020-11-17 07:42:39');
INSERT INTO searches VALUES('147','Smartwatch','1','2020-11-17 12:08:58','2020-11-17 12:08:58');
INSERT INTO searches VALUES('148','Trench coats','1','2020-11-17 20:08:32','2020-11-17 20:08:32');
INSERT INTO searches VALUES('149','All','3','2020-11-18 07:12:16','2020-11-18 07:13:42');
INSERT INTO searches VALUES('150','Cloths','3','2020-11-18 07:12:33','2020-11-30 06:30:13');
INSERT INTO searches VALUES('151','Shose','2','2020-11-18 07:12:46','2020-11-18 07:13:35');
INSERT INTO searches VALUES('152','Macbook','1','2020-11-18 12:34:13','2020-11-18 12:34:13');
INSERT INTO searches VALUES('153','Router','5','2020-11-18 15:23:29','2020-11-18 15:24:22');
INSERT INTO searches VALUES('154','Franiture','1','2020-11-18 16:54:15','2020-11-18 16:54:15');
INSERT INTO searches VALUES('155','Tshirts','1','2020-11-18 17:26:47','2020-11-18 17:26:47');
INSERT INTO searches VALUES('156','Dish washer gloves','2','2020-11-18 18:38:46','2020-11-18 18:39:15');
INSERT INTO searches VALUES('157','Camera','1','2020-11-19 07:39:37','2020-11-19 07:39:37');
INSERT INTO searches VALUES('158','electric bbq grill','2','2020-11-19 09:07:26','2020-11-19 09:09:15');
INSERT INTO searches VALUES('159','Silicon foot wear','2','2020-11-20 08:08:50','2020-12-01 16:02:51');
INSERT INTO searches VALUES('160','Rodpanty','1','2020-11-20 13:03:44','2020-11-20 13:03:44');
INSERT INTO searches VALUES('161','heater','1','2020-11-20 15:56:41','2020-11-20 15:56:41');
INSERT INTO searches VALUES('162','weight gaining products','1','2020-11-20 20:22:42','2020-11-20 20:22:42');
INSERT INTO searches VALUES('163','Dell','1','2020-11-21 04:28:53','2020-11-21 04:28:53');
INSERT INTO searches VALUES('164','guggle','3','2020-11-21 06:29:20','2020-11-21 06:29:33');
INSERT INTO searches VALUES('165','guggleचस्मा','1','2020-11-21 06:30:14','2020-11-21 06:30:14');
INSERT INTO searches VALUES('166','चस्मा','1','2020-11-21 06:31:09','2020-11-21 06:31:09');
INSERT INTO searches VALUES('167','Hoodi','1','2020-11-21 06:59:58','2020-11-21 06:59:58');
INSERT INTO searches VALUES('168','Nivea shoes','2','2020-11-21 08:06:35','2020-11-21 08:06:39');
INSERT INTO searches VALUES('169','Nevia shoes','1','2020-11-21 08:07:35','2020-11-21 08:07:35');
INSERT INTO searches VALUES('170','Condom','1','2020-11-21 14:01:05','2020-11-21 14:01:05');
INSERT INTO searches VALUES('171','Realme mobile phone','1','2020-11-22 04:55:51','2020-11-22 04:55:51');
INSERT INTO searches VALUES('172','jug','2','2020-11-22 07:32:03','2020-12-07 08:59:45');
INSERT INTO searches VALUES('173','32'' led tv','1','2020-11-22 16:26:40','2020-11-22 16:26:40');
INSERT INTO searches VALUES('174','Allstar','1','2020-11-24 08:21:11','2020-11-24 08:21:11');
INSERT INTO searches VALUES('175','Converse','2','2020-11-24 08:21:28','2020-11-24 08:21:35');
INSERT INTO searches VALUES('176','Glasses','4','2020-11-25 07:20:19','2020-11-25 07:20:29');
INSERT INTO searches VALUES('177','Steamer','1','2020-11-25 12:26:38','2020-11-25 12:26:38');
INSERT INTO searches VALUES('178','sunglass','1','2020-11-25 19:48:17','2020-11-25 19:48:17');
INSERT INTO searches VALUES('179','Hade phone','1','2020-11-25 20:22:32','2020-11-25 20:22:32');
INSERT INTO searches VALUES('180','Ear phone','1','2020-11-25 20:22:50','2020-11-25 20:22:50');
INSERT INTO searches VALUES('181','Baby diper','1','2020-11-25 22:38:00','2020-11-25 22:38:00');
INSERT INTO searches VALUES('182','study lamp','1','2020-11-26 16:30:52','2020-11-26 16:30:52');
INSERT INTO searches VALUES('183','Tik tok stan','1','2020-11-26 18:21:18','2020-11-26 18:21:18');
INSERT INTO searches VALUES('184','Iphone','1','2020-11-26 19:02:27','2020-11-26 19:02:27');
INSERT INTO searches VALUES('185','Steam inhaler','1','2020-11-27 09:06:35','2020-11-27 09:06:35');
INSERT INTO searches VALUES('186','gkk 360','1','2020-11-27 10:03:30','2020-11-27 10:03:30');
INSERT INTO searches VALUES('187','mobile case','1','2020-11-27 10:03:43','2020-11-27 10:03:43');
INSERT INTO searches VALUES('188','pu all in one wallet','1','2020-11-27 10:06:00','2020-11-27 10:06:00');
INSERT INTO searches VALUES('189','redmi 9a','1','2020-11-27 10:57:45','2020-11-27 10:57:45');
INSERT INTO searches VALUES('190','baby dress','1','2020-11-27 18:37:26','2020-11-27 18:37:26');
INSERT INTO searches VALUES('191','Colour ful electric jug 2 litter','3','2020-11-27 21:50:10','2020-11-27 21:50:28');
INSERT INTO searches VALUES('192','Utensil washing gloves','3','2020-11-27 22:14:43','2020-11-27 22:14:49');
INSERT INTO searches VALUES('193','Globes','2','2020-11-27 22:15:03','2020-11-27 22:15:03');
INSERT INTO searches VALUES('194','Gloves','2','2020-11-27 22:15:10','2022-03-30 12:34:04');
INSERT INTO searches VALUES('195','Cupboard','4','2020-11-28 18:13:02','2020-11-28 18:13:10');
INSERT INTO searches VALUES('196','Nonsty pan','1','2020-11-28 19:49:06','2020-11-28 19:49:06');
INSERT INTO searches VALUES('197','pan','1','2020-11-28 19:49:12','2020-11-28 19:49:12');
INSERT INTO searches VALUES('198','p','1','2020-11-28 19:49:35','2020-11-28 19:49:35');
INSERT INTO searches VALUES('199','Fry pan','1','2020-11-28 19:49:48','2020-11-28 19:49:48');
INSERT INTO searches VALUES('200','erkie','4','2020-11-28 19:52:49','2020-11-28 19:54:27');
INSERT INTO searches VALUES('201','Sex toyes','2','2020-11-28 19:55:24','2020-11-28 19:55:26');
INSERT INTO searches VALUES('202','curtains','1','2020-11-29 05:13:27','2020-11-29 05:13:27');
INSERT INTO searches VALUES('203','glass','2','2020-11-29 07:58:34','2020-11-29 07:58:57');
INSERT INTO searches VALUES('204','glass for men','1','2020-11-29 07:58:48','2020-11-29 07:58:48');
INSERT INTO searches VALUES('205','Winter jacket','2','2020-11-29 08:10:10','2020-11-29 08:10:11');
INSERT INTO searches VALUES('206','School bags','2','2020-11-29 12:41:43','2020-11-29 12:41:46');
INSERT INTO searches VALUES('207','Digital taraju','1','2020-11-29 19:09:10','2020-11-29 19:09:10');
INSERT INTO searches VALUES('208','Mobile cover','1','2020-11-29 19:20:35','2020-11-29 19:20:35');
INSERT INTO searches VALUES('209','Usupso','1','2020-11-29 20:24:42','2020-11-29 20:24:42');
INSERT INTO searches VALUES('210','Dell laptops','1','2020-11-29 20:56:19','2020-11-29 20:56:19');
INSERT INTO searches VALUES('211','table','1','2020-11-30 08:56:31','2020-11-30 08:56:31');
INSERT INTO searches VALUES('212','Hainek','1','2020-11-30 11:54:35','2020-11-30 11:54:35');
INSERT INTO searches VALUES('213','Electric ketle','1','2020-11-30 16:33:45','2020-11-30 16:33:45');
INSERT INTO searches VALUES('214','School bag','2','2020-11-30 17:04:51','2020-11-30 17:05:00');
INSERT INTO searches VALUES('215','Jocket jeans','2','2020-11-30 17:27:12','2020-11-30 17:27:20');
INSERT INTO searches VALUES('216','Jocket','1','2020-11-30 17:27:57','2020-11-30 17:27:57');
INSERT INTO searches VALUES('217','gold star','1','2020-11-30 20:25:44','2020-11-30 20:25:44');
INSERT INTO searches VALUES('218','leather jacket','1','2020-11-30 22:59:37','2020-11-30 22:59:37');
INSERT INTO searches VALUES('219','Eye wash cup','4','2020-12-01 19:46:27','2020-12-01 19:46:52');
INSERT INTO searches VALUES('220','Womens clothing','2','2020-12-02 12:25:12','2020-12-02 12:25:29');
INSERT INTO searches VALUES('221','Folding daraz','1','2020-12-04 11:37:17','2020-12-04 11:37:17');
INSERT INTO searches VALUES('222','coat','1','2020-12-04 14:10:26','2020-12-04 14:10:26');
INSERT INTO searches VALUES('223','Cumin seeds','1','2020-12-05 11:54:46','2020-12-05 11:54:46');
INSERT INTO searches VALUES('224','drone','1','2020-12-05 14:11:02','2020-12-05 14:11:02');
INSERT INTO searches VALUES('225','Jackets','2','2020-12-05 19:38:34','2020-12-05 19:38:45');
INSERT INTO searches VALUES('226','Shoose','5','2020-12-06 10:12:13','2020-12-06 10:12:29');
INSERT INTO searches VALUES('227','Hoods uman','1','2020-12-06 10:12:55','2020-12-06 10:12:55');
INSERT INTO searches VALUES('228','Hoods','9','2020-12-06 10:13:05','2020-12-06 10:13:26');
INSERT INTO searches VALUES('229','Hood women','1','2020-12-06 10:13:47','2020-12-06 10:13:47');
INSERT INTO searches VALUES('230','Hoods women','1','2020-12-06 10:14:09','2020-12-06 10:14:09');
INSERT INTO searches VALUES('231','Luga','2','2020-12-06 10:14:18','2020-12-06 10:14:21');
INSERT INTO searches VALUES('232','Shoping','2','2020-12-06 10:14:33','2020-12-06 10:14:36');
INSERT INTO searches VALUES('233','Brss','1','2020-12-06 10:14:49','2020-12-06 10:14:49');
INSERT INTO searches VALUES('234','Adidas mens shoes','1','2020-12-06 16:39:07','2020-12-06 16:39:07');
INSERT INTO searches VALUES('235','Electric jag','5','2020-12-06 18:29:11','2020-12-06 18:29:27');
INSERT INTO searches VALUES('236','Memory card','3','2020-12-07 05:12:41','2020-12-13 08:30:28');
INSERT INTO searches VALUES('237','Shoes for geans','1','2020-12-07 07:31:28','2020-12-07 07:31:28');
INSERT INTO searches VALUES('238','Shoes for jeans','2','2020-12-07 07:31:42','2020-12-07 07:31:51');
INSERT INTO searches VALUES('239','Jaket','1','2020-12-07 08:22:23','2020-12-07 08:22:23');
INSERT INTO searches VALUES('240','Nike shoes','1','2020-12-07 13:15:58','2020-12-07 13:15:58');
INSERT INTO searches VALUES('241','shoes men','1','2020-12-07 13:16:35','2020-12-07 13:16:35');
INSERT INTO searches VALUES('242','Tab','2','2020-12-08 11:56:13','2020-12-08 11:57:57');
INSERT INTO searches VALUES('243','Tabs','1','2020-12-08 11:58:35','2020-12-08 11:58:35');
INSERT INTO searches VALUES('244','trekking bag','1','2020-12-09 06:33:27','2020-12-09 06:33:27');
INSERT INTO searches VALUES('245','bags','1','2020-12-09 06:33:33','2020-12-09 06:33:33');
INSERT INTO searches VALUES('246','travel bag','1','2020-12-09 06:34:01','2020-12-09 06:34:01');
INSERT INTO searches VALUES('247','grey taps sport bag','1','2020-12-09 06:34:15','2020-12-09 06:34:15');
INSERT INTO searches VALUES('248','luggage bag','1','2020-12-09 06:34:23','2020-12-09 06:34:23');
INSERT INTO searches VALUES('249','lether bag','1','2020-12-09 06:34:51','2020-12-09 06:34:51');
INSERT INTO searches VALUES('250','electric rice cooker','3','2020-12-09 12:46:44','2020-12-09 12:48:22');
INSERT INTO searches VALUES('251','Tiktok stand','1','2020-12-09 18:47:07','2020-12-09 18:47:07');
INSERT INTO searches VALUES('252','snikers shoes','1','2020-12-10 13:29:53','2020-12-10 13:29:53');
INSERT INTO searches VALUES('253','Jeans','3','2020-12-11 06:41:13','2020-12-11 06:41:25');
INSERT INTO searches VALUES('254','Vivo','3','2020-12-11 13:00:41','2020-12-11 13:01:20');
INSERT INTO searches VALUES('255','hand globs','1','2020-12-11 14:21:17','2020-12-11 14:21:17');
INSERT INTO searches VALUES('256','Cat food','1','2021-01-24 10:04:33','2021-01-24 10:04:33');
INSERT INTO searches VALUES('257','Facewash','1','2021-02-03 12:31:17','2021-02-03 12:31:17');
INSERT INTO searches VALUES('258','YsJP','5','2021-04-18 00:09:15','2021-04-18 00:09:44');
INSERT INTO searches VALUES('259','9855','1','2021-04-18 00:09:25','2021-04-18 00:09:25');
INSERT INTO searches VALUES('260','YsJP).')..,"((','1','2021-04-18 00:09:28','2021-04-18 00:09:28');
INSERT INTO searches VALUES('261','YsJP'dmwDFL<'">UkMmVX','1','2021-04-18 00:09:31','2021-04-18 00:09:31');
INSERT INTO searches VALUES('262','YdDu','5','2021-04-18 16:44:59','2021-04-18 16:45:33');
INSERT INTO searches VALUES('263','8341','1','2021-04-18 16:45:09','2021-04-18 16:45:09');
INSERT INTO searches VALUES('264','YdDu(,..',,.,"','1','2021-04-18 16:45:15','2021-04-18 16:45:15');
INSERT INTO searches VALUES('265','YdDu'KtrCGX<'">qcWAaW','1','2021-04-18 16:45:21','2021-04-18 16:45:21');
INSERT INTO searches VALUES('266','ofEP','5','2021-04-29 23:21:11','2021-04-29 23:21:39');
INSERT INTO searches VALUES('267','3530','1','2021-04-29 23:21:20','2021-04-29 23:21:20');
INSERT INTO searches VALUES('268','ofEP(.'),(.".)','1','2021-04-29 23:21:24','2021-04-29 23:21:24');
INSERT INTO searches VALUES('269','ofEP'MmQvwU<'">xbNbrM','1','2021-04-29 23:21:27','2021-04-29 23:21:27');
INSERT INTO searches VALUES('270','EGrb','17','2021-05-02 04:15:21','2021-05-02 04:16:36');
INSERT INTO searches VALUES('271','2634','1','2021-05-02 04:15:45','2021-05-02 04:15:45');
INSERT INTO searches VALUES('272','EGrb(.().,,',"','1','2021-05-02 04:15:50','2021-05-02 04:15:50');
INSERT INTO searches VALUES('273','EGrb'DfxQIj<'">Kpnxda','1','2021-05-02 04:15:55','2021-05-02 04:15:55');
INSERT INTO searches VALUES('274','oRrt','2','2021-05-02 04:18:26','2021-05-02 04:18:32');
INSERT INTO searches VALUES('275','zWVr','14','2021-05-03 07:51:23','2021-05-03 07:52:23');
INSERT INTO searches VALUES('276','7678','1','2021-05-03 07:51:30','2021-05-03 07:51:30');
INSERT INTO searches VALUES('277','zWVr",.))...')','1','2021-05-03 07:51:34','2021-05-03 07:51:34');
INSERT INTO searches VALUES('278','zWVr'HWSxHZ<'">rfmfSj','1','2021-05-03 07:51:38','2021-05-03 07:51:38');
INSERT INTO searches VALUES('279','EJNC','5','2021-05-03 07:53:13','2021-05-03 07:53:28');
INSERT INTO searches VALUES('280','KmUs','14','2021-05-03 21:42:27','2021-05-03 21:43:16');
INSERT INTO searches VALUES('281','7124','1','2021-05-03 21:42:34','2021-05-03 21:42:34');
INSERT INTO searches VALUES('282','KmUs.'()(.)(("','1','2021-05-03 21:42:36','2021-05-03 21:42:36');
INSERT INTO searches VALUES('283','KmUs'GwjCPv<'">uqJyZA','1','2021-05-03 21:42:39','2021-05-03 21:42:39');
INSERT INTO searches VALUES('284','KMam','5','2021-05-03 21:43:19','2021-05-03 21:43:33');
INSERT INTO searches VALUES('285','HYVS','5','2021-05-04 19:59:58','2021-05-04 20:00:21');
INSERT INTO searches VALUES('286','2456','1','2021-05-04 20:00:05','2021-05-04 20:00:05');
INSERT INTO searches VALUES('287','HYVS)',)),,.."','1','2021-05-04 20:00:08','2021-05-04 20:00:08');
INSERT INTO searches VALUES('288','HYVS'TDROcC<'">obzLoF','1','2021-05-04 20:00:11','2021-05-04 20:00:11');
INSERT INTO searches VALUES('289','Pfwd','14','2021-05-04 20:02:28','2021-05-04 20:03:27');
INSERT INTO searches VALUES('290','ZUeN','17','2021-05-07 12:17:06','2021-05-07 12:18:13');
INSERT INTO searches VALUES('291','8088','1','2021-05-07 12:17:25','2021-05-07 12:17:25');
INSERT INTO searches VALUES('292','ZUeN)'",)),(()','1','2021-05-07 12:17:29','2021-05-07 12:17:29');
INSERT INTO searches VALUES('293','ZUeN'HzSydj<'">cyaLLl','1','2021-05-07 12:17:32','2021-05-07 12:17:32');
INSERT INTO searches VALUES('294','CtaF','2','2021-05-07 12:19:04','2021-05-07 12:19:07');
INSERT INTO searches VALUES('295','XvhB','5','2021-05-08 13:36:55','2021-05-08 13:37:21');
INSERT INTO searches VALUES('296','6024','1','2021-05-08 13:37:03','2021-05-08 13:37:03');
INSERT INTO searches VALUES('297','XvhB))"'...(.,','1','2021-05-08 13:37:07','2021-05-08 13:37:07');
INSERT INTO searches VALUES('298','XvhB'zvKRjy<'">ikSZyH','1','2021-05-08 13:37:10','2021-05-08 13:37:10');
INSERT INTO searches VALUES('299','oBYY','14','2021-05-08 13:39:34','2021-05-08 13:40:23');
INSERT INTO searches VALUES('300','Iqpn','14','2021-05-09 17:55:57','2021-05-09 17:56:54');
INSERT INTO searches VALUES('301','2256','1','2021-05-09 17:56:05','2021-05-09 17:56:05');
INSERT INTO searches VALUES('302','Iqpn.).,")',()','1','2021-05-09 17:56:09','2021-05-09 17:56:09');
INSERT INTO searches VALUES('303','Iqpn'iUCjTK<'">lBbThx','1','2021-05-09 17:56:13','2021-05-09 17:56:13');
INSERT INTO searches VALUES('304','CPHf','5','2021-05-09 17:57:09','2021-05-09 17:57:24');
INSERT INTO searches VALUES('305','SGwu','5','2021-05-10 08:34:57','2021-05-10 08:35:24');
INSERT INTO searches VALUES('306','6346','1','2021-05-10 08:35:05','2021-05-10 08:35:05');
INSERT INTO searches VALUES('307','SGwu,'),("(),.','1','2021-05-10 08:35:09','2021-05-10 08:35:09');
INSERT INTO searches VALUES('308','SGwu'WBSObN<'">qfJAVG','1','2021-05-10 08:35:13','2021-05-10 08:35:13');
INSERT INTO searches VALUES('309','faAd','14','2021-05-10 08:36:34','2021-05-10 08:37:24');
INSERT INTO searches VALUES('310','UfVf','5','2021-05-11 19:36:00','2021-05-11 19:36:24');
INSERT INTO searches VALUES('311','9290','1','2021-05-11 19:36:07','2021-05-11 19:36:07');
INSERT INTO searches VALUES('312','UfVf.))))("(',','1','2021-05-11 19:36:10','2021-05-11 19:36:10');
INSERT INTO searches VALUES('313','UfVf'IsaTJY<'">FWAUhr','1','2021-05-11 19:36:14','2021-05-11 19:36:14');
INSERT INTO searches VALUES('314','Zfmv','14','2021-05-11 19:36:28','2021-05-11 19:37:12');
INSERT INTO searches VALUES('315','XijQ','5','2021-05-13 06:55:00','2021-05-13 06:55:21');
INSERT INTO searches VALUES('316','2820','1','2021-05-13 06:55:07','2021-05-13 06:55:07');
INSERT INTO searches VALUES('317','XijQ'(..,,(".(','1','2021-05-13 06:55:09','2021-05-13 06:55:09');
INSERT INTO searches VALUES('318','XijQ'LyeVDz<'">RdhbpV','1','2021-05-13 06:55:12','2021-05-13 06:55:12');
INSERT INTO searches VALUES('319','ozKR','14','2021-05-13 06:57:11','2021-05-13 06:58:00');
INSERT INTO searches VALUES('320','Kipb','14','2021-05-15 23:06:36','2021-05-15 23:08:09');
INSERT INTO searches VALUES('321','9762','1','2021-05-15 23:07:06','2021-05-15 23:07:06');
INSERT INTO searches VALUES('322','Kipb,.)'.)".),','1','2021-05-15 23:07:27','2021-05-15 23:07:27');
INSERT INTO searches VALUES('323','Kipb'QEcQRd<'">uKxNud','1','2021-05-15 23:07:33','2021-05-15 23:07:33');
INSERT INTO searches VALUES('324','iGdA','6','2021-05-15 23:08:13','2021-05-15 23:13:55');
INSERT INTO searches VALUES('325','NLjl','17','2021-05-19 14:52:59','2021-05-19 14:53:51');
INSERT INTO searches VALUES('326','6329','1','2021-05-19 14:53:14','2021-05-19 14:53:14');
INSERT INTO searches VALUES('327','NLjl,,.."'(.))','1','2021-05-19 14:53:16','2021-05-19 14:53:16');
INSERT INTO searches VALUES('328','NLjl'VAAVXA<'">yWPcRs','1','2021-05-19 14:53:19','2021-05-19 14:53:19');
INSERT INTO searches VALUES('329','pVFs','2','2021-05-19 14:54:18','2021-05-19 14:54:22');
INSERT INTO searches VALUES('330','QeYw','88','2021-06-10 06:49:26','2021-06-10 06:57:47');
INSERT INTO searches VALUES('331','7637','1','2021-06-10 06:49:35','2021-06-10 06:49:35');
INSERT INTO searches VALUES('332','QeYw)',).,.,")','1','2021-06-10 06:49:39','2021-06-10 06:49:39');
INSERT INTO searches VALUES('333','QeYw'vvTYYh<'">dqRolS','1','2021-06-10 06:49:42','2021-06-10 06:49:42');
INSERT INTO searches VALUES('334','QeYw')/**/AND/**/4361=9629/**/AND/**/('uQnR'='uQnR','1','2021-06-10 06:49:50','2021-06-10 06:49:50');
INSERT INTO searches VALUES('335','QeYw')/**/AND/**/4184=4184/**/AND/**/('rOea'='rOea','1','2021-06-10 06:49:54','2021-06-10 06:49:54');
INSERT INTO searches VALUES('336','QeYw')/**/AND/**/8287=4605/**/AND/**/('ujBZ'='ujBZ','1','2021-06-10 06:49:58','2021-06-10 06:49:58');
INSERT INTO searches VALUES('337','QeYw'/**/AND/**/1533=2353/**/AND/**/'tmtR'='tmtR','1','2021-06-10 06:50:01','2021-06-10 06:50:01');
INSERT INTO searches VALUES('338','QeYw'/**/AND/**/4184=4184/**/AND/**/'aQMz'='aQMz','1','2021-06-10 06:50:04','2021-06-10 06:50:04');
INSERT INTO searches VALUES('339','QeYw'/**/AND/**/8544=9192/**/AND/**/'jCkQ'='jCkQ','1','2021-06-10 06:50:07','2021-06-10 06:50:07');
INSERT INTO searches VALUES('340','QeYw)/**/AND/**/4474=3119/**/AND/**/(7059=7059','1','2021-06-10 06:50:10','2021-06-10 06:50:10');
INSERT INTO searches VALUES('341','QeYw)/**/AND/**/4184=4184/**/AND/**/(9971=9971','1','2021-06-10 06:50:13','2021-06-10 06:50:13');
INSERT INTO searches VALUES('342','QeYw)/**/AND/**/3389=6137/**/AND/**/(8071=8071','1','2021-06-10 06:50:16','2021-06-10 06:50:16');
INSERT INTO searches VALUES('343','QeYw/**/AND/**/6761=5743','1','2021-06-10 06:50:18','2021-06-10 06:50:18');
INSERT INTO searches VALUES('344','QeYw/**/AND/**/4184=4184','1','2021-06-10 06:50:21','2021-06-10 06:50:21');
INSERT INTO searches VALUES('345','QeYw/**/AND/**/2763=1825','1','2021-06-10 06:50:24','2021-06-10 06:50:24');
INSERT INTO searches VALUES('346','QeYw/**/AND/**/1641=1920--/**/jBJa','1','2021-06-10 06:50:27','2021-06-10 06:50:27');
INSERT INTO searches VALUES('347','QeYw/**/AND/**/4184=4184--/**/odlP','1','2021-06-10 06:50:30','2021-06-10 06:50:30');
INSERT INTO searches VALUES('348','QeYw/**/AND/**/8251=4126--/**/htKx','1','2021-06-10 06:50:33','2021-06-10 06:50:33');
INSERT INTO searches VALUES('349','(SELECT/**/(CASE/**/WHEN/**/(1078=1256)/**/THEN/**/'QeYw'/**/ELSE/**/(SELECT/**/1256/**/UNION/**/SELECT/**/1222)/**/END))','1','2021-06-10 06:50:36','2021-06-10 06:50:36');
INSERT INTO searches VALUES('350','(SELECT/**/(CASE/**/WHEN/**/(1578=1578)/**/THEN/**/'QeYw'/**/ELSE/**/(SELECT/**/5131/**/UNION/**/SELECT/**/8858)/**/END))','1','2021-06-10 06:50:39','2021-06-10 06:50:39');
INSERT INTO searches VALUES('351','(SELECT/**/(CASE/**/WHEN/**/(1528=3795)/**/THEN/**/'QeYw'/**/ELSE/**/(SELECT/**/3795/**/UNION/**/SELECT/**/9358)/**/END))','1','2021-06-10 06:50:42','2021-06-10 06:50:42');
INSERT INTO searches VALUES('352','QeYw')/**/AND/**/EXTRACTVALUE(8863,CONCAT(0x5c,0x7162626a71,(SELECT/**/(ELT(8863=8863,1))),0x7162627671))/**/AND/**/('kQRM'='kQRM','1','2021-06-10 06:50:45','2021-06-10 06:50:45');
INSERT INTO searches VALUES('353','QeYw'/**/AND/**/EXTRACTVALUE(8863,CONCAT(0x5c,0x7162626a71,(SELECT/**/(ELT(8863=8863,1))),0x7162627671))/**/AND/**/'amPi'='amPi','1','2021-06-10 06:50:47','2021-06-10 06:50:47');
INSERT INTO searches VALUES('354','QeYw)/**/AND/**/EXTRACTVALUE(8863,CONCAT(0x5c,0x7162626a71,(SELECT/**/(ELT(8863=8863,1))),0x7162627671))/**/AND/**/(7003=7003','1','2021-06-10 06:50:50','2021-06-10 06:50:50');
INSERT INTO searches VALUES('355','QeYw/**/AND/**/EXTRACTVALUE(8863,CONCAT(0x5c,0x7162626a71,(SELECT/**/(ELT(8863=8863,1))),0x7162627671))','1','2021-06-10 06:50:53','2021-06-10 06:50:53');
INSERT INTO searches VALUES('356','QeYw/**/AND/**/EXTRACTVALUE(8863,CONCAT(0x5c,0x7162626a71,(SELECT/**/(ELT(8863=8863,1))),0x7162627671))--/**/mckd','1','2021-06-10 06:50:56','2021-06-10 06:50:56');
INSERT INTO searches VALUES('357','QeYw')/**/AND/**/6721=CAST((CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(6721=6721)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/('Uswr'='Uswr','1','2021-06-10 06:50:59','2021-06-10 06:50:59');
INSERT INTO searches VALUES('358','QeYw'/**/AND/**/6721=CAST((CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(6721=6721)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/'noPk'='noPk','1','2021-06-10 06:51:02','2021-06-10 06:51:02');
INSERT INTO searches VALUES('359','QeYw)/**/AND/**/6721=CAST((CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(6721=6721)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/(3532=3532','1','2021-06-10 06:51:06','2021-06-10 06:51:06');
INSERT INTO searches VALUES('360','QeYw/**/AND/**/6721=CAST((CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(6721=6721)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113))/**/AS/**/NUMERIC)','1','2021-06-10 06:51:09','2021-06-10 06:51:09');
INSERT INTO searches VALUES('361','QeYw/**/AND/**/6721=CAST((CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(6721=6721)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113))/**/AS/**/NUMERIC)--/**/aaAC','1','2021-06-10 06:51:11','2021-06-10 06:51:11');
INSERT INTO searches VALUES('362','QeYw')/**/AND/**/3197/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(98)+CHAR(98)+CHAR(106)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(3197=3197)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(98)+CHAR(98)+CHAR(118)+CHAR(113)))/**/AND/**/('NpJy'='NpJy','1','2021-06-10 06:51:14','2021-06-10 06:51:14');
INSERT INTO searches VALUES('363','QeYw'/**/AND/**/3197/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(98)+CHAR(98)+CHAR(106)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(3197=3197)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(98)+CHAR(98)+CHAR(118)+CHAR(113)))/**/AND/**/'bPpi'='bPpi','1','2021-06-10 06:51:17','2021-06-10 06:51:17');
INSERT INTO searches VALUES('364','QeYw)/**/AND/**/3197/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(98)+CHAR(98)+CHAR(106)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(3197=3197)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(98)+CHAR(98)+CHAR(118)+CHAR(113)))/**/AND/**/(8808=8808','1','2021-06-10 06:51:20','2021-06-10 06:51:20');
INSERT INTO searches VALUES('365','QeYw/**/AND/**/3197/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(98)+CHAR(98)+CHAR(106)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(3197=3197)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(98)+CHAR(98)+CHAR(118)+CHAR(113)))','1','2021-06-10 06:51:23','2021-06-10 06:51:23');
INSERT INTO searches VALUES('366','QeYw/**/AND/**/3197/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(98)+CHAR(98)+CHAR(106)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(3197=3197)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(98)+CHAR(98)+CHAR(118)+CHAR(113)))--/**/LUCo','1','2021-06-10 06:51:26','2021-06-10 06:51:26');
INSERT INTO searches VALUES('367','QeYw')/**/AND/**/6482=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(6482=6482)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/('BrNA'='BrNA','1','2021-06-10 06:51:29','2021-06-10 06:51:29');
INSERT INTO searches VALUES('368','QeYw'/**/AND/**/6482=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(6482=6482)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/'iamq'='iamq','1','2021-06-10 06:51:31','2021-06-10 06:51:31');
INSERT INTO searches VALUES('369','QeYw)/**/AND/**/6482=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(6482=6482)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/(4460=4460','1','2021-06-10 06:51:34','2021-06-10 06:51:34');
INSERT INTO searches VALUES('370','QeYw/**/AND/**/6482=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(6482=6482)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)','1','2021-06-10 06:51:38','2021-06-10 06:51:38');
INSERT INTO searches VALUES('371','QeYw/**/AND/**/6482=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(98)||CHR(98)||CHR(106)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(6482=6482)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(98)||CHR(98)||CHR(118)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)--/**/uTpO','1','2021-06-10 06:51:40','2021-06-10 06:51:40');
INSERT INTO searches VALUES('372','(SELECT/**/CONCAT(CONCAT('qbbjq',(CASE/**/WHEN/**/(6209=6209)/**/THEN/**/'1'/**/ELSE/**/'0'/**/END)),'qbbvq'))','1','2021-06-10 06:51:43','2021-06-10 06:51:43');
INSERT INTO searches VALUES('373','QeYw');SELECT/**/PG_SLEEP(5)--','1','2021-06-10 06:51:46','2021-06-10 06:51:46');
INSERT INTO searches VALUES('374','QeYw';SELECT/**/PG_SLEEP(5)--','1','2021-06-10 06:51:49','2021-06-10 06:51:49');
INSERT INTO searches VALUES('375','QeYw);SELECT/**/PG_SLEEP(5)--','1','2021-06-10 06:51:51','2021-06-10 06:51:51');
INSERT INTO searches VALUES('376','QeYw;SELECT/**/PG_SLEEP(5)--','1','2021-06-10 06:51:54','2021-06-10 06:51:54');
INSERT INTO searches VALUES('377','QeYw');WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-10 06:51:57','2021-06-10 06:51:57');
INSERT INTO searches VALUES('378','QeYw';WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-10 06:52:00','2021-06-10 06:52:00');
INSERT INTO searches VALUES('379','QeYw);WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-10 06:52:03','2021-06-10 06:52:03');
INSERT INTO searches VALUES('380','QeYw;WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-10 06:52:06','2021-06-10 06:52:06');
INSERT INTO searches VALUES('381','QeYw');SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(75)||CHR(120)||CHR(78)||CHR(99),5)/**/FROM/**/DUAL--','1','2021-06-10 06:52:09','2021-06-10 06:52:09');
INSERT INTO searches VALUES('382','QeYw';SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(75)||CHR(120)||CHR(78)||CHR(99),5)/**/FROM/**/DUAL--','1','2021-06-10 06:52:12','2021-06-10 06:52:12');
INSERT INTO searches VALUES('383','QeYw);SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(75)||CHR(120)||CHR(78)||CHR(99),5)/**/FROM/**/DUAL--','1','2021-06-10 06:52:14','2021-06-10 06:52:14');
INSERT INTO searches VALUES('384','QeYw;SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(75)||CHR(120)||CHR(78)||CHR(99),5)/**/FROM/**/DUAL--','1','2021-06-10 06:52:17','2021-06-10 06:52:17');
INSERT INTO searches VALUES('385','QeYw')/**/AND/**/(SELECT/**/9138/**/FROM/**/(SELECT(SLEEP(5)))Piql)/**/AND/**/('ozmX'='ozmX','1','2021-06-10 06:52:21','2021-06-10 06:52:21');
INSERT INTO searches VALUES('386','QeYw'/**/AND/**/(SELECT/**/9138/**/FROM/**/(SELECT(SLEEP(5)))Piql)/**/AND/**/'lsAr'='lsAr','1','2021-06-10 06:52:23','2021-06-10 06:52:23');
INSERT INTO searches VALUES('387','QeYw)/**/AND/**/(SELECT/**/9138/**/FROM/**/(SELECT(SLEEP(5)))Piql)/**/AND/**/(3790=3790','1','2021-06-10 06:52:26','2021-06-10 06:52:26');
INSERT INTO searches VALUES('388','QeYw/**/AND/**/(SELECT/**/9138/**/FROM/**/(SELECT(SLEEP(5)))Piql)','1','2021-06-10 06:52:29','2021-06-10 06:52:29');
INSERT INTO searches VALUES('389','QeYw/**/AND/**/(SELECT/**/9138/**/FROM/**/(SELECT(SLEEP(5)))Piql)--/**/Dizu','1','2021-06-10 06:52:31','2021-06-10 06:52:31');
INSERT INTO searches VALUES('390','QeYw')/**/AND/**/1784=(SELECT/**/1784/**/FROM/**/PG_SLEEP(5))/**/AND/**/('ZdEf'='ZdEf','1','2021-06-10 06:52:34','2021-06-10 06:52:34');
INSERT INTO searches VALUES('391','QeYw'/**/AND/**/1784=(SELECT/**/1784/**/FROM/**/PG_SLEEP(5))/**/AND/**/'ukev'='ukev','1','2021-06-10 06:52:37','2021-06-10 06:52:37');
INSERT INTO searches VALUES('392','QeYw)/**/AND/**/1784=(SELECT/**/1784/**/FROM/**/PG_SLEEP(5))/**/AND/**/(1931=1931','1','2021-06-10 06:52:40','2021-06-10 06:52:40');
INSERT INTO searches VALUES('393','QeYw/**/AND/**/1784=(SELECT/**/1784/**/FROM/**/PG_SLEEP(5))','1','2021-06-10 06:52:43','2021-06-10 06:52:43');
INSERT INTO searches VALUES('394','QeYw/**/AND/**/1784=(SELECT/**/1784/**/FROM/**/PG_SLEEP(5))--/**/keym','1','2021-06-10 06:52:46','2021-06-10 06:52:46');
INSERT INTO searches VALUES('395','QeYw')/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/('YswN'='YswN','1','2021-06-10 06:52:49','2021-06-10 06:52:49');
INSERT INTO searches VALUES('396','QeYw'/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/'rrij'='rrij','1','2021-06-10 06:52:51','2021-06-10 06:52:51');
INSERT INTO searches VALUES('397','QeYw)/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/(9956=9956','1','2021-06-10 06:52:54','2021-06-10 06:52:54');
INSERT INTO searches VALUES('398','QeYw/**/WAITFOR/**/DELAY/**/'0:0:5'','1','2021-06-10 06:52:57','2021-06-10 06:52:57');
INSERT INTO searches VALUES('399','QeYw/**/WAITFOR/**/DELAY/**/'0:0:5'--/**/YWwG','1','2021-06-10 06:53:00','2021-06-10 06:53:00');
INSERT INTO searches VALUES('400','QeYw')/**/AND/**/1496=DBMS_PIPE.RECEIVE_MESSAGE(CHR(67)||CHR(100)||CHR(110)||CHR(87),5)/**/AND/**/('SiUj'='SiUj','1','2021-06-10 06:53:02','2021-06-10 06:53:02');
INSERT INTO searches VALUES('401','QeYw'/**/AND/**/1496=DBMS_PIPE.RECEIVE_MESSAGE(CHR(67)||CHR(100)||CHR(110)||CHR(87),5)/**/AND/**/'SMGW'='SMGW','1','2021-06-10 06:53:05','2021-06-10 06:53:05');
INSERT INTO searches VALUES('402','QeYw)/**/AND/**/1496=DBMS_PIPE.RECEIVE_MESSAGE(CHR(67)||CHR(100)||CHR(110)||CHR(87),5)/**/AND/**/(6350=6350','1','2021-06-10 06:53:08','2021-06-10 06:53:08');
INSERT INTO searches VALUES('403','QeYw/**/AND/**/1496=DBMS_PIPE.RECEIVE_MESSAGE(CHR(67)||CHR(100)||CHR(110)||CHR(87),5)','1','2021-06-10 06:53:11','2021-06-10 06:53:11');
INSERT INTO searches VALUES('404','QeYw/**/AND/**/1496=DBMS_PIPE.RECEIVE_MESSAGE(CHR(67)||CHR(100)||CHR(110)||CHR(87),5)--/**/CKFY','1','2021-06-10 06:53:14','2021-06-10 06:53:14');
INSERT INTO searches VALUES('405','QeYw')/**/ORDER/**/BY/**/1--/**/gZYM','1','2021-06-10 06:53:16','2021-06-10 06:53:16');
INSERT INTO searches VALUES('406','QeYw')/**/ORDER/**/BY/**/8037--/**/sEDC','1','2021-06-10 06:53:19','2021-06-10 06:53:19');
INSERT INTO searches VALUES('407','QeYw'/**/ORDER/**/BY/**/1--/**/WikY','1','2021-06-10 06:53:22','2021-06-10 06:53:22');
INSERT INTO searches VALUES('408','QeYw'/**/ORDER/**/BY/**/5720--/**/Yeqq','1','2021-06-10 06:53:25','2021-06-10 06:53:25');
INSERT INTO searches VALUES('409','QeYw)/**/ORDER/**/BY/**/1--/**/Hgrj','1','2021-06-10 06:53:27','2021-06-10 06:53:27');
INSERT INTO searches VALUES('410','QeYw)/**/ORDER/**/BY/**/8597--/**/kWVf','1','2021-06-10 06:53:30','2021-06-10 06:53:30');
INSERT INTO searches VALUES('411','QeYw/**/ORDER/**/BY/**/1--/**/tiJR','1','2021-06-10 06:53:33','2021-06-10 06:53:33');
INSERT INTO searches VALUES('412','QeYw/**/ORDER/**/BY/**/9421--/**/IfIk','1','2021-06-10 06:53:36','2021-06-10 06:53:36');
INSERT INTO searches VALUES('413','QeYw/**/ORDER/**/BY/**/1--/**/tqui','1','2021-06-10 06:53:39','2021-06-10 06:53:39');
INSERT INTO searches VALUES('414','QeYw/**/ORDER/**/BY/**/3949--/**/zxAv','1','2021-06-10 06:53:42','2021-06-10 06:53:42');
INSERT INTO searches VALUES('415','HWhQ','349','2021-06-10 07:14:55','2021-08-20 12:33:14');
INSERT INTO searches VALUES('416','Rain food cover','7','2021-06-14 08:08:23','2021-06-14 08:08:29');
INSERT INTO searches VALUES('417','FDQt','85','2021-06-14 17:22:20','2021-06-14 17:28:35');
INSERT INTO searches VALUES('418','9676','1','2021-06-14 17:22:28','2021-06-14 17:22:28');
INSERT INTO searches VALUES('419','FDQt.",',(,.,)','1','2021-06-14 17:22:31','2021-06-14 17:22:31');
INSERT INTO searches VALUES('420','FDQt'zHQbIz<'">VxyJRa','1','2021-06-14 17:22:34','2021-06-14 17:22:34');
INSERT INTO searches VALUES('421','FDQt')/**/AND/**/1302=4160/**/AND/**/('Lgpa'='Lgpa','1','2021-06-14 17:22:40','2021-06-14 17:22:40');
INSERT INTO searches VALUES('422','FDQt')/**/AND/**/2016=2016/**/AND/**/('vpdQ'='vpdQ','1','2021-06-14 17:22:43','2021-06-14 17:22:43');
INSERT INTO searches VALUES('423','FDQt')/**/AND/**/7175=9183/**/AND/**/('orxv'='orxv','1','2021-06-14 17:22:47','2021-06-14 17:22:47');
INSERT INTO searches VALUES('424','FDQt'/**/AND/**/4538=6639/**/AND/**/'vwLp'='vwLp','1','2021-06-14 17:22:49','2021-06-14 17:22:49');
INSERT INTO searches VALUES('425','FDQt'/**/AND/**/2016=2016/**/AND/**/'FlZm'='FlZm','1','2021-06-14 17:22:52','2021-06-14 17:22:52');
INSERT INTO searches VALUES('426','FDQt'/**/AND/**/4052=6448/**/AND/**/'JLoV'='JLoV','1','2021-06-14 17:22:54','2021-06-14 17:22:54');
INSERT INTO searches VALUES('427','FDQt)/**/AND/**/9508=9650/**/AND/**/(5680=5680','1','2021-06-14 17:22:56','2021-06-14 17:22:56');
INSERT INTO searches VALUES('428','FDQt)/**/AND/**/2016=2016/**/AND/**/(7060=7060','1','2021-06-14 17:22:59','2021-06-14 17:22:59');
INSERT INTO searches VALUES('429','FDQt)/**/AND/**/5462=5118/**/AND/**/(6313=6313','1','2021-06-14 17:23:01','2021-06-14 17:23:01');
INSERT INTO searches VALUES('430','FDQt/**/AND/**/7676=1576','1','2021-06-14 17:23:03','2021-06-14 17:23:03');
INSERT INTO searches VALUES('431','FDQt/**/AND/**/2016=2016','1','2021-06-14 17:23:06','2021-06-14 17:23:06');
INSERT INTO searches VALUES('432','FDQt/**/AND/**/3569=7423','1','2021-06-14 17:23:08','2021-06-14 17:23:08');
INSERT INTO searches VALUES('433','FDQt/**/AND/**/9533=7453--/**/KSgO','1','2021-06-14 17:23:11','2021-06-14 17:23:11');
INSERT INTO searches VALUES('434','FDQt/**/AND/**/2016=2016--/**/PKvo','1','2021-06-14 17:23:13','2021-06-14 17:23:13');
INSERT INTO searches VALUES('435','FDQt/**/AND/**/5825=4322--/**/ioQH','1','2021-06-14 17:23:16','2021-06-14 17:23:16');
INSERT INTO searches VALUES('436','FDQt')/**/AND/**/EXTRACTVALUE(3349,CONCAT(0x5c,0x71717a7171,(SELECT/**/(ELT(3349=3349,1))),0x7170767a71))/**/AND/**/('dJLY'='dJLY','1','2021-06-14 17:23:21','2021-06-14 17:23:21');
INSERT INTO searches VALUES('437','FDQt'/**/AND/**/EXTRACTVALUE(3349,CONCAT(0x5c,0x71717a7171,(SELECT/**/(ELT(3349=3349,1))),0x7170767a71))/**/AND/**/'rsEk'='rsEk','1','2021-06-14 17:23:23','2021-06-14 17:23:23');
INSERT INTO searches VALUES('438','FDQt)/**/AND/**/EXTRACTVALUE(3349,CONCAT(0x5c,0x71717a7171,(SELECT/**/(ELT(3349=3349,1))),0x7170767a71))/**/AND/**/(9676=9676','1','2021-06-14 17:23:25','2021-06-14 17:23:25');
INSERT INTO searches VALUES('439','FDQt/**/AND/**/EXTRACTVALUE(3349,CONCAT(0x5c,0x71717a7171,(SELECT/**/(ELT(3349=3349,1))),0x7170767a71))','1','2021-06-14 17:23:27','2021-06-14 17:23:27');
INSERT INTO searches VALUES('440','FDQt/**/AND/**/EXTRACTVALUE(3349,CONCAT(0x5c,0x71717a7171,(SELECT/**/(ELT(3349=3349,1))),0x7170767a71))--/**/DSEG','1','2021-06-14 17:23:30','2021-06-14 17:23:30');
INSERT INTO searches VALUES('441','FDQt')/**/AND/**/2298=CAST((CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(2298=2298)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/('HCEk'='HCEk','1','2021-06-14 17:23:32','2021-06-14 17:23:32');
INSERT INTO searches VALUES('442','FDQt'/**/AND/**/2298=CAST((CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(2298=2298)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/'XCdj'='XCdj','1','2021-06-14 17:23:34','2021-06-14 17:23:34');
INSERT INTO searches VALUES('443','FDQt)/**/AND/**/2298=CAST((CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(2298=2298)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/(3817=3817','1','2021-06-14 17:23:37','2021-06-14 17:23:37');
INSERT INTO searches VALUES('444','FDQt/**/AND/**/2298=CAST((CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(2298=2298)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113))/**/AS/**/NUMERIC)','1','2021-06-14 17:23:39','2021-06-14 17:23:39');
INSERT INTO searches VALUES('445','FDQt/**/AND/**/2298=CAST((CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(2298=2298)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113))/**/AS/**/NUMERIC)--/**/BDus','1','2021-06-14 17:23:42','2021-06-14 17:23:42');
INSERT INTO searches VALUES('446','FDQt')/**/AND/**/8704/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(113)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(8704=8704)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(112)+CHAR(118)+CHAR(122)+CHAR(113)))/**/AND/**/('hgMD'='hgMD','1','2021-06-14 17:23:44','2021-06-14 17:23:44');
INSERT INTO searches VALUES('447','FDQt'/**/AND/**/8704/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(113)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(8704=8704)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(112)+CHAR(118)+CHAR(122)+CHAR(113)))/**/AND/**/'zSCw'='zSCw','1','2021-06-14 17:23:46','2021-06-14 17:23:46');
INSERT INTO searches VALUES('448','FDQt)/**/AND/**/8704/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(113)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(8704=8704)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(112)+CHAR(118)+CHAR(122)+CHAR(113)))/**/AND/**/(2911=2911','1','2021-06-14 17:23:48','2021-06-14 17:23:48');
INSERT INTO searches VALUES('449','FDQt/**/AND/**/8704/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(113)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(8704=8704)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(112)+CHAR(118)+CHAR(122)+CHAR(113)))','1','2021-06-14 17:23:51','2021-06-14 17:23:51');
INSERT INTO searches VALUES('450','FDQt/**/AND/**/8704/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(113)+CHAR(122)+CHAR(113)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(8704=8704)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(112)+CHAR(118)+CHAR(122)+CHAR(113)))--/**/bySt','1','2021-06-14 17:23:53','2021-06-14 17:23:53');
INSERT INTO searches VALUES('451','FDQt')/**/AND/**/8887=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(8887=8887)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/('Dcfc'='Dcfc','1','2021-06-14 17:23:55','2021-06-14 17:23:55');
INSERT INTO searches VALUES('452','FDQt'/**/AND/**/8887=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(8887=8887)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/'jqPL'='jqPL','1','2021-06-14 17:23:57','2021-06-14 17:23:57');
INSERT INTO searches VALUES('453','FDQt)/**/AND/**/8887=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(8887=8887)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/(9322=9322','1','2021-06-14 17:24:00','2021-06-14 17:24:00');
INSERT INTO searches VALUES('454','FDQt/**/AND/**/8887=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(8887=8887)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)','1','2021-06-14 17:24:02','2021-06-14 17:24:02');
INSERT INTO searches VALUES('455','FDQt/**/AND/**/8887=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(113)||CHR(122)||CHR(113)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(8887=8887)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(112)||CHR(118)||CHR(122)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)--/**/RzUk','1','2021-06-14 17:24:04','2021-06-14 17:24:04');
INSERT INTO searches VALUES('456','(SELECT/**/CONCAT(CONCAT('qqzqq',(CASE/**/WHEN/**/(4792=4792)/**/THEN/**/'1'/**/ELSE/**/'0'/**/END)),'qpvzq'))','1','2021-06-14 17:24:06','2021-06-14 17:24:06');
INSERT INTO searches VALUES('457','FDQt');SELECT/**/PG_SLEEP(5)--','1','2021-06-14 17:24:08','2021-06-14 17:24:08');
INSERT INTO searches VALUES('458','FDQt';SELECT/**/PG_SLEEP(5)--','1','2021-06-14 17:24:11','2021-06-14 17:24:11');
INSERT INTO searches VALUES('459','FDQt);SELECT/**/PG_SLEEP(5)--','1','2021-06-14 17:24:13','2021-06-14 17:24:13');
INSERT INTO searches VALUES('460','FDQt;SELECT/**/PG_SLEEP(5)--','1','2021-06-14 17:24:15','2021-06-14 17:24:15');
INSERT INTO searches VALUES('461','FDQt');WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-14 17:24:17','2021-06-14 17:24:17');
INSERT INTO searches VALUES('462','FDQt';WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-14 17:24:19','2021-06-14 17:24:19');
INSERT INTO searches VALUES('463','FDQt);WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-14 17:24:21','2021-06-14 17:24:21');
INSERT INTO searches VALUES('464','FDQt;WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-14 17:24:23','2021-06-14 17:24:23');
INSERT INTO searches VALUES('465','FDQt');SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(72)||CHR(97)||CHR(114)||CHR(110),5)/**/FROM/**/DUAL--','1','2021-06-14 17:24:25','2021-06-14 17:24:25');
INSERT INTO searches VALUES('466','FDQt';SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(72)||CHR(97)||CHR(114)||CHR(110),5)/**/FROM/**/DUAL--','1','2021-06-14 17:24:28','2021-06-14 17:24:28');
INSERT INTO searches VALUES('467','FDQt);SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(72)||CHR(97)||CHR(114)||CHR(110),5)/**/FROM/**/DUAL--','1','2021-06-14 17:24:30','2021-06-14 17:24:30');
INSERT INTO searches VALUES('468','FDQt;SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(72)||CHR(97)||CHR(114)||CHR(110),5)/**/FROM/**/DUAL--','1','2021-06-14 17:24:32','2021-06-14 17:24:32');
INSERT INTO searches VALUES('469','FDQt')/**/AND/**/(SELECT/**/5953/**/FROM/**/(SELECT(SLEEP(5)))eyJh)/**/AND/**/('sTEK'='sTEK','1','2021-06-14 17:24:34','2021-06-14 17:24:34');
INSERT INTO searches VALUES('470','FDQt'/**/AND/**/(SELECT/**/5953/**/FROM/**/(SELECT(SLEEP(5)))eyJh)/**/AND/**/'fVDy'='fVDy','1','2021-06-14 17:24:36','2021-06-14 17:24:36');
INSERT INTO searches VALUES('471','FDQt)/**/AND/**/(SELECT/**/5953/**/FROM/**/(SELECT(SLEEP(5)))eyJh)/**/AND/**/(8193=8193','1','2021-06-14 17:24:39','2021-06-14 17:24:39');
INSERT INTO searches VALUES('472','FDQt/**/AND/**/(SELECT/**/5953/**/FROM/**/(SELECT(SLEEP(5)))eyJh)','1','2021-06-14 17:24:41','2021-06-14 17:24:41');
INSERT INTO searches VALUES('473','FDQt/**/AND/**/(SELECT/**/5953/**/FROM/**/(SELECT(SLEEP(5)))eyJh)--/**/exZo','1','2021-06-14 17:24:43','2021-06-14 17:24:43');
INSERT INTO searches VALUES('474','FDQt')/**/AND/**/3567=(SELECT/**/3567/**/FROM/**/PG_SLEEP(5))/**/AND/**/('OKTf'='OKTf','1','2021-06-14 17:24:45','2021-06-14 17:24:45');
INSERT INTO searches VALUES('475','FDQt'/**/AND/**/3567=(SELECT/**/3567/**/FROM/**/PG_SLEEP(5))/**/AND/**/'qIIY'='qIIY','1','2021-06-14 17:24:47','2021-06-14 17:24:47');
INSERT INTO searches VALUES('476','FDQt)/**/AND/**/3567=(SELECT/**/3567/**/FROM/**/PG_SLEEP(5))/**/AND/**/(9062=9062','1','2021-06-14 17:24:49','2021-06-14 17:24:49');
INSERT INTO searches VALUES('477','FDQt/**/AND/**/3567=(SELECT/**/3567/**/FROM/**/PG_SLEEP(5))','1','2021-06-14 17:24:51','2021-06-14 17:24:51');
INSERT INTO searches VALUES('478','FDQt/**/AND/**/3567=(SELECT/**/3567/**/FROM/**/PG_SLEEP(5))--/**/rRCP','1','2021-06-14 17:24:53','2021-06-14 17:24:53');
INSERT INTO searches VALUES('479','FDQt')/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/('tSVM'='tSVM','1','2021-06-14 17:24:56','2021-06-14 17:24:56');
INSERT INTO searches VALUES('480','FDQt'/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/'jMXV'='jMXV','1','2021-06-14 17:24:58','2021-06-14 17:24:58');
INSERT INTO searches VALUES('481','FDQt)/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/(6995=6995','1','2021-06-14 17:25:00','2021-06-14 17:25:00');
INSERT INTO searches VALUES('482','FDQt/**/WAITFOR/**/DELAY/**/'0:0:5'','1','2021-06-14 17:25:02','2021-06-14 17:25:02');
INSERT INTO searches VALUES('483','FDQt/**/WAITFOR/**/DELAY/**/'0:0:5'--/**/GlyU','1','2021-06-14 17:25:04','2021-06-14 17:25:04');
INSERT INTO searches VALUES('484','FDQt')/**/AND/**/6982=DBMS_PIPE.RECEIVE_MESSAGE(CHR(114)||CHR(66)||CHR(112)||CHR(103),5)/**/AND/**/('HGCW'='HGCW','1','2021-06-14 17:25:06','2021-06-14 17:25:06');
INSERT INTO searches VALUES('485','FDQt'/**/AND/**/6982=DBMS_PIPE.RECEIVE_MESSAGE(CHR(114)||CHR(66)||CHR(112)||CHR(103),5)/**/AND/**/'wTYJ'='wTYJ','1','2021-06-14 17:25:08','2021-06-14 17:25:08');
INSERT INTO searches VALUES('486','FDQt)/**/AND/**/6982=DBMS_PIPE.RECEIVE_MESSAGE(CHR(114)||CHR(66)||CHR(112)||CHR(103),5)/**/AND/**/(2674=2674','1','2021-06-14 17:25:11','2021-06-14 17:25:11');
INSERT INTO searches VALUES('487','FDQt/**/AND/**/6982=DBMS_PIPE.RECEIVE_MESSAGE(CHR(114)||CHR(66)||CHR(112)||CHR(103),5)','1','2021-06-14 17:25:13','2021-06-14 17:25:13');
INSERT INTO searches VALUES('488','FDQt/**/AND/**/6982=DBMS_PIPE.RECEIVE_MESSAGE(CHR(114)||CHR(66)||CHR(112)||CHR(103),5)--/**/WNoE','1','2021-06-14 17:25:15','2021-06-14 17:25:15');
INSERT INTO searches VALUES('489','FDQt')/**/ORDER/**/BY/**/1--/**/AOdU','1','2021-06-14 17:25:17','2021-06-14 17:25:17');
INSERT INTO searches VALUES('490','FDQt')/**/ORDER/**/BY/**/4888--/**/bOIW','1','2021-06-14 17:25:19','2021-06-14 17:25:19');
INSERT INTO searches VALUES('491','FDQt'/**/ORDER/**/BY/**/1--/**/wTGD','1','2021-06-14 17:25:22','2021-06-14 17:25:22');
INSERT INTO searches VALUES('492','FDQt'/**/ORDER/**/BY/**/9562--/**/aTir','1','2021-06-14 17:25:24','2021-06-14 17:25:24');
INSERT INTO searches VALUES('493','FDQt)/**/ORDER/**/BY/**/1--/**/NZKG','1','2021-06-14 17:25:26','2021-06-14 17:25:26');
INSERT INTO searches VALUES('494','FDQt)/**/ORDER/**/BY/**/8320--/**/njlb','1','2021-06-14 17:25:29','2021-06-14 17:25:29');
INSERT INTO searches VALUES('495','FDQt/**/ORDER/**/BY/**/1--/**/biew','1','2021-06-14 17:25:31','2021-06-14 17:25:31');
INSERT INTO searches VALUES('496','FDQt/**/ORDER/**/BY/**/9250--/**/unDK','1','2021-06-14 17:25:33','2021-06-14 17:25:33');
INSERT INTO searches VALUES('497','FDQt/**/ORDER/**/BY/**/1--/**/LyyK','1','2021-06-14 17:25:36','2021-06-14 17:25:36');
INSERT INTO searches VALUES('498','FDQt/**/ORDER/**/BY/**/9273--/**/cKvR','1','2021-06-14 17:25:38','2021-06-14 17:25:38');
INSERT INTO searches VALUES('499','hOxI','338','2021-06-14 17:36:51','2021-08-18 22:49:03');
INSERT INTO searches VALUES('500','ieqa','86','2021-06-19 00:37:45','2021-06-19 00:48:28');
INSERT INTO searches VALUES('501','4913','1','2021-06-19 00:37:53','2021-06-19 00:37:53');
INSERT INTO searches VALUES('502','ieqa,)"(,').(.','1','2021-06-19 00:37:55','2021-06-19 00:37:55');
INSERT INTO searches VALUES('503','ieqa'zZRYbf<'">fsBSbg','1','2021-06-19 00:37:58','2021-06-19 00:37:58');
INSERT INTO searches VALUES('504','ieqa')/**/AND/**/1941=1741/**/AND/**/('oGQG'='oGQG','1','2021-06-19 00:38:04','2021-06-19 00:38:04');
INSERT INTO searches VALUES('505','ieqa')/**/AND/**/9817=9817/**/AND/**/('uYcH'='uYcH','1','2021-06-19 00:38:10','2021-06-19 00:38:10');
INSERT INTO searches VALUES('506','ieqa')/**/AND/**/6826=6974/**/AND/**/('UsKA'='UsKA','1','2021-06-19 00:38:13','2021-06-19 00:38:13');
INSERT INTO searches VALUES('507','ieqa'/**/AND/**/4939=6088/**/AND/**/'XbhH'='XbhH','1','2021-06-19 00:38:15','2021-06-19 00:38:15');
INSERT INTO searches VALUES('508','ieqa'/**/AND/**/9817=9817/**/AND/**/'EzRa'='EzRa','1','2021-06-19 00:38:17','2021-06-19 00:38:17');
INSERT INTO searches VALUES('509','ieqa'/**/AND/**/2647=9670/**/AND/**/'EXhr'='EXhr','1','2021-06-19 00:38:19','2021-06-19 00:38:19');
INSERT INTO searches VALUES('510','ieqa)/**/AND/**/5963=8445/**/AND/**/(5401=5401','1','2021-06-19 00:38:21','2021-06-19 00:38:21');
INSERT INTO searches VALUES('511','ieqa)/**/AND/**/9817=9817/**/AND/**/(1895=1895','1','2021-06-19 00:38:23','2021-06-19 00:38:23');
INSERT INTO searches VALUES('512','ieqa)/**/AND/**/3569=4631/**/AND/**/(9948=9948','1','2021-06-19 00:38:25','2021-06-19 00:38:25');
INSERT INTO searches VALUES('513','ieqa/**/AND/**/1227=9126','1','2021-06-19 00:38:27','2021-06-19 00:38:27');
INSERT INTO searches VALUES('514','ieqa/**/AND/**/9817=9817','1','2021-06-19 00:38:29','2021-06-19 00:38:29');
INSERT INTO searches VALUES('515','ieqa/**/AND/**/7938=9330','1','2021-06-19 00:38:32','2021-06-19 00:38:32');
INSERT INTO searches VALUES('516','ieqa/**/AND/**/7037=2188--/**/LtXY','1','2021-06-19 00:38:34','2021-06-19 00:38:34');
INSERT INTO searches VALUES('517','ieqa/**/AND/**/9817=9817--/**/QJMa','1','2021-06-19 00:38:36','2021-06-19 00:38:36');
INSERT INTO searches VALUES('518','ieqa/**/AND/**/4964=2157--/**/WsZO','1','2021-06-19 00:38:38','2021-06-19 00:38:38');
INSERT INTO searches VALUES('519','ieqa')/**/AND/**/EXTRACTVALUE(1959,CONCAT(0x5c,0x71766b6271,(SELECT/**/(ELT(1959=1959,1))),0x716a627871))/**/AND/**/('eTCL'='eTCL','1','2021-06-19 00:38:42','2021-06-19 00:38:42');
INSERT INTO searches VALUES('520','ieqa'/**/AND/**/EXTRACTVALUE(1959,CONCAT(0x5c,0x71766b6271,(SELECT/**/(ELT(1959=1959,1))),0x716a627871))/**/AND/**/'oFlQ'='oFlQ','1','2021-06-19 00:38:44','2021-06-19 00:38:44');
INSERT INTO searches VALUES('521','ieqa)/**/AND/**/EXTRACTVALUE(1959,CONCAT(0x5c,0x71766b6271,(SELECT/**/(ELT(1959=1959,1))),0x716a627871))/**/AND/**/(2178=2178','1','2021-06-19 00:38:46','2021-06-19 00:38:46');
INSERT INTO searches VALUES('522','ieqa/**/AND/**/EXTRACTVALUE(1959,CONCAT(0x5c,0x71766b6271,(SELECT/**/(ELT(1959=1959,1))),0x716a627871))','1','2021-06-19 00:38:48','2021-06-19 00:38:48');
INSERT INTO searches VALUES('523','ieqa/**/AND/**/EXTRACTVALUE(1959,CONCAT(0x5c,0x71766b6271,(SELECT/**/(ELT(1959=1959,1))),0x716a627871))--/**/bttM','1','2021-06-19 00:38:50','2021-06-19 00:38:50');
INSERT INTO searches VALUES('524','ieqa')/**/AND/**/8287=CAST((CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(8287=8287)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/('CmeS'='CmeS','1','2021-06-19 00:38:52','2021-06-19 00:38:52');
INSERT INTO searches VALUES('525','ieqa'/**/AND/**/8287=CAST((CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(8287=8287)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/'cPUl'='cPUl','1','2021-06-19 00:38:54','2021-06-19 00:38:54');
INSERT INTO searches VALUES('526','ieqa)/**/AND/**/8287=CAST((CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(8287=8287)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113))/**/AS/**/NUMERIC)/**/AND/**/(2610=2610','1','2021-06-19 00:38:56','2021-06-19 00:38:56');
INSERT INTO searches VALUES('527','ieqa/**/AND/**/8287=CAST((CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(8287=8287)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113))/**/AS/**/NUMERIC)','1','2021-06-19 00:39:01','2021-06-19 00:39:01');
INSERT INTO searches VALUES('528','ieqa/**/AND/**/8287=CAST((CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113))||(SELECT/**/(CASE/**/WHEN/**/(8287=8287)/**/THEN/**/1/**/ELSE/**/0/**/END))::text||(CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113))/**/AS/**/NUMERIC)--/**/HNwr','1','2021-06-19 00:39:03','2021-06-19 00:39:03');
INSERT INTO searches VALUES('529','ieqa')/**/AND/**/4850/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(118)+CHAR(107)+CHAR(98)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(4850=4850)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(106)+CHAR(98)+CHAR(120)+CHAR(113)))/**/AND/**/('vuZW'='vuZW','1','2021-06-19 00:39:05','2021-06-19 00:39:05');
INSERT INTO searches VALUES('530','ieqa'/**/AND/**/4850/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(118)+CHAR(107)+CHAR(98)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(4850=4850)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(106)+CHAR(98)+CHAR(120)+CHAR(113)))/**/AND/**/'PPkc'='PPkc','1','2021-06-19 00:39:07','2021-06-19 00:39:07');
INSERT INTO searches VALUES('531','ieqa)/**/AND/**/4850/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(118)+CHAR(107)+CHAR(98)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(4850=4850)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(106)+CHAR(98)+CHAR(120)+CHAR(113)))/**/AND/**/(3167=3167','1','2021-06-19 00:39:09','2021-06-19 00:39:09');
INSERT INTO searches VALUES('532','ieqa/**/AND/**/4850/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(118)+CHAR(107)+CHAR(98)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(4850=4850)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(106)+CHAR(98)+CHAR(120)+CHAR(113)))','1','2021-06-19 00:39:11','2021-06-19 00:39:11');
INSERT INTO searches VALUES('533','ieqa/**/AND/**/4850/**/IN/**/(SELECT/**/(CHAR(113)+CHAR(118)+CHAR(107)+CHAR(98)+CHAR(113)+(SELECT/**/(CASE/**/WHEN/**/(4850=4850)/**/THEN/**/CHAR(49)/**/ELSE/**/CHAR(48)/**/END))+CHAR(113)+CHAR(106)+CHAR(98)+CHAR(120)+CHAR(113)))--/**/IKSq','1','2021-06-19 00:39:13','2021-06-19 00:39:13');
INSERT INTO searches VALUES('534','ieqa')/**/AND/**/1274=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(1274=1274)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/('NNpE'='NNpE','1','2021-06-19 00:39:15','2021-06-19 00:39:15');
INSERT INTO searches VALUES('535','ieqa'/**/AND/**/1274=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(1274=1274)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/'qdUs'='qdUs','1','2021-06-19 00:39:18','2021-06-19 00:39:18');
INSERT INTO searches VALUES('536','ieqa)/**/AND/**/1274=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(1274=1274)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)/**/AND/**/(2449=2449','1','2021-06-19 00:39:21','2021-06-19 00:39:21');
INSERT INTO searches VALUES('537','ieqa/**/AND/**/1274=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(1274=1274)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)','1','2021-06-19 00:39:23','2021-06-19 00:39:23');
INSERT INTO searches VALUES('538','ieqa/**/AND/**/1274=(SELECT/**/UPPER(XMLType(CHR(60)||CHR(58)||CHR(113)||CHR(118)||CHR(107)||CHR(98)||CHR(113)||(SELECT/**/(CASE/**/WHEN/**/(1274=1274)/**/THEN/**/1/**/ELSE/**/0/**/END)/**/FROM/**/DUAL)||CHR(113)||CHR(106)||CHR(98)||CHR(120)||CHR(113)||CHR(62)))/**/FROM/**/DUAL)--/**/MnDP','1','2021-06-19 00:39:25','2021-06-19 00:39:25');
INSERT INTO searches VALUES('539','(SELECT/**/CONCAT(CONCAT('qvkbq',(CASE/**/WHEN/**/(7228=7228)/**/THEN/**/'1'/**/ELSE/**/'0'/**/END)),'qjbxq'))','1','2021-06-19 00:39:26','2021-06-19 00:39:26');
INSERT INTO searches VALUES('540','ieqa');SELECT/**/PG_SLEEP(5)--','1','2021-06-19 00:39:29','2021-06-19 00:39:29');
INSERT INTO searches VALUES('541','ieqa';SELECT/**/PG_SLEEP(5)--','1','2021-06-19 00:39:31','2021-06-19 00:39:31');
INSERT INTO searches VALUES('542','ieqa);SELECT/**/PG_SLEEP(5)--','1','2021-06-19 00:39:32','2021-06-19 00:39:32');
INSERT INTO searches VALUES('543','ieqa;SELECT/**/PG_SLEEP(5)--','1','2021-06-19 00:39:35','2021-06-19 00:39:35');
INSERT INTO searches VALUES('544','ieqa');WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-19 00:39:36','2021-06-19 00:39:36');
INSERT INTO searches VALUES('545','ieqa';WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-19 00:39:38','2021-06-19 00:39:38');
INSERT INTO searches VALUES('546','ieqa);WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-19 00:39:40','2021-06-19 00:39:40');
INSERT INTO searches VALUES('547','ieqa;WAITFOR/**/DELAY/**/'0:0:5'--','1','2021-06-19 00:39:42','2021-06-19 00:39:42');
INSERT INTO searches VALUES('548','ieqa');SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(86)||CHR(79)||CHR(112)||CHR(77),5)/**/FROM/**/DUAL--','1','2021-06-19 00:39:44','2021-06-19 00:39:44');
INSERT INTO searches VALUES('549','ieqa';SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(86)||CHR(79)||CHR(112)||CHR(77),5)/**/FROM/**/DUAL--','1','2021-06-19 00:39:47','2021-06-19 00:39:47');
INSERT INTO searches VALUES('550','ieqa);SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(86)||CHR(79)||CHR(112)||CHR(77),5)/**/FROM/**/DUAL--','1','2021-06-19 00:39:49','2021-06-19 00:39:49');
INSERT INTO searches VALUES('551','ieqa;SELECT/**/DBMS_PIPE.RECEIVE_MESSAGE(CHR(86)||CHR(79)||CHR(112)||CHR(77),5)/**/FROM/**/DUAL--','1','2021-06-19 00:39:51','2021-06-19 00:39:51');
INSERT INTO searches VALUES('552','ieqa')/**/AND/**/(SELECT/**/4868/**/FROM/**/(SELECT(SLEEP(5)))HPkh)/**/AND/**/('ZVDc'='ZVDc','1','2021-06-19 00:39:53','2021-06-19 00:39:53');
INSERT INTO searches VALUES('553','ieqa'/**/AND/**/(SELECT/**/4868/**/FROM/**/(SELECT(SLEEP(5)))HPkh)/**/AND/**/'WqFM'='WqFM','1','2021-06-19 00:39:54','2021-06-19 00:39:54');
INSERT INTO searches VALUES('554','ieqa)/**/AND/**/(SELECT/**/4868/**/FROM/**/(SELECT(SLEEP(5)))HPkh)/**/AND/**/(2077=2077','1','2021-06-19 00:39:56','2021-06-19 00:39:56');
INSERT INTO searches VALUES('555','ieqa/**/AND/**/(SELECT/**/4868/**/FROM/**/(SELECT(SLEEP(5)))HPkh)','1','2021-06-19 00:39:58','2021-06-19 00:39:58');
INSERT INTO searches VALUES('556','ieqa/**/AND/**/(SELECT/**/4868/**/FROM/**/(SELECT(SLEEP(5)))HPkh)--/**/tWAe','1','2021-06-19 00:40:00','2021-06-19 00:40:00');
INSERT INTO searches VALUES('557','ieqa')/**/AND/**/1367=(SELECT/**/1367/**/FROM/**/PG_SLEEP(5))/**/AND/**/('dODm'='dODm','1','2021-06-19 00:40:02','2021-06-19 00:40:02');
INSERT INTO searches VALUES('558','ieqa'/**/AND/**/1367=(SELECT/**/1367/**/FROM/**/PG_SLEEP(5))/**/AND/**/'IIVV'='IIVV','1','2021-06-19 00:40:04','2021-06-19 00:40:04');
INSERT INTO searches VALUES('559','ieqa)/**/AND/**/1367=(SELECT/**/1367/**/FROM/**/PG_SLEEP(5))/**/AND/**/(4631=4631','1','2021-06-19 00:40:06','2021-06-19 00:40:06');
INSERT INTO searches VALUES('560','ieqa/**/AND/**/1367=(SELECT/**/1367/**/FROM/**/PG_SLEEP(5))','1','2021-06-19 00:40:08','2021-06-19 00:40:08');
INSERT INTO searches VALUES('561','ieqa/**/AND/**/1367=(SELECT/**/1367/**/FROM/**/PG_SLEEP(5))--/**/SIeb','1','2021-06-19 00:40:09','2021-06-19 00:40:09');
INSERT INTO searches VALUES('562','ieqa')/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/('ziHl'='ziHl','1','2021-06-19 00:40:11','2021-06-19 00:40:11');
INSERT INTO searches VALUES('563','ieqa'/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/'QuoB'='QuoB','1','2021-06-19 00:40:13','2021-06-19 00:40:13');
INSERT INTO searches VALUES('564','ieqa)/**/WAITFOR/**/DELAY/**/'0:0:5'/**/AND/**/(6599=6599','1','2021-06-19 00:40:15','2021-06-19 00:40:15');
INSERT INTO searches VALUES('565','ieqa/**/WAITFOR/**/DELAY/**/'0:0:5'','1','2021-06-19 00:40:17','2021-06-19 00:40:17');
INSERT INTO searches VALUES('566','ieqa/**/WAITFOR/**/DELAY/**/'0:0:5'--/**/QLBg','1','2021-06-19 00:40:19','2021-06-19 00:40:19');
INSERT INTO searches VALUES('567','ieqa')/**/AND/**/5483=DBMS_PIPE.RECEIVE_MESSAGE(CHR(66)||CHR(111)||CHR(113)||CHR(117),5)/**/AND/**/('NDod'='NDod','1','2021-06-19 00:40:21','2021-06-19 00:40:21');
INSERT INTO searches VALUES('568','ieqa'/**/AND/**/5483=DBMS_PIPE.RECEIVE_MESSAGE(CHR(66)||CHR(111)||CHR(113)||CHR(117),5)/**/AND/**/'JszS'='JszS','1','2021-06-19 00:40:23','2021-06-19 00:40:23');
INSERT INTO searches VALUES('569','ieqa)/**/AND/**/5483=DBMS_PIPE.RECEIVE_MESSAGE(CHR(66)||CHR(111)||CHR(113)||CHR(117),5)/**/AND/**/(2289=2289','1','2021-06-19 00:40:24','2021-06-19 00:40:24');
INSERT INTO searches VALUES('570','ieqa/**/AND/**/5483=DBMS_PIPE.RECEIVE_MESSAGE(CHR(66)||CHR(111)||CHR(113)||CHR(117),5)','1','2021-06-19 00:40:26','2021-06-19 00:40:26');
INSERT INTO searches VALUES('571','ieqa/**/AND/**/5483=DBMS_PIPE.RECEIVE_MESSAGE(CHR(66)||CHR(111)||CHR(113)||CHR(117),5)--/**/xXTH','1','2021-06-19 00:40:28','2021-06-19 00:40:28');
INSERT INTO searches VALUES('572','ieqa')/**/ORDER/**/BY/**/1--/**/JsAe','1','2021-06-19 00:40:29','2021-06-19 00:40:29');
INSERT INTO searches VALUES('573','ieqa')/**/ORDER/**/BY/**/4923--/**/YpRZ','1','2021-06-19 00:40:31','2021-06-19 00:40:31');
INSERT INTO searches VALUES('574','ieqa'/**/ORDER/**/BY/**/1--/**/aNsE','1','2021-06-19 00:40:33','2021-06-19 00:40:33');
INSERT INTO searches VALUES('575','ieqa'/**/ORDER/**/BY/**/4605--/**/caoy','1','2021-06-19 00:40:35','2021-06-19 00:40:35');
INSERT INTO searches VALUES('576','ieqa)/**/ORDER/**/BY/**/1--/**/irMG','1','2021-06-19 00:40:37','2021-06-19 00:40:37');
INSERT INTO searches VALUES('577','ieqa)/**/ORDER/**/BY/**/8181--/**/EREB','1','2021-06-19 00:40:39','2021-06-19 00:40:39');
INSERT INTO searches VALUES('578','ieqa/**/ORDER/**/BY/**/1--/**/cVqq','1','2021-06-19 00:40:41','2021-06-19 00:40:41');
INSERT INTO searches VALUES('579','ieqa/**/ORDER/**/BY/**/9242--/**/RyJJ','1','2021-06-19 00:40:43','2021-06-19 00:40:43');
INSERT INTO searches VALUES('580','ieqa/**/ORDER/**/BY/**/1--/**/nnUg','1','2021-06-19 00:40:45','2021-06-19 00:40:45');
INSERT INTO searches VALUES('581','ieqa/**/ORDER/**/BY/**/2571--/**/WeTi','1','2021-06-19 00:40:47','2021-06-19 00:40:47');
INSERT INTO searches VALUES('582','dVBg','337','2021-06-19 00:48:30','2021-08-18 22:49:04');
INSERT INTO searches VALUES('583','Ghee','2','2021-06-25 15:09:03','2021-06-25 15:09:04');
INSERT INTO searches VALUES('584','Walker','1','2021-06-26 12:02:41','2021-06-26 12:02:41');
INSERT INTO searches VALUES('585','Fancy','2','2021-07-29 19:40:20','2021-07-29 19:40:21');
INSERT INTO searches VALUES('586','HWhQ'[0]','1','2021-08-20 12:33:26','2021-08-20 12:33:26');
INSERT INTO searches VALUES('587','http://www.google.com','1','2021-08-20 12:34:28','2021-08-20 12:34:28');
INSERT INTO searches VALUES('588','Seller Product','6','2021-12-13 09:20:54','2022-01-04 15:49:13');
INSERT INTO searches VALUES('589','new seller product','3','2021-12-13 09:37:55','2021-12-13 09:38:21');
INSERT INTO searches VALUES('590','sasto product','7','2021-12-15 05:16:44','2021-12-15 07:06:51');
INSERT INTO searches VALUES('591','denim jacket','1','2022-01-07 11:05:52','2022-01-07 11:05:52');
INSERT INTO searches VALUES('592','n','1','2022-01-07 15:01:04','2022-01-07 15:01:04');
INSERT INTO searches VALUES('593','seller digital product','3','2022-01-20 14:29:16','2022-01-27 09:26:57');
INSERT INTO searches VALUES('594','test','3','2022-01-20 14:33:11','2022-03-25 16:29:57');
INSERT INTO searches VALUES('595','Red Cherry Himalayan Arabica Coffee - 250 Gm','2','2022-01-20 14:43:28','2022-01-20 14:43:37');
INSERT INTO searches VALUES('596','seller product test','1','2022-01-27 09:28:07','2022-01-27 09:28:07');
INSERT INTO searches VALUES('597','password','1','2022-02-02 16:05:01','2022-02-02 16:05:01');
INSERT INTO searches VALUES('598','tea','3','2022-03-15 14:32:54','2022-03-21 09:07:30');
INSERT INTO searches VALUES('599','coffee','2','2022-03-15 14:37:11','2022-03-15 14:39:08');
INSERT INTO searches VALUES('600','hat','1','2022-03-15 14:39:16','2022-03-15 14:39:16');
INSERT INTO searches VALUES('601','pen','1','2022-03-15 14:39:27','2022-03-15 14:39:27');
INSERT INTO searches VALUES('602','green tea','1','2022-03-16 09:28:10','2022-03-16 09:28:10');
INSERT INTO searches VALUES('603','Sport shoes shoes for girls - 39','1','2022-03-16 09:57:08','2022-03-16 09:57:08');
INSERT INTO searches VALUES('604','Sport shoes','1','2022-03-16 09:57:16','2022-03-16 09:57:16');
INSERT INTO searches VALUES('605','house','1','2022-03-25 16:30:08','2022-03-25 16:30:08');
INSERT INTO searches VALUES('606','re','1','2022-03-25 16:30:16','2022-03-25 16:30:16');
INSERT INTO searches VALUES('607','aa','2','2022-03-28 21:28:23','2022-03-28 21:28:31');
INSERT INTO searches VALUES('608','silicon','1','2022-03-30 12:34:21','2022-03-30 12:34:21');
INSERT INTO searches VALUES('609','test product','2','2022-03-30 14:38:54','2022-03-30 14:40:54');
INSERT INTO searches VALUES('610','pearl','5','2022-04-01 10:23:40','2022-04-01 10:24:39');


DROP TABLE IF EXISTS seller_packages;

CREATE TABLE `seller_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL DEFAULT 0.00,
  `product_upload` int(11) NOT NULL DEFAULT 0,
  `digital_product_upload` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS seller_withdraw_requests;

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO seller_withdraw_requests VALUES('1','1','46','Magni suscipit exerc','1','1','2022-01-26 15:53:21','2022-03-25 16:49:55');


DROP TABLE IF EXISTS sellers;

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `seller_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) NOT NULL DEFAULT 0,
  `remaining_digital_uploads` int(11) NOT NULL DEFAULT 0,
  `invalid_at` date DEFAULT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `pan` int(11) DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sellers VALUES('1','3','','0','0','','1','[{"type":"text","label":"Name","value":"Mr. Seller"},{"type":"select","label":"Marital Status","value":"Married"},{"type":"multi_select","label":"Company","value":"[\"Company\"]"},{"type":"select","label":"Gender","value":"Male"},{"type":"file","label":"Image","value":"uploads\/verification_form\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png"}]','1','1842.4','','','','','','0','2018-10-07 10:27:57','2022-04-03 11:57:17');
INSERT INTO sellers VALUES('6','27','','0','0','','1','','0','-140','','','','','','0','2020-07-02 17:16:28','2020-07-25 08:14:48');
INSERT INTO sellers VALUES('7','35','','0','0','','0','','0','0','','','sapkotaa872@gmail.com','','','0','2020-07-16 19:22:42','2020-12-08 14:58:59');
INSERT INTO sellers VALUES('9','40','','0','0','','0','','0','0','','','','','','0','2020-07-23 14:20:21','2020-07-23 14:20:21');
INSERT INTO sellers VALUES('11','43','','0','0','','0','','0','0','','','','','','0','2020-07-26 08:00:58','2020-07-26 08:00:58');
INSERT INTO sellers VALUES('12','43','','0','0','','0','','0','0','','','','','','0','2020-07-26 08:21:49','2020-07-26 08:21:49');
INSERT INTO sellers VALUES('13','43','','0','0','','0','','0','0','','','','','','0','2020-07-26 08:22:11','2020-07-26 08:22:11');
INSERT INTO sellers VALUES('15','79','','0','0','','1','','0','0','','','','','','0','2020-09-29 15:05:35','2022-04-04 08:38:24');
INSERT INTO sellers VALUES('19','97','','0','0','','0','','0','0','','','','','','0','2020-11-06 10:15:44','2020-11-06 10:15:44');
INSERT INTO sellers VALUES('20','105','','0','0','','0','','0','0','','','','','','0','2020-11-06 14:33:17','2020-11-06 14:33:17');
INSERT INTO sellers VALUES('21','133','','0','0','','0','','0','0','','Bank of America','Laxmi Prasad Sapkota','00003011154691522','61000052','1','2020-11-20 20:28:47','2020-11-20 20:38:08');
INSERT INTO sellers VALUES('25','77','','0','0','','1','','1','0','','','admin@alldokan.com','','','0','2021-05-09 08:00:39','2021-05-31 19:40:48');
INSERT INTO sellers VALUES('26','202','','0','0','','0','','0','0','','','','','','0','2021-07-26 22:42:04','2021-07-26 22:42:04');
INSERT INTO sellers VALUES('27','217','','0','0','','1','','0','0','','','','','','0','2021-12-13 07:19:22','2021-12-13 10:00:47');
INSERT INTO sellers VALUES('30','231','','0','0','','0','','0','0','','','','','','0','2021-12-15 05:01:02','2021-12-15 05:01:02');
INSERT INTO sellers VALUES('31','232','','0','0','','0','','0','0','','','','','','0','2021-12-15 05:02:05','2021-12-15 05:02:05');
INSERT INTO sellers VALUES('32','241','','0','0','','0','','0','0','','','','','','0','2022-01-05 08:23:25','2022-01-11 20:18:46');
INSERT INTO sellers VALUES('33','243','','0','0','','0','','0','0','','','','','','0','2022-01-13 22:53:42','2022-01-13 22:53:42');
INSERT INTO sellers VALUES('34','243','','0','0','','0','','0','0','','','','','','0','2022-01-19 15:19:17','2022-01-19 15:19:17');
INSERT INTO sellers VALUES('35','243','','0','0','','1','','0','0','','','','','','0','2022-01-19 15:20:02','2022-01-19 15:24:24');
INSERT INTO sellers VALUES('36','250','','0','0','','0','','0','0','','','','','','0','2022-02-20 13:36:34','2022-02-20 13:36:45');
INSERT INTO sellers VALUES('37','256','','0','0','','0','','0','0','','','','','','0','2022-03-30 12:18:53','2022-03-30 12:18:53');
INSERT INTO sellers VALUES('38','259','','0','0','','1','','0','0','','','','','','0','2022-04-03 15:49:10','2022-04-04 08:51:30');
INSERT INTO sellers VALUES('39','270','','0','0','','0','','0','0','','','','','','0','2022-04-07 06:38:11','2022-04-07 06:38:11');
INSERT INTO sellers VALUES('40','272','','0','0','','0','','0','0','0','','','','','0','2022-04-19 14:10:28','2022-04-19 14:10:28');
INSERT INTO sellers VALUES('41','273','','0','0','','0','','0','0','0','','','','','0','2022-04-19 14:15:45','2022-04-19 14:15:45');
INSERT INTO sellers VALUES('42','274','','0','0','','0','','0','0','1231','','','','','0','2022-04-19 14:24:05','2022-04-19 14:24:05');
INSERT INTO sellers VALUES('43','275','','0','0','','0','','0','0','123','','','','','0','2022-04-19 14:38:59','2022-04-19 14:38:59');
INSERT INTO sellers VALUES('44','276','','0','0','','0','','1','0','22222','222','222','222','123123123','1','2022-04-19 14:39:50','2022-04-24 12:26:22');
INSERT INTO sellers VALUES('45','277','','0','0','','0','','0','0','123','','','','','0','2022-12-08 23:42:54','2022-12-08 23:42:54');
INSERT INTO sellers VALUES('46','278','','0','0','','0','','0','0','123','','','','','0','2022-12-08 23:46:12','2022-12-08 23:46:12');


DROP TABLE IF EXISTS seo_settings;

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO seo_settings VALUES('1','online shopping in nepal,latest shoes design,latest mi smartphones price in nepal,bazaar','Sewa Digital','11','https://sewa-digital.nextnepal.org/','Sewa Digital is a Nepal's largest growing online marketplace aims to provide best online shopping experience to their customers.','2022-03-16 10:42:22','2022-03-16 09:42:22');


DROP TABLE IF EXISTS shops;

CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO shops VALUES('1','3','Demo Seller Shop','uploads/shop/logo/jd2VTmdWIsgfXkGzEzPXlt2SQKKJADjcIpShLAtU.png','["uploads\/shop\/sliders\/HD9a5QeozYPbPWZzVerQXhL8asktBxURt3z8uche.jpeg","uploads\/shop\/sliders\/Y67Zi9OcEe60keN7GnD8ND3PvMMNgUArzjHT5OpH.jpeg","uploads\/shop\/sliders\/ru5yexCvJiYBN5yuTR2shMH8zW7RN8uX7djYJdgZ.png"]','House : Demo, Road : Demo, Section : Demo','16','www.facebook.com','www.google.com','www.twitter.com','www.youtube.com','Demo-Seller-Shop-1','Demo Seller Shop Title','Demo description','["4","5"]','0','2018-11-27 16:08:13','2022-03-16 10:02:40');
INSERT INTO shops VALUES('6','27','Gadget King','','','Attariya','','','','','','Gadget-King-','','','','0','2020-07-02 17:16:28','2020-07-02 17:16:28');
INSERT INTO shops VALUES('7','35','W3 World','uploads/shop/logo/Dx35c2wb0TKdFTWVXDLI7IxX45zfXv94YFiHiE3I.png','','w3world.xyz','','','','','','W3-World-7','W3 World','I will Provide you pdf of  books and other digital products','[]','0','2020-07-16 19:22:42','2020-07-16 19:46:23');
INSERT INTO shops VALUES('11','79','Digitech Computer','','','shree krishna market,attariya,kailali','','','','','','Digitech-Computer-','','','','0','2020-09-29 15:05:35','2020-09-29 15:05:35');
INSERT INTO shops VALUES('15','97','Star Print & Mobile Gallery','','','Dhangadhi-13, Rajpur','','','','','','Star-Print-&-Mobile-Gallery-15','Magic mug print, cup print, mouse pad, keyring, pillo print etc print & All mobile Accessoriess Earphone ,charger,memory card ,card reader, pendrive, cover, glass, speaker, OTG, battery , Power bank, Data cable headphone etc Availabale.','Magic mug print, cup print, mouse pad, key ring, pillow print etc print & All mobile Accessories Earphone ,charger,memory card ,card reader, pen drive, cover, glass, speaker, OTG, battery , Power bank, Data cable headphone etc Available.','[]','0','2020-11-06 10:15:44','2020-11-06 10:23:38');
INSERT INTO shops VALUES('16','105','Gsm complex','','','attariya,kailali','','','','','','Gsm-complex-16','gsm complex','all kind of gents collection','[]','0','2020-11-06 14:33:17','2020-11-06 14:35:36');
INSERT INTO shops VALUES('17','133','Laxmi Prasad Sapkota','','','ghodaghodi-4','','','','','','Laxmi-Prasad-Sapkota-','','','','0','2020-11-20 20:28:47','2020-11-20 20:28:47');
INSERT INTO shops VALUES('21','77','smartkinmel.com','','','Bharatpur-10,Chitwan','','','','','','smartkinmel.com-','','','','0','2021-05-09 08:00:39','2021-05-09 08:00:39');
INSERT INTO shops VALUES('22','202','Upraj','','[]','Kathamndu','','','','','','Upraj-','','','','0','2021-07-26 22:42:04','2021-07-26 22:46:35');
INSERT INTO shops VALUES('23','217','','','','','','','','','','demo-shop-217','','','','0','2021-12-13 07:19:22','2021-12-13 07:19:22');
INSERT INTO shops VALUES('24','220','MyShop','','','Satdobato','','','','','','MyShop-','','','','0','2021-12-13 11:32:20','2021-12-13 11:32:20');
INSERT INTO shops VALUES('25','221','MyNewshop','','','Satdobato','','','','','','MyNewshop-','','','','0','2021-12-13 11:38:12','2021-12-13 11:38:12');
INSERT INTO shops VALUES('26','231','MeroBazaar','','','Satdobato','','','','','','MeroBazaar-','','','','0','2021-12-15 05:01:02','2021-12-15 05:01:02');
INSERT INTO shops VALUES('27','232','SastoBazaar','','','Satdobato','','','','','','SastoBazaar-','','','','0','2021-12-15 05:02:06','2021-12-15 05:02:06');
INSERT INTO shops VALUES('28','241','shop online','','','kalanki','','','','','','shop-online-','','','','0','2022-01-05 08:23:25','2022-01-05 08:23:25');
INSERT INTO shops VALUES('29','243','nepali kitchen','','','kalanki','','','','','','nepali-kitchen-','','','','0','2022-01-13 22:53:42','2022-01-13 22:53:42');
INSERT INTO shops VALUES('30','250','','','','','','','','','','demo-shop-250','','','','0','2022-02-20 13:36:34','2022-02-20 13:36:34');
INSERT INTO shops VALUES('31','256','','','','','','','','','','demo-shop-256','','','','0','2022-03-30 12:18:53','2022-03-30 12:18:53');
INSERT INTO shops VALUES('32','259','','','','','','','','','','demo-shop-259','','','','0','2022-04-03 15:49:10','2022-04-03 15:49:10');
INSERT INTO shops VALUES('33','270','123123','','','','','','','','','demo-shop-270','','','','0','2022-04-07 06:38:11','2022-04-07 06:58:32');
INSERT INTO shops VALUES('34','272','aaa','','','asd','Chabahil','','','','','aaa-','','','','0','2022-04-19 14:10:28','2022-04-19 14:10:28');
INSERT INTO shops VALUES('35','273','asdf','uploads/shop/logo/B5dOvsGDzIUkE5QAgB7aMuVGqs3nRciQFEVCJ5wR.jpg','','asf','Chabahil','','','','','asdf-','','','','0','2022-04-19 14:15:45','2022-04-19 14:15:45');
INSERT INTO shops VALUES('36','274','asf','uploads/shop/logo/35EYxl7uv7jirmXU5XNGwla3yB08TfxFLkIPIAYB.jpg','','23','Thimi','','','','','asf-','','','','0','2022-04-19 14:24:05','2022-04-19 14:24:05');
INSERT INTO shops VALUES('37','275','qer','uploads/shop/logo/deA4wynEnSfaMnRuCZzpViEQlpnzd6chB45nzbzB.jpg','','123','Thimi','','','','','qer-','','','','0','2022-04-19 14:38:59','2022-04-19 14:38:59');
INSERT INTO shops VALUES('38','276','2222','uploads/shop/logo/FetvgvuYUccYUNL47VlFo4Z3tbmAPV3EcZQqCikF.jpg','','2222','Thimi','','','','','2222-38','222','222','["4"]','0','2022-04-19 14:39:50','2022-04-19 15:15:21');
INSERT INTO shops VALUES('39','277','zxcv','','','zxcv','Chabahil','','','','','zxcv-','','','','0','2022-12-08 23:42:54','2022-12-08 23:42:54');
INSERT INTO shops VALUES('40','278','asdf','','','asdf','Thimi','','','','','asdf-','','','','0','2022-12-08 23:46:12','2022-12-08 23:46:12');


DROP TABLE IF EXISTS sliders;

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sliders VALUES('31','uploads/sliders/qcAO6ifyeXIVHPV4t9LH4EuXN6qnpJByAtKEEpyK.jpg','1','https://sewa-digital.nextnepal.org/','2022-02-15 11:12:57','2022-04-17 08:28:08');
INSERT INTO sliders VALUES('32','uploads/sliders/hX2I6MxAgoypY5gDK9IjTAhoA1JJAZto9QVfuO9P.jpg','1','https://sewa-digital.nextnepal.org/','2022-02-15 11:13:42','2022-04-17 08:28:27');
INSERT INTO sliders VALUES('33','uploads/sliders/Hav5Hvvz4shKST1CS9YVQIiMRhyq0GMc8u0Q0Ytq.jpg','1','Main Banner','2022-03-27 09:25:45','2022-04-17 08:28:40');


DROP TABLE IF EXISTS staff;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO staff VALUES('5','204','4','2021-08-19 12:22:58','2021-08-19 12:22:58');
INSERT INTO staff VALUES('6','205','2','2021-08-19 12:24:02','2021-08-19 12:24:02');
INSERT INTO staff VALUES('7','206','3','2021-08-19 12:25:31','2021-08-19 12:25:31');


DROP TABLE IF EXISTS states;

CREATE TABLE `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  KEY `states_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO states VALUES('1','Kathmandu','154','','2022-04-17 07:47:55','2022-04-17 07:47:55');
INSERT INTO states VALUES('2','Lalitpur','154','','2022-04-17 07:48:40','2022-04-17 07:49:22');
INSERT INTO states VALUES('3','Bhaktapur','154','','2022-04-17 07:49:04','2022-04-17 07:49:04');


DROP TABLE IF EXISTS sub_categories;

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sub_categories VALUES('1','Nail Art & Tools','6','nail-art-tools','Nail Art & Tools','Nail Art & Tools','2019-03-12 11:58:24','2020-06-04 01:33:47');
INSERT INTO sub_categories VALUES('2','Skin Care','6','skin-care','Skin Care','Skin Care','2019-03-12 11:58:44','2020-06-04 01:33:06');
INSERT INTO sub_categories VALUES('3','Makeup','6','Makeup','Makeup','Makeup','2019-03-12 11:58:59','2020-06-04 01:32:27');
INSERT INTO sub_categories VALUES('4','Mobile  Accessories','11','mobile-accessories','Mobile Phone Accessories','Mobile Phone Accessories','2019-03-12 12:03:25','2020-06-04 01:31:08');
INSERT INTO sub_categories VALUES('5','Mobile Phone Parts','11','mobile-phone-parts','Mobile Phone Parts','Mobile Phone Parts','2019-03-12 12:03:38','2020-06-04 01:30:23');
INSERT INTO sub_categories VALUES('6','Mobile Phones','11','mobile-phones','Mobile Phones','Mobile Phones','2019-03-12 12:03:51','2020-06-04 01:29:53');
INSERT INTO sub_categories VALUES('7','Home Decor','7','home-decor','Home Decor','Home Decor','2019-03-12 12:04:05','2020-06-04 01:28:55');
INSERT INTO sub_categories VALUES('8','Home Textile','7','home-textile','Home Textile','Home Textile','2019-03-12 12:04:13','2020-06-04 01:28:20');
INSERT INTO sub_categories VALUES('9','Furniture','7','furniture','Furniture','Furniture','2019-03-12 12:04:22','2020-06-04 01:27:32');
INSERT INTO sub_categories VALUES('10','Indoor Lighting','7','Indoor-Lighting','Indoor Lighting','Indoor Lighting','2020-06-04 01:34:17','2020-06-04 01:34:29');
INSERT INTO sub_categories VALUES('14','Cycling','9','Cycling-uGuZK','Cycling','Cycling','2020-06-04 01:36:27','2020-06-04 01:36:27');
INSERT INTO sub_categories VALUES('15','Swimming','9','Swimming-X9V9a','Swimming','Swimming','2020-06-04 01:36:45','2020-06-04 01:36:45');
INSERT INTO sub_categories VALUES('16','Baby & Mother','2','Baby--Mother-w1QB0','Baby & Mother','Baby & Mother','2020-06-04 01:37:15','2020-06-04 01:37:15');
INSERT INTO sub_categories VALUES('17','Shoes & Bag','2','Shoes--Bag-yrbVX','Shoes & Bag','Shoes & Bag','2020-06-04 01:37:35','2020-06-04 01:37:35');
INSERT INTO sub_categories VALUES('18','Girls Clothing','2','Girls-Clothing-0Zpat','Girls Clothing','Girls Clothing','2020-06-04 01:37:52','2020-06-04 01:37:52');
INSERT INTO sub_categories VALUES('19','Boys Clothing','2','Boys-Clothing-uub2m','Boys Clothing','Boys Clothing','2020-06-04 01:38:11','2020-06-04 01:38:11');
INSERT INTO sub_categories VALUES('20','Baby Clothing','2','Baby-Clothing-Z2EOV','Baby Clothing','Baby Clothing','2020-06-04 01:38:34','2020-06-04 01:38:34');
INSERT INTO sub_categories VALUES('21','Motor bike','8','Motor-bike-0qKT9','Motor bike','Motor bike','2020-06-04 01:38:58','2020-06-04 01:38:58');
INSERT INTO sub_categories VALUES('22','SUV','8','SUV-1AlvL','SUV','SUV','2020-06-04 01:39:15','2020-06-04 01:39:15');
INSERT INTO sub_categories VALUES('23','Four Seater sedan','8','Four-Seater-sedan-Sut59','Four Seater sedan','Four Seater sedan','2020-06-04 01:39:34','2020-06-04 01:39:34');
INSERT INTO sub_categories VALUES('27','Accessories','4','Accessories-FqBZZ','Accessories','Accessories','2020-06-04 01:41:08','2020-06-04 01:41:08');
INSERT INTO sub_categories VALUES('28','Underwear & Loungewear Accessories','4','Underwear--Loungewear-Accessories-8TlK0','Underwear & Loungewear Accessories','Underwear & Loungewear Accessories','2020-06-04 01:41:30','2020-06-04 01:41:30');
INSERT INTO sub_categories VALUES('29','Outwear & jackets','4','Outwear--jackets-mjIMA','Outwear & jackets','Outwear & jackets','2020-06-04 01:41:59','2020-06-04 01:41:59');
INSERT INTO sub_categories VALUES('30','Wedding & events','1','Wedding--events-ytBZC','Wedding & events','Wedding & events','2020-06-04 01:42:22','2020-06-04 01:42:22');
INSERT INTO sub_categories VALUES('33','Beverages','3','Beverages-ZAzc7','Beverages','Beverages','2020-06-05 00:35:25','2020-06-05 00:35:25');
INSERT INTO sub_categories VALUES('34','Breakfast','3','Breakfast-FEVUk','','Breakfast','2020-06-05 00:43:10','2020-06-05 00:43:10');
INSERT INTO sub_categories VALUES('35','Canned, Dry & Packaged Foods','3','Canned-Dry--Packaged-Foods-ooWiY','','Canned, Dry & Packaged Foods','2020-06-05 00:43:54','2020-06-05 00:43:54');
INSERT INTO sub_categories VALUES('36','Cooking Ingredients','3','Cooking-Ingredients-cXlml','','Cooking Ingredients','2020-06-05 00:45:23','2020-06-05 00:45:23');
INSERT INTO sub_categories VALUES('37','Laundry & Household','3','Laundry--Household-OQIst','Laundry & Household','Laundry & Household','2020-06-05 00:46:02','2020-06-05 00:46:02');
INSERT INTO sub_categories VALUES('38','Wines Beers & Alcohol','3','Wines-Beers--Alcohol-nKl8I','Wines Beers & Alcohol','Wines Beers & Alcohol','2020-06-05 00:46:30','2020-06-05 00:46:30');
INSERT INTO sub_categories VALUES('39','Tobaco','3','Tobaco-IKCjS','','Tobaco','2020-06-05 00:47:10','2020-06-05 00:47:10');
INSERT INTO sub_categories VALUES('40','Pet Supplies','3','Pet-Supplies-0Z27V','','Pet Supplies','2020-06-05 00:47:42','2020-06-05 00:47:42');
INSERT INTO sub_categories VALUES('41','Snacks','3','Snacks-Uz2U8','Snacks','Snacks','2020-06-05 01:13:17','2020-06-05 01:13:17');
INSERT INTO sub_categories VALUES('42','Candy & Chocolate','3','Candy--Chocolate-K8asX','Candy & Chocolate','Candy & Chocolate','2020-06-05 01:16:16','2020-06-05 01:16:16');
INSERT INTO sub_categories VALUES('43','Bath & Body','6','Bath--Body-d2sMQ','Bath & Body','Bath & Body','2020-06-05 01:19:35','2020-06-05 01:19:35');
INSERT INTO sub_categories VALUES('44','Beauty Tools','6','Beauty-Tools-nACxJ','Beauty Tools','Beauty Tools','2020-06-05 01:20:08','2020-06-05 01:20:08');
INSERT INTO sub_categories VALUES('45','Fragrances','6','Fragrances-eOTnD','Fragrances','Fragrances','2020-06-05 01:20:32','2020-06-05 01:20:32');
INSERT INTO sub_categories VALUES('46','Hair Care','6','Hair-Care-4Blvr','Hair Care','Hair Care','2020-06-05 01:21:00','2020-06-05 01:21:00');
INSERT INTO sub_categories VALUES('47','Men's Care','6','Mens-Care-ZgcP9','Men's Care','Men's Care','2020-06-05 01:21:44','2020-06-05 01:21:44');
INSERT INTO sub_categories VALUES('48','Personal Care','6','Personal-Care-XglBm','Personal Care','Personal Care','2020-06-05 01:22:16','2020-06-05 01:22:16');
INSERT INTO sub_categories VALUES('49','Food Supplements','6','Food-Supplements-rtFyX','Food Supplements','Food Supplements','2020-06-05 01:23:11','2020-06-05 01:23:11');
INSERT INTO sub_categories VALUES('50','Medical Supplies','6','Medical-Supplies-aV13Y','Medical Supplies','Medical Supplies','2020-06-05 01:23:48','2020-06-05 01:23:48');
INSERT INTO sub_categories VALUES('51','Mobiles','11','Mobiles-PW6X7','Mobiles','Mobiles','2020-06-05 01:53:46','2020-06-05 01:53:46');
INSERT INTO sub_categories VALUES('52','Tablets','11','Tablets-iBk24','Tablets','Tablets','2020-06-05 01:54:10','2020-06-05 01:54:10');
INSERT INTO sub_categories VALUES('58','Bicycles','9','Bicycles-Gkmo2','Bicycles','Bicycles','2020-06-07 00:19:26','2020-06-07 00:19:26');
INSERT INTO sub_categories VALUES('59','Travel Backpack','9','Travel-Backpack-2lyXl','Travel Backpack in Nepal','Travel Backpack in Nepal','2020-06-08 00:28:15','2020-06-08 00:28:15');
INSERT INTO sub_categories VALUES('60','Sleeping Bag','9','Sleeping-Bag-vFrec','Sleeping Bag in nepal','Sleeping Bag in kathmandu nepal','2020-06-08 00:28:46','2020-06-08 00:28:46');
INSERT INTO sub_categories VALUES('61','Rain Cover','9','Rain-Cover-uft91','Rain Cover in Nepal','Rain Cover in Kathmandu Nepal','2020-06-08 00:29:40','2020-06-08 00:29:40');
INSERT INTO sub_categories VALUES('62','Hiking','9','Hiking-LzhEw','Hiking in nepal','Hiking products in kathmandu Nepal','2020-06-08 00:31:12','2020-06-08 00:31:12');
INSERT INTO sub_categories VALUES('63','Camping','9','Camping-TiAMN','Camping in nepal','Camping products in Kathmandu Nepal','2020-06-08 00:31:45','2020-06-08 00:31:45');
INSERT INTO sub_categories VALUES('64','Yoga','9','Yoga-nVr1q','Yoga Products','Yoga Products in nepal','2020-06-08 00:32:23','2020-06-08 00:32:23');
INSERT INTO sub_categories VALUES('65','Fitness Equipment','9','Fitness-Equipment-OHBNp','Fitness Equipment products','Fitness Equipment products in kathmandu,Nepal','2020-06-08 00:32:57','2020-06-08 00:32:57');
INSERT INTO sub_categories VALUES('66','Car Entertainment','8','Car-Entertainment-trcxI','Car Entertainment products','Car Entertainment products in nepal','2020-06-08 00:34:44','2020-06-08 00:34:44');
INSERT INTO sub_categories VALUES('67','Lighting','8','Lighting-zPlg6','Lighting','Lighting','2020-06-08 00:35:18','2020-06-08 00:35:18');
INSERT INTO sub_categories VALUES('68','Kitchenware','7','Kitchenware-57VeS','Kitchenware','Kitchenware','2020-06-08 00:40:10','2020-06-08 00:40:10');
INSERT INTO sub_categories VALUES('69','Strollers','2','Strollers-bdbAg','Strollers for baby','Strollers for baby','2020-06-08 00:48:34','2020-06-08 00:48:34');
INSERT INTO sub_categories VALUES('70','Baby Carrier','2','Baby-Carrier-feywa','Baby Carrier','Baby Carrier','2020-06-08 00:49:17','2020-06-08 00:49:17');
INSERT INTO sub_categories VALUES('71','Mosquito Net','2','Mosquito-Net-ZQLPP','Mosquito Net','Mosquito Net','2020-06-08 00:49:56','2020-06-08 00:49:56');
INSERT INTO sub_categories VALUES('72','Safety Seat Cushion','2','Safety-Seat-Cushion-KBqpu','Safety Seat Cushion','Safety Seat Cushion','2020-06-08 00:50:44','2020-06-08 00:50:44');
INSERT INTO sub_categories VALUES('73','Accessories','2','Accessories-lvsak','Accessories','Accessories','2020-06-08 00:51:43','2020-06-08 00:51:43');
INSERT INTO sub_categories VALUES('74','Toys','2','Toys-dZqaJ','Toys','Toys','2020-06-08 00:52:42','2020-06-08 00:52:42');
INSERT INTO sub_categories VALUES('75','Meat & Fish','3','Meat--Fish-sdHxL','Meat & Fish','Meat & Fish','2020-06-08 14:30:17','2020-06-08 14:30:17');
INSERT INTO sub_categories VALUES('76','Food Staples','3','Food-Staples-xpcIR','Food Staples| Food products and many more','Food products in Nepal','2020-06-08 21:21:05','2020-06-08 21:21:54');
INSERT INTO sub_categories VALUES('77','Cooking Ingredients','1','Cooking-Ingredients-hC5f1','Cooking Ingredients','Cooking Ingredients','2020-06-08 21:29:09','2020-06-08 21:29:09');
INSERT INTO sub_categories VALUES('78','Shoes','1','Shoes-ln2XP','Shoes for girls','','2020-11-06 12:59:39','2020-11-06 12:59:39');
INSERT INTO sub_categories VALUES('79','Shoes','4','Shoes-Ap9zB','Shoes for boys','','2020-11-06 13:00:10','2020-11-06 13:00:10');
INSERT INTO sub_categories VALUES('80','Tea and Coffee','3','Tea-and-Coffee-Q2FzI','Tea','','2021-06-01 12:52:31','2021-06-01 12:52:31');
INSERT INTO sub_categories VALUES('83','Subcategory A','17','Subcategory-A-sdOEv','Subcategory A','','2021-12-13 06:14:12','2021-12-13 06:14:12');
INSERT INTO sub_categories VALUES('85','Feature Phones','16','Feature-Phones-IGgjQ','Feature Phones','Feature Phones','2022-04-04 11:26:10','2022-04-04 11:26:10');
INSERT INTO sub_categories VALUES('86','Tablets','1','Tablets-KXDPA','Tablets','Tablets','2022-04-04 11:26:34','2022-04-04 11:26:34');
INSERT INTO sub_categories VALUES('87','Laptops','16','Laptops-6Ol8X','Laptops','Laptops','2022-04-04 11:26:59','2022-04-04 11:26:59');
INSERT INTO sub_categories VALUES('88','Desktops','16','Desktops-tD1jD','Desktops','Desktops','2022-04-04 11:27:21','2022-04-04 11:27:21');
INSERT INTO sub_categories VALUES('89','Gaming Consoles','16','Gaming-Consoles-xf1f9','Gaming Consoles','Gaming Consoles','2022-04-04 11:27:55','2022-04-04 11:27:55');
INSERT INTO sub_categories VALUES('90','Cameras','16','Cameras-Fc4j1','Cameras','Cameras','2022-04-04 11:29:04','2022-04-04 11:29:04');
INSERT INTO sub_categories VALUES('91','Printers','16','Printers-5AeFD','Printers','Printers','2022-04-04 11:29:29','2022-04-04 11:29:29');
INSERT INTO sub_categories VALUES('92','Smart Phones','16','Smart-Phones-Qumck','Smart Phone','Smart Phone','2022-04-04 11:31:05','2022-04-04 11:31:05');
INSERT INTO sub_categories VALUES('93','Mobile Accessories','11','Mobile-Accessories-jGCe2','Mobile Accessories','Mobile Accessories','2022-04-04 13:09:39','2022-04-04 13:09:39');
INSERT INTO sub_categories VALUES('94','Audio','11','Audio-BwWGW','Audio','Audio','2022-04-04 13:10:04','2022-04-04 13:10:04');
INSERT INTO sub_categories VALUES('95','Wearable','11','Wearable-h0VSX','Wearable','Wearable','2022-04-04 13:10:39','2022-04-04 13:10:39');
INSERT INTO sub_categories VALUES('96','Console Accessories','11','Console-Accessories-PYOms','Console Accessories','Console Accessories','2022-04-04 13:11:15','2022-04-04 13:11:15');
INSERT INTO sub_categories VALUES('97','Camera Accessories','11','Camera-Accessories-6zBQN','Camera Accessories','','2022-04-04 13:11:46','2022-04-04 13:11:46');
INSERT INTO sub_categories VALUES('98','Storage','11','Storage-7B21h','Storage','','2022-04-04 13:12:27','2022-04-04 13:12:27');
INSERT INTO sub_categories VALUES('99','Computer Component','11','Computer-Component-TqFPY','Computer Component','','2022-04-04 13:13:01','2022-04-04 13:13:01');
INSERT INTO sub_categories VALUES('100','Network components','11','Network-components-QJR5m','Network Components','','2022-04-04 13:13:55','2022-04-04 13:13:55');
INSERT INTO sub_categories VALUES('101','Televisions','17','Televisions-V1Fw9','Televisions','Televisions','2022-04-04 13:17:49','2022-04-04 13:17:49');
INSERT INTO sub_categories VALUES('102','TV Accessories','17','TV-Accessories-cim4V','TV Accessories','TV Accessories','2022-04-04 13:19:14','2022-04-04 13:19:14');
INSERT INTO sub_categories VALUES('103','Audio & Video Devices','17','Audio--Video-Devices-Hm4Pk','Audio & Video Devices','Audio & Video Devices','2022-04-04 13:20:06','2022-04-04 13:20:06');
INSERT INTO sub_categories VALUES('104','Large Appliances','17','Large-Appliances-QP07K','Large Appliances','Large Appliances','2022-04-04 13:20:24','2022-04-04 13:20:24');
INSERT INTO sub_categories VALUES('105','Small Kitchen Appliances','17','Small-Kitchen-Appliances-VWpK0','Small Kitchen Appliances','Small Kitchen Appliances','2022-04-04 13:20:40','2022-04-04 13:20:40');
INSERT INTO sub_categories VALUES('106','Cooling & Heating','17','Cooling--Heating-2v57K','Cooling & Heating','Cooling & Heating','2022-04-04 13:20:57','2022-04-04 13:20:57');
INSERT INTO sub_categories VALUES('107','Vacuums & Floor Care','17','Vacuums--Floor-Care-0ERw3','Vacuums & Floor Care','Vacuums & Floor Care','2022-04-04 13:21:14','2022-04-04 13:21:14');
INSERT INTO sub_categories VALUES('108','Iron & Garment Care','17','Iron--Garment-Care-n8NBu','Iron & Garment Care','Iron & Garment Care','2022-04-04 13:21:32','2022-04-04 13:21:32');
INSERT INTO sub_categories VALUES('109','Bath & Body','6','Bath--Body-1pKLq','Bath & Body','','2022-04-04 13:22:31','2022-04-04 13:22:31');
INSERT INTO sub_categories VALUES('110','Beauty Tools','6','Beauty-Tools-JhfWZ','Beauty Tools','Beauty Tools','2022-04-04 13:22:47','2022-04-04 13:22:47');
INSERT INTO sub_categories VALUES('111','Fragrances','6','Fragrances-kECvb','Fragrances','Fragrances','2022-04-04 13:23:30','2022-04-04 13:23:30');
INSERT INTO sub_categories VALUES('112','Hair Care','6','Hair-Care-0oCLQ','Hair Care','Hair Care','2022-04-04 13:23:43','2022-04-04 13:23:43');
INSERT INTO sub_categories VALUES('113','Makeup','6','Makeup-9YVt0','Makeup','Makeup','2022-04-04 13:23:56','2022-04-04 13:23:56');
INSERT INTO sub_categories VALUES('114','Men's Care','6','Mens-Care-2xEP7','Men's Care','Men's Care','2022-04-04 13:24:13','2022-04-04 13:24:13');
INSERT INTO sub_categories VALUES('115','Personal Care','6','Personal-Care-Oa60A','Personal Care','Personal Care','2022-04-04 13:24:29','2022-04-04 13:24:29');
INSERT INTO sub_categories VALUES('116','Skin Care','6','Skin-Care-zAELh','Skin Care','Skin Care','2022-04-04 13:24:43','2022-04-04 13:24:43');
INSERT INTO sub_categories VALUES('117','Food Supplements','6','Food-Supplements-AIW6i','Food Supplements','Food Supplements','2022-04-04 13:24:57','2022-04-04 13:24:57');
INSERT INTO sub_categories VALUES('118','Medical Supplies','6','Medical-Supplies-vSgr8','Medical Supplies','Medical Supplies','2022-04-04 13:25:10','2022-04-04 13:25:10');
INSERT INTO sub_categories VALUES('119','Disposable Diapers','2','Disposable-Diapers-xLqug','Disposable Diapers','Disposable Diapers','2022-04-04 13:26:05','2022-04-04 13:26:05');
INSERT INTO sub_categories VALUES('120','Disposable Diapers','2','Disposable-Diapers-SJMVn','Disposable Diapers','Disposable Diapers','2022-04-04 13:26:06','2022-04-04 13:26:06');
INSERT INTO sub_categories VALUES('121','Baby Gear','2','Baby-Gear-KN2NP','Baby Gear','Baby Gear','2022-04-04 13:26:34','2022-04-04 13:26:34');
INSERT INTO sub_categories VALUES('122','Baby Personal Care','2','Baby-Personal-Care-jZHV0','Baby Personal Care','Baby Personal Care','2022-04-04 13:26:47','2022-04-04 13:26:47');
INSERT INTO sub_categories VALUES('123','Clothing & Accessories','2','Clothing--Accessories-RcuOc','Clothing & Accessories','Clothing & Accessories','2022-04-04 13:27:06','2022-04-04 13:27:06');
INSERT INTO sub_categories VALUES('124','Diapering & Potty','2','Diapering--Potty-rf42D','Diapering & Potty','Diapering & Potty','2022-04-04 13:27:20','2022-04-04 13:27:20');
INSERT INTO sub_categories VALUES('125','Feeding','2','Feeding-sTDIp','Feeding','Feeding','2022-04-04 13:27:34','2022-04-04 13:27:34');
INSERT INTO sub_categories VALUES('126','Nursery','2','Nursery-J1G7E','Nursery','Nursery','2022-04-04 13:27:49','2022-04-04 13:27:49');
INSERT INTO sub_categories VALUES('127','Baby & Toddler Toys','2','Baby--Toddler-Toys-2xXaI','Baby & Toddler Toys','Baby & Toddler Toys','2022-04-04 13:28:02','2022-04-04 13:28:02');
INSERT INTO sub_categories VALUES('128','Toys & Games','2','Toys--Games-kJdSz','Toys & Games','Toys & Games','2022-04-04 13:28:15','2022-04-04 13:28:15');
INSERT INTO sub_categories VALUES('129','Toys & Games','2','Toys--Games-A4Nwg','Toys & Games','Toys & Games','2022-04-04 13:28:27','2022-04-04 13:28:27');
INSERT INTO sub_categories VALUES('130','Sports & Outdoor Play','2','Sports--Outdoor-Play-xdHgY','Sports & Outdoor Play','Sports & Outdoor Play','2022-04-04 13:28:39','2022-04-04 13:28:39');
INSERT INTO sub_categories VALUES('131','Pacifiers & Accessories','2','Pacifiers--Accessories-nc03b','Pacifiers & Accessories','Pacifiers & Accessories','2022-04-04 13:28:53','2022-04-04 13:28:53');
INSERT INTO sub_categories VALUES('132','Groceries','3','Groceries-wERii','Groceries','Groceries','2022-04-04 13:34:29','2022-04-04 13:34:29');
INSERT INTO sub_categories VALUES('133','Beverages','3','Beverages-n6bnX','Beverages','Beverages','2022-04-04 13:34:47','2022-04-04 13:34:47');
INSERT INTO sub_categories VALUES('134','Breakfast, Choco & Snacks','3','Breakfast-Choco--Snacks-aXVfv','Breakfast, Choco & Snacks','Breakfast, Choco & Snacks','2022-04-04 13:35:02','2022-04-04 13:35:02');
INSERT INTO sub_categories VALUES('135','Food Staples','3','Food-Staples-Qj5Zc','Food Staples','Food Staples','2022-04-04 13:35:28','2022-04-04 13:35:28');
INSERT INTO sub_categories VALUES('136','Cooking Ingredients','3','Cooking-Ingredients-AmXse','Cooking Ingredients','Cooking Ingredients','2022-04-04 13:35:41','2022-04-04 13:35:41');
INSERT INTO sub_categories VALUES('137','Laundry & Household','3','Laundry--Household-xueX5','Laundry & Household','Laundry & Household','2022-04-04 13:35:58','2022-04-04 13:35:58');
INSERT INTO sub_categories VALUES('138','Wines, Beers & Spirits','3','Wines-Beers--Spirits-Iw988','Wines, Beers & Spirits','Wines, Beers & Spirits','2022-04-04 13:36:27','2022-04-04 13:36:27');
INSERT INTO sub_categories VALUES('139','Pet Supplies','3','Pet-Supplies-HGTpT','Pet Supplies','Pet Supplies','2022-04-04 13:36:54','2022-04-04 13:36:54');
INSERT INTO sub_categories VALUES('140','Bath','7','Bath-f2Gam','Bath','Bath','2022-04-04 13:38:16','2022-04-04 13:38:16');
INSERT INTO sub_categories VALUES('141','Bedding','7','Bedding-QpRUl','Bedding','Bedding','2022-04-04 13:38:41','2022-04-04 13:38:41');
INSERT INTO sub_categories VALUES('142','Decor','7','Decor-cDoTT','Decor','Decor','2022-04-04 13:38:57','2022-04-04 13:38:57');
INSERT INTO sub_categories VALUES('143','Furniture','7','Furniture-MuqBn','Furniture','Furniture','2022-04-04 13:39:13','2022-04-04 13:39:13');
INSERT INTO sub_categories VALUES('144','Kitchen & Dining','7','Kitchen--Dining-nMPzh','Kitchen & Dining','Kitchen & Dining','2022-04-04 13:40:51','2022-04-04 13:40:51');
INSERT INTO sub_categories VALUES('145','Lighting','7','Lighting-IWdGf','Lighting','','2022-04-04 13:42:30','2022-04-04 13:42:30');
INSERT INTO sub_categories VALUES('146','Laundry & Cleaning','7','Laundry--Cleaning-HBWbH','Laundry & Cleaning','Laundry & Cleaning','2022-04-04 13:42:45','2022-04-04 13:42:45');
INSERT INTO sub_categories VALUES('147','Tools, DIY & Outdoor','7','Tools-DIY--Outdoor-jf4As','Tools, DIY & Outdoor','Tools, DIY & Outdoor','2022-04-04 13:42:59','2022-04-04 13:42:59');
INSERT INTO sub_categories VALUES('148','Stationery & Craft','7','Stationery--Craft-H4rSN','Stationery & Craft','','2022-04-04 13:43:12','2022-04-04 13:43:12');
INSERT INTO sub_categories VALUES('149','Art Supplies','7','Art-Supplies-g4uu0','Art Supplies','Art Supplies','2022-04-04 13:43:28','2022-04-04 13:43:28');
INSERT INTO sub_categories VALUES('150','Gifts & Wrapping','7','Gifts--Wrapping-rCUQG','Gifts & Wrapping','Gifts & Wrapping','2022-04-04 13:43:42','2022-04-04 13:43:42');
INSERT INTO sub_categories VALUES('151','Packaging & Cartons','7','Packaging--Cartons-JZ3RM','Packaging & Cartons','Packaging & Cartons','2022-04-04 13:43:56','2022-04-04 13:43:56');
INSERT INTO sub_categories VALUES('152','Paper Products','7','Paper-Products-hQOvm','Paper Products','Paper Products','2022-04-04 13:44:11','2022-04-04 13:44:11');
INSERT INTO sub_categories VALUES('153','School & Office Equipment','7','School--Office-Equipment-qJ2AH','School & Office Equipment','','2022-04-04 13:44:24','2022-04-04 13:44:24');
INSERT INTO sub_categories VALUES('154','Musical Instruments','7','Musical-Instruments-LA2re','Musical Instruments','','2022-04-04 13:44:46','2022-04-04 13:44:46');
INSERT INTO sub_categories VALUES('155','Clothing','4','Clothing-1RTUV','Clothing','','2022-04-04 13:45:47','2022-04-04 13:45:47');
INSERT INTO sub_categories VALUES('156','Clothing','4','Clothing-knRl7','Clothing','','2022-04-04 13:45:48','2022-04-04 13:45:48');
INSERT INTO sub_categories VALUES('157','Men's Bags','4','Mens-Bags-kMvJv','Men's Bags','Men's Bags','2022-04-04 13:46:04','2022-04-04 13:46:04');
INSERT INTO sub_categories VALUES('158','Shoes','4','Shoes-c458t','Shoes','Shoes','2022-04-04 13:46:18','2022-04-04 13:46:18');
INSERT INTO sub_categories VALUES('159','Accessories','4','Accessories-Gszy1','Accessories','Accessories','2022-04-04 13:46:32','2022-04-04 13:46:32');
INSERT INTO sub_categories VALUES('160','Boy's Fashion','4','Boys-Fashion-wvhDa','Boy's Fashion','Boy's Fashion','2022-04-04 13:46:49','2022-04-04 13:46:49');
INSERT INTO sub_categories VALUES('161','Men's Underwear','4','Mens-Underwear-F6LzY','Men's Underwear','Men's Underwear','2022-04-04 13:47:04','2022-04-04 13:47:04');
INSERT INTO sub_categories VALUES('162','Men's Watch','4','Mens-Watch-WTzdz','Men's Watch','','2022-04-04 13:47:33','2022-04-04 13:47:33');
INSERT INTO sub_categories VALUES('163','Clothing','1','Clothing-ebLHr','Clothing','Clothing','2022-04-04 13:48:16','2022-04-04 13:48:16');
INSERT INTO sub_categories VALUES('164','Traditional Clothing','1','Traditional-Clothing-6sQND','Traditional Clothing','Traditional Clothing','2022-04-04 13:48:28','2022-04-04 13:48:28');
INSERT INTO sub_categories VALUES('165','Women's Bags','1','Womens-Bags-1zmpj','Women's Bags','Women's Bags','2022-04-04 13:48:39','2022-04-04 13:48:39');
INSERT INTO sub_categories VALUES('166','Shoes','1','Shoes-YJqEQ','Shoes','Shoes','2022-04-04 13:48:49','2022-04-04 13:48:49');
INSERT INTO sub_categories VALUES('167','Accessories','1','Accessories-RJkbQ','Accessories','Accessories','2022-04-04 13:48:59','2022-04-04 13:48:59');
INSERT INTO sub_categories VALUES('168','Accessories','1','Accessories-jhNbV','Accessories','Accessories','2022-04-04 13:49:11','2022-04-04 13:49:11');
INSERT INTO sub_categories VALUES('169','Girl's Fashion','1','Girls-Fashion-Jffg2','Girl's Fashion','Girl's Fashion','2022-04-04 13:49:22','2022-04-04 13:49:22');
INSERT INTO sub_categories VALUES('170','Men's Watches','21','Mens-Watches-FJEHT','Men's Watches','Men's Watches','2022-04-04 13:50:12','2022-04-04 13:50:12');
INSERT INTO sub_categories VALUES('171','Women's Watches','21','Womens-Watches-rd2Gu','Women's Watches','Women's Watches','2022-04-04 13:50:28','2022-04-04 13:50:28');
INSERT INTO sub_categories VALUES('172','Kid's Watches','21','Kids-Watches-2A9gw','Kid's Watches','Kid's Watches','2022-04-04 13:50:41','2022-04-04 13:50:41');
INSERT INTO sub_categories VALUES('173','Sunglasses','21','Sunglasses-DpwcM','Sunglasses','Sunglasses','2022-04-04 13:50:56','2022-04-04 13:50:56');
INSERT INTO sub_categories VALUES('174','Eyeglasses','21','Eyeglasses-8LFdw','Eyeglasses','Eyeglasses','2022-04-04 13:51:11','2022-04-04 13:51:11');
INSERT INTO sub_categories VALUES('175','Women Fashion Jewellery','21','Women-Fashion-Jewellery-KzKRr','Women Fashion Jewellery','Women Fashion Jewellery','2022-04-04 13:51:23','2022-04-04 13:51:23');
INSERT INTO sub_categories VALUES('176','Men Fashion Jewellery','21','Men-Fashion-Jewellery-Aktbi','Men Fashion Jewellery','Men Fashion Jewellery','2022-04-04 13:51:36','2022-04-04 13:51:36');
INSERT INTO sub_categories VALUES('177','Men Shoes & Clothing','9','Men-Shoes--Clothing-ZQlR1','Men Shoes & Clothing','Men Shoes & Clothing','2022-04-04 13:54:11','2022-04-04 13:54:11');
INSERT INTO sub_categories VALUES('178','Women Shoes & Clothing','9','Women-Shoes--Clothing-Uf3Yy','Women Shoes & Clothing','Women Shoes & Clothing','2022-04-04 13:54:28','2022-04-04 13:54:28');
INSERT INTO sub_categories VALUES('179','Women Shoes & Clothing','9','Women-Shoes--Clothing-vOLYq','Women Shoes & Clothing','Women Shoes & Clothing','2022-04-04 13:54:29','2022-04-04 13:54:29');
INSERT INTO sub_categories VALUES('180','Outdoor Recreation','9','Outdoor-Recreation-m9u1C','Outdoor Recreation','Outdoor Recreation','2022-04-04 13:54:44','2022-04-04 13:54:44');
INSERT INTO sub_categories VALUES('181','Exercise & Fitness','9','Exercise--Fitness-KByWB','Exercise & Fitness','Exercise & Fitness','2022-04-04 13:54:58','2022-04-04 13:54:58');
INSERT INTO sub_categories VALUES('182','Water Sports','9','Water-Sports-0vSXJ','Water Sports','Water Sports','2022-04-04 13:55:11','2022-04-04 13:55:11');
INSERT INTO sub_categories VALUES('183','Racket Sports','9','Racket-Sports-FxcV8','Racket Sports','Racket Sports','2022-04-04 13:55:26','2022-04-04 13:55:26');
INSERT INTO sub_categories VALUES('184','Team Sports','9','Team-Sports-XTIi1','Team Sports','Team Sports','2022-04-04 13:55:40','2022-04-04 13:55:40');
INSERT INTO sub_categories VALUES('185','Water Bottles','9','Water-Bottles-rqFWA','Water Bottles','Water Bottles','2022-04-04 13:55:54','2022-04-04 13:55:54');
INSERT INTO sub_categories VALUES('186','Travel & Luggage','9','Travel--Luggage-gbgva','Travel & Luggage','Travel & Luggage','2022-04-04 13:56:06','2022-04-04 13:56:06');
INSERT INTO sub_categories VALUES('187','Sports Nutrition','9','Sports-Nutrition-wFkzt','Sports Nutrition','Sports Nutrition','2022-04-04 13:56:19','2022-04-04 13:56:19');
INSERT INTO sub_categories VALUES('188','Automotive','8','Automotive-P1Qzk','Automotive','Automotive','2022-04-04 13:59:35','2022-04-04 13:59:35');
INSERT INTO sub_categories VALUES('189','Motorcycles','8','Motorcycles-uPvDk','Motorcycles','Motorcycles','2022-04-04 13:59:58','2022-04-04 13:59:58');
INSERT INTO sub_categories VALUES('190','Auto Care','8','Auto-Care-V5weC','Auto Care','Auto Care','2022-04-04 14:00:09','2022-04-04 14:00:09');
INSERT INTO sub_categories VALUES('191','Auto Electronics','8','Auto-Electronics-ok2aq','Auto Electronics','Auto Electronics','2022-04-04 14:00:21','2022-04-04 14:00:21');
INSERT INTO sub_categories VALUES('192','Moto Parts & Accessories','8','Moto-Parts--Accessories-jaUKQ','Moto Parts & Accessories','Moto Parts & Accessories','2022-04-04 14:00:36','2022-04-04 14:00:36');
INSERT INTO sub_categories VALUES('193','Motorcycle Riding Gear','8','Motorcycle-Riding-Gear-RZjFD','Motorcycle Riding Gear','Motorcycle Riding Gear','2022-04-04 14:00:50','2022-04-04 14:00:50');
INSERT INTO sub_categories VALUES('194','Helmets','8','Helmets-KZI9w','Helmets','Helmets','2022-04-04 14:01:01','2022-04-04 14:01:01');
INSERT INTO sub_categories VALUES('195','Gloves','8','Gloves-hkjM1','Gloves','Gloves','2022-04-04 14:01:13','2022-04-04 14:01:13');
INSERT INTO sub_categories VALUES('196','Interior Accessories','8','Interior-Accessories-uD2n8','Interior Accessories','Interior Accessories','2022-04-04 14:01:31','2022-04-04 14:01:31');
INSERT INTO sub_categories VALUES('197','Auto Oils & Fluids','8','Auto-Oils--Fluids-sb77f','Auto Oils & Fluids','Auto Oils & Fluids','2022-04-04 14:01:43','2022-04-04 14:01:43');
INSERT INTO sub_categories VALUES('198','Auto Tires & Wheels','8','Auto-Tires--Wheels-5zZZo','Auto Tires & Wheels','Auto Tires & Wheels','2022-04-04 14:01:54','2022-04-04 14:01:54');
INSERT INTO sub_categories VALUES('199','Lubricants','8','Lubricants-KVlbD','Lubricants','Lubricants','2022-04-04 14:02:08','2022-04-04 14:02:08');
INSERT INTO sub_categories VALUES('200','Tablets','16','Tablets-KlbV3','Tablets','','2022-04-04 14:43:10','2022-04-04 14:43:10');


DROP TABLE IF EXISTS sub_sub_categories;

CREATE TABLE `sub_sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_sub_category_id` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sub_sub_categories VALUES('2','37','Paper &Tissues','paper-tissues','Paper &Tissues','Paper &Tissues','2019-03-12 12:05:23','2020-06-05 00:57:34');
INSERT INTO sub_sub_categories VALUES('3','37','Detergent','detergent','Detergent','Detergent','2019-03-12 12:05:43','2020-06-05 00:56:13');
INSERT INTO sub_sub_categories VALUES('4','37','Toilet Paper','toilet-paper','Toilet Paper','Toilet Paper','2019-03-12 12:06:28','2020-06-05 00:55:29');
INSERT INTO sub_sub_categories VALUES('5','37','Hand Dishwashing','hand-washing','Hand Dishwashing','Hand Dishwashing','2019-03-12 12:06:40','2020-06-05 00:54:24');
INSERT INTO sub_sub_categories VALUES('6','37','Washing Powder','washing-powder','washing powerd','Washing Powder','2019-03-12 12:06:56','2020-06-05 00:53:41');
INSERT INTO sub_sub_categories VALUES('7','33','Spirits','Spirits','Spirits','Spirits','2019-03-12 12:08:31','2020-06-05 00:52:02');
INSERT INTO sub_sub_categories VALUES('8','38','Beers','beers','Demo sub sub category 3','Beers','2019-03-12 12:08:48','2020-06-05 00:51:24');
INSERT INTO sub_sub_categories VALUES('9','38','Wines','wines','Demo sub sub category 3','wines','2019-03-12 12:09:01','2020-06-05 00:50:57');
INSERT INTO sub_sub_categories VALUES('11','33','Powdered drink mixes','powdered-drinks-mix','Powdered drink mixes','Powdered drink mixes','2019-03-12 12:10:14','2020-06-05 00:40:17');
INSERT INTO sub_sub_categories VALUES('13','33','Tea','tea','Demo sub sub category 1','Tea','2019-03-12 12:10:58','2020-06-05 00:37:27');
INSERT INTO sub_sub_categories VALUES('14','33','Coffee','coffee','Demo sub sub category 1','Coffee','2019-03-12 12:11:16','2020-06-05 00:36:50');
INSERT INTO sub_sub_categories VALUES('15','9','Office Furniture','office-furniture','Office Furniture','Office Furniture','2019-03-12 12:12:17','2020-06-04 01:45:45');
INSERT INTO sub_sub_categories VALUES('16','9','Outdoor Furniture','outdoor-furninture','Outdoor Furniture','Outdoor Furniture','2019-03-12 12:12:29','2020-06-04 01:45:10');
INSERT INTO sub_sub_categories VALUES('17','9','Top Furniture Stores','top-furnitures-stores','Demo sub sub category','Top Furniture Stores','2019-03-12 12:12:41','2020-06-04 01:44:27');
INSERT INTO sub_sub_categories VALUES('18','7','Dining Room Furniture','Dining-Room-Furniture-aPEAU','Dining Room Furniture','Dining Room Furniture','2020-06-04 22:05:59','2020-06-04 22:05:59');
INSERT INTO sub_sub_categories VALUES('19','40','Dog','Dog-SANxW','dog','Dog','2020-06-05 00:48:20','2020-06-05 00:48:20');
INSERT INTO sub_sub_categories VALUES('20','40','Cat','Cat-iDhxV','Cat','Cat','2020-06-05 00:48:57','2020-06-05 00:48:57');
INSERT INTO sub_sub_categories VALUES('21','37','AirCare','AirCare-qkmmC','AirCare','AirCare','2020-06-05 01:01:18','2020-06-05 01:01:18');
INSERT INTO sub_sub_categories VALUES('22','37','Dishwashing','Dishwashing-gfh9m','Dishwashing','Dishwashing','2020-06-05 01:02:13','2020-06-05 01:02:13');
INSERT INTO sub_sub_categories VALUES('23','37','Laundry','Laundry-szV7e','','Laundry','2020-06-05 01:02:57','2020-06-05 01:02:57');
INSERT INTO sub_sub_categories VALUES('24','37','Pest Control','Pest-Control-fBZXg','Pest Control','Pest Control','2020-06-05 01:03:31','2020-06-05 01:03:31');
INSERT INTO sub_sub_categories VALUES('25','36','Herbs & Spices','Herbs--Spices-sFe8L','Herbs & Spices','Herbs & Spices','2020-06-05 01:05:45','2020-06-05 01:05:45');
INSERT INTO sub_sub_categories VALUES('26','36','Seasoning','Seasoning-yK5He','Seasoning','Seasoning','2020-06-05 01:06:23','2020-06-05 01:06:23');
INSERT INTO sub_sub_categories VALUES('27','36','Oil & Ghee','Oil--Ghee-89r4v','','Oil & Ghee','2020-06-05 01:07:23','2020-06-05 01:07:23');
INSERT INTO sub_sub_categories VALUES('28','35','Grains, Beans &Pulses','Grains-Beans-Pulses-xIb1R','Grains, Beans &Pulses','Grains, Beans &Pulses','2020-06-05 01:09:31','2020-06-05 01:09:31');
INSERT INTO sub_sub_categories VALUES('29','35','Noodles, Pasta & Rice','Noodles-Pasta--Rice-TYjYA','Noodles, Pasta & Rice','Noodles, Pasta & Rice','2020-06-05 01:10:14','2020-06-05 01:10:14');
INSERT INTO sub_sub_categories VALUES('30','35','nstant & Ready to Eat','nstant--Ready-to-Eat-guCBS','nstant & Ready to Eat','nstant & Ready to Eat','2020-06-05 01:11:04','2020-06-05 01:11:04');
INSERT INTO sub_sub_categories VALUES('31','33','Home Baking & Sugar','Home-Baking--Sugar-21CX3','Home Baking & Sugar','Home Baking & Sugar','2020-06-05 01:12:00','2020-06-05 01:12:00');
INSERT INTO sub_sub_categories VALUES('32','41','Biscuit & Cookies','Biscuit--Cookies-NwGlY','Biscuit & Cookies','Biscuit & Cookies','2020-06-05 01:13:52','2020-06-05 01:13:52');
INSERT INTO sub_sub_categories VALUES('33','34','Breakfast Cereals','Breakfast-Cereals-jxomL','Breakfast Cereals','Breakfast Cereals','2020-06-05 01:15:27','2020-06-05 01:15:27');
INSERT INTO sub_sub_categories VALUES('34','42','Chocolate','Chocolate-1lQvd','Chocolate','Chocolate','2020-06-05 01:16:51','2020-06-05 01:16:51');
INSERT INTO sub_sub_categories VALUES('35','41','Chips & Crisps','Chips--Crisps-Ddqoo','Chips & Crisps','Chips & Crisps','2020-06-05 01:17:35','2020-06-05 01:17:35');
INSERT INTO sub_sub_categories VALUES('36','34','Jams, Honey & Spreads','Jams-Honey--Spreads-zSZqo','Jams, Honey & Spreads','Jams, Honey & Spreads','2020-06-05 01:18:14','2020-06-05 01:18:14');
INSERT INTO sub_sub_categories VALUES('37','50','First Aid Supplies','First-Aid-Supplies-0N6rD','First Aid Supplies','First Aid Supplies','2020-06-05 01:24:43','2020-06-05 01:24:43');
INSERT INTO sub_sub_categories VALUES('38','50','Health Monitors & Tests','Health-Monitors--Tests-0p9Zj','Health Monitors & Tests','Health Monitors & Tests','2020-06-05 01:25:23','2020-06-05 01:25:23');
INSERT INTO sub_sub_categories VALUES('39','49','Well Being','Well-Being-kax13','Well Being','Well Being','2020-06-05 01:26:14','2020-06-05 01:26:14');
INSERT INTO sub_sub_categories VALUES('40','49','Weight Management','Weight-Management-8rdip','Weight Management','Weight Management','2020-06-05 01:26:46','2020-06-05 01:26:46');
INSERT INTO sub_sub_categories VALUES('41','49','Multivitamins','Multivitamins-CuXSz','Multivitamins','Multivitamins','2020-06-05 01:27:16','2020-06-05 01:27:16');
INSERT INTO sub_sub_categories VALUES('42','49','Beauty Supplements','Beauty-Supplements-XSoPy','Beauty Supplements','Beauty Supplements','2020-06-05 01:27:41','2020-06-05 01:27:41');
INSERT INTO sub_sub_categories VALUES('43','44','Hair Dryers','Hair-Dryers-bEXft','Hair Dryers','Hair Dryers','2020-06-05 01:28:49','2020-06-05 01:28:49');
INSERT INTO sub_sub_categories VALUES('44','44','Curling Irons & Wands','Curling-Irons--Wands-jM2mG','Curling Irons & Wands','Curling Irons & Wands','2020-06-05 01:30:00','2020-06-05 01:30:00');
INSERT INTO sub_sub_categories VALUES('45','44','Hair Styling Appliances','Hair-Styling-Appliances-xCQdb','Hair Styling Appliances','Hair Styling Appliances','2020-06-05 01:31:02','2020-06-05 01:31:02');
INSERT INTO sub_sub_categories VALUES('46','44','Curling Irons & Wands','Curling-Irons--Wands-X2bxC','Curling Irons & Wands','Curling Irons & Wands','2020-06-05 01:31:37','2020-06-05 01:31:37');
INSERT INTO sub_sub_categories VALUES('47','44','Flat Irons','Flat-Irons-djRDA','Flat Irons','Flat Irons','2020-06-05 01:32:13','2020-06-05 01:32:13');
INSERT INTO sub_sub_categories VALUES('48','44','Hair Removal Appliances','Hair-Removal-Appliances-OA9IC','Hair Removal Appliances','Hair Removal Appliances','2020-06-05 01:33:41','2020-06-05 01:33:41');
INSERT INTO sub_sub_categories VALUES('49','45','Women Fragrances','Women-Fragrances-hNbXD','Women Fragrances','Women Fragrances','2020-06-05 01:34:49','2020-06-05 01:34:49');
INSERT INTO sub_sub_categories VALUES('50','45','Men Fragrances','Men-Fragrances-X1fj2','Men Fragrances','Men Fragrances','2020-06-05 01:35:25','2020-06-05 01:35:25');
INSERT INTO sub_sub_categories VALUES('51','45','Deodorants','Deodorants-RnxtC','Deodorants','Deodorants','2020-06-05 01:35:59','2020-06-05 01:35:59');
INSERT INTO sub_sub_categories VALUES('52','46','Shampoo','Shampoo-5oma0','Shampoo','Shampoo','2020-06-05 01:36:33','2020-06-05 01:36:33');
INSERT INTO sub_sub_categories VALUES('53','46','Hair Treatments','Hair-Treatments-iRSeV','Hair Treatments','Hair Treatments','2020-06-05 01:36:58','2020-06-05 01:36:58');
INSERT INTO sub_sub_categories VALUES('54','46','Hair Care Accessories','Hair-Care-Accessories-pAbU1','Hair Care Accessories','Hair Care Accessories','2020-06-05 01:37:29','2020-06-05 01:37:29');
INSERT INTO sub_sub_categories VALUES('55','46','Hair Brushes & Combs','Hair-Brushes--Combs-lH4Ri','Hair Brushes & Combs','Hair Brushes & Combs','2020-06-05 01:38:14','2020-06-05 01:38:14');
INSERT INTO sub_sub_categories VALUES('56','46','Hair Coloring','Hair-Coloring-BBRJC','Hair Coloring','Hair Coloring','2020-06-05 01:38:39','2020-06-05 01:38:39');
INSERT INTO sub_sub_categories VALUES('57','46','Hair Conditioner','Hair-Conditioner-DWJ7k','Hair Conditioner','Hair Conditioner','2020-06-05 01:39:17','2020-06-05 01:39:17');
INSERT INTO sub_sub_categories VALUES('58','1','Hair Styling','Hair-Styling-8tqTU','Hair Styling','Hair Styling','2020-06-05 01:40:09','2020-06-05 01:40:09');
INSERT INTO sub_sub_categories VALUES('59','3','Face Foundation','Face-Foundation-6Kho2','Foundation','Foundation','2020-06-05 01:42:38','2020-06-05 01:42:38');
INSERT INTO sub_sub_categories VALUES('60','1','Lips','Lips-Zvcf7','lips','Lips','2020-06-05 01:43:06','2020-06-05 01:43:06');
INSERT INTO sub_sub_categories VALUES('61','3','Eyes','Eyes-CO1NP','Eyes','Eyes','2020-06-05 01:43:39','2020-06-05 01:43:39');
INSERT INTO sub_sub_categories VALUES('62','1','Makeup Accessories','Makeup-Accessories-uE5bT','Makeup Accessories','Makeup Accessories','2020-06-05 01:44:19','2020-06-05 01:44:19');
INSERT INTO sub_sub_categories VALUES('63','3','Nails','Nails-v70AF','Nails','Nails','2020-06-05 01:45:04','2020-06-05 01:45:04');
INSERT INTO sub_sub_categories VALUES('64','3','Makeup Brushes & Sets','Makeup-Brushes--Sets-XXVKG','Makeup Brushes & Sets','Makeup Brushes & Sets','2020-06-05 01:45:39','2020-06-05 01:45:39');
INSERT INTO sub_sub_categories VALUES('65','3','Makeup Removers','Makeup-Removers-dgoeO','Makeup Removers','Makeup Removers','2020-06-05 01:46:12','2020-06-05 01:46:12');
INSERT INTO sub_sub_categories VALUES('66','47','Hair Dryers','Hair-Dryers-pJRW4','Hair Dryers','Hair Dryers','2020-06-05 01:46:50','2020-06-05 01:46:50');
INSERT INTO sub_sub_categories VALUES('67','47','Shaving & Grooming','Shaving--Grooming-2IARO','Shaving & Grooming','Shaving & Grooming','2020-06-05 01:47:22','2020-06-05 01:47:22');
INSERT INTO sub_sub_categories VALUES('68','48','Oral Care','Oral-Care-jX6Q1','Oral Care','Oral Care','2020-06-05 01:47:53','2020-06-05 01:47:53');
INSERT INTO sub_sub_categories VALUES('69','48','Sexual Wellness','Sexual-Wellness-7cvQT','Sexual Wellness','Sexual Wellness','2020-06-05 01:48:33','2020-06-05 01:48:33');
INSERT INTO sub_sub_categories VALUES('70','48','Deodorants','Deodorants-Jiisp','Deodorants','Deodorants','2020-06-05 01:49:10','2020-06-05 01:49:10');
INSERT INTO sub_sub_categories VALUES('71','2','Face Scrubs & Exfoliators','Face-Scrubs--Exfoliators-DLvNz','Face Scrubs & Exfoliators','Face Scrubs & Exfoliators','2020-06-05 01:49:47','2020-06-05 01:49:47');
INSERT INTO sub_sub_categories VALUES('72','48','Facial Cleansers','Facial-Cleansers-yR1uo','Facial Cleansers','Facial Cleansers','2020-06-05 01:51:16','2020-06-05 01:51:16');
INSERT INTO sub_sub_categories VALUES('73','51','Samsung Mobile','Samsung-Mobile-iDR0S','Samsung Mobile in Nepal','Samsung Mobile in nepal','2020-06-05 02:00:50','2020-06-05 02:00:50');
INSERT INTO sub_sub_categories VALUES('74','51','Xiaomi Mobile','Xiaomi-Mobile-oritY','Xiaomi Mobile in nepal','Latest Xiaomi Mobile Phones in Nepal','2020-06-05 02:01:38','2020-06-05 02:01:38');
INSERT INTO sub_sub_categories VALUES('75','51','OPPO Mobiles','OPPO-Mobiles-I82AI','OPPO Mobiles in nepal','Latest Oppo Mobile Phones in Nepal','2020-06-05 02:02:16','2020-06-05 02:02:16');
INSERT INTO sub_sub_categories VALUES('76','51','Nokia Mobiles','Nokia-Mobiles-FqBVB','Nokia Mobiles in Nepal','Latest Nokia Mobile Phones in Nepal','2020-06-05 02:02:57','2020-06-05 02:02:57');
INSERT INTO sub_sub_categories VALUES('77','51','Apple Mobiles','Apple-Mobiles-svfZF','Apple Mobiles','Apple Mobiles in Nepal','2020-06-05 02:03:43','2020-06-05 02:03:43');
INSERT INTO sub_sub_categories VALUES('78','21','Standard Bikes','KTM-Bike-3cpG9','Bikes','Bikes in Nepal','2020-06-05 22:08:00','2020-06-05 22:13:51');
INSERT INTO sub_sub_categories VALUES('79','10','Solar Light','Solar-Light-OQ4JR','Solar Light','Solar Light','2020-06-08 00:39:38','2020-06-08 00:39:38');
INSERT INTO sub_sub_categories VALUES('80','68','Cabinet','Cabinet-kEGTD','Cabinet','Cabinet','2020-06-08 00:41:13','2020-06-08 00:41:13');
INSERT INTO sub_sub_categories VALUES('81','9','Bedding','Bedding-EfwgA','Bedding','Bedding','2020-06-08 00:42:19','2020-06-08 00:42:19');
INSERT INTO sub_sub_categories VALUES('82','68','Tupperware','Tupperware','Tupperware','Tupperware','2020-06-08 00:43:16','2020-06-08 00:44:03');
INSERT INTO sub_sub_categories VALUES('83','68','DIY Tools','DIY-Tools-YqmCV','DIY Tools','DIY Tools','2020-06-08 00:45:35','2020-06-08 00:45:35');
INSERT INTO sub_sub_categories VALUES('84','76','Rice','Rice-KQ27G','Rice| Brown rice and many more','Rice varieties in Nepal','2020-06-08 21:23:23','2020-06-08 21:23:23');
INSERT INTO sub_sub_categories VALUES('85','30','Instant and ready-to-eat','Instant-and-ready-to-eat-bsOeV','Instant and ready-to-eat','Instant and ready-to-eat','2020-06-08 21:24:45','2020-06-08 21:24:45');
INSERT INTO sub_sub_categories VALUES('86','76','Daal','Daal-kE4jE','Daal | Grains, Beans & Pulses and many more','Daal products in Nepal','2020-06-08 21:26:55','2020-06-08 21:26:55');
INSERT INTO sub_sub_categories VALUES('87','36','Oil','Oil-Cg47g','Oil | Oil and Ghee and many more','Oil','2020-06-08 21:30:54','2020-06-08 21:30:54');
INSERT INTO sub_sub_categories VALUES('88','79','Sports Shoes','Sports-Shoes-BQ4bp','Sports shoes','','2020-11-06 13:03:25','2020-11-06 13:03:25');
INSERT INTO sub_sub_categories VALUES('89','79','Party Shoes','Party-Shoes-tSJr1','party shoes','','2020-11-06 13:03:54','2020-11-06 13:03:54');
INSERT INTO sub_sub_categories VALUES('90','8','Cloths accessories','Cloths-accessories-9l3ep','','','2020-11-07 12:03:21','2020-11-07 12:03:21');
INSERT INTO sub_sub_categories VALUES('91','80','Green Tea','Green-Tea-g6fIx','SMC Green Tea','','2021-06-01 12:54:34','2021-06-01 12:54:34');
INSERT INTO sub_sub_categories VALUES('93','83','Sub SubCategory A','Sub-SubCategory-A-xCZ8w','Sub SubCategory A','','2021-12-13 06:15:21','2021-12-13 06:15:21');
INSERT INTO sub_sub_categories VALUES('94','29','Jeans','Jeans-I1mb1','mens jeans','this is mens jeans','2022-01-04 13:10:22','2022-01-04 13:10:22');
INSERT INTO sub_sub_categories VALUES('95','92','Samsung Mobiles','Samsung-Mobiles-35tWA','Samsung Mobiles','Samsung Mobiles','2022-04-04 14:34:23','2022-04-04 14:34:23');
INSERT INTO sub_sub_categories VALUES('96','92','Realme Mobiles','Realme-Mobiles-y3fFj','Realme Mobiles','Realme Mobiles','2022-04-04 14:35:12','2022-04-04 14:35:12');
INSERT INTO sub_sub_categories VALUES('97','92','Redmi/Poco Mobiles','RedmiPoco-Mobiles-BkCBK','Redmi/Poco Mobiles','Redmi/Poco Mobiles','2022-04-04 14:35:36','2022-04-04 14:35:36');
INSERT INTO sub_sub_categories VALUES('98','92','Apple iPhones','Apple-iPhones-YKqgv','Apple iPhones','Apple iPhones','2022-04-04 14:35:53','2022-04-04 14:35:53');
INSERT INTO sub_sub_categories VALUES('99','92','OnePlus Mobiles','OnePlus-Mobiles-kk0XJ','OnePlus Mobiles','OnePlus Mobiles','2022-04-04 14:36:12','2022-04-04 14:36:12');
INSERT INTO sub_sub_categories VALUES('100','92','Realme','Realme-JMnCN','Narzo by Realme','Narzo by Realme','2022-04-04 14:39:23','2022-04-04 14:39:23');
INSERT INTO sub_sub_categories VALUES('101','92','INFINIX Mobiles','INFINIX-Mobiles-sQ4M2','INFINIX Mobiles','INFINIX Mobiles','2022-04-04 14:40:16','2022-04-04 14:40:16');
INSERT INTO sub_sub_categories VALUES('102','92','Nokia Mobiles','Nokia-Mobiles-SoA2L','Nokia Mobiles','Nokia Mobiles','2022-04-04 14:40:35','2022-04-04 14:40:35');
INSERT INTO sub_sub_categories VALUES('103','92','Motorola Mobiles','Motorola-Mobiles-T4f2n','Motorola Mobiles','Motorola Mobiles','2022-04-04 14:40:54','2022-04-04 14:40:54');
INSERT INTO sub_sub_categories VALUES('104','85','VIVO Mobiles','VIVO-Mobiles-38HLx','VIVO Mobiles','VIVO Mobiles','2022-04-04 14:41:10','2022-04-04 14:41:10');
INSERT INTO sub_sub_categories VALUES('105','92','OPPO Mobiles','OPPO-Mobiles-LTD7c','OPPO Mobiles','OPPO Mobiles','2022-04-04 14:41:27','2022-04-04 14:41:27');
INSERT INTO sub_sub_categories VALUES('106','200','Apple iPads','Apple-iPads-ZRUa0','Apple iPads','Apple iPads','2022-04-04 14:43:39','2022-04-04 14:43:39');
INSERT INTO sub_sub_categories VALUES('107','200','Samsung Tablets','Samsung-Tablets-HPhYw','Samsung Tablets','','2022-04-04 14:43:56','2022-04-04 14:43:56');
INSERT INTO sub_sub_categories VALUES('108','200','Lenovo Tablets','Lenovo-Tablets-LRtEV','Lenovo Tablets','Lenovo Tablets','2022-04-04 14:45:03','2022-04-04 14:45:03');
INSERT INTO sub_sub_categories VALUES('109','200','Wacom Graphic Tablet','Wacom-Graphic-Tablet-N9BkO','Wacom Graphic Tablet','','2022-04-04 14:45:25','2022-04-04 14:45:25');
INSERT INTO sub_sub_categories VALUES('110','87','Lenovo','Lenovo-wSWGI','Lenovo','','2022-04-04 14:47:20','2022-04-04 14:47:20');
INSERT INTO sub_sub_categories VALUES('111','87','Apple','Apple-uNxx5','Apple','','2022-04-04 14:49:55','2022-04-04 14:49:55');
INSERT INTO sub_sub_categories VALUES('112','87','Hp','Hp-OHYVA','Hp','','2022-04-04 14:50:28','2022-04-04 14:50:28');
INSERT INTO sub_sub_categories VALUES('113','87','Dell','Dell-GeIVq','Dell','','2022-04-04 14:50:49','2022-04-04 14:50:49');
INSERT INTO sub_sub_categories VALUES('114','87','Acer','Acer-Wy4hu','Acer','','2022-04-04 14:51:13','2022-04-04 14:51:13');
INSERT INTO sub_sub_categories VALUES('115','87','Asus','Asus-2ecN8','Asus','','2022-04-04 14:51:37','2022-04-04 14:51:37');
INSERT INTO sub_sub_categories VALUES('116','87','MSI','MSI-xp6WV','MSI','MSI','2022-04-04 14:52:06','2022-04-04 14:52:06');
INSERT INTO sub_sub_categories VALUES('117','87','Razer','Razer-lPMfj','Razer','Razer','2022-04-04 14:52:45','2022-04-04 14:52:45');
INSERT INTO sub_sub_categories VALUES('118','87','Samsung','Samsung-iqhHt','Samsung','Samsung','2022-04-04 14:53:03','2022-04-04 14:53:03');
INSERT INTO sub_sub_categories VALUES('119','90','Action/Video Cameras','ActionVideo-Cameras-guRu3','Action/Video Cameras','Action/Video Cameras','2022-04-04 14:54:35','2022-04-04 14:54:35');
INSERT INTO sub_sub_categories VALUES('120','90','Security Cameras','Security-Cameras-AMjj7','Security Cameras','Security Cameras','2022-04-04 14:54:54','2022-04-04 14:54:54');
INSERT INTO sub_sub_categories VALUES('121','90','Nikon DSLR Cameras','Nikon-DSLR-Cameras-Y4xox','Nikon DSLR Cameras','','2022-04-04 14:55:32','2022-04-04 14:55:32');
INSERT INTO sub_sub_categories VALUES('122','90','Canon DSLR Cameras','Canon-DSLR-Cameras-kkyxN','Canon DSLR Cameras','','2022-04-04 14:55:56','2022-04-04 14:55:56');
INSERT INTO sub_sub_categories VALUES('123','90','Sony DSLR Cameras','Sony-DSLR-Cameras-FzY6O','','','2022-04-04 15:08:45','2022-04-04 15:08:45');
INSERT INTO sub_sub_categories VALUES('124','90','Instant Cameras','Instant-Cameras-GH70V','','','2022-04-04 15:09:20','2022-04-04 15:09:20');
INSERT INTO sub_sub_categories VALUES('125','90','Camera Accessories','Camera-Accessories-TQ1Y8','','','2022-04-04 15:11:04','2022-04-04 15:11:04');


DROP TABLE IF EXISTS subscribers;

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO subscribers VALUES('1','godawarikasaudhanshivi13@gmail.com','2020-07-16 12:30:52','2020-07-16 12:30:52');
INSERT INTO subscribers VALUES('2','harikishanchy@gmail.com','2020-07-26 09:32:14','2020-07-26 09:32:14');
INSERT INTO subscribers VALUES('3','sauravjoshi603@gmail.com','2020-07-30 06:44:46','2020-07-30 06:44:46');
INSERT INTO subscribers VALUES('4','gvendadeldhura@gmail.com','2020-07-30 10:34:28','2020-07-30 10:34:28');
INSERT INTO subscribers VALUES('5','gbangurgehawa999@gmail.com','2020-07-30 10:55:15','2020-07-30 10:55:15');
INSERT INTO subscribers VALUES('6','Pragatimahata52@gmail.com','2020-08-02 19:36:13','2020-08-02 19:36:13');
INSERT INTO subscribers VALUES('7','newarkta420@gmail.com','2020-08-07 20:00:43','2020-08-07 20:00:43');
INSERT INTO subscribers VALUES('8','singhjaya2011@gmail.com','2020-09-26 05:15:23','2020-09-26 05:15:23');
INSERT INTO subscribers VALUES('9','Www.keshab2055@gmail.com','2020-10-16 19:59:22','2020-10-16 19:59:22');
INSERT INTO subscribers VALUES('10','saudprem33@gmail.com','2020-11-02 15:02:54','2020-11-02 15:02:54');
INSERT INTO subscribers VALUES('11','thapatiks2043@gmail.com','2020-11-09 07:32:18','2020-11-09 07:32:18');
INSERT INTO subscribers VALUES('12','bhuwansir@gmail.com','2020-11-10 09:37:26','2020-11-10 09:37:26');
INSERT INTO subscribers VALUES('13','tirthadhikari98@gmail.com','2020-11-11 22:01:35','2020-11-11 22:01:35');
INSERT INTO subscribers VALUES('14','prakash.stha007@gmail.com','2020-11-24 06:22:18','2020-11-24 06:22:18');
INSERT INTO subscribers VALUES('15','hikmatthapa03@gmail.com','2020-11-29 12:32:31','2020-11-29 12:32:31');
INSERT INTO subscribers VALUES('16','rozeegm776@gmail.com','2020-11-29 20:55:22','2020-11-29 20:55:22');
INSERT INTO subscribers VALUES('17','bhattrukum@gmail.com','2020-12-07 16:06:48','2020-12-07 16:06:48');
INSERT INTO subscribers VALUES('18','adhikarimamata87@gmail.com','2020-12-08 11:57:09','2020-12-08 11:57:09');
INSERT INTO subscribers VALUES('19','mhnolee@gmail.com','2020-12-08 15:23:13','2020-12-08 15:23:13');
INSERT INTO subscribers VALUES('20','dineshsaud18009@gmail.com','2020-12-10 13:28:09','2020-12-10 13:28:09');
INSERT INTO subscribers VALUES('21','shiva.ch2014@gmail.com','2020-12-11 13:01:11','2020-12-11 13:01:11');
INSERT INTO subscribers VALUES('22','dearshailendra1997@gmail.com','2020-12-12 07:04:35','2020-12-12 07:04:35');
INSERT INTO subscribers VALUES('23','BsHX','2021-04-18 00:10:01','2021-04-18 00:10:01');
INSERT INTO subscribers VALUES('24','FIcM','2021-04-18 16:46:45','2021-04-18 16:46:45');
INSERT INTO subscribers VALUES('25','tKfM','2021-04-29 23:22:32','2021-04-29 23:22:32');
INSERT INTO subscribers VALUES('26','BpQw','2021-05-02 04:14:48','2021-05-02 04:14:48');
INSERT INTO subscribers VALUES('27','qYkz','2021-05-03 07:53:58','2021-05-03 07:53:58');
INSERT INTO subscribers VALUES('28','TEps','2021-05-03 21:40:07','2021-05-03 21:40:07');
INSERT INTO subscribers VALUES('29','CeMO','2021-05-04 20:00:42','2021-05-04 20:00:42');
INSERT INTO subscribers VALUES('30','GGvl','2021-05-07 12:16:37','2021-05-07 12:16:37');
INSERT INTO subscribers VALUES('31','BVRL','2021-05-08 13:37:26','2021-05-08 13:37:26');
INSERT INTO subscribers VALUES('32','KYlw','2021-05-09 17:55:26','2021-05-09 17:55:26');
INSERT INTO subscribers VALUES('33','URrf','2021-05-10 08:35:28','2021-05-10 08:35:28');
INSERT INTO subscribers VALUES('34','UjCi','2021-05-11 19:35:33','2021-05-11 19:35:33');
INSERT INTO subscribers VALUES('35','IZMU','2021-05-13 06:55:35','2021-05-13 06:55:35');
INSERT INTO subscribers VALUES('36','hAjD','2021-05-15 23:00:21','2021-05-15 23:00:21');
INSERT INTO subscribers VALUES('37','oBrK','2021-05-19 14:52:11','2021-05-19 14:52:11');
INSERT INTO subscribers VALUES('38','94c3e1550a54@mailing-box.biz','2021-05-21 23:37:18','2021-05-21 23:37:18');
INSERT INTO subscribers VALUES('39','Spjc','2021-06-10 07:34:23','2021-06-10 07:34:23');
INSERT INTO subscribers VALUES('40','ZZJq','2021-06-14 17:21:55','2021-06-14 17:21:55');
INSERT INTO subscribers VALUES('41','SUKM','2021-06-19 01:09:01','2021-06-19 01:09:01');
INSERT INTO subscribers VALUES('42','hom24.mgr@gmail.com','2021-07-29 19:31:20','2021-07-29 19:31:20');


DROP TABLE IF EXISTS ticket_replies;

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ticket_replies VALUES('1','2','12','we have solved your problem&nbsp;','','2020-06-04 14:27:52','2020-06-04 14:27:52');
INSERT INTO ticket_replies VALUES('2','2','12','test test','','2021-12-07 12:08:57','2021-12-07 12:08:57');
INSERT INTO ticket_replies VALUES('3','6','241','sadfasdfasdf','','2022-03-16 09:47:48','2022-03-16 09:47:48');
INSERT INTO ticket_replies VALUES('4','6','241','asdfasdf','','2022-03-16 09:48:31','2022-03-16 09:48:31');


DROP TABLE IF EXISTS tickets;

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tickets VALUES('1','10000027','19','test','hello this is test support tickets','[{"name":"favicon.png","path":"uploads\/support_tickets\/\/tATj0bnwsOiS9ruDSJvvSSB0YdkIUFeC3q3CcCfa.png"}]','pending','1','1','2020-06-04 09:57:10','2020-06-04 09:57:10');
INSERT INTO tickets VALUES('2','1000002819','19','hello almond','hello there','','solved','1','0','2021-12-07 17:53:57','2021-12-07 12:08:57');
INSERT INTO tickets VALUES('3','2147483647','147','Regarding stem vapour','<p>Dear sir/ Mam</p><p>&nbsp;I have immense pleasure and happiness in connecting with closet Nepal knowing that very important and needy things are supplied.In this regards, Iam eager to consume and utilize production&nbsp;</p><p>Hoping to get positive response.</p><p>HomRaj Khadka.</p><p>9804520814<br></p>','','pending','1','1','2020-11-28 21:14:31','2020-11-28 20:14:31');
INSERT INTO tickets VALUES('4','2147483647','3','Vel lorem qui dolore','','','pending','0','0','2022-01-26 09:14:44','2022-01-26 09:14:44');
INSERT INTO tickets VALUES('5','2147483647','3','Vel lorem qui dolore','','','pending','0','0','2022-01-26 09:14:45','2022-01-26 09:14:45');
INSERT INTO tickets VALUES('6','2147483647','3','Vel lorem qui dolore','','','solved','1','1','2022-03-16 10:48:39','2022-03-16 09:48:39');


DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users VALUES('3','','','seller','Mr. Seller','joshibispin2052@gmail.com','2018-12-11 23:45:00','$2y$10$D0kICjMdRhfmni.N8q2z8OXoD.mUfoqxcG5HMbNvf4GqGDY.SFTJu','U6OhlfuYGckC9AC2LHSuWouM6RtjFrqot4KwxamxzNeqyqK3aQqH4nW2q5Ys','https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50','uploads/hrwWD4rPIDsSVEfwovzgTUiifLkRYv5RtQ49O2n8.jpg','','','','','','0','3dLUoHsR1l','1','2','2018-10-07 10:27:57','2022-03-11 14:46:54');
INSERT INTO users VALUES('8','','','customer','Mr Buyer','customer@example.com','2018-12-11 23:45:00','$2y$10$0ITst8ZBfNVzVEqR1b/2.ep/xYcJyJEhzpehcRQe0DZJUREwIQvlC','GGTjQPoQ36xMztJgzXjc4V72UmY0C4CshFVzgDzrKlNzlhNMyRgpiyjbEs2j','https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50','uploads/users/kULEvz99dh86iqRUXAUScy4NKVaiJjBrpVtXqWnx.jpg','Harisiddhi','Nepal','Lalitpur','446000','9856782341','0','8zJTyXTlTT','1','0','2018-10-07 10:27:57','2022-04-20 11:08:13');
INSERT INTO users VALUES('12','','','admin','SmartBigMart','plamsal6@gmail.com','2020-06-03 16:51:12','$2y$10$KNqJAW9jXprRtNQ0kXMPauH0Q/XRBJnrZs.cs7Yt.LdjYjY8IXae6','5gNtDe5CqV0HRh3mrJEKvAJEzYAiUhv8iQ7Pvt1y1D1YPeVp7mHVGQZPIFNR','','uploads/avatar/B3bL3LH4m0PBsWH3MkXPqtau3kcGwMU5QIaf1ieq.jpeg','attariya','','Dhanagdhi','10400','9809465434','0','','','0','2020-06-03 16:56:12','2020-12-13 16:02:02');
INSERT INTO users VALUES('18','','','customer','Admin','anotertt@almandu.com','','$2y$10$fPVEUH9sjfumfvvIRhljluuKszig91zO.bRU3I7rwQnylB3Y1qJHq','','','','','','','','','0','','','0','2020-06-04 02:07:14','2020-06-04 02:07:14');
INSERT INTO users VALUES('19','','','customer','Mannu sharma','pramodlamsal@yahoo.com','2020-06-04 02:58:48','$2y$10$u3EM9nmpCImHENGt64Ql4OVp/dEqMoECCiVEYo.eHgKFhefv2pAbq','','','uploads/users/IEV57cUdOE95b31Yyy0himCc5sMmoMvCalRpFJX7.jpeg','','NP','','','','0','','','0','2020-06-04 02:13:55','2020-06-04 16:49:42');
INSERT INTO users VALUES('21','','3156794384383586','customer','Prabesh Lamsal','prabesh.lamsal@yahoo.com','2020-06-06 14:51:25','','VYld6NNRkwr1tWAep2AlP6V3Mitz1ccIccINcIH3ljYaqLugOg2T14FroWx6','','','','','','','','0','','','0','2020-06-06 15:30:25','2020-06-06 15:30:25');
INSERT INTO users VALUES('23','','1423022791214556','customer','Yøgësh Bädäyäk','seller@example.com','2020-06-30 09:51:56','$2y$10$D0kICjMdRhfmni.N8q2z8OXoD.mUfoqxcG5HMbNvf4GqGDY.SFTJu','lcAq4Cq5rRfvGz25zQx0Pv55HckSG4gjJWL7IuV7ZWYfSybicTDK2BDptXwn','','uploads/users/AXGVt5ZYhyG9DtZgqb0wQlD2Z95ZW1uG1zynti3Q.jpg','','','','','seller@example.com','5390','23cr8NU8Wg','','0','2020-06-30 10:17:56','2022-12-11 00:08:26');
INSERT INTO users VALUES('24','','2777102255893191','customer','Yogesh Badayak','roadromeo.rr@gmail.com','2020-07-01 08:52:38','','iAg5btjWuydkuG2ujPOlelR8YQnzGpmZjk2CwXjWUj0uVyLGELfpAee7ljgF','','','','','','','','0','','1','3','2020-07-01 09:15:38','2020-09-08 21:43:25');
INSERT INTO users VALUES('26','','104363261924787238351','customer','sabina shrestha','shresthasabina95@gmail.com','2020-07-01 08:52:15','','AaI0hNNST8b0LlXXWFleweNBDmXSAh7q63ZpA65gAkl0AjnPULpqqQ0kQGEL','','','','','','','','0','','','0','2020-07-01 09:37:15','2020-07-01 09:37:15');
INSERT INTO users VALUES('27','','','seller','Gadget King','learncloset@gmail.com','2020-07-03 14:52:31','$2y$10$JJIu2hUo9Au997IWxo4JWOh71mgFZiQdqewjKqdRSjySAhGrVyuPa','yp3QP6n4WEuPRTTokuMrlDYApzyR64mY6ExHxtlJCeUO4cW0OR6Ul2JrEo8F','','','','','','','','0','','','0','2020-07-02 15:49:09','2020-07-22 10:32:50');
INSERT INTO users VALUES('28','','','customer','Mannu ji','broadnepal@yahoo.com','','$2y$10$k7HlMEcCg68lZYF1HDVAPe2gFLWof95F4.AMtobNSPAsFXILRt2EG','','','','','','','','','0','','','0','2020-07-02 16:02:08','2020-07-02 16:02:08');
INSERT INTO users VALUES('29','','','customer','Mannu ji','mlamsal6@gmail.com','','$2y$10$dux.TUzJoaHoHlZoYFISYudByRH9uzT52nBelQXUDvGKQOxA3itA6','','','','','','','','','0','','','0','2020-07-02 16:19:46','2020-07-02 16:19:46');
INSERT INTO users VALUES('30','','1648029108696806','customer','Niraj Adhikari','niraj54adhikari@gmail.com','2020-07-02 18:52:36','','GKDmj44bThK4QcfqCPVWWjQLoLxV4u3ZpsIcAiNBlQ1VTWn65O9K6Vmhvsqy','','','','','','','','0','','','0','2020-07-02 19:13:36','2020-07-02 19:13:36');
INSERT INTO users VALUES('31','','','customer','mannu ji','broadnepal@gmail.com','','$2y$10$T0AqyHZgCCba8TEnkH/82evi3Bzq7qpPg53lZjPCT2wJg0TWPPxhG','','','','','','','','','0','','','0','2020-07-03 11:16:23','2020-07-03 11:16:23');
INSERT INTO users VALUES('32','','102681756677428350254','customer','Sagar Malla ThaQuree','sagarmalla2018@gmail.com','2020-07-11 19:52:10','','BtJMW0FnEQu3w9K0NMoHCRt2hoaN7TjfcJrYgSZmMvZ1kHdtlQCCy5tFFoDn','','','','','','','','0','','','0','2020-07-11 20:14:10','2020-07-11 20:14:10');
INSERT INTO users VALUES('33','','102315863184381208480','customer','Priyansh Gaming','thapapriyansh192@gmail.com','2020-07-13 20:52:15','','aBhLPayOyJNHezREkOAwYyek9ObzTOjTSOHABMP6YBQjxNSUQTW8gswlGXNY','','','','','','','','0','','','0','2020-07-13 21:23:15','2020-07-13 21:23:15');
INSERT INTO users VALUES('34','','117677538866670500477','customer','Priyansh world','thapabhesraj7@gmail.com','2020-07-16 18:52:43','','e4kZtnVrtQy5z4kZzinpFB6sVdabfsgBtbBXPE4rShGmHKz5mgmCkcbRfeo8','','','','','','','','0','','','0','2020-07-16 18:50:43','2020-07-16 18:50:43');
INSERT INTO users VALUES('35','','','seller','W3 World','sapkotaa872@gmail.com','2020-07-16 19:39:25','$2y$10$ajgd/3tJwpLCwrhoiyqHg.Bafor5vgdeykGNml7cbHymf6kKNaSKa','GBIv24OrwFc9dBzhElErkYknycW3SAimsSLE3YeOqbnSxqV4uncL9rw3UHFa','','uploads/157tmuiz0S90gsKr6peMfPUlwmNYRawUNB2zmXyn.png','','AF','','','','0','','','0','2020-07-16 19:22:42','2020-07-16 19:47:09');
INSERT INTO users VALUES('37','','116754492358615393757','customer','Nirajan Samant','nirajansamant@gmail.com','2020-07-21 14:52:27','','EVSk1d1vxfda58fFWuozVqAZFf2N7rCkr0nWBHzpCaCLbrID43niJIZu7Tib','','','','','','','','0','','','0','2020-07-21 14:47:27','2020-07-21 14:47:27');
INSERT INTO users VALUES('38','','10149999597993168','customer','Celeste Moidu','celestemoidu@gmail.com','2020-07-22 00:52:35','','rajImvJRjIC2M6jnM5r9M4yzHOCBkcUUq5VlKwjdm5ZyyZ8gACtd9khOcUsi','','','','','','','','0','','','0','2020-07-22 01:21:35','2020-07-22 01:21:35');
INSERT INTO users VALUES('39','','116329824282489968813','customer','Chandra Bdr Rana','chandarrana143@gmail.com','2020-07-22 10:52:32','','ncUNGQPR4F6H3dNltAFv2tJjcyQc7zLxavQhZ1FziJWoSiU6vrEIzjmy4Kxi','','','','','','','','0','','','0','2020-07-22 11:22:32','2020-07-27 15:17:08');
INSERT INTO users VALUES('41','','111971679603035474850','customer','Prakash Bist','pbist2651@gmail.com','2020-07-23 15:52:09','','xmUl297JF742eKTlFU4qELAbbPVD3hLY7GHpjX7ep2Wwww7fWQ31AmOzKpEs','','','','','','','','0','','','0','2020-07-23 15:50:09','2020-07-23 15:50:09');
INSERT INTO users VALUES('42','','100956178750631822488','customer','Sushant Adhikari','sushantadhikari11@gmail.com','2020-07-23 19:52:00','$2y$10$G6xwTy8VusVB0mBD5MSH9ebBLeZDbKVfDm/NP.2MblLd2ICG2ISV6','Ff4Yg7GCaLvsyHF7k1gdfGDB4ijQ7Fo6GA83fgFMYr8vb7a8wqQD5b2NrWI6','','','','','','','','0','','','0','2020-07-23 19:52:00','2020-07-23 19:54:33');
INSERT INTO users VALUES('44','','10150000570903349','customer','Amy Janus','hzwbryulvh_1592188804@tfbnw.net','2020-07-28 03:52:22','','OaoJh48ZQFI2GEFiEFrafarO66y9wzZOmea4fGmx368fJ63EoNPfAbrUbgPp','','','','','','','','0','','','0','2020-07-28 04:41:22','2020-07-28 04:41:22');
INSERT INTO users VALUES('45','','10150000571213723','customer','Boy Punat','geogatedproject236@gmail.com','2020-07-28 04:52:32','','vSGjT3kniUrvzn7wvJexT6OIxeC781nGc4wBveQoF5qt83j3nAC3yNUtV9oj','','','','','','','','0','','','0','2020-07-28 05:04:32','2020-07-28 05:04:32');
INSERT INTO users VALUES('46','','','customer','Bibek Lama','blama1319@gmail.com','','$2y$10$D9y8VL1hfC1UPitZFYL0Zua0dnDfP6Bax2hzNIaVxUY8r67ydtWFq','','','','','','','','','0','','','0','2020-07-28 10:45:16','2020-07-28 10:45:16');
INSERT INTO users VALUES('47','','114280646171157834878','customer','Jeevan Gurgehawa','gbangurgehawa999@gmail.com','2020-07-30 10:52:51','','VVGnMmiGSo3VF7WOvYoZve2IBWfIUyTXXfAuRzkvhGcJZSAF1ybgYB78PPb7','','','','','','','','0','','','0','2020-07-30 10:54:51','2020-07-30 10:54:51');
INSERT INTO users VALUES('48','','107457546240942191832','customer','Backteria Virus','backteria.virus@gmail.com','2020-07-30 10:52:09','','tilMhab6syAVS7fw6wG6qp235H6bW3G4V0U2vKRuQA3hV86EIPMY5TLhktjo','','','','','','','','0','','','0','2020-07-30 11:38:09','2020-07-30 11:38:09');
INSERT INTO users VALUES('49','','10150000635148310','customer','Jeffrey Viscomiberg','xfwpqahlcl_1576843160@tfbnw.net','2020-07-31 11:52:30','','9On3IJHJ241ZRWhsnqmI6OrHTRkvmqf4ungoqBWKE0jGrokCtW7eRot786jk','','','','','','','','0','','','0','2020-07-31 12:06:30','2020-07-31 12:06:30');
INSERT INTO users VALUES('50','','','customer','kta newar','newarkta420@gmail.com','2020-08-07 14:56:05','$2y$10$L4kIHczGNz6SdpIKqK6n8u9RQcZmKF9OGdTZ3/bOdv/2wsU/woTXO','HJfBGwV2AgncdvAKAFQvsSNMtDdLloQUNEJOFHmmDH9dgK2gpTn0pO136B7H','','','','','','','','0','','','0','2020-08-07 14:46:27','2020-08-07 14:56:05');
INSERT INTO users VALUES('51','','106296613757426508163','customer','Rabin Bhat jr.','bhatravi984@gmail.com','2020-08-10 11:53:53','','FHwPuHBCGkpbMjNGbYTOvpY2O2eio4YO85b8ULYLJT43MA57cMGSHsZjNPnC','','','','','','','','0','','','0','2020-08-10 12:29:53','2020-08-10 12:29:53');
INSERT INTO users VALUES('52','','103766789804513010528','customer','Sunil Rana','sabituchy16@gmail.com','2020-08-14 18:53:34','','F1Bi8iU9INel5RhdWYFL0qIjAOSL6MdADhWCzwPHdLGVeRGV4nL4gEW5iH6R','','','','','','','','0','','','0','2020-08-14 18:53:34','2020-08-14 18:53:34');
INSERT INTO users VALUES('53','','103063195431288257579','customer','DB Traders','dbtraders4@gmail.com','2020-08-15 06:53:28','','goNxGDJ5HisGZs15QuE1md87AlA9hOw4ooSdLTbzVQYx7CAPvuAYVMugEBqI','','','','','','','','0','','','0','2020-08-15 07:09:28','2020-08-15 07:09:28');
INSERT INTO users VALUES('54','','107420442120345215511','customer','Sameer Chapagain','sameerchapagai44@gmail.com','2020-08-16 08:53:45','','BZarYcefaXdg1jknBXrGGZRiCVL50RkQPju0h9SHy6x8O7FO6MavFUwRCv8x','','','','','','','','0','','','0','2020-08-16 09:02:45','2020-08-16 09:02:45');
INSERT INTO users VALUES('55','','2658124037849167','customer','Pawan Bhatt','bhattpawan568@gmail.com','2020-08-19 06:53:46','$2y$10$1ln81sLVf1SOW65orI4hJOI6.I6Y6e3gI.UT4DqNzqpxGEnMpmLde','HzIIpJfYzBsA4xhknVMeipCURDFR8P9efSIm38Q8XAdZZ0fS6kr0acDkHavN','','','','','','','','0','','','0','2020-08-19 07:12:46','2020-08-19 07:14:44');
INSERT INTO users VALUES('56','','4253611084710137','customer','Dhansher Jagri','friends_party@yahoo.com','2020-08-19 19:53:35','','dkktuVc0eu32JXQpnJDa1hNt1LVoomp4j3A8gsdMfeJ9RjyP8l6WlyUTj2bO','','','','','','','','0','','','0','2020-08-19 19:50:35','2020-08-19 19:50:35');
INSERT INTO users VALUES('57','','10149999778131858','customer','Dave Riceman','davetestriceman@gmail.com','2020-08-20 22:53:50','','xgMpE1epJcm46qDh5NADd6env8t4KXTRK7syazj6E52tSg59HxrMwOBiKe14','','','','','','','','0','','','0','2020-08-20 22:58:50','2020-08-20 22:58:50');
INSERT INTO users VALUES('58','','','customer','Dipesh','abc@gmail.com','','$2y$10$MAQEfM3XkmN9/Wq2eU7y/eGCQn7LTNX0Bo7flXXMFnLl8I.AHsNCO','','','','','','','','','0','','','0','2020-09-02 10:03:55','2020-09-04 14:24:38');
INSERT INTO users VALUES('59','','','customer','Dinanath Khanal','dinanath@gmail.com','2020-09-06 09:51:43','$2y$10$3V4NEAnwJ7Kr/0naRRLm4ur0yQ3JOozjU4k4kTE4KVme8DxoypjSi','','','','','','','','','0','','','0','2020-09-06 09:51:43','2020-09-06 09:51:43');
INSERT INTO users VALUES('60','','','customer','abc','mmm@gmail.com','2020-09-06 10:07:01','$2y$10$AeRWm5Il4MfHVAFPQF63yOXQ/dTgn0m5dSP1uRejbJv1Cnfn00z9.','','','','','','','','','0','','','0','2020-09-06 10:07:01','2020-09-06 10:07:01');
INSERT INTO users VALUES('61','','','customer','akdkad','dadwd@ffsdfes.efs','2020-09-06 10:08:06','$2y$10$tj8jDa4ljiJs2tw4h/diDe16jxA6q5fTvqn4KqnrRK.I4nfGm.FzO','','','','','','','','','0','','','0','2020-09-06 10:08:06','2020-09-06 10:08:06');
INSERT INTO users VALUES('62','','','customer','abcefe','ofofo@fniif.fsdfsdf','2020-09-06 10:33:20','$2y$10$NoSmgIhdwumQNcLXCKkZ6uyBH8pjw8xqu16Y9Q53FtkYkuYGgfPBi','','','','','','','','','0','','','0','2020-09-06 10:33:20','2020-09-06 10:33:20');
INSERT INTO users VALUES('63','','620653375477553','customer','Ojha Ashmita','ashmita1121@gmail.com','2020-09-06 11:54:35','','i0xHo2KlcHGu7NW7PVEffXy7o15yYWO3RNhrl9oyAhiA8Op7NnYq2dYQVeJl','','','','','','','','0','','','0','2020-09-06 12:07:35','2020-09-06 12:07:35');
INSERT INTO users VALUES('65','','109669075732228960795','customer','Closet Nepal','closetnepal.com@gmail.com','2020-09-08 21:54:03','','QIzvj5Jr9H8MPpgOvZo3QyarnZDdB2mYSG0lZUIdRFOUrkXmPjf16aFsWRD3','','','','','','','','0','','','0','2020-09-08 22:19:03','2020-09-08 22:19:03');
INSERT INTO users VALUES('70','','','customer','pramod','plamsal@gmail.com','2020-09-10 14:23:31','$2y$10$EnF/Fn6PewPuCsG8sz9SnuB/8/c7.Q4K/jNLcbjqt5gb5CpgBjsR.','','','','','','','','','0','','','0','2020-09-10 14:23:31','2020-09-10 14:23:31');
INSERT INTO users VALUES('71','','','customer','Ribesh Basnet','ribeshbasnet19.rb@gmail.com','2020-09-11 08:36:57','','','','','','','','','','0','','','0','2020-09-11 08:36:57','2020-09-11 08:36:57');
INSERT INTO users VALUES('72','','','customer','fefefe','geegege@gm.fdfdfd','2020-09-11 09:10:45','$2y$10$YfkJlJuowYAz2LRd0gTLBewxcIkrQLWwHD3dk0fozVkpDApCNINYS','','','','','','','','','0','','','0','2020-09-11 09:10:45','2020-09-11 09:10:45');
INSERT INTO users VALUES('74','','','customer','Sagar Shree','shreesagar48@gmail.com','2020-09-11 19:00:51','','','','','','','','','','0','','','0','2020-09-11 19:00:51','2020-09-11 20:55:00');
INSERT INTO users VALUES('75','','','customer','Laxmi Prasad Sapkota','w3worldxyz@gmail.com','2020-09-12 21:05:43','$2y$10$e5LFsuBP3G4Dmiix4W6Ge.SNRJadtn596rfoHKw2zu2ZoCI.t2ObW','','','','','','','','','0','','','0','2020-09-12 21:04:16','2020-09-12 21:05:43');
INSERT INTO users VALUES('76','','10150001488800587','customer','Hardeep Dinglesky','uqbkzlbgyj_1574355078@tfbnw.net','2020-09-15 11:54:51','','8D28UwSHkdyEpcOMLkX2UsHo1wbTGPicT6I4aU1JDOQw5WGUH68p06vIY924','','','','','','','','0','','','0','2020-09-15 12:36:51','2020-09-15 12:36:51');
INSERT INTO users VALUES('77','','3192565244173943','seller','Sabin Godar Thapa','sabingodar81@gmail.com','2020-09-27 13:54:46','','Es2I6dVqGbVL3qZOcH3KhkiBcULL4Vu4LALPnrvWlszzV1bFWdQZVj0LsFnB','','uploads/xTJsKEDkFG3ASaicvXyFP9N4LfbL0zFe7cC5dhAE.jpeg','','','','','','0','','1','5','2020-09-27 14:05:46','2021-05-31 19:40:48');
INSERT INTO users VALUES('78','','113070653912846034029','customer','Lion Developer','lionthedeveloper@gmail.com','2020-09-27 17:54:20','','KeIlasagd1nMIYtrV8slCN6s9vFrZNMkn0OwGboSv9WicAEUjYSwIP3MjAtX','','','','','','','','0','','','0','2020-09-27 17:50:20','2020-09-27 17:50:20');
INSERT INTO users VALUES('79','','113747618877396011762','seller','DigiTech Computer','bhatta.siddarth007@gmail.com','2020-09-29 14:54:21','','fztZvPBvgNoATUkJAqXv5Ljrih8oMRDiEjBNxUfMkpww4xkMu30en9Otfazh','','','','','','','','0','','','0','2020-09-29 15:04:21','2020-09-29 15:05:35');
INSERT INTO users VALUES('80','','104704063631442981136','customer','Priya Rajbansi','priyarajbansi33@gmail.com','2020-09-30 10:54:23','','7q9EzFAHPCISSXQIV48uqfI6OHPHFYm7MCIXYRawkpy8heMZqsl6GMLGub7j','','','','','','','','0','','','0','2020-09-30 10:49:23','2020-09-30 10:49:23');
INSERT INTO users VALUES('81','','','customer','Santosh Kalukunda','santoshkalukunda@gmail.com','2020-10-01 12:10:16','$2y$10$dVzy2Ci6xY1Bc0vs5AWMD.2qPYek/PHhpjQt.6kF4TkdcTvo2BKqe','','','','','','','','','0','','','0','2020-10-01 12:08:37','2020-10-01 12:10:16');
INSERT INTO users VALUES('82','','','customer','Shreya Joshi','joshishreya312@gmail.com','','$2y$10$f46lF1bmTxHYjN9skihsauSFYcpQibU7KNeNghL30Rnq6OnzmXbM6','','','','','','','','','0','','','0','2020-10-01 15:29:44','2020-10-01 15:29:44');
INSERT INTO users VALUES('83','','','customer','closet','close@gmail.com','2020-10-12 10:14:39','$2y$10$6QZQ2UwoJqQFveEOszwQFujHHwV5O0KSsIaKPEiRgOtalhsQ.fYBy','','','','','','','','','0','','','0','2020-10-12 10:14:39','2020-10-12 10:14:39');
INSERT INTO users VALUES('84','','','customer','lamsal','lamsal@gmail.com','2020-10-16 12:02:11','$2y$10$cW8aZaXhH.SHRxuoWLzYP.LDicudKD8vmxy2A2wxDhIaHIX/9Ydgm','','','','tink','','ktm','562365','9865325698','0','','','0','2020-10-16 12:02:11','2020-10-16 12:05:13');
INSERT INTO users VALUES('85','','','customer','nepal','nepal@gmail.com','2020-10-16 14:37:36','$2y$10$G2z5m3qvv7.k6eIHO.HDDOhuoiYGYm5b3t0o55WcaCkiaUyrynQJ.','','','','','','','','','0','','','0','2020-10-16 14:37:36','2020-10-16 14:37:36');
INSERT INTO users VALUES('88','','','customer','Yogesh Badayak','learncloset123@gmail.com','2020-10-19 18:55:14','$2y$10$pFLjgtyP/z89KMW37NDoKur3HNscXwK/x9G70QYHHx7my2Vv4/.6.','','','','','','','','','0','','','0','2020-10-19 18:55:14','2020-10-19 18:55:14');
INSERT INTO users VALUES('89','','','customer','version2test','version2test@gmail.com','','$2y$10$zNkU3fdEpfvdBd2t4FbKVuMrxaYiKp53b.2FlkAnxxpKAYwrVQGvi','','','','','','','','','0','','','0','2020-10-19 19:16:27','2020-10-19 19:16:27');
INSERT INTO users VALUES('90','','','customer','dwdww','la@gmail.com','','$2y$10$AsqcwNXRMrB.YPrRTDMht.jPEWi76YB4j88aF3W0r3SWa3NVyIUUW','','','','','','','','','0','','','0','2020-10-20 09:41:39','2020-10-20 09:41:39');
INSERT INTO users VALUES('91','','','customer','Ruth','ruthmeronaam@gmail.com','2020-10-20 11:24:49','$2y$10$jeQqATvzkDeFnDSdAy/T6ur.DJUUR1sIGU1scOf4nWB40.i8c/QIC','','','','','','','','','0','','','0','2020-10-20 11:24:49','2020-10-20 11:24:49');
INSERT INTO users VALUES('92','','','customer','ei lay 4520','eilay4520@gmail.com','2020-10-20 12:14:11','','','','','','','','','','0','','','0','2020-10-20 12:14:11','2020-10-20 12:14:11');
INSERT INTO users VALUES('93','','','customer','Arjun Rana','allumesallu@gmail.com','2020-10-20 14:24:36','','','','','','','','','','0','','','0','2020-10-20 14:24:36','2020-10-20 14:24:36');
INSERT INTO users VALUES('94','','','customer','Bir Bahadur Chaudhary','birbdrchaudhary6@gmail.com','2020-10-20 15:38:19','','','','','','','','','','0','','','0','2020-10-20 15:38:19','2020-10-20 15:38:19');
INSERT INTO users VALUES('95','','','customer','Dipesh khanal','dkhanal@gmail.com','2020-10-22 09:27:17','$2y$10$iEh5qJzl5uEJB2H4WYkwBe7BTX4FSSOpK9NxIM8dquKC.hyhv9FmC','','','','','','','','','0','','','0','2020-10-22 09:27:17','2020-10-22 09:27:17');
INSERT INTO users VALUES('96','','109297606919914134286','customer','OMMASTA MOBILE','masthmobile545@gmail.com','2020-10-23 03:55:02','','yzk09obUqb61vyahjEdsLI5MqNGMxn3MCg888hAdCXi24wx7ZJQksBMg99u5','','','','','','','','0','','','0','2020-10-23 04:39:02','2020-10-23 04:39:02');
INSERT INTO users VALUES('97','','','seller','Ajidas Dahit','starprint6016@gmail.com','2020-10-23 14:40:09','$2y$10$dFxWuCLjYYlVG.KJH1VTW.x/d9HU3Vi4zFU/okP8n6RxrLyIM.Yxe','cEWukZ7xDMZ2ZpsK2NLxmmu7sMEAhQAmdZrGueTNfV37Y2OIyGoG8EngG5a7','','','Rajpur','','Dhangadhi','','9814636016','0','','','0','2020-10-23 14:40:09','2020-11-06 10:15:44');
INSERT INTO users VALUES('98','','115668779889288352127','customer','Briyan Poudel','birupoudel2018@gmail.com','2020-10-27 11:55:09','','FoNv7ql9Yi3gK0cP81nplV52yuSbuogAZFIy8j6VpjvkYz6XNGUXmnkyG1as','','','','','','','','0','','','0','2020-10-27 11:57:09','2020-10-27 11:57:09');
INSERT INTO users VALUES('99','','','customer','Maniram Chaudhary','www.mingmaarchy568@gmail.com','2020-10-29 21:23:50','','','','','','','','','','0','','','0','2020-10-29 21:23:50','2020-10-29 21:23:50');
INSERT INTO users VALUES('100','','107567520064129915091','customer','Himal Batha Magar','silentzef@gmail.com','2020-10-30 18:55:29','','F2Q0p62B1z4gvjISrZSeDs7JgG1J9VnMibVvqOgkg7LYuw3ZuNyjSlaxpFy0','','','','','','','','0','','','0','2020-10-30 19:24:29','2020-10-30 19:24:29');
INSERT INTO users VALUES('101','','','customer','Naveen Acharya','naveenacharya530@gmail.com','2020-11-01 17:18:32','','','','','','','','','','0','','','0','2020-11-01 17:18:32','2020-11-01 17:18:32');
INSERT INTO users VALUES('102','','','customer','snol','sroj.npl@gmail.com','2020-11-03 17:58:30','$2y$10$JghZTVsaDKW6PFaR/c95L.VYmwhLLgu67ZyC6BoHann.XCRrUu4vW','','','','','','','','','0','','','0','2020-11-03 17:58:30','2020-11-03 17:58:30');
INSERT INTO users VALUES('103','','','customer','khanal','khanal@gmail.com','2020-11-04 14:52:04','$2y$10$KmsHndegQiyuNjrkMWnfh.vYq13rlVzh32/L38AqOcZ2sAfaijj.W','','','','koteshwor','','kathmandu','44600','9865326598','0','','','0','2020-11-04 14:52:04','2020-11-04 14:53:17');
INSERT INTO users VALUES('104','','100770436907085210896','customer','Savitri Bhatt','bhattsavitri743@gmail.com','2020-11-05 14:56:01','','isvboLaQs0LGIXlrQsZGa77CK4VCTnbc3waluZ24VdZ5Tf15v3XVberIEumj','','','','','','','','0','','','0','2020-11-05 15:37:01','2020-11-05 15:37:01');
INSERT INTO users VALUES('105','','115145221221308498313','seller','zitesh Khadka','ryankhadka12345@gmail.com','2020-11-06 13:56:05','','6F800EFKOM3be8qUCIt9Lm93dYTTW49UdCoUQNJGzVACxNS054RSAhX2ZvRI','','','','','','','','0','','','0','2020-11-06 14:24:05','2020-11-06 14:33:17');
INSERT INTO users VALUES('106','','','customer','Nabin Bhatta','nbt.robo@gmail.com','2020-11-06 15:54:25','','','','','','','','','','0','','','0','2020-11-06 15:54:25','2020-11-06 15:54:25');
INSERT INTO users VALUES('107','','','customer','Rajendra Pant','pantrajendra2@gmail.com','2020-11-08 04:17:12','','','','','Shivnagar-5','','Dhangadhi','','9863361676','0','','','0','2020-11-08 04:17:12','2020-11-08 04:24:58');
INSERT INTO users VALUES('108','','','customer','mausam bhatta','mausambhatta2014@gmail.com','2020-11-08 09:34:42','$2y$10$J9R1eNLmWJXzgwwCRiF85OXfXytDxGlX0g4apWtf4PiQ9CtIwnG0G','','','','','','','','','0','','','0','2020-11-08 09:34:42','2020-11-08 09:34:42');
INSERT INTO users VALUES('109','','103838965327583495201','customer','Aaron Sapkota','aaronsapkotanasa@gmail.com','2020-11-08 14:56:36','$2y$10$ZKFB6SQM5YXzEnZqybOz7u52W3ZZeVT2rUFaHSLzoQGsfZSWkgV9W','KM2qpykCUyKvlRSYZnJFAfrNW6UqgpaH0oFpX57UpfY1cU6qaysCnVS7koyi','','','','','','','','0','','','0','2020-11-08 14:48:36','2020-11-08 14:49:13');
INSERT INTO users VALUES('110','','3405755962875112','customer','Jeewan Kusmi','kusmijeewan@yahoo.com','2020-11-09 05:56:14','','GEsI2OegrFUoiFP1lptcI1FyCIW9aiuUvhVLRHvLRXDk6C4FdLYg9GJpLs7V','','','','','','','','0','','','0','2020-11-09 06:42:14','2020-11-09 06:42:14');
INSERT INTO users VALUES('111','','10164325749810430','customer','Avadh Raj Sharma Gyawali','a_bad80@hotmail.com','2020-11-09 08:56:03','','BJrZVVlbZNA5DEQL0164aBb2F5LSsdxe9xwbFu1X651i65H3QWtNhvlM1RWA','','','','','','','','0','','','0','2020-11-09 08:54:03','2020-11-09 08:54:03');
INSERT INTO users VALUES('112','','10218117446273097','customer','Santosh Giri','jinuwagaun96@gmail.com','2020-11-10 03:56:43','','HYOvd5AWyH71ilWZS2c6FlBKxnc1HZtMmJciy9yhvJFpJPNHR7N581NAN6G6','','','','','','','','0','','','0','2020-11-10 04:35:43','2020-11-10 04:35:43');
INSERT INTO users VALUES('113','','3556107464468256','customer','Sunil Pokharel','coolsunil48@yahoo.com','2020-11-10 05:56:13','','vbcC15GKRbchs5orPxM5hzVQL3JposLJ7ZFCp8HJCc2L6dPQmHmZ5NX58dAl','','','','','','','','0','','','0','2020-11-10 06:19:13','2020-11-10 06:19:13');
INSERT INTO users VALUES('114','','3475107765858378','customer','SharMa JivAnn','frndjks@gmail.com','2020-11-10 06:56:52','','1RXHhNBY2LDi5xwTuwbfIUeYJepJXzmwkeGzjRbB4YZswoRMbLOrUxp5q6vS','','','','','','','','0','','','0','2020-11-10 07:25:52','2020-11-10 07:25:52');
INSERT INTO users VALUES('115','','2686002968318471','customer','Kiran Bohara','kiranbohara2@gmail.com','2020-11-10 11:56:47','','anynhnr2QeObdDMBcaJdpCf4BbaQbkSvd2HNajhuMeSJPUozJdD3prhuAQBr','','','','','','','','0','','','0','2020-11-10 12:24:47','2020-11-10 12:24:47');
INSERT INTO users VALUES('116','','','customer','Kiran dhami','kirandhami908@gmail.com','2020-11-10 14:49:22','$2y$10$jUuIfLzCt3aJY6tRtU4LIO2ygHiYxMrPzUB/xUfvaPY1yh7aVzF0K','','','','','','','','','0','','','0','2020-11-10 14:45:40','2020-11-10 14:49:22');
INSERT INTO users VALUES('117','','','customer','testid','testid@gmail.com','2020-11-11 10:31:59','$2y$10$YbhShlfirsxWnbulgptgq.VuFi91SUC9rKMwrAGu9BU0Sw6g9CJwu','','','','','','','','','0','','','0','2020-11-11 10:31:59','2020-11-11 10:31:59');
INSERT INTO users VALUES('118','','105622820029059985982','customer','Gaming bro','schy60880@gmail.com','2020-11-11 13:56:27','','IzIkUXpVdgPWftQtEUnnlx1kFEXfGptvsLeerWjQri7Rtj5Ksv57Ea6LIhy2','','','','','','','','0','','','0','2020-11-11 14:43:27','2020-11-11 14:43:27');
INSERT INTO users VALUES('119','','','customer','Binod Bhandari','binod00665@gmail.com','','$2y$10$IHdJTY0tNHP3yT1dal9AK.y75e1KoH8SfjkVGCnTbxRBDPkiGzYA6','','','','','','','','','0','','','0','2020-11-11 21:57:06','2020-11-11 21:57:06');
INSERT INTO users VALUES('120','','','customer','test','testtest@gmail.com','2020-11-13 12:01:08','$2y$10$3uQDcXT6nf/5TW5uG9A1puptX.aeyWT8U3nHW1FaWUSR287pJOmpO','','','','','','','','','0','','','0','2020-11-13 12:01:08','2020-11-13 12:01:08');
INSERT INTO users VALUES('121','','','customer','Mahesh Raj Joshi','mj310709@gmail.com','2020-11-13 14:13:37','$2y$10$SaDEiRviRMX/86.df/58QuCd033New2nNmobmGA.ZYNe.ApORhU4m','','','','','','','','','0','','','0','2020-11-13 14:13:37','2020-11-13 14:13:37');
INSERT INTO users VALUES('122','','','customer','lotus herbal','lotusherbal68@gmail.com','2020-11-14 05:50:16','','','','','','','','','','0','','','0','2020-11-14 05:50:16','2020-11-14 05:50:16');
INSERT INTO users VALUES('123','','','customer','Mahesh Lama','maheshlama68@gmail.com','2020-11-18 09:24:41','','PLdJlUccObY3cj82uYI2cZZo5miMGtGD9rQ9pd3R09zoUTHxPuyZxLF3MFBf','','','','','','','','0','','','0','2020-11-18 09:24:41','2020-11-18 09:24:41');
INSERT INTO users VALUES('124','','','customer','Sandesh Bohara','mrsakurazi12@gmail.com','2020-11-18 10:27:47','$2y$10$NmXbBlU5gPXyTjDDIMVvz.8gH2siRu5ciX8H/f51oefT7YURKp97y','','','','02 bani','','kanchanpur','','9866100167','0','','','0','2020-11-18 10:27:47','2020-11-18 10:28:55');
INSERT INTO users VALUES('125','','','customer','yougal shrestha','yougal_blqckman@yahoo.com','2020-11-18 11:29:43','$2y$10$W2bkuiOwnWPC0fPbxB.kqu/T0/GKCoo5A9h8nPq3N0qDzPXgf3q7e','','','','','','','','','0','','','0','2020-11-18 11:29:43','2020-11-18 11:29:43');
INSERT INTO users VALUES('126','','1016720928807387','customer','Mazzako Nepal','shoppingsanshar@gmail.com','2020-11-18 16:56:43','','0XWC6jqYaITBrOwDiuESDGTEm0Bbl2m4QYbL9NnlOexXpazUGyMobdREXcmF','','','','','','','','0','','','0','2020-11-18 17:02:43','2020-11-18 17:02:43');
INSERT INTO users VALUES('127','','4700641076674989','customer','Bamdev Pokharel','bamdev20p@gmail.com','2020-11-18 22:56:41','$2y$10$Wgi0rmoTLfLUpQmMXs0pyutoh3xRtbsxsWk27XIN6DAYawwDT7SkK','aEWAk1B57kYNa7kcdrwFLQSvQuhiTBDzCxTExMlU0lUo5dK3EQNaGv6uN4mv','','uploads/users/OCTvi9NcKH2rLzE6fQf8IYgGwBVTgCvc6vdZHZEc.png','','','','','','0','','','0','2020-11-18 23:34:41','2020-11-18 23:46:13');
INSERT INTO users VALUES('128','','','customer','yougal','yougal_blackman@yahoo.com','2020-11-19 01:36:33','$2y$10$iai8Mm1c8M1Fqp2X7UcKr.DLQkOsBDw4mnfhyES0RjIzkZnyfLH/2','','','','','','','','','0','','','0','2020-11-19 01:36:33','2020-11-19 01:36:33');
INSERT INTO users VALUES('129','','3475779132536814','customer','Ikrak Nivar','karkiravin97@yahoo.com','2020-11-19 01:56:31','','ql7ze2jttaLrVHqa8WXb1ftDlnPCyPbYgD4w2LC8w0ZtfoHSmBydgyZFF9Pu','','','','','','','','0','','','0','2020-11-19 02:05:31','2020-11-19 02:05:31');
INSERT INTO users VALUES('130','','','customer','Dev Shakti SDC','devshaktichaudhary122333@gmail.com','2020-11-19 11:48:47','','','','','','','','','','0','','','0','2020-11-19 11:48:47','2020-11-19 11:48:47');
INSERT INTO users VALUES('131','','','customer','Girendra Pandeya','girendrapandey1234@gmail.com','2020-11-19 19:36:55','$2y$10$XvnrjFJl8dYjGEizVAtKx.RC4m74hQJr99xV95g8XVssA05ETuHxG','','','','','','','','','0','','','0','2020-11-19 19:36:55','2020-11-19 19:36:55');
INSERT INTO users VALUES('132','','','customer','mahesh Yonjan','maheshlama187@gmail.com','2020-11-20 06:33:20','','','','','','','','','','0','','','0','2020-11-20 06:33:20','2020-11-20 06:33:20');
INSERT INTO users VALUES('133','','','seller','Laxmi Prasad Sapkota','laxmiprdyt@gmail.com','2020-11-20 20:30:04','$2y$10$4UCPY9QrUo9xOLImMEKAyOTBMzeqtg1tw2FNeFL96EqX1NYI1DrCq','','','uploads/aBfxboF31UIaVgjqFnBwHmWSiFOc7dxzZWIOWgZP.png','','','','','','0','','','0','2020-11-20 20:28:47','2020-11-20 20:38:08');
INSERT INTO users VALUES('134','','','customer','sanjay','sapkotasanjaya981@gmail.com','','$2y$10$UEyj9CatPJBZnxIGKF5vA.t87KZAiv95zH2hlxg9fgoD1alpl7ICe','','','','','','','','','0','','','0','2020-11-21 06:36:21','2020-11-21 06:36:21');
INSERT INTO users VALUES('135','','','customer','Harinarayan Chaudhari','harinarayanchaudhari87@gmail.com','2020-11-21 08:26:54','$2y$10$fsULl58rF3aYKQEVvAgWAO52t1p4JG1MpyU2bz6Ai5kwh5cMb7X66','','','','','','','','','0','','','0','2020-11-21 08:25:56','2020-11-21 08:26:54');
INSERT INTO users VALUES('137','','','customer','','rafikk3000@gmail.com','2020-11-21 20:05:23','','','','','Baijnath','','kohalpur','081','9804567668','0','','','0','2020-11-21 20:05:23','2020-11-21 20:10:19');
INSERT INTO users VALUES('138','','4830718727002722','customer','Nabin Pandey','bin08world@gmail.com','2020-11-21 22:56:44','','pif5Di0mh8usLQedASRVXsk642WtCxplEdI3ujMhu6RSXWAiph8wtOXR6CH6','','','','','','','','0','','','0','2020-11-21 22:52:44','2020-11-21 22:52:44');
INSERT INTO users VALUES('139','','','customer','Ram Surat Baidya','baidys9819@gmail.com','2020-11-23 15:23:16','','','','','','','','','','0','','','0','2020-11-23 15:23:16','2020-11-23 15:23:16');
INSERT INTO users VALUES('140','','','customer','tenzin','choenzom13@gmail.com','2020-11-24 10:18:36','$2y$10$kTJC4sLfVqO8Xo9IiDzAFen2nplY7ZIFgt18dI.hnPEechyfhmHOS','','','','','','','','','0','','','0','2020-11-24 10:18:36','2020-11-24 10:18:36');
INSERT INTO users VALUES('141','','3491858734243529','customer','सुकरात शर्मा','jijijazed@flurred.com','2020-11-24 16:56:49','','Sm1nrpSsLPnpDWK7g0zZMRKoiqVDaf56ISnyC20jJVeWk0D0n02K0NdTXyaz','','','','','','','','0','','','0','2020-11-24 17:27:49','2020-11-24 17:27:49');
INSERT INTO users VALUES('143','','110962634005758530157','customer','Balchandra gurung','balchandra230@gmail.com','2020-11-24 17:56:50','','5qIUX6s8gtQwHse9CJ0GZlAgPKxaMaB0Q6355zdG0V1s7hB5yYVppJZLq5Kr','','','','','','','','0','','','0','2020-11-24 18:29:50','2020-11-24 18:29:50');
INSERT INTO users VALUES('145','','1004047116768927','customer','Pradeep Shahi','oct.unknown@gmail.com','2020-11-25 11:56:52','','uo4KS5il7WuGDOeax3gph4iksFAbbaLIwr0Ut2ZRENQwB7Wocph4pP5T86xY','','','','','','','','0','','','0','2020-11-25 12:19:52','2020-11-25 12:19:52');
INSERT INTO users VALUES('146','','','customer','Asmita Khatri','khatriasmita26@gmail.com','','$2y$10$dgkS3SQvWaVrwH1J/YKafuUv.eQihFnxYphPadzjpSZtXG0xXkp6C','Qg4ebQ8UV5inQD7dGHOYQJtBTrfgAY6ykNYdtzS3pSPQAdLqjOdACHdq2Am7','','','','','','','','0','','','0','2020-11-25 12:22:18','2020-11-25 12:22:18');
INSERT INTO users VALUES('147','','','customer','Hom Raj Khadka','Khadka.homraj@yahoo.com','2020-11-25 16:59:45','$2y$10$VGVhIU4eFnxmKV.PYGZfpetEd7e5WzjVaNlSqMT.rDsxo7xt/hebm','UB0jkPTE9WsEm5XUepahoUPTLkq3rteeH1jwnRBOB57znM1MQn9Qsr1ERP62','','','','','','','','0','','','0','2020-11-25 16:55:16','2020-11-25 16:59:45');
INSERT INTO users VALUES('148','','2702737219975103','customer','Rhytham Bhandari','cool.bhandari780@gmail.com','2020-11-26 06:56:58','','AmItXprmVdgeqE9Lcf6WNzc6nxUvLfTNdA0IAqfmbVOyQpiXB0Fl5uXzlOHz','','','','','','','','0','','','0','2020-11-26 06:48:58','2020-11-26 06:48:58');
INSERT INTO users VALUES('149','','1075374902933705','customer','Sunita Shahi','sudeshshahi819@gmail.com','2020-11-26 18:56:13','','B3KYI8sTm1EfrVuhZIdfXmSUKycyFyCI5mo3xBfKtYFMPLAqJSCrFthI4yu3','','','','','','','','0','','','0','2020-11-26 19:19:13','2020-11-26 19:19:13');
INSERT INTO users VALUES('150','','3777788422234411','customer','Santosh Shrestha','santoshshrestha84@yahoo.com','2020-11-26 18:56:34','','P1mmNfpERenQVhg217plNVeu037vmkWM11Auhb621NsUxwvzvIZlhTVcOab2','','','','','','','','0','','','0','2020-11-26 19:21:34','2020-11-26 19:21:34');
INSERT INTO users VALUES('151','','136498174892928','customer','Himal Sony','himalhimalsony@gmail.com','2020-11-26 21:56:57','','6gkyp8LuJZ3K6zQnUEMsgTxp09gyAfosNzviexP8w8S5iAICygqf49rgBJQh','','','','','','','','0','','','0','2020-11-26 22:16:57','2020-11-26 22:16:57');
INSERT INTO users VALUES('152','','2963312920559098','customer','Puja Ghimire','puja20g@gmail.com','2020-11-27 06:56:41','','5XuWyV9BHJQVMJszHHDVhxxo6ckNiSBVBZKlmt5y8dpT2PR2sVcEsxbYwQe8','','','','','','','','0','','','0','2020-11-27 07:21:41','2020-11-27 07:21:41');
INSERT INTO users VALUES('153','','1827805347379809','customer','Prakash Dhait','here_uma@yahoo.com','2020-11-28 02:56:45','','QxT5XNtSP0TULnzdMFV8Z8O9aAqa544JvMiGfJTQOalcmIQLeNPo83JB3crg','','','','','','','','0','','','0','2020-11-28 02:57:45','2020-11-28 02:57:45');
INSERT INTO users VALUES('154','','3012783862155896','customer','Gopal Sapkota','sapkotag674@yahoo.com','2020-11-28 19:56:23','','ZDMlZ5o6Zjw7Rxy133FvMaNqRhrXVNt1pMYjveQY6JEL30Zed8FIE3snaZE6','','','','','','','','0','','','0','2020-11-28 19:50:23','2020-11-28 19:50:23');
INSERT INTO users VALUES('155','','','customer','Mansoon Dhital','dhital.mansoon@gmail.com','2020-11-29 12:06:24','$2y$10$Dg/sKWdvSADccosdrqX.7.RijdKbZIwjpS0rVoFEC21njcXm99zdG','','','','','','','','','0','','','0','2020-11-29 12:06:24','2020-11-29 12:06:24');
INSERT INTO users VALUES('156','','414587703238508','customer','Sworgadwari Multiple Campus','sworgadwarimc@gmail.com','2020-11-30 07:56:14','','jSwJxD3FGxPpqxlYXP3yAyafdY0shZGDDq8fEf0iXMpmLBRsr2RyrujSWops','','','','','','','','0','','','0','2020-11-30 08:40:14','2020-11-30 08:40:14');
INSERT INTO users VALUES('157','','107302968340745983377','customer','Sagar Tiruwa','sagartiruwa655@gmail.com','2020-11-30 22:56:33','$2y$10$HjA4rARepjnsnW/bj2DYHe3XlIb4TQKDSDkLNFcwPdhr5enwc8f2i','5ZibyRNLchTU6MhQN2fdcbzjsnpJweD8noUJTGEFLUEEHWEoWEKrbkdYroId','','uploads/users/NTDIuqv39kQZ6xEzyYhCJrtytqeQtXIdkQelWkQo.png','','','','','','0','','','0','2020-11-30 22:51:33','2020-11-30 22:53:16');
INSERT INTO users VALUES('158','','','customer','NABEEN SUBBA','nabeensubba2@gmail.com','2020-12-01 19:14:42','','','','','Dhangadhi -15 Kanari Beli Bazar','','Dhangadhi','091','9800624203','0','','','0','2020-12-01 19:14:42','2020-12-01 19:17:38');
INSERT INTO users VALUES('159','','','customer','Prajan Neupane','prajanneupane@gmail.com','2020-12-03 13:54:24','$2y$10$vggYqEI1UvNjfIWv6MSjB.u.mse8h6BkmfWTcfw1.8rU9UBzg3xli','','','','','','','','','0','','','0','2020-12-03 13:54:24','2020-12-03 13:54:24');
INSERT INTO users VALUES('160','','3569425986428779','customer','Inu Karki','inu_k66@yahoo.com','2020-12-04 09:57:29','','Kl4UorDL9JZKFzBugkwsq0lfQx9r7Cr5bazLW1JPVmdpGTndjVplSwenLjQe','','','','','','','','0','','','0','2020-12-04 09:57:29','2020-12-04 09:57:29');
INSERT INTO users VALUES('161','','3446403788809688','customer','Bhuwan Karki','info.bhuwankarki5@gmail.com','2020-12-05 09:57:58','','Q7jnX2JETNt92VMeHtiavZH7YDZ4Geq1KXt309YFZud0jWXebPeat7B814r1','','','','','','','','0','','','0','2020-12-05 10:21:58','2020-12-05 10:21:58');
INSERT INTO users VALUES('162','','','customer','justice','justicenepalgod@gmial.com','','$2y$10$ZOzld1YK4QcLKSTwvPLbW./r4AM7AMfz2EfxOSH9zH/O1MgvyqmYi','','','','','','','','','0','','','0','2020-12-05 12:25:50','2020-12-05 12:25:50');
INSERT INTO users VALUES('163','','','customer','Yogesh Bohara','yogeshbohara01@gmail.com','2020-12-05 19:00:56','$2y$10$ZmSG2A5aadHjl2Kd7RNG6eAb0PvPl7CoNJMH6SKSMwtM/.X6HxYyC','yjI36x8DjN6x3A8uiiCMfaDUN647RXy7RvEpNtBpVX02xWW0KmsPFiwMjbyc','','','','','','','','0','','','0','2020-12-05 18:57:44','2020-12-05 19:00:56');
INSERT INTO users VALUES('164','','','customer','Shiva','shivakc1630@gmail.com','','$2y$10$aVqhayO6hUVBpOPKAsGJM.bl3OKRR.It66yyarOvKC/Ekb57xQqzW','','','','','','','','','0','','','0','2020-12-06 16:20:10','2020-12-06 16:20:10');
INSERT INTO users VALUES('165','','','customer','Aria Anderson','ariaa7994@gmail.com','2020-12-06 19:09:53','','','','','','','','','','0','','','0','2020-12-06 19:09:53','2020-12-06 19:09:53');
INSERT INTO users VALUES('166','','','customer','Netra karki','karkinetra25@gmail.com','2020-12-06 22:07:58','$2y$10$NP9mOTJEAjjALRMiQCqHROKhU0pPiZ3QXYTn47nNakp63AYcJ9gQq','','','','','','','','','0','','','0','2020-12-06 22:07:58','2020-12-06 22:07:58');
INSERT INTO users VALUES('167','','','customer','Rajesh Tharu','rajapurtechnicalcollege@gmail.com','','$2y$10$UKfTQ0PTkWQ2tb1cFxT6BucDEomcOmWnW6sMRCXMJbpyFc6iYgR5K','','','','','','','','','0','','','0','2020-12-07 06:15:06','2020-12-07 06:15:06');
INSERT INTO users VALUES('168','','','customer','Harish mahar','harishmahar.hm@gmail.com','2020-12-07 08:59:06','','','','','kirtipur','','Dadeldhura','','9868769660','0','','','0','2020-12-07 08:59:06','2020-12-07 09:08:13');
INSERT INTO users VALUES('169','','','customer','Sushil Chaudhary','sushilchaudhary065@gmail.com','2020-12-07 15:02:40','','','','','','','','','','0','','','0','2020-12-07 15:02:40','2020-12-07 15:02:40');
INSERT INTO users VALUES('170','','','customer','Rukum Chandra Bhatt','bhattrukum@gmail.com','','$2y$10$MoR38rdFqfmIdA9MwbuzJON9tcrtQ4RPZzeji/6WkmAYOuaUWb1Oi','','','','','','','','','0','','','0','2020-12-07 16:05:32','2020-12-07 16:05:32');
INSERT INTO users VALUES('171','','248198310062219','customer','वसन्त ऋतु','wnepali7@gmail.com','2020-12-07 15:57:31','','H5tS7xasTaEhuFkgwffQ9i3HbV5d7archPeZZcjL9O8B1IkONlifCaFffVKp','','','','','','','','0','','','0','2020-12-07 16:19:31','2020-12-07 16:19:31');
INSERT INTO users VALUES('172','','','customer','Pradip.C','pradipchaudhary904@gmail.com','2020-12-07 17:02:47','$2y$10$Xaags2toF/fSEw/DMAO9Aex.AXfAzCKBoNJPnWdvIIDLH.sG9yJlG','','','','','','','','','0','','','0','2020-12-07 17:02:47','2020-12-07 17:02:47');
INSERT INTO users VALUES('173','','','customer','Chhabi Koirala','chhabi3636@gmail.com','2020-12-07 19:07:12','','','','','','','','','','0','','','0','2020-12-07 19:07:12','2020-12-07 19:07:12');
INSERT INTO users VALUES('174','','','customer','bibekc5999','bibekc5899@gmail.com','2020-12-08 06:26:16','$2y$10$QMszKBv.otjdtDFErot65eHTePGFv1DLUeNLZ8JM.fizyp1hB1Ldy','','','','','','','','','0','','','0','2020-12-08 06:26:16','2020-12-08 06:26:16');
INSERT INTO users VALUES('175','','','customer','Balram Thapa','balramthapa359@gmail.com','2020-12-08 06:52:50','','','','','Karkando-18, Nepalgunj','','Banke','21900','9814597352','0','','','0','2020-12-08 06:52:50','2020-12-08 06:53:52');
INSERT INTO users VALUES('176','','2823834594501656','customer','Prak's Thagunna','mr_prakash6@yahoo.com','2020-12-08 10:57:30','','cR5xeiRtaMV562Q7YwFnEQPsrXlKisDaUccI6DqNhU04j7PISoPCW5zz31Uj','','','','','','','','0','','','0','2020-12-08 11:16:30','2020-12-08 11:16:30');
INSERT INTO users VALUES('177','','2810590892527389','customer','Nabin Rawat','nabinrawat38@gmail.com','2020-12-08 15:57:50','','S77qdHweuMhpb3nFCeyyRMphtx2ygPRbcmQrwpfzg6CEnZ7whKclgxU2kt5y','','','','','','','','0','','','0','2020-12-08 16:24:50','2020-12-08 16:24:50');
INSERT INTO users VALUES('178','','','customer','Rajesh kumar gupta','rajeshkncomputer@gmail.com','2020-12-08 17:32:46','$2y$10$Ji5bXe/bm7fKsspcH7gJ4OBdh5spYKziaHBGAhu4OF036KBUisS8u','RWjYPezYikkvtdkV1BEjVUVRUy2v8qPK0VSfsi0MSeQTWUa0ZRZSgRA0zjZj','','','','','','','','0','','','0','2020-12-08 17:31:12','2020-12-08 17:32:46');
INSERT INTO users VALUES('179','','','customer','Dipesh Khanal','dkhanal112@gmail.com','2020-12-08 18:33:37','','','','','','','','','','0','','','0','2020-12-08 18:33:37','2020-12-08 18:33:37');
INSERT INTO users VALUES('180','','','customer','Akasha Xettri','saudmn255@gmail.com','2020-12-09 09:39:20','','','','','','','','','','0','','','0','2020-12-09 09:39:20','2020-12-09 09:39:20');
INSERT INTO users VALUES('181','','106335467588300416748','customer','Purna Chandra Pandeya','saradpandey72@gmail.com','2020-12-09 10:57:33','','56svlT7tvdYDdlRDmt51kVmioyaEK178XNSPf3hTEZ1dW9e3nQCMjfa7mZfc','','','','','','','','0','','','0','2020-12-09 11:03:33','2020-12-09 11:03:33');
INSERT INTO users VALUES('182','','','customer','Yogendra Mahat','mahatyogendra@gmail.com','2020-12-10 09:30:52','$2y$10$SzVuEk4pJSBtDoVMje5NUOw756lJIsm91Z9oGrnSGu7hNHaCPy2.u','','','','Janakitol','','Mahendranagar','','9858750667','0','','','0','2020-12-10 09:30:52','2020-12-10 09:35:53');
INSERT INTO users VALUES('183','','','customer','Saroj Dahit','jesuspjenet@gmail.com','2020-12-10 18:37:59','','','','','','','','','','0','','','0','2020-12-10 18:37:59','2020-12-10 18:37:59');
INSERT INTO users VALUES('184','','','customer','Mitthu Rana','mitthurana78@gmail.com','2020-12-10 20:03:10','','','','','','','','','','0','','','0','2020-12-10 20:03:10','2020-12-10 20:03:10');
INSERT INTO users VALUES('185','','','customer','Jhalak Thapa','samyoljk57@gmail.com','2020-12-11 06:59:29','','','','','','','','','','0','','','0','2020-12-11 06:59:29','2020-12-11 06:59:29');
INSERT INTO users VALUES('186','','116919161196071312011','customer','Shailendra Pun','dearshailendra1997@gmail.com','2020-12-12 06:57:28','','ff21BYDrTUm5cU91QuBwO7fsS5yeX1xUAeRSBfOof8IdO3ORMvzODqtERNV3','','','','','','','','0','','','0','2020-12-12 07:02:28','2020-12-12 07:02:28');
INSERT INTO users VALUES('187','','','customer','Som raj Awasthi','asomraj123@gmail.com','2020-12-12 17:41:18','','','','','','','','','','0','','','0','2020-12-12 17:41:18','2020-12-12 17:41:18');
INSERT INTO users VALUES('188','','','customer','nepstar','tekawasthi7@gmail.com','2020-12-12 21:28:49','','','','','','','','','','0','','','0','2020-12-12 21:28:49','2020-12-12 21:28:49');
INSERT INTO users VALUES('189','','','customer','shankar rawal','shankarrawal088@gmail.com','2020-12-13 06:28:05','','','','','Sukhad','','Dhangadhi','','9811626730','0','','','0','2020-12-13 06:28:05','2020-12-13 06:29:38');
INSERT INTO users VALUES('190','','','customer','Документ номер WLR9044WLR2 подготовлен. Смотрите документ12 далее на странице http://apple.com','boriskinaleksandrccth@mail.ru','','$2y$10$htzgB8ggQxLxaASXps3isOun9FVls38RV7HMlY38xErO3UI1bQBli','','','','','','','','','0','','','0','2020-12-28 05:47:54','2020-12-28 05:47:54');
INSERT INTO users VALUES('191','','','customer','Sabin Godar','sandragodar81@gmail.com','','$2y$10$D0sC1Ae/FG.pE8PAcMswBukJBPypwmSrZUjYYqmZLLHVmMYA9T4G2','','','','','','','','','0','','','0','2021-01-13 18:36:17','2021-01-13 18:36:17');
INSERT INTO users VALUES('192','','','customer','<html><a href="http://apple.com"><img src="https://i.ibb.co/990cvT1/unnamed.png" width="100" height="100" alt="ok"></a></html>WLR292201WLR2 Remix01','kolesnikovakristinarpy@mail.ru','','$2y$10$oi7ZitIhJPPOSUfXW4XyRO0hq7HM0Y/GzuO.ZEInIUEbWIRp9jB9i','','','','','','','','','0','','','0','2021-01-18 08:53:29','2021-01-18 08:53:29');
INSERT INTO users VALUES('193','','','customer','Документ номер WLR914828WLR2 подготовлен. Смотрите документ12 далее на странице http://apple.com','bessonovairinandv@mail.ru','','$2y$10$fg4huj0sYICJV1bzN6DevO6AdEtwgGdqldFQAW3NbHMxnXilmYJ36','','','','','','','','','0','','','0','2021-01-30 21:52:39','2021-01-30 21:52:39');
INSERT INTO users VALUES('194','','','customer','Документ номер WLR1918697WLR2 подготовлен. Смотрите документ12 далее на странице http://apple.com','poliakovagalinajews@mail.ru','','$2y$10$raLODajZX9psNBzcGdZKQOFiOcnTrFmGtLgOMfdnCurQloOOdHttC','','','','','','','','','0','','','0','2021-02-09 02:25:39','2021-02-09 02:25:39');
INSERT INTO users VALUES('195','','','customer','HDPZ277OK6SI3N6RZG1PYPDH http://google.com/573','nikodiimsukkhnat@gmail.com','','$2y$10$OFzTCMNyohbHZpqqJ5o2t.3Qr16OHX07oI5LbS4Pxu5bVeSGDsxJO','','','','','','','','','0','','','0','2021-02-19 15:25:04','2021-02-19 15:25:04');
INSERT INTO users VALUES('196','','','customer','Deepak Shahi','deepakkhadg14@gmail.com','','$2y$10$NMv08kwy764/L7qZwuy0rOvlP8T9NyGE77RSN2Ie1e2VkqHpexFwy','','','','','','','','','0','','','0','2021-02-20 13:55:56','2021-02-20 13:55:56');
INSERT INTO users VALUES('197','','','customer','FHGNRIYM6GHF <b>http://google.com/824</b>','bennageomar4723475@gmail.com','','$2y$10$5R7Mel2ONWzDSv.g9eF/NeldOVhw86Ur35Bn7UiYFIydZmEMkKkOG','','','','','','','','','0','','','0','2021-03-01 20:42:11','2021-03-01 20:42:11');
INSERT INTO users VALUES('198','','','customer','RobertoCit','oksanasuxanova@mail.com','','$2y$10$wgVQoYUD4P.Me6Eb/HF6Y.JP9ZLQvy502qrJajZ5EozsD2GnAP5Eq','','','','','','','','','0','','','0','2021-03-13 06:54:09','2021-03-13 06:54:09');
INSERT INTO users VALUES('199','','','customer','CTU61SO6544CGZSO9RSOSUTC http://google.com/432','jayheisavetheworld@gmail.com','','$2y$10$jqiG5MOi8d1w0Fc9z5RTuuwBtn5KSxfcGbZn5kFMcqBRZbn8eJskC','','','','','','','','','0','','','0','2021-03-23 01:05:02','2021-03-23 01:05:02');
INSERT INTO users VALUES('200','','','customer','Deepak Shahi','deepakkhadgi14@gmail.com','','$2y$10$cpCOiBcl5bRJPNCec4rlwulS4aPV3hJi4C/2BqXEEDjkpYesVIchq','','','','','','','','','0','','','0','2021-04-27 07:18:23','2021-04-27 07:18:23');
INSERT INTO users VALUES('201','','','customer','BuSpeem','khirasa@yandex.ru','','$2y$10$4lRCJ4udqAG2kCQxgYLZaugu.dlzKs7.5SeZU70D5bUgtzkGZQSAe','','','','','','','','','0','','','0','2021-05-06 06:28:25','2021-05-06 06:28:25');
INSERT INTO users VALUES('202','','','seller','Upraj','uprajmalla1234@gmail.com','','$2y$10$B/xv/7zfLcW9jfgglcf9seAiPPiIUKmsAmD3KdtNtUuw6T9V2GTt.','','','','','','','','','0','','','0','2021-07-26 22:42:04','2021-07-26 22:42:04');
INSERT INTO users VALUES('203','','','customer','Hom Bahadur thapa magar','hom24.mgr@gmail.com','','$2y$10$sMkILI.UXCbttuq7juzRGOQYZU7TEEfCOhqzG7Agi6jmsW.GFelAa','','','','','','','','','0','','','0','2021-07-29 19:27:43','2021-07-29 19:27:43');
INSERT INTO users VALUES('204','','','staff','Kamala Paneru','kamalapaneru22@gmail.com','','$2y$10$76ae.LVcL56ItSUvpvFu9eGr.kTNnhhWUcTC75E3//MFMIPEuy40G','','','','','','','','9801351162','0','','','0','2021-08-19 12:22:58','2021-08-19 12:22:58');
INSERT INTO users VALUES('205','','','staff','Shanta K.C','sargamkc56@gmail.com','','$2y$10$qUknv9wcputbO96QpxZ7hOnbITddiJug7fSMOVwtxFGynwK.f2EIG','','','','','','','','9801351179','0','','','0','2021-08-19 12:24:02','2021-08-19 12:24:02');
INSERT INTO users VALUES('206','','','staff','Parbati Marahattha','parbatimarahattha22@gmail.com','','$2y$10$8h8oTk4t7U89g2go86vtLuA/An3n7Oh1Hl1nkiCbbphpvA5gG5AkO','','','','','','','','9801305820','0','','','0','2021-08-19 12:25:31','2021-08-19 12:25:31');
INSERT INTO users VALUES('213','','','customer','Shaeleigh Watkins','najuvahuz@mailinator.com','','$2y$10$9N.OVJSsZpp6Hnt7pFjByeTNnmOUJd5lccFumwRjT3jutkWyc.vki','','','','','','','','','0','','','0','2021-12-08 11:39:37','2021-12-08 11:39:37');
INSERT INTO users VALUES('217','','','seller','m','munirajrajbanshi@gmail.com','2021-12-13 13:41:30','$2y$10$SWYS1vsnYTtoC/Oh6iNMeuZZZCPVdLvdA9Np4uCtJpbKJVU8rFM1m','','','','','','','','','0','','','0','2021-12-13 07:19:22','2021-12-13 07:21:28');
INSERT INTO users VALUES('230','','','customer','Muniraj Rajbanshi','piratemuniraj@gmail.com','2021-12-14 05:00:34','$2y$10$KG6q9Zs40d0N4NqeGqkY/ODHBUagI.knFm0NNmFRhMmmdo.Ij8XBy','pdMxIhodjZ6Cs7fGU01uFbPMQDBURH9w4sOu9agdYgYa4957yQ5TculgVPNq','','','','','','','','0','','','0','2021-12-14 05:00:01','2021-12-14 05:00:34');
INSERT INTO users VALUES('231','','','seller','Muniraj Rajbanshi','munirajrajbanshi5@gmail.com','2021-12-14 12:09:42','$2y$10$MjGzdoYvxkWb3vf.vF9eN.Hq44yg.EHTc7e4o9HYsEOirZ2CTX9Cu','umB2njchU5jAK5ZH5S3s4JsTqFFrY6RCNZ7C98gj5HfGnN4rZOgqvDqaKsbY','','','','','','','','0','','','0','2021-12-14 12:07:33','2021-12-15 05:01:02');
INSERT INTO users VALUES('232','','','seller','SastoBazaar','wgmuniraj@gmail.com','2021-12-15 05:03:48','$2y$10$axBQdE2CRAJmXHEGxIAMAubP1iMIAdfJRGrnrZ0aWTsM7x49fPhhK','','','','','','','','','0','','','0','2021-12-15 05:02:04','2021-12-15 05:03:48');
INSERT INTO users VALUES('237','','','customer','Prasun Dahal','prasundahal@gmail.com','2022-01-03 14:56:49','$2y$10$qIuo5eKpKByxvDMVdolVx.5U4WuRQX/yRmPl8Jotxma.fN87m0KXy','','','','','','','','','0','237IRkBkfk','1','4','2022-01-03 14:55:35','2022-01-04 15:32:55');
INSERT INTO users VALUES('240','','','customer','testanother','sujanstha016@gmail.com','2022-03-30 10:55:46','$2y$10$gI.DidmDTKdcEjXTzmY.bebnEUMxiLVc0D2LACkGdbNpLR3.xG.fi','','','','','','','','','0','','','0','2022-01-04 15:00:31','2022-03-30 10:55:46');
INSERT INTO users VALUES('241','','','admin','shop online','admin@gmail.com','2020-06-03 16:51:12','$2y$10$D0kICjMdRhfmni.N8q2z8OXoD.mUfoqxcG5HMbNvf4GqGDY.SFTJu','AwFN2kdHxW3rUalDzzZwRjdi4P7WFjAVBr0rH2o8UNRngOsYbCUBMMQkNdfq','','','','','','','','0','','','0','2022-01-05 08:23:25','2022-01-05 08:23:25');
INSERT INTO users VALUES('242','','','customer','tom hardy','tomhardy8963@gmail.com','2022-01-05 09:56:57','$2y$10$q2WboaL/SEvEkBL8KBBfpesSx.ko.caNBx5Is4XPNUtZ1vQ7M9BjO','','','','','','','','','0','','','0','2022-01-05 09:56:19','2022-01-05 09:56:57');
INSERT INTO users VALUES('243','','','seller','nepali kitchen','sanjkarki3@gmail.com','2022-01-19 15:25:20','$2y$10$NvxxBgfQrZxMhZa15KboheBCW7oCinmiqXoJlT4PLZJE3wI2U87r.','','','','','','','','','0','','','0','2022-01-13 22:53:42','2022-04-04 08:53:30');
INSERT INTO users VALUES('244','','','customer','Aaeronn Bhatta','durbarmart1@gmail.com','','$2y$10$Elaw6JfrqODCjrI9P/7TH.KUh44.HDEiJBhH/xypaZAmdxmlEWU4.','','','','','','','','','0','','','0','2022-01-19 21:12:15','2022-01-19 21:12:15');
INSERT INTO users VALUES('245','','','customer','Bipin Joshi','joshibipin20522@gmail.com','2020-11-13 14:13:37','$2y$10$iqzBB1Afu4jePjaO2ondX.1vWRtTu1sTzN6SW/qNtzJ9p0N9MkL5W','','','','','','','','','0','','','0','2022-01-20 14:32:56','2022-01-20 14:32:56');
INSERT INTO users VALUES('246','','','customer','Ashish','ashishdahal123@gmail.com','','$2y$10$72u0W1sTBe4UbMyX4xHeeO6BF4CKPKrExC0CyI9nhfGfdB64Xs8c6','','','','','','','','','0','','','0','2022-02-01 10:24:08','2022-02-01 10:24:08');
INSERT INTO users VALUES('247','','','customer','George Brooks','riqekote@mailinator.com','','$2y$10$KYTeA.wwtM8w.TLVoKfHOeUK/onpnfhRIgp2zuKd54jvnddP7fycm','','','','','','','','','0','','','0','2022-02-14 05:42:16','2022-02-14 05:42:16');
INSERT INTO users VALUES('248','','','customer','Erin Perry','fonywycih@mailinator.com','','$2y$10$K/8Kp6gDGwktLr8OPBXUNOQge16TF782RwglhAhdVV/AYNhw5lVz.','','','','','','','','','0','','','0','2022-02-14 05:44:04','2022-02-14 05:44:04');
INSERT INTO users VALUES('249','','','customer','Lynn Simpson','pyqixib@mailinator.com','2022-02-13 11:37:12','$2y$10$j1.JWkUQ9z0/a9pb5wMZV./uGTU93lX2qfFIXxMsbk7LRgCDxuZ16','','','','','','','','','0','','','0','2022-02-14 05:45:05','2022-02-14 05:45:05');
INSERT INTO users VALUES('250','','','seller','Anita's','anita_1246@gmail.com','','$2y$10$lHDUWQ7y2PHenLC2tFPuoO5AWtMObdH26JHpP/pZ8/yaznwHk5Ute','','','','','','','','','0','','','0','2022-02-20 13:36:34','2022-02-20 13:36:34');
INSERT INTO users VALUES('251','','','customer','Amar API','api@test12.com','2022-03-21 15:09:15','$2y$10$SBwvvOc5L7xqpms0Sn0XguDVwobje7BqW8pQvO3xS2E2CWylNK9y6','','','','','','','','','0','','','0','2022-03-21 15:09:15','2022-03-21 15:09:15');
INSERT INTO users VALUES('252','','','customer','Sewa API','sewa@123.com','2022-03-24 21:38:52','$2y$10$7qrRCguae5cu4ACiLGw9BeuZMEQXJ6tb7BdzVCRharJF93RwD.kyq','','','','','','','','','0','','','0','2022-03-24 21:38:52','2022-03-24 21:38:52');
INSERT INTO users VALUES('253','','','customer','Sewa API','sewa@1234.com','2022-03-27 19:10:51','$2y$10$wjOdx/jesiWbTeCkww8ABOVq62ewG/tO3OroKh2yfTQ.Xbcx0TUE.','','','','','','','','','0','','','0','2022-03-27 19:10:51','2022-03-27 19:10:51');
INSERT INTO users VALUES('254','','','customer','Sewa API','sewa@12345.com','2022-03-28 09:19:45','$2y$10$PLMPPBxdtyCu1jiUIH3szOfHphepPOmDwMzrsFvjeknMX8vK9R/SK','','','','','','','','','0','','','0','2022-03-28 09:19:45','2022-03-28 09:19:45');
INSERT INTO users VALUES('255','','','customer','Ashish Dahal','ashish123@gmail.com','2022-03-28 12:10:01','$2y$10$eR.NfqeX66iirl8UBPN6OO6aB7eQ27N6fBMzoC/CVCmBbxZntJVze','','','','','','','','','0','','','0','2022-03-28 12:10:01','2022-03-28 12:10:01');
INSERT INTO users VALUES('256','','','seller','test seller','stha24103@gmail.com','2022-03-30 12:20:59','$2y$10$mx7401hyDYV1n6yufjG1duIiCBZslhH456NxwAazOuo5NFOAe.NOS','','','','','','','','','0','','','0','2022-03-30 12:18:53','2022-03-30 12:20:59');
INSERT INTO users VALUES('257','','','customer','Mr. King','newcustomer@example.com','','$2y$10$iF/NKYjU2fmx3dL9U2cnI.EHRbzRMozoth/nR7u8W2sBgq3eLOxKS','','','','','','','','','0','','','0','2022-03-31 10:05:54','2022-03-31 10:05:54');
INSERT INTO users VALUES('258','','','customer','binod khatiwada','aayushkhatiwada12@gmail.com','2022-03-31 11:34:37','$2y$10$MYHFrcYaGnzEiSB8qhdJW.PXeACHF1MmphHNrwHheu//QHYoS5QtW','','','','','','','','','0','','','0','2022-03-31 11:27:32','2022-03-31 11:34:37');
INSERT INTO users VALUES('259','','','seller','Chamling Furniture','chamlingfurniture@gmail.com','','$2y$10$uJNPYKaOskoAEslJwIZSFuHwQjDyI9Ju5X959lYqH.Zad0XZ0qtFi','','','','','','','','','0','','','0','2022-04-03 15:49:10','2022-04-04 08:58:54');
INSERT INTO users VALUES('260','','','customer','Ashish','ashish321@yopmail.com','2022-04-03 17:19:09','$2y$10$HrXjx9i6otINV1tJa.iIrOc12atcXFsMvDfv6ptDbgunpmeaOi/9u','','','','','','','','','0','','','0','2022-04-03 17:19:09','2022-04-03 17:19:09');
INSERT INTO users VALUES('261','','','customer','Ashish','ashish123@yopmail.com','2022-04-03 17:26:30','$2y$10$pazFKIszVqeCMyhBAfKA/ul0WhC5pATkDa4Qgk8BaV6N/TPkCsWfS','','','','','','','','','0','','','0','2022-04-03 17:26:30','2022-04-03 17:26:30');
INSERT INTO users VALUES('262','','','customer','Ashish','ashish456@yopmail.com','2022-04-03 17:28:02','$2y$10$vwK7JNyxWOLnz8fTt1Piz.0irCt2AegxWcc.T/5gBWHjprMEpmY/S','','','','','','','','','0','','','0','2022-04-03 17:28:02','2022-04-03 17:28:02');
INSERT INTO users VALUES('263','','','customer','Ashish','ashish098@yopmail.com','2022-04-03 17:28:33','$2y$10$kb7Be4bRFZ9bFCr36pKh2uKF/LWsgS16pL.lglFC2GYu7t5GNLJN.','','','','','','','','','0','','','0','2022-04-03 17:28:33','2022-04-03 17:28:33');
INSERT INTO users VALUES('264','','','customer','Ashish','ashhish@gmail.com','2022-04-03 17:29:07','$2y$10$PDPLhtwrLJwKwYk63yyTVeL6bWGikK3mamv28zadAz/.n8vV.gu7e','','','','','','','','','0','','','0','2022-04-03 17:29:07','2022-04-03 17:29:07');
INSERT INTO users VALUES('265','','','customer','Ashish','ashhishh@gmail.com','2022-04-03 17:30:18','$2y$10$xduC3PT61RaS61mt56eryeY.yP9WayFGnB12vxJiEv.pRu/UoBTZu','','','','','','','','','0','','','0','2022-04-03 17:30:18','2022-04-03 17:30:18');
INSERT INTO users VALUES('266','','','customer','Ashish','ashhishh980@gmail.com','2022-04-04 07:33:58','$2y$10$efX.K.QBw5RDPGm237erbOLYLqbHubp.pjQmBlL6YPKxwxiRCvg3O','','','','','','','','','0','','','0','2022-04-04 07:33:58','2022-04-04 07:33:58');
INSERT INTO users VALUES('267','','','customer','Amar API','api@test.com','2022-04-04 07:39:41','$2y$10$eW1ebrG7XvxRBMFzA4HHOOd.kb4MvJWG65Ex5UwSJ/0E71gc.HKeC','','','','','','','','','0','','','0','2022-04-04 07:39:41','2022-04-04 07:39:41');
INSERT INTO users VALUES('268','','','customer','Amar APIasd','helslo@awwaa.com1s','2022-04-04 08:01:28','$2y$10$JYlkwPR.IvjYKQbpWDDvTOKh9Bir4RTTrIsJY9r2y53u/0vg8QEbO','','','','','','','','','0','','','0','2022-04-04 08:01:28','2022-04-04 08:01:28');
INSERT INTO users VALUES('269','','','customer','testing user','testinguser@gmail.com','','$2y$10$z5wahSrJZnBapHhwhPCY/eNaWn8loOGUVAjfiqISxZug7TN.AMQi6','','','','','','','','','0','','','0','2022-04-04 12:22:14','2022-04-04 12:22:14');
INSERT INTO users VALUES('270','','','seller','12343','plams1234al6@gmail.com','','$2y$10$T/lDAd.o3GvejID/vV/lYeYTjFJ7WItwGnewcDVk.RxCsPIQbFJ/q','','','','','','','','','0','','','0','2022-04-07 06:38:11','2022-04-07 06:53:47');
INSERT INTO users VALUES('271','','','customer','customer@example.com','tessst','2022-04-18 12:00:24','$2y$10$2kc4ZtjeIlSBDlm/vaWQk./NLsGGjAYbbP.3iKDGZvRGkuOuqpy3e','','','','','','','','','0','','','0','2022-04-18 12:00:24','2022-04-18 12:00:24');
INSERT INTO users VALUES('272','','','seller','aaa','customera@example.com','','$2y$10$JlTYuyuAk4Fa4wcVcPA1VOweOwMOhzcN40XgqfBb5frQVapBaU6PS','','','','','','','','','0','','','0','2022-04-19 14:10:28','2022-04-19 14:10:28');
INSERT INTO users VALUES('273','','','seller','asdf','jawasa3467@aikusy.csom','','$2y$10$zkMRSrXGgvNz0CWB3IS0HO.FIPztBlXnh3eeffNg86xxP8Vr7R64i','','','','','','','','','0','','','0','2022-04-19 14:15:45','2022-04-19 14:15:45');
INSERT INTO users VALUES('274','','','seller','asf','jawasa3467@aikusy.2','','$2y$10$hN73ZDgmIuXCKgBdyMTvWuF/OURi1/1nAj/jDMtQtoDNNyjRa1g5y','','','','','','','','','0','','','0','2022-04-19 14:24:05','2022-04-19 14:24:05');
INSERT INTO users VALUES('275','','','seller','qer','jawasa3467@aikusy.w','','$2y$10$I34lseSLz3ALBlPxgEcqo.z3CZRDYubFijnGyyK2AJI4r85nH3MjG','','','','','','','','','0','','','0','2022-04-19 14:38:59','2022-04-19 14:38:59');
INSERT INTO users VALUES('276','','','seller','1234567','joshibipin2052@gmail.com','2022-04-19 14:40:44','$2y$10$lk1Nlnbp1GIQ7.2qZOs1dOY.9oVSRuSnpktUmuU6ZsoQrktFifbp.','','','uploads/ikEHMxkDS0TU1NDJWDP8fmJP9PXNxAK6DYEDF0Pd.jpg','','','','','','0','','','0','2022-04-19 14:39:50','2022-04-24 12:55:12');
INSERT INTO users VALUES('277','','','seller','zxcv','','','$2y$10$EHggNDJZcdcuj36fz6m/I.QXcjJLBevREk3ijaPxqOv3BKb1JoDaW','','','','','','','','9123412341','0','','','0','2022-12-08 23:42:54','2022-12-08 23:42:54');
INSERT INTO users VALUES('278','','','seller','asdf','asdd@d','','$2y$10$2T/UC6Dyp6JZjGtXgqCmpeNrzha25PQla76chlKT3PRngzrt0noXa','','','','','','','','9123412411','0','','','0','2022-12-08 23:46:12','2022-12-08 23:46:12');


DROP TABLE IF EXISTS wallets;

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval` int(1) NOT NULL DEFAULT 0,
  `offline_payment` int(1) NOT NULL DEFAULT 0,
  `reciept` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO wallets VALUES('1','23','1400','Refund','Product Money Refund','0','0','','2020-09-12 06:41:20','2020-09-12 06:41:20');
INSERT INTO wallets VALUES('2','23','1400','Refund','Product Money Refund','0','0','','2022-04-01 16:13:23','2022-04-01 16:13:23');
INSERT INTO wallets VALUES('3','23','1400','Refund','Product Money Refund','0','0','','2022-04-01 16:13:23','2022-04-01 16:13:23');
INSERT INTO wallets VALUES('4','23','1400','Refund','Product Money Refund','0','0','','2022-04-01 16:13:24','2022-04-01 16:13:24');


DROP TABLE IF EXISTS wishlists;

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO wishlists VALUES('3','23','41','2020-07-26 07:50:28','2020-07-26 07:50:28');
INSERT INTO wishlists VALUES('4','23','35','2020-07-26 07:51:19','2020-07-26 07:51:19');
INSERT INTO wishlists VALUES('5','58','42','2020-09-02 10:07:15','2020-09-02 10:07:15');
INSERT INTO wishlists VALUES('6','58','13','2020-09-02 10:08:57','2020-09-02 10:08:57');
INSERT INTO wishlists VALUES('7','58','35','2020-09-02 10:22:24','2020-09-02 10:22:24');
INSERT INTO wishlists VALUES('8','58','14','2020-09-02 13:05:24','2020-09-02 13:05:24');
INSERT INTO wishlists VALUES('9','58','22','2020-09-02 13:05:39','2020-09-02 13:05:39');
INSERT INTO wishlists VALUES('10','58','19','2020-09-02 13:05:45','2020-09-02 13:05:45');
INSERT INTO wishlists VALUES('11','58','26','2020-09-02 13:06:13','2020-09-02 13:06:13');
INSERT INTO wishlists VALUES('12','23','47','2020-09-08 12:14:49','2020-09-08 12:14:49');
INSERT INTO wishlists VALUES('13','66','42','2020-09-09 15:28:10','2020-09-09 15:28:10');
INSERT INTO wishlists VALUES('14','20','42','2020-09-10 13:16:15','2020-09-10 13:16:15');
INSERT INTO wishlists VALUES('15','71','25','2020-09-11 08:40:48','2020-09-11 08:40:48');
INSERT INTO wishlists VALUES('16','66','35','2020-09-11 09:42:18','2020-09-11 09:42:18');
INSERT INTO wishlists VALUES('17','73','42','2020-09-11 11:11:56','2020-09-11 11:11:56');
INSERT INTO wishlists VALUES('18','74','32','2020-09-11 20:53:16','2020-09-11 20:53:16');
INSERT INTO wishlists VALUES('19','12','25','2020-09-13 14:17:42','2020-09-13 14:17:42');
INSERT INTO wishlists VALUES('20','58','47','2020-09-25 11:44:49','2020-09-25 11:44:49');
INSERT INTO wishlists VALUES('21','58','36','2020-09-25 11:45:03','2020-09-25 11:45:03');
INSERT INTO wishlists VALUES('24','85','36','2020-10-16 14:48:33','2020-10-16 14:48:33');
INSERT INTO wishlists VALUES('25','20','47','2020-10-16 15:55:36','2020-10-16 15:55:36');
INSERT INTO wishlists VALUES('26','20','36','2020-10-16 15:57:42','2020-10-16 15:57:42');
INSERT INTO wishlists VALUES('36','84','47','2020-10-19 15:55:41','2020-10-19 15:55:41');
INSERT INTO wishlists VALUES('37','88','36','2020-10-19 19:21:22','2020-10-19 19:21:22');
INSERT INTO wishlists VALUES('38','88','60','2020-10-20 15:27:18','2020-10-20 15:27:18');
INSERT INTO wishlists VALUES('39','65','60','2020-10-21 19:50:02','2020-10-21 19:50:02');
INSERT INTO wishlists VALUES('40','95','57','2020-10-22 09:28:03','2020-10-22 09:28:03');
INSERT INTO wishlists VALUES('41','95','60','2020-10-22 09:28:26','2020-10-22 09:28:26');
INSERT INTO wishlists VALUES('42','95','55','2020-10-22 09:28:32','2020-10-22 09:28:32');
INSERT INTO wishlists VALUES('43','95','56','2020-10-22 09:29:03','2020-10-22 09:29:03');
INSERT INTO wishlists VALUES('44','107','93','2020-11-08 04:26:33','2020-11-08 04:26:33');
INSERT INTO wishlists VALUES('45','107','100','2020-11-08 04:31:03','2020-11-08 04:31:03');
INSERT INTO wishlists VALUES('46','107','96','2020-11-08 04:31:53','2020-11-08 04:31:53');
INSERT INTO wishlists VALUES('47','107','95','2020-11-08 04:32:24','2020-11-08 04:32:24');
INSERT INTO wishlists VALUES('48','33','110','2020-11-08 18:14:22','2020-11-08 18:14:22');
INSERT INTO wishlists VALUES('49','117','60','2020-11-11 10:32:27','2020-11-11 10:32:27');
INSERT INTO wishlists VALUES('50','124','104','2020-11-18 10:29:50','2020-11-18 10:29:50');
INSERT INTO wishlists VALUES('51','155','57','2020-11-29 12:07:58','2020-11-29 12:07:58');
INSERT INTO wishlists VALUES('52','172','119','2020-12-07 17:03:24','2020-12-07 17:03:24');
INSERT INTO wishlists VALUES('53','175','111','2020-12-08 06:55:47','2020-12-08 06:55:47');
INSERT INTO wishlists VALUES('54','184','118','2020-12-10 20:03:49','2020-12-10 20:03:49');
INSERT INTO wishlists VALUES('55','185','107','2020-12-11 09:07:58','2020-12-11 09:07:58');
INSERT INTO wishlists VALUES('58','77','65','2021-05-28 16:22:05','2021-05-28 16:22:05');
INSERT INTO wishlists VALUES('59','230','147','2022-01-04 14:44:03','2022-01-04 14:44:03');
INSERT INTO wishlists VALUES('61','237','118','2022-01-04 15:23:23','2022-01-04 15:23:23');
INSERT INTO wishlists VALUES('62','237','121','2022-01-04 15:23:55','2022-01-04 15:23:55');
INSERT INTO wishlists VALUES('63','237','84','2022-03-11 13:40:17','2022-03-11 13:40:17');
INSERT INTO wishlists VALUES('93','8','71','2022-04-18 05:59:16','2022-04-18 05:59:16');


