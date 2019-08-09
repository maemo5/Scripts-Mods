/*
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
// assumptions: there are no crew in vehicle. there are no players in vehicle. thus we can just be sure the owner is the server then set the lock locally
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_vehicle"];
//diag_log format["_fnc+unlockServerVehicle: _vehicle = %1 | typeOf _vehicle = %2 | crewCount _vehicle = %3",_vehicle,typeOf _vehicle,count(crew _vehicle)];
//[_vehicle,"UNLOCKED"] remoteExec["setVehicleLock", owner _vehicle];
if !((owner _vehicle) isEqualTo 2) then {_vehicle setOwner 2};
_vehicle lock 0;
//diag_log format["_fn_unlockServerVehicle: owner of vehicle %1 = %2",_vehicle, owner _vehicle];
//diag_log format["_fn_unlockServerVehicle: vehicle %1 lock state set to %2",_vehicle,locked _vehicle];
