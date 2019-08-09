/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

/**
 * _player OBJECT player
 * _request STRING request
 * _params ARRAY additional parameters
 */ 
params['_player', '_request', '_params'];

private _adminList = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "AdminList");
private _moderatorList = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorList");
private _moderatorCmds = [];
private _result = true;
private _tmp = '';
private _mod = '';

try 
{
    
    if !( getPlayerUID _player in (_adminList + _moderatorList) ) then {
		['loginfailed', ''] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
        throw format ["Player %1 with UID %2 does not have access", name _player, getPlayerUID _player];
    };
    
    diag_log format ["[ADMINTOOLKIT] Calling %1 from player %2, params: %3", _request, name _player, str _params];

    // if its a moderator, check if commands is allowed
    if ( getPlayerUID _player in _moderatorList ) then {
		_moderatorCmds = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorCmds") + getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorExtCmds");
        if !( _request in _moderatorCmds ) then {
            throw format [ "Moderator %1 has no access to admin command %2 with params %3 ", name _player, _request, str _params];
        };
    };
        
    switch (_request) do {
	//system
		case 'login':
		{
			// send login ok with moderator cmdlets
			['loginok', _moderatorCmds] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
	//player
		// Receive players from server to avoid additional BE filters (client callback required)
		// Example: [player, 'getplayers']
		case "getplayers":
		{
			_tmp = ['', true] call AdminToolkit_network_fetchPlayer;
			
			[_request, _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		// initialize the spectator mode (client callback required)
		// Example: [player, 'specplayer', netId]
		case "specplayer": {
			_tmp = objectFromNetId (_params select 0);
			if(!(isNil "_tmp") && (typeName _tmp == "OBJECT")) then {
				[_request, netId _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
			};
		};
		case 'message': {
			_tmp = objectFromNetId (_params select 0);
			[owner _tmp, format["Sender: %1", name _player], _params select 1, "", 30] call AdminToolkit_showAAN;
		};
		case 'messageall': {
			[-2, format["Sender: %1", name _player], _params select 0, "", 30] call AdminToolkit_showAAN;
		};
		case 'messageperm': {
			[-2, format["Sender: %1", name _player], _params select 0, ""] call AdminToolkit_showAAN;
		};
		// Give ammo to selected player
		case 'giveammo': {
			_tmp = objectFromNetId (_params select 0);
            if (!(isNil "_tmp") && (typeName _tmp == "OBJECT")) then {
				diag_log format ["[ADMINTOOLKIT] Giving ammo to %1", name _tmp];
				_tmp addMagazines  [(getArray (configFile >> 'CfgWeapons' >> primaryWeapon _tmp >> 'magazines') select 0), 1]; 
			} else {
				diag_log format ["[ADMINTOOLKIT] Failed to give ammo to player %1", str _params];
			};
		};
		// Kick player from server
		// Example: [player, 'kickplayer', <string playername>]
		case "kickplayer":
		{
			_tmp = getText(configFile >> "CfgSettings" >> "AdminToolkit" >> "ServerCommandPassword");
			if(_tmp != "") then {
				_tmp serverCommand format["#kick %1", name (objectFromNetId (_params select 0))];
			};
		};
		// Ban player from server
		// Example: [player, 'banplayer', <string playername>]
		case "banplayer":
		{
			_tmp = getText(configFile >> "CfgSettings" >> "AdminToolkit" >> "ServerCommandPassword");
			if(_tmp != "") then {
				_tmp serverCommand format["#ban %1", name (objectFromNetId (_params select 0))];
			};
		};
		// Teleport the player defined in parameter 0 to players position defined in parameter 2
		// Example: [player, 'tp2player', <string playername>]
        case "tp2player": 
        {
			_tmp = objectFromNetId (_params select 0);
			if(!isNil "_tmp") then {
				_player setPosATL (getPosATL _tmp);
			};
        };
		// Teleport the selected player defined in parameter 2 to players position who has executed the command
		// Example: [player, 'tpplayer', <string playername>]
        case "tpplayer": 
        {
			_tmp = objectFromNetId (_params select 0);
			if(!isNil "_tmp") then {
				_tmp setPosATL (position _player);
			};
        };
	//self	
		// Teleport the admin to coordinates ATL using parameter 2
		// Example: [player, 'tp2pos', <array position>]
        case "tp2pos": {
			//search safe Position for Vehicle Teleport
			if (vehicle _player != _player) then 
			{
				_tmp = [_params, 1, 20, 5, 1, 0, 0] call BIS_fnc_findSafePos;
				vehicle _player setPos _tmp;
			} else {
				_player setPos _params;
			};
        };
		// Enable the god mode (client callback required)
		// Example: [player, 'godmodeon', []]
		case "godmodeon": {
			{ player allowDamage false; } remoteExecCall ["call", owner _player];
			AdminToolkit_GodPlayers pushBackUnique (netId _player);
			diag_log format["[ADMINTOOLKIT] Godmode enabled for %1", name _player];
		};
		// Disable the god mode (client callback required)
		// Example: [player, 'godmodeoff', []]
		case "godmodeoff": {
			{ player allowDamage true; } remoteExecCall ["call", owner _player];
			AdminToolkit_GodPlayers deleteAt (AdminToolkit_GodPlayers find (netId _player));
			diag_log format["[ADMINTOOLKIT] Godmode disabled for %1", name _player];
		};
		//Vehicles
		// spawn a vehicle with className defined in parameter 2 near the admin
		// Example: [player, 'getvehicle', [<vehicleClass>]
        case "getvehicle": {
            //find save position for the vehicle
			_tmp = [position _player, 1, 20, 5, 1, 0, 0] call BIS_fnc_findSafePos;
             _result = (_params select 0) createVehicle _tmp;
        };
		// spawn a vehicle at the position of another player
		// Example: [player, 'givevehicle', [<vehicleClass>, <netId>]]
        case "givevehicle": {
            _tmp = objectFromNetId (_params select 1);
			if(!(isNil "_tmp")) then {
				diag_log format ["[ADMINTOOLKIT] Giving vehicle %1 to %2 ", (_params select 0), name _tmp];
				//find save position for the vehicle
				_mod = [_tmp, 1, 50, 5, 1, 0, 0] call BIS_fnc_findSafePos;
				(_params select 0) createVehicle _mod;
			};
        };
		// remove a vehicle using its netId as parameter
		// Example: [player, 'removevehicle', [<netId>]];
		case "removevehicle": {
			_tmp = objectFromNetId (_params select 0);
			diag_log format ["[ADMINTOOLKIT] Deleting vehicle %1 with netId %2 ", str _tmp, (_params select 0)];
			deleteVehicle _tmp;
		};
		// Weapons Ammo
		// get a weapon for admin who called this command
		// Example: [player, 'getweapon', [<string weaponClass>, <string magazineClass>]]
        case "getweapon": {
            // add magazine first to make sure weapon is being loaded
            _tmp = _params select 1;
            if (_tmp != "") then { _player addMagazineGlobal _tmp; };
            // add the weapon
            _tmp = _params select 0;
            if (_tmp != "") then { _player addWeaponGlobal _tmp; };
        };
		// get magazines defined in parameter 2
		// Example: [player, 'getammo', [<string magazineClass>]]
		case "getammo": {
			_tmp = _params select 0;
            if (_tmp != "") then { _player addMagazines  [_tmp, 1]; };
		};
		// Items Others	
		// add an item to admins inventory
		// Example: [player, 'getitem', [<ItemClass>]]
		case "getitem": {
			_tmp = _params select 0;
			if (typeName _tmp == "STRING") then { _player addItem _tmp; };
		};
		// spawn an object at a position defined in parameter 2
		// Example: [player, 'spawn', [<className>, <position>]]
		case "spawn": {
			_tmp = _params select 0;
			_mod = _params select 1;
			createVehicle [_tmp, _mod, [], 0, "CAN_COLLIDE"];
		};
		// Building
        // build a vehicle and callback the object netId to its client for further action
        // Example: [player, 'build', [<className>]]
		case "buildpers";
        case "build": {
            _tmp = createVehicle [(_params select 0), [0,0,1000], [], 0, "CAN_COLLIDE"];
            _tmp setVariable ["BIS_enableRandomization", false];
	        _tmp enableSimulationGlobal false;
            _tmp allowDamage false;

            _tmp removeAllEventHandlers "HandleDamage";
            [_tmp, owner _player] spawn {
                params['_vehicle', '_owner'];
                _vehicle setOwner _owner; 
                diag_log format["[ADMINTOOLKIT] Setting owner %1 on vehicle %2", str _owner, str _vehicle]; 
            };
			
            [_request, netId _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
        };
		// remoe building which is in player cursor position
		case "buildremove": {
            _tmp = objectFromNetId (_params select 0);
			_mod = _tmp getVariable ["ATK_IsPersistent", false];

            if (_mod) then {
				['BUILDINGS', (getPosATL _tmp)] call AdminToolkit_removePersistent;
				AdminToolkit_IsPersistentSaved = false;
			};

			deleteVehicle _tmp;
        };
		case "buildpersistent": {
			_mod = objectFromNetId (_params select 0);
			_mod setDir (_params select 2);
			_mod setVectorUp [0,0,1];
			_mod setPosATL (_params select 1);
			_mod setVariable ["ATK_IsPersistent", true, true];
			_mod setOwner 2;

			['BUILDINGS', [typeOf _mod, (_params select 1), (_params select 2)] ] call AdminToolkit_savePersistent;
			AdminToolkit_IsPersistentSaved = false;
		};
		case "buildinfopersistent": {
			[_request, [count AdminToolkit_Buildings, AdminToolkit_IsPersistentSaved]] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		case "clearpersistent": {
			// clear buildings from server profile
			['BUILDINGS', nil] call AdminToolkit_removePersistent;
			[] spawn {
				_tmp = [] call AdminToolkit_saveProfile;
			};
			[_request, nil] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		case "savepersistent": {
			[] spawn {
				_tmp = [] call AdminToolkit_saveProfile;
			};
			AdminToolkit_IsPersistentSaved = true;
			[_request, nil] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
        // abort the build progress by deleting the vehicle just created
        case "buildabort": {
            _tmp = objectFromNetId (_params select 0);
            if !(isNull _tmp) then { deleteVehicle _tmp; };
        };
		// used for extensions
		default {
			// load additional extension entries into the main menu (if available)
			if(isClass(missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
				if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions')) then {
					_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions');
					{
						_tmp = _x select 1;
						_mod = compileFinal preprocessFileLineNumbers format["x\admintoolkit_servercfg\extension\%1.sqf", _tmp];
						[_player, _request, _params] call _mod;
					} forEach _extensions;
				};
			};
		};
    }; 
}
catch
{
    diag_log format["[ADMINTOOLKIT]: EXCEPTION: %1", _exception];
};

_result;
