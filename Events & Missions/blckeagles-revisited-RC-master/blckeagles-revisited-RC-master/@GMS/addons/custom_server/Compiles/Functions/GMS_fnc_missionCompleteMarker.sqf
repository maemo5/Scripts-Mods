/*

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_location","_MainMarker","_name"];
//diag_log format["blck_fnc_missionCompleteMarker:: _this = %1",_this];
_location = _this select 0;
_name = str(random(1000000)) + "MarkerCleared";
_MainMarker = createMarker [_name, _location];
_MainMarker setMarkerColor "ColorBlack";
_MainMarker setMarkerType "n_hq";
_MainMarker setMarkerText "Mission Cleared";
//uiSleep 300;
//deleteMarker _MainMarker;
blck_temporaryMarkers pushBack [_MainMarker, diag_tickTime + 300];
//diag_log format["missionCompleteMarker complete script for _this = %1",_this];
