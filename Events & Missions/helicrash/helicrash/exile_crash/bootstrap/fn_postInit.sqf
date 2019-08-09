/**
 * Post-Initialization
 *
 * Ejik developer addon
 */

_startCrash = getNumber (configFile >> "cfgCrash" >> "options"  >> "startCrash");
_timeNext = time + _startCrash;
missionNamespace setVariable ["heliCrashNextTime",_timeNext];
missionNamespace setVariable ["allCrash",[]];
ExileCrashEventThreadID = [10, ExileServer_object_crash_controllerSpawn, [], true] call ExileServer_system_thread_addtask;
true
