/*
	blck_fnc_spawnGroup
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_numbertospawn","_groupSpawned","_safepos","_launcherType","_infantryType"];	
// _newGroup = [_groupSpawnPos,_minAI,_maxAI,_skillLevel,_coords,_minPatrolRadius,_maxPatrolRadius,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,true,_isScubaGroup]
params["_pos",  "_center", ["_numai1",5],  ["_numai2",10],  ["_skillLevel","red"], ["_minDist",30], ["_maxDist",45],["_configureWaypoints",true], ["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]], ["_scuba",false]];
if (_weaponList isEqualTo []) then {_weaponList = [_skillLevel] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo [])  then {_sideArms = [_skillLevel] call blck_fnc_selectAISidearms};
if (_uniforms isEqualTo [])  then {_uniforms = [_skillLevel] call blck_fnc_selectAIUniforms};
if (_headGear isEqualTo [])  then {_headGear = [_skillLevel] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo [])     then {_vests = [_skillLevel] call blck_fnc_selectAIVests};
if (_backpacks isEqualTo []) then {_backpacks = [_skillLevel] call blck_fnc_selectAIBackpacks};

_numbertospawn = [_numai1,_numai2] call blck_fnc_getNumberFromRange;

//_groupSpawned = createGroup [blck_AI_Side, true];  // true here causes any empty group to be automatically deleted within 1 sec or so.  https://community.bistudio.com/wiki/createGroup
_groupSpawned = call blck_fnc_create_AI_Group;

if !(isNull _groupSpawned) then
{
	if (_weaponList isEqualTo []) then
	{
		_weaponList = [_skillLevel] call blck_fnc_selectAILoadout;
	};

	//Spawns the correct number of AI Groups, each with the correct number of units
	//Counter variable
	_i = 0;
	while {_i < _numbertospawn} do 
	{
		_i = _i + 1;
		if (blck_useLaunchers && _i <= blck_launchersPerGroup) then
		{
			_launcherType = selectRandom blck_launcherTypes;
		} else {
			_launcherType = "none";
		};
		 //params["_pos","_aiGroup",_skillLevel,_uniforms, _headGear,_vests,_backpacks,_Launcher,_weaponList,_sideArms,_scuba];
		[_pos,_groupSpawned,_skillLevel,_uniforms,_headGear,_vests,_backpacks,_launcherType, _weaponList, _sideArms, _scuba] call blck_fnc_spawnUnit;
	};
	_groupSpawned selectLeader ((units _groupSpawned) select 0);
	// params["_pos","_minDis","_maxDis","_group",["_mode","random"],["_pattern",["MOVE","SAD"]]];
	if (_configureWaypoints) then
	{
		if (_scuba) then {_infantryType = "scuba"} else {_infantryType = "infantry"};
		[_pos,_minDist,_maxDist,_groupSpawned,"random","SAD",_infantryType] spawn blck_fnc_setupWaypoints;
	};
} else 
{
	diag_log "_fnc_spawnGroup:: ERROR CONDITION : NULL GROUP CREATED";
};
_groupSpawned
