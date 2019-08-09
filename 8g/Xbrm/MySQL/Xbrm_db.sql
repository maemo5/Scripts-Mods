ALTER TABLE `container`
ADD COLUMN `is_trap` tinyint(1) NOT NULL DEFAULT '0';

CREATE TABLE `raid_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) NOT NULL,
  `thief` varchar(64) NOT NULL,
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
