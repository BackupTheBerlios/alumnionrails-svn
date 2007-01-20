-- phpMyAdmin SQL Dump
-- version 2.6.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Erstellungszeit: 13. Januar 2007 um 20:08
-- Server Version: 4.1.9
-- PHP-Version: 4.3.11RC1-dev
-- 
-- Datenbank: `alumnionrails_development`
-- 

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `addresses`
-- 

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL auto_increment,
  `countries_id` int(11) NOT NULL default '0',
  `zip` varchar(15) default NULL,
  `city` varchar(30) NOT NULL default '',
  `street` varchar(90) default NULL,
  `phone_no` varchar(30) default NULL,
  `cellphone_no` varchar(30) default NULL,
  `facsimile_no` varchar(30) default NULL,
  PRIMARY KEY  (`id`),
  KEY `addresses_FKIndex1` (`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `addresses`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `comments`
-- 

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `users_id` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `title` varchar(60) NOT NULL default '',
  `body` text NOT NULL,
  PRIMARY KEY  (`id`,`users_id`),
  KEY `comments_FKIndex1` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `comments`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `companies`
-- 

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL auto_increment,
  `addresses_id` int(11) NOT NULL default '0',
  `users_id` int(11) NOT NULL default '0',
  `emp_from` date default NULL,
  `emp_until` date default NULL,
  `emp_status` int(11) default NULL,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) default NULL,
  `job` varchar(90) default NULL,
  `website` varchar(60) default NULL,
  PRIMARY KEY  (`id`),
  KEY `companies_FKIndex1` (`users_id`),
  KEY `companies_FKIndex2` (`addresses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `companies`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `companies_tags`
-- 

DROP TABLE IF EXISTS `companies_tags`;
CREATE TABLE `companies_tags` (
  `companies_id` int(11) NOT NULL default '0',
  `tags_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`companies_id`,`tags_id`),
  KEY `companies_tags_FKIndex1` (`companies_id`),
  KEY `companies_tags_FKIndex2` (`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `companies_tags`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `countries`
-- 

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `countries`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `courses`
-- 

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL auto_increment,
  `faculties_id` int(11) NOT NULL default '0',
  `name` varchar(90) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `courses_FKIndex1` (`faculties_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `courses`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `degree_categories`
-- 

DROP TABLE IF EXISTS `degree_categories`;
CREATE TABLE `degree_categories` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `degree_categories`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `degrees`
-- 

DROP TABLE IF EXISTS `degrees`;
CREATE TABLE `degrees` (
  `id` int(11) NOT NULL auto_increment,
  `degree_categories_id` int(11) NOT NULL default '0',
  `title` varchar(90) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `degrees_FKIndex1` (`degree_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `degrees`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `event_comments`
-- 

DROP TABLE IF EXISTS `event_comments`;
CREATE TABLE `event_comments` (
  `events_id` int(11) NOT NULL default '0',
  `comments_id` int(11) NOT NULL default '0',
  `comments_users_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`events_id`,`comments_id`,`comments_users_id`),
  KEY `event_comments_FKIndex1` (`events_id`),
  KEY `event_comments_FKIndex2` (`comments_id`,`comments_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `event_comments`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `events`
-- 

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `date_from` date NOT NULL default '0000-00-00',
  `date_until` date NOT NULL default '0000-00-00',
  `title` varchar(90) NOT NULL default '',
  `place` varchar(60) NOT NULL default '',
  `institution` varchar(90) default NULL,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `events`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `faculties`
-- 

DROP TABLE IF EXISTS `faculties`;
CREATE TABLE `faculties` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `faculties`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `link_categories`
-- 

DROP TABLE IF EXISTS `link_categories`;
CREATE TABLE `link_categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `description` varchar(120) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `link_categories`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `links`
-- 

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(11) NOT NULL auto_increment,
  `link_categories_id` int(11) NOT NULL default '0',
  `users_id` int(11) NOT NULL default '0',
  `url` varchar(120) NOT NULL default '',
  `description` text,
  PRIMARY KEY  (`id`),
  KEY `links_FKIndex1` (`users_id`),
  KEY `links_FKIndex2` (`link_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `links`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `links_tags`
-- 

DROP TABLE IF EXISTS `links_tags`;
CREATE TABLE `links_tags` (
  `links_id` int(11) NOT NULL default '0',
  `tags_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`links_id`,`tags_id`),
  KEY `links_tags_FKIndex1` (`links_id`),
  KEY `links_tags_FKIndex2` (`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `links_tags`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `papers`
-- 

DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers` (
  `id` int(11) NOT NULL auto_increment,
  `users_id` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `pdf_name` varchar(120) NOT NULL default '',
  `pdf_file` varchar(30) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `papers_FKIndex1` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `papers`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `papers_tags`
-- 

DROP TABLE IF EXISTS `papers_tags`;
CREATE TABLE `papers_tags` (
  `tags_id` int(11) NOT NULL default '0',
  `papers_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tags_id`,`papers_id`),
  KEY `papers_tags_FKIndex1` (`tags_id`),
  KEY `papers_tags_FKIndex2` (`papers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `papers_tags`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `skill_categories`
-- 

DROP TABLE IF EXISTS `skill_categories`;
CREATE TABLE `skill_categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `skill_categories`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `skills`
-- 

DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL auto_increment,
  `skill_categories_id` int(11) NOT NULL default '0',
  `name` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `skill_types_FKIndex1` (`skill_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `skills`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `tags`
-- 

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_tags_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `tags`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `training_comments`
-- 

DROP TABLE IF EXISTS `training_comments`;
CREATE TABLE `training_comments` (
  `trainings_id` int(11) NOT NULL default '0',
  `comments_id` int(11) NOT NULL default '0',
  `comments_users_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`trainings_id`,`comments_id`,`comments_users_id`),
  KEY `training_comments_FKIndex1` (`trainings_id`),
  KEY `training_comments_FKIndex2` (`comments_id`,`comments_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `training_comments`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `training_links`
-- 

DROP TABLE IF EXISTS `training_links`;
CREATE TABLE `training_links` (
  `id` int(11) NOT NULL auto_increment,
  `trainings_id` int(11) NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  `description` text,
  PRIMARY KEY  (`id`),
  KEY `training_links_FKIndex1` (`trainings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `training_links`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `trainings`
-- 

DROP TABLE IF EXISTS `trainings`;
CREATE TABLE `trainings` (
  `id` int(11) NOT NULL auto_increment,
  `degrees_id` int(11) NOT NULL default '0',
  `users_id` int(11) NOT NULL default '0',
  `start_date` date default NULL,
  `end_date` date default NULL,
  `institution` varchar(90) NOT NULL default '',
  `title` varchar(90) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `trainings_FKIndex1` (`users_id`),
  KEY `trainings_FKIndex2` (`degrees_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `trainings`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `trainings_tags`
-- 

DROP TABLE IF EXISTS `trainings_tags`;
CREATE TABLE `trainings_tags` (
  `tags_id` int(11) NOT NULL default '0',
  `trainings_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tags_id`,`trainings_id`),
  KEY `trainings_tags_FKIndex1` (`tags_id`),
  KEY `trainings_tags_FKIndex2` (`trainings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `trainings_tags`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_skills`
-- 

DROP TABLE IF EXISTS `user_skills`;
CREATE TABLE `user_skills` (
  `id` int(11) NOT NULL auto_increment,
  `skills_id` int(11) NOT NULL default '0',
  `users_id` int(11) NOT NULL default '0',
  `level` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_skills_FKIndex1` (`users_id`),
  KEY `user_skills_FKIndex2` (`skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `user_skills`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `addresses_id` int(11) NOT NULL default '0',
  `courses_id` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `login` varchar(20) NOT NULL default '',
  `passwd` varchar(15) NOT NULL default '',
  `surname` varchar(30) NOT NULL default '',
  `forename` varchar(30) NOT NULL default '',
  `course_year` year(4) NOT NULL default '0000',
  `course_no` tinyint(3) unsigned NOT NULL default '0',
  `dob` date default NULL,
  `birthname` varchar(30) default NULL,
  `email` varchar(60) NOT NULL default '',
  `photo` varchar(30) default NULL,
  `icq` int(15) default NULL,
  `msn` varchar(60) default NULL,
  `aim` varchar(60) default NULL,
  `skype` varchar(30) default NULL,
  `jabber` varchar(60) default NULL,
  `yahoo` varchar(60) default NULL,
  PRIMARY KEY  (`id`),
  KEY `users_FKIndex1` (`courses_id`),
  KEY `users_FKIndex2` (`addresses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `users`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `users_events`
-- 

DROP TABLE IF EXISTS `users_events`;
CREATE TABLE `users_events` (
  `users_id` int(11) NOT NULL default '0',
  `events_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`users_id`,`events_id`),
  KEY `users_has_events_FKIndex1` (`users_id`),
  KEY `users_has_events_FKIndex2` (`events_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `users_events`
-- 

        