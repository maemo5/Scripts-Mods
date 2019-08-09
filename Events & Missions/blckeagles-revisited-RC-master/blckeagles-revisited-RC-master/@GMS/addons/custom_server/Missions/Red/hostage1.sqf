/*
	Mission Template by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\privateVars.sqf";

//diag_log "[blckeagls] Spawning Blue Mission with template = default2";

_crateLoot = blck_BoxLoot_Red;
_lootCounts = blck_lootCountsRed;
_startMsg = "A local town official is being held hostage! Free him and earn a reward!";
_endMsg = "The official was freed! A reward has been sent by the local townsfolk";
_assetKilledMsg = "The Hostage Was Killed and Bandits Fled with All Loot: Mission Aborted";
_markerLabel = "";
_markerType = ["ELIPSE",[175,175],"GRID"];
_markerColor = "ColorRed";
_markerMissionName = "Rescue Hostage";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AAF_F",[0.935547,-24.3027,0],0,[true,false]],
	["Land_SM_01_shelter_wide_F",[0.298828,4.63867,0],0,[true,false]],
	["Campfire_burning_F",[-2.08789,-7.51563,0],0,[true,false]],
	["Land_Stone_8m_F",[-10.0313,-6.46875,0],268.936,[true,false]],
	["Land_Stone_8m_F",[-10.2402,1.90039,0],268.936,[true,false]],
	["Land_Stone_8m_F",[-10.3984,10.1035,0],268.936,[true,false]],
	["Land_Stone_8m_F",[10.125,-4.10156,0],270,[true,false]],
	["Land_Stone_8m_F",[10.0723,4.26953,0],270,[true,false]],
	["Land_Stone_8m_F",[10.0664,12.4746,0],270,[true,false]],
	["Land_Stone_8m_F",[7.95117,20.252,0],0,[true,false]],
	["Land_Stone_8m_F",[-0.314453,20.2656,0],0,[true,false]],
	["Land_Stone_8m_F",[-8.54102,20.3066,0],0,[true,false]],
	["Land_Stone_8m_F",[8.16016,-15.1113,0],0,[true,false]],
	["Land_Stone_8m_F",[-0.105469,-15.0977,0],0,[true,false]],
	["Land_Stone_8m_F",[-8.33203,-15.0566,0],0,[true,false]],
	["Land_HBarrierWall6_F",[-50.875,38.2676,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-50.3516,21.4355,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-50.6055,29.8965,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-49.4141,1.33203,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-49.918,13.0254,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-48.5371,-15.6992,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-49.0938,-7.12305,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-47.7773,-28.3535,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[-47.1641,-36.5547,0],89.1786,[true,false]],
	["Land_HBarrierWall6_F",[50.0566,-17.4785,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[50.1484,-25.9414,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[49.5039,2.64063,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[49.7852,-9.06055,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[48.9531,19.6855,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[49.3457,11.0996,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[48.4355,32.3516,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[47.9785,40.5625,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[50.2598,-34.3164,0],270.274,[true,false]],
	["Land_HBarrierWall6_F",[44.7031,55.5176,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[27.8652,55.1797,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[36.3281,55.3418,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[7.75195,54.4629,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[19.4512,54.8379,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-9.28711,53.7734,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-0.705078,54.2363,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-21.9492,53.1523,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-30.1563,52.6289,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-38.5195,52.3809,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-46.9727,52.0313,0],179.807,[true,false]],
	["Land_HBarrierWall6_F",[-44.418,-50.7617,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[-27.5898,-50.1348,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[-36.0488,-50.4434,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[-7.49023,-49.0723,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[-19.1816,-49.6484,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[9.5332,-48.0918,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[0.960938,-48.7012,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[22.1836,-47.252,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[30.3809,-46.5879,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[38.6406,-46.1328,0],358.823,[true,false]],
	["Land_HBarrierWall6_F",[47.0762,-45.5215,0],358.823,[true,false]]
	]; // list of objects to spawn as landscape; // list of objects to spawn as landscape
	
_hostageConfig = ["C_man_polo_6_F",
	[-7.08594,9.5957,-0.299652],
	126.345,[true,false],
	["AmovPercMstpSnonWnonDnon_Scared"],
	["H_Cap_red"], // array of headgear choices
	["U_NikosBody"] // array of uniform choices
	];  //  Sitting Animation
		// Use the animation view to see other choices: http://killzonekid.com/arma-3-animation-viewer-jumping-animation/
_missionLootBoxes = [
		//["Box_NATO_Wps_F",[3,-3,0],_crateLoot,[4,10,2,5,5,1]],  // Standard loot crate with standard loadout
		//["Land_PaperBox_C_EPOCH",[-4,-3,0],_crateLoot,[0,0,0,10,10,3]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		//["Land_CargoBox_V1_F",[3,4,0],_crateLoot,[0,10,2,5,5,1]]
		];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.

		// blck_lootCountsBlue= [4,12,3,6,6,1];
_missionLootVehicles = [
	//["I_G_Offroad_01_armed_F",[-8,8,0],_crateLoot,[0,10,2,5,5,1]],
	//["I_G_Offroad_01_armed_F",[8,17,0],_crateLoot,[0,10,2,5,5,1]]
	]; //  Parameters are "vehiclel type", offset relative to mission center, loot array, items to load from each category of the loot array.
	//  ["B_HMG_01_high_F"/*,"B_GMG_01_high_F","O_static_AT_F"*/];

	/*
	["B_G_Soldier_AR_F",[26.9961,-29.9551,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[32.2461,33.0605,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[-35.6035,32.1855,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[-47.4219,-19.8906,-0.00143886],0,[true,false]]	
	*/
_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	[[26.9961,-29.9551,-0.00143886],3,3,"Red",10,20],
	[[32.2461,33.0605,-0.00143886],3,3,"Red",10,20],
	[[-35.6035,32.1855,-0.00143886],3,3,"Red",10,20],
	[[-47.4219,-19.8906,-0.00143886],3,3,"Red",10,20]
	]; // Can be used to define spawn positions of AI patrols
	
_missionEmplacedWeapons = [
	//["B_HMG_01_high_F",[-10,-15,0]],
	//["B_GMG_01_high_F",[10,12,0]],
	//["O_static_AT_F",[-10,10,0]]
	]; // can be used to define the type and precise placement of static weapons [["wep",[1,2,3]] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

	_missionPatrolVehicles = [
	//["B_MRAP_01_hmg_F",[27.8945,100.275,0],0,[true,false]],
	//["B_MRAP_01_hmg_F",[-84.7793,72.2617,9.53674e-007],0,[true,false]],
	//["B_MRAP_01_gmg_F",[-87.8457,-109.947,7.15256e-007],0,[true,false]]
];	
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = blck_useMines;
_minNoAI = blck_MinAI_Red;
_maxNoAI = blck_MaxAI_Red;
_noAIGroups = blck_AIGrps_Red;
_noVehiclePatrols = blck_SpawnVeh_Red;
_noEmplacedWeapons = blck_SpawnEmplaced_Red;
//_uniforms = blck_SkinList;
//_headgear = blck_headgear;
//_noPara = blck_noParaRed;  
//_chanceHeliPatrol = blck_chanceHeliPatrolRed;
_spawnCratesTiming = "atMissionEndAir";
_endCondition = "assetSecured";  // Options are "allUnitsKilled", "playerNear", "allKilledOrPlayerNear", "assetSecured"
//_timeOut = -1;
#include "\q\addons\custom_server\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
