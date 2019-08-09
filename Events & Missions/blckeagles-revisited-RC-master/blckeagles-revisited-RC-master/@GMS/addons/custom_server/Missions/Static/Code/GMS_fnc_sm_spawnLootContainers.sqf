/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_objects","_coords"];
private["_object"];

if !(_objects isEqualTo []) exitWith
{  //  Spawn loot crates where specified in _objects using the information for loot parameters provided for each location.
	{
		#ifdef blck_debugMode
		if (blck_debugLevel > 2) then
		{
			diag_log format["_fnc_sm_spawnLootContainers (21):->  _x = %1",_x];
		};
		#endif
		//diag_log format["_fnc_sm_spawnLootContainers (21):->  _x = %1",_x];	
		// 	[selectRandom blck_crateTypes,[22904.8,16742.5,6.30195],[[0,1,0],[0,0,1]],[true,false], _crateLoot, _lootCounts]
		_x params["_crateClassName","_cratePosASL","_vectorDirUp","_allowDamageSim","_crateLoot","_lootCounts"];	
		_crate = [_cratePosASL, _crateClassName] call blck_fnc_spawnCrate;
		[_crate, _crateLoot,_lootCounts] call blck_fnc_fillBoxes;
	} forEach _objects;
};

// In the case where no loot crate parameters are defined in _objects just spawn 1 at the center of the mission.
if (_objects isEqualTo []) then
{
	_crateType = selectRandom blck_crateTypes;
	_crate = [_coords,_crateType] call blck_fnc_spawnCrate;
	[_crate,blck_BoxLoot_Red,blck_lootCountsGreen] call blck_fnc_fillBoxes;
};

