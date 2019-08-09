#include "..\AutoPilotConfig.h"

_CanOn = player call ChaosPilot_fnc_CanOnAutoLoiter;

Loiter_Refresh = 
{
	params ["_unit", "_veh"];
	while {true} do
	{
		_driver = driver _veh;
		_pveh = vehicle player;
		
		//the player isn't in the vehicle
		if (!(_pveh isEqualTo _veh)) exitWith 
		{
			[0, _unit] call ChaosPilot_fnc_AutoLoiterOff;
			/* _veh deleteVehicleCrew _unit;
			//can be used to let other people take over the pilot seat from the bot
			_veh setVariable ["ChaosPilot_PilotUnit", nil, true]; //#TODO maybe broadcast global???
			_veh setVariable ["ChaosPilot_PreviousOwner", nil, true]; //#TODO maybe broadcast global???
			_veh setVariable ["ChaosPilot_AutoPilotOn", nil, true]; //#TODO maybe broadcast global???
			_veh enableCopilot true;
			
			ChaosPilot_LoiterInfoTemp = [-1,-1,-1];
			ChaosPilot_LoiterInfo set [0, [-1,-1,-1]]; */
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
		hint "please select a target location";
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
			hint "auto off";
		};
		
		_ret = [_Pos, _RadiusIndex, _HeightIndex, _SideIndex] call ChaosPilot_fnc_AutoLoiterOn;
		if (count _ret > 0) then
		{
			hint "on";
			_unit = _ret select 0;
			_veh = vehicle _unit;
			//hint format["vehicle %1 %2", _veh, group _unit];
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
			[_group, _index] setWaypointCompletionRadius 10;
			_group setCurrentWaypoint [_group, _index];
			
#ifdef DEBUG_MARKERS
			deleteMarker "START";
			_markerstr = createMarkerLocal ["START", _startpos];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_objective";
			_markerstr setMarkerTextLocal "START";
#endif	 
			
			waitUntil { sleep 2; (_unit distance2D  _startpos) < 200 }; 
			
#ifdef DEBUG_MARKERS			
			deleteMarker "START";
#endif	

			_endpos = waypointPosition[_group, _endposIndex];
			_distance = [_startpos, _endpos] call BIS_fnc_distance2D;
			_direction = [_startpos, _endpos] call BIS_fnc_dirTo;
			_midpos = [_startpos, LOITER_START_DIST/2 ,_direction] call BIS_fnc_relPos;
			
			_group addWaypoint [_midpos, 0];
			[_group, _index] setWaypointType "MOVE";
			[_group, _index] setWaypointCompletionRadius 10;
			_group setCurrentWaypoint [_group, _index + 1];
			
#ifdef DEBUG_MARKERS
			deleteMarker "MID";
			_markerstr = createMarkerLocal ["MID", _midpos];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_objective";
			_markerstr setMarkerTextLocal "MID";
#endif	 


			waitUntil { sleep 2; (_unit distance2D  _midpos) < 200 }; 
			
			
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
		case 1 : { hint "Must be inside a plane"; };
		case 2 : { hint "Only the pilot may activate AutoPilot"; };
		case 3 : { hint format["Minimum speed of %1 required", MINIMUM_SPEED]; };
		case 4 : { hint format["Minimum altitude of %1 required", MINIMUM_HEIGHT_ASL]; }; 
		case 5 : { hint "Only the previous pilot can set target"; };
		default {hint "unknown error"; };
	};
};