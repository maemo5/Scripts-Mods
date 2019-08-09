/*
	_fnc_alertGroupUnits
	by Ghostrider
	Alerts the units of a group of the location of an enemy.
	 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params[["_unit",objNull],["_target",objNull]];
if (isNull _unit) exitWith {};
//diag_log format["_fnc_alertGroupUnits: _unit = %1 | _target = %2",_unit,_target];
{
	_x reveal [_target,(_x knowsAbout _target) + (_unit getVariable ["intelligence",1])];
}forEach (units (group _unit));


