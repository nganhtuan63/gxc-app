-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 22, 2011 at 05:09 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `gxc_cms`
--



-- --------------------------------------------------------

--
-- Table structure for table `gxc_session`
--

CREATE TABLE `gxc_session` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_session`
--



-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Table structure for table `gxc_auth_assignment`
--

CREATE TABLE `gxc_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_auth_assignment`
--

INSERT INTO `gxc_auth_assignment` VALUES('Admin', '1', NULL, 'N;');
INSERT INTO `gxc_auth_assignment` VALUES('Reporter', '2', NULL, 'N;');
INSERT INTO `gxc_auth_assignment` VALUES('Admin', '7', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `gxc_auth_item`
--

CREATE TABLE `gxc_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_auth_item`
--

INSERT INTO `gxc_auth_item` VALUES('Guest', 2, 'Guest', 'return Yii::app()->user->isGuest;', 'N;');
INSERT INTO `gxc_auth_item` VALUES('Authenticated', 2, 'Authenticated', 'return !Yii::app()->user->isGuest;', 'N;');
INSERT INTO `gxc_auth_item` VALUES('Admin', 2, NULL, NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Reporter', 2, 'Reporter', NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Besite.*', 1, NULL, NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Besite.Index', 0, NULL, NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Besite.Error', 0, NULL, NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Besite.Login', 0, NULL, NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Besite.Logout', 0, NULL, NULL, 'N;');
INSERT INTO `gxc_auth_item` VALUES('Editor', 2, 'Editor', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `gxc_auth_item_child`
--

CREATE TABLE `gxc_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_auth_item_child`
--

INSERT INTO `gxc_auth_item_child` VALUES('Authenticated', 'Besite.Error');
INSERT INTO `gxc_auth_item_child` VALUES('Authenticated', 'Besite.Login');
INSERT INTO `gxc_auth_item_child` VALUES('Authenticated', 'Besite.Logout');
INSERT INTO `gxc_auth_item_child` VALUES('Guest', 'Besite.Error');
INSERT INTO `gxc_auth_item_child` VALUES('Guest', 'Besite.Login');
INSERT INTO `gxc_auth_item_child` VALUES('Guest', 'Besite.Logout');
INSERT INTO `gxc_auth_item_child` VALUES('Reporter', 'Besite.Error');
INSERT INTO `gxc_auth_item_child` VALUES('Reporter', 'Besite.Index');
INSERT INTO `gxc_auth_item_child` VALUES('Reporter', 'Besite.Login');
INSERT INTO `gxc_auth_item_child` VALUES('Reporter', 'Besite.Logout');

-- --------------------------------------------------------

--
-- Table structure for table `gxc_autologin_tokens`
--

CREATE TABLE `gxc_autologin_tokens` (
  `user_id` bigint(20) NOT NULL,
  `token` char(40) NOT NULL,
  PRIMARY KEY (`user_id`,`token`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gxc_autologin_tokens`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_block`
--

CREATE TABLE `gxc_block` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) DEFAULT '0',
  `creator` bigint(20) NOT NULL,
  `updated` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`block_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `gxc_block`
--

INSERT INTO `gxc_block` VALUES(1, 'Logo and Info Block', 'logo_info', 1328776042, 1, 1328776042, 'a:0:{}');
INSERT INTO `gxc_block` VALUES(2, 'Introduce Block - This is a simple HTML Block', 'html', 1328778200, 1, 1328863645, 'a:1:{s:4:"html";s:568:"\r\n<h2>About Us &amp; Our Mission</h2>\r\n<p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at venenatis lacus. Quisque aliquam facilisis augue, et viverra mauris pellentesque sed. Quisque ut nibh at eros commodo auctor nec eu augue. Vivamus dignissim sollicitudin aliquet. Vivamus sed commodo turpis. Fusce tempor euismod accumsan. Nunc non tincidunt dui. Vestibulum bibendum ligula nec enim lobortis et euismod arcu gravida. Aenean blandit turpis id libero varius hendrerit. Nunc vitae malesuada elit. Nam sit amet arcu vel eros commodo euismod.</p>\r\n\r\n";}');
INSERT INTO `gxc_block` VALUES(3, 'Footer Block - Just a simple HTML Block', 'html', 1328780295, 1, 1328782216, 'a:1:{s:4:"html";s:474:" <div class="info wide">\r\n        	<h2>Contact Us</h2>\r\n<p>GXC CMS is an open source CMS written on Yii Framework. It has been developed since July 2011 by <a href="http://www.nganhtuan.com">Tuan Nguyen </a> and <a href="http://www.tringuyen.me">Tri Nguyen</a> from <a href="http://www.gxcsolutions.com">GxcSolutions</a>. Happy coding!  </p>\r\n        	<p>We love to talk and share, feel free to contact us at <br /> info@gxcsolutions.com\r\n        	<p>&copy; 2012</p>\r\n</div>";}');
INSERT INTO `gxc_block` VALUES(4, 'This is a sample of a content list render Block', 'listview', 1328781868, 1, 1328861471, 'a:2:{s:12:"content_list";a:1:{i:0;s:1:"1";}s:12:"display_type";s:1:"0";}');
INSERT INTO `gxc_block` VALUES(5, 'Error Notification Block', 'error_notification', 1328862233, 1, 1328862233, 'a:0:{}');
INSERT INTO `gxc_block` VALUES(6, 'Content detail view ', 'content_detail_view', 1328863997, 1, 1328863997, 'a:0:{}');
INSERT INTO `gxc_block` VALUES(7, 'Div class clear Both Block', 'html', 1328979146, 1, 1328979146, 'a:1:{s:4:"html";s:30:"<div style="clear:both"></div>";}');


-- --------------------------------------------------------

--
-- Table structure for table `gxc_content_list`
--

CREATE TABLE `gxc_content_list` (
  `content_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`content_list_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `gxc_content_list`
--

INSERT INTO `gxc_content_list` VALUES(1, 'List of newest articles for the homepage', 'a:9:{s:4:"type";s:1:"2";s:4:"lang";a:1:{i:0;s:1:"0";}s:12:"content_type";a:1:{i:0;s:7:"article";}s:5:"terms";a:1:{i:0;s:1:"0";}s:4:"tags";s:0:"";s:6:"paging";s:1:"0";s:6:"number";s:1:"2";s:8:"criteria";s:1:"1";s:11:"manual_list";a:0:{}}', 1328781851);

-- --------------------------------------------------------

--
-- Table structure for table `gxc_language`
--

CREATE TABLE `gxc_language` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(255) DEFAULT '',
  `lang_desc` varchar(255) DEFAULT '',
  `lang_required` tinyint(1) DEFAULT '0',
  `lang_active` tinyint(1) DEFAULT '0',
  `lang_short` varchar(10) NOT NULL,
  PRIMARY KEY (`lang_id`),
  KEY `lang_desc` (`lang_desc`),
  KEY `lang_name` (`lang_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gxc_language`
--

INSERT INTO `gxc_language` VALUES(1, 'vi_vn', 'Vietnamese', 0, 1, 'vi');
INSERT INTO `gxc_language` VALUES(2, 'en_us', 'English', 0, 1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `gxc_menu`
--

CREATE TABLE `gxc_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `menu_description` varchar(255) NOT NULL,
  `lang` tinyint(4) DEFAULT NULL,
  `guid` varchar(255) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_menu_item`
--

CREATE TABLE `gxc_menu_item` (
  `menu_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `parent` int(10) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  PRIMARY KEY (`menu_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_menu_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_object`
--

CREATE TABLE `gxc_object` (
  `object_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_author` bigint(20) unsigned DEFAULT '0',
  `object_date` int(11) NOT NULL DEFAULT '0',
  `object_date_gmt` int(11) NOT NULL DEFAULT '0',
  `object_content` longtext,
  `object_title` text,
  `object_excerpt` text,
  `object_status` tinyint(4) NOT NULL DEFAULT '1',
  `comment_status` tinyint(4) NOT NULL DEFAULT '1',
  `object_password` varchar(20) DEFAULT NULL,
  `object_name` varchar(255) NOT NULL DEFAULT '',
  `object_modified` int(11) NOT NULL DEFAULT '0',
  `object_modified_gmt` int(11) NOT NULL DEFAULT '0',
  `object_content_filtered` text,
  `object_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `object_type` varchar(20) NOT NULL DEFAULT 'object',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  `object_slug` varchar(255) DEFAULT NULL,
  `object_description` text,
  `object_keywords` text,
  `lang` tinyint(4) DEFAULT '1',
  `object_author_name` varchar(255) DEFAULT NULL,
  `total_number_meta` tinyint(3) NOT NULL,
  `total_number_resource` tinyint(3) NOT NULL,
  `tags` text,
  `object_view` int(11) NOT NULL DEFAULT '0',
  `like` int(11) NOT NULL DEFAULT '0',
  `dislike` int(11) NOT NULL DEFAULT '0',
  `rating_scores` int(11) NOT NULL DEFAULT '0',
  `rating_average` float NOT NULL DEFAULT '0',
  `layout` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `object_name` (`object_name`),
  KEY `type_status_date` (`object_type`,`object_status`,`object_date`,`object_id`),
  KEY `object_parent` (`object_parent`),
  KEY `object_author` (`object_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `gxc_object`
--

--
-- Dumping data for table `gxc_object`
--


INSERT INTO `gxc_object` VALUES(5, 1, 1328780832, 1328755632, '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac elit tincidunt dui auctor porta sit amet vel eros. Etiam bibendum vulputate odio at rutrum. In lectus tellus, commodo a cursus a, lacinia ac turpis. Cras sodales lobortis est, sit amet blandit tortor pharetra quis. Integer blandit turpis eget est faucibus egestas non non lacus. Sed mi eros, convallis vel consequat eleifend, gravida quis enim. Duis lectus libero, vestibulum sed pellentesque quis, elementum scelerisque orci. Pellentesque vitae lectus in justo tempus iaculis.</span></p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	Donec bibendum tincidunt diam, euismod molestie orci faucibus eu. Proin non tortor urna, at vulputate orci. Curabitur vel ligula magna. Sed eu massa enim. Suspendisse erat diam, sodales sed tristique at, accumsan et risus. In molestie aliquet nisl ac vestibulum. Aliquam eros dolor, laoreet ac iaculis eget, pretium in lectus. Suspendisse in nisi sapien. Vestibulum in scelerisque quam. Donec nec velit ligula, ut pulvinar nibh. Nulla iaculis, diam eget porta imperdiet, odio tortor semper odio, vel lobortis diam erat vel nisi.</p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	Sed in neque diam. Aenean nec neque lorem, id rutrum tellus. Sed at metus quam. Sed adipiscing lacus enim. Curabitur pharetra mauris a tortor bibendum vitae scelerisque erat congue. Cras molestie tincidunt elementum. Proin quis enim risus, ut porta erat. Vestibulum tristique nisi et magna viverra placerat. Phasellus varius, est quis aliquam suscipit, felis mauris malesuada lectus, nec rutrum urna libero vitae est. Proin quis mauris id arcu cursus euismod nec sed purus. Duis lectus metus, tincidunt ac placerat eu, rutrum id odio. Donec vulputate lorem a mi sagittis imperdiet. In metus sem, faucibus sed tempor non, lacinia vitae quam.</p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	In id hendrerit purus. Suspendisse molestie nisl sagittis nisl laoreet consequat. Mauris et quam ligula. Praesent vulputate blandit iaculis. Aliquam erat volutpat. In elementum porta ligula ut semper. Donec at felis purus, id accumsan quam. Aliquam molestie aliquam odio consectetur volutpat. Cras neque mi, ullamcorper at laoreet fermentum, feugiat sed leo. Praesent placerat mattis mauris at auctor. Sed odio nisl, molestie in dapibus nec, condimentum eu dui.</p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	Praesent ligula neque, semper vitae lobortis vestibulum, tempor vel sapien. Nullam feugiat felis id enim iaculis posuere. Maecenas vitae lectus at ligula condimentum sodales. Proin vitae nisl sit amet nulla rutrum vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean mollis luctus nisi, ac congue quam vehicula nec. Donec eget ipsum dolor. Aliquam erat volutpat. Fusce in turpis ante, quis fermentum magna. Maecenas eu tortor ac quam tincidunt euismod ac sed tellus. Sed libero nisl, posuere id ultrices et, aliquet vitae turpis. Morbi non odio ut velit tempus pharetra. Duis sagittis elit id nisi tincidunt vulputate.</p>\r\n', 'This is the sample post number 1', 'Donec bibendum tincidunt diam, euismod molestie orci faucibus eu. Proin non tortor urna, at vulputate orci. Curabitur vel ligula magna. Sed eu massa enim. Suspendisse erat diam, sodales sed tristique at, accumsan et risus. In molestie aliquet nisl ac vestibulum.', 1, 1, NULL, 'This is the sample post number 1', 1328867986, 1328842786, NULL, 0, '4f33962019cfe', 'article', 0, 'this-is-the-sample-post-number-1', 'Donec bibendum tincidunt diam, euismod molestie orci faucibus eu. Proin non tortor urna, at vulputate orci. Curabitur vel ligula magna. Sed eu massa enim. Suspendisse erat diam, sodales sed tristique at, accumsan et risus. In molestie aliquet nisl ac vestibulum.', '', 2, 'Admin', 0, 0, '', 0, 0, 0, 0, 0, NULL);
INSERT INTO `gxc_object` VALUES(6, 1, 1328780861, 1328755661, '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac elit tincidunt dui auctor porta sit amet vel eros. Etiam bibendum vulputate odio at rutrum. In lectus tellus, commodo a cursus a, lacinia ac turpis. Cras sodales lobortis est, sit amet blandit tortor pharetra quis. Integer blandit turpis eget est faucibus egestas non non lacus. Sed mi eros, convallis vel consequat eleifend, gravida quis enim. Duis lectus libero, vestibulum sed pellentesque quis, elementum scelerisque orci. Pellentesque vitae lectus in justo tempus iaculis.</span></p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	Donec bibendum tincidunt diam, euismod molestie orci faucibus eu. Proin non tortor urna, at vulputate orci. Curabitur vel ligula magna. Sed eu massa enim. Suspendisse erat diam, sodales sed tristique at, accumsan et risus. In molestie aliquet nisl ac vestibulum. Aliquam eros dolor, laoreet ac iaculis eget, pretium in lectus. Suspendisse in nisi sapien. Vestibulum in scelerisque quam. Donec nec velit ligula, ut pulvinar nibh. Nulla iaculis, diam eget porta imperdiet, odio tortor semper odio, vel lobortis diam erat vel nisi.</p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	Sed in neque diam. Aenean nec neque lorem, id rutrum tellus. Sed at metus quam. Sed adipiscing lacus enim. Curabitur pharetra mauris a tortor bibendum vitae scelerisque erat congue. Cras molestie tincidunt elementum. Proin quis enim risus, ut porta erat. Vestibulum tristique nisi et magna viverra placerat. Phasellus varius, est quis aliquam suscipit, felis mauris malesuada lectus, nec rutrum urna libero vitae est. Proin quis mauris id arcu cursus euismod nec sed purus. Duis lectus metus, tincidunt ac placerat eu, rutrum id odio. Donec vulputate lorem a mi sagittis imperdiet. In metus sem, faucibus sed tempor non, lacinia vitae quam.</p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	In id hendrerit purus. Suspendisse molestie nisl sagittis nisl laoreet consequat. Mauris et quam ligula. Praesent vulputate blandit iaculis. Aliquam erat volutpat. In elementum porta ligula ut semper. Donec at felis purus, id accumsan quam. Aliquam molestie aliquam odio consectetur volutpat. Cras neque mi, ullamcorper at laoreet fermentum, feugiat sed leo. Praesent placerat mattis mauris at auctor. Sed odio nisl, molestie in dapibus nec, condimentum eu dui.</p>\r\n<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-top: 0px; margin-right: 0px; margin-bottom: 14px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; ">\r\n	Praesent ligula neque, semper vitae lobortis vestibulum, tempor vel sapien. Nullam feugiat felis id enim iaculis posuere. Maecenas vitae lectus at ligula condimentum sodales. Proin vitae nisl sit amet nulla rutrum vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean mollis luctus nisi, ac congue quam vehicula nec. Donec eget ipsum dolor. Aliquam erat volutpat. Fusce in turpis ante, quis fermentum magna. Maecenas eu tortor ac quam tincidunt euismod ac sed tellus. Sed libero nisl, posuere id ultrices et, aliquet vitae turpis. Morbi non odio ut velit tempus pharetra. Duis sagittis elit id nisi tincidunt vulputate.</p>\r\n', 'This is the sample post number 2', 'In id hendrerit purus. Suspendisse molestie nisl sagittis nisl laoreet consequat. Mauris et quam ligula. Praesent vulputate blandit iaculis. Aliquam erat volutpat. In elementum porta ligula ut semper.', 1, 1, NULL, 'This is the sample post number 2', 1328867993, 1328842793, NULL, 0, '4f33963d6b7d6', 'article', 0, 'this-is-the-sample-post-number-2', 'In id hendrerit purus. Suspendisse molestie nisl sagittis nisl laoreet consequat. Mauris et quam ligula. Praesent vulputate blandit iaculis. Aliquam erat volutpat. In elementum porta ligula ut semper.', '', 2, 'Admin', 0, 0, '', 0, 0, 0, 0, 0, NULL);



-- --------------------------------------------------------

--
-- Table structure for table `gxc_object_meta`
--

CREATE TABLE `gxc_object_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meta_object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `object_id` (`meta_object_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gxc_object_meta`
--




-- --------------------------------------------------------

--
-- Table structure for table `gxc_object_resource`
--


CREATE TABLE `gxc_object_resource` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resource_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resource_order` int(11) NOT NULL DEFAULT '0',
  `description` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`object_id`,`resource_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_object_resource`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_object_term`
--

CREATE TABLE `gxc_object_term` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_id`),
  KEY `term_id` (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_object_term`
--

INSERT INTO `gxc_object_term` VALUES(5, 1);
INSERT INTO `gxc_object_term` VALUES(6, 1);


-- --------------------------------------------------------

--
-- Table structure for table `gxc_page`
--

CREATE TABLE `gxc_page` (
  `page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent` bigint(20) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `lang` tinyint(4) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `allow_index` tinyint(1) NOT NULL DEFAULT '1',
  `allow_follow` tinyint(1) NOT NULL DEFAULT '1',
  `display_type` varchar(50) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gxc_page`
--

INSERT INTO `gxc_page` VALUES(1, 'home', 'Homepage', 'Homepage', 0, 'default', 'home', 2, '4f3373e0a0648', 1, 'Homepage', 1, 1, 'main');
INSERT INTO `gxc_page` VALUES(2, 'Error', 'Error', 'Error Notification', 0, 'default', 'error', 2, '4f34d20be0f79', 1, 'Error Notification', 1, 1, 'empty');
INSERT INTO `gxc_page` VALUES(3, 'Post Detail View', 'Post Detail View', 'Post Detail View', 1, 'default', 'post', 2, '4f34da1b41620', 1, 'Post Detail View', 1, 1, 'main');



-- --------------------------------------------------------

--
-- Table structure for table `gxc_page_block`
--

CREATE TABLE `gxc_page_block` (
  `page_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `block_order` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `region` int(11) NOT NULL,
  PRIMARY KEY (`page_id`,`block_id`,`block_order`,`region`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_page_block`
--

INSERT INTO `gxc_page_block` VALUES(1, 4, 2, 1, 1);
INSERT INTO `gxc_page_block` VALUES(1, 2, 1, 1, 1);
INSERT INTO `gxc_page_block` VALUES(1, 1, 1, 1, 0);
INSERT INTO `gxc_page_block` VALUES(1, 7, 3, 1, 1);
INSERT INTO `gxc_page_block` VALUES(2, 5, 1, 1, 1);
INSERT INTO `gxc_page_block` VALUES(3, 6, 1, 1, 1);
INSERT INTO `gxc_page_block` VALUES(3, 1, 1, 1, 0);
INSERT INTO `gxc_page_block` VALUES(3, 3, 1, 1, 2);
INSERT INTO `gxc_page_block` VALUES(1, 3, 1, 1, 2);


-- --------------------------------------------------------

--
-- Table structure for table `gxc_rights`
--

CREATE TABLE `gxc_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_rights`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_settings`
--

CREATE TABLE `gxc_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL DEFAULT 'system',
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_key` (`category`,`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `gxc_settings`
--

INSERT INTO `gxc_settings` VALUES(3, 'system', 'support_email', '{{SUPPORT_EMAIL}}');
INSERT INTO `gxc_settings` VALUES(5, 'system', 'page_size', 's:2:"10";');
INSERT INTO `gxc_settings` VALUES(6, 'system', 'language_number', 's:1:"2";');
INSERT INTO `gxc_settings` VALUES(7, 'general', 'site_name', '{{SITE_NAME}}');
INSERT INTO `gxc_settings` VALUES(8, 'general', 'site_title', '{{SITE_NAME}}');
INSERT INTO `gxc_settings` VALUES(9, 'general', 'site_description', '{{SITE_NAME}}');
INSERT INTO `gxc_settings` VALUES(13, 'general', 'homepage', 's:4:"home";');
INSERT INTO `gxc_settings` VALUES(14, 'general', 'slogan', '{{SLOGAN}}');
INSERT INTO `gxc_settings` VALUES(15, 'general', 'post_link', 's:4:"post";');
INSERT INTO `gxc_settings` VALUES(16, 'general', 'error_link', 's:5:"error";');
INSERT INTO `gxc_settings` VALUES(17, 'system', 'keep_file_name_upload', 's:1:"0";');



-- --------------------------------------------------------

--
-- Table structure for table `gxc_source_message`
--

CREATE TABLE `gxc_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=185 ;

--
-- Dumping data for table `gxc_source_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_tag`
--

CREATE TABLE `gxc_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `frequency` int(11) DEFAULT '1',
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_tag_relationships`
--

CREATE TABLE `gxc_tag_relationships` (
  `tag_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tag_id`,`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_tag_relationships`
--


--
-- Table structure for table `gxc_taxonomy`
--

CREATE TABLE `gxc_taxonomy` (
  `taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'article',
  `lang` tinyint(4) DEFAULT '1',
  `guid` varchar(255) NOT NULL,
  PRIMARY KEY (`taxonomy_id`),
  KEY `taxonomy` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gxc_taxonomy`
--

INSERT INTO `gxc_taxonomy` VALUES(1, 'Article Categories', 'Article Categories', 'article', 2, '4f336d87ac576');
INSERT INTO `gxc_taxonomy` VALUES(2, 'Event Categories', 'Event Categories', 'event', 2, '4f336d99f1482');

-- --------------------------------------------------------

--
-- Table structure for table `gxc_term`
--

CREATE TABLE `gxc_term` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `taxonomy_id` int(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `slug` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`term_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gxc_term`
--

INSERT INTO `gxc_term` VALUES(1, 1, 'Uncategories', 'Uncategories', 'uncategories', 0, 1);
INSERT INTO `gxc_term` VALUES(2, 2, 'Uncategories', 'Uncategories', 'uncategories-event', 0, 1);


-- --------------------------------------------------------

--
-- Table structure for table `gxc_transfer`
--

CREATE TABLE `gxc_transfer` (
  `transfer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `from_user_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `before_status` tinyint(2) NOT NULL,
  `after_status` tinyint(2) NOT NULL,
  `type` int(11) NOT NULL,
  `note` varchar(125) DEFAULT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`transfer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `gxc_transfer`
--

INSERT INTO `gxc_transfer` VALUES(43, 1, 1, 0, 2, 1, 3, NULL, 1328760601);
INSERT INTO `gxc_transfer` VALUES(46, 4, 1, 0, 2, 1, 3, NULL, 1328760876);

-- --------------------------------------------------------

--
-- Table structure for table `gxc_translated_message`
--

CREATE TABLE `gxc_translated_message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text,
  PRIMARY KEY (`id`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gxc_translated_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `gxc_user`
--

CREATE TABLE `gxc_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `user_url` varchar(128) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `fbuid` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_time` int(11) NOT NULL,
  `updated_time` int(11) NOT NULL,
  `recent_login` int(11) NOT NULL,
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(2) NOT NULL DEFAULT '0',
  `gender` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `bio` text,
  `birthday_month` varchar(50) DEFAULT NULL,
  `birthday_day` varchar(2) DEFAULT NULL,
  `birthday_year` varchar(4) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email_site_news` tinyint(1) NOT NULL DEFAULT '1',
  `email_search_alert` tinyint(1) NOT NULL DEFAULT '1',
  `email_recover_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `gxc_user`
--

INSERT INTO `gxc_user` VALUES(1, 'admin', 'admin', 'Admin', '{{password}}', '{{password_salt}}', 'admin@localhost.com', NULL, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `gxc_user_meta`
--

CREATE TABLE `gxc_user_meta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_user_meta`
--

-- --------------------------------------------------------

--
-- Table structure for table `gxc_resource`
--

CREATE TABLE `gxc_resource` (
  `resource_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT '',
  `resource_body` text,
  `resource_path` varchar(255) DEFAULT '',
  `resource_type` varchar(50) DEFAULT NULL,
  `created` int(11) DEFAULT '0',
  `updated` int(11) DEFAULT '0',
  `creator` bigint(20) NOT NULL,
  `where` varchar(50) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `gxc_resource`
--


