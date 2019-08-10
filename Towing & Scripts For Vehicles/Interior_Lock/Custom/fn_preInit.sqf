private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
	["Exile_fnc_lock_toggle","Custom\Functions\Exile_fnc_lock_toggle.sqf"],
	["Exile_fnc_keypadDialog_show","Custom\Functions\Exile_fnc_keypadDialog_show.sqf"],
	["Exile_fnc_vehicle_interaction_keyLock","Custom\Functions\Exile_fnc_vehicle_interaction_keyLock.sqf"]
];

true

