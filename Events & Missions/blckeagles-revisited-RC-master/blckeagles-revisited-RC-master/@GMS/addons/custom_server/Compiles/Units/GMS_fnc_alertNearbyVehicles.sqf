/*
	_fnc_alertNearbyVehicles
	by Ghostrider
	 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params[["_target",objNull]];
//diag_log format["_fnc_alertNearbyVehicles: _target = %1 | typeName _target = %2",_target,typeName _target];
if (isnull _target) exitWith {};
private _nearestVehicles = (nearestObjects [getPos _target,["Car","Truck","Tank","Ship"],300]);
if (_nearestVehicles isEqualTo []) exitWith {};
private _nearestVehicle = _nearestVehicles select 0;
//diag_log format["_fnc_alertNearbyVehicles: _target = %1 | _nearestVehicle = %2",_target,_nearestVehicle];
[(crew _nearestVehicle) select 0,_target] call blck_fnc_alertGroupUnits;




