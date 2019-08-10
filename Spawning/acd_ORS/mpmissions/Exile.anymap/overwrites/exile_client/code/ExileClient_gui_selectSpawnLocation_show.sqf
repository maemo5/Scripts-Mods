/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
  /*
	modified by d4n1ch
	for ACD_ORS - Exile Only Random Spawn
	mailto: d.e@acd.su
*/
 
private["_display","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex","_spawns_arr"];
disableSerialization;
diag_log "Selecting spawn location...";
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";
createDialog "RscExileSelectSpawnLocationDialog";
waitUntil
{
	_display = findDisplay 24002;
	!isNull _display
};
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlEnable false;
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
_listBox = _display displayCtrl 24002;
lbClear _listBox;
if (isNil "_spawns_arr") then {_spawns_arr = []};
{
	if (getMarkerType _x == "ExileSpawnZone") then
	{
		_spawns_arr = _spawns_arr + [[_x]];
	};
}
forEach allMapMarkers;
_numberOfSpawnPoints = {getMarkerType _x == "ExileSpawnZone"} count allMapMarkers;
if (_numberOfSpawnPoints > 0) then 
{
	_randNum = floor(random _numberOfSpawnPoints);
	_randData = _spawns_arr select _randNum;
	_randomSpawnIndex = _listBox lbAdd "Random";
	_listBox lbSetData [_randomSpawnIndex, _randData select 0];
};
true