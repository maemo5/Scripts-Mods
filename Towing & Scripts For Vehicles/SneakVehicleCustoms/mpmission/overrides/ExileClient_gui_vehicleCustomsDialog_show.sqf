/**
 * ExileClient_gui_vehicleCustomsDialog_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

 //sneak edit
 
private["_traderObject","_localVehicles","_nearVehicles","_customizableVehicles","_parentClassName","_dialog","_vehicleDropDown","_vehicleObject","_vehicleIndex"];
disableSerialization;
_traderObject = _this;
_localVehicles = [];
_nearVehicles = [];
switch (typeOf _traderObject) do
{
	case "Exile_Trader_VehicleCustoms":
	{
		_nearVehicles = nearestObjects [player, ["LandVehicle"], 50];
	};
	case "Exile_Trader_AircraftCustoms":
	{
		_nearVehicles = nearestObjects [player, ["Air"], 80];
	};
	case "Exile_Trader_BoatCustoms":
	{
		_nearVehicles = nearestObjects [player, ["Ship"], 50];
	};
	default { format["Invalid trader type: %1", (typeOf _traderObject)] call ExileClient_util_log; };
};
_customizableVehicles = [];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			_localVehicles pushBack _x;
		};
	};
}
forEach _nearVehicles;
if (_localVehicles isEqualTo []) exitWith
{
	["VehicleCustomsWarningNoVehiclesNearby"] call ExileClient_gui_notification_event_addNotification;
};
{
	_parentClassName = configName (inheritsFrom (configFile >> "CfgVehicles" >> (typeOf _x)));
	//add custom classes
	if (isClass (missionConfigFile >> "CfgVehicleCustoms" >> _parentClassName) || isClass (missionConfigFile >> "CfgSneakCustoms" >> _parentClassName)) then
	{
		_customizableVehicles pushBack _x;
	};
}
forEach _localVehicles;
if (_customizableVehicles isEqualTo []) exitWith
{
	["VehicleCustomsWarningNothingToCustomize"] call ExileClient_gui_notification_event_addNotification;
};
ExileClientMoonLight setLightBrightness 5;
createDialog "RscExileVehicleCustomsDialog";
_dialog = uiNameSpace getVariable ["RscExileVehicleCustomsDialog", displayNull];
uiNamespace setVariable["ExileCurrentTrader", _traderObject];
_vehicleDropDown = _dialog displayCtrl 4000;
lbClear _vehicleDropDown;
{
	_vehicleObject = _x;
	_vehicleIndex = _vehicleDropDown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _vehicleObject) >> "displayName");
	_vehicleDropDown lbSetData [_vehicleIndex, netId _vehicleObject];
}
forEach _customizableVehicles;
call ExileClient_gui_modelBox_create;
(typeOf (_customizableVehicles select 0)) call ExileClient_gui_modelBox_update;
_vehicleDropDown lbSetCurSel 0;