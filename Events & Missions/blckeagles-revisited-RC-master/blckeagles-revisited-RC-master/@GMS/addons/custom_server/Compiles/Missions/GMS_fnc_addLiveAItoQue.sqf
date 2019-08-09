/*
	Adds a list of live AI associated with a mission to a que of live AI that will be deleted at a later time by the main thread
	call as [ [list of AI], time] call blck_fnc_addLiveAItoQue; where time is the time delay before deletion occurs
	
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

//diag_log format["_fnc_addLiveAIToQue:: -> when called, blck_liveMissionAI = %1",blck_liveMissionAI];
params["_aiList","_timeDelay"];
//diag_log format["_fnc_addLiveAIToQue::  -->> _aiList = %1 || _timeDelay = %2",_aiList,_timeDelay];
blck_liveMissionAI pushback [_aiList, (diag_tickTime + _timeDelay)];
//diag_log format["_fnc_addLiveAIToQue:: -> blck_fnc_addLiveAI updated to %1",blck_liveMissionAI];

