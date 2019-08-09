/*

	[_missionEmplacedWeapons,_noEmplacedWeapons,_aiDifficultyLevel,_coords,_uniforms,_headGear] call blck_fnc_spawnEmplacedWeaponArray;
	By Ghostrider [GRG]
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_missionEmplacedWeapons","_useRelativePos","_noEmplacedWeapons","_aiDifficultyLevel",["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]]];
if (_uniforms isEqualTo []) 		then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])		then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo []) 			then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) 		then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};
if (_weaponList  isEqualTo []) 	then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo []) 		then {[_aiDifficultyLevel] call blck_fnc_selectAISidearms};

#ifdef blck_debugMode
if (blck_debugLevel >=2) then
{
	private _params = ["_coords","_missionEmplacedWeapons","_useRelativePos","_noEmplacedWeapons","_aiDifficultyLevel","_uniforms","_headGear","_vests","_backpacks","_weaponList","_sideArms"];
	{
		diag_log format["blck_fnc_spawnEmplacedWeaponArray:: param %1 | isEqualTo %2 | _forEachIndex %3",_params select _forEachIndex,_this select _forEachIndex, _forEachIndex];
	}forEach _this;
};
#endif

private["_return","_emplacedWeps","_emplacedAI","_wep","_units","_gunner","_abort","_pos","_mode","_useRelativePos","_useRelativePos"];
_emplacedWeps = [];
_emplacedAI = [];
_units = [];
_abort = false;
_pos = [];

#ifdef blck_debugMode
//diag_log "_fnc_spawnEmplacedWeaponArray start";
#endif

// Define _missionEmplacedWeapons if not already configured.
if (_missionEmplacedWeapons isEqualTo []) then
{
	_missionEmplacedWeaponPositions = [_coords,_noEmplacedWeapons,35,50] call blck_fnc_findPositionsAlongARadius;
	#ifdef blck_debugMode
	if (blck_debugLevel > 1) then
	{
		diag_log format["_fnc_spawnEmplacedWeaponArray(38): creating random spawn locations: _missionEmplacedWeaponsPositions = %1", _missionEmplacedWeaponPositions];
	};
	#endif
	{
		_static = selectRandom blck_staticWeapons;
		//diag_log format["_fnc_spawnEmplacedWeaponArray: creating spawn element [%1,%2]",_static,_x];
		_missionEmplacedWeapons pushback [_static,_x];
		//diag_log format["_fnc_spawnEmplacedWeaponArray: _mi updated to %1",_missionEmplacedWeapons];
	} forEach _missionEmplacedWeaponPositions;
	_useRelativePos = false;
};

#ifdef blck_debugMode
if (blck_debugLevel > 1) then
{
	diag_log format["_fnc_spawnEmplacedWeaponArray(52):: starting static weapon spawner with _missionEmplacedWeapons = %1", _missionEmplacedWeapons];
};
#endif

{
	if (_useRelativePos) then 
	{
		_pos = _coords vectorAdd (_x select 1);
	} else {
		_pos = (_x select 1);
	};

	#ifdef blck_debugMode
	if (blck_debugLevel > 1) then
	{
		diag_log format["_fnc_spawnEmplacedWeaponArray(67)::  _coords = %1 | offset = %2 | final _pos = %3",_coords,_x select 1, _pos];
	};
	#endif
	#define configureWaypoints false
	#define minAI 1
	#define maxAI 1
	#define minDist 1
	#define maxDist 2
	
	/// // params["_pos",  "_center", _numai1,  _numai2,  _skillLevel, _minDist, _maxDist, _configureWaypoints, _uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms, _scuba ];
	_empGroup = [(_x select 1),_pos,minAI,maxAI,_aiDifficultyLevel,minDist,maxDist,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call blck_fnc_spawnGroup;
	
	_empGroup setcombatmode "RED";
	_empGroup setBehaviour "COMBAT";
	[(_x select 1),0.01,0.02,_empGroup,"random","SAD","emplaced"] spawn blck_fnc_setupWaypoints;
	if (isNull _empGroup) exitWith {_abort = true};

	// params["_vehType","_pos",["_clearInventory",true]];
	private _wep = [(_x select 0),[0,0,0],false,true] call blck_fnc_spawnVehicle;
	_wep addMPEventHandler ["MPHit",{[_this] call blck_EH_AIVehicle_HandleDamage}];
	_wep addEventHandler["GetOut",{_this remoteExec["blck_EH_vehicleGetOut",2]}];
	//_wep setVariable["vehicleGroup",_empGroup];
	_wep setVariable["GRG_vehType","emplaced"];	
	_wep setPos _pos;
	_wep setdir (random 359);
	[_wep,false] call blck_fnc_configureMissionVehicle;	
	_emplacedWeps pushback _wep;
	_units = units _empGroup;
	_gunner = _units select 0;
	_gunner moveingunner _wep;
	_gunner setVariable["GRG_vehType","emplaced"];
	_gunner setVariable["GRG_vehicle",_wep];
	//_gunner addEventHandler["GetOutMan",{_this remoteExec["blck_EH_vehcleManGetOut",2]}]; 	
	_emplacedAI append _units;		
} forEach _missionEmplacedWeapons;
blck_monitoredVehicles append _emplacedWeps;
_return = [_emplacedWeps,_emplacedAI,_abort];
_return
