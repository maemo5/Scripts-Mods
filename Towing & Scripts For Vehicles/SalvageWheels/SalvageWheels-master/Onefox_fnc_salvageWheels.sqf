/**
 * License: WTFPL
 */
 
private["_canAdd","_workingWheels", "_vehicle","_equippedMagazines","_wheels","_wheelToSalvage"];
_vehicle = _this select 0;

if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};


_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];
_workingWheels = [];
{
	if ((_vehicle getHitPointDamage _x) < 0.2) then
	{	
		_damage = _vehicle getHitPointDamage _x;
		_workingWheels = _workingWheels + [_x];
	};
} forEach _wheels;


if (_workingWheels isEqualTo []) exitWith
{
	["RepairFailedWarning", ["The wheels are to damaged"]] call ExileClient_gui_notification_event_addNotification;
};


_canAdd = [player,"Exile_Item_CarWheel"] call ExileClient_util_playerCargo_canAdd;

_wheelToSalvage = _workingWheels select 0;

if (!local _vehicle) then
{
	["RepairFailedWarning", ["Please get in as driver first."]] call ExileClient_gui_notification_event_addNotification;
}
else 
{
	_equippedMagazines = magazines player;
	if (!("Exile_Item_Foolbox" in _equippedMagazines)) then
	{
		["RepairFailedWarning", ["You need a toolbox"]] call ExileClient_gui_notification_event_addNotification;
		sleep 0.5;
	};
	if (!("Exile_Item_Wrench" in _equippedMagazines)) then
	{
		["RepairFailedWarning", ["You need a wrench"]] call ExileClient_gui_notification_event_addNotification;
		sleep 0.5;
	};
	if (!(_canAdd)) then
	{
		["InventoryFullWarning"] call ExileClient_gui_notification_event_addNotification;
		sleep 0.5;
	};


	if (("Exile_Item_Foolbox" in _equippedMagazines) && ("Exile_Item_Wrench" in _equippedMagazines) && (_canAdd)) then {
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 10;
			_vehicle setHitPointDamage [_wheelToSalvage,1];
			player addItem "Exile_Item_CarWheel";
			["Success",["You have salvage a wheel"]] call ExileClient_gui_notification_event_addNotification;
	};
};
true
