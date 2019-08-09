/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	checks the status of each entry in 
/*
	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

#ifdef blck_debugMode
if (blck_debugLevel >= 2) then {
	//diag_log format["_fnc_spawnPendingMissions:: count blck_pendingMissions = %1", count blck_pendingMissions];
};
#endif

if (blck_missionsRunning >= blck_maxSpawnedMissions) exitWith {

	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then {
		//diag_log "_fnc_spawnPendingMissions:: --- >> Maximum number of missions is running; function exited without attempting to find a new mission to spawn";
	};
	#endif
};

private["_coords","_compiledMission","_search","_readyToSpawnQue","_missionToSpawn","_allowReinforcements"];
_readyToSpawnQue = [];
{                      //          0                 1                2          3     3      5         6     
	// _mission = [_compiledMissionsList,format["%1%2",_marker,_i],_difficulty,_tMin,_tMax,_waitTime,[0,0,0]];
	//diag_log format["_fnc_spawnPendingMissions: diag_tickTime %6 _marker %1 _difficulty %2 _tMin %3 _tMax %4 _waitTime %5",_x select 1, _x select 2, _x select 3, _x select 4, _x select 5, diag_tickTime];
	if ( (diag_tickTime > (_x select 5)) && ((_x select 5) > 0) ) then 
	{
		_readyToSpawnQue pushback _x;
		//diag_log format["_fnc_spawnPendingMissions: adding mission with _marker %1 _difficulty %2",_x select 1, _x select 2];
		//diag_log format["_fnc_spawnPendingMissions: count _readyToSpawnQue = %1",count _readyToSpawnQue];
	};
} forEach blck_pendingMissions;
#ifdef blck_debugMode
if (blck_debugLevel > 2) then 
{
	//diag_log format["_fnc_spawnPendingMissions:: --- >> _readyToSpawnQue diag_tickTime %6 _marker %1 _difficulty %2 _tMin %3 _tMax %4 _waitTime %5",_readyToSpawnQue select 1, _readyToSpawnQue select 2, _readyToSpawnQue select 3, _readyToSpawnQue select 4, _readyToSpawnQue select 5, diag_tickTime];
};
#endif
//diag_log format["_fnc_spawnPendingMissions: count _readyToSpawnQue = %1", count _readyToSpawnQue];
if (count _readyToSpawnQue > 0) then
{
	_missionToSpawn = selectRandom _readyToSpawnQue;

	#ifdef blck_debugMode
	{
		if (blck_debugLevel > 2) then
		{
			if (_foreachindex > 0) then {diag_log format["_fnc_spawnPendingMissions: _missionToSpawn %1 = %2",_foreachindex, _missionToSpawn select _foreachindex]};
		};
	}forEach _missionToSpawn;
	#endif

	_coords = [] call blck_fnc_FindSafePosn;
	_coords pushback 0;	
	_compiledMission = selectRandom (_missionToSpawn select 0);
	// 	_mission = [_compiledMissionsList,format["%1%2",_marker,_i],_difficulty,_tMin,_tMax,_waitTime,[0,0,0]];
	_missionMarker = _missionToSpawn select 1;
	_missionDifficulty = _missionToSpawn select 2;
	[_coords,_missionMarker,_missionDifficulty] spawn _compiledMission;
};

true
