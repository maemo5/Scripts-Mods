/*
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_leaderConfigs"];
private["_leader","_building","_result"];
_leader = [_coords, _leaderConfigs] call blck_fnc_spawnCharacter;
_leader remoteExec["GMS_fnc_initLeader", -2, true];
_leader setVariable["assetType",2,true];
_leader setVariable["endAnimation",["Acts_CivilShocked_1"],true];
//diag_log format["_fnc_spawnLeader:  _leaderConfigs = %1",_leaderConfigs];
_building = [_leader,_coords,_leaderConfigs select 7] call blck_fnc_placeCharacterInBuilding;
//diag_log format["_fnc_spawnLeader:  _building = %1",_building];
_result = [_leader,_building];
_result


