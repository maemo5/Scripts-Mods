/**
 * ExileClient_object_lock_network_scanCodeLockResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_signature","_Scans","_newScans"];
_signature = _this select 0;
_Scans = (missionNamespace getVariable ["ScanCount", 0]);
_newScans = 0;
_found = false;
if ("Exile_Item_ThermalScannerPro" in (magazines player)) then 
{
	_found = true;
	[player, "Exile_Item_ThermalScannerPro", -1] call ExileClient_util_gear_repackMagazines;
	_signature call ExileClient_gui_keypadScanDialog_show;
};

if ((_Scans > 0) && !_found) then {
	_newScans = _Scans;
	['use',ExileClientSessionId, player, _newScans] remoteExecCall ['ExileServer_xm8apps_scans_network_request', 2];
	_signature call ExileClient_gui_keypadScanDialog_show;
};