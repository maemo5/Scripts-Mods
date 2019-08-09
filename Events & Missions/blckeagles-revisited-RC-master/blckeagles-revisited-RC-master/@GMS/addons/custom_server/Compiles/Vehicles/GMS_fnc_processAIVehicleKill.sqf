/*
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_veh","_instigator","_group","_wp"];

_veh = _this select 0 select 0;
_instigator = _this select 0 select 3;
//params["_veh","_instigator"];

{
	_veh removealleventhandlers _x;
} forEach ["GetIn","GetOut","fired","hit","hitpart","reloaded","dammaged","HandleDamage"];
{
	_veh removeAllMPEventHandlers _x;
} forEach ["MPHit","MPKilled"];

diag_log format["_fnc_processAIVehicleKill:  _this = %1",_this];
diag_log format["_fnc_processAIVehicleKill:: _units = %1 and _instigator = %2 units damage is %3",_veh,_instigator, damage _veh];

if (!(isPlayer _instigator)) exitWith {};

if !(count(crew _veh) isEqualTo 0) then
{
	[_crew select 0,_instigator] call blck_fnc_alertGroupUnits;	
	_group setBehaviour "COMBAT";
	_wp = [_group, currentWaypoint _group];
	_wp setWaypointBehaviour "COMBAT";
	_group setCombatMode "RED";
	_wp setWaypointCombatMode "RED";	
};
[_instigator] call blck_fnc_alertNearbyVehicles;



