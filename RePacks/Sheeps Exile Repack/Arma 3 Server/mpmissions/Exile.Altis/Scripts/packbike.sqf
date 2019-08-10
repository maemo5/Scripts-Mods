_PACK_BIKE = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "PACK_BIKE");

if (_PACK_BIKE isEqualTo 1) then{
	if !((vehicle player) isEqualTo player) exitWith {}; //MAKE SURE WE ARE ON FEET

	if (typeOf cursorTarget == "Exile_Bike_MountainBike") then {
		deletevehicle cursorTarget;
		player playMove "AinvPknlMstpSnonWnonDr_medic3";
		player linkItem "ItemRadio";
		uiSleep 1;
		["Success",["Personal Bike packed! Radio added!"]] call ExileClient_gui_notification_event_addNotification;
	};
} else{
["Disabled",["This Script is disabled on this server"]] call ExileClient_gui_notification_event_addNotification;
};