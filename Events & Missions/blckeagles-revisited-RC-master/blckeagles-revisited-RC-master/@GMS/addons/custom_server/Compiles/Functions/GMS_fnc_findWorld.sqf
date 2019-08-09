/*
	Determine the map name, set the map center and size, and return the map name.
	Trader coordinates were pulled from the config.cfg
	Inspired by the Vampire and DZMS

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_blck_WorldName"];

_blck_WorldName = toLower format ["%1", worldName];
_blck_worldSize = worldSize;

diag_log format["[blckeagls] Loading Map-specific settings with worldName = %1",_blck_WorldName];

switch (_blck_WorldName) do 
{// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
		case "altis":{
			diag_log "[blckeagls] Altis-specific settings for Epoch loaded";
			blck_mapCenter = [6322,7801,0]; 
			blck_mapRange = 21000; 
		};
		case "stratis":{
			diag_log "[blckeagls] Stratis-specific settings loaded";
			blck_mapCenter = [6322,7801,0]; 
			blck_mapRange = 4500; 
		}; // Add Central, East and West respawns/traders 
		case "chernarus":{
			diag_log "[blckeagls] Chernarus-specific settings loaded";
			blck_mapCenter = [7100, 7750, 0]; //centerPosition = {7100, 7750, 300};
			blck_mapRange = 5300;
		};	
		case "chernarus_summer":{blck_mapCenter = [7100, 7750, 0]; blck_mapRange = 6000;}; 
		case "bornholm":{
			//diag_log "Bornholm-specific settings loaded";
			blck_mapCenter = [11240, 11292, 0];
			blck_mapRange = 14400;
		};
		case "esseker":{
			diag_log "Esseker-specific settings loaded";
			blck_mapCenter = [6049.26,6239.63,0]; //centerPosition = {7100, 7750, 300};
			blck_mapRange = 6000;
		};
		case "taviana":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14400;};
		case "namalsk":{blck_mapCenter = [4352, 7348, 0];blck_mapRange = 10000;};
		case "napf": {blck_mapCenter = [10240,10240,0]; blck_mapRange = 14000};  // {_centerPos = [10240, 10240, 0];_isMountainous = true;_maxHeight = 50;};
		case "australia": {blck_mapCenter = [20480,20480, 150];blck_mapRange = 40960;};
		case "panthera3":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400;};
		case "isladuala":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400;};
		case "sauerland":{blck_mapCenter = [12800, 12800, 0];blck_mapRange = 12800;};
		case "trinity":{blck_mapCenter = [6400, 6400, 0];blck_mapRange = 6400;};
		case "utes":{blck_mapCenter = [3500, 3500, 0];blck_mapRange = 3500;};
		case "zargabad":{blck_mapCenter = [4096, 4096, 0];blck_mapRange = 4096;};
		case "fallujah":{blck_mapCenter = [3500, 3500, 0];blck_mapRange = 3500;};
		case "tavi":{blck_mapCenter = [10370, 11510, 0];blck_mapRange = 14090;};
		case "lingor":{blck_mapCenter = [4400, 4400, 0];blck_mapRange = 4400;};	
		case "takistan":{blck_mapCenter = [5500, 6500, 0];blck_mapRange = 5000;};
		case "lythium":{blck_mapCenter = [10000,10000,0];blck_mapRange = 8500;};
		default {_blck_WorldName = "default";blck_mapCenter = [6322,7801,0]; blck_mapRange = 6000};
};

blck_worldSet = true;
