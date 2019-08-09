//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_result","_players"];
params[["_pos",[0,0,0]],["_dist",0],["_onFootOnly",false]];
if (_pos isEqualTo [0,0,0]) exitWith {false};
_players = call blck_fnc_allPlayers;
_result = false;
if !(_onFootOnly) then
{
	{
		if ((_x distance2D _pos) < _dist) exitWith {_result = true;};
	} forEach _players;
} else {
	{
		if ( ((_x distance2D _pos) < _dist) && (vehicle _x isEqualTo _x)) exitWith {_result = true;};
	} forEach _players;
};
_result
