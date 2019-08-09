

/*
	This is a simple mission using precisely placed loot crates and infantry, static weapons and vehicle patrols.
	See the accompanying example mission in the exampleMission folder to get an idea how I laid this out.
	Note that I exported the mission using the exportAll function of M3EDEN editor.
*/

#include "privateVars.sqf";

_mission = "static mission template";  //  Included for additional documentation. Not intended to be spawned as a mission per se.

_difficulty = "red";  // Skill level of AI (blue, red, green etc)
diag_log format["[blckeagls static missions] STARTED initializing middions %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];
_crateLoot = blck_BoxLoot_Orange;  // You can use a customized _crateLoot configuration by defining an array here. It must follow the following format shown for a hypothetical loot array called _customLootArray
	/*
	_customLootArray = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons	

				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]				
			],
			[//Magazines
				["10Rnd_93x64_DMR_05_Mag" ,1,5]				
			],			
			[  // Optics
				["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_MetalScrews",3,10]
				//
			],
			[//Items
				["Exile_Item_MountainDupe",1,3]				
			],
			[ // Backpacks
				["B_OutdoorPack_tan",1,2]
			]
	];	
	*/

_lootCounts = blck_lootCountsRed; // You can use a customized set of loot counts or one that is predefined but it must follow the following format:
								  // values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
								  //  blck_lootCountsOrange = [[6,8],[24,32],[5,10],[25,35],16,1];   // Orange

/****************************************************

	PLACE MARKER DEFINITIONS PULLED FROM YOUR MISSION BELOW
	
*****************************************************/



/****************************************************

	PLACE THE DATA DEFININING THE BUILDINGS, VEHICLES ETC. PULLED FROM YOUR MISSION BELOW
	
*****************************************************/
								  
								  
								  
/****************************************************

	ENABLE ANY SETTINGS YOU LIKE FROM THE LIST BELOW. 
	iF THESE ARE NOT ENABLED THEN THE DEFAULTS DEFINED IN BLCK_CONFIG.SQF 
	AND THE MOD-SPECIFIC CONFIGURATIONS WILL BE USED.
	
*****************************************************/								  
			
/*			
_missionLandscapeMode = "precise"; // acceptable values are "random","precise"
									// In precise mode objects will be spawned at the relative positions specified.
									// In the random mode, objects will be randomly spawned within the mission area.

_aircraftTypes = blck_patrolHelisRed;  //  You can use one of the pre-defined lists in blck_configs or your own custom array.
_noAirPatrols =	blck_noPatrolHelisRed; // You can use one of the pre-defined values or a custom one. acceptable values are integers (1,2,3) or a range such as [2,4]; 
										//  Note: this value is ignored if you specify air patrols in the array below.
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines  = blck_useMines;  // Set to false if you have vehicles patrolling nearby.
_uniforms  = blck_SkinList;  // You can replace this list with a custom list of uniforms if you like.
_headgear  = blck_headgear;  // You can replace this list with a custom list of headgear.
_vests     = blck_vests;     // You can replace this list with a custom list of vests.
_backpacks = blck_backpacks; // You can replace this list with a custom list of backpacks.
_weapons   = blck_WeaponList_Orange; // You can replace this list with a customized list of weapons, or another predifined list from blck_configs_epoch or blck_configs_exile as appropriate.
_sideArms  = blck_pistols;    // You can replace this list with a custom list of sidearms.
*/


//********************************************************
// Do not modify anything below this line.
//********************************************************
#include "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_initializeMission.sqf"; 

diag_log format["[blckeagls static missions] COMPLETED initializing middions %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];