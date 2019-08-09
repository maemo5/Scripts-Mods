/*
  Delete a unit.
  by Ghostrider
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_veh"];
//diag_log format["blck_fnc_deleteAIvehicle:  _veh %1 deleted",_veh];
{
	_veh removeAllEventHandlers _x;
}forEach ["Hit","HitPart","GetIn","GetOut","Fired","FiredNear","HandleDamage","Reloaded"];
{
	_veh removeAllMPEventHandlers _x;
}forEach ["MPHit","MPKilled"];
blck_monitoredVehicles = blck_monitoredVehicles - [_veh];			
deleteVehicle _veh;
