/*
	File: fn_initAssassin.sqf
	Author: Fresqo
	Description: initializes the assassination side mission
		set times for mission to reoccur after done
*/

sleep (30 * 30);
sleep (500 + (random 1000)); 
//sleep 180;

[] execVM "\x\addons\DMS\Assassination\fn_Assassin.sqf";