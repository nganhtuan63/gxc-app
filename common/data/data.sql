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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `gxc_block`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `gxc_content_list`
--



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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `gxc_object`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `gxc_page`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `gxc_settings`
--

INSERT INTO `gxc_settings` VALUES(3, 'system', 'support_email', 's:22:"support@localhost.com";');
INSERT INTO `gxc_settings` VALUES(5, 'system', 'page_size', 's:2:"10";');
INSERT INTO `gxc_settings` VALUES(6, 'system', 'language_number', 's:1:"2";');
INSERT INTO `gxc_settings` VALUES(7, 'general', 'site_name', 's:12:"GXC-CMS Demo Website";');
INSERT INTO `gxc_settings` VALUES(8, 'general', 'site_title', 's:40:"GXC-CMS Demo Website";');
INSERT INTO `gxc_settings` VALUES(9, 'general', 'site_description', 's:40:"GXC-CMS Demo Website";');
INSERT INTO `gxc_settings` VALUES(13, 'general', 'homepage', 's:4:"home";');

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

INSERT INTO `gxc_source_message` VALUES(1, 'cms', 'Update User');
INSERT INTO `gxc_source_message` VALUES(2, 'cms', 'This email has been registerd.');
INSERT INTO `gxc_source_message` VALUES(3, 'cms', 'Username has been registerd.');
INSERT INTO `gxc_source_message` VALUES(4, 'cms', 'Url has been registerd.');
INSERT INTO `gxc_source_message` VALUES(5, 'cms', 'User');
INSERT INTO `gxc_source_message` VALUES(6, 'cms', 'Username');
INSERT INTO `gxc_source_message` VALUES(7, 'cms', 'User Url');
INSERT INTO `gxc_source_message` VALUES(8, 'cms', 'Display Name');
INSERT INTO `gxc_source_message` VALUES(9, 'cms', 'Password');
INSERT INTO `gxc_source_message` VALUES(10, 'cms', 'Salt');
INSERT INTO `gxc_source_message` VALUES(11, 'cms', 'Email');
INSERT INTO `gxc_source_message` VALUES(12, 'cms', 'Fbuid');
INSERT INTO `gxc_source_message` VALUES(13, 'cms', 'Status');
INSERT INTO `gxc_source_message` VALUES(14, 'cms', 'Created Time');
INSERT INTO `gxc_source_message` VALUES(15, 'cms', 'Updated Time');
INSERT INTO `gxc_source_message` VALUES(16, 'cms', 'Recent Login');
INSERT INTO `gxc_source_message` VALUES(17, 'cms', 'User Activation Key');
INSERT INTO `gxc_source_message` VALUES(18, 'cms', 'Disabled');
INSERT INTO `gxc_source_message` VALUES(19, 'cms', 'Active');
INSERT INTO `gxc_source_message` VALUES(20, 'cms', 'Create new User');
INSERT INTO `gxc_source_message` VALUES(21, 'cms', 'Email is not valid');
INSERT INTO `gxc_source_message` VALUES(22, 'cms', 'User name');
INSERT INTO `gxc_source_message` VALUES(23, 'cms', 'Manage Users');
INSERT INTO `gxc_source_message` VALUES(24, 'cms', 'Displaying');
INSERT INTO `gxc_source_message` VALUES(25, 'cms', 'in');
INSERT INTO `gxc_source_message` VALUES(26, 'cms', 'results');
INSERT INTO `gxc_source_message` VALUES(27, 'cms', 'Go to page:');
INSERT INTO `gxc_source_message` VALUES(28, 'cms', 'Next');
INSERT INTO `gxc_source_message` VALUES(29, 'cms', 'previous');
INSERT INTO `gxc_source_message` VALUES(30, 'cms', 'First');
INSERT INTO `gxc_source_message` VALUES(31, 'cms', 'Last');
INSERT INTO `gxc_source_message` VALUES(32, 'cms', 'Roles');
INSERT INTO `gxc_source_message` VALUES(33, 'cms', 'Edit');
INSERT INTO `gxc_source_message` VALUES(34, 'cms', 'Delete');
INSERT INTO `gxc_source_message` VALUES(35, 'cms', 'Welcome');
INSERT INTO `gxc_source_message` VALUES(36, 'cms', 'Settings');
INSERT INTO `gxc_source_message` VALUES(37, 'cms', 'Change Password');
INSERT INTO `gxc_source_message` VALUES(38, 'cms', 'Sign out');
INSERT INTO `gxc_source_message` VALUES(39, 'cms', 'Dashboard');
INSERT INTO `gxc_source_message` VALUES(40, 'cms', 'Content');
INSERT INTO `gxc_source_message` VALUES(41, 'cms', 'Create Content');
INSERT INTO `gxc_source_message` VALUES(42, 'cms', 'Draft Content');
INSERT INTO `gxc_source_message` VALUES(43, 'cms', 'Pending Content');
INSERT INTO `gxc_source_message` VALUES(44, 'cms', 'Published Content');
INSERT INTO `gxc_source_message` VALUES(45, 'cms', 'Manage Content');
INSERT INTO `gxc_source_message` VALUES(46, 'cms', 'Category');
INSERT INTO `gxc_source_message` VALUES(47, 'cms', 'Create Term');
INSERT INTO `gxc_source_message` VALUES(48, 'cms', 'Manage Terms');
INSERT INTO `gxc_source_message` VALUES(49, 'cms', 'Create Taxonomy');
INSERT INTO `gxc_source_message` VALUES(50, 'cms', 'Mangage Taxonomy');
INSERT INTO `gxc_source_message` VALUES(51, 'cms', 'Pages');
INSERT INTO `gxc_source_message` VALUES(52, 'cms', 'Create Menu');
INSERT INTO `gxc_source_message` VALUES(53, 'cms', 'Manage Menus');
INSERT INTO `gxc_source_message` VALUES(54, 'cms', 'Create Queue');
INSERT INTO `gxc_source_message` VALUES(55, 'cms', 'Manage Queues');
INSERT INTO `gxc_source_message` VALUES(56, 'cms', 'Create Slot');
INSERT INTO `gxc_source_message` VALUES(57, 'cms', 'Manage Slots');
INSERT INTO `gxc_source_message` VALUES(58, 'cms', 'Create Page');
INSERT INTO `gxc_source_message` VALUES(59, 'cms', 'Manage Pages');
INSERT INTO `gxc_source_message` VALUES(60, 'cms', 'Resource');
INSERT INTO `gxc_source_message` VALUES(61, 'cms', 'Create Resource');
INSERT INTO `gxc_source_message` VALUES(62, 'cms', 'Manage Resource');
INSERT INTO `gxc_source_message` VALUES(63, 'cms', 'Manage');
INSERT INTO `gxc_source_message` VALUES(64, 'cms', 'Comments');
INSERT INTO `gxc_source_message` VALUES(65, 'cms', 'Create User');
INSERT INTO `gxc_source_message` VALUES(66, 'cms', 'Permission');
INSERT INTO `gxc_source_message` VALUES(67, 'RightsModule.core', 'Assignments');
INSERT INTO `gxc_source_message` VALUES(68, 'RightsModule.core', 'Here you can view which permissions has been assigned to each user.');
INSERT INTO `gxc_source_message` VALUES(69, 'RightsModule.core', 'No users found.');
INSERT INTO `gxc_source_message` VALUES(70, 'RightsModule.core', 'Name');
INSERT INTO `gxc_source_message` VALUES(71, 'RightsModule.core', 'Roles');
INSERT INTO `gxc_source_message` VALUES(72, 'RightsModule.core', 'Tasks');
INSERT INTO `gxc_source_message` VALUES(73, 'RightsModule.core', 'Operations');
INSERT INTO `gxc_source_message` VALUES(74, 'RightsModule.core', 'Permissions');
INSERT INTO `gxc_source_message` VALUES(75, 'cms', 'Save');
INSERT INTO `gxc_source_message` VALUES(76, 'RightsModule.core', 'Assign');
INSERT INTO `gxc_source_message` VALUES(77, 'RightsModule.core', 'Revoke');
INSERT INTO `gxc_source_message` VALUES(78, 'RightsModule.core', 'Item');
INSERT INTO `gxc_source_message` VALUES(79, 'RightsModule.core', 'Here you can view and manage the permissions assigned to each role.');
INSERT INTO `gxc_source_message` VALUES(80, 'RightsModule.core', 'Authorization items can be managed under {roleLink}, {taskLink} and {operationLink}.');
INSERT INTO `gxc_source_message` VALUES(81, 'RightsModule.core', 'Generate items for controller actions');
INSERT INTO `gxc_source_message` VALUES(82, 'RightsModule.core', 'No authorization items found.');
INSERT INTO `gxc_source_message` VALUES(83, 'RightsModule.core', 'Hover to see from where the permission is inherited.');
INSERT INTO `gxc_source_message` VALUES(84, 'RightsModule.core', 'Source');
INSERT INTO `gxc_source_message` VALUES(85, 'RightsModule.core', 'A role is group of permissions to perform a variety of tasks and operations, for example the authenticated user.');
INSERT INTO `gxc_source_message` VALUES(86, 'RightsModule.core', 'Roles exist at the top of the authorization hierarchy and can therefore inherit from other roles, tasks and/or operations.');
INSERT INTO `gxc_source_message` VALUES(87, 'RightsModule.core', 'Create a new role');
INSERT INTO `gxc_source_message` VALUES(88, 'RightsModule.core', 'No roles found.');
INSERT INTO `gxc_source_message` VALUES(89, 'RightsModule.core', 'Description');
INSERT INTO `gxc_source_message` VALUES(90, 'RightsModule.core', 'Business rule');
INSERT INTO `gxc_source_message` VALUES(91, 'RightsModule.core', 'Data');
INSERT INTO `gxc_source_message` VALUES(92, 'RightsModule.core', 'Delete');
INSERT INTO `gxc_source_message` VALUES(93, 'RightsModule.core', 'Are you sure you want to delete this role?');
INSERT INTO `gxc_source_message` VALUES(94, 'RightsModule.core', 'Values within square brackets tell how many children each item has.');
INSERT INTO `gxc_source_message` VALUES(95, 'RightsModule.core', 'A task is a permission to perform multiple operations, for example accessing a group of controller action.');
INSERT INTO `gxc_source_message` VALUES(96, 'RightsModule.core', 'Tasks exist below roles in the authorization hierarchy and can therefore only inherit from other tasks and/or operations.');
INSERT INTO `gxc_source_message` VALUES(97, 'RightsModule.core', 'Create a new task');
INSERT INTO `gxc_source_message` VALUES(98, 'RightsModule.core', 'No tasks found.');
INSERT INTO `gxc_source_message` VALUES(99, 'RightsModule.core', 'Are you sure you want to delete this task?');
INSERT INTO `gxc_source_message` VALUES(100, 'RightsModule.core', 'An operation is a permission to perform a single operation, for example accessing a certain controller action.');
INSERT INTO `gxc_source_message` VALUES(101, 'RightsModule.core', 'Operations exist below tasks in the authorization hierarchy and can therefore only inherit from other operations.');
INSERT INTO `gxc_source_message` VALUES(102, 'RightsModule.core', 'Create a new operation');
INSERT INTO `gxc_source_message` VALUES(103, 'RightsModule.core', 'No operations found.');
INSERT INTO `gxc_source_message` VALUES(104, 'RightsModule.core', 'Are you sure you want to delete this operation?');
INSERT INTO `gxc_source_message` VALUES(105, 'RightsModule.core', 'Operation');
INSERT INTO `gxc_source_message` VALUES(106, 'RightsModule.core', 'Task');
INSERT INTO `gxc_source_message` VALUES(107, 'RightsModule.core', 'Role');
INSERT INTO `gxc_source_message` VALUES(108, 'RightsModule.core', 'Create :type');
INSERT INTO `gxc_source_message` VALUES(109, 'RightsModule.core', 'Do not change the name unless you know what you are doing.');
INSERT INTO `gxc_source_message` VALUES(110, 'RightsModule.core', 'A descriptive name for this item.');
INSERT INTO `gxc_source_message` VALUES(111, 'RightsModule.core', 'Code that will be executed when performing access checking.');
INSERT INTO `gxc_source_message` VALUES(112, 'RightsModule.core', 'Save');
INSERT INTO `gxc_source_message` VALUES(113, 'RightsModule.core', 'Cancel');
INSERT INTO `gxc_source_message` VALUES(114, 'cms', 'Manage User');
INSERT INTO `gxc_source_message` VALUES(115, 'cms', 'Update this user');
INSERT INTO `gxc_source_message` VALUES(116, 'cms', 'View this user');
INSERT INTO `gxc_source_message` VALUES(117, 'cms', 'Make sure the username, user url and email are unique ');
INSERT INTO `gxc_source_message` VALUES(118, 'cms', 'Here you can add new member for the site');
INSERT INTO `gxc_source_message` VALUES(119, 'cms', 'Here you can view all members information of your site');
INSERT INTO `gxc_source_message` VALUES(120, 'cms', 'View User');
INSERT INTO `gxc_source_message` VALUES(121, 'cms', 'View user details');
INSERT INTO `gxc_source_message` VALUES(122, 'cms', 'Create new content');
INSERT INTO `gxc_source_message` VALUES(123, 'cms', 'Event');
INSERT INTO `gxc_source_message` VALUES(124, 'cms', 'Article');
INSERT INTO `gxc_source_message` VALUES(125, 'cms', 'Object');
INSERT INTO `gxc_source_message` VALUES(126, 'cms', 'Object Author');
INSERT INTO `gxc_source_message` VALUES(127, 'cms', 'Object Date');
INSERT INTO `gxc_source_message` VALUES(128, 'cms', 'Object Date Gmt');
INSERT INTO `gxc_source_message` VALUES(129, 'cms', 'Object Content');
INSERT INTO `gxc_source_message` VALUES(130, 'cms', 'Object Title');
INSERT INTO `gxc_source_message` VALUES(131, 'cms', 'Object Excerpt');
INSERT INTO `gxc_source_message` VALUES(132, 'cms', 'Object Status');
INSERT INTO `gxc_source_message` VALUES(133, 'cms', 'Comment Status');
INSERT INTO `gxc_source_message` VALUES(134, 'cms', 'Object Password');
INSERT INTO `gxc_source_message` VALUES(135, 'cms', 'Object Name');
INSERT INTO `gxc_source_message` VALUES(136, 'cms', 'Object Modified');
INSERT INTO `gxc_source_message` VALUES(137, 'cms', 'Object Modified Gmt');
INSERT INTO `gxc_source_message` VALUES(138, 'cms', 'Object Content Filtered');
INSERT INTO `gxc_source_message` VALUES(139, 'cms', 'Object Parent');
INSERT INTO `gxc_source_message` VALUES(140, 'cms', 'Guid');
INSERT INTO `gxc_source_message` VALUES(141, 'cms', 'Object Type');
INSERT INTO `gxc_source_message` VALUES(142, 'cms', 'Comment Count');
INSERT INTO `gxc_source_message` VALUES(143, 'cms', 'Object Slug');
INSERT INTO `gxc_source_message` VALUES(144, 'cms', 'Object Description');
INSERT INTO `gxc_source_message` VALUES(145, 'cms', 'Object Keywords');
INSERT INTO `gxc_source_message` VALUES(146, 'cms', 'Lang');
INSERT INTO `gxc_source_message` VALUES(147, 'cms', 'Object Author Name');
INSERT INTO `gxc_source_message` VALUES(148, 'cms', 'Total Number Meta');
INSERT INTO `gxc_source_message` VALUES(149, 'cms', 'Total Number Resource');
INSERT INTO `gxc_source_message` VALUES(150, 'cms', 'Tags');
INSERT INTO `gxc_source_message` VALUES(151, 'cms', 'Object View');
INSERT INTO `gxc_source_message` VALUES(152, 'cms', 'Like');
INSERT INTO `gxc_source_message` VALUES(153, 'cms', 'Dislike');
INSERT INTO `gxc_source_message` VALUES(154, 'cms', 'Rating Scores');
INSERT INTO `gxc_source_message` VALUES(155, 'cms', 'Rating Average');
INSERT INTO `gxc_source_message` VALUES(156, 'cms', 'Layout');
INSERT INTO `gxc_source_message` VALUES(157, 'cms', 'Person');
INSERT INTO `gxc_source_message` VALUES(158, 'cms', 'Resources');
INSERT INTO `gxc_source_message` VALUES(159, 'cms', 'Content Extra');
INSERT INTO `gxc_source_message` VALUES(160, 'cms', 'Summary & SEO');
INSERT INTO `gxc_source_message` VALUES(161, 'cms', 'Summary');
INSERT INTO `gxc_source_message` VALUES(162, 'cms', 'SEO');
INSERT INTO `gxc_source_message` VALUES(163, 'cms', 'Add Term');
INSERT INTO `gxc_source_message` VALUES(164, 'cms', 'Here you can manage your Terms');
INSERT INTO `gxc_source_message` VALUES(165, 'cms', 'Term id');
INSERT INTO `gxc_source_message` VALUES(166, 'cms', 'Taxonomy id');
INSERT INTO `gxc_source_message` VALUES(167, 'cms', 'Name');
INSERT INTO `gxc_source_message` VALUES(168, 'cms', 'Description');
INSERT INTO `gxc_source_message` VALUES(169, 'cms', 'Slug');
INSERT INTO `gxc_source_message` VALUES(170, 'cms', 'Parent');
INSERT INTO `gxc_source_message` VALUES(171, 'cms', 'Published');
INSERT INTO `gxc_source_message` VALUES(172, 'cms', 'Draft');
INSERT INTO `gxc_source_message` VALUES(173, 'cms', 'Pending');
INSERT INTO `gxc_source_message` VALUES(174, 'cms', 'Hidden');
INSERT INTO `gxc_source_message` VALUES(175, 'cms', 'Publish');
INSERT INTO `gxc_source_message` VALUES(176, 'cms', 'Send to Person: ');
INSERT INTO `gxc_source_message` VALUES(177, 'cms', 'Send');
INSERT INTO `gxc_source_message` VALUES(178, 'cms', 'Send to: ');
INSERT INTO `gxc_source_message` VALUES(179, 'cms', 'Please choose a name');
INSERT INTO `gxc_source_message` VALUES(180, 'cms', 'You are not allowed to send content to this user');
INSERT INTO `gxc_source_message` VALUES(181, 'cms', 'Allow');
INSERT INTO `gxc_source_message` VALUES(182, 'cms', 'Disable');
INSERT INTO `gxc_source_message` VALUES(183, 'cms', 'General');
INSERT INTO `gxc_source_message` VALUES(184, 'cms', 'System');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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


-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_taxonomy`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_term`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `gxc_transfer`
--

INSERT INTO `gxc_transfer` VALUES(13, 18, 1, 0, 2, 1, 3, NULL, 1314807316);

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

INSERT INTO `gxc_translated_message` VALUES(1, 'en_us', 'Update User');
INSERT INTO `gxc_translated_message` VALUES(2, 'en_us', 'This email has been registered');
INSERT INTO `gxc_translated_message` VALUES(3, 'en_us', 'Username has been registered');
INSERT INTO `gxc_translated_message` VALUES(4, 'en_us', 'Url has been registered');
INSERT INTO `gxc_translated_message` VALUES(14, 'en_us', 'Created time');
INSERT INTO `gxc_translated_message` VALUES(5, 'en_us', 'User');
INSERT INTO `gxc_translated_message` VALUES(6, 'en_us', 'Username');
INSERT INTO `gxc_translated_message` VALUES(8, 'en_us', 'Display name');
INSERT INTO `gxc_translated_message` VALUES(23, 'vi_vn', 'Quản lý thành viên');
INSERT INTO `gxc_translated_message` VALUES(24, 'vi_vn', 'Hiển thị');
INSERT INTO `gxc_translated_message` VALUES(25, 'vi_vn', 'trong');
INSERT INTO `gxc_translated_message` VALUES(26, 'vi_vn', 'kết quả');
INSERT INTO `gxc_translated_message` VALUES(27, 'vi_vn', 'Đến trang:');
INSERT INTO `gxc_translated_message` VALUES(28, 'vi_vn', 'Sau');
INSERT INTO `gxc_translated_message` VALUES(29, 'vi_vn', 'Trước');
INSERT INTO `gxc_translated_message` VALUES(30, 'vi_vn', 'Đầu');
INSERT INTO `gxc_translated_message` VALUES(31, 'vi_vn', 'Cuối');
INSERT INTO `gxc_translated_message` VALUES(32, 'vi_vn', 'Nhóm');
INSERT INTO `gxc_translated_message` VALUES(13, 'vi_vn', 'Trạng thái');
INSERT INTO `gxc_translated_message` VALUES(14, 'vi_vn', 'Tạo');
INSERT INTO `gxc_translated_message` VALUES(15, 'vi_vn', 'Cập nhật');
INSERT INTO `gxc_translated_message` VALUES(16, 'vi_vn', 'Gần đây');
INSERT INTO `gxc_translated_message` VALUES(17, 'vi_vn', 'Active Key');
INSERT INTO `gxc_translated_message` VALUES(2, 'vi_vn', 'Email đã đăng ký');
INSERT INTO `gxc_translated_message` VALUES(3, 'vi_vn', 'Username đã đăng ký');
INSERT INTO `gxc_translated_message` VALUES(4, 'vi_vn', 'Url đã đăng ký');
INSERT INTO `gxc_translated_message` VALUES(33, 'vi_vn', 'Sửa');
INSERT INTO `gxc_translated_message` VALUES(34, 'vi_vn', 'Xoá');
INSERT INTO `gxc_translated_message` VALUES(5, 'vi_vn', 'Thành viên');
INSERT INTO `gxc_translated_message` VALUES(6, 'vi_vn', 'Username');
INSERT INTO `gxc_translated_message` VALUES(7, 'vi_vn', 'User Url');
INSERT INTO `gxc_translated_message` VALUES(8, 'vi_vn', 'Tên');
INSERT INTO `gxc_translated_message` VALUES(9, 'vi_vn', 'Mật khẩu');
INSERT INTO `gxc_translated_message` VALUES(10, 'vi_vn', 'Salt');
INSERT INTO `gxc_translated_message` VALUES(11, 'vi_vn', 'Email');
INSERT INTO `gxc_translated_message` VALUES(12, 'vi_vn', 'FB Id');
INSERT INTO `gxc_translated_message` VALUES(1, 'vi_vn', 'Cập nhật');
INSERT INTO `gxc_translated_message` VALUES(18, 'vi_vn', 'Khoá');
INSERT INTO `gxc_translated_message` VALUES(19, 'vi_vn', 'Kích hoạt');
INSERT INTO `gxc_translated_message` VALUES(75, 'vi_vn', 'Lưu');
INSERT INTO `gxc_translated_message` VALUES(35, 'vi_vn', 'Xin chào ');
INSERT INTO `gxc_translated_message` VALUES(36, 'vi_vn', 'Thông tin');
INSERT INTO `gxc_translated_message` VALUES(38, 'vi_vn', 'Đăng xuất');
INSERT INTO `gxc_translated_message` VALUES(37, 'vi_vn', 'Đổi mật khẩu');
INSERT INTO `gxc_translated_message` VALUES(20, 'vi_vn', 'Thêm mới');
INSERT INTO `gxc_translated_message` VALUES(21, 'vi_vn', 'Email không hợp lệ');
INSERT INTO `gxc_translated_message` VALUES(22, 'vi_vn', 'Username');
INSERT INTO `gxc_translated_message` VALUES(114, 'vi_vn', 'Quản lý thành viên');
INSERT INTO `gxc_translated_message` VALUES(65, 'vi_vn', 'Thêm mới');
INSERT INTO `gxc_translated_message` VALUES(115, 'vi_vn', 'Thay đổi thông tin');
INSERT INTO `gxc_translated_message` VALUES(116, 'vi_vn', 'Xem thông tin');
INSERT INTO `gxc_translated_message` VALUES(117, 'vi_vn', 'Username, url và email cần duy nhất');
INSERT INTO `gxc_translated_message` VALUES(118, 'vi_vn', 'Bạn có thể thểm mới thành viên tại đây');
INSERT INTO `gxc_translated_message` VALUES(119, 'vi_vn', 'Bạn có thể xem thông tin các thành viên tại đây ');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gxc_user`
--

INSERT INTO `gxc_user` VALUES(1, 'admin', 'admin', 'Tuấn Nguyễn', '1a1a807162bccbce3ccc42a6db21d8d6', 'hefd3213cxzczjdasdase321', 'admin@localhost.com', NULL, 1, 1307183214, 1324547451, 1324547451, '1307183214', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL);


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

