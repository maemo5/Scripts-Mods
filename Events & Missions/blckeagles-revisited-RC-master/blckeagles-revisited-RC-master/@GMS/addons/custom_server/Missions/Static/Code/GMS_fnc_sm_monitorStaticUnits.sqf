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

private _triggerRange = 2000;
_fnc_updateGroupSpawnTimerFields = {
	//diag_log format["_fnc_updateGroupSpawnTimerFields::-> _this = %1",_this];
	params["_array","_element",["_group",grpNull],["_spawnTime",0]];
	private["_index"];
	_index = _array find _element;
	_element set[1,_group];
	_element set[2,_spawnTime];
	_array set[_index,_element];
};

private["_group","_groupParameters","_numAI","_return"];
_sm_groups = +blck_sm_Groups;
{
	
	// [ [px, py, pz] /* position*/, "difficulty", 4 /*Number to Spawn*/, 150 /*radius of patrol*/, _respawnTime, _group, _spawnAt]
	_x params["_groupParameters","_group","_spawnAt"];
	_groupParameters params["_pos","_difficulty","_units","_patrolRadius","_respawnTime","_maxRespawns"];
	//diag_log format["<_sm_monitorStaticUnits::Group spawning routine:: _units = %1 | _x = %2 |_forEachIndex = %3",_units,_x,_forEachIndex];
	private _groupSpawned = false;
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{
		if ((isNull _group) && (diag_tickTime > _spawnAt) && (_spawnAt != -1)) then  // no group has been spawned, spawn one.
		{
			//diag_log format["[blckeagls static group spawner] evaluating _x = %1 ",_x];
			_numAI = [_units] call blck_fnc_getNumberFromRange;
			//diag_log format["[blckeagls static group spawner] _units = %1 and _numAI = %2",_units,_numAI];		
			// // params["_pos",  "_center", _numai1,  _numai2,  _skillLevel, _minDist, _maxDist, _configureWaypoints, _uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms, _scuba ];
			_group = [_pos,_pos,_numAI,_numAI,_difficulty,_patrolRadius-2,_patrolRadius,true] call blck_fnc_spawnGroup;
			//diag_log format["[blckeagls static group spawner] _group %1",_group];
			[blck_sm_Groups,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn Group step :: blck_sm_Groups updated to %1",blck_sm_Groups];
		};
		if (!(_groupSpawned) && (isNull _group) && (_spawnAt == -1) && (_respawnTime > 0)) then // a group was spawned and all units are dead and we should rspawn them after a certain interval
		{
			[blck_sm_Groups,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set Group respawn time step :: blck_sm_Groups updated to %1",blck_sm_Groups];			
		};
		if (!(_groupSpawned) && (isNull _group) && (_spawnAt == -1) && (_respawnTime == 0) ) then // a group was spawned and all units are dead but we should not do a respawn
		{
			blck_sm_Groups deleteAt (blck_sm_Groups find _x);
		};
	};
}forEach _sm_groups;

_sm_scubaGroups = +blck_sm_scubaGroups;
{
	
	// [ [px, py, pz] /* position*/, "difficulty", 4 /*Number to Spawn*/, 150 /*radius of patrol*/, _respawnTime, _group, _spawnAt]
	_x params["_groupParameters","_group","_spawnAt"];
	_groupParameters params["_pos","_difficulty","_units","_patrolRadius","_respawnTime"];
	//diag_log format["<_sm_monitorScubaUnits:: _group = %1 | _x = %2 |_forEachIndex = %3",_group,_x,_forEachIndex];
	private _groupSpawned = false;
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{
		if ((isNull _group) && (diag_tickTime > _spawnAt) && (_spawnAt != -1)) then  // no group has been spawned, spawn one.
		{
			//diag_log format["[blckeagls static scubaGroup spawner] evaluating _x = %1 ",_x];
			_numAI = [_units] call blck_fnc_getNumberFromRange;
			//diag_log format["[blckeagls static scubaGroup spawning routine] _units = %1 and _numAI = %2",_units,_numAI];		
			//params["_pos", "_numUnits", ["_skillLevel","red"], "_center", ["_minDist",20], ["_maxDist",35], ["_uniforms",blck_UMS_uniforms], ["_headGear",blck_UMS_headgear],["_configureWaypoints",true],["_weapons",blck_UMS_weapons],["_vests",blck_UMS_vests]];
			_group = [_pos,_difficulty,_units,_patrolRadius] call blck_fnc_spawnScubaGroup;
			//diag_log format["[blckeagls static scubaGroup spawner] _group %1",_group];
			[blck_sm_scubaGroups,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn Group step :: blck_sm_Groups updated to %1",blck_sm_Groups];
		};
		if (!(_groupSpawned) && (isNull _group) && (_spawnAt == -1) && (_respawnTime > 0)) then // a group was spawned and all units are dead and we should rspawn them after a certain interval
		{
			[blck_sm_scubaGroups,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set scubaGroup respawn time step :: blck_sm_Groups updated to %1",blck_sm_scubaGroups];			
		};
		if (!(_groupSpawned) && (isNull _group) && (_spawnAt == -1) && (_respawnTime == 0) ) then // a group was spawned and all units are dead but we should not do a respawn
		{
			blck_sm_scubaGroups deleteAt (blck_sm_scubaGroups find _x);
		};
	};
}forEach _sm_scubaGroups;

_sm_Emplaced = +blck_sm_Emplaced;
{
	// 	["B_G_Mortar_01_F",[22944.3,16820.5,3.14243],"green",0,0,_group,_spawnAt]
	//diag_log format["_sm_monitorEmplacedUnits::-> _x = %1",_x];
	_x params["_groupParameters","_group","_spawnAt"];	
	_groupParameters params["_weapType","_pos","_difficulty","_patrolRadius","_respawnTime"];
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{	
		if ( (_group isEqualTo grpNull) && (diag_tickTime > _spawnAt) && (_spawnAt != -1) ) then  // no group has been spawned, spawn one.
		{
			//diag_log format["[blckeagls static Emplaced spawner] _weapType = %1 and _difficulty = %2",_weapType,_difficulty];
			// params["_coords","_missionEmplacedWeapons","_useRelativePos","_noEmplacedWeapons","_aiDifficultyLevel",["_uniforms",blck_SkinList], ["_headGear",blck_headgear],["_vests",blck_vests],["_backpacks",blck_backpacks],["_weaponList",[]],["_sideArms",blck_Pistols]];
			_group = [_pos,[_groupParameters],false,1,_difficulty] call blck_fnc_spawnEmplacedWeaponArray;
			[blck_sm_Emplaced,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn emplaced step :: blck_sm_Emplaced updated to %1",blck_sm_Emplaced];
		};
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime > 0) ) then // a group was spawned and all units are dead
	{
			[blck_sm_Emplaced,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set Group respawn time step :: blck_sm_Emplaced updated to %1",blck_sm_Emplaced];				
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime == 0)) then // a group was spawned and all units are dead
	{
		blck_sm_Emplaced deleteAt (blck_sm_Emplaced find _x);
	};
	
}forEach _sm_Emplaced;

_sm_Vehicles = +blck_sm_Vehicles;
{
	// 	["B_G_Offroad_01_armed_F",[22819.4,16929.5,3.17413],"red",600,0,_group,_spawnAt],
	//diag_log format["_sm_monitorVehicles::-> _x = %1",_x];
	_x params["_groupParameters","_group","_spawnAt"];
	_groupParameters params["_vehicleType","_pos","_difficulty","_patrolRadius","_respawnTime"];
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{	
		if ( (_group isEqualTo grpNull) && (diag_tickTime > _spawnAt) && (_spawnAt != -1) ) then  // no group has been spawned, spawn one.
		{
			//params["_coords","_noVehiclePatrols","_aiDifficultyLevel","_missionPatrolVehicles",["_useRelativePos",true],["_uniforms",blck_SkinList], ["_headGear",blck_headgear],["_vests",blck_vests],["_backpacks",blck_backpacks],["_weaponList",[]],["_sideArms",blck_Pistols], ["_isScubaGroup",false]];
			_return = [_pos,1,_difficulty,[_groupParameters],false] call blck_fnc_spawnMissionVehiclePatrols;
			//  _return = [_vehicles, _missionAI, _abort];
			_group = group (_return select 1 select 0);
			[blck_sm_Vehicles,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn emplaced step :: blck_sm_Vehicles updated to %1",blck_sm_Vehicles];
		};
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime > 0) ) then // a group was spawned and all units are dead
	{ 
			[blck_sm_Vehicles,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set Group respawn time step :: blck_sm_Vehicles updated to %1",blck_sm_Vehicles];		
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime == 0) ) then // a group was spawned and all units are dead
	{
		blck_sm_Vehicles deleteAt (blck_sm_Vehicles find _x);
	};	
}forEach _sm_Vehicles;

_sm_surfaceVehicles = +blck_sm_surfaceShips;
{
	// 	["B_G_Offroad_01_armed_F",[22819.4,16929.5,3.17413],"red",600,0,_group,_spawnAt],
	_x params["_groupParameters","_group","_spawnAt"];
	_groupParameters params["_weapType","_pos","_difficulty","_patrolRadius","_respawnTime"];
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{	
		if ( (_group isEqualTo grpNull) && (diag_tickTime > _spawnAt) && (_spawnAt != -1) ) then  // no group has been spawned, spawn one.
		{
			//diag_log format["[blckeagls static vehiclePatrol spawner]  _weapType = %1 and _difficulty = %2",_weapType,_difficulty];
			[_pos,1,_difficulty,[_groupParameters],false] call blck_fnc_spawnMissionVehiclePatrols;
			_return params ["_vehicles", "_missionAI", "_abort"];
			_group = group (_missionAI select 0);  
			[blck_sm_surfaceShips,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn emplaced step :: blck_sm_Vehicles updated to %1",blck_sm_Vehicles];
		};
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime > 0) ) then // a group was spawned and all units are dead
	{ 
			[blck_sm_surfaceShips,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set Group respawn time step :: blck_sm_Vehicles updated to %1",blck_sm_Vehicles];		
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime == 0) ) then // a group was spawned and all units are dead
	{
		blck_sm_surfaceShips deleteAt (blck_sm_surfaceShips find _x);
	};	
}forEach _sm_surfaceVehicles;

_sm_SDVVehicles = +blck_sm_submarines;
{
	// 	["B_G_Offroad_01_armed_F",[22819.4,16929.5,3.17413],"red",600,0,_group,_spawnAt],
	_x params["_groupParameters","_group","_spawnAt"];
	_groupParameters params["_weapType","_pos","_difficulty","_patrolRadius","_respawnTime"];
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{	
		if ( (_group isEqualTo grpNull) && (diag_tickTime > _spawnAt) && (_spawnAt != -1) ) then  // no group has been spawned, spawn one.
		{
			//diag_log format["[blckeagls static sub patrol spawner]  _weapType = %1 and _difficulty = %2",_weapType,_difficulty];
			//params["_coords","_noVehiclePatrols","_aiDifficultyLevel","_missionPatrolVehicles",["_useRelativePos",true],["_uniforms",blck_SkinList], ["_headGear",blck_headgear],["_vests",blck_vests],["_backpacks",blck_backpacks],["_weaponList",[]],["_sideArms",blck_Pistols], ["_isScubaGroup",false]];
			_return = [_pos,1,_difficulty,[_groupParameters],false,blck_UMS_uniforms,blck_UMS_headgear,blck_UMS_vests,blck_backpacks,blck_UMS_weapons,blck_Pistols,true] call blck_fnc_spawnMissionVehiclePatrols;
			_return params ["_vehicles", "_missionAI", "_abort"];
			_group = group (_missionAI select 0);  
			[blck_sm_submarines,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn emplaced step :: blck_sm_Vehicles updated to %1",blck_sm_Vehicles];
		};
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime > 0) ) then // a group was spawned and all units are dead
	{ 
			[blck_sm_submarines,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set Group respawn time step :: blck_sm_Vehicles updated to %1",blck_sm_Vehicles];		
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime == 0) ) then // a group was spawned and all units are dead
	{
		blck_sm_submarines deleteAt (blck_sm_submarines find _x);
	};	
}forEach _sm_SDVVehicles;

_sm_Aircraft = +blck_sm_Aircraft;
{
	// 	["Exile_Chopper_Huey_Armed_Green",[22923.4,16953,3.19],"red",1000,0],
	_x params["_groupParameters","_group","_spawnAt"];
	_groupParameters params["_aircraftType","_pos","_difficulty","_patrolRadius","_respawnTime"];
	if ([_pos,_triggerRange] call blck_fnc_playerInRange) then
	{
		if ( (isNull _group) && (diag_tickTime > _spawnAt) && (_spawnAt != -1)) then  // no group has been spawned, spawn one.
		{
			_weapon = [toLower _difficulty] call blck_fnc_selectAILoadout;
			//params["_coords","_skillAI","_helis",["_uniforms", blck_SkinList],["_headGear",blck_headgear],["_vests",blck_vests],["_backpacks",blck_backpacks],["_Launcher","none"],["_weaponList",[]],["_sideArms",[]]]
			//diag_log format["[blckeagls static aircraftePatrol spawner]  _weapon = %1 and _difficulty = %2",_weapon,_difficulty];
			_return = [_pos,_difficulty,[_aircraftType]] call blck_fnc_spawnMissionHeli;  //  Allow the spawner to fit the default AI Loadouts for blckeagls; revisit at a later time when custom uniforms are set up for these AI.
			//diag_log format["[blckeagls] static aircraftePatrol spawner -> _return = %1",_return];
			_return params ["_patrolHeli","_ai","_abort"];
			_group = group (_ai select 0);
			[blck_sm_Aircraft,_x,_group,-1] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | spawn emplaced step :: blck_sm_Aircraft updated to %1",blck_sm_Aircraft];
		};
	};
	if ( (isNull _group) && (_spawnAt == -1) && (_respawnTime > 0) ) then // a group was spawned and all units are dead
	{
			[blck_sm_Aircraft,_x,_group,(diag_tickTime + _respawnTime)] call _fnc_updateGroupSpawnTimerFields;
			//diag_log format["_sm_monitorStaticUnits | set Group respawn time step :: blck_sm_Aircraft updated to %1",blck_sm_Aircraft];	
	};
	if ( (_group isEqualTo grpNull) && (_spawnAt == -1) && (_respawnTime == 0) ) then // a group was spawned and all units are dead
	{
		blck_sm_Aircraft deleteAt (blck_sm_Aircraft find _x);
	};	
}forEach _sm_Aircraft;
