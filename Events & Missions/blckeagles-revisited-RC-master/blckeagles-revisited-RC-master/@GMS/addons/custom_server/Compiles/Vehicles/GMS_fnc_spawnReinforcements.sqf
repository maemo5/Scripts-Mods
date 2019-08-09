/*

	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_aiSkillsLevel","_weapons","_uniforms","_headgear",["_chancePara",0]];
/*
_coords = _this select 0;
_aiSkillsLevel = _this select 1;
_weapons = _this select 2;
_uniforms = _this select 3;
_headgear = _this select 4;
*/

private["_chanceHeliPatrol","_return","_temp","_missionHelis"];
#ifdef blck_debugMode
if (blck_debugLevel > 0) then {diag_log format["_fnc_spawnMissionReinforcements (25):  Script Starting with _aiSkillsLevel = %1",_aiSkillsLevel]};
#endif
_aiSkillsLevel = toLower _aiSkillsLevel;

if (_aiSkillsLevel isEqualTo "blue") then {
	#ifdef blck_debugMode
	if (blck_debugLevel > 0) then {diag_log "_fnc_spawnMissionReinforcements (29): BLUE difficulty settings applied";};
	#endif
	_chanceHeliPatrol = blck_chanceHeliPatrolBlue;
	_missionHelis = blck_patrolHelisBlue;
};
if (_aiSkillsLevel isEqualTo "green") then {
	#ifdef blck_debugMode
	if (blck_debugLevel > 0) then {diag_log "_fnc_spawnMissionReinforcements (34): GREEN difficulty settings applied";};
	#endif
	_chanceHeliPatrol = blck_chanceHeliPatrolGreen;
	_missionHelis = blck_patrolHelisGreen;
};
if (_aiSkillsLevel isEqualTo "orange") then {
	#ifdef blck_debugMode
	if (blck_debugLevel > 0) then {diag_log "_fnc_spawnMissionReinforcements (39): ORANGE difficulty settings applied";};
	#endif
	_chanceHeliPatrol = blck_chanceHeliPatrolOrange;
	_missionHelis = blck_patrolHelisOrange;
};
if (_aiSkillsLevel isEqualTo "red") then
{
	#ifdef blck_debugMode
	if (blck_debugLevel > 0) then {diag_log "_fnc_spawnMissionReinforcements (46): RED difficulty settings applied";};
	#endif
	_chanceHeliPatrol = blck_chanceHeliPatrolRed;
	_missionHelis = blck_patrolHelisRed;	
};
#ifdef blck_debugMode
if (blck_debugLevel > 1) then {diag_log format["_fnc_spawnMissionReinforcements (50): Variables defined: _chanceHeliPatrol %1 | _missionHelis %2",_chanceHeliPatrol,_missionHelis];};
#endif
if ( (_chanceHeliPatrol > 0) && (random (1) < _chanceHeliPatrol) ) then // if helipatrols are 'enabled' then paratroops will only drop if a heli spawns.
																		// The chance that they drop is linked to the value for them for that difficulty _aiSkillsLevel
																		//see _fnc_spannMissionParatroops for how this is handled.
{
	_temp = [objNull,[],false];
	//params["_coords","_aiSkillsLevel",,"_weapons","_uniforms","_headgear""_helis"];

	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then 
	{
		diag_log "_fnc_spawnMissionReinforcements (64): calling _fnc_spawnMissionHeli to spawn heli and paratroops";
	};
	#endif
	// params["_coords","_skillAI","_weapons","_uniforms","_headGear","_helis",["_chanceParas",0]];
	_temp = [_coords,_aiSkillsLevel,_weapons,_uniforms,_headgear,_missionHelis,_chancePara] call blck_fnc_spawnMissionHeli; 
	if (typeName _temp isEqualTo "ARRAY") then
	{
		_return = [_temp select 0, _temp select 1, _temp select 2];
	}
	else
	{
		_return = [objNull, [], true];
	};

	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then {diag_log format["_fnc_spawnMissionReinforcements (66): blck_fnc_spawnMissionHeli returned value of %1 for _return",_return];};
	#endif

} else {
		if (blck_debugLevel > 2) then {diag_log "_fnc_spawnMissionReinforcements (68): calling _fnc_spawnMissionParatroops to spawn para reinforcements";};
		_temp = [objNull,[],false];
		// params["_coords","_skillAI","_weapons","_uniforms","_headgear"];
		_temp = [_coords,_aiSkillsLevel,_weapons,_uniforms,_headgear] call blck_fnc_spawnMissionParatroops;

		#ifdef blck_debugMode
		if (blck_debugLevel > 2) then {
			diag_log format["_fnc_spawnMissionReinforcements (71):: blck_fnc_spawnMissionParatroops returned value for _paratroops of %1",_temp];
		};
		#endif

		if (typeName _temp isEqualTo "ARRAY") then
		{
			_return = [objNull, _temp select 0 /*units*/, _temp select 1 /*true/false*/];
		} else {
			_return = [objNull, [],true];
		};
};	

#ifdef blck_debugMode
if (blck_debugLevel > 1) then {diag_log format["_fnc_spawnMissionReinforcements (74):: _return = %1",_return];};
#endif

_return
