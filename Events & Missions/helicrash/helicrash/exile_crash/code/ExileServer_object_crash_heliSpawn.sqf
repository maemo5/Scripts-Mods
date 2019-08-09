/**
 * ExileServer_object_crash_heliSpawn
 * © 2018 ejik designer
 *
 */
private["_allcrash","_objectVeh","_spawnFly","_varnameYawik","_varnameDum","_varnameMarker","_minPlayer","_setTimeEndCrash","_setTimeNext","_startCountBots","_endCountBots","_randomCountBoats","_betweenTimeEndCrash","_timeNext","_alertCrashContent","_alertCrashTitle","_alertCrashEnabled","_betweenTimeYawik","_betweenTimeBots","_classHeli","_betweenTime","_betweenTimeCrash","_heightCrash","_crashType","_minPlayerMetrsCrash","_maxPlayerMetrsCrash"];
_minPlayer = getNumber (configFile >> "cfgCrash" >> "options" >> "minPlayer");
_heightCrash = getNumber (configFile >> "cfgCrash" >> "options" >> "heightCrash");
_classHeli = getText (configFile >> "cfgCrash" >> "options" >> "classHeli");
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
_timeNext = missionNamespace getVariable "heliCrashNextTime";
_spawnFly = getNumber (configFile >> "cfgCrash" >> "options" >> "spawnFly");
_allcrash = missionNamespace getVariable ["allCrash",[]];

_startCountBots = getNumber (configFile >> "cfgCrash" >> "options" >> "startCountBots");
_endCountBots = getNumber (configFile >> "cfgCrash" >> "options" >> "endCountBots");
_randomCountBoats = 0;
if(_startCountBots == _endCountBots)then{
    _randomCountBoats = _startCountBots;
}else{
    _randomCountBoats = floor(random [_startCountBots,_endCountBots,_startCountBots]);
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
if(_spawnFly == 1)then{
	/* создаем вертолет */
	_vehicle_20 = objNull;
	if (true) then
	{
		_veh5 = createVehicle [_classHeli, [_posHeli select 0, _posHeli select 1, _heightCrash], [], 10, "CAN_COLLIDE"];
		_vehicle_20 = _veh5;
		_veh5 setVehicleVarName _varnameVeh;
		missionNamespace setVariable [_varnameVeh,_veh5];
		_veh5 setVehicleLock "UNLOCKED";
		_veh5 setPos [_posHeli select 0, _posHeli select 1, _heightCrash];
		_veh5 setVectorDir [_posHeliMove select 0,_posHeliMove select 1, _heightCrash];
	};

	_objectVeh = missionNamespace getVariable _varnameVeh;
	_objectVeh setVariable ["crashMarker",_varnameMarker];
	_objectVeh setVariable ["crashYawik",_varnameYawik];
	_objectVeh setVariable ["crashDum",_varnameDum];
	_objectVeh setVariable ["endCrash",(time + _betweenTimeEndCrash)];
	_allcrash pushBack _objectVeh;
	missionNamespace setVariable ["allCrash",_allcrash];

	sleep _betweenTimeCrash;
	_group = [_objectVeh,getPos _objectVeh,_randomCountBoats,1] call ExileServer_object_crash_bots;
	_objectVeh setVariable ["groupCrash",_group];
	//_objectVeh setFuel 0;
	_objectVeh engineOn true;
	_group move _posHeliMove;
	sleep _betweenTimeBots;
	{
	    _x allowDamage false;
		moveOut _x;
		sleep 0.2;
	}forEach units _group;
	_objectVeh setVectorUp [0,0,0];
	waitUntil {sleep 0.1; damage _objectVeh == 1};
	{
	    _x allowDamage true;
	}forEach units _group;
	sleep _betweenTimeYawik;
}else{
    /* создаем вертолет */
	_vehicle_20 = objNull;
	if (true) then
	{
		_veh5 = createVehicle [_classHeli, [_posHeli select 0, _posHeli select 1, _heightCrash], [], 10, "CAN_COLLIDE"];
		_vehicle_20 = _veh5;
		_veh5 setVehicleVarName _varnameVeh;
		missionNamespace setVariable [_varnameVeh,_veh5];
		_veh5 setVehicleLock "UNLOCKED";
		_veh5 setPos [_posHeli select 0, _posHeli select 1, _heightCrash];
		_veh5 setVectorDir [_posHeliMove select 0,_posHeliMove select 1, _heightCrash];
	};

	_objectVeh = missionNamespace getVariable _varnameVeh;
	_objectVeh setVariable ["crashMarker",_varnameMarker];
	_objectVeh setVariable ["crashYawik",_varnameYawik];
	_objectVeh setVariable ["crashDum",_varnameDum];
	_objectVeh setVariable ["endCrash",(time + _betweenTimeEndCrash)];
	_allcrash pushBack _objectVeh;
	missionNamespace setVariable ["allCrash",_allcrash];
	
	waitUntil {sleep 0.1; damage _objectVeh == 1};
	_group = [_objectVeh,getPos _objectVeh,_randomCountBoats,1] call ExileServer_object_crash_bots;
	_objectVeh setVariable ["groupCrash",_group];
    sleep _betweenTimeYawik;
};
		
if(_alertCrashEnabled == 1)then{
	["toastRequest", ["InfoTitleAndText", [_alertCrashTitle, _alertCrashContent]]] call ExileServer_system_network_send_broadcast;
}; 
		
[_objectVeh] call ExileServer_object_crash_spawnBox;
[_group,getPos _objectVeh] call ExileServer_object_crash_sadTerritory;
true