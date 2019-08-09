/**
 * ExileServer_object_crash_spawnBox
 * © 2018 ejik designer
 *
 */
private["_object","_varnameYawik","_varnameDum","_varnameMarker","_position","_number"];
_object = _this select 0;
_position = getPos _object;
_classBox = getText (configFile >> "cfgCrash" >> "options" >> "classBox");
_betweenTime = getNumber (configFile >> "cfgCrash" >> "options" >> "betweenTime");
_markerCrashEnabled = getNumber (configFile >> "cfgCrash" >> "options" >> "markerCrashEnabled");
_markerCrashText = getText (configFile >> "cfgCrash" >> "options" >> "markerCrashText");
_minCountWeapon = getNumber (configFile >> "cfgCrash" >> "options" >> "mincountWeapon");
_maxCountWeapon = getNumber (configFile >> "cfgCrash" >> "options" >> "maxcountWeapon");
_mincountItems = getNumber (configFile >> "cfgCrash" >> "options" >> "mincountItems");
_maxcountItems = getNumber (configFile >> "cfgCrash" >> "options" >> "maxcountItems");
_countBackpack = getNumber (configFile >> "cfgCrash" >> "options" >> "countBackpack");
_varnameYawik = _object getVariable ["crashYawik",""];
_varnameDum = _object getVariable ["crashDum",""];
_varnameMarker = _object getVariable ["crashMarker",""];

_countWeapon = 0;
if(_minCountWeapon == _maxCountWeapon)then{
    _countWeapon = _minCountWeapon;
}else{
    _countWeapon = floor(random [_minCountWeapon,_maxCountWeapon,_minCountWeapon]);
};
_countItems = 0;
if(_mincountItems == _maxcountItems)then{
    _countItems = _mincountItems;
}else{
    _countItems = round(random [_mincountItems,_maxcountItems,_mincountItems]);
};
_weaponBox = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "weaponBoxPrimary");
_rifleOptics = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "rifleOptics");
_backpacks = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "backpacks");
_itemmy = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "itemmy");

//deleteVehicle _object;
_timeDelete = time + _betweenTime;
_object setVariable ["ExileDiedAt", _timeDelete];
_randPos = _position select 0;
_randPos2 = _position select 1;
_boxPos = _randPos + 5;
_boxPos2 = _randPos2 + 5;
				
_vehicle_20 = objNull;
if (true) then
{
	_veh5 = createVehicle ["test_EmptyObjectForFireBig", [_randPos, _randPos2, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _veh5;
	_veh5 setVehicleVarName _varnameDum;
	_object setVariable ["crashDum",_veh5];
	_veh5 setPos [_randPos, _randPos2, 0];
};

_vehicle_22 = objNull;
if (true) then
{
	_veh5 = createVehicle [_classBox, [_boxPos, _boxPos2, 0], [], 10, "CAN_COLLIDE"];
	_vehicle_22 = _veh5;
	_veh5 setPos [_boxPos, _boxPos2, 0];
	clearItemCargoGlobal _veh5;
	clearWeaponCargoGlobal _veh5;
	clearMagazineCargoGlobal _veh5;
	clearBackPackCargoGlobal _veh5;
	_veh5 setVehicleVarName _varnameYawik;
	_object setVariable ["crashYawik",_veh5];
	if(_countWeapon > 0)then{
		for "_i" from 1 to _countWeapon do{
			_wpn = _weaponBox select (random (count _weaponBox -1));
			_wpn = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "weaponAmmo" >> _wpn);
			if((count _wpn) > 0)then{
				_veh5 addWeaponCargoGlobal [(_wpn select 0), 1];
				_veh5 addMagazineCargoGlobal [(_wpn select 1), (_wpn select 2)];
			};
            if((count _rifleOptics) > 0)then{
			    _veh5 addItemCargoGlobal [_rifleOptics select (random (count _rifleOptics -1)), 1];
			};
		};
	};
	if(_countItems > 0)then{
		for "_i" from 1 to _countItems do{
			_veh5 addItemCargoGlobal [_itemmy select (random (count _itemmy -1)), 1];
		};
	};
	if(_countBackpack > 0)then{
		for "_i" from 1 to _countBackpack do{
			_veh5 addBackpackCargoGlobal [_backpacks select (random (count _backpacks -1)), 1];
		};
	};
};

if(_markerCrashEnabled == 1)then{
    _marker2 = createMarker [_varnameMarker, [_boxPos, _boxPos2, 0]];
    _marker2 setMarkerType "mil_objective";
    _marker2 setMarkerText _markerCrashText;
    _marker2 setMarkerColor "ColorBlack";
};
true