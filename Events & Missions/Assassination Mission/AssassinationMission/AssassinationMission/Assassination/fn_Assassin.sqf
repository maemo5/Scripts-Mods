/*
	File: fn_Assassin.sqf
	Author: Fresqo
	Edits for Exile by Fresqo and ♜ Ģօɾɱ էհε Ølძ
	
	Information:
	   This script was originally written for a Roleplay server but has now been adapted work on Exile.
	   It has been structured to work serverside with DMS however it could also be edited to work without it.
	
	Description: Assassination side mission
		Nikos spawns at one of the random start markers and walks to a random end marker.
		If anyone gets within a certain distance he goes into hiding.
		If he gets to his destination he goes into hiding and initiates the mission again.
		The aim is to snipe him, take his poptabs and item in his backpack and briefcase he drops and sell it.
		
	How to change settings (please don't change these setting here, find them below and change accordingly):
		_startarray = []; <---- put in all your start marker names where you want nikos to start from
		_finarray = []; <---- put in all the end markers for nikos.
		baseRad = ?; <---- change this to your distance you want nikos to go back into hiding if anyone gets too close. default 800
		nikos setMarkerText "Nikos last known location!"; <---- what you want the marker to say
		_spot = random (100); <---- raising this number will make markers more frequent. do not go below 98 or there will be no marker at all
	   _possible_Loot_item = selectRandom ["Exile_Item_SafeKit","Exile_Item_DuctTape","Exile_Item_Defibrillator","Exile_Item_Foolbox"]; <--- Place Classnames of possible loot you want Nikos to carry. Change or add whatever you like.
	   _Nikospoptabs = (10000+(round (random (10000)))); <---- amount of poptabs you want Nikos to carry (Nikos's body will despawn after 3 minutes by default, so it makes sense to set this amount higher than briefcase poptabs)
	   _briefcasepoptabs = (3000+(round (random (8500)))); <---- amount of poptabs you want in his briefcase (do not set too high or it may not have any at all!)
*/

private ["_playersNearMark","_baseRad","_PlayersNeeded","_pos","_obj","_killer","_done","_startarray","_finarray","_startat","_finat","_nikos","_spot","_starter","_dnikos","_Nikospoptabs","_briefcasepoptabs","_possible_Loot_item"]; 
_startarray = ["nikos_start_1","nikos_start_2","nikos_start_3"];
_finarray = ["nikos_1","nikos_2","nikos_3"];
_startat = _startarray select floor random count _startarray;
finat = _finarray select floor random count _finarray;
_starter = getMarkerPos _startat;
_possible_Loot_item = selectRandom ["Exile_Item_SafeKit","Exile_Item_DuctTape","Exile_Item_Defibrillator","Exile_Item_Foolbox"]; //Array of possible loot 
_Nikospoptabs = (10000+(round (random (10000))));
mark = ([_starter, 180, "C_Nikos", EAST] call bis_fnc_spawnvehicle) select 0;
mark addBackpack "B_HuntingBackpack";
mark addItemToBackpack _possible_Loot_item;
mark setVariable["ExileMoney",_Nikospoptabs,true];

baseRad = 800; 
PlayersNeeded = 0; 
done = getMarkerPos finat; 
playersNearMark = {isPlayer _x && _x distance mark < baseRad} count playableUnits > PlayersNeeded; 
sleep 2;
if (playersNearMark) exitWith {deleteVehicle mark;
[] execVM "\x\addons\DMS\Assassination\fn_Assassin.sqf";
};

["toastRequest",["InfoTitleAndText",["Assassination-Mission", format["Nikos has been spotted! Take him out and grab his cash and loot!"]]]] call ExileServer_system_network_send_broadcast;

	mark addEventHandler ["Killed", {
		
		_briefcasepoptabs = (3000+(round (random (8500))));
		_killer = (_this select 1);
		["toastRequest",["InfoTitleAndText",["Assassination-Mission", format["%1 just assassinated Nikos!",name _killer]]]] call ExileServer_system_network_send_broadcast;
		_pos = mark modelToWorld[0,3,0];
		_pos = [_pos select 0, _pos select 1, 0];
		_obj = "Land_Suitcase_F" createVehicle _pos;
		_obj setPos _pos;
		clearItemCargoGlobal _obj;
		_obj setVariable["ExileMoney", _briefcasepoptabs,true];
		_obj addItemCargoGlobal[(_possible_Loot_item select 0),1];
		[mark,_killer] call DMS_fnc_OnKilled;
		[_playerObj,mark,"East","bandit",0] call DMS_fnc_PlayerAwardOnAIKill;
		mark removeAllEventHandlers "Killed";
		["systemChatRequest",[format["Nikos has been killed by %1",name _killer]]] call ExileServer_system_network_send_broadcast;
	}];
	
nikos = createMarker ["Marker_nikos", position mark];
nikos setmarkershape "ICON";
nikos setMarkerType "mil_box";
nikos setMarkerColor "ColorBlack";
nikos setMarkerText "Nikos last known location!";
	
	sleep 2;

[] spawn {
while{alive mark} do 
	{
	playersNearMark = {isPlayer _x && _x distance mark < baseRad} count playableUnits > PlayersNeeded;
	_spot = random (150);
	if (_spot > 97) then {
		"Marker_nikos" setmarkerpos getpos mark;
	};
	sleep 5; 
	mark doMove (getMarkerPos finat);
	mark setSpeedMode "LIMITED";
	};
};

[] spawn {
	waitUntil { (!alive mark) || (mark distance done < 100) || (playersNearMark)};
	if (!alive mark) then
	{
			deleteMarker "Marker_nikos";		
			_dnikos = createMarker ["Marker_dnikos", position mark];
			_dnikos setmarkershape "ICON";
			_dnikos setMarkerType "mil_box";
			_dnikos setMarkerColor "ColorBlack";
			_dnikos setMarkerText "Nikos Dead Body!";
			sleep 180; // Time in seconds till Nikos's dead body will despawn
			deleteVehicle mark;
			deleteMarker _dnikos;
			[] execVM "\x\addons\DMS\Assassination\fn_initAssassin.sqf";
	};

	if (mark distance done < 100) then 
	{
		["toastRequest",["ErrorTitleAndText",["Assassination-Mission", format["Nikos has gone back into hiding!"]]]] call ExileServer_system_network_send_broadcast;
		deleteVehicle mark;
		deleteMarker nikos;
		[] execVM "\x\addons\DMS\Assassination\fn_initAssassin.sqf";
	};
	
	if (playersNearMark) then 
	{
		["toastRequest",["ErrorTitleAndText",["Assassination-Mission", format["Nikos has been spooked and has gone into hiding!"]]]] call ExileServer_system_network_send_broadcast;
		deleteVehicle mark;
		deleteMarker nikos;
		[] execVM "\x\addons\DMS\Assassination\fn_initAssassin.sqf";
	};
};
