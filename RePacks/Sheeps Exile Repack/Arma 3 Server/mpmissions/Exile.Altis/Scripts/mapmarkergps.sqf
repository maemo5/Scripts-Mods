/**
 * ExileClient_gui_map_event_onDraw
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * GPS Check by Wyqer - 16.12.2015
 *
 */

private["_marker"];

_showGroup = true; // true = Group markers shown if the members have GPS | false = Only player marker if he has a GPS  I_UavTerminal
_GPS_MAP_MARKERS 				= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "GPS_MAP_MARKERS");
/* DO NOT EDIT BELOW */

if (_GPS_MAP_MARKERS isEqualTo 1)then{
if (_showgroup) then
{
    {
        deleteMarkerLocal _x;
    }
    forEach ExileClientPartyMapMarkers;
    {
        if (("ItemGPS" in (assignedItems _x) AND "ItemGPS" in (assignedItems player)) or ("I_UavTerminal" in (assignedItems _x) AND "I_UavTerminal" in (assignedItems player)) or ("ItemGPS" in (assignedItems _x) AND "I_UavTerminal" in (assignedItems player)) or ("I_UavTerminal" in (assignedItems _x) AND "ItemGPS" in (assignedItems player))) then
        {
            _marker = createMarkerLocal [format ["ExilePartyMarker%1", _forEachIndex], getPosVisual _x];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal "ExilePlayer";
            _marker setMarkerDirLocal (getDirVisual _x);
            _marker setMarkerAlphaLocal 0.75;
            if (_x isEqualTo player) then 
            {
                _marker setMarkerColorLocal "ColorBlue";
            }
            else 
            {
                _marker setMarkerColorLocal "ColorGreen";
                _marker setMarkerTextLocal (name _x);
            };
        };
        ExileClientPartyMapMarkers pushBack _marker;
    }
    forEach units (group player);
}
else
{
    if ("ownMapPosition" in allMapMarkers) then
    {
        deleteMarkerLocal "ownMapPosition";
    };
    
    if (("ItemGPS" in (assignedItems player)) or ("I_UavTerminal" in (assignedItems player))) then
    {
        _marker = createMarkerLocal ["ownMapPosition", getPosVisual player];
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "ExilePlayer";
        _marker setMarkerDirLocal (getDirVisual player);
        _marker setMarkerAlphaLocal 0.75;
        _marker setMarkerColorLocal "ColorBlue";
    };
};
}else{
{
	deleteMarkerLocal _x;
}
forEach ExileClientPartyMapMarkers;
{
	_marker = createMarkerLocal [format ["ExilePartyMarker%1", _forEachIndex], getPosVisual _x];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "ExilePlayer";
	_marker setMarkerDirLocal (getDirVisual _x);
	_marker setMarkerAlphaLocal 0.75;
	if (_x isEqualTo player) then 
	{
		_marker setMarkerColorLocal "ColorBlue";
	}
	else 
	{
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTextLocal (name _x);
	};
	ExileClientPartyMapMarkers pushBack _marker;
}
forEach units (group player);
};