/*
	By Ghostrider [GRG]
	Copyright 2018
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_cratesSpawned","_pos","_crate"];
params[ ["_coords", [0,0,0]], ["_cratesToSpawn",[]], ["_loadCrateTiming","atMissionSpawn"],["_spawnCrateTiming","atMissionSpawn"],["_missionState","start"], ["_difficulty","red"] ];

#ifdef blck_debugMode
if (blck_debugLevel >= 2) then
{
	private _params = ["_coords","_cratesToSpawn","_loadCrateTiming","_spawnCrateTiming","_missionState","_difficulty"];
	{
		diag_log format["_fnc_spawnMissionCrates: %1 = %2 with _foreachindex = %3",_params select _foreachindex, _this select _foreachindex, _foreachindex];
	}forEach _this;
};
#endif
//diag_log format["_fnc_spawnMissionLootcrates:  _this = %1",_this];

if ((count _coords) == 2) then // assume only X and Y offsets are provided
{
	_coords pushback 0;; // calculate the world coordinates
};
_cratesSpawned = [];

{
	_x params["_crateType","_crateOffset","_lootArray","_lootCounts",["_crateDir",0]];
	//_pos = [(_coords select 0)+(_crateOffset select 0),(_coords select 1) + (_crateOffset select 1),(_coords select 2)+(_crateOffset select 2)]; // calculate the world coordinates
	private _xParams = ["_crateType","_crateOffset","_lootArray","_lootCounts"];
	{
		private _item = _x;
		//diag_log format["_fnc_spawnMissionCrates: _cratesToSpawn Loop| %1 = %2",_foreachindex, _item select _foreachindex];
	}forEach _x;
	_pos = _coords vectorAdd _crateOffset;
	_crate = [_pos,_crateType] call blck_fnc_spawnCrate;
	_crate setDir _crateDir;
	_crate setVariable["lootArray",_lootArray];
	_crate setVariable["lootCounts",_lootCounts];
	_crate setVariable["difficulty",_difficulty];
	if (_loadCrateTiming isEqualTo "atMissionSpawn" || _missionState isEqualTo "end") then
	{
		//diag_log format["_fnc_spawnMissionCrates: calling blck_fnc_loadMissionCrate for _crate = %1",_crate];
		[_crate] call blck_fnc_loadMissionCrate;
	};
	_cratesSpawned pushback _crate;
	#ifdef blck_debugMode
	if (blck_debugLevel >= 2) then
	{
		diag_log format["_fnc_spawnMissionCrates: _crateType = %1 | _crateOffset = %2 | _lootArray = %3 | _lootCounts = %4",_crateType,_crateOffset,_lootArray,_lootCounts];
		_marker = createMarker [format["crateMarker%1",random(1000000)], _pos];
		_marker setMarkerType "mil_triangle";
		_marker setMarkerColor "colorGreen";	
		_crate setVariable["crateMarker",_marker];
	};
	#endif	
}forEach _cratesToSpawn;

_fnc_dropMissionCrates = {
	private ["_crates","_marker","_markers","_blck_localMissionMarker","_location","_airborneCrates","_curPosCrate"];
	_crates = _this select 0;	
	_markers = [];
	
	{
		// params["_pos","_crate",["_crateVisualMarker",true],["_dropHeight", 150]];
		[(getPos _x), _x, true, 150] call blck_fnc_paraDropObject;
	} forEach _crates;
	
	_airborneCrates = _crates;
	while {count _airborneCrates > 0} do
	{
		uiSleep 1;
		{
			//  (((getPos _crate) select 2) < 3)
			if ((getPos _x) select 2 < 5) then 
			{
				_airborneCrates = _airborneCrates - [_x];
				_chute = _x getVariable["chute",objNull];
				detach _x;
				deleteVehicle _chute;
				_location = getPos _x;
				_blck_localMissionMarker = [format["crateMarker%1%2",_location select 0, _location select 1],_location,"","","ColorBlack",["mil_dot",[]]];
				_marker = [_blck_localMissionMarker] call blck_fnc_spawnMarker;
				//_markers pushBack _marker; 
				blck_temporaryMarkers pushBack [_marker,diag_tickTime + 300];
				//uiSleep 0.5;
				_curPosCrate = getPos _x;
				_x setPos [_curPosCrate select 0, _curPosCrate select 1, 0.3];
				//_x setVectorDirAndUp[[0,1,0],[0,0,1]];
			};
		} forEach _crates;
	};

	//uisleep 300;
	
	//{
		//deleteMarker _x;
	//}forEach _markers
};

if (_spawnCrateTiming in ["atMissionEndAir","atMissionStartAir"]) then 
{
	[_cratesSpawned] spawn _fnc_dropMissionCrates;
};

_cratesSpawned
