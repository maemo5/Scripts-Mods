//created By [TBI]Liam
//Gamersroost

scriptName "Loadout";
_NotificationText = format["You are not in a Safezone"];

if (ExilePlayerInSafezone) then {
    createdialog "Loadout";
}
else {
	["whoops",[_NotificationText]] call ExileClient_gui_notification_event_addNotification;
	playSound "FD_CP_Not_Clear_F";
    breakOut "Loadout";
};

