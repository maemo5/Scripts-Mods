# CHOPPRAstats 
##### Detailed Stats website for ARMA3's Exile MOD.
---

## Things you will need to do:
1) Setup a webserver
2) Setup a read (Select) only MYSQL user account.

`CREATE USER 'stats-read'@'localhost' IDENTIFIED BY 'password';`
`GRANT SELECT PRIVILEGES ON * . * TO 'stats-read'@'localhost';`
`FLUSH PRIVILEGES;`

Note: if you plan on remotely accessing the database you will need to configure your user and database to allow for remote connections.  Please do this securely if you plan to do so.

3) Setup an Overwrite for ExileServer_object_player_event_onMpKilled.sqf.

`The file is provided in the repo`

4) Add this entry to your exile.ini
[updatePlayerStats]
`SQL1_1 = INSERT INTO player_stats SET killer = ?, victim = ?, weaponused = ?, distance = ?, bambikill = ?, territorykill = ?, raidkill = ?, time = NOW()
Number of Inputs = 7
SQL1_INPUTS = 1,2,3,4,5,6,7`
5) Alter your DATABASE to include the following field and new table.

`ALTER TABLE account ADD catchphrase VARCHAR(60);`
``CREATE TABLE `player_stats` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`killer` VARCHAR(50) NULL DEFAULT NULL,
	`victim` VARCHAR(100) NULL DEFAULT NULL,
	`weaponused` VARCHAR(50) NULL DEFAULT NULL,
	`distance` INT(11) NULL DEFAULT NULL,
	`bambikill` INT(1) NULL DEFAULT NULL,
	`raidkill` INT(11) NULL DEFAULT NULL,
	`territorykill` INT(11) NULL DEFAULT NULL,
	`time` DATETIME NULL DEFAULT NULL,
	INDEX `Index 1` (`id`),
	INDEX `Index 2` (`victim`),
	INDEX `Index 3` (`killer`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;``

6) Edit /includes/condb.php
`condb.php is setup for 2 servers.  If you have multiple databases, add the second or third one and uncomment the sections in condb.`

7) Edit /includes/navbar.php
`if you have two databses be sure to uncomment the line for the second database.`

# screenshots

![alt text](https://i.imgur.com/px4x3qJ.png)

![alt text](https://i.imgur.com/B0HAe3E.png)

![alt text](https://i.imgur.com/rt08esp.png)




