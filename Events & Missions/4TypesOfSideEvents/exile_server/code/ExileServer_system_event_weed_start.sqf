/**
 * ExileServer_system_event_supplyBox_start
 * 
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
 // Modified to make it an Weed mission by GolovaRaoul, all credits to Exile Mod Team
 // Credtis to the orignal idea, @Aidem
 // https://epochmod.com/forum/topic/3779-4-types-of-side-missions-events/
 
private["_marker","_config","_markerTime","_filteredAirportPositions","_dropAltitude","_dropRadius","_boxType","_airportPosition","_position","_marker","_box","_itemClassName","_itemCount","_i","_supplySmoke","_parachute"];
_config = configFile >> "CfgSettings" >> "Events" >> "weed";
_markerTime = getNumber (_config >> "markerTime");
_config = configFile >> "CfgSettings" >> "Events" >> "weed";
_dropRadius = getNumber (_config >> "dropRadius");			
_randomPosition = [[7000,7000,0], 1, 7000, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_boxHeight = [0];
_randomPositionCalculated = _randomPosition + _boxHeight;	
_position = [_randomPositionCalculated, 500] call ExileClient_util_math_getRandomPositionInCircle;
["toastRequest", ["InfoTitleAndText", ["Weed Farm", "Some weed plants managed to grow in the battlefield. Go harvest them! Don't forget to bring a knife! Check the green circle on your map for the location!"]]] call ExileServer_system_network_send_broadcast;

// Create marker
_marker = 		createMarker [ format["ExileSupplyBox%1", diag_tickTime], _position];
_marker 		setMarkerShape "ELLIPSE";
_marker 		setMarkerColor "ColorGreen";
_marker 		setMarkerBrush "SolidBorder";
_marker 		setMarkerSize [150,150];

_weed1 = createVehicle ["CUP_p_fiberPlant_EP1",[(_position select 0)+5,(_position select 1)+5,0], [], 0, "NONE"];
_weed2 = createVehicle ["CUP_p_fiberPlant_EP1",[(_position select 0)-5,(_position select 1)+5,0], [], 0, "NONE"];
_weed3 = createVehicle ["CUP_p_fiberPlant_EP1",[(_position select 0)+5,(_position select 1)-5,0], [], 0, "NONE"];
_weed4 = createVehicle ["CUP_p_fiberPlant_EP1",[(_position select 0)-5,(_position select 1)-5,0], [], 0, "NONE"];
_weed5 = createVehicle ["CUP_p_fiberPlant_EP1",_position, [], 0, "NONE"];
uiSleep (60 * _markerTime);
deleteMarker _marker;