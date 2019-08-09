
/*
	Checks for groups that have not reached their waypoints within a proscribed period
	and redirects them.

	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
// TODO: Add pushBack for groups spawned at static missions.

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

_fn_waypointComplete = {
	private _group = _this select 0;
	private _wp = currentWaypoint _group;
	private _done = if (currentWaypoint _group) > (count (waypoints _group)) then {true} else {false};
	_done
};

{
	private["_timeStamp","_index","_unit","_soldierType"];
	if ( !(_x isEqualTo grpNull) && ({alive _x} count (units _x) > 0) ) then
	{
	/*
	#define blck_turnBackRadiusInfantry 800
	#define blck_turnBackRadiusVehicles 1000
	#define blck_turnBackRadiusHelis 1000
	#define blck_turnBackRadiusJets 1500
	*/
	diag_log format["_fn_monitorGroupWaypoints - radii: on foot %1 | vehicle %2 | heli %3 | jet %4",blck_turnBackRadiusInfantry,blck_turnBackRadiusVehicles,blck_turnBackRadiusHelis,blck_turnBackRadiusJets];
	_timeStamp = _x getVariable ["timeStamp",0];
	if (_timeStamp isEqualTo 0) then {
		_x setVariable["timeStamp",diag_tickTime];
		//diag_log format["_fn_monitorGroupWaypoints::--> updating timestamp for group %1 at time %2",_x,diag_tickTime];
	};
	_soldierType = _x getVariable["soldierType","null"];
	//diag_log format["_fn_monitorGroupWaypoints::--> soldierType for group %1 = %2 and timeStamp = %3",_x,_soldierType,_timeStamp];
	switch (soldierType) do
	{
		case "infantry": {[_x, 60] call GMS_fnc_checkGroupWaypointStatus;};
		case "vehicle": {[_x, 90, 800] call GMS_fnc_checkGroupWaypointStatus;};
		case "aircraft": {_[_x, 90, 1000] call GMS_fnc_checkGroupWaypointStatus;};
	};
	_private _updateNeeded = if (diag_tickTime > (_x getVariable "timeStamp") + 60) then
} forEach blck_monitoredMissionAIGroups;

