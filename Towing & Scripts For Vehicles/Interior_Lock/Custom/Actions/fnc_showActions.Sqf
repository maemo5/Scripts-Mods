[] spawn {
	while {true} do {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};

			LOCK_ACTION = player addAction ["<t>Lock</t>", "true spawn Exile_fnc_lock_toggle","",-10,true,true,"","vehicle player != player && locked cameraOn isEqualTo 0"];
			UNLOCK_ACTION = player addAction ["<t>Unlock</t>", "false spawn Exile_fnc_lock_toggle","",-10,true,true,"","vehicle player != player && locked cameraOn isEqualTo 2"];

		waitUntil{!alive player};
		player removeAction LOCK_ACTION;
		player removeAction UNLOCK_ACTION;
	};
};
