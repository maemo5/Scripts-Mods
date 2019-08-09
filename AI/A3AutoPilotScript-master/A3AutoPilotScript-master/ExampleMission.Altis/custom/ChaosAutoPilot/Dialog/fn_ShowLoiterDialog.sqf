#include "..\AutoPilotConfig.h"

disableSerialization; //https://community.bistudio.com/wiki/disableSerialization
_LoiterHeights = LOITER_HEIGHTS;
_LoiterRadiuses = LOITER_RADIUSES;
_LoiterSides = LOITER_SIDES;
createDialog "ChaosPilot_Loiter_Dialog";
waitUntil {!isNull (findDisplay 53565);};

_display = findDisplay 53565;

_ctrl1 = _display displayCtrl 3100;
{
	_ctrl1 lbAdd (str _x);
} forEach _LoiterRadiuses;
_ctrl1 lbSetCurSel 0;

_ctrl2 = _display displayCtrl 3101;
{
	_ctrl2 lbAdd (str _x);
} forEach _LoiterHeights;
_ctrl2 lbSetCurSel 0;

_ctrl3 = _display displayCtrl 3102;
{
	_ctrl3 lbAdd _x;
} forEach _LoiterSides;
_ctrl3 lbSetCurSel 0;

//inline functions, cant be bothered to make a new file
_pos = ChaosPilot_LoiterInfo select 0;
if (!(_pos isEqualTo [-1,-1,-1])) then
{
	createMarker [ChaosPilot_LoiterMarkerName, _pos];
	ChaosPilot_LoiterMarkerName setMarkerShapeLocal "ICON";
	ChaosPilot_LoiterMarkerName setMarkerTypeLocal "mil_end";
	ChaosPilot_LoiterMarkerName setMarkerColorLocal "ColorRed";
	
	_ctrl1 lbSetCurSel (ChaosPilot_LoiterInfo select 1);
	_ctrl2 lbSetCurSel (ChaosPilot_LoiterInfo select 2);
	
	_side = ChaosPilot_LoiterInfo select 3;	
	_ctrl3 lbSetCurSel _side;
	if (_side isEqualTo 0) then 
	{
		ChaosPilot_LoiterMarkerName setMarkerDirLocal 90;
	}
	else 	
	{
		ChaosPilot_LoiterMarkerName setMarkerDirLocal 270;
	};
};


//inline functions, cant be bothered to make a new file
Loiter_OnMapClick = 
{
	_ctrl = _this select 0;
	_xpos = _this select 2;
	_ypos = _this select 3;

	_pos = _ctrl ctrlMapScreenToWorld [_xpos, _ypos];
	ChaosPilot_LoiterInfoTemp = _pos;
		
	deleteMarkerLocal ChaosPilot_LoiterMarkerNameTemp;
	createMarker [ChaosPilot_LoiterMarkerNameTemp, _pos];
	ChaosPilot_LoiterMarkerNameTemp setMarkerShapeLocal "ICON";
	ChaosPilot_LoiterMarkerNameTemp setMarkerTypeLocal "mil_join";
	ChaosPilot_LoiterMarkerNameTemp setMarkerColorLocal "ColorRed";	

	ctrlMapAnimClear _ctrl;
	_ctrl ctrlMapAnimAdd [1, 0.1, _pos];	
	ctrlMapAnimCommit _ctrl;
};

Loiter_OnMapClose = 
{
	deleteMarkerLocal ChaosPilot_LoiterMarkerNameTemp;
	deleteMarkerLocal ChaosPilot_LoiterMarkerName;
};

_map = _display displayCtrl 1800;
/*https://community.bistudio.com/wiki/User_Interface_Event_Handlers
have to remove On from OnMouseButtonClick to change event handler*/
_map ctrlAddEventHandler ["MouseButtonClick", "_this call Loiter_OnMapClick"];
_display displayAddEventHandler ["Unload", "_this call Loiter_OnMapClose"];



_btnOK = _display displayCtrl 3600;
_btnOK buttonSetAction "[] spawn ChaosPilot_fnc_OkLoiterDialog;";