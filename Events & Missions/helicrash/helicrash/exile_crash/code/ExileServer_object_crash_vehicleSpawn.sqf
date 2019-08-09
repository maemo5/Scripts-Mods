/**
 * ExileServer_object_crash_vehicleSpawn
 * © 2018 ejik designer
 *
 */
private["_minPlayer","_allcrash","_varnameYawik","_varnameDum","_varnameMarker","_setTimeEndCrash","_endCountVehicleBots","_startCountVehicleBots","_randomCountBoats","_classBots","_betweenTimeEndCrash","_timeNext","_alertCrashContent","_alertCrashTitle","_alertCrashEnabled","_betweenTimeYawik","_betweenTimeBots","_classVehicle","_betweenTime","_betweenTimeCrash","_heightCrash","_crashType","_minPlayerMetrsCrash","_maxPlayerMetrsCrash"];
_minPlayer = getNumber (configFile >> "cfgCrash" >> "options" >> "minPlayer");
_heightCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "heightCrash");
_classVehicle = getText (configFile >> "cfgCrash" >> "options" >> "classVehicle");
_betweenTimeCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTimeCrash");
_crashType = getNumber (configFile >> "cfgCrash" >> "options" >> "crashType");
_minPlayerMetrsCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "minPlayerMetrsCrash");
_maxPlayerMetrsCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "maxPlayerMetrsCrash");
_betweenTime = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTime");
_betweenTimeEndCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTimeEndCrash");
_betweenTimeBots = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTimeBots");
_betweenTimeYawik = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTimeYawik");
_alertCrashEnabled = getNumber (configFile >> "cfgCrash" >> "options" >> "alertCrashEnabled");
_alertCrashTitle = getText (configFile >> "cfgCrash" >> "options" >> "alertCrashTitle");
_alertCrashContent = getText (configFile >> "cfgCrash" >> "options" >> "alertCrashContent");
_classBots = getText (configFile >> "cfgCrash" >> "options" >> "classBoats");
_timeNext = missionNamespace getVariable "heliCrashNextTime";
_allcrash = missionNamespace getVariable ["allCrash",[]];
_startCountVehicleBots = getNumber (configFile >> "cfgCrash" >> "options" >> "startCountVehicleBots");
_endCountVehicleBots = getNumber (configFile >> "cfgCrash" >> "options" >> "endCountVehicleBots");
_randomCountBoats = 0;
if(_startCountVehicleBots == _endCountVehicleBots)then{
    _randomCountBoats = _startCountVehicleBots;
}else{
    _randomCountBoats = floor(random [_startCountVehicleBots,_endCountVehicleBots,_startCountVehicleBots]);
};

_group = grpNull;

_setTimeNext = time + _betweenTime;
missionNamespace setVariable ["heliCrashNextTime",_setTimeNext];

_pl = playableUnits select floor(random count playableUnits);
_posHeli = [getPos _pl,_minPlayerMetrsCrash,_maxPlayerMetrsCrash,5,0,25,0] call BIS_fnc_findSafePos;
_posHeliMove = getPos _pl;
_varnameVeh = "hely";
_firstName = missionNamespace getVariable [_varnameVeh,""];
if!(_firstName isEqualTo "")then{
    _numberVeh = floor(random 1000);
    _varnameVeh = format["hely%1",_numberVeh];
	_varnameYawik = format["heliYaw%1",_numberVeh];
	_varnameDum = format["helidum%1",_numberVeh];
	_varnameMarker = format["helicrash%1",_numberVeh];
}else{
	_varnameYawik = "heliYaw";
	_varnameDum = "helidum";
	_varnameMarker = "helicrash";
};

/* создаем машину */
_vehicle_20 = objNull;
if (true) then
{
	_veh5 = createVehicle [_classVehicle, [_posHeli select 0, _posHeli select 1, 0], [], 10, "CAN_COLLIDE"];
	_vehicle_20 = _veh5;
	_veh5 setVehicleVarName _varnameVeh;
	missionNamespace setVariable [_varnameVeh,_veh5];
	_veh5 setVehicleLock "UNLOCKED";
	_veh5 setPos [_posHeli select 0, _posHeli select 1, 0];
	_veh5 setVectorDir [_posHeliMove select 0,_posHeliMove select 1, 0];
};

_objectVeh = missionNamespace getVariable _varnameVeh;
_objectVeh setVariable ["crashMarker",_varnameMarker];
_objectVeh setVariable ["crashYawik",_varnameYawik];
_objectVeh setVariable ["crashDum",_varnameDum];
_objectVeh setVariable ["endCrash",(time + _betweenTimeEndCrash)];
_allcrash pushBack _objectVeh;
missionNamespace setVariable ["allCrash",_allcrash];

_group_crash = createGroup EAST;
if (true) then
{
	_unit = _group_crash createUnit [_classBots, [_posHeli select 0, _posHeli select 1, 0], [], 0, "CAN_COLLIDE"];
	_unit_60 = _unit;
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;	
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	_unit moveInAny _objectVeh;
};

_group_crash move _posHeliMove;
		
sleep _betweenTimeCrash;
_objectVeh setDamage 1;
_group = [_objectVeh,_posHeliMove,_randomCountBoats,2] call ExileServer_object_crash_bots;
_objectVeh setVariable ["groupCrash",_group];
sleep _betweenTimeYawik;
		
if(_alertCrashEnabled == 1)then{
	["toastRequest", ["InfoTitleAndText", [_alertCrashTitle, _alertCrashContent]]] call ExileServer_system_network_send_broadcast;
}; 
		
[_objectVeh] call ExileServer_object_crash_spawnBox;
[_group,getPos _objectVeh] call ExileServer_object_crash_sadTerritory;
true