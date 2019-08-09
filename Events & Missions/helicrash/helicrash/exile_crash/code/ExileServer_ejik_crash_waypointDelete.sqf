/**
 * ExileServer_ejik_crash_waypointDelete
 * © 2018 ejik designer
 *
 */
private["_waypointsGroup"];
_waypointsGroup = _this;
{
	deleteWaypoint _x;
}forEach _waypointsGroup;
true