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

params["_missionEmplacedWeapons","_noEmplacedWeapons","_aiDifficultyLevel","_coords","_uniforms","_headGear"];
private["_return","_emplacedWeps","_emplacedAI","_wep","_units","_gunner","_abort","_pos","_mode"];
_emplacedWeps = [];
_emplacedAI = [];
_units = [];
_abort = false;
_pos = [];

//diag_log format["_sm_spawnEmplaced <Line 26>:: _missionEmplacedWeapons = %1",_missionEmplacedWeapons];
// Define _missionEmplacedWeapons if not already configured.
if (_missionEmplacedWeapons isEqualTo []) then
{
	_missionEmplacedWeaponPositions = [_coords,_noEmplacedWeapons,35,50] call blck_fnc_findPositionsAlongARadius;
	{
		_static = selectRandom blck_staticWeapons;
		//diag_log format["_fnc_spawnEmplacedWeaponArray: creating spawn element [%1,%2]",_static,_x];
		_missionEmplacedWeapons pushback [_static,_coords vectorAdd _x,_aiDifficultyLevel];
		//diag_log format["_fnc_spawnEmplacedWeaponArray: _mi updated to %1",_missionEmplacedWeapons];
	} forEach _missionEmplacedWeaponPositions;
};
//diag_log format["_sm_spawnEmplaced<Line 38>:: _missionEmplacedWeapons = %1",_missionEmplacedWeapons];
{
	_wepnClassName = _x select 0;
	_pos = _x select 1;
	_difficulty = _x select 2;
	
	//  params["_pos", ["_numai1",5], ["_numai2",10], ["_skillLevel","red"], "_center", ["_minDist",20], ["_maxDist",35], ["_uniforms",blck_SkinList], ["_headGear",blck_headgear] ];
	_empGroup = [_pos,1,1,_difficulty,_pos,1,2,_uniforms,_headGear,false] call blck_fnc_spawnGroup;
	_empGroup setcombatmode "RED";
	_empGroup setBehaviour "COMBAT";
	[_pos,0.01,0.02,_empGroup,"random","SAD","emplaced"] spawn blck_fnc_setupWaypoints;
	//if (isNull _empGroup) exitWith {_abort = _true};
	_wep = [_wepnClassName,[0,0,0],false] call blck_fnc_spawnVehicle;
	//_empGroup setVariable["groupVehicle",_wep];
	_wep setVariable["vehicleGroup",_empGroup];
	_wep setVariable["GRG_vehType","emplaced"];	
	_wep setPosATL _pos;
	[_wep,false] call blck_fnc_configureMissionVehicle;	
	_units = units _empGroup;
	_gunner = _units select 0;
	_gunner moveingunner _wep;	
} forEach _missionEmplacedWeapons;
blck_monitoredVehicles append _emplacedWeps;

true
