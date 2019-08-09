/*
	By Ghostrider [GRG]
	Copyright 2016
	
	spawns a vehicle of _vehType and mans it with units in _group.
	returns _veh, the vehicle spawned.
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_center","_pos",["_vehType","I_G_Offroad_01_armed_F"],["_minDis",40],["_maxDis",60],["_group",grpNull],["_setWaypoints",true],["_crewCount",4]];

//_center  Center of the mission area - this is usuall the position treated as the center by the mission spawner. Vehicles will patrol the perimeter of the mission area.
// _pos the approximate spawn point for the vehicle
//_vehType = [_this,1,"I_G_Offroad_01_armed_F"] call BIS_fnc_param; 
//_minDis = minimum distance from the center of the mission for vehicle waypoints
//_maxDis = maximum distance from the center of the mission for vehicle waypoints
//_groupForVehiclePatrol = The group with which to man the vehicle
// _crewCount = the number of AI including driver and gunners to place in the vehicle

private["_veh"];
if !(isNull _group) then {
	_veh = [_vehType,_pos] call blck_fnc_spawnVehicle;
	diag_log format["_fnc_spawnVehiclePatrol: _veh = %1 | typeOf _ve = %2",_veh,typeOf _veh];
	_veh addMPEventHandler["MPHit",{ _this call blck_EH_AIVehicle_HandleHit}];
	_veh addMPEventHandler["MPKilled",{_this call blck_EH_vehicleKilled}];
	_veh addEventHandler["GetOut",{_this remoteExec["blck_EH_vehicleGetOut",2]}];
	_veh setVariable["blck_vehicleSearchRadius",blck_playerDetectionRangeGroundVehicle];
	_veh setVariable["blck_vehiclePlayerDetectionOdds",blck_vehiclePlayerDetectionOdds];
	private _maxCrew = [_crewCount] call blck_fnc_getNumberFromRange;
	//_group setVariable["groupVehicle",_veh];
	private _seats = [_vehType,true] call BIS_fnc_crewCount; 
	//_unitNumber = 0;
	//diag_log format["_fnc_spawnVehiclePatrol: _veh = %1 | _maxCrew = %2 | _seats = %3",_veh,_maxCrew,_seats];
	
	{
			//_x addEventHandler["GetOutMan",{_this remoteExec["blck_EH_vehcleManGetOut",2]}]; 
			_x setVariable["GRG_vehicle",_veh];
			//diag_log format["_fnc_spawnVehiclePatrol: _x getVariable 'GRG_vehicle' = %1 | typeOf (_x getVariable 'GRG_vehicle' = %1)  = %2",_x getVariable 'GRG_vehicle',typeOf (_x getVariable 'GRG_vehicle')];
			switch (_forEachIndex) do
			{
				case 0: {_x moveingunner _veh;};
				case 1: {_x moveindriver _veh;};
				case {_forEachIndex >= _seats - 1}: {
					//diag_log format["_fnc_spawnVeiclePatrol: deleteing excess crew: _veh = %1 | _forEachIndex = %2 | _seats = %3",_veh,_forEachIndex,_seats];
					deleteVehicle _x;
					};  // delete any excess AI
				default {_x moveInCargo _veh;};
			};
			// _this remoteExec ["blck_fnc_processAIKill",2];
	}forEach (units _group);  //  

	_group setcombatmode "RED";
	_group setBehaviour "COMBAT";
	if (_setWaypoints) then
	{
		// params["_pos","_minDis","_maxDis","_group",["_mode","random"],["_wpPatrolMode","SAD"],["_soldierType","null"] ];
		[_center,_minDis,_maxDis,_group,"perimeter","SAD","vehicle"] spawn blck_fnc_setupWaypoints;
	};
};

_veh


