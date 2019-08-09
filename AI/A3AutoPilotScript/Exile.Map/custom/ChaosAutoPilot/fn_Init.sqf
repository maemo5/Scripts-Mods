ChaosPilot_LoiterInfoTemp =  [-1,-1,-1];
ChaosPilot_LoiterInfo = [[-1,-1,-1],0, 0, 0]; //[position of marker, radius index, heigh index, side index] the radius and height is the index of the LOITER_HEIGHTS and LOITER_RADIUSES arrays
ChaosPilot_LoiterMarkerNameTemp = "CPLoiterMk1Temp";
ChaosPilot_LoiterMarkerName = "CPLoiterMk1";

[] spawn {
	while {true} do {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player}; //All above, code to be sure to wait for the exile client to be fully loaded in.
		
		TRAIN_ACTION_ID = player addAction ["<t color='#00FF00'>Auto Loiter Console</t>", {player call ChaosPilot_fnc_ShowLoiterDialog;}, [], 1, false, true, "", "(player call ChaosPilot_fnc_CanOnAutoLoiter) == 0"];
		TRAIN_ACTION_ID2 = player addAction ["<t color='#FF0000'>Turn Off Loiter</t>", {[1] call ChaosPilot_fnc_AutoLoiterOff}, [], 1, false, true, "", "player call ChaosPilot_fnc_CanOffAutoLoiter"];
		
		waitUntil{!alive player};  
		player removeAction TRAIN_ACTION_ID;
		player removeAction TRAIN_ACTION_ID2;
	};
};


