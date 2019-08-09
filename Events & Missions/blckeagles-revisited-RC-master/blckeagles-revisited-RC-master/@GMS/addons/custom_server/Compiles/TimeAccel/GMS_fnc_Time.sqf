/*
	GMS_fnc_time.sqf
	by Ghostrider-GRG-

	Credits to AWOL, A3W, LouD and Creampie for insights.

*/

/*
	blck_timeAcceleration = true; // When true, time acceleration will be periodically updated based on amount of daylight at that time according to the values below 
								  // which can be set using the corresponding variables in the config file for that mod.
	
	blck_timeAccelerationDay = 1;  // Daytime time accelearation
	blck_timeAccelerationDusk = 3; // Dawn/dusk time accelearation
	blck_timeAccelerationNight = 6;  // Nighttim time acceleration
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_arr","_sunrise","_sunset","_time"];
_arr = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _arr select 0;
_sunset = _arr select 1;
_time = dayTime;


//  blck_debugMode3
#ifdef blck_debugMode
if (blck_debugLevel >= 2) then
{
	diag_log "fnc_Time:: Debug settings ON";
	diag_log format["_fnc_Time:: --> blck_useTimeAcceleration = %1", blck_useTimeAcceleration];
	diag_log format["_fnc_Time::  -- > _sunrise = %1 | _sunset = %2 | _time = %3",_sunrise,_sunset,_time];
};
#endif

// Night
if (_time > (_sunset + 0.5) || _time < (_sunrise - 0.5)) exitWith {
	setTimeMultiplier blck_timeAccelerationNight; 
	#ifdef blck_debugMode
	if (blck_debugLevel >= 2) then
	{
		diag_log format["NIGHT TIMGE ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];
	};
	#endif
};

// Day
if (_time > (_sunrise + 0.5) && _time < (_sunset - 0.5)) exitWith {
	setTimeMultiplier blck_timeAccelerationDay; 
	//diag_log format["DAYTIME ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];	
	#ifdef blck_debugMode
	if (blck_debugLevel >= 2) then
	{
		diag_log format["DAYTIME ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];
	};
	#endif
};

// default
setTimeMultiplier blck_timeAccelerationDusk; 
#ifdef blck_debugMode
if (blck_debugLevel >= 2) then
{
	diag_log format["DUSK ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];
};
#endif


