/********************************************************************
 * sneak_server
 * file: sneak_server\code\SneakCustoms_change_skin.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ["_originalTextures", "_paid", "_playerMoney", "_skinPrice", "_tmp", "_currentTimestamp", "_expiringDate", "_currentVehicleNetId", "_sessionId", "_player", "_skinClass", "_currentVehicle", "_currentVehicleId", "_missionPath", "_jpg", "_page", "_pageSize","_currentVehicleIdAndSkin", "_found", "_skinTextures", "_groupsActive", "_liteVersion", "_validUIDs", "_dbEntry"];
diag_log format ["[SNEAK_CUSTOMS]change_skin called"];
_sessionId = _this select 0;
_currentVehicleNetId = (_this select 1);
_currentVehicle = objectFromNetId _currentVehicleNetId;
_skinClass = _this select 2;
_playerNetId = _this select 3;
_skinPrice = _this select 4;
_originalTextures = _this select 5;
_availableForGroup = _this select 6;
_player = objectFromNetId _playerNetId;
_paid = false;
_playerMoney = _player getVariable ["ExileMoney", 0];

_groupsActive = getNumber(configFile >> "CfgSettings" >> "groupsActive");
_liteVersion = getNumber(configFile >> "CfgSettings" >> "liteVersion");

_currentVehicleId = _currentVehicle getVariable ["ExileDatabaseID", -1];

diag_log format ["[SNEAK_CUSTOMS]change_skin request from %1 for group: %2", getPlayerUID _player, _availableForGroup];

diag_log format ["[SNEAK_CUSTOMS] Current VehicleID: %1, Current Vehicle: %2", _currentVehicleId, _currentVehicle];


//Big Ugly if else section
//This stuff happens if you release your testing environment without improving :P
//Well this will be improved to a cleaner try catch structure in the future
//Also: whole code rework to get rid of stuff that can be handled by the newest exile itself

_allowPurchase = true; //always allow purchase to start with
if(_groupsActive ==  1) then {
	if(_liteVersion == 1) then {
		_validUIDs = getArray(configFile >> "CfgSettings" >> "SneakCustomsGroup_" + _availableForGroup >> "uids");
		if(((getPlayerUID _player) in _validUIDs) || (_availableForGroup == "All")) then {
			_allowPurchase = true;
			diag_log format ["[SNEAK_CUSTOMS-01]Allow purchase of %1 for %2", _availableForGroup, getPlayerUID _player];
		} else {
			diag_log format ["[SNEAK_CUSTOMS-01]Decline purchase of %1 skin for %2", _availableForGroup, getPlayerUID _player];
			[_sessionId, "toastRequest", ["ErrorTitleOnly", ["Sorry this Skin is Donators only."]]] call ExileServer_system_network_send_to;
			_allowPurchase = false;
		};
	} else {
		_dbEntry = format ["getGroupNameForUid:%1", getPlayerUID _player] call ExileServer_system_database_query_selectFull;
		if(count _dbEntry != 0 || (_availableForGroup == "All")) then {
			diag_log format ["[SNEAK_CUSTOMS]found DB group_name Record: %1", _dbEntry];
			if((((_dbEntry select 0) select 0) == _availableForGroup) || (_availableForGroup == "All")) then {
				_allowPurchase = true;
				diag_log format ["[SNEAK_CUSTOMS-02]Allow purchase of %1 for %2", _availableForGroup, getPlayerUID _player];
			} else {
				diag_log format ["[SNEAK_CUSTOMS-02]Decline purchase of %1 skin for %2", _availableForGroup, getPlayerUID _player];
				[_sessionId, "toastRequest", ["ErrorTitleOnly", ["Sorry this Skin is Donators only."]]] call ExileServer_system_network_send_to;
				_allowPurchase = false;
			};
		} else {
			diag_log format ["[SNEAK_CUSTOMS-03]Decline purchase of %1 skin for %2", _availableForGroup, getPlayerUID _player];
			[_sessionId, "toastRequest", ["ErrorTitleOnly", ["Sorry this Skin is Donators only."]]] call ExileServer_system_network_send_to;
			_allowPurchase = false;
		};
	};
};

if((_currentVehicleId > -1) AND _allowPurchase) then {
	_page = 0;
	_pageSize = 100;
	_currentVehicleIdAndSkin = format ["getVehicleSkinIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;

	if (_playerMoney >= _skinPrice) then {
		[_player, _skinPrice, _sessionId] call SneakCustoms_spend_money;
		_paid = true;
	} else {
		[_sessionId, "toastRequest", ["ErrorTitleOnly", ["You dont have enough Pop-Tabs."]]] call ExileServer_system_network_send_to;
		_paid = false;
	};

	if(_paid) then {
		_found = false;
		{
			if(((_currentVehicleIdAndSkin select _forEachIndex) find _currentVehicleId) != -1) then {
				_found = true;
			};
		} forEach _currentVehicleIdAndSkin;

		if(_found) then {
			//check if custom skin
			if(configName(inheritsFrom (missionConfigFile >> "CfgSneakCustoms" >> _skinClass)) isEqualTo "SneakCustoms") then {
				format ["updateVehicleWithSkin:%1:%2", _skinClass, _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
				diag_log format ["[SNEAK_CUSTOMS]Changing vehicle %1 to skin %2.", _currentVehicleId, _skinClass];
				_skinTextures = getArray(missionConfigFile >> "CfgSneakCustoms" >> _skinClass >> "hiddenSelectionsTextures");
				[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
			} else {
				_skinTextures = getArray(ConfigFile >>"CfgVehicles" >> _skinClass >> "hiddenSelectionsTextures");
				format["deleteVehicleWithSkin:%1", _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
				format["updateVehicleSkin:%1:%2", _skinTextures, _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
				diag_log format ["[SNEAK_CUSTOMS]Deleting vehicle %1.", _currentVehicleId];
				diag_log format ["[SNEAK_CUSTOMS]Changing Skin in database of non custom vehicle, vehicleId: %1, skin %2", _currentVehicleId, _skinClass];
				[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
			};

		} else {
			//check if custom skin
			if(configName(inheritsFrom (missionConfigFile >> "CfgSneakCustoms" >> _skinClass)) isEqualTo "SneakCustoms") then {
				format ["createVehicleWithSkin:%1:%2", _currentVehicleId, _skinClass] call ExileServer_system_database_query_fireAndForget;
				diag_log format ["[SNEAK_CUSTOMS]Adding vehicle %1 with skin %2", _currentVehicleId, _skinClass];
				_skinTextures = getArray(missionConfigFile >> "CfgSneakCustoms" >> _skinClass >> "hiddenSelectionsTextures");
				[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
			} else {
				_skinTextures = getArray(ConfigFile >>"CfgVehicles" >> _skinClass >> "hiddenSelectionsTextures");
				format["updateVehicleSkin:%1:%2", _skinTextures, _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
				diag_log format ["[SNEAK_CUSTOMS]Changing Skin in database of non custom vehicle, vehicleId: %1, skin %2", _currentVehicleId, _skinClass];
				diag_log format ["_skinTextures %1", _skinTextures];
				[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
			};
		};
	};
} else {
		diag_log "[SNEAK_CUSTOMS]Purchase denied";	
};




