/*
	By Ghostrider [GRG]

	Handles the case where a unit is hit.

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
if !(isServer) exitWith {};
private ["_unit","_instigator","_group","_wp"];
_unit = _this select 0 select 0;
_instigator = _this select 0 select 3;
//diag_log format["_fnc_processAIHit:(19): _units = %1 and _instigator = %2 units damage is %3",_unit,_instigator, damage _unit];
//if (true) exitWith {};

//diag_log format["_fnc_processAIHit: evaluating case of ai not alive"];
if (!(alive _unit)) exitWith {
	//diag_log format["_fnc_processAIHit: _unit %1 is dead",_unit];
	[_unit, _instigator] call blck_fnc_processAIKill;
};
//diag_log format["_fnc_processAIHit: evaluating case of damage > 0.95"];
if (damage _unit > 0.95) exitWith {
	//diag_log format["_fnc_processAIHit: _unit %1 extensively damagged",_unit];
	_unit setDamage 1.2; [_unit, _instigator] call blck_fnc_processAIKill;
};
//diag_log format["_fnc_processAIHit: evaluating case of killer not player"];
if !(isPlayer _instigator) exitWith {
	//diag_log format["_fnc_procesAIHit: _instigator %1 not player",_instigator];
};

//diag_log format["_processAIHit: calling [_unit,_instigator] call blck_fnc_alertGroupUnits with _unit = %1 and _instigator = %2",_unit,_instigator];
[_unit,_instigator,50] call GMS_fnc_alertNearbyGroups;
[_instigator] call blck_fnc_alertNearbyVehicles;
//diag_log format["_fnc_processAIHit: updating group and waypoint settings"];
_group = group _unit;
_wp = [_group, currentWaypoint _group];
_wp setWaypointBehaviour "COMBAT";
_group setCombatMode "RED";
_wp setWaypointCombatMode "RED";

//diag_log format["_fnc_processAIHit: determining if prior heal has occured"];
if (_unit getVariable ["hasHealed",false]) exitWith {
	diag_log format["_fnc_processAIHit: _unit %1 has already healed one",_unit];
};
//diag_log format["_fnc_processAIHit: no prior heal so evaluate whether one is needed"];
if ((damage _unit) > 0.2 ) then
{
	//diag_log format["_EH_AIHit::-->> Healing unit %1",_unit];
	_unit setVariable["hasHealed",true,true];
	"SmokeShellRed" createVehicle (position _unit);
	_unit addItem "FAK";
	_unit action ["HealSoldierSelf",  _unit];
	_unit setDamage 0;
	_unit removeItem "FAK";
};

