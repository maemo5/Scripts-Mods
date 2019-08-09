private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_world_loadAllDatabaseTrees', 'TreeLogging\functions\ExileServer_world_loadAllDatabaseTrees.sqf'],
    ['ExileServer_object_tree_database_load', 'TreeLogging\functions\ExileServer_object_tree_database_load.sqf'],
	['ExileServer_TreeLogging_log', 'TreeLogging\functions\ExileServer_TreeLogging_log.sqf']
];

"TreeLogging PreInit finished" call ExileServer_TreeLogging_log;
