// self explanatory. Checks to see if the position is in either a black listed location or near a player spawn. 
// As written this relies on BIS_fnc_findSafePos to ensure that the spawn point is not on water or an excessively steep slope. 
// 
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_findNew","_tries","_coords","_dist","_xpos","_ypos","_newPos","_townPos","_pole"];
private["_minDistFromBases","_minDistFromMission","_minDistanceFromTowns","_minSistanceFromPlayers","_weightBlckList","_weightBases","_weightMissions","_weightTowns","_weightPlayers"];
_findNew = true;
_tries = 0;

_minDistFromBases = blck_minDistanceToBases;
_minDistFromMission = blck_MinDistanceFromMission;
_minDistanceFromTowns = blck_minDistanceFromTowns;
_minSistanceFromPlayers = blck_minDistanceToPlayer;
_weightBlckList = 0.95;
_weightBases = 0.9;
_weightMissions = 0.8;
_weightTowns = 0.7;
_weightPlayers = 0.6;
if (blck_modType isEqualTo "Epoch") then {_pole = "PlotPole_EPOCH"};
if (blck_modType isEqualTo "Exile") then {_pole = "Exile_Construction_Flag_Static"};
_recentMissionCoords = +blck_recentMissionCoords;
{
	if (diag_tickTime > ((_x select 1) + 1200)) then // if the prior mission was completed more than 20 min ago then delete it from the list and ignore the check for this location.
	{
		blck_recentMissionCoords deleteAt (blck_recentMissionCoords find _x);
	};
}forEach _recentMissionCoords;

while {_findNew} do
{
	_findNew = false;
	_coords = [blck_mapCenter,0,blck_mapRange,30,0,5,0] call BIS_fnc_findSafePos;
	//diag_log format["_fnc_findSafePosn: _coords = %1 | _tries = %2",_coords,_tries];
	{
		if ( ((_x select 0) distance2D _coords) < (_x select 1)) exitWith
		{
			_findNew = true;
		};
	} forEach blck_locationBlackList;
	if !(_findNew) then
	{
	{
		if ((_x distance2D _coords) < _minDistFromMission) then {
			_findNew = true;
		};
		}forEach blck_heliCrashSites;	
	};	
	if !(_findNew) then
	{
		{
			if ( (_x distance2D _coords) < _minDistFromMission) exitWith
			{
				_FindNew = true;
			};
		} forEach blck_ActiveMissionCoords;	
	};
	if !(_findNew) then
	{
		{
			if ((_x distance2D _coords) < blck_minDistanceToBases) then
			{
				_findNew = true;
			};
		}forEach  nearestObjects[blck_mapCenter, [_pole], blck_minDistanceToBases];		
	};		
	if !(_findNew) then
	{
		{
			_townPos = [((locationPosition _x) select 0), ((locationPosition _x) select 1), 0];
			if (_townPos distance2D _coords < blck_minDistanceFromTowns) exitWith {
				_findNew = true;
			};
		} forEach blck_townLocations;	
	};		
	if !(_findNew) then
	{
		{
			if (isPlayer _x && (_x distance2D _coords) < blck_minDistanceToPlayer) then 
			{
					_findNew = true;
			};
		}forEach playableUnits;	
	};
	if !(_findNew) then
	{
		// test for water nearby
		_dist = 50;
		for [{_i=0}, {_i<360}, {_i=_i+20}] do
		{
			_xpos = (_coords select 0) + sin (_i) * _dist;
			_ypos = (_coords select 1) + cos (_i) * _dist;
			_newPos = [_xpos,_ypos,0];
			if (surfaceIsWater _newPos) then
			{
				_findNew = true;
				_i = 361;
			};
		};
	};
	if (_findNew) then
	{
		if (_tries in [3,6,9,12,15,18,21]) then
		{
			_minDistFromMission = _minDistFromMission * _weightMissions;
			_minDistFromBases = _minDistFromBases * _weightBases;
			_minSistanceFromPlayers = _minSistanceFromPlayers * _minSistanceFromPlayers;
			_minDistanceFromTowns = _minDistanceFromTowns * _weightTowns;
		};
		if (_tries > 25) then 
		{
			_findNew = false;
		};
	};
};
if ((count _coords) > 2) then 
{
	private["_temp"];
	_temp = [_coords select 0, _coords select 1];
	_coords = _temp;
};
_coords;


