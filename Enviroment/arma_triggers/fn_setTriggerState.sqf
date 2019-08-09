/*
	Author: maca134

	Description:
	Sets trigger state

	Parameter(s):
	_this select 0: trigger (obj)

	_this select 1: array of players inside the area (Array)

	Returns:
	Array
*/

params [
	['_trigger', objNull, [objNull]],
	['_state', [], [[]]]
];
if (isNull _trigger) exitWith {false};
_trigger setVariable ['TRG_state', _state];