DROP TABLE IF EXISTS `kills`;
CREATE TABLE `kills` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identification number of each kill',
	`killer_name` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the Killer',
	`killer_uid` VARCHAR(32) NULL DEFAULT NULL COMMENT 'UID of the Killer',
	`victim_name` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the Person who died',
	`victim_uid` VARCHAR(32) NULL DEFAULT NULL COMMENT 'UID of the Victim',
	`weapon` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the weapon/vehicle or item used to kill',
	`distance` VARCHAR(10) NOT NULL DEFAULT '0' COMMENT 'Number of distance in meters between the killer and the victim',
	`respect` VARCHAR(10) NULL DEFAULT '0' COMMENT 'Number of respect the killer earned',
	`died_at` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date and time the victim was killed',
	PRIMARY KEY (`id`)
)
COMMENT='Kill Feeds by GR8\r\nWith Victom, Killer, distance and gun'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=50
;

DROP TABLE IF EXISTS `lockpick`;
CREATE TABLE `lockpick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `object_owner` varchar(64) NOT NULL,
  `territory_id` int(11) NOT NULL,
  `position_x` double NOT NULL,
  `position_y` double NOT NULL,
  `position_z` double NOT NULL,
  `object` varchar(64) NOT NULL,
  `type` varchar(20) NOT NULL,
  `object_type` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=latin1;

ALTER TABLE `vehicle` 
ADD ammo text  
NOT NULL;  
UPDATE vehicle SET ammo='[]';