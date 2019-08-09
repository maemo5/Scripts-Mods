/**
 * ExileClient_system_locker_network_lockerResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_dialog", "_lockerAmount", "_lockerLimit", "_depositInput", "_withdrawInput", "_lockerAmountLabel", "_inventoryAmount", "_inventoryAmountLabel", "_prefixAmountDsplay", "_prefixLimitDisplay", "_prefixAmountDisplay", "_lockerAmountDsplay", "_lockerLimitDisplay", "_inventoryAmountDisplay"];
_dialog = uiNameSpace getVariable ["RscExileLockerDialog", displayNull];
_lockerAmount = player getVariable ["ExileLocker", 0];

// Make numbers look better when large > 2 decimal places
_lockerAmountDsplay = _lockerAmount;
if( _lockerAmountDsplay >= 1000 ) then { 
										if( _lockerAmountDsplay >= 1000000 ) then {_lockerAmountDsplay = _lockerAmountDsplay / 1000000; _prefixAmountDsplay = "M" } 
										else {_lockerAmountDsplay = _lockerAmountDsplay / 1000; _prefixAmountDsplay = "K" } 
										} else { _prefixAmountDsplay = "" };
_lockerAmountDsplay = [_lockerAmountDsplay,2] call BIS_fnc_cutDecimals;
// End number clean-up

_lockerLimit = ([ExileClientPlayerScore] call LL_getLockerLimit);

// Make numbers look better when large > 2 decimal places
_lockerLimitDisplay = _lockerLimit;
if( _lockerLimitDisplay >= 1000 ) then { 
										if( _lockerLimitDisplay >= 1000000 ) then {_lockerLimitDisplay = _lockerLimitDisplay / 1000000; _prefixLimitDisplay = "M" } 
										else {_lockerLimitDisplay = _lockerLimitDisplay / 1000; _prefixLimitDisplay = "K" } 
										} else { _prefixLimitDisplay = "" };
_lockerLimitDisplay = [_lockerLimitDisplay,2] call BIS_fnc_cutDecimals;
// End number clean-up

_depositInput = _dialog displayCtrl 4006;
_depositInput ctrlSetText "";
_withdrawInput = _dialog displayCtrl 4005;
_withdrawInput ctrlSetText "";
_lockerAmountLabel = _dialog displayCtrl 4000;
_lockerAmountLabel ctrlSetStructuredText (parseText format["<t size='1.4'>%1 %2 / %3 %4 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _lockerAmountDsplay, _prefixAmountDsplay, _lockerLimitDisplay, _prefixLimitDisplay]);
_inventoryAmount = player getVariable ["ExileMoney", 0];

// Make numbers look better when large > 2 decimal places
_inventoryAmountDisplay = _inventoryAmount;
if( _inventoryAmountDisplay >= 1000 ) then { 
										if( _inventoryAmountDisplay >= 1000000 ) then {_inventoryAmountDisplay = _inventoryAmountDisplay / 1000000; _prefixAmountDisplay = "M" } 
										else {_inventoryAmountDisplay = _inventoryAmountDisplay / 1000; _prefixAmountDisplay = "K" } 
										} else { _prefixAmountDisplay = "" };
_inventoryAmountDisplay = [_inventoryAmountDisplay,2] call BIS_fnc_cutDecimals;
// End number clean-up

_inventoryAmountLabel = _dialog displayCtrl 4001;
_inventoryAmountLabel ctrlSetStructuredText (parseText format["<t size='1.4'>%1 %2 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _inventoryAmountDisplay, _prefixAmountDisplay]);
true