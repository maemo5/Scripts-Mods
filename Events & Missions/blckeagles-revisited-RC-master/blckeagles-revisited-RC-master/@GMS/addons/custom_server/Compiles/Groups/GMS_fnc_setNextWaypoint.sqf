// Sets the WP type for WP for the specified group and updates other atributes accordingly.
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_group","_wp","_index","_pattern","_mode","_arc","_dis","_wpPos"];

_group = group _this;
_group setVariable["timeStamp",diag_tickTime];
_group setcombatmode "YELLOW";
_group setBehaviour "COMBAT"
_wp = [_group, 0];
_pattern = _group getVariable["wpPattern",[]];
_index = _group getVariable["wpIndex",0];
_index = _index + 1;
_minDis = _group getVariable["minDis",0];
_maxDis = _group getVariable["maxDis",0];
dir = (_group getVariable["wpDir",0]) + _group getVariable["wpArc",360/5];
_group setVariable["wpDir",_dir];

diag_log format["_fnc_setNextWaypoint: ->  _minDis = %1 | _maxDis = %2 | _arc = %3",_minDis,_maxDis,_arc];
if (_index >= (count _pattern)) then
{
	_index = 0;
} else {
	diag_log format["_fnc_setNextWaypoint: -> waypoint index for group %1 is currently %2 with _pattern = %4 and count _pattern = %3",_group,_index, count _pattern,_pattern];	
};

_group setVariable["wpIndex",_index];
_type = _pattern select _index;

#ifdef blck_debugMode
diag_log format["_fnc_setNextWaypoint: -> waypoint for group %1 to be updated to mode %2 at position %3 with index %4",_group,_type,waypointPosition  _wp, _index];
#endif

// revisit this to account for dead units. use waypointPosition if possible.
_wpPos = waypointPosition  _wp;

_wp setWaypointType _type;
_wp setWaypointName toLower _type;
if (_type isEqualTo (toLower "move"))  then
{ 
	_dis = (_minDis) + random( (_maxDis) - (_minDis) );
	if (_group getVariable["wpMode",""] isEqualTo "random") then 
	{
		_dir = random(360)
	} else {
		_dir = _group getVariable["wpDir",0] + _group getVariable["wpArc",360/5];
	};
	_group setVariable["wpDir",_dir];
	_oldPos = waypointPosition _wp;

	_newPos = (_group getVariable ["patrolCenter",_wpPos]) getPos[_dis,_arc];
	_wp setWPPos [_newPos select 0, _newPos select 1];

	#ifdef blck_debugMode
	diag_log format["_fnc_setNextWaypoint: -- > for group %5 | _dis = %1 | _arc = %2 _oldPos = %3 | _newPos = %4",_dis,_arc,_oldPos,_newPos,_group];
	#endif
	
	_wp setWaypointTimeout [1.0,1.1,1.2];
	//_wp setWaypointTimeout [20,25,30];
} else {
	_wp setWaypointTimeout [20,25,30];
	_newPos = _wpPos;
	_wp setWPPos _newPos;

	#ifdef blck_debugMode
	diag_log format["_fnc_setNextWaypoint: - waypoint position for group %1 not changed",_group];
	#endif
};

#ifdef blck_debugMode
diag_log format["_fnc_setNextWaypoint: -> waypoint for group %1 set to mode %2 at position %3 with index %4",_group,_type,waypointPosition  _wp, _index];
diag_log format["_fnc_setNextWaypoint:-> waypoint statements for group %1 = %2",_group, waypointStatements [_group,_index]];
#endif

_wp setWaypointBehaviour blck_groupBehavior;
_wp setWaypointCombatMode blck_combatMode;
_group setCurrentWaypoint _wp;



