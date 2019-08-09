/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
//diag_log "[blckeagls] GMS_fnc_sm_init_functions.sqf <Defining Variables and Compiling Functions>";
//blck_sm_Groups = [];
blck_sm_Infantry = [];
blck_sm_Vehicles = [];
blck_sm_Aircraft = [];
blck_sm_Emplaced = [];
blck_sm_scubaGroups = [];
blck_sm_surfaceShips = [];
blck_sm_submarines = [];
blck_sm_lootContainers = [];
blck_sm_garrisonBuildings_ASL = [];
blcl_sm_garrisonBuilding_relPos = [];

blck_fnc_sm_AddGroupToArray = compileFinal  preprocessFileLineNumbers  "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddGroupToArray.sqf";

/*
blck_fnc_sm_AddGroup = compileFinal  preprocessFileLineNumbers  "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddGroup.sqf";
blck_fnc_sm_AddVehicle = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddVehicle.sqf";
blck_fnc_sm_AddAircraft = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddAircraft.sqf";
blck_fnc_sm_AddEmplaced = compileFinal  preprocessFileLineNumbers "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddEmplaced.sqf";
*/
private _functions = [
	//["blck_fnc_sm_monitorStaticUnits","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorStaticPatrols.sqf"],
	["blck_fnc_sm_monitorInfantry","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorInfantry.sqf"],
	["blck_fnc_sm_monitorScuba","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorScuba.sqf"],
	["blck_fnc_sm_monitorVehicles","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorVehicles.sqf"],
	["blck_fnc_sm_monitorAircraft","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorAircraft.sqf"],
	["blck_fnc_sm_monitorShips","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorShips.sqf"],
	["blck_fnc_sm_monitorSubs","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorSubs.sqf"],
	["blck_fnc_sm_monitorEmplaced","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorEmplaced.sqf"],
	["blck_fnc_sm_monitorGarrisonsASL","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorGarrisonsASL.sqf"],
	["blck_fnc_sm_monitorGarrisons_relPos","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_monitorGarrisons_relPos.sqf"],
	["blck_fnc_sm_spawnVehiclePatrol","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnVehiclePatrol.sqf"],
	["blck_fnc_sm_spawnAirPatrol","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnAirPatrol.sqf"],
	["blck_fnc_sm_spawnEmplaced","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnEmplaced.sqf"],
//	["blck_fnc_sm_spawnInfantryPatrol","\q\addons\custom_server\Missions\Static\Code\GMS_sm_spawnInfantryPatrol.sqf"],
	["blck_fnc_sm_staticPatrolMonitor","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_staticPatrolMonitor.sqf"],
//	["blck_fnc_sm_checkForPlayerNearMission","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_checkForPlayerNearMission.sqf"],
	["blck_fnc_sm_spawnAirPatrols","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnAirPatrols.sqf"],
	["blck_fnc_sm_spawnEmplaceds","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnEmplaced.sqf"],
	["blck_fnc_sm_spawnInfantryPatrols","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnInfantryPatrols.sqf"],
	["blck_fnc_sm_spawnLootContainers","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnLootContainers.sqf"],
	["blck_fnc_sm_spawnObjects","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnObjects.sqf"],
	["blck_fnc_sm_spawnVehiclePatrols","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnVehiclePatrols.sqf"],
	["blck_fnc_sm_spawnBuildingGarrison_ASL","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnBuildingGarrisonASL.sqf"],
	["blck_fnc_sm_spawnBuildingGarrison_relPos","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnBuildingGarrison_relPos.sqf"],
	["blck_fnc_sm_spawnObjectASLVectorDirUp","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_spawnObjectASLVectorDirUp.sqf"],
	["blck_fnc_spawnScubaGroup","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_spawnScubaGroup.sqf"],
	["blck_fnc_spawnSDVPatrol","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_spawnSDVPatrol.sqf"],
	["blck_fnc_spawnSurfacePatrol","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_spawnSurfacePatrol.sqf"],
	//["blck_fnc_sm_AddScubaGroup","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddScubaGroup.sqf"],
	//["blck_fnc_sm_AddSurfaceVehicle","\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_AddSurfaceVehicle.sqf"],
	["blck_fnc_sm_AddSDVVehicle","\q\addons\custom_server\Missions\Static\Code\GMS_sm_AddSDVVehicle.sqf"]
];
{
	_x params ["_name","_path"];
	missionnamespace setvariable [_name,compileFinal preprocessFileLineNumbers _path];
} foreach _functions;

diag_log "[blckeagls] GMS_sm_init_functions.sqf <Variables Defined and Functions Loaded>";


/*
blck_fnc_spawnScubaGroup = compileFinal preprocessFileLineNumbers "q\addons\custom_server\Missions\UMS\code\GMS_fnc_spawnScubaGroup.sqf";
blck_fnc_spawnSDVPatrol = compileFinal preprocessFileLineNumbers "q\addons\custom_server\Missions\UMS\code\GMS_fnc_spawnSDVPatrol.sqf";
blck_fnc_spawnSurfacePatrol = compileFinal preprocessFileLineNumbers "q\addons\custom_server\Missions\UMS\code\GMS_fnc_spawnSurfacePatrol.sqf";
blck_fnc_sm_AddScubaGroup = compileFinal  preprocessFileLineNumbers  "\q\addons\custom_server\Missions\UMS\code\GMS_sm_AddScubaGroup.sqf";
blck_fnc_sm_AddSurfaceVehicle = compileFinal  preprocessFileLineNumbers  "\q\addons\custom_server\Missions\UMS\code\GMS_sm_AddSurfaceVehicle.sqf";
blck_fnc_sm_AddSDVVehicle = compileFinal  preprocessFileLineNumbers  "\q\addons\custom_server\Missions\UMS\code\GMS_sm_AddSDVVehicle.sqf";
