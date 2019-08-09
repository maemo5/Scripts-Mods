/**
 * ExileServer_system_database_query_insertSingle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_parameters", "_query", "_result"];
_parameters = _this;
 diag_log format["insertSingle>>>>> _parameters = %1",_parameters];
_query = [0, ExileServerDatabaseSessionId, _parameters] joinString ":";
_result = call compile ("extDB2" callExtension _query);
 diag_log format["_query = %1 _result = %2",_query,_result];
(_result select 1) select 0