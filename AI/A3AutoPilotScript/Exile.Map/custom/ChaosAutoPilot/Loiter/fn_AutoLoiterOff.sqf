_isplayer = _this select 0;
private "_veh";
private "_unit";

if (!(isNull Loiter_Refresh_Handle)) then
{
	terminate Loiter_Refresh_Handle;
};

if (_isplayer == 1) then
{
	_veh = vehicle player;
	_unit = driver _veh;
}
else
{
	_unit = _this select 1;
	_veh = vehicle _unit;
};

_veh deleteVehicleCrew _unit;

//can be used to let other people take over the pilot seat from the bot
_veh setVariable ["ChaosPilot_PilotUnit", nil, true]; //#TODO maybe broadcast global???
_veh setVariable ["ChaosPilot_PreviousOwner", nil, true]; //#TODO maybe broadcast global???
_veh setVariable ["ChaosPilot_AutoPilotOn", nil, true]; //#TODO maybe broadcast global???

if (_isplayer == 1) then
{
	moveOut player;
	player moveInDriver _veh; 
};


//_groupveh = group _veh;
/* while {(count (waypoints _groupveh)) > 0} do
{
	deleteWaypoint ((waypoints _groupveh) select 0);
}; */
//_groupveh addWaypoint [getPos _veh, 0];


_veh enableCopilot true;

ChaosPilot_LoiterInfoTemp = [-1,-1,-1];
ChaosPilot_LoiterInfo set [0, [-1,-1,-1]];