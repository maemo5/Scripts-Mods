/**
 * ExileServer_object_tree_database_load
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private["_treeID", "_data", "_position", "_Regrow", "_Tree","_randBush","_BushObject"];
_treeID = _this;
_data = format ["loadTree:%1", _treeID] call ExileServer_system_database_query_selectSingle;
_position = [_data select 0, _data select 1, 0];
_Regrow = _data select 3;
(nearestTerrainObjects [_position, [], 1, false, true]) params [["_Tree", objNull, [objNull]]];

// I don't want to fire off every single mark tree q every restart.
// So, lets set something in the namespacesomething and each X times fire off to db and reset missionnamespace var to 0.
// So lets just assume one restarts his server every 4 hours.

FuckingTrees = profileNamespace getVariable "FuckingTrees";
if (isNil "FuckingTrees") then
{
	FuckingTrees = 0;
	profileNamespace setVariable ["FuckingTrees",FuckingTrees];
	saveProfileNamespace;
	FuckNo = false;
}
else
{
	if (FuckingTrees >= FuckingWhen) then 
	{
		FuckingTrees = 0;
		profileNamespace setVariable ["FuckingTrees",FuckingTrees];
		saveProfileNamespace;
		FuckNo = true;
	} else {
		FuckNo = false;
		FuckingTrees = FuckingTrees + 1;
		profileNamespace setVariable ["FuckingTrees",FuckingTrees];
		saveProfileNamespace;
	};
};	
switch (_Regrow) do
{
	case 0:
	{
		if (DamnTreeDebug) then
		{
			format ["Hiding Tree:%1 @ %2", _Tree, _Position] call ExileServer_TreeLogging_log;
		};
		_Tree hideObjectGlobal true;
		_randBush = selectRandom ["a3\plants_f\clutter\c_bigFallenBranches_pine03.p3d","a3\plants_f\clutter\c_bigFallenBranches_pine02.p3d","a3\plants_f\clutter\c_bigFallenBranches_pine.p3d"];
		_BushObject = createSimpleObject [_randBush,[0,0,0]]; 
		_BushObject setDir random 360; 
		_BushObject setPosATL [_position select 0,_position select 1, 0]; 
		_BushObject setVectorUp surfaceNormal position _BushObject;
		if (DamnTreeDebug) then
		{
			format ["Created replacement bush at Tree:%1 with NETID: NONE", _BushObject] call ExileServer_TreeLogging_log;
		};
		if (FuckNo) then
		{
			format ["MarkTree:%1", _treeID] call ExileServer_system_database_query_fireAndForget;
		};
	};
	case 1:
	{
		if (DamnTreeDebug) then
		{
			format ["Hiding Tree:%1 @ %2", _Tree, _Position] call ExileServer_TreeLogging_log;
		};
		_Tree hideObjectGlobal true;
		_BushObject = createSimpleObject ["a3\plants_f\clutter\c_Thistle_High_Dead.p3d",[0,0,0]]; 
		_BushObject setDir random 360; 
		_BushObject setPosATL [_position select 0,_position select 1, 0]; 
		_BushObject setVectorUp surfaceNormal position _BushObject;
		if (DamnTreeDebug) then
		{
			format ["Created replacement bush at Tree:%1 with NETID: NONE", _BushObject] call ExileServer_TreeLogging_log;
		};
		if (FuckNo) then
		{
			format ["MarkTree:%1", _treeID] call ExileServer_system_database_query_fireAndForget;
		};
	};
	case 2:
	{
		if (DamnTreeDebug) then
		{
			format ["Hiding Tree:%1 @ %2", _Tree, _Position] call ExileServer_TreeLogging_log;
		};
		_Tree hideObjectGlobal true;
		_BushObject = createSimpleObject ["a3\plants_f\bush\b_neriumo2d_f.p3d",[0,0,0]]; 				
		_BushObject setDir random 360; 
		_BushObject setPosATL [_position select 0,_position select 1, 0]; 
		_BushObject setVectorUp surfaceNormal position _BushObject;
		if (DamnTreeDebug) then
		{
			format ["Created replacement bush at Tree:%1 with NETID %2", _BushObject, _BushId] call ExileServer_TreeLogging_log;
		};
		if (FuckNo) then
		{
			format ["MarkTree:%1", _treeID] call ExileServer_system_database_query_fireAndForget;
		};
	};
	case 3:
	{
		if (DamnTreeDebug) then
		{
			format ["Hiding Tree:%1 @ %2", _Tree, _Position] call ExileServer_TreeLogging_log;
		};
		_Tree hideObjectGlobal true;
		_randBush = selectRandom ["Exile_Plant_BrownBush","Exile_Plant_GreenBush3","Exile_Plant_GreenBush5"];
		_BushObject = createVehicle  [_randBush,[0,0,0], [], 0, "NONE"];
		_BushObject setDir random 360; 
		_BushObject setPosATL [_position select 0,_position select 1, 0]; 
		_BushObject setVectorUp surfaceNormal position _BushObject;
		if (DamnTreeDebug) then
		{
			format ["Created replacement bush at Tree:%1 with NETID %2", _BushObject, _BushId] call ExileServer_TreeLogging_log;
		};
		if (FuckNo) then
		{
			format ["MarkTree:%1", _treeID] call ExileServer_system_database_query_fireAndForget;
		};
	};
	case 4:
	{
		if (DamnTreeDebug) then
		{
			format ["REVIVE Tree:%1 @ %2 with ID: %3", _Tree, _Position, _treeID] call ExileServer_TreeLogging_log;
		};
		format ["DeleteTree2:%1", _treeID] call ExileServer_system_database_query_fireAndForget;
	};
};
true
