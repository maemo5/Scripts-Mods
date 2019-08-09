#include "..\AutoPilotConfig.h"

_CanOn = player call ChaosPilot_fnc_CanOnAutoLoiter;

Loiter_Refresh = 
{
	params ["_unit", "_veh"];
	while {true} do
	{
		_driver = driver _veh;
		_pveh = vehicle player;
		
		if (!(_pveh isEqualTo _veh)) exitWith 
		{
			[0, _unit] call ChaosPilot_fnc_AutoLoiterOff;
		};
		
		if ((_pveh isEqualTo _veh) && !(_driver isEqualTo _unit) ) exitWith 
		{
			[1] call ChaosPilot_fnc_AutoLoiterOff;
		};
		
		sleep 1;
	};
};

if (_CanOn == 0) then
{
	_veh = vehicle player;
	_AutoPilotOn = _veh getVariable ["ChaosPilot_AutoPilotOn",false];
	if (ChaosPilot_LoiterInfoTemp isEqualTo [-1,-1,-1] && !_AutoPilotOn) then
	{
		["ErrorTitleAndText", ["Auto Pilot Error!", "Please Select Target"]] call ExileClient_gui_toaster_addTemplateToast;
	}
	else
	{
		_Pos = ChaosPilot_LoiterInfoTemp; 
	
		_RadiusIndex = lbCurSel 3100;
		
		_HeightIndex = lbCurSel 3101;
		
		_SideIndex = lbCurSel 3102;
			
		if (_AutoPilotOn) then
		{
			_unit = _veh getVariable ["ChaosPilot_PilotUnit",false];
			_Pos = ChaosPilot_LoiterInfo select 0; //get the current loiter position before deleting
			[1] call ChaosPilot_fnc_AutoLoiterOff;
			["SuccessTitleAndText", ["Auto Pilot Info", "Auto pilot retargeting"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		
		_ret = [_Pos, _RadiusIndex, _HeightIndex, _SideIndex] call ChaosPilot_fnc_AutoLoiterOn;
		if (count _ret > 0) then
		{
			["SuccessTitleAndText", ["Auto Pilot ON!", "Auto pilot is turned on and loitering"]] call ExileClient_gui_toaster_addTemplateToast;
			_unit = _ret select 0;
			_veh = vehicle _unit;
			waitUntil { _unit == driver _veh; };
			
			Loiter_Refresh_Handle = [_unit, _veh] spawn Loiter_Refresh;
			
			vehicle _unit engineOn true;
			_veh setEngineRPMRTD [9000, -1];
			
			ChaosPilot_LoiterInfo set [0, _Pos];
			ChaosPilot_LoiterInfo set [1, _RadiusIndex];
			ChaosPilot_LoiterInfo set [2, _HeightIndex];
			ChaosPilot_LoiterInfo set [3, _SideIndex];
			
			_startpos = _ret select 1;
			_group = group _unit;	
			_endposIndex = currentWaypoint _group;
			
			_group addWaypoint [_startpos, 0];
			_index = count (waypoints _group) - 1;
			[_group, _index] setWaypointType "MOVE";
			[_group, _index] setWaypointCompletionRadius 0;
			_group setCurrentWaypoint [_group, _index];
			
#ifdef DEBUG_MARKERS
			deleteMarker "START";
			_markerstr = createMarkerLocal ["START", _startpos];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_objective";
			_markerstr setMarkerTextLocal "START";
#endif	 
			
			waitUntil { sleep 2; (_unit distance2D  _startpos) < 300 }; 
			
#ifdef DEBUG_MARKERS			
			deleteMarker "START";
#endif	

			_endpos = waypointPosition[_group, _endposIndex];
			_distance = [_startpos, _endpos] call BIS_fnc_distance2D;
			_direction = [_startpos, _endpos] call BIS_fnc_dirTo;
			_midpos = [_startpos, LOITER_START_DIST*0.6 ,_direction] call BIS_fnc_relPos;
			
			_group addWaypoint [_midpos, 0];
			[_group, _index] setWaypointType "MOVE";
			[_group, _index] setWaypointCompletionRadius 0;
			_group setCurrentWaypoint [_group, _index + 1];
			
#ifdef DEBUG_MARKERS
			deleteMarker "MID";
			_markerstr = createMarkerLocal ["MID", _midpos];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_objective";
			_markerstr setMarkerTextLocal "MID";
#endif	 


			waitUntil { sleep 2; (_unit distance2D  _midpos) < 400 }; 
			
			
			_group setCurrentWaypoint [_group, _endposIndex];			
			
			deleteWaypoint [_group, _index];
			deleteWaypoint [_group, _index + 1];	
			
#ifdef DEBUG_MARKERS			
			deleteMarker "MID";
#endif	
				
		};
	};
}
else
{
	switch (_CanOn) do
	{
		case 1 : { ["ErrorTitleAndText", ["Auto Pilot Error!", "Must be inside a plane"]] call ExileClient_gui_toaster_addTemplateToast; };
		case 2 : { ["ErrorTitleAndText", ["Auto Pilot Error!", "Only the pilot may activate AutoPilot"]] call ExileClient_gui_toaster_addTemplateToast; };
		case 3 : { ["ErrorTitleAndText", ["Auto Pilot Error!", format["Minimum speed of %1 required", MINIMUM_SPEED]]] call ExileClient_gui_toaster_addTemplateToast; };
		case 4 : { ["ErrorTitleAndText", ["Auto Pilot Error!", format["Minimum altitude of %1 required", MINIMUM_HEIGHT_ASL]]] call ExileClient_gui_toaster_addTemplateToast; }; 
		case 5 : { ["ErrorTitleAndText", ["Auto Pilot Error!", "Only the previous pilot can set target"]] call ExileClient_gui_toaster_addTemplateToast; };
		default {["ErrorTitleAndText", ["Auto Pilot Error!", "Unknown Error"]] call ExileClient_gui_toaster_addTemplateToast; };
	};
};