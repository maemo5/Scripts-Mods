/*
	Checks for groups that have not reached their waypoints within a proscribed period
	and redirects them.

	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

params["_group","_maxTime","_radius"];
if ((diag_tickTime > (_group getVariable "timeStamp") + _maxTime) || ( (getPos (leader)) distance2d (_group getVariable "patrolCenter") > _radius)) then
{
	(leader _group) call blck_fnc_changeToMoveWaypoint;
	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then {diag_log format["_fnc_checkGroupWaypointStatus: infantry group %1 stuck, waypoint reset",_group];};
	#endif
};
