//////////////////////////////////////////////////////
// test if a timeout condition exists.
// [_startTime] call blck_fnc_timedOut
// Returns true (timed out) or false (not timed out)
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
/////////////////////////////////////////////////////

params["_startTime",["_timeoutTime",blck_MissionTimeout]];
private["_return"];
//if ((diag_tickTime - _startTime) > _timeoutTime) then {_return = true} else {_return = false};
_return = ((diag_tickTime - _startTime) > _timeoutTime) ;
_return;
