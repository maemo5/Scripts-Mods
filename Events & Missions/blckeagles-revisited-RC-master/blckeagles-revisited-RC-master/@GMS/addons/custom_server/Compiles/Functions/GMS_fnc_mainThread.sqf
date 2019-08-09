/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

//diag_log format["starting _fnc_mainThread with time = %1",diag_tickTime];

private["_timer1sec","_timer5sec","_timer20sec","_timer5min","_timer5min"];
_timer1sec = diag_tickTime;
_timer5sec = diag_tickTime;
_timer20sec = diag_tickTime;
_timer1min = diag_tickTime;
_timer5min = diag_tickTime;

while {true} do
{
	uiSleep 1;
	if (diag_tickTime > _timer1sec) then 
	{		
		#ifdef GRGserver
		[] call blck_fnc_broadcastServerFPS;
		#endif
		_timer1sec = diag_tickTime + 1;
	};
	if (diag_tickTime > _timer5sec) then
	{
		_timer5sec = diag_tickTime + 5;
		//[] call blck_fnc_missionGroupMonitor;
		if (blck_simulationManager == blck_useBlckeaglsSimulationManagement) then {call blck_fnc_blckSimulationManager};
		[] call blck_fnc_sm_staticPatrolMonitor;
		[] call blck_fnc_vehicleMonitor;		
	};
	if (diag_tickTime > _timer20sec) then
	{
		[] call blck_fnc_cleanupAliveAI;
		[] call blck_fnc_cleanupObjects;
		[] call blck_fnc_cleanupDeadAI;
		[] call blck_fnc_scanForPlayersNearVehicles;
		[] call GMS_fnc_cleanupTemporaryMarkers;
		[] call GMS_fnc_updateCrateSignals;				
		[] call blck_fnc_cleanEmptyGroups;
		_timer20sec = diag_tickTime + 20;
	};
	if ((diag_tickTime > _timer1min)) then
	{
		_timer1min = diag_tickTime + 60;
		[] call blck_fnc_spawnPendingMissions;
		[] call blck_fnc_cleanEmptyGroups;
		//[] call blck_fnc_groupWaypointMonitor;
		if (blck_dynamicUMS_MissionsRuning < blck_numberUnderwaterDynamicMissions) then {[] spawn blck_fnc_addDyanamicUMS_Mission};
		if (blck_useHC) then {[] call blck_fnc_HC_passToHCs};
		if (blck_useTimeAcceleration) then {[] call blck_fnc_timeAcceleration};
		#ifdef blck_debugMode
		//diag_log format["_fnc_mainThread: active SQFscripts include: %1",diag_activeSQFScripts];
		diag_log format["_fnc_mainThread: active scripts include: %1",diag_activeScripts];
		#endif
	};
	if (diag_tickTime > _timer5min) then 
	{
		diag_log format["[blckeagls] Timstamp %8 |Dynamic Missions Running %1 | UMS Running %2 | Vehicles %3 | Groups %4 | Server FPS %5 | Server Uptime %6 Min | Missions Run %7",blck_missionsRunning,blck_dynamicUMS_MissionsRuning,count blck_monitoredVehicles,count blck_monitoredMissionAIGroups,diag_FPS,floor(diag_tickTime/60),blck_missionsRun, diag_tickTime];
		_timer5min = diag_tickTime + 300;
	};
};
