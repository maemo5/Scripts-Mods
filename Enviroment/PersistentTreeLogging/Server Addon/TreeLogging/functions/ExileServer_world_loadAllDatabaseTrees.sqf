/**
 * ExileServer_world_loadAllDatabaseTrees
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_continueLoading", "_page", "_pageSize", "_TreeIDs", "_numberOfTrees", "_i"];
"Loading trees from database..." call ExileServer_TreeLogging_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_TreeIDs = format ["loadTreeIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_numberOfTrees = count _TreeIDs;
	if (_numberOfTrees > 0) then 
	{
		for "_i" from 0 to _numberOfTrees - 1 do 
		{
			((_TreeIDs select _i) select 0) call ExileServer_object_tree_database_load;
		};
	};
	_page = _page + 1;
	if (_numberOfTrees < 100) then
	{
		_continueLoading = false;
	};
};
format ["Done loading and smashed %1 tree's into something else", _numberOfTrees] call ExileServer_TreeLogging_log;
true
