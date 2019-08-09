/*
	Author: maca134

	Description:
	Checks whether a triggers state has changed

	Parameter(s):
	_this select 0: trigger (obj)

	_this select 1: trigger id (Number)
*/

private ['_position', '_radius', '_changed', '_args', '_state', '_triggerId', '_players'];
params [
	['_trigger', objNull, [objNull], 5]
];
if (isNull _trigger) exitWith {};

_position = _trigger getVariable ['TRG_position', []];
_radius = _trigger getVariable ['TRG_radius', 10];
_changed = _trigger getVariable ['TRG_changed', {}];
_args = _trigger getVariable ['TRG_args', []];
_state = _trigger getVariable ['TRG_state', []];
_triggerId = _trigger getVariable ['TRG_id', -1];

diag_log format['TRG: Check %1 - %2 - %3', _triggerId, _position, _radius];

_players = [_position, _radius] call TRG_fnc_getPlayers;
if (!(_players isEqualTo _state)) then {
	[_trigger, _players] call TRG_fnc_setTriggerState;
	if (TRG_debug) then {
		if (count _players > 0) then {
			(_trigger getVariable ['TRG_marker', '']) setMarkerColor "ColorRed";
		} else {
			(_trigger getVariable ['TRG_marker', '']) setMarkerColor "ColorGreen";
		};
	};
	diag_log format['TRG: %1 State Changed running code - %2', _triggerId, _players];

	_args call _changed;
};