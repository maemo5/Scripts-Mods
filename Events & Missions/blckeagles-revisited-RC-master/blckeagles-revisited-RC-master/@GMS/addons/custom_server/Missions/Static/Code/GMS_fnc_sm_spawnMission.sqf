/*
	by Ghostrider [GRG]
	for ghostridergaming
	12/5/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_mission"];
// Spawn landscape
// params["_objects"];
[_missionLandscape] call blck_fnc_sm_spawnObjects;
uiSleep 10; // Let the objects 'settle' before placing anything on or around them.


// Spawn Air Patrols
// params["_airPatrols","_noAirPatrols","_heliTypes","_center","_difficulty","_uniforms","_headGear"];
[_airPatrols,_noAirPatrols,_aircraftTypes,_missionCenter,_difficulty,_uniforms,_headgear,_weapons] call blck_fnc_sm_spawnAirPatrols;
//uiSleep 1;

// Spawn Vehicle Patrols
// params["_coords","_noVehiclePatrols","_vehiclePatrolSpawns","_aiDifficultyLevel","_uniforms","_headGear",["_missionType","unspecified"]];
[_missionCenter,_noVehiclePatrols,_vehiclePatrolParameters,_difficulty,_uniforms,_headGear] call blck_fnc_sm_spawnVehiclePatrols;
//uiSleep 1;


// spawn infantry
//  params["_patrols","_coords",["_minNoAI",3],["_maxNoAI",6],["_aiDifficultyLevel","red"],["_weapons",blck_WeaponList_Orange],["_uniforms",blck_SkinList],["_headGear",blck_BanditHeadgear]];
[_aiGroupParameters, _missionCenter,_minNoAI,_maxNoAI,_difficulty,_weapons,_uniforms,_headGear] call blck_fnc_sm_spawnInfantryPatrols;
//uiSleep 1;

// spawn loot vehicles
// params["_objects","_coords","_loot","_lootCounts"];
[_missionLootVehicles,_missionCenter,_crateLoot,_lootCounts] call blck_fnc_sm_spawnLootContainers;

// Spawn static weapons
// params["_missionEmplacedWeapons","_noEmplacedWeapons","_aiDifficultyLevel","_coords","_uniforms","_headGear"];
[_missionEmplacedWeapons,_noEmplacedWeapons,_difficulty,_missionCenter,_uniforms,_headGear] call blck_fnc_sm_spawnEmplaceds;

// spawn loot chests
[_missionLootBoxes,_missionCenter,_crateLoot,_lootCounts] call blck_fnc_sm_spawnLootContainers;

_blck_localMissionMarker = ["",_missionCenter,"","",_markerColor,_markerType];
[_blck_localMissionMarker] call blck_fnc_spawnMarker;

diag_log format["[blckeagls] Static Mission Spawner: Mission %1 spawned",_mission];

