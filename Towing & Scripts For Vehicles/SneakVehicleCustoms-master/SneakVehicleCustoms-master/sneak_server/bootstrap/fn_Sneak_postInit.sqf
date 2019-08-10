/********************************************************************
 * sneak_server
 * file: sneak_server\bootstrap\fn_Sneak_postInit.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ["_page", "_pageSize", "_vehicleIdAndSkin", "_count", "_allVehicles", "_skinTextures"];
_page = 0;
_pageSize = 100;
_vehicleIdAndSkin = format ["getVehicleSkinIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
_count = count vehicles;
_allVehicles = vehicles;
diag_log "[SNEAK_CUSTOMS]applying custom skins";
diag_log format ["[SNEAK_CUSTOMS]found %1 vehicles", _count];

for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do {
	if !(isNil {((_allVehicles select _i) getVariable "ExileDatabaseID")}) then {
		for[{_j = 0}, {_j < (count _vehicleIdAndSkin)}, {_j = _j + 1}] do {
			if(((_vehicleIdAndSkin select _j) find ((_allVehicles select _i) getVariable "ExileDatabaseID")) != -1) then {
				_skinTextures = getArray(missionConfigFile >> "CfgSneakCustoms" >> ((_vehicleIdAndSkin select _j) select 1) >> "hiddenSelectionsTextures");
				diag_log format ["[SNEAK_CUSTOMS]applying skin %1, to ID %2", ((_vehicleIdAndSkin select _j) select 1), ((_vehicleIdAndSkin select _j) select 0)];
				{
					(_allVehicles select _i) setObjectTextureGlobal [_forEachIndex, _x];
				} forEach _skinTextures;
			};
		};
	};
};
diag_log "[SNEAK_CUSTOMS]applied all custom skins";
 
true