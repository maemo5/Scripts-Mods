/*
	Spawn a vehicle and protect it against cleanup by Epoch
	Returns the object (vehicle) created.
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_veh"];
params["_vehType","_pos",["_clearInventory",true]];

#ifdef blck_debugMode
if (blck_debugLevel > 1) then {diag_log format["spawnVehicle.sqf:  _vehType = %1 | _pos = %2",_vehType,_pos];};
#endif

_veh = createVehicle[_vehType, _pos, [], 0, "NONE"];
_veh setVariable["blck_vehicle",true];
[_veh] call blck_fnc_protectVehicle;
_veh setVariable["blck_vehicleSearchRadius",blck_playerDetectionRangeSubs];
_veh setVariable["blck_vehiclePlayerDetectionOdds",blck_vehiclePlayerDetectionOdds];

#ifdef blck_debugMode
if (blck_debugLevel > 1) then {diag_log format["spawnVehicle.sqf:: vehicle spawned is %1",_veh];};
#endif
//  params["_veh",["_clearInventory",true]];
[_veh,_clearInventory] call blck_fnc_configureMissionVehicle;

#ifdef blck_debugMode
if (blck_debugLevel > 1) then {diag_log format["spawnVehicle:: returning parameter _veh = %1",_veh];};
#endif

_veh
	
