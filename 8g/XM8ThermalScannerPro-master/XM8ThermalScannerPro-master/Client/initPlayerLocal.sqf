//[XM8APPS] XM8 Scanner Pro Start
_Xm8ScanMenu = profileNamespace getVariable "var_XM8_Scan_Menu";
if (isNil "_Xm8ScanMenu") then {
	profileNamespace setVariable ["var_XM8_Scan_Menu",1];
	saveProfileNamespace;
	_Xm8ScanMenu = profileNamespace getVariable "var_XM8_Scan_Menu";
};
ExileXM8Scanner = _Xm8ScanMenu;
//[XM8APPS] XM8 Scanner Pro End
//Include at the Top of initPlayerLocal.sqf