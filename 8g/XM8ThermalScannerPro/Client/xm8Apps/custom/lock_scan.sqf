/*
XM8 Portable Thermal Scanner Pro script made by Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/


This app will allow players to upload scans to their XM8/Database and then use them on vehicles only(really up to server admin on this)
If you have virtual scans and regular ThermalScannerPro in your inventory it will always use the real one first.

Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/

****Seperate from Exile Default Lock_Scan Script
*/
 
private["_Scans"]; 
if !(isNull ExileClientInteractionObject) then 
{
	_Scans = (missionNamespace getVariable ["ScanCount", 0]);
	profileNamespace setVariable ["var_XM8_Scans",_Scans]; //Setting how many scans they have to profile so its really easy to read serverside! :D
	saveProfileNamespace;
	if (_Scans > 0) then {
		["scanCodeLockRequest", [netId ExileClientInteractionObject]] call ExileClient_system_network_send;
	};
};