/*
	Author: maca134

	Description:
	Trigger init
*/

if (!isNil 'TRG_init') exitWith {};
TRG_init = true;
TRG_triggers = [];
TRG_pointer = 0;
TRG_interval = 5;
TRG_debug = false;
diag_log 'TRG: Init';
switch true do {
	case (!isNil 'LOP_fnc_add'): {
		[{call TRG_fnc_checkTriggers}, [], TRG_interval, 'Trigger System'] call LOP_fnc_add;
	};
	case (!isNil 'ExileServer_system_thread_addTask'): {
		[TRG_interval, {call TRG_fnc_checkTriggers}, [], true] call ExileServer_system_thread_addTask;
	};
	default {
		[] spawn {
			while {true} do {
				call TRG_fnc_checkTriggers;
				uiSleep TRG_interval;
			};
		};
	};
};