_SCRAP_BIKE = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "SCRAP_BIKE");

if (_SCRAP_BIKE isEqualTo 1) then{
	if (ExileClientPlayerMoney < 20000) then {
		deletevehicle cursorTarget;
		player playMove "AinvPknlMstpSnonWnonDr_medic3";
		uiSleep 4;
		["Success",["Search the ground for your junk metal"]] call ExileClient_gui_notification_event_addNotification;
		_metal = "weaponholdersimulated" createVehicle position player;
		_metal addItemCargoGlobal ["Exile_Item_JunkMetal", 1];
		} else {
		["Whoops",["You're a little too rich for that"]] call ExileClient_gui_notification_event_addNotification;
	};
} else{
["Disabled",["This Script is disabled on this server"]] call ExileClient_gui_notification_event_addNotification;
};