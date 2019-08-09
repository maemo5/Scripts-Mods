/**
 * Pre-Initialization
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ['_code', '_function', '_file', '_fileContent'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _isLocked = _x select 2;

    if (_isLocked isEqualTo false) then
    {
        if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
        {
            _file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
        };
    };

    _fileContent = preprocessFileLineNumbers _file;

    if (_fileContent isEqualTo '') then
    {
        diag_log (format ['ERROR: Override of %1 in CfgExileCustomCode points to a non-existent file: %2. Defaulting to vanilla Exile code!', _function, _file]);
   
        _fileContent = preprocessFileLineNumbers (_x select 1);
    };

    _code = compileFinal _fileContent;                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
    ['ExileServer_object_crash_heliSpawn', 'exile_crash\code\ExileServer_object_crash_heliSpawn.sqf', false],
	['ExileServer_object_crash_damageTerritory', 'exile_crash\code\ExileServer_object_crash_damageTerritory.sqf', false],
	['ExileServer_object_crash_vehicleSpawn', 'exile_crash\code\ExileServer_object_crash_vehicleSpawn.sqf', false],
	['ExileServer_object_crash_sadTerritory', 'exile_crash\code\ExileServer_object_crash_sadTerritory.sqf', false],
	['ExileServer_object_crash_controllerSpawn', 'exile_crash\code\ExileServer_object_crash_controllerSpawn.sqf', false],
	['ExileServer_object_crash_killedBots', 'exile_crash\code\ExileServer_object_crash_killedBots.sqf', false],
	['ExileServer_object_crash_spawnBox', 'exile_crash\code\ExileServer_object_crash_spawnBox.sqf', false],
	['ExileServer_ejik_crash_waypointDelete', 'exile_crash\code\ExileServer_ejik_crash_waypointDelete.sqf', false],
	['ExileServer_object_crash_delete', 'exile_crash\code\ExileServer_object_crash_delete.sqf', false],
	['ExileServer_object_crash_bots', 'exile_crash\code\ExileServer_object_crash_bots.sqf', false]
];
true