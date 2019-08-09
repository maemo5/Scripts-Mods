private ['_marker', '_logic'];
params [
	['_position', [], [[]], [2,3]],
	['_radius', -1, [0]],
	['_changed', {}, [{}]],
	['_args', [], [[]]]
];
if (_position isEqualTo []) exitWith {-1};
if (_radius isEqualTo -1) exitWith {-1};
if (_changed isEqualTo {}) exitWith {-1};

TRG_pointer = TRG_pointer + 1;

_logic = "Logic" createVehicleLocal _position;
_logic setVariable ["TRG_position", _position];
_logic setVariable ["TRG_radius", _radius];
_logic setVariable ["TRG_changed", _changed];
_logic setVariable ["TRG_args", _args];
_logic setVariable ["TRG_state", []];
_logic setVariable ["TRG_id", TRG_pointer];

diag_log format['TRG: Create %1 - %2 - %3', TRG_pointer, _position, _radius];

if (TRG_debug) then {
	_marker = createMarker [format['trigger-%2', TRG_pointer], _position];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_radius, _radius];
	_marker setMarkerColor "ColorGreen";
	_logic setVariable ["TRG_marker", _marker];
};

TRG_triggers pushBack TRG_pointer;
TRG_triggers pushBack _logic;
_logic