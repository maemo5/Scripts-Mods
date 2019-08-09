
//******************************THIS IS TO SHOW WHERE I PLACE THIS BIT OF CODE!
/*
You can now set what buuton you would like to replace
1 = server info button
2 = Bounties Button
3 = Clan Button
*/

//[XM8APPS] XM8 Scanner Pro Start
_y = missionNamespace getVariable ["ScanCount", 0];
if (isNil "_y") then {
	missionNamespace setVariable ["ScanCount", 0];
};
['',ExileClientSessionId, player, ''] remoteExecCall ['ExileServer_xm8apps_scans_network_request', 2];
//[XM8APPS] XM8 Scanner Pro End

_btnToUse = 1;

_AppsLogo = "xm8Apps\images\xm8logofix_ca.paa";

