-- Adminer 5.4.1 MariaDB 11.8.5-MariaDB-ubu2404-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE `api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_key_user_id_foreign` (`user_id`),
  CONSTRAINT `api_key_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `docker_host`;
CREATE TABLE `docker_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `docker_daemon` varchar(255) DEFAULT NULL,
  `docker_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `weight` int(11) NOT NULL DEFAULT 1000,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `heartbeat`;
CREATE TABLE `heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `important` tinyint(1) NOT NULL DEFAULT 0,
  `monitor_id` int(10) unsigned NOT NULL,
  `status` smallint(6) NOT NULL,
  `msg` text DEFAULT NULL,
  `time` datetime NOT NULL,
  `ping` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `down_count` int(11) NOT NULL DEFAULT 0,
  `end_time` datetime DEFAULT NULL,
  `retries` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `heartbeat_important_index` (`important`),
  KEY `monitor_time_index` (`monitor_id`,`time`),
  KEY `heartbeat_monitor_id_index` (`monitor_id`),
  KEY `monitor_important_time_index` (`monitor_id`,`important`,`time`),
  CONSTRAINT `heartbeat_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `heartbeat` (`id`, `important`, `monitor_id`, `status`, `msg`, `time`, `ping`, `duration`, `down_count`, `end_time`, `retries`) VALUES
(1,	1,	1,	1,	'200 - OK',	'2026-01-21 00:53:19',	485,	0,	0,	'2026-01-21 00:53:20',	0),
(2,	1,	2,	1,	'',	'2026-01-21 00:53:42',	6,	0,	0,	'2026-01-21 00:53:44',	0),
(3,	0,	2,	1,	'',	'2026-01-21 00:54:02',	5,	0,	0,	'2026-01-21 00:54:04',	0),
(4,	1,	3,	1,	'',	'2026-01-21 00:54:02',	5,	0,	0,	'2026-01-21 00:54:04',	0),
(5,	0,	1,	1,	'200 - OK',	'2026-01-21 00:54:19',	362,	0,	0,	'2026-01-21 00:54:20',	0),
(6,	0,	2,	1,	'',	'2026-01-21 00:54:22',	6,	0,	0,	'2026-01-21 00:54:24',	0),
(7,	0,	3,	1,	'',	'2026-01-21 00:54:22',	7,	0,	0,	'2026-01-21 00:54:24',	0),
(8,	0,	2,	1,	'',	'2026-01-21 00:54:42',	6,	0,	0,	'2026-01-21 00:54:44',	0),
(9,	0,	3,	1,	'',	'2026-01-21 00:54:42',	6,	0,	0,	'2026-01-21 00:54:44',	0),
(10,	0,	2,	1,	'',	'2026-01-21 00:55:02',	6,	0,	0,	'2026-01-21 00:55:04',	0);

DROP TABLE IF EXISTS `incident`;
CREATE TABLE `incident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `style` varchar(30) NOT NULL DEFAULT 'warning',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date` datetime DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `knex_migrations`;
CREATE TABLE `knex_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `knex_migrations` (`id`, `name`, `batch`, `migration_time`) VALUES
(1,	'2023-08-16-0000-create-uptime.js',	1,	'2026-01-21 00:51:58'),
(2,	'2023-08-18-0301-heartbeat.js',	1,	'2026-01-21 00:51:58'),
(3,	'2023-09-29-0000-heartbeat-retires.js',	1,	'2026-01-21 00:51:58'),
(4,	'2023-10-08-0000-mqtt-query.js',	1,	'2026-01-21 00:51:58'),
(5,	'2023-10-11-1915-push-token-to-32.js',	1,	'2026-01-21 00:51:58'),
(6,	'2023-10-16-0000-create-remote-browsers.js',	1,	'2026-01-21 00:51:58'),
(7,	'2023-12-20-0000-alter-status-page.js',	1,	'2026-01-21 00:51:58'),
(8,	'2023-12-21-0000-stat-ping-min-max.js',	1,	'2026-01-21 00:51:58'),
(9,	'2023-12-22-0000-hourly-uptime.js',	1,	'2026-01-21 00:51:58'),
(10,	'2024-01-22-0000-stats-extras.js',	1,	'2026-01-21 00:51:58'),
(11,	'2024-04-26-0000-snmp-monitor.js',	1,	'2026-01-21 00:51:58'),
(12,	'2024-08-24-000-add-cache-bust.js',	1,	'2026-01-21 00:51:58'),
(13,	'2024-08-24-0000-conditions.js',	1,	'2026-01-21 00:51:58'),
(14,	'2024-10-1315-rabbitmq-monitor.js',	1,	'2026-01-21 00:51:58'),
(15,	'2024-10-31-0000-fix-snmp-monitor.js',	1,	'2026-01-21 00:51:58'),
(16,	'2024-11-27-1927-fix-info-json-data-type.js',	1,	'2026-01-21 00:51:58'),
(17,	'2025-01-01-0000-add-smtp.js',	1,	'2026-01-21 00:51:58'),
(18,	'2025-03-04-0000-ping-advanced-options.js',	1,	'2026-01-21 00:51:58'),
(19,	'2025-03-25-0127-fix-5721.js',	1,	'2026-01-21 00:51:58'),
(20,	'2025-05-09-0000-add-custom-url.js',	1,	'2026-01-21 00:51:58'),
(21,	'2025-06-03-0000-add-ip-family.js',	1,	'2026-01-21 00:51:58'),
(22,	'2025-06-11-0000-add-manual-monitor.js',	1,	'2026-01-21 00:51:58'),
(23,	'2025-06-13-0000-maintenance-add-last-start.js',	1,	'2026-01-21 00:51:58'),
(24,	'2025-06-15-0001-manual-monitor-fix.js',	1,	'2026-01-21 00:51:59'),
(25,	'2025-06-24-0000-add-audience-to-oauth.js',	1,	'2026-01-21 00:51:59'),
(26,	'2025-07-17-0000-mqtt-websocket-path.js',	1,	'2026-01-21 00:51:59'),
(27,	'2025-10-14-0000-add-ip-family-fix.js',	1,	'2026-01-21 00:51:59'),
(28,	'2025-10-15-0000-stat-table-fix.js',	1,	'2026-01-21 00:51:59');

DROP TABLE IF EXISTS `knex_migrations_lock`;
CREATE TABLE `knex_migrations_lock` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_locked` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `knex_migrations_lock` (`index`, `is_locked`) VALUES
(1,	0);

DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `strategy` varchar(50) NOT NULL DEFAULT 'single',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `weekdays` varchar(250) DEFAULT '[]',
  `days_of_month` text DEFAULT '[]',
  `interval_day` int(11) DEFAULT NULL,
  `cron` text DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `last_start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_active_index` (`active`),
  KEY `manual_active` (`strategy`,`active`),
  KEY `maintenance_user_id` (`user_id`),
  CONSTRAINT `maintenance_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `maintenance_status_page`;
CREATE TABLE `maintenance_status_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_page_id` int(10) unsigned NOT NULL,
  `maintenance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_status_page_status_page_id_foreign` (`status_page_id`),
  KEY `maintenance_status_page_maintenance_id_foreign` (`maintenance_id`),
  CONSTRAINT `maintenance_status_page_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maintenance_status_page_status_page_id_foreign` FOREIGN KEY (`status_page_id`) REFERENCES `status_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT 20,
  `url` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `weight` int(11) DEFAULT 2000,
  `hostname` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `keyword` varchar(255) DEFAULT NULL,
  `maxretries` int(11) NOT NULL DEFAULT 0,
  `ignore_tls` tinyint(1) NOT NULL DEFAULT 0,
  `upside_down` tinyint(1) NOT NULL DEFAULT 0,
  `maxredirects` int(11) NOT NULL DEFAULT 10,
  `accepted_statuscodes_json` text NOT NULL DEFAULT '["200-299"]',
  `dns_resolve_type` varchar(5) DEFAULT NULL,
  `dns_resolve_server` varchar(255) DEFAULT NULL,
  `dns_last_result` varchar(255) DEFAULT NULL,
  `retry_interval` int(11) NOT NULL DEFAULT 0,
  `push_token` varchar(32) DEFAULT NULL,
  `method` text NOT NULL DEFAULT 'GET',
  `body` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `basic_auth_user` text DEFAULT NULL,
  `basic_auth_pass` text DEFAULT NULL,
  `docker_host` int(10) unsigned DEFAULT NULL,
  `docker_container` varchar(255) DEFAULT NULL,
  `proxy_id` int(10) unsigned DEFAULT NULL,
  `expiry_notification` tinyint(1) DEFAULT 1,
  `mqtt_topic` text DEFAULT NULL,
  `mqtt_success_message` varchar(255) DEFAULT NULL,
  `mqtt_username` varchar(255) DEFAULT NULL,
  `mqtt_password` varchar(255) DEFAULT NULL,
  `database_connection_string` varchar(2000) DEFAULT NULL,
  `database_query` text DEFAULT NULL,
  `auth_method` varchar(250) DEFAULT NULL,
  `auth_domain` text DEFAULT NULL,
  `auth_workstation` text DEFAULT NULL,
  `grpc_url` varchar(255) DEFAULT NULL,
  `grpc_protobuf` text DEFAULT NULL,
  `grpc_body` text DEFAULT NULL,
  `grpc_metadata` text DEFAULT NULL,
  `grpc_method` text DEFAULT NULL,
  `grpc_service_name` text DEFAULT NULL,
  `grpc_enable_tls` tinyint(1) NOT NULL DEFAULT 0,
  `radius_username` varchar(255) DEFAULT NULL,
  `radius_password` varchar(255) DEFAULT NULL,
  `radius_calling_station_id` varchar(50) DEFAULT NULL,
  `radius_called_station_id` varchar(50) DEFAULT NULL,
  `radius_secret` varchar(255) DEFAULT NULL,
  `resend_interval` int(11) NOT NULL DEFAULT 0,
  `packet_size` int(11) NOT NULL DEFAULT 56,
  `game` varchar(255) DEFAULT NULL,
  `http_body_encoding` varchar(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tls_ca` text DEFAULT NULL,
  `tls_cert` text DEFAULT NULL,
  `tls_key` text DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `invert_keyword` tinyint(1) NOT NULL DEFAULT 0,
  `json_path` text DEFAULT NULL,
  `expected_value` varchar(255) DEFAULT NULL,
  `kafka_producer_topic` varchar(255) DEFAULT NULL,
  `kafka_producer_brokers` text DEFAULT NULL,
  `kafka_producer_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `kafka_producer_allow_auto_topic_creation` tinyint(1) NOT NULL DEFAULT 0,
  `kafka_producer_sasl_options` text DEFAULT NULL,
  `kafka_producer_message` text DEFAULT NULL,
  `oauth_client_id` text DEFAULT NULL,
  `oauth_client_secret` text DEFAULT NULL,
  `oauth_token_url` text DEFAULT NULL,
  `oauth_scopes` text DEFAULT NULL,
  `oauth_auth_method` text DEFAULT NULL,
  `timeout` double NOT NULL DEFAULT 0,
  `gamedig_given_port_only` tinyint(1) NOT NULL DEFAULT 1,
  `mqtt_check_type` varchar(255) NOT NULL DEFAULT 'keyword',
  `remote_browser` int(10) unsigned DEFAULT NULL,
  `snmp_oid` varchar(255) DEFAULT NULL,
  `snmp_version` enum('1','2c','3') DEFAULT '2c',
  `json_path_operator` varchar(255) DEFAULT NULL,
  `cache_bust` tinyint(1) NOT NULL DEFAULT 0,
  `conditions` text NOT NULL DEFAULT '[]',
  `rabbitmq_nodes` text DEFAULT NULL,
  `rabbitmq_username` varchar(255) DEFAULT NULL,
  `rabbitmq_password` varchar(255) DEFAULT NULL,
  `smtp_security` varchar(255) DEFAULT NULL,
  `ping_count` int(11) NOT NULL DEFAULT 1,
  `ping_numeric` tinyint(1) NOT NULL DEFAULT 1,
  `ping_per_request_timeout` int(11) NOT NULL DEFAULT 2,
  `ip_family` varchar(4) DEFAULT NULL,
  `manual_status` smallint(6) DEFAULT NULL,
  `oauth_audience` varchar(255) DEFAULT NULL,
  `mqtt_websocket_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_user_id_foreign` (`user_id`),
  KEY `monitor_docker_host_foreign` (`docker_host`),
  KEY `monitor_proxy_id_foreign` (`proxy_id`),
  KEY `monitor_parent_foreign` (`parent`),
  KEY `monitor_remote_browser_index` (`remote_browser`),
  CONSTRAINT `monitor_docker_host_foreign` FOREIGN KEY (`docker_host`) REFERENCES `docker_host` (`id`),
  CONSTRAINT `monitor_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `monitor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `monitor_proxy_id_foreign` FOREIGN KEY (`proxy_id`) REFERENCES `proxy` (`id`),
  CONSTRAINT `monitor_remote_browser_foreign` FOREIGN KEY (`remote_browser`) REFERENCES `remote_browser` (`id`),
  CONSTRAINT `monitor_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `monitor` (`id`, `name`, `active`, `user_id`, `interval`, `url`, `type`, `weight`, `hostname`, `port`, `created_date`, `keyword`, `maxretries`, `ignore_tls`, `upside_down`, `maxredirects`, `accepted_statuscodes_json`, `dns_resolve_type`, `dns_resolve_server`, `dns_last_result`, `retry_interval`, `push_token`, `method`, `body`, `headers`, `basic_auth_user`, `basic_auth_pass`, `docker_host`, `docker_container`, `proxy_id`, `expiry_notification`, `mqtt_topic`, `mqtt_success_message`, `mqtt_username`, `mqtt_password`, `database_connection_string`, `database_query`, `auth_method`, `auth_domain`, `auth_workstation`, `grpc_url`, `grpc_protobuf`, `grpc_body`, `grpc_metadata`, `grpc_method`, `grpc_service_name`, `grpc_enable_tls`, `radius_username`, `radius_password`, `radius_calling_station_id`, `radius_called_station_id`, `radius_secret`, `resend_interval`, `packet_size`, `game`, `http_body_encoding`, `description`, `tls_ca`, `tls_cert`, `tls_key`, `parent`, `invert_keyword`, `json_path`, `expected_value`, `kafka_producer_topic`, `kafka_producer_brokers`, `kafka_producer_ssl`, `kafka_producer_allow_auto_topic_creation`, `kafka_producer_sasl_options`, `kafka_producer_message`, `oauth_client_id`, `oauth_client_secret`, `oauth_token_url`, `oauth_scopes`, `oauth_auth_method`, `timeout`, `gamedig_given_port_only`, `mqtt_check_type`, `remote_browser`, `snmp_oid`, `snmp_version`, `json_path_operator`, `cache_bust`, `conditions`, `rabbitmq_nodes`, `rabbitmq_username`, `rabbitmq_password`, `smtp_security`, `ping_count`, `ping_numeric`, `ping_per_request_timeout`, `ip_family`, `manual_status`, `oauth_audience`, `mqtt_websocket_path`) VALUES
(1,	'gm.com',	1,	1,	60,	'https://gm.com',	'http',	2000,	NULL,	NULL,	'2026-01-21 00:53:19',	NULL,	1,	0,	0,	10,	'[\"200-299\"]',	'A',	'1.1.1.1',	NULL,	60,	NULL,	'GET',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	NULL,	0,	'',	'',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	56,	NULL,	'json',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'$',	NULL,	NULL,	'[]',	0,	0,	'{\"mechanism\":\"None\"}',	NULL,	NULL,	NULL,	NULL,	NULL,	'client_secret_basic',	48,	1,	'keyword',	NULL,	NULL,	'2c',	'==',	0,	'[]',	'[]',	'',	'',	NULL,	3,	1,	2,	NULL,	NULL,	NULL,	''),
(2,	'8.8.8.8',	1,	1,	20,	'https://',	'ping',	2000,	'8.8.8.8',	NULL,	'2026-01-21 00:53:42',	NULL,	0,	0,	0,	10,	'[\"200-299\"]',	'A',	'1.1.1.1',	NULL,	20,	NULL,	'GET',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	NULL,	0,	'',	'',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	56,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'$',	NULL,	NULL,	'[]',	0,	0,	'{\"mechanism\":\"None\"}',	NULL,	NULL,	NULL,	NULL,	NULL,	'client_secret_basic',	10,	1,	'keyword',	NULL,	NULL,	'2c',	'==',	0,	'[]',	'[]',	'',	'',	NULL,	3,	1,	2,	NULL,	NULL,	NULL,	''),
(3,	'ggl',	1,	1,	20,	'https://',	'ping',	2000,	'google.com',	NULL,	'2026-01-21 00:54:02',	NULL,	0,	0,	0,	10,	'[\"200-299\"]',	'A',	'1.1.1.1',	NULL,	20,	NULL,	'GET',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	NULL,	0,	'',	'',	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	56,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'$',	NULL,	NULL,	'[]',	0,	0,	'{\"mechanism\":\"None\"}',	NULL,	NULL,	NULL,	NULL,	NULL,	'client_secret_basic',	10,	1,	'keyword',	NULL,	NULL,	'2c',	'==',	0,	'[]',	'[]',	'',	'',	NULL,	3,	1,	2,	NULL,	NULL,	NULL,	'');

DROP TABLE IF EXISTS `monitor_group`;
CREATE TABLE `monitor_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1000,
  `send_url` tinyint(1) NOT NULL DEFAULT 0,
  `custom_url` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_group_group_id_foreign` (`group_id`),
  KEY `fk` (`monitor_id`,`group_id`),
  CONSTRAINT `monitor_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_group_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `monitor_maintenance`;
CREATE TABLE `monitor_maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `maintenance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_id_index2` (`maintenance_id`),
  KEY `monitor_id_index` (`monitor_id`),
  CONSTRAINT `monitor_maintenance_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_maintenance_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `monitor_notification`;
CREATE TABLE `monitor_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_notification_notification_id_foreign` (`notification_id`),
  KEY `monitor_notification_index` (`monitor_id`,`notification_id`),
  CONSTRAINT `monitor_notification_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_notification_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `monitor_tag`;
CREATE TABLE `monitor_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_tag_monitor_id_foreign` (`monitor_id`),
  KEY `monitor_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `monitor_tag_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `monitor_tls_info`;
CREATE TABLE `monitor_tls_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `info_json` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_tls_info_monitor_id_foreign` (`monitor_id`),
  CONSTRAINT `monitor_tls_info_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `monitor_tls_info` (`id`, `monitor_id`, `info_json`) VALUES
(1,	1,	'{\"valid\":true,\"certInfo\":{\"subject\":{\"C\":\"US\",\"ST\":\"Michigan\",\"L\":\"Detroit\",\"O\":\"General Motors LLC\",\"CN\":\"gm.com\"},\"issuer\":{\"C\":\"US\",\"O\":\"DigiCert Inc\",\"CN\":\"DigiCert Global G2 TLS RSA SHA256 2020 CA1\"},\"subjectaltname\":\"DNS:gm.com, DNS:acdelco.com, DNS:buick.ca, DNS:buick.com, DNS:buick.com.mx, DNS:cadillac.ch, DNS:cadillac.co.kr, DNS:cadillac.com, DNS:cadillac.com.mx, DNS:cadillac.es, DNS:cadillacarabia.com, DNS:cadillaccanada.ca, DNS:chevrolet.ca, DNS:chevrolet.ch, DNS:chevrolet.cl, DNS:chevrolet.co.in, DNS:chevrolet.co.kr, DNS:chevrolet.co.th, DNS:chevrolet.co.za, DNS:chevrolet.com, DNS:chevrolet.com.ar, DNS:chevrolet.com.br, DNS:chevrolet.com.co, DNS:chevrolet.com.ec, DNS:chevrolet.com.mx, DNS:chevrolet.com.pe, DNS:chevrolet.com.py, DNS:chevrolet.com.uy, DNS:chevrolet.com.ve, DNS:chevrolet.pl, DNS:chevroletarabia.com, DNS:chevy.com, DNS:gm.ca, DNS:gmc.com, DNS:gmc.com.mx, DNS:gmcarabia.com, DNS:gmccanada.ca, DNS:gmckorea.co.kr, DNS:gmfleet.ca, DNS:gmfleet.com, DNS:gmfleet.com.mx, DNS:gmparts.com, DNS:gmspecialtyvehicles.com, DNS:gobrightdrop.com, DNS:onstar.ca, DNS:onstar.com, DNS:onstar.com.mx, DNS:gmenvolve.com, DNS:ultiumhome.com, DNS:holden.com.au, DNS:holden.co.nz, DNS:isuzu.co.nz, DNS:cadillaceurope.com, DNS:cadillacanz.com, DNS:onstararabia.com, DNS:gmdefensellc.com, DNS:gemenergy.gm.com, DNS:gmenvolve.ca, DNS:previgm.com.br, DNS:acdelco.com.br, DNS:gmegypt.com, DNS:gmafrica.com, DNS:acdelcoarabia.com, DNS:cadillacbrasil.com.br, DNS:gm.com.br, DNS:layoffbenefits.com, DNS:acdelco.com.ar, DNS:acdelco.mx, DNS:gmworkjam.com, DNS:acdelco.cl, DNS:acdelco.com.pe, DNS:acdelco.com.co, DNS:acdelco.com.ec, DNS:gmassetiq.com, DNS:chevroleteurope.com, DNS:motorsholding.com, DNS:gmsupplieracceleration.com, DNS:sierra.gmckorea.co.kr, DNS:patents.gm.com, DNS:chevrolet.com.bo, DNS:carbravo.com\",\"infoAccess\":{\"OCSP - URI\":[\"http://ocsp.digicert.com\"],\"CA Issuers - URI\":[\"http://cacerts.digicert.com/DigiCertGlobalG2TLSRSASHA2562020CA1-1.crt\"]},\"ca\":false,\"modulus\":\"D5E9E30684BE11FCD0FA749FC5C1412B3767625B6A5DFFA945EEF378A51B1F412CEAB0C8A2458600831C6F46B9175E81859D052778AD2CE6C88533473C0A55DEEE26A72591E5C4DEE39635ADC295FC69CD94774AA61832B6C5A77F32D84706489201C4F2A671DD8D3603CE1E8EA1AB7618A65E7284A856B83B3DC741CABF9B2AB4DD934C35437BCF9F4E0B27B3930E5EF7F56ABB1A35A6E77A59487AF7B286FA7D7AE9915CB83179273E48D90CFC8EA54BBBCBEB5EFAFB4546F04BAECF7D4DF72A7218D722BA2CC489D5467DAB47324E147EA74156E7D37C28C3A0FCE8487AC9235DB1BE22FDA1DD92E5EABBABD2D95D8509D2313C7180A68E044CCCE54292C1\",\"bits\":2048,\"exponent\":\"0x10001\",\"pubkey\":{\"type\":\"Buffer\",\"data\":[48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,1,15,0,48,130,1,10,2,130,1,1,0,213,233,227,6,132,190,17,252,208,250,116,159,197,193,65,43,55,103,98,91,106,93,255,169,69,238,243,120,165,27,31,65,44,234,176,200,162,69,134,0,131,28,111,70,185,23,94,129,133,157,5,39,120,173,44,230,200,133,51,71,60,10,85,222,238,38,167,37,145,229,196,222,227,150,53,173,194,149,252,105,205,148,119,74,166,24,50,182,197,167,127,50,216,71,6,72,146,1,196,242,166,113,221,141,54,3,206,30,142,161,171,118,24,166,94,114,132,168,86,184,59,61,199,65,202,191,155,42,180,221,147,76,53,67,123,207,159,78,11,39,179,147,14,94,247,245,106,187,26,53,166,231,122,89,72,122,247,178,134,250,125,122,233,145,92,184,49,121,39,62,72,217,12,252,142,165,75,187,203,235,94,250,251,69,70,240,75,174,207,125,77,247,42,114,24,215,34,186,44,196,137,213,70,125,171,71,50,78,20,126,167,65,86,231,211,124,40,195,160,252,232,72,122,201,35,93,177,190,34,253,161,221,146,229,234,187,171,210,217,93,133,9,210,49,60,113,128,166,142,4,76,204,229,66,146,193,2,3,1,0,1]},\"valid_from\":\"Dec 11 00:00:00 2025 GMT\",\"valid_to\":\"Dec 10 23:59:59 2026 GMT\",\"fingerprint\":\"A8:F0:D7:92:E4:83:5F:53:31:12:18:02:A3:C3:A7:49:94:94:6B:80\",\"fingerprint256\":\"73:EC:4B:68:5E:7D:BE:78:00:A9:4F:61:BE:4B:20:7C:77:83:31:78:D2:97:9E:7D:71:B2:9F:A4:EB:72:3F:95\",\"fingerprint512\":\"D7:C0:83:39:25:FC:5A:89:C8:35:36:D9:A9:A9:B0:8A:9C:86:D5:6D:B7:4E:93:AF:39:3C:84:C8:3A:A6:10:FF:8C:AC:20:15:C4:B9:21:07:CA:36:F8:4C:50:E1:63:57:25:D3:75:D7:E1:77:C0:04:C2:0C:46:95:0F:79:DB:70\",\"ext_key_usage\":[\"1.3.6.1.5.5.7.3.1\",\"1.3.6.1.5.5.7.3.2\"],\"serialNumber\":\"0C7A132A247D4BA603C543B99A0549C7\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,11,193,48,130,10,169,160,3,2,1,2,2,16,12,122,19,42,36,125,75,166,3,197,67,185,154,5,73,199,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,89,49,11,48,9,6,3,85,4,6,19,2,85,83,49,21,48,19,6,3,85,4,10,19,12,68,105,103,105,67,101,114,116,32,73,110,99,49,51,48,49,6,3,85,4,3,19,42,68,105,103,105,67,101,114,116,32,71,108,111,98,97,108,32,71,50,32,84,76,83,32,82,83,65,32,83,72,65,50,53,54,32,50,48,50,48,32,67,65,49,48,30,23,13,50,53,49,50,49,49,48,48,48,48,48,48,90,23,13,50,54,49,50,49,48,50,51,53,57,53,57,90,48,96,49,11,48,9,6,3,85,4,6,19,2,85,83,49,17,48,15,6,3,85,4,8,19,8,77,105,99,104,105,103,97,110,49,16,48,14,6,3,85,4,7,19,7,68,101,116,114,111,105,116,49,27,48,25,6,3,85,4,10,19,18,71,101,110,101,114,97,108,32,77,111,116,111,114,115,32,76,76,67,49,15,48,13,6,3,85,4,3,19,6,103,109,46,99,111,109,48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,1,15,0,48,130,1,10,2,130,1,1,0,213,233,227,6,132,190,17,252,208,250,116,159,197,193,65,43,55,103,98,91,106,93,255,169,69,238,243,120,165,27,31,65,44,234,176,200,162,69,134,0,131,28,111,70,185,23,94,129,133,157,5,39,120,173,44,230,200,133,51,71,60,10,85,222,238,38,167,37,145,229,196,222,227,150,53,173,194,149,252,105,205,148,119,74,166,24,50,182,197,167,127,50,216,71,6,72,146,1,196,242,166,113,221,141,54,3,206,30,142,161,171,118,24,166,94,114,132,168,86,184,59,61,199,65,202,191,155,42,180,221,147,76,53,67,123,207,159,78,11,39,179,147,14,94,247,245,106,187,26,53,166,231,122,89,72,122,247,178,134,250,125,122,233,145,92,184,49,121,39,62,72,217,12,252,142,165,75,187,203,235,94,250,251,69,70,240,75,174,207,125,77,247,42,114,24,215,34,186,44,196,137,213,70,125,171,71,50,78,20,126,167,65,86,231,211,124,40,195,160,252,232,72,122,201,35,93,177,190,34,253,161,221,146,229,234,187,171,210,217,93,133,9,210,49,60,113,128,166,142,4,76,204,229,66,146,193,2,3,1,0,1,163,130,8,124,48,130,8,120,48,31,6,3,85,29,35,4,24,48,22,128,20,116,133,128,192,102,199,223,55,222,207,189,41,55,170,3,29,190,237,205,23,48,29,6,3,85,29,14,4,22,4,20,148,82,241,132,80,199,220,248,145,144,109,223,8,196,17,198,211,217,219,78,48,130,5,9,6,3,85,29,17,4,130,5,0,48,130,4,252,130,6,103,109,46,99,111,109,130,11,97,99,100,101,108,99,111,46,99,111,109,130,8,98,117,105,99,107,46,99,97,130,9,98,117,105,99,107,46,99,111,109,130,12,98,117,105,99,107,46,99,111,109,46,109,120,130,11,99,97,100,105,108,108,97,99,46,99,104,130,14,99,97,100,105,108,108,97,99,46,99,111,46,107,114,130,12,99,97,100,105,108,108,97,99,46,99,111,109,130,15,99,97,100,105,108,108,97,99,46,99,111,109,46,109,120,130,11,99,97,100,105,108,108,97,99,46,101,115,130,18,99,97,100,105,108,108,97,99,97,114,97,98,105,97,46,99,111,109,130,17,99,97,100,105,108,108,97,99,99,97,110,97,100,97,46,99,97,130,12,99,104,101,118,114,111,108,101,116,46,99,97,130,12,99,104,101,118,114,111,108,101,116,46,99,104,130,12,99,104,101,118,114,111,108,101,116,46,99,108,130,15,99,104,101,118,114,111,108,101,116,46,99,111,46,105,110,130,15,99,104,101,118,114,111,108,101,116,46,99,111,46,107,114,130,15,99,104,101,118,114,111,108,101,116,46,99,111,46,116,104,130,15,99,104,101,118,114,111,108,101,116,46,99,111,46,122,97,130,13,99,104,101,118,114,111,108,101,116,46,99,111,109,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,97,114,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,98,114,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,99,111,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,101,99,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,109,120,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,112,101,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,112,121,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,117,121,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,118,101,130,12,99,104,101,118,114,111,108,101,116,46,112,108,130,19,99,104,101,118,114,111,108,101,116,97,114,97,98,105,97,46,99,111,109,130,9,99,104,101,118,121,46,99,111,109,130,5,103,109,46,99,97,130,7,103,109,99,46,99,111,109,130,10,103,109,99,46,99,111,109,46,109,120,130,13,103,109,99,97,114,97,98,105,97,46,99,111,109,130,12,103,109,99,99,97,110,97,100,97,46,99,97,130,14,103,109,99,107,111,114,101,97,46,99,111,46,107,114,130,10,103,109,102,108,101,101,116,46,99,97,130,11,103,109,102,108,101,101,116,46,99,111,109,130,14,103,109,102,108,101,101,116,46,99,111,109,46,109,120,130,11,103,109,112,97,114,116,115,46,99,111,109,130,23,103,109,115,112,101,99,105,97,108,116,121,118,101,104,105,99,108,101,115,46,99,111,109,130,16,103,111,98,114,105,103,104,116,100,114,111,112,46,99,111,109,130,9,111,110,115,116,97,114,46,99,97,130,10,111,110,115,116,97,114,46,99,111,109,130,13,111,110,115,116,97,114,46,99,111,109,46,109,120,130,13,103,109,101,110,118,111,108,118,101,46,99,111,109,130,14,117,108,116,105,117,109,104,111,109,101,46,99,111,109,130,13,104,111,108,100,101,110,46,99,111,109,46,97,117,130,12,104,111,108,100,101,110,46,99,111,46,110,122,130,11,105,115,117,122,117,46,99,111,46,110,122,130,18,99,97,100,105,108,108,97,99,101,117,114,111,112,101,46,99,111,109,130,15,99,97,100,105,108,108,97,99,97,110,122,46,99,111,109,130,16,111,110,115,116,97,114,97,114,97,98,105,97,46,99,111,109,130,16,103,109,100,101,102,101,110,115,101,108,108,99,46,99,111,109,130,16,103,101,109,101,110,101,114,103,121,46,103,109,46,99,111,109,130,12,103,109,101,110,118,111,108,118,101,46,99,97,130,14,112,114,101,118,105,103,109,46,99,111,109,46,98,114,130,14,97,99,100,101,108,99,111,46,99,111,109,46,98,114,130,11,103,109,101,103,121,112,116,46,99,111,109,130,12,103,109,97,102,114,105,99,97,46,99,111,109,130,17,97,99,100,101,108,99,111,97,114,97,98,105,97,46,99,111,109,130,21,99,97,100,105,108,108,97,99,98,114,97,115,105,108,46,99,111,109,46,98,114,130,9,103,109,46,99,111,109,46,98,114,130,18,108,97,121,111,102,102,98,101,110,101,102,105,116,115,46,99,111,109,130,14,97,99,100,101,108,99,111,46,99,111,109,46,97,114,130,10,97,99,100,101,108,99,111,46,109,120,130,13,103,109,119,111,114,107,106,97,109,46,99,111,109,130,10,97,99,100,101,108,99,111,46,99,108,130,14,97,99,100,101,108,99,111,46,99,111,109,46,112,101,130,14,97,99,100,101,108,99,111,46,99,111,109,46,99,111,130,14,97,99,100,101,108,99,111,46,99,111,109,46,101,99,130,13,103,109,97,115,115,101,116,105,113,46,99,111,109,130,19,99,104,101,118,114,111,108,101,116,101,117,114,111,112,101,46,99,111,109,130,17,109,111,116,111,114,115,104,111,108,100,105,110,103,46,99,111,109,130,26,103,109,115,117,112,112,108,105,101,114,97,99,99,101,108,101,114,97,116,105,111,110,46,99,111,109,130,21,115,105,101,114,114,97,46,103,109,99,107,111,114,101,97,46,99,111,46,107,114,130,14,112,97,116,101,110,116,115,46,103,109,46,99,111,109,130,16,99,104,101,118,114,111,108,101,116,46,99,111,109,46,98,111,130,12,99,97,114,98,114,97,118,111,46,99,111,109,48,62,6,3,85,29,32,4,55,48,53,48,51,6,6,103,129,12,1,2,2,48,41,48,39,6,8,43,6,1,5,5,7,2,1,22,27,104,116,116,112,58,47,47,119,119,119,46,100,105,103,105,99,101,114,116,46,99,111,109,47,67,80,83,48,14,6,3,85,29,15,1,1,255,4,4,3,2,5,160,48,29,6,3,85,29,37,4,22,48,20,6,8,43,6,1,5,5,7,3,1,6,8,43,6,1,5,5,7,3,2,48,129,159,6,3,85,29,31,4,129,151,48,129,148,48,72,160,70,160,68,134,66,104,116,116,112,58,47,47,99,114,108,51,46,100,105,103,105,99,101,114,116,46,99,111,109,47,68,105,103,105,67,101,114,116,71,108,111,98,97,108,71,50,84,76,83,82,83,65,83,72,65,50,53,54,50,48,50,48,67,65,49,45,49,46,99,114,108,48,72,160,70,160,68,134,66,104,116,116,112,58,47,47,99,114,108,52,46,100,105,103,105,99,101,114,116,46,99,111,109,47,68,105,103,105,67,101,114,116,71,108,111,98,97,108,71,50,84,76,83,82,83,65,83,72,65,50,53,54,50,48,50,48,67,65,49,45,49,46,99,114,108,48,129,135,6,8,43,6,1,5,5,7,1,1,4,123,48,121,48,36,6,8,43,6,1,5,5,7,48,1,134,24,104,116,116,112,58,47,47,111,99,115,112,46,100,105,103,105,99,101,114,116,46,99,111,109,48,81,6,8,43,6,1,5,5,7,48,2,134,69,104,116,116,112,58,47,47,99,97,99,101,114,116,115,46,100,105,103,105,99,101,114,116,46,99,111,109,47,68,105,103,105,67,101,114,116,71,108,111,98,97,108,71,50,84,76,83,82,83,65,83,72,65,50,53,54,50,48,50,48,67,65,49,45,49,46,99,114,116,48,12,6,3,85,29,19,1,1,255,4,2,48,0,48,130,1,126,6,10,43,6,1,4,1,214,121,2,4,2,4,130,1,110,4,130,1,106,1,104,0,118,0,194,49,126,87,69,25,163,69,238,127,56,222,178,144,65,235,199,194,33,90,34,191,127,213,181,173,118,154,217,14,82,205,0,0,1,155,13,203,111,237,0,0,4,3,0,71,48,69,2,33,0,134,232,92,238,187,188,69,245,237,12,66,129,111,87,41,79,59,225,177,98,69,204,162,216,160,16,3,211,171,122,65,25,2,32,19,50,156,129,223,120,74,136,43,245,3,32,151,36,189,31,79,176,242,110,33,135,116,119,171,171,129,43,42,124,116,189,0,118,0,200,163,196,127,199,179,173,185,53,107,1,63,106,122,18,109,227,58,78,67,165,198,70,249,151,173,57,117,153,29,207,154,0,0,1,155,13,203,111,221,0,0,4,3,0,71,48,69,2,33,0,221,102,40,3,70,194,237,201,196,203,126,61,125,36,194,244,130,19,210,40,111,231,38,105,58,169,91,93,46,39,137,128,2,32,5,5,7,238,165,84,60,26,195,212,72,255,34,29,37,171,132,147,81,140,119,172,8,87,28,73,113,164,34,93,202,178,0,118,0,148,78,67,135,250,236,193,239,129,243,25,36,38,168,24,101,1,199,211,95,56,2,1,63,114,103,125,85,55,46,25,216,0,0,1,155,13,203,112,184,0,0,4,3,0,71,48,69,2,33,0,151,103,241,237,53,11,107,250,102,36,164,75,222,28,73,145,78,0,192,44,60,134,233,108,222,17,111,225,211,128,97,114,2,32,106,148,187,238,25,102,140,171,22,93,108,128,241,235,63,121,85,222,146,146,90,146,172,9,146,237,119,77,25,153,112,62,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,3,130,1,1,0,31,49,193,55,9,35,211,158,130,238,21,129,185,34,86,253,87,126,200,226,166,52,136,62,179,92,244,36,34,189,190,238,237,246,39,231,170,180,225,132,15,135,59,139,1,108,244,190,44,172,90,152,239,159,172,93,45,178,70,48,188,123,240,249,254,94,199,147,131,252,97,253,208,115,55,75,128,252,229,60,92,65,139,11,21,35,135,120,205,251,243,14,28,49,198,136,107,90,150,78,192,87,110,129,71,119,175,126,201,197,121,130,27,5,45,14,166,43,1,3,193,156,59,253,19,228,114,169,68,196,169,171,137,189,76,101,43,115,210,34,89,105,169,10,246,96,140,108,178,59,12,189,66,114,159,202,182,174,149,73,69,218,27,92,110,187,25,208,52,43,155,173,127,46,181,138,184,26,122,156,226,9,6,15,211,165,84,64,152,193,235,211,0,104,236,34,228,8,106,250,220,151,178,195,67,196,128,248,44,180,20,217,18,178,197,221,119,236,144,87,165,155,112,188,2,159,222,167,230,157,241,10,44,0,74,61,137,184,176,165,72,65,137,66,120,108,110,14,52,52,177,78,57,149,80,19]},\"issuerCertificate\":{\"subject\":{\"C\":\"US\",\"O\":\"DigiCert Inc\",\"CN\":\"DigiCert Global G2 TLS RSA SHA256 2020 CA1\"},\"issuer\":{\"C\":\"US\",\"O\":\"DigiCert Inc\",\"OU\":\"www.digicert.com\",\"CN\":\"DigiCert Global Root G2\"},\"infoAccess\":{\"OCSP - URI\":[\"http://ocsp.digicert.com\"],\"CA Issuers - URI\":[\"http://cacerts.digicert.com/DigiCertGlobalRootG2.crt\"]},\"ca\":true,\"modulus\":\"CCF710624FA6BB636FED905256C56D277B7A12568AF1F4F9D6E7E18FBD95ABF260411570DB1200FA270AB557385B7DB2519371950E6A41945B351BFA7BFABBC5BE2430FE56EFC4F37D97E314F5144DCBA710F216EAAB22F031221161699026BA78D9971FE37D66AB75449573C8ACFFEF5D0A8A5943E1ACB23A0FF348FCD76B37C163DCDE46D6DB45FE7D23FD90E851071E51A35FED4946547F2C88C5F4139C97153C03E8A139DC690C32C1AF16574C9447427CA2C89C7DE6D44D54AF4299A8C104C2779CD648E4CE11E02A8099F04370CF3F766BD14C49AB245EC20D82FD46A8AB6C93CC6252427592F89AFA5E5EB2B061E51F1FB97F0998E83DFA837F4769A1\",\"bits\":2048,\"exponent\":\"0x10001\",\"pubkey\":{\"type\":\"Buffer\",\"data\":[48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,1,15,0,48,130,1,10,2,130,1,1,0,204,247,16,98,79,166,187,99,111,237,144,82,86,197,109,39,123,122,18,86,138,241,244,249,214,231,225,143,189,149,171,242,96,65,21,112,219,18,0,250,39,10,181,87,56,91,125,178,81,147,113,149,14,106,65,148,91,53,27,250,123,250,187,197,190,36,48,254,86,239,196,243,125,151,227,20,245,20,77,203,167,16,242,22,234,171,34,240,49,34,17,97,105,144,38,186,120,217,151,31,227,125,102,171,117,68,149,115,200,172,255,239,93,10,138,89,67,225,172,178,58,15,243,72,252,215,107,55,193,99,220,222,70,214,219,69,254,125,35,253,144,232,81,7,30,81,163,95,237,73,70,84,127,44,136,197,244,19,156,151,21,60,3,232,161,57,220,105,12,50,193,175,22,87,76,148,71,66,124,162,200,156,125,230,212,77,84,175,66,153,168,193,4,194,119,156,214,72,228,206,17,224,42,128,153,240,67,112,207,63,118,107,209,76,73,171,36,94,194,13,130,253,70,168,171,108,147,204,98,82,66,117,146,248,154,250,94,94,178,176,97,229,31,31,185,127,9,152,232,61,250,131,127,71,105,161,2,3,1,0,1]},\"valid_from\":\"Mar 30 00:00:00 2021 GMT\",\"valid_to\":\"Mar 29 23:59:59 2031 GMT\",\"fingerprint\":\"1B:51:1A:BE:AD:59:C6:CE:20:70:77:C0:BF:0E:00:43:B1:38:26:12\",\"fingerprint256\":\"C8:02:5F:9F:C6:5F:DF:C9:5B:3C:A8:CC:78:67:B9:A5:87:B5:27:79:73:95:79:17:46:3F:C8:13:D0:B6:25:A9\",\"fingerprint512\":\"0A:25:C3:C3:36:45:96:51:C6:BE:37:E6:08:D4:5D:20:C5:00:BF:78:8C:71:5A:9D:92:F2:E0:29:FF:8B:E4:8F:A1:ED:0F:76:EC:59:56:F0:F7:FB:C8:3F:3E:75:61:DD:E1:96:9F:B2:8B:C4:2C:A0:75:68:4E:60:F0:A9:23:B3\",\"ext_key_usage\":[\"1.3.6.1.5.5.7.3.1\",\"1.3.6.1.5.5.7.3.2\"],\"serialNumber\":\"0CF5BD062B5602F47AB8502C23CCF066\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,4,200,48,130,3,176,160,3,2,1,2,2,16,12,245,189,6,43,86,2,244,122,184,80,44,35,204,240,102,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,97,49,11,48,9,6,3,85,4,6,19,2,85,83,49,21,48,19,6,3,85,4,10,19,12,68,105,103,105,67,101,114,116,32,73,110,99,49,25,48,23,6,3,85,4,11,19,16,119,119,119,46,100,105,103,105,99,101,114,116,46,99,111,109,49,32,48,30,6,3,85,4,3,19,23,68,105,103,105,67,101,114,116,32,71,108,111,98,97,108,32,82,111,111,116,32,71,50,48,30,23,13,50,49,48,51,51,48,48,48,48,48,48,48,90,23,13,51,49,48,51,50,57,50,51,53,57,53,57,90,48,89,49,11,48,9,6,3,85,4,6,19,2,85,83,49,21,48,19,6,3,85,4,10,19,12,68,105,103,105,67,101,114,116,32,73,110,99,49,51,48,49,6,3,85,4,3,19,42,68,105,103,105,67,101,114,116,32,71,108,111,98,97,108,32,71,50,32,84,76,83,32,82,83,65,32,83,72,65,50,53,54,32,50,48,50,48,32,67,65,49,48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,1,15,0,48,130,1,10,2,130,1,1,0,204,247,16,98,79,166,187,99,111,237,144,82,86,197,109,39,123,122,18,86,138,241,244,249,214,231,225,143,189,149,171,242,96,65,21,112,219,18,0,250,39,10,181,87,56,91,125,178,81,147,113,149,14,106,65,148,91,53,27,250,123,250,187,197,190,36,48,254,86,239,196,243,125,151,227,20,245,20,77,203,167,16,242,22,234,171,34,240,49,34,17,97,105,144,38,186,120,217,151,31,227,125,102,171,117,68,149,115,200,172,255,239,93,10,138,89,67,225,172,178,58,15,243,72,252,215,107,55,193,99,220,222,70,214,219,69,254,125,35,253,144,232,81,7,30,81,163,95,237,73,70,84,127,44,136,197,244,19,156,151,21,60,3,232,161,57,220,105,12,50,193,175,22,87,76,148,71,66,124,162,200,156,125,230,212,77,84,175,66,153,168,193,4,194,119,156,214,72,228,206,17,224,42,128,153,240,67,112,207,63,118,107,209,76,73,171,36,94,194,13,130,253,70,168,171,108,147,204,98,82,66,117,146,248,154,250,94,94,178,176,97,229,31,31,185,127,9,152,232,61,250,131,127,71,105,161,2,3,1,0,1,163,130,1,130,48,130,1,126,48,18,6,3,85,29,19,1,1,255,4,8,48,6,1,1,255,2,1,0,48,29,6,3,85,29,14,4,22,4,20,116,133,128,192,102,199,223,55,222,207,189,41,55,170,3,29,190,237,205,23,48,31,6,3,85,29,35,4,24,48,22,128,20,78,34,84,32,24,149,230,227,110,230,15,250,250,185,18,237,6,23,143,57,48,14,6,3,85,29,15,1,1,255,4,4,3,2,1,134,48,29,6,3,85,29,37,4,22,48,20,6,8,43,6,1,5,5,7,3,1,6,8,43,6,1,5,5,7,3,2,48,118,6,8,43,6,1,5,5,7,1,1,4,106,48,104,48,36,6,8,43,6,1,5,5,7,48,1,134,24,104,116,116,112,58,47,47,111,99,115,112,46,100,105,103,105,99,101,114,116,46,99,111,109,48,64,6,8,43,6,1,5,5,7,48,2,134,52,104,116,116,112,58,47,47,99,97,99,101,114,116,115,46,100,105,103,105,99,101,114,116,46,99,111,109,47,68,105,103,105,67,101,114,116,71,108,111,98,97,108,82,111,111,116,71,50,46,99,114,116,48,66,6,3,85,29,31,4,59,48,57,48,55,160,53,160,51,134,49,104,116,116,112,58,47,47,99,114,108,51,46,100,105,103,105,99,101,114,116,46,99,111,109,47,68,105,103,105,67,101,114,116,71,108,111,98,97,108,82,111,111,116,71,50,46,99,114,108,48,61,6,3,85,29,32,4,54,48,52,48,11,6,9,96,134,72,1,134,253,108,2,1,48,7,6,5,103,129,12,1,1,48,8,6,6,103,129,12,1,2,1,48,8,6,6,103,129,12,1,2,2,48,8,6,6,103,129,12,1,2,3,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,3,130,1,1,0,144,241,112,203,40,151,105,151,124,116,253,192,250,38,123,83,171,173,205,101,253,186,156,6,156,138,215,90,67,135,237,77,76,86,95,173,193,197,181,5,32,46,89,209,255,74,245,160,42,216,176,149,173,201,46,74,59,215,167,246,111,136,41,252,48,63,36,132,187,195,183,123,147,7,44,175,135,107,118,51,237,0,85,82,178,89,158,228,185,208,243,223,231,15,254,221,248,196,185,16,114,129,9,4,95,207,151,158,46,50,117,142,207,154,88,210,87,49,126,55,1,129,178,102,109,41,26,177,102,9,109,209,110,144,244,185,250,47,1,20,197,92,86,100,1,217,125,135,168,56,83,159,139,93,70,109,92,198,39,132,129,212,126,140,140,163,155,82,231,198,136,236,55,124,42,251,240,85,90,56,114,16,216,0,19,207,76,115,219,170,55,53,168,41,129,105,156,118,188,222,24,123,144,212,202,207,239,103,3,253,4,90,33,22,177,255,234,63,223,220,130,245,235,244,89,146,35,13,36,42,149,37,76,202,161,145,230,212,183,172,135,116,179,241,109,163,153,219,249,213,189,132,64,159,7,152]},\"issuerCertificate\":{\"subject\":{\"C\":\"US\",\"O\":\"DigiCert Inc\",\"OU\":\"www.digicert.com\",\"CN\":\"DigiCert Global Root G2\"},\"issuer\":{\"C\":\"US\",\"O\":\"DigiCert Inc\",\"OU\":\"www.digicert.com\",\"CN\":\"DigiCert Global Root G2\"},\"ca\":true,\"modulus\":\"BB37CD34DC7B6BC9B26890AD4A75FF46BA210A088DF51954C9FB88DBF3AEF23A89913C7AE6AB061A6BCFAC2DE85E092444BA629A7ED6A3A87EE054752005AC50B79C631A6C30DCDA1F19B1D71EDEFDD7E0CB948337AEEC1F434EDD7B2CD2BD2EA52FE4A9B8AD3AD499A4B625E99B6B00609260FF4F214918F76790AB61069C8FF2BAE9B4E992326BB5F357E85D1BCD8C1DAB95049549F3352D96E3496DDD77E3FB494BB4AC5507A98F95B3B423BB4C6D45F0F6A9B29530B4FD4C558C274A57147C829DCD7392D3164A060C8C50D18F1E09BE17A1E621CAFD83E510BC83A50AC46728F67314143D4676C387148921344DAF0F450CA649A1BABB9CC5B133832985\",\"bits\":2048,\"exponent\":\"0x10001\",\"pubkey\":{\"type\":\"Buffer\",\"data\":[48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,1,15,0,48,130,1,10,2,130,1,1,0,187,55,205,52,220,123,107,201,178,104,144,173,74,117,255,70,186,33,10,8,141,245,25,84,201,251,136,219,243,174,242,58,137,145,60,122,230,171,6,26,107,207,172,45,232,94,9,36,68,186,98,154,126,214,163,168,126,224,84,117,32,5,172,80,183,156,99,26,108,48,220,218,31,25,177,215,30,222,253,215,224,203,148,131,55,174,236,31,67,78,221,123,44,210,189,46,165,47,228,169,184,173,58,212,153,164,182,37,233,155,107,0,96,146,96,255,79,33,73,24,247,103,144,171,97,6,156,143,242,186,233,180,233,146,50,107,181,243,87,232,93,27,205,140,29,171,149,4,149,73,243,53,45,150,227,73,109,221,119,227,251,73,75,180,172,85,7,169,143,149,179,180,35,187,76,109,69,240,246,169,178,149,48,180,253,76,85,140,39,74,87,20,124,130,157,205,115,146,211,22,74,6,12,140,80,209,143,30,9,190,23,161,230,33,202,253,131,229,16,188,131,165,10,196,103,40,246,115,20,20,61,70,118,195,135,20,137,33,52,77,175,15,69,12,166,73,161,186,187,156,197,177,51,131,41,133,2,3,1,0,1]},\"valid_from\":\"Aug  1 12:00:00 2013 GMT\",\"valid_to\":\"Jan 15 12:00:00 2038 GMT\",\"fingerprint\":\"DF:3C:24:F9:BF:D6:66:76:1B:26:80:73:FE:06:D1:CC:8D:4F:82:A4\",\"fingerprint256\":\"CB:3C:CB:B7:60:31:E5:E0:13:8F:8D:D3:9A:23:F9:DE:47:FF:C3:5E:43:C1:14:4C:EA:27:D4:6A:5A:B1:CB:5F\",\"fingerprint512\":\"56:22:20:7E:1B:A2:85:F1:72:75:6F:60:19:AF:92:AC:80:8E:D6:32:86:E2:4D:FE:CC:1E:79:87:3F:B5:D1:40:F1:CE:B7:13:3F:24:76:E8:9A:5F:75:F7:11:F9:81:3A:9F:BB:8F:D5:28:7F:64:AD:FD:CC:53:B8:64:F9:BD:C5\",\"serialNumber\":\"033AF1E6A711A9A0BB2864B11D09FAE5\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,3,142,48,130,2,118,160,3,2,1,2,2,16,3,58,241,230,167,17,169,160,187,40,100,177,29,9,250,229,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,97,49,11,48,9,6,3,85,4,6,19,2,85,83,49,21,48,19,6,3,85,4,10,19,12,68,105,103,105,67,101,114,116,32,73,110,99,49,25,48,23,6,3,85,4,11,19,16,119,119,119,46,100,105,103,105,99,101,114,116,46,99,111,109,49,32,48,30,6,3,85,4,3,19,23,68,105,103,105,67,101,114,116,32,71,108,111,98,97,108,32,82,111,111,116,32,71,50,48,30,23,13,49,51,48,56,48,49,49,50,48,48,48,48,90,23,13,51,56,48,49,49,53,49,50,48,48,48,48,90,48,97,49,11,48,9,6,3,85,4,6,19,2,85,83,49,21,48,19,6,3,85,4,10,19,12,68,105,103,105,67,101,114,116,32,73,110,99,49,25,48,23,6,3,85,4,11,19,16,119,119,119,46,100,105,103,105,99,101,114,116,46,99,111,109,49,32,48,30,6,3,85,4,3,19,23,68,105,103,105,67,101,114,116,32,71,108,111,98,97,108,32,82,111,111,116,32,71,50,48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,1,15,0,48,130,1,10,2,130,1,1,0,187,55,205,52,220,123,107,201,178,104,144,173,74,117,255,70,186,33,10,8,141,245,25,84,201,251,136,219,243,174,242,58,137,145,60,122,230,171,6,26,107,207,172,45,232,94,9,36,68,186,98,154,126,214,163,168,126,224,84,117,32,5,172,80,183,156,99,26,108,48,220,218,31,25,177,215,30,222,253,215,224,203,148,131,55,174,236,31,67,78,221,123,44,210,189,46,165,47,228,169,184,173,58,212,153,164,182,37,233,155,107,0,96,146,96,255,79,33,73,24,247,103,144,171,97,6,156,143,242,186,233,180,233,146,50,107,181,243,87,232,93,27,205,140,29,171,149,4,149,73,243,53,45,150,227,73,109,221,119,227,251,73,75,180,172,85,7,169,143,149,179,180,35,187,76,109,69,240,246,169,178,149,48,180,253,76,85,140,39,74,87,20,124,130,157,205,115,146,211,22,74,6,12,140,80,209,143,30,9,190,23,161,230,33,202,253,131,229,16,188,131,165,10,196,103,40,246,115,20,20,61,70,118,195,135,20,137,33,52,77,175,15,69,12,166,73,161,186,187,156,197,177,51,131,41,133,2,3,1,0,1,163,66,48,64,48,15,6,3,85,29,19,1,1,255,4,5,48,3,1,1,255,48,14,6,3,85,29,15,1,1,255,4,4,3,2,1,134,48,29,6,3,85,29,14,4,22,4,20,78,34,84,32,24,149,230,227,110,230,15,250,250,185,18,237,6,23,143,57,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,3,130,1,1,0,96,103,40,148,111,14,72,99,235,49,221,234,103,24,213,137,125,60,197,139,74,127,233,190,219,43,23,223,176,95,115,119,42,50,19,57,129,103,66,132,35,242,69,103,53,236,136,191,248,143,176,97,12,52,164,174,32,76,132,198,219,248,53,225,118,217,223,166,66,187,199,68,8,134,127,54,116,36,90,218,108,13,20,89,53,189,242,73,221,182,31,201,179,13,71,42,61,153,47,187,92,187,181,212,32,225,153,95,83,70,21,219,104,155,240,243,48,213,62,49,226,141,132,158,227,138,218,218,150,62,53,19,165,95,240,249,112,80,112,71,65,17,87,25,78,192,143,174,6,196,149,19,23,47,27,37,159,117,242,177,142,153,161,111,19,177,65,113,254,136,42,200,79,16,32,85,215,243,20,69,229,224,68,244,234,135,149,50,147,14,254,83,70,250,44,157,255,139,34,185,75,217,9,69,164,222,164,184,154,88,221,27,125,82,159,142,89,67,136,129,164,158,38,213,111,173,221,13,198,55,125,237,3,146,27,229,119,95,118,238,60,141,196,93,86,91,162,217,102,110,179,53,55,229,50,182]},\"issuerCertificate\":null,\"validTo\":\"2038-01-15T12:00:00.000Z\",\"daysRemaining\":4377,\"certType\":\"root CA\"},\"validTo\":\"2031-03-29T23:59:59.000Z\",\"daysRemaining\":1894,\"certType\":\"intermediate CA\"},\"validTo\":\"2026-12-10T23:59:59.000Z\",\"validFor\":[\"gm.com\",\"acdelco.com\",\"buick.ca\",\"buick.com\",\"buick.com.mx\",\"cadillac.ch\",\"cadillac.co.kr\",\"cadillac.com\",\"cadillac.com.mx\",\"cadillac.es\",\"cadillacarabia.com\",\"cadillaccanada.ca\",\"chevrolet.ca\",\"chevrolet.ch\",\"chevrolet.cl\",\"chevrolet.co.in\",\"chevrolet.co.kr\",\"chevrolet.co.th\",\"chevrolet.co.za\",\"chevrolet.com\",\"chevrolet.com.ar\",\"chevrolet.com.br\",\"chevrolet.com.co\",\"chevrolet.com.ec\",\"chevrolet.com.mx\",\"chevrolet.com.pe\",\"chevrolet.com.py\",\"chevrolet.com.uy\",\"chevrolet.com.ve\",\"chevrolet.pl\",\"chevroletarabia.com\",\"chevy.com\",\"gm.ca\",\"gmc.com\",\"gmc.com.mx\",\"gmcarabia.com\",\"gmccanada.ca\",\"gmckorea.co.kr\",\"gmfleet.ca\",\"gmfleet.com\",\"gmfleet.com.mx\",\"gmparts.com\",\"gmspecialtyvehicles.com\",\"gobrightdrop.com\",\"onstar.ca\",\"onstar.com\",\"onstar.com.mx\",\"gmenvolve.com\",\"ultiumhome.com\",\"holden.com.au\",\"holden.co.nz\",\"isuzu.co.nz\",\"cadillaceurope.com\",\"cadillacanz.com\",\"onstararabia.com\",\"gmdefensellc.com\",\"gemenergy.gm.com\",\"gmenvolve.ca\",\"previgm.com.br\",\"acdelco.com.br\",\"gmegypt.com\",\"gmafrica.com\",\"acdelcoarabia.com\",\"cadillacbrasil.com.br\",\"gm.com.br\",\"layoffbenefits.com\",\"acdelco.com.ar\",\"acdelco.mx\",\"gmworkjam.com\",\"acdelco.cl\",\"acdelco.com.pe\",\"acdelco.com.co\",\"acdelco.com.ec\",\"gmassetiq.com\",\"chevroleteurope.com\",\"motorsholding.com\",\"gmsupplieracceleration.com\",\"sierra.gmckorea.co.kr\",\"patents.gm.com\",\"chevrolet.com.bo\",\"carbravo.com\"],\"daysRemaining\":324,\"certType\":\"server\"}}');

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `config` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `notification_sent_history`;
CREATE TABLE `notification_sent_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `monitor_id` int(10) unsigned NOT NULL,
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_sent_history_type_monitor_id_days_unique` (`type`,`monitor_id`,`days`),
  KEY `good_index` (`type`,`monitor_id`,`days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `proxy`;
CREATE TABLE `proxy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `auth` tinyint(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `proxy_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `remote_browser`;
CREATE TABLE `remote_browser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `setting` (`id`, `key`, `value`, `type`) VALUES
(1,	'migrateAggregateTableState',	'\"migrated\"',	NULL),
(2,	'jwtSecret',	'$2a$10$4eQx6Z37E1mUIdPMYBZs4ePEeBZOx/T44KkjKKScFu6cWcJF/epfy',	NULL),
(3,	'initServerTimezone',	'true',	NULL),
(4,	'serverTimezone',	'\"America/New_York\"',	'general');

DROP TABLE IF EXISTS `status_page`;
CREATE TABLE `status_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) NOT NULL,
  `theme` varchar(30) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `search_engine_index` tinyint(1) NOT NULL DEFAULT 1,
  `show_tags` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `footer_text` text DEFAULT NULL,
  `custom_css` text DEFAULT NULL,
  `show_powered_by` tinyint(1) NOT NULL DEFAULT 1,
  `google_analytics_tag_id` varchar(255) DEFAULT NULL,
  `show_certificate_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `auto_refresh_interval` int(10) unsigned DEFAULT 300,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_page_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `status_page_cname`;
CREATE TABLE `status_page_cname` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_page_cname_domain_unique` (`domain`),
  KEY `status_page_cname_status_page_id_foreign` (`status_page_id`),
  CONSTRAINT `status_page_cname_status_page_id_foreign` FOREIGN KEY (`status_page_id`) REFERENCES `status_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `stat_daily`;
CREATE TABLE `stat_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest day',
  `ping` int(11) DEFAULT 0,
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_daily_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_daily_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='This table contains the daily aggregate statistics for each monitor';

INSERT INTO `stat_daily` (`id`, `monitor_id`, `timestamp`, `ping`, `up`, `down`, `ping_min`, `ping_max`, `extras`) VALUES
(1,	1,	1768953600,	373,	19,	1,	237.00,	1766.00,	NULL),
(2,	2,	1768953600,	6,	57,	0,	5.10,	6.11,	NULL),
(3,	3,	1768953600,	6,	56,	0,	4.96,	11.30,	NULL);

DROP TABLE IF EXISTS `stat_hourly`;
CREATE TABLE `stat_hourly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest hour',
  `ping` int(11) DEFAULT 0,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_hourly_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_hourly_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='This table contains the hourly aggregate statistics for each monitor';

INSERT INTO `stat_hourly` (`id`, `monitor_id`, `timestamp`, `ping`, `ping_min`, `ping_max`, `up`, `down`, `extras`) VALUES
(1,	1,	1768953600,	332,	246.00,	485.00,	6,	1,	NULL),
(2,	2,	1768953600,	6,	5.10,	6.11,	19,	0,	NULL),
(3,	3,	1768953600,	6,	5.14,	6.82,	18,	0,	NULL),
(4,	2,	1768957200,	6,	5.15,	6.06,	38,	0,	NULL),
(5,	3,	1768957200,	6,	4.96,	11.30,	38,	0,	NULL),
(6,	1,	1768957200,	391,	237.00,	1766.00,	13,	0,	NULL);

DROP TABLE IF EXISTS `stat_minutely`;
CREATE TABLE `stat_minutely` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest minute',
  `ping` int(11) DEFAULT 0,
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_minutely_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_minutely_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='This table contains the minutely aggregate statistics for each monitor';

INSERT INTO `stat_minutely` (`id`, `monitor_id`, `timestamp`, `ping`, `up`, `down`, `ping_min`, `ping_max`, `extras`) VALUES
(1,	1,	1768956780,	485,	1,	0,	485.00,	485.00,	NULL),
(2,	2,	1768956780,	6,	1,	0,	5.65,	5.65,	NULL),
(3,	2,	1768956840,	5,	3,	0,	5.22,	5.62,	NULL),
(4,	3,	1768956840,	6,	3,	0,	5.49,	6.82,	NULL),
(5,	1,	1768956840,	362,	1,	0,	362.00,	362.00,	NULL),
(6,	2,	1768956900,	6,	3,	0,	5.44,	5.90,	NULL),
(7,	3,	1768956900,	6,	3,	0,	5.66,	6.36,	NULL),
(8,	2,	1768956960,	6,	3,	0,	5.17,	6.11,	NULL),
(9,	3,	1768956960,	6,	3,	0,	5.76,	6.09,	NULL),
(10,	1,	1768956960,	281,	1,	1,	281.00,	281.00,	NULL),
(11,	2,	1768957020,	5,	3,	0,	5.10,	5.64,	NULL),
(12,	3,	1768957020,	6,	3,	0,	5.70,	6.49,	NULL),
(13,	1,	1768957020,	264,	1,	0,	264.00,	264.00,	NULL),
(14,	2,	1768957080,	5,	3,	0,	5.15,	5.65,	NULL),
(15,	3,	1768957080,	5,	3,	0,	5.14,	5.37,	NULL),
(16,	1,	1768957080,	246,	1,	0,	246.00,	246.00,	NULL),
(17,	2,	1768957140,	6,	3,	0,	5.44,	6.00,	NULL),
(18,	3,	1768957140,	5,	3,	0,	5.19,	5.75,	NULL),
(19,	1,	1768957140,	356,	1,	0,	356.00,	356.00,	NULL),
(20,	2,	1768957200,	5,	3,	0,	5.27,	5.74,	NULL),
(21,	3,	1768957200,	6,	3,	0,	5.43,	5.63,	NULL),
(22,	1,	1768957200,	264,	1,	0,	264.00,	264.00,	NULL),
(23,	2,	1768957260,	6,	3,	0,	5.16,	6.06,	NULL),
(24,	3,	1768957260,	6,	3,	0,	5.32,	5.90,	NULL),
(25,	1,	1768957260,	244,	1,	0,	244.00,	244.00,	NULL),
(26,	2,	1768957320,	6,	3,	0,	5.32,	5.77,	NULL),
(27,	3,	1768957320,	7,	3,	0,	5.49,	11.30,	NULL),
(28,	1,	1768957320,	261,	1,	0,	261.00,	261.00,	NULL),
(29,	2,	1768957380,	6,	3,	0,	5.29,	6.04,	NULL),
(30,	3,	1768957380,	5,	3,	0,	5.21,	5.71,	NULL),
(31,	1,	1768957380,	1766,	1,	0,	1766.00,	1766.00,	NULL),
(32,	2,	1768957440,	5,	3,	0,	5.33,	5.45,	NULL),
(33,	3,	1768957440,	5,	3,	0,	5.13,	5.68,	NULL),
(34,	1,	1768957440,	237,	1,	0,	237.00,	237.00,	NULL),
(35,	2,	1768957500,	6,	3,	0,	5.45,	6.01,	NULL),
(36,	3,	1768957500,	6,	3,	0,	5.28,	6.11,	NULL),
(37,	1,	1768957500,	260,	1,	0,	260.00,	260.00,	NULL),
(38,	2,	1768957560,	6,	3,	0,	5.15,	5.86,	NULL),
(39,	3,	1768957560,	6,	3,	0,	5.67,	5.77,	NULL),
(40,	1,	1768957560,	364,	1,	0,	364.00,	364.00,	NULL),
(41,	2,	1768957620,	6,	3,	0,	5.37,	5.61,	NULL),
(42,	3,	1768957620,	6,	3,	0,	5.73,	5.96,	NULL),
(43,	1,	1768957620,	279,	1,	0,	279.00,	279.00,	NULL),
(44,	2,	1768957680,	5,	3,	0,	5.20,	5.37,	NULL),
(45,	3,	1768957680,	6,	3,	0,	5.53,	5.91,	NULL),
(46,	1,	1768957680,	272,	1,	0,	272.00,	272.00,	NULL),
(47,	2,	1768957740,	6,	3,	0,	5.42,	5.85,	NULL),
(48,	3,	1768957740,	6,	3,	0,	5.44,	5.84,	NULL),
(49,	1,	1768957740,	266,	1,	0,	266.00,	266.00,	NULL),
(50,	2,	1768957800,	5,	3,	0,	5.29,	5.74,	NULL),
(51,	3,	1768957800,	5,	3,	0,	5.08,	5.81,	NULL),
(52,	1,	1768957800,	272,	1,	0,	272.00,	272.00,	NULL),
(53,	2,	1768957860,	6,	3,	0,	5.69,	5.92,	NULL),
(54,	3,	1768957860,	5,	3,	0,	4.96,	5.72,	NULL),
(55,	1,	1768957860,	282,	1,	0,	282.00,	282.00,	NULL),
(56,	2,	1768957920,	6,	2,	0,	5.69,	5.88,	NULL),
(57,	3,	1768957920,	5,	2,	0,	5.26,	5.33,	NULL),
(58,	1,	1768957920,	317,	1,	0,	317.00,	317.00,	NULL);

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `timezone` varchar(150) DEFAULT NULL,
  `twofa_secret` varchar(64) DEFAULT NULL,
  `twofa_status` tinyint(1) NOT NULL DEFAULT 0,
  `twofa_last_token` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `user` (`id`, `username`, `password`, `active`, `timezone`, `twofa_secret`, `twofa_status`, `twofa_last_token`) VALUES
(1,	'upch12',	'$2a$10$wouuJB8Ux6SQEdA25zbSMOBMDbPU8C5obIU1bgw565GuF3KmDqbUK',	1,	NULL,	NULL,	0,	NULL);

-- 2026-01-21 01:12:28 UTC
