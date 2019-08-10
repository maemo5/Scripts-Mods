/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines"];
_vehicle = _this select 0;
if (ExileClientPlayerIsInCombat) exitWith
{
        ["RepairFailedWarning", ["You are in combat!"]] call ExileClient_gui_notification_event_addNotification;
};
if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};
_availableHitpoints = _vehicle call ExileClient_util_vehicle_getHitPoints;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;
if (isNil "_fixable") exitWith 
{
	["RepairFailedWarning", ["This vehicle already looks fine."]] call ExileClient_gui_notification_event_addNotification;
}; 
if (!local _vehicle) then
{
	["RepairFailedWarning", ["Please get in as driver/pilot first."]] call ExileClient_gui_notification_event_addNotification;
}
else 
{
	
	_equippedMagazines = magazines player;
	if ("Exile_Item_DuctTape" in _equippedMagazines) then
	{
		if ("Exile_Item_JunkMetal" in _equippedMagazines) then
		{
		_position = player modelToWorld [1,+1,0];
        _item = "Item_ToolKit" createVehicle [0,0,0];
        _item setPos [_position select 0, _position select 1, 0];	
		player playMove "AinvPknlMstpSnonWnonDr_medic3";	
		player playMove "AinvPknlMstpSnonWnonDr_medic3";	
		sleep 20;
		_vehicle setDamage 0;
		player removeItem "Exile_Item_DuctTape";
		player removeItem "Exile_Item_JunkMetal";
		deleteVehicle _item;
		["Success",["Vehicle repaired"]] call ExileClient_gui_notification_event_addNotification;
		}
		else
		{
		["Whoops",["You need Junkmetal to do that!"]] call ExileClient_gui_notification_event_addNotification;
		};
	}
	else 
	{
		["RepairFailedWarning", ["You need duct tape to do that!"]] call ExileClient_gui_notification_event_addNotification;
	};
	
};
true
