// pull trader cities from config
/*
	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private _traderCites = allMapMarkers;
_tc = [];
{
	//if (blck_debugON) then {diag_log format["[blckeagls]  _fnc_getExileLocations :: -- >> Evaluating Markertype of %1", (getMarkerType _x)];};
	if (getMarkerType _x isEqualTo "ExileTraderZone" && blck_blacklistTraderCities) then {
		blck_locationBlackList pushback [(getMarkerPos _x),1000];
		if (blck_debugON) then {diag_log format["[blckeagls]  _fnc_getExileLocations :: -- >> Added Exile Trader location at %1", (getMarkerPos _x)];};
	};
		
	if ((getMarkerType _x isEqualTo "ExileSpawnZone") && blck_blacklistSpawns) then {
		blck_locationBlackList pushback [(getMarkerPos _x),1000];
		if (blck_debugON) then {diag_log format["[blckeagls]  _fnc_getExileLocations :: -- >> Added Exile Spawn location at %1", (getMarkerPos _x)];};
	};
	//  
	if (getMarkerType _x isEqualTo "ExileConcreteMixerZone" && blck_listConcreteMixerZones) then {
		blck_locationBlackList pushback [(getMarkerPos _x),1000];
		if (blck_debugON) then {diag_log format["[blckeagls]  _fnc_getExileLocations :: -- >> Added Exile Concrete Mixer location at %1", (getMarkerPos _x)];};
	};	
}forEach _traderCites;
