/**
 * ExileServer_object_crash_controllerSpawn
 * © 2018 ejik designer
 *
 */
private["_randomCrash","_allcrash","_setTimeNext","_betweenTime","_crashType","_randomCrash","_minPlayer","_timeNext"];
_minPlayer = getNumber (configFile >> "cfgCrash" >> "options" >> "minPlayer");
_crashType = getNumber (configFile >> "cfgCrash" >> "options" >> "crashType");
_betweenTime = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTime");
_timeNext = missionNamespace getVariable "heliCrashNextTime";
_allcrash = missionNamespace getVariable ["allCrash",[]];
_group = grpNull;
if (count playableUnits >= _minPlayer)then{
    if (time > _timeNext)then{
	    
		if(_crashType == 0)then{
		    _randomCrash = floor(random 2) + 1;
			if(_randomCrash == 1)then{
			    call ExileServer_object_crash_heliSpawn;
			};
			
			if(_randomCrash == 2)then{
			    call ExileServer_object_crash_vehicleSpawn;
			};
		}else{
		    if(_crashType == 1)then{
			    call ExileServer_object_crash_heliSpawn;
			};
			
			if(_crashType == 2)then{
			    call ExileServer_object_crash_vehicleSpawn;
			};
		};
	};
};

	
if!(_allcrash isEqualTo [])then{
    {
	    _endCrash = _x getVariable ["endCrash",0];
		if(time > _endCrash)then{
		    _groupCrash = _x getVariable ["groupCrash",0];
		    [_groupCrash,_x] call ExileServer_object_crash_delete;
			_allcrash deleteAt _forEachIndex;
		};
	}forEach _allcrash;
};