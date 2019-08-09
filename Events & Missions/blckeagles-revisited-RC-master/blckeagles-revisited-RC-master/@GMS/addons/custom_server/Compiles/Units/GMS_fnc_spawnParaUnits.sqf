/*
	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
	--------------------------
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_pos","_numAI","_skillAI",["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScuba",false]];

if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

private["_arc","_dir","_spawnPos","_chute","_unit","_return","_paraGroup"];
private _params = ["_pos","_numAI","_skillAI"];
#ifdef blck_debugMode
{
	diag_log format["_fnc_spawnParaUnits: %1 = %2",_x, _this select _forEachIndex];
}forEach _params;
#endif
_paraGroup = call blck_fnc_create_AI_Group;
//diag_log format["_fnc_spawnParaUnits: _paraGroup = %1",_paraGroup];
//  [_pos,_minDist,_maxDist,_groupSpawned,"random","SAD"] spawn blck_fnc_setupWaypoints;
[_pos,20,30,_paraGroup,"random","SAD","paraUnits"] call blck_fnc_setupWaypoints;

#define launcherType "none"
private ["_arc","_spawnPos"];
_arc = 45;
_dir = 0;

for "_i" from 1 to _numAI do
{
	_spawnPos = _pos getPos[1,_dir];
	_chute = createVehicle ["Steerable_Parachute_F", [_spawnPos select 0, _spawnPos select 1, 250], [], 0, "FLY"];
	[_chute] call blck_fnc_protectVehicle;
	// ["_pos","_aiGroup",["_skillLevel","red"],["_uniforms", blck_SkinList],["_headGear",blck_headgear],["_vests",blck_vests],["_backpacks",blck_backpacks],["_Launcher","none"],["_weaponList",[]],["_sideArms",[]],["_scuba",false]];
	_unit = [getPos _chute,_paraGroup,_skillAI,_uniforms,_headGear,_vests,_backpacks,launcherType,_weapons,_sideArms,_isScuba] call blck_fnc_spawnUnit;
	
	#ifdef blck_debugMode
	diag_log format["_fnc_spawnParaUnits: unit %1 = %2 dropping in chute %3",_i,_unit,_chute];
	#endif
	
	//_chute setPos [_spawnPos select 0, _spawnPos select 1, 125];  //(_offset select 2) - 10];
	_unit assignAsDriver _chute;
	_unit moveInDriver _chute;
	//_unit allowDamage true;
	_unit setVariable["chute",_chute];
	_dir = _dir + _arc;
	
	uiSleep 2;
};


blck_monitoredMissionAIGroups pushback _paraGroup;

_paraGroup
