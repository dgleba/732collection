
#@################################################################
#@  
#@  Title:::  
#@  
#@###################################   2026-02-22[Feb-Sun]20-48PM 

 
Tables:

select activity
select attachment
select idp
select inbox
select memo
select memo_relation
select reaction
select system_setting
select user
select user_setting

------------


#@################################################################
#@  
#@  Title:::  
#@  
#@###################################   2026-02-22[Feb-Sun]20-48PM 


-- Adminer 5.4.1 MariaDB 12.1.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(256) NOT NULL DEFAULT '',
  `level` varchar(256) NOT NULL DEFAULT 'INFO',
  `payload` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(256) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `filename` text NOT NULL,
  `blob` mediumblob DEFAULT NULL,
  `type` varchar(256) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `memo_id` int(11) DEFAULT NULL,
  `storage_type` varchar(256) NOT NULL DEFAULT '',
  `reference` text NOT NULL DEFAULT '',
  `payload` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `idp`;
CREATE TABLE `idp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `identifier_filter` varchar(256) NOT NULL DEFAULT '',
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `inbox`;
CREATE TABLE `inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `status` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `memo`;
CREATE TABLE `memo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(256) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `row_status` varchar(256) NOT NULL DEFAULT 'NORMAL',
  `content` text NOT NULL,
  `visibility` varchar(256) NOT NULL DEFAULT 'PRIVATE',
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `memo` (`id`, `uid`, `creator_id`, `created_ts`, `updated_ts`, `row_status`, `content`, `visibility`, `pinned`, `payload`) VALUES
(1,	'UU9mSmMHyyHp6RckHXVmwz',	1,	'2026-02-23 01:19:32',	'2026-02-23 01:19:32',	'NORMAL',	'\n#@################################################################\n#@  \n#@  Title:::  \n#@  \n#@###################################   2026-02-22[Feb-Sun]20-19PM \n\n\nfirst',	'PRIVATE',	0,	'{\"property\":{}}'),
(2,	'SwmZLMtvU5UAHLShdoBE3v',	1,	'2026-02-23 01:24:08',	'2026-02-23 01:24:08',	'NORMAL',	'Edu',	'PRIVATE',	0,	'{\"property\":{}}'),
(3,	'78FWPZhbDUTTdk9tJnS252',	1,	'2026-02-23 01:30:33',	'2026-02-23 01:30:33',	'NORMAL',	'2026-02-22_Sun_20.30-PM\n',	'PRIVATE',	0,	'{\"property\":{}}');

DROP TABLE IF EXISTS `memo_relation`;
CREATE TABLE `memo_relation` (
  `memo_id` int(11) NOT NULL,
  `related_memo_id` int(11) NOT NULL,
  `type` varchar(256) NOT NULL,
  UNIQUE KEY `memo_id` (`memo_id`,`related_memo_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `reaction`;
CREATE TABLE `reaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `creator_id` int(11) NOT NULL,
  `content_id` varchar(256) NOT NULL,
  `reaction_type` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `creator_id` (`creator_id`,`content_id`,`reaction_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `system_setting`;
CREATE TABLE `system_setting` (
  `name` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `row_status` varchar(256) NOT NULL DEFAULT 'NORMAL',
  `username` varchar(256) NOT NULL,
  `role` varchar(256) NOT NULL DEFAULT 'USER',
  `email` varchar(256) NOT NULL DEFAULT '',
  `nickname` varchar(256) NOT NULL DEFAULT '',
  `password_hash` varchar(256) NOT NULL,
  `avatar_url` longtext NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE `user_setting` (
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


-- 2026-02-23 01:47:30 UTC

------------

