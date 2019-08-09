/*
	Mission Template by Ghostrider [GRG]
	Mission Compositions by Bill prepared for ghostridergaming
	Copyright 2016
	Last modified 3/20/17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\privateVars.sqf";

//diag_log "[blckeagls] Spawning Green Mission with template = default";
_crateLoot = blck_BoxLoot_Green;
_lootCounts = blck_lootCountsGreen;
_startMsg = "An enemy research center was sighted in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Sector at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELIPSE",[225,225],"GRID"];
_markerColor = "ColorGreen";
_markerMissionName = "Research Center";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AltisColonial_F",[12.9492,-14.2676,0],0,[true,false]],
	["Land_Research_HQ_F",[-40.4258,-57.4492,-7.15256e-007],0,[true,false]],
	["Land_Research_HQ_F",[79.9063,68.1406,2.38419e-007],0,[true,false]],
	["Land_Research_house_V1_F",[-27.6895,70.9883,0],0,[true,false]],
	["Land_Research_house_V1_F",[-110.166,14.3926,0],0,[true,false]],
	["Land_Research_house_V1_F",[54.5078,-70.8457,0],0,[true,false]],
	["Land_Cargo_Patrol_V1_F",[111.865,11.9375,9.53674e-007],0,[true,false]],
	["Land_Cargo_HQ_V2_F",[-115.473,-44.5977,-4.76837e-007],0,[true,false]],
	["Land_SharpRock_apart",[-59.6836,-59.5996,-4.76837e-007],0,[true,false]],
	["Land_W_sharpRock_apart",[-81.6973,-42.4082,-4.76837e-007],0,[true,false]],
	["Land_SharpRock_apart",[-96.2168,-5.32031,4.76837e-007],0,[true,false]],
	["Land_Limestone_01_apart_F",[-79.2305,43.4219,0],0,[true,false]],
	["Land_Limestone_01_apart_F",[-50.2344,82.4746,0],0,[true,false]],
	["Land_BluntRock_apart",[3.88281,-71.5488,-2.38419e-007],0,[true,false]],
	["Land_Limestone_01_apart_F",[35.8926,-77.5918,0],0,[true,false]],
	["Land_Limestone_01_apart_F",[78.541,-52.3926,-4.76837e-007],0,[true,false]],
	["Land_Limestone_01_apart_F",[103.91,-6.88867,0],0,[true,false]],
	["Land_BluntRock_apart",[-11.5586,93.9688,-2.38419e-007],0,[true,false]],
	["Land_W_sharpStone_02",[54.7344,96.7012,0],0,[true,false]],
	["Land_BluntRock_apart",[77.4453,88.8301,-2.38419e-007],0,[true,false]],
	["Land_SharpRock_apart",[104.758,45.668,0],0,[true,false]],
	["Land_Limestone_01_02_F",[99.5117,23.752,-4.76837e-007],0,[true,false]],
	["Land_Limestone_01_02_F",[49.8477,50.0039,0],0,[true,false]],
	["Land_Limestone_01_02_F",[-8.14844,32.2227,4.76837e-007],0,[true,false]],
	["Land_Limestone_01_02_F",[-35.334,35.1465,-2.38419e-007],0,[true,false]],
	["Land_SharpStone_02",[-28.6523,1.33398,4.76837e-007],0,[true,false]],
	["Land_SharpStone_02",[-58.707,-7.46094,-4.76837e-007],0,[true,false]],
	["Land_Limestone_01_02_F",[64.5078,31.9707,0],0,[true,false]],
	["Land_Limestone_01_02_F",[33.7246,11.5469,0],0,[true,false]],
	["Land_SharpStone_02",[69.4277,-3.20313,0],0,[true,false]],
	["Land_SharpStone_02",[53.7227,-40.1777,-2.38419e-007],0,[true,false]],
	["Land_Limestone_01_02_F",[-6.26563,-46.0996,-4.76837e-007],0,[true,false]]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = 
	[	
	["B_HMG_01_high_F",[27.8945,100.275,0],0,[true,false]],
	["B_HMG_01_high_F",[-84.7793,72.2617,9.53674e-007],0,[true,false]],
	["B_G_Mortar_01_F",[76.0586,66.9414,-3.1265],0,[true,false]]
	]; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	//[[-52.6523,15.8281,-0.00143838],4,6,"Green",4,8],
	//[[-48.6113,-38.877,-0.00143886],4,6,"Green",4,8],
	//[[18.4492,-39.5684,-0.00143838],4,6,"Green",4,8],
	//[[42.6504,31.6621,-0.00143886],4,6,"Green",4,8],
	//[[7.51563,46.4531,-0.001438864],4,6,"Green",4,8],
	[[-8.99219,-11.623,-0.00143838],4,6,"Green",4,8]
	]; // Can be used to define spawn positions of AI patrols

_missionPatrolVehicles = [
	//[selectRandom blck_AIPatrolVehiclesGreen,[27.8945,100.275,0],0,[true,false]],
	//[selectRandom blck_AIPatrolVehiclesGreen,[-84.7793,72.2617,9.53674e-007],0,[true,false]],
	[selectRandom blck_AIPatrolVehiclesGreen,[-87.8457,-109.947,7.15256e-007],0,[true,false]]
];  // can be used to define the spawn positions of vehicle patrols

//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Green;
_maxNoAI = blck_MaxAI_Green;
_noAIGroups = blck_AIGrps_Green;
_noVehiclePatrols = blck_SpawnVeh_Green;
_noEmplacedWeapons = blck_SpawnEmplaced_Green;
_uniforms = blck_SkinList;
_headgear = blck_headgear;

//_endCondition = "allKilledOrPlayerNear";  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
