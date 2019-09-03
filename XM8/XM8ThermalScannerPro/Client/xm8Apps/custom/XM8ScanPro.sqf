/*
XM8 Portable Thermal Scanner Pro script made by Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/


This app will allow players to upload scans to their XM8/Database and then use them on vehicles only(really up to server admin on this)
If you have virtual scans and regular ThermalScannerPro in your inventory it will always use the real one first.

Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/

*/
private ["_display", "_xm8Controlls", "_fade", "_Xm8ScanOption", "_maxScans", "_Xm8Scans", "_scannerInfo", "_ThermalScans", "_canUpload", "_error", "_finalScans", "_scanInfoFrame", "_scanInfoText", "_scanInfoText1", "_scanInfoText2", "_scanUploadFrame", "_scanUploadText", "_scanUploadButton", "_goBackButton", "_scanResponseFrame", "_scanMainFrame", "_scanMainNum", "_scanMainTitle", "_scanErrorDefault", "_scanErrorTooMany", "_scanHasThermalPro", "_scanSuccessUpload"];
findScanners = compileFinal preprocessFileLineNumbers "xm8apps\custom\findScanners.sqf";

disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

//Hides all xm8 apps controlls then deletes them for a smooth transition
_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;


_Xm8ScanOption = profileNamespace getVariable "var_XM8_Scan_Menu";
if (isNil "_Xm8ScanOption") then { //this is in initplayerlocal.sqf so really it aint needed here
	profileNamespace setVariable ["var_XM8_Scan_Menu",1];
	saveProfileNamespace;
	_Xm8ScanOption = profileNamespace getVariable "var_XM8_Scan_Menu";
};

/* Config */
_maxScans = 20;
	
	
_Xm8Scans = (missionNamespace getVariable ["ScanCount", 0]);

_scannerInfo = [_Xm8Scans,_maxScans] call findScanners;
_ThermalScans = (_scannerInfo select 0);
_canUpload = (_scannerInfo select 1);
_error = (_scannerInfo select 2);
_finalScans = 0;
uploadedScans = 0;


_scanInfoFrame = _display ctrlCreate ["RscExileXM8Frame", 2999];
_scanInfoFrame ctrlSetPosition [(29 - 3) * (0.025) + (0), (9 - 2) * (0.04) + (0), 9 * (0.025), 4 * (0.04)]; 
_scanInfoFrame ctrlCommit 0;

_scanInfoText = _display ctrlCreate ["RscText", 3000];
_scanInfoText ctrlSetPosition [(31.5 - 3) * (0.025) + (0), (9 - 2) * (0.04) + (0), 6 * (0.025), 1 * (0.04)]; 
_scanInfoText ctrlCommit 0;
_scanInfoText ctrlSetText format["Settings"];
_scanInfoText ctrlSetTextColor [0, 0.698, 0.803, 1];

_scanInfoText1 = _display ctrlCreate ["RscText", 3001];
_scanInfoText1 ctrlSetPosition [(29 - 3) * (0.025) + (0), (9.9 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)]; 
_scanInfoText1 ctrlCommit 0;
_scanInfoText1 ctrlSetText format["Thermal Scan Option:"];
_scanInfoText1 ctrlSetTextColor [.988, .99, 1, 1];

_scanInfoText2 = _display ctrlCreate ["RscCombo", 3002];
_scanInfoText2 ctrlSetPosition [(29.5 - 3) * (0.025) + (0), (11.4 - 2) * (0.04) + (0), 8 * (0.025), 1 * (0.04)]; 
_scanInfoText2 ctrlCommit 0;
_scanInfoText2 ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[3002,_x]} forEach ["On","Off"];
_scanInfoText2 ctrlSetEventHandler ["LBSelChanged","[_this select 0] call XM8ScanOptions"];
_scanInfoText2 lbSetCurSel _Xm8ScanOption;

_scanUploadFrame = _display ctrlCreate ["RscExileXM8Frame", 3003];
_scanUploadFrame ctrlSetPosition [(29 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 9 * (0.025), 2.8 * (0.04)]; 
_scanUploadFrame ctrlCommit 0;

_scanUploadText = _display ctrlCreate ["RscText", 3004];
_scanUploadText ctrlSetPosition [(29 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)]; 
_scanUploadText ctrlCommit 0;
_scanUploadText ctrlSetText format["Upload Scans"];
_scanUploadText ctrlSetTextColor [.988, .99, 1, 1];

_scanUploadButton = _display ctrlCreate ["RscButtonMenu", 3005];
_scanUploadButton ctrlSetPosition [(29.5 - 3) * (0.025) + (0), (15.5 - 2) * (0.04) + (0), 8 * (0.025), 1 * (0.04)];
_scanUploadButton ctrlEnable _canUpload; 
_scanUploadButton ctrlCommit 0; 
_scanUploadButton ctrlSetText format["UPLOAD"];
_scanUploadButton ctrlSetEventHandler ["ButtonClick", "call Upload_Scans"];
_scanUploadButton ctrlSetTextColor [.988, .99, 1, 1];

_goBackButton = _display ctrlCreate ["RscButtonMenu", 3006];
_goBackButton ctrlSetPosition [(29 - 3) * (0.025) + (0), (20 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_goBackButton ctrlCommit 0;
_goBackButton ctrlSetEventHandler ["ButtonClick", "call XM8ShowApps"]; 
_goBackButton ctrlSetText format["GO BACK"];

_scanResponseFrame = _display ctrlCreate ["RscExileXM8Frame", 3007];
_scanResponseFrame ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 19 * (0.025), 7 * (0.04)]; 
_scanResponseFrame ctrlCommit 0;

_scanMainFrame = _display ctrlCreate ["RscExileXM8Frame", 3008];
_scanMainFrame ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (6 - 2) * (0.04) + (0), 6 * (0.025), 5 * (0.04)]; 
_scanMainFrame ctrlCommit 0;

_scanMainNum = _display ctrlCreate ["RscStructuredText", 3009];
_scanMainNum ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (4 - 2) * (0.04) + (0), 6 * (0.025), 6 * (0.04)]; 
_scanMainNum ctrlSetStructuredText (parseText (format ["<t color='#00b2cd' font='OrbitronLight' size='1' valign='middle' align='center' shadow='0'><br/><br/><br/><t font='OrbitronMedium' size='2' color='#ffffff'>%1</t><br/>SCANS</t>", _Xm8Scans])); 
_scanMainNum ctrlCommit 0;

_scanMainTitle = _display ctrlCreate ["RscStructuredText", 3010];
_scanMainTitle ctrlSetPosition [(16 - 3) * (0.025) + (0), (5.75 - 2) * (0.04) + (0), 13 * (0.025), 6 * (0.04)]; 
_scanMainTitle ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1.8' color='#ffffff'>Portable XM8 Scanner</t>"])); 
_scanMainTitle ctrlCommit 0;

_scanErrorDefault = _display ctrlCreate ["RscStructuredText", 3011];
_scanErrorDefault ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 19 * (0.025), 6 * (0.04)]; 
_scanErrorDefault ctrlSetStructuredText (parseText (format ["<t size='1' color='#ffffff'>You do not have any thermal scanners to upload!</t>"])); 
_scanErrorDefault ctrlSetFade 1;
_scanErrorDefault ctrlCommit 0;


_scanErrorTooMany = _display ctrlCreate ["RscStructuredText", 3012];
_scanErrorTooMany ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 19 * (0.025), 6 * (0.04)]; 
_scanErrorTooMany ctrlSetStructuredText (parseText (format ["<t size='1' color='#ffffff'>You have too many scans! <br/>Please try uploading again once you use a few! You will be able to upload when you have 5 scans less then the max. You have %1 total scans(real+uploaded), try again when you have %2 uploaded scans or less.</t>",(_ThermalScans+_Xm8Scans),(_maxScans-5)])); 
_scanErrorTooMany ctrlSetFade 1;
_scanErrorTooMany ctrlCommit 0;

_scanHasThermalPro = _display ctrlCreate ["RscStructuredText", 3013];
_scanHasThermalPro ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 19 * (0.025), 6 * (0.04)]; 
_scanHasThermalPro ctrlSetStructuredText (parseText (format ["<t size='1' color='#ffffff'>You have %1 Scans that you can upload. Press Upload on the app to link them with your XM8.</t>",_ThermalScans])); 
_scanHasThermalPro ctrlSetFade 1;
_scanHasThermalPro ctrlCommit 0;

_scanSuccessUpload= _display ctrlCreate ["RscStructuredText", 3014];
_scanSuccessUpload ctrlSetPosition [(7.5 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 19 * (0.025), 6 * (0.04)]; 
_scanSuccessUpload ctrlSetStructuredText (parseText (format ["<t size='1' color='#ffffff'>You have uploaded your scans! Use the settings menu to turn the option to scan vehicles on and off!</t>"])); 
_scanSuccessUpload ctrlSetFade 1;
_scanSuccessUpload ctrlCommit 0;

if (_canUpload isEqualTo true) then {
		_scanSuccessUpload ctrlSetFade 1;
		_scanErrorTooMany ctrlSetFade 1;
		_scanErrorDefault ctrlSetFade 1;
		_scanHasThermalPro ctrlSetFade 0;
		{_x ctrlCommit 0;} forEach [_scanErrorTooMany,_scanErrorDefault,_scanHasThermalPro,_scanSuccessUpload];
	};
if (_canUpload isEqualTo false) then {
	if(_error == "NoScans") then {
		_scanSuccessUpload ctrlSetFade 1;
		_scanErrorTooMany ctrlSetFade 1;
		_scanHasThermalPro ctrlSetFade 1;
		_scanErrorDefault ctrlSetFade 0;
		{_x ctrlCommit 0;} forEach [_scanErrorTooMany,_scanErrorDefault,_scanHasThermalPro,_scanSuccessUpload];
	} else {
		_scanSuccessUpload ctrlSetFade 1;
		_scanHasThermalPro ctrlSetFade 1;
		_scanErrorDefault ctrlSetFade 1;
		_scanErrorTooMany ctrlSetFade 0;
		{_x ctrlCommit 0;} forEach [_scanErrorTooMany,_scanErrorDefault,_scanHasThermalPro,_scanSuccessUpload];
	};
};
generic_variable = [_Xm8Scans,_ThermalScans,_finalScans];

XM8ShowApps = {
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_Ctrls = [2999,3000,3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011,3012,3013,3014];
	{
		_ctrl = (_display displayCtrl _x);
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0.25;
		ctrlEnable [_x, false];
	} forEach _Ctrls;
	execVM "xm8Apps\XM8Apps_Init.sqf";
	uiSleep 1;
  {
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _Ctrls;
};	

Upload_Scans = {
	[] spawn {
		_Xm8S = (generic_variable select 0);
		_ThermalS = (generic_variable select 1);
		_finalS = (generic_variable select 2);
		_magazineClassName = "Exile_Item_ThermalScannerPro";
		["Upload Thermal Scans?", "Yes", "Nah"] call ExileClient_gui_xm8_showConfirm;
		waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
		if (ExileClientXM8ConfirmResult isEqualTo true) then
		{
			_finalS = _Xm8S + _ThermalS;
			Scans = _finalS;
			uploadedScans = 1;
			['upload',ExileClientSessionId, player, _finalS] remoteExecCall ['ExileServer_xm8apps_scans_network_request', 2];
			player removeMagazines _magazineClassName;
		};
		if (ExileClientXM8ConfirmResult isEqualTo false) then
		{
			uploadedScans = 2;
		};
	};
};

XM8ScanOptions = {
	_index = lbCurSel 3002;
	_XM8ScanNum = (missionNamespace getVariable ["ScanCount", 0]);
	Switch (_index) Do 
	{
		Case 0:
		{
			profileNamespace setVariable ["var_XM8_Scan_Menu",0];
			saveProfileNamespace;
			if(_XM8ScanNum != 0 ) then {
				ExileXM8Scanner = 0;
			} else {
				ExileXM8Scanner = 1;
			};
		};
		Case 1:
		{
			profileNamespace setVariable ["var_XM8_Scan_Menu",1];
			saveProfileNamespace;
			ExileXM8Scanner = 1;
		};
	};
};
waitUntil { uploadedScans != 0 };

if(uploadedScans == 1) then {
	_Xm8Scans = Scans;
	_scanSuccessUpload ctrlSetFade 0;
	_scanHasThermalPro ctrlSetFade 1;
	_scanErrorDefault ctrlSetFade 1;
	_scanErrorTooMany ctrlSetFade 1;
	_scanMainNum ctrlSetStructuredText (parseText (format ["<t color='#00b2cd' font='OrbitronLight' size='1' valign='middle' align='center' shadow='0'><br/><br/><br/><t font='OrbitronMedium' size='2' color='#ffffff'>%1</t><br/>SCANS</t>", _Xm8Scans])); 
	{_x ctrlCommit 0;} forEach [_scanErrorTooMany,_scanErrorDefault,_scanHasThermalPro,_scanSuccessUpload,_scanMainNum];
};

