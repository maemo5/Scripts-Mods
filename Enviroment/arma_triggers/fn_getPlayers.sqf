/*
	Author: maca134

	Description:
	Gets a list of players, ordered by distance within an area

	Parameter(s):
	_this select 0: position (Array)

	_this select 1: radius (Number)

	Returns:
	Array
*/
private ['_players'];
params [
	['_position', [], [[]], [2,3]],
	['_radius', -1, [0]]
];
if (_position isEqualTo []) exitWith {};
if (_radius isEqualTo -1) exitWith {};

_players = [];
{
	if (alive _x && isPlayer _x && (_x distance2D _position) < _radius) then {
		_players pushBack _x;
	};
} forEach allPlayers;

_players = [
	_players,
	[],
	{owner _x}
] call BIS_fnc_sortBy;

_players