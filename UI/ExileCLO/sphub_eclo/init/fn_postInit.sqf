_mobilexm8slide = {
	waitUntil{getClientStateNumber >= 10 && !isNull findDisplay 46 && !isNil "ExileClientLoadedIn"};
	uiSleep 3;
	_code = {
		_display = uiNamespace getVariable ["RscExileXM8", displayNull];
		if(!isNull _display)then
		{
      _ctrl = _display displayCtrl 1104;
			_ctrl ctrlRemoveAllEventHandlers "ButtonClick";
			_ctrl ctrlSetText "Sphub Xm8";
			_ctrl ctrlSetEventHandler ["ButtonClick","call Sphub_MobileXm8;"];
			_ctrl ctrlCommit 0;
		};
	};
	if(!isNil"sphub_eclo")then{[sphub_eclo] call ExileClient_system_thread_removeTask;sphub_eclo=nil;};
	sphub_eclo = [0.1, _code, [], true] call ExileClient_system_thread_addtask;
};
["",_mobilexm8slide] remoteExecCall ["spawn",-2,"fnc_sphub_eclo_JIPID"];
true
