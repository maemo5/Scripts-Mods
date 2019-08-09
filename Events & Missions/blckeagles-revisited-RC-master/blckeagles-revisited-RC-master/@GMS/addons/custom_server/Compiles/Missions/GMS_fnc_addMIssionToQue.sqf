/*
	Adds the basic list of parameters that define a mission such as the marker name, mission list, mission path, AI difficulty, and timer settings, to the arrays that the main thread inspects.
	
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
//params["_missionList","_compiledMission","_compiledMissionsList","_waitTime","_mission","_path","_marker","_difficulty","_tMin","_tMax",["_noMissions",1]];
params["_missionList","_path","_marker","_difficulty","_tMin","_tMax",["_noMissions",1]];
private["_compiledMission","_compiledMissionsList"];
_compiledMissionsList = [];
for "_i" from 1 to _noMissions do
{
	_waitTime = diag_tickTime + (_tMin) + random((_tMax) - (_tMin));
						// 0		  1		2						3			4		5		6		7	   8
	//_mission = [_missionList,_path,format["%1%2",_marker,_i],_difficulty,_tMin,_tMax,_waitTime,[0,0,0],_allowReinforcements];
	{
		//diag_log format["_fnc_addMissionToQue: _x = %1",_x];
		_compiledMission = compilefinal preprocessFileLineNumbers format["\q\addons\custom_server\Missions\%1\%2.sqf",_path,_x];
		_compiledMissionsList pushBack _compiledMission;
	}forEach _missionList;
	_mission = [_compiledMissionsList,format["%1%2",_marker,_i],_difficulty,_tMin,_tMax,_waitTime,[0,0,0]];
	#ifdef blck_debugMode
	if (blck_debugLevel >= 2) then {
		diag_log format["-fnc_addMissionToQue::-->> _mission = %1",[/*_mission select 0, */_mission select 1, _mission select 2, _mission select 3, _mission select 4, _mission select 5, _mission select 6]];
	};
	#endif
	//diag_log format["-fnc_addMissionToQue::-->> _mission = %1",[ _mission select 1, _mission select 2, _mission select 3, _mission select 4, _mission select 5, _mission select 6]];
	blck_pendingMissions  pushback _mission;
};

#ifdef blck_debugMode
if (blck_debugLevel >= 4) then {diag_log format["_fnc_addMissionToQue::  -- >> Result - blck_pendingMissions = %1",blck_pendingMissions];};
#endif
