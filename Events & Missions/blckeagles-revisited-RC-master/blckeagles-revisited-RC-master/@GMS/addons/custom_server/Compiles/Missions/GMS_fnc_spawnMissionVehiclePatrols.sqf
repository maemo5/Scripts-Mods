/*
	blck_fnc_spawnMissionVehiclePatrols
	by Ghostrider [GRG]
	returns [] if no groups could be created
	returns [_AI_Vehicles,_missionAI] otherwise;
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
// params["_pos",  "_center", ["_numai1",5],  ["_numai2",10],  ["_skillLevel","red"], ["_minDist",20], ["_maxDist",35],["_configureWaypoints",true], ["_uniforms",blck_SkinList], ["_headGear",blck_headgear],["_vests",blck_vests],["_backpacks",blck_backpacks],["_weaponList",[]],["_sideArms",blck_Pistols], ["_scuba",false] ];
params["_coords","_noVehiclePatrols","_skillAI","_missionPatrolVehicles",["_useRelativePos",true],["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]], ["_isScubaGroup",false],["_crewCount",4]];
//diag_log format["_fnc_spawnMissionVehiclePatrols: _this = %1",_this];
if (_uniforms isEqualTo []) 		then {_uniforms = [_skillAI] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])		then {_headGear = [_skillAI] call blck_fnc_selectAIHeadgear};
if (_vests isEqualTo []) 			then {_vests = [_skillAI] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) 		then {_backpacks = [_skillAI] call blck_fnc_selectAIBackpacks};
if (_weaponList  isEqualTo []) 	then {_weaponList = [_skillAI] call blck_fnc_selectAILoadout};
if (_sideArms isEqualTo []) 		then {[_skillAI] call blck_fnc_selectAISidearms};

private["_vehGroup","_patrolVehicle","_vehiclePatrolSpawns","_missionAI","_missiongroups","_vehicles","_return","_vehiclePatrolSpawns","_vehicle","_return","_abort","_spawnPos","_v"];
_vehicles = [];
_missionAI = [];
_abort = false;
if (_missionPatrolVehicles isEqualTo []) then
{
	_useRelativePos = false;
	_vehiclePatrolSpawns = [_coords,_noVehiclePatrols,45,60] call blck_fnc_findPositionsAlongARadius;
	{
		_v = [_skillAI] call blck_fnc_selectPatrolVehicle;
		_missionPatrolVehicles pushBack [_v, _x];
	}forEach _vehiclePatrolSpawns;
};
#define configureWaypoints false
{
	#ifdef blck_debugMode
	if (blck_debugLevel > 1) then 
	{
		diag_log format["_fnc_spawnMissionVehiclePatrols:: _x = %1 and _coords = %2",_x,_coords];
	};
	#endif

	if (_useRelativePos) then
	{
		_spawnPos = _coords vectorAdd (_x select 1)
	} else {
		_spawnPos = _x select 1;
	};
	_vehicle = _x select 0;
	//private _crewCount = [skillAI] call GMS_fnc_selectVehicleCrewCount;
	// params["_pos",  "_center", _numai1,  _numai2,  _skillLevel, _minDist, _maxDist, _configureWaypoints, _uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms, _scuba ];
	_vehGroup = [_spawnPos,_coords,_crewCount,_crewCount,_skillAI,1,2,false,_uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
	if (isNull _vehGroup) exitWith 
	{
		_abort = true;
	};

	blck_monitoredMissionAIGroups pushBack _vehGroup;

	//params["_center","_pos",["_vehType","I_G_Offroad_01_armed_F"],["_minDis",40],["_maxDis",60],["_group",grpNull],["_setWaypoints",true],["_crewCount",4]];
	_patrolVehicle = [_coords,_spawnPos,_vehicle,40,60,_vehGroup,true,_crewCount] call blck_fnc_spawnVehiclePatrol;  //  

	if !(isNull _patrolVehicle) then
	{
		_patrolVehicle setVariable["vehicleGroup",_vehGroup];
		_vehicles pushback _patrolVehicle;
		blck_monitoredVehicles pushBack _patrolVehicle;
		_missionAI append (units _vehGroup);
	};
} forEach _missionPatrolVehicles;
 
_return = [_vehicles, _missionAI, _abort];

_return
