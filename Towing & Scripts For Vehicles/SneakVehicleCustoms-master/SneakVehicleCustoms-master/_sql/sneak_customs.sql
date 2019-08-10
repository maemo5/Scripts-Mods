SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `sneak_customs`;
CREATE TABLE IF NOT EXISTS `sneak_customs` (
	`vehicle_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`skin_name` varchar(64) NOT NULL,
	PRIMARY KEY (`vehicle_id`),
	CONSTRAINT `sneak_customs_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sneak_special_players`;
CREATE TABLE IF NOT EXISTS `sneak_special_players` (
	`account_uid` varchar(32) NOT NULL,
	`group_name` varchar(64) NOT NULL,
	PRIMARY KEY `account_uid` (`account_uid`),
	CONSTRAINT `sneak_group_members_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;