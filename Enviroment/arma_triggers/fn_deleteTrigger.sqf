/*
	Author: maca134

	Description:
	Deletes a trigger

	Parameter(s):
	_this select 0: trigger id (Number)

	Returns:
	Bool - Delete successful
*/
private ['_logic'];
params [
	['_id', -1, [0]]
];
if (_id isEqualTo -1) exitWith {false};
_index = TRG_triggers find _id;
if (_index isEqualTo -1) exitWith {false};

diag_log format['TRG: Delete %1', _id];

_logic = TRG_triggers select (_index + 1);

if (TRG_debug) then {
	deleteMarker (_logic getVariable ['TRG_marker', '']);
};

TRG_triggers deleteRange [_index, 2];
deleteVehicle _logic;
true