ChaosPilot_LoiterInfoTemp =  [-1,-1,-1];
ChaosPilot_LoiterInfo = [[-1,-1,-1],0, 0, 0]; //[position of marker, radius index, heigh index, side index] the radius and height is the index of the LOITER_HEIGHTS and LOITER_RADIUSES arrays
ChaosPilot_LoiterMarkerNameTemp = "CPLoiterMk1Temp";
ChaosPilot_LoiterMarkerName = "CPLoiterMk1";

// ChaosPilot_map_click_handler =
// [
	// "SetLoiterPointer","onMapSingleClick",
	// {
		// if (_shift && (vehicle player isKindOf "Plane")) then {
			// _worldSize = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} else {8192;};
			// if (_pos select 0 > _worldSize || _pos select 1 > _worldSize ||_pos select 0 < 0 || _pos select 1 < 0) then
			// {
				// hint "Selected point not inside map";
			// }
			// else
			// {
				// _CanOn = player call ChaosPilot_fnc_CanOnAutoLoiter;
				// if (_CanOn isEqualTo 0) then
				// {
					// ChaosPilot_MapClickLocation = _pos;
					// _handle = [] spawn ChaosPilot_fnc_ShowLoiterDialog;
				// };
			// };
		// };
	// }
// ] call BIS_fnc_addStackedEventHandler; 


player addAction ["<t color='#00FF00'>Auto Loiter Console</t>", {player call ChaosPilot_fnc_ShowLoiterDialog;}, [], 1, false, true, "", "(player call ChaosPilot_fnc_CanOnAutoLoiter) == 0"];
player addAction ["<t color='#FF0000'>Turn Off Loiter</t>", {[1] call ChaosPilot_fnc_AutoLoiterOff}, [], 1, false, true, "", "player call ChaosPilot_fnc_CanOffAutoLoiter"];