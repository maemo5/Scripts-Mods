/**
 * ExileServer_object_crash_damageTerritory
 * © 2018 ejik designer
 *
 */

private["_unit","_crash","_radiusMetrsCrash","_group","_getMovePos"];
_unit = _this select 0;
_group = group _unit;
_crash = _unit getVariable ["objectCrash",objNull];
_getMovePos = getPos _crash;
_radiusMetrsCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "radiusMetrsCrash");
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
};
true