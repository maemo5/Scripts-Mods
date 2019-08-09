#include "..\AutoPilotConfig.h"

params["_pos","_RadiusIndex","_HeightIndex","_SideIndex"];

_Radius = LOITER_RADIUSES select _RadiusIndex;
_Height = LOITER_HEIGHTS select _HeightIndex;
_Side = LOITER_SIDES select _SideIndex;
_AddPoints = LOITER_POINTS select _RadiusIndex;

_veh = vehicle player;

_CanEnable = false;
if (driver _veh != player) then
{
	_CanEnable = true;
}
else
{
	//move to a random seat
	_moved = player moveInAny _veh;
	if (_moved) then
	{
		_CanEnable = true;
	}
	else
	{
		hint "Not Enough seats"; //#TODO replace with exile toast
	};
};


if (_CanEnable) then
{
	//cancel auto landing if enabled
	player action ["cancelLand", _veh];
	
	private ["_g1","_g2","_num1","_num2","_num3"];
	_veh setVariable ["ChaosPilot_PreviousOwner", player, true]; 
	_veh setVariable ["ChaosPilot_AutoPilotOn", true, true];
		
	//create a new group, player cant give commands
	_group = createGroup [side player, true];
	//_group = group player;
	//_group selectLeader player;
	//create unit
	_unit = _group createUnit ["B_Pilot_F",[0,0,0], [], 0, "NONE"];
	removeAllWeapons _unit;
	
	//Set the skill of the ai
	_unit setskill ["aimingAccuracy",1.0];
	_unit setskill ["aimingShake",1.0];
	_unit setskill ["aimingSpeed",1.0];
	_unit setskill ["spotDistance",1.0];
	_unit setskill ["spotTime",1.0];
	_unit setskill ["courage",1.0];
	_unit setskill ["reloadSpeed",1.0];
	_unit setskill ["commanding",1.0];
	_unit setskill ["general",1.0];
	
	//move into the driver seat
	//_unit assignAsDriver _veh;
	_unit moveInDriver _veh;
	[_unit] orderGetIn true;
	[_unit] allowGetIn true;
	_veh enableCopilot false;
	
	//can be used to let other people take over the pilot seat from the bot
	_veh setVariable ["ChaosPilot_PilotUnit", _unit, true];
		
	_index = 1;
	private "_sdistance";
	private "_waypointindex";
	_points = ((round(((_Radius / 100)+ 4) / 4)) * 4) + _AddPoints;
	
	while {_index <= _points} do
	{
		private "_angle";
		private "_randompos";
		
		if (_Side isEqualTo "Left") then 
		{
			_angle = 360 - _index * (360 / _points);
			_randompos = [_pos, _Radius, _angle] call BIS_fnc_relPos;
		}
		else
		{
			_angle = _index * (360 / _points);
			_randompos = [_pos, _Radius, _angle] call BIS_fnc_relPos;
		};
		
		//set the height from sea level
		_randomposASL =  _randompos;
		_randomposASL set [2, _Height];
		_randomposAGL = ASLToAGL _randomposASL;
		
		//add the waypoint with position AGL
		_group addWaypoint [_randomposAGL, 0];
		if (_index != _points) then
		{
			[_group, _index] setWaypointType "MOVE";
		}
		else
		{
			_firstwp = waypointPosition [_group, 1];
			
			_distance = [_randompos, _firstwp] call BIS_fnc_distance2D;
			//_direction = [_randompos,_firstwp] call BIS_fnc_dirTo;
			_dir1 = abs (_pos getDir _randompos);
			_dir2 = abs (_pos getDir _firstwp);
			_dir3 = ((_dir1 + _dir2) /2);
			
			_cyclepos = [_pos, _Radius , _dir3 + 180 ] call BIS_fnc_relPos;
			
			//set the height from sea level
			_cycleposASL =  _cyclepos;
			_cycleposASL set [2, _Height];
			_cycleposAGL = ASLToAGL _cycleposASL;
			
			_group addWaypoint [_cycleposAGL, 0];			
			[_group, _index + 1] setWaypointType "CYCLE";
			[_group, _index + 1] setWaypointCompletionRadius 1000;
		
#ifdef DEBUG_MARKERS		
			deleteMarker "Final";
			_markerstr = createMarkerLocal ["Final", _cyclepos];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "hd_objective";
			_markerstr setMarkerTextLocal "cycle";
#endif
		};	
		
/* 		_distance = _unit distance _randompos;
		if (_index == 1) then
		{
			_sdistance = _distance;
			_group setCurrentWaypoint [_group, _index];
		}
		else
		{
			if (_distance < _sdistance) then
			{	
				_sdistance = _distance;
				_group setCurrentWaypoint [_group, _index];
			};
		}; */
		
#ifdef DEBUG_MARKERS
		deleteMarker format["%1wp", _index];
		_markerstr = createMarkerLocal [format["%1wp", _index], _randompos];
		_markerstr setMarkerShapeLocal "ICON";
		_markerstr setMarkerTypeLocal "hd_destroy";
		_markerstr setMarkerTextLocal format["%1", _index]; 
#endif
		
		_index= _index + 1;
	};
	
	//can only add the distance after the waypoints are added
	_wpdistance = abs ((waypointPosition [_group, 1]) distance2D (waypointPosition [_group, 2]));
	_wpdistance = _wpdistance * LOITER_COMPLETION_DISTANCE;
	private ["_deltaAngle", "_deltaAnglewp"];
	//hint format["distance: %1 ", _distance];
	_end = count (waypoints _group) - 1; //get the final array index
	{
		[_group, _forEachIndex] setWaypointCompletionRadius _wpdistance;
		
		if (_forEachIndex != 0) then
		{
			private ["_wp1", "_wp2", "_anglewp1", "_anglewp2"];
			if (_forEachIndex != _end) then
			{
				_wp1 = waypointPosition [_group, _forEachIndex];
				_wp2 = waypointPosition [_group, _forEachIndex + 1];
			}
			else
			{
				_wp1 = waypointPosition [_group, _forEachIndex];
				_wp2 = waypointPosition [_group, 1];
			};
			
			_anglewp1 =  _veh getRelDir _wp2;
			_anglewp2 = _wp1 getDir _wp2;
			//_anglewp2 = _veh getRelDir _wp2;
			
 			if (_anglewp1 > 180) then 
			{ 
				_anglewp1 = 360 - _anglewp1; 
			};
			if (_anglewp2 > 180) then 
			{ 
				_anglewp2 = 360 - _anglewp2; 
			};
			
			_deltaAngleNew = abs (_anglewp2 + _anglewp1);			
			if (_forEachIndex != 1) then
			{
				if (_deltaAngleNew < _deltaAngle) then {_deltaAngle = _deltaAngleNew; _deltaAnglewp = _forEachIndex;};
			}
			else
			{
				_deltaAngle = _deltaAngleNew;
				_deltaAnglewp = _forEachIndex;
			};
		};
	} forEach waypoints _group;
	
	
	_group setCurrentWaypoint [_group, _deltaAnglewp];
	//hint format["count: %1 with %2 points", count (waypoints _group), _points];
		
	_group setBehaviour "AWARE";
	_group setSpeedMode "NORMAL";
	_group setCombatMode "BLUE";
	//stop plane jitter
	//_veh flyInHeight _Height;
	
	_veh flyInHeightASL [_Height, _Height, _Height];
	
	
	/*EXTEND LINE START*/
	/*this will extend a line from the starting position and set that as a 1 time waypoint*/
	/*calculate the position and return it, and do it in OkLoiterDialog*/
	_wp1 = waypointPosition [_group, _deltaAnglewp];
	private "_wp2";
	if (_deltaAnglewp isEqualTo _end) then	{_wp2 = waypointPosition [_group, 1]; } else {	_wp2 = waypointPosition [_group, _deltaAnglewp + 1]; };
	
	_dir = _wp2 getDir _wp1;
	_startpos = [_wp1, LOITER_START_DIST , _dir] call BIS_fnc_relPos;
	//hint format["Loitering to the %1 with a radius of %2 and height of %3", _Side, _Radius, _Height];	
	_ret = [_unit, _startpos];
	_ret
};


//["SuccessTitleAndText", ["Auto Pilot ON!", "Auto pilot is turned on and loitering"]] call ExileClient_gui_toaster_addTemplateToast;
//["ErrorTitleAndText", ["Auto Pilot OFF!", "No Empty seats!"]] call ExileClient_gui_toaster_addTemplateToast;
