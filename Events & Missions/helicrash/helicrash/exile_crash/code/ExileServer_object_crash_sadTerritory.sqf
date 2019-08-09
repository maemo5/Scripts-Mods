/**
 * ExileServer_object_crash_sadTerritory
 * © 2018 ejik designer
 *
 */
 
private["_group","_waypointGroups","_radiusMetrsCrash","_getMovePos"];
_radiusMetrsCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "radiusMetrsCrash");
_group = _this select 0;
_getMovePos = _this select 1;
if!(_group isEqualTo grpNull)then{
	_waypointGroups = waypoints _group;
	_waypointGroups call ExileServer_ejik_crash_waypointDelete;

	_this3 = _group addWaypoint [_getMovePos, _radiusMetrsCrash];
	_this3 setWaypointType "SAD";
	_this3 setWaypointCombatMode "YELLOW";
	_this3 setWaypointSpeed "FULL";
	_this3 setWaypointBehaviour "STEALTH";
	_this3 setWaypointFormation "NO CHANGE";
	_waypoint_61 = _this;

	_this3 = _group addWaypoint [_getMovePos, 0];
	_this3 setWaypointType "CYCLE";
	_this3 setWaypointCombatMode "YELLOW";
	_this3 setWaypointSpeed "FULL";
	_this3 setWaypointBehaviour "STEALTH";
	_this3 setWaypointFormation "NO CHANGE";
	_waypoint_62 = _this;
};
true