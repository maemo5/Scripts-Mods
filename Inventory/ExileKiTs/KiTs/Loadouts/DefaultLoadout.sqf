//Created By [TBI]Liam
//Gamersroost

scriptName "DefaultLoadout";

_NotificationText = format["You have been charged 1000 pop tabs"];
_NotificationText2 = format["You're in combat and cannot change clothes!"];
_NotificationText3 = format["You have changed!"];
_NotificationText4 = format["You are in combat! Please wait until you are out of combat"];
_newBalance = ExileClientPlayerMoney - 1000;

if (ExileClientPlayerIsInCombat) then {
["whoops",[_NotificationText4]] call ExileClient_gui_notification_event_addNotification;
};


if (false) then {
    ["whoops",[_NotificationText2]] call ExileClient_gui_notification_event_addNotification;
	playSound "FD_CP_Not_Clear_F";
	breakOut "DefaultLoadout";
};


if (ExileClientPlayerMoney < 1000) then {
_NotificationText1 = format["You do not have enough pop tabs!"];
	["whoops",[_NotificationText1]] call ExileClient_gui_notification_event_addNotification;
	playSound "FD_CP_Not_Clear_F";
    breakOut "DefaultLoadout";
};

 _newPoptabs = ExileClientPlayerMoney - 1000;
ENIGMA_UpdateStats = [player,_newPoptabs];
publicVariableServer "ENIGMA_UpdateStats";
["Success",[_NotificationText]] call ExileClient_gui_notification_event_addNotification;

 
 if (ExileClientPlayerMoney > 999) exitwith {
	 player forceAddUniform "U_B_CTRG_1";
	 player addHeadgear "H_HelmetB_light_snakeskin";
	 sleep 2;
	 player addVest "V_PlateCarrierH_CTRG";
	 sleep 2;
	 player addBackpack "B_Carryall_cbr";
	 sleep 2;
	 player addWeapon "arifle_Katiba_F";
	 sleep 2;
	 player addweapon "hgun_Rook40_F";
	 sleep 2;
	 player addmagazine "30Rnd_65x39_caseless_green";
	 player addmagazine "30Rnd_65x39_caseless_green";
	 player addmagazine "30Rnd_65x39_caseless_green";
	 player addmagazine "30Rnd_65x39_caseless_green";
	 player addmagazine "30Rnd_65x39_caseless_green";
	 player addmagazine "16Rnd_9x21_Mag";
	 player addmagazine "16Rnd_9x21_Mag";
	 sleep 0.5;
	 ["Success",[_NotificationText3]] call ExileClient_gui_notification_event_addNotification;
 };
