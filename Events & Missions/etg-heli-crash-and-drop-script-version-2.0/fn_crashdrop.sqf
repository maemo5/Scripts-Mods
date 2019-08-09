/*
	Filename: 		fn_crashdrop.sqf
	Author: 		Kellojo
	Description: 	Heli crash and drop script main function - Part of the ETG script collection
	Link: 			http://www.armaholic.com/page.php?id=29519
*/

_mode = [_this, 0, 0, [0]] call BIS_fnc_param;

_time = 600;										//Time between every heli crash/supply drop in seconds (integer)
_markertp = "n_service";							//Type of marker? (https://community.bistudio.com/wiki/cfgMarkers) (string - leave empty if no marker is wanted)
_fire = true;										//Should fire be around the helicrashsite ? (true/false)
_ai = true;											//AI? (true/false)
_mapcenter = [14653,16758,0];						//Edit this coordinate it should be roughly the center of the map you are playing on (this one is for Altis)
_centerrad = 15000;									//Radius around the _CenterOfMap (make sure its covering the whole map - Integer)
_rpt = true;										//Writes debug information to the rpt file. (true/false)

_MaxAmmount = 5;									//Ammount of Magazines and Items that can spawn at one lootpile
_MaxItem = 10;										//Max ammount of individual items
_MaxMag = 10;										//Max ammount of individual magazines
_MaxWeap = 10;										//Max ammount of individual weapons
_MaxBpack = 10;

//Add or remove item classnames to the array to add them to the loot table
_Backpacks = 		['B_AssaultPack_khk','B_AssaultPack_dgtl','B_AssaultPack_rgr','B_AssaultPack_sgg','B_AssaultPack_blk','B_AssaultPack_cbr','B_AssaultPack_mcamo','B_Kitbag_mcamo','B_Kitbag_sgg','B_Kitbag_cbr','B_Bergen_sgg','B_Bergen_mcamo','B_Bergen_rgr','B_Bergen_blk','B_FieldPack_blk','B_FieldPack_ocamo','B_FieldPack_oucamo','B_FieldPack_cbr','B_Carryall_ocamo','B_Carryall_oucamo','B_Carryall_mcamo','B_Carryall_oli','B_Carryall_khk','B_Carryall_cbr','B_OutdoorPack_blk','B_OutdoorPack_tan','B_OutdoorPack_blu','B_HuntingBackpack'];
_Weapons = 			['srifle_DMR_01_F','srifle_EBR_F','srifle_GM6_F','srifle_LRR_F','LMG_Mk200_F','LMG_Zafir_F','hgun_ACPC2_F','hgun_Pistol_heavy_01_F','hgun_P07_F','hgun_Pistol_heavy_02_F','hgun_Rook40_F','arifle_Katiba_F','arifle_Mk20_F','arifle_MX_F','arifle_MXC_F','arifle_MX_GL_F','arifle_MX_SW_F','arifle_MXM_F','arifle_MX_Black_F','arifle_MXC_Black_F','arifle_MX_GL_Black_F','arifle_MXM_Black_F','arifle_MX_SW_Black_F','arifle_SDAR_F','arifle_TRG21_F','hgun_PDW2000_F','SMG_01_F','SMG_02_F','srifle_GM6_camo_F','hgun_Pistol_Signal_F','srifle_LRR_camo_F','srifle_DMR_02_F','srifle_DMR_02_camo_F','srifle_DMR_02_sniper_F','srifle_DMR_03_F','srifle_DMR_04_F','srifle_DMR_04_Tan_F','srifle_DMR_05_blk_F','srifle_DMR_06_camo_F','MMG_01_hex_F','MMG_02_camo_F'];
_Items = 			['V_TacVestIR_blk','V_TacVestCamo_khk','V_TacVest_oli','V_TacVest_khk','V_TacVest_camo','V_TacVest_brn','V_TacVest_blk_POLICE','V_TacVest_blk','V_Rangemaster_belt','V_PlateCarrierSpec_rgr','V_PlateCarrierIAGL_dgtl','V_PlateCarrierIA2_dgtl','V_PlateCarrierIA1_dgtl','V_PlateCarrierGL_rgr','V_PlateCarrier3_rgr','V_PlateCarrier2_rgr','V_PlateCarrier1_rgr','V_PlateCarrier1_blk','V_HarnessOSpec_gry','V_HarnessOSpec_brn','V_HarnessOGL_gry','V_HarnessOGL_brn','V_HarnessO_gry','V_HarnessO_brn','V_Chestrig_rgr','V_Chestrig_oli','V_Chestrig_khk','V_Chestrig_blk','V_BandollierB_rgr','V_BandollierB_oli','V_BandollierB_khk','V_BandollierB_cbr','V_BandollierB_blk','ItemGPS','MineDetector','Rangefinder','NVGoggles','Laserdesignator','FirstAidKit','I_UavTerminal','muzzle_snds_H','muzzle_snds_L','uzzle_snds_B','muzzle_snds_H_MG','optic_Arco','optic_Hamr','optic_SOS','optic_Holosight','acc_flashlight','acc_pointer_IR','optic_MRCO','ptic_Nightstalker','optic_NVS','optic_DMS','optic_LRPS','optic_AMS','optic_KHS_hex','bipod_01_F_snd','bipod_01_F_blk','bipod_01_F_mtp','U_B_CombatUniform_mcam','U_B_CombatUniform_mcam_vest','U_B_GhillieSuit','U_Rangemaster','U_I_CombatUniform','U_I_CombatUniform_tshirt','U_I_Wetsuit','U_I_OfficerUniform','U_I_GhillieSuit','U_IG_Guerilla1_1','U_IG_Guerilla2_1','U_OG_Guerilla2_1','U_C_Journalist','V_Press_F','V_RebreatherIA','U_B_FullGhillie_lsh','U_B_FullGhillie_sard','U_B_FullGhillie_ard','U_O_FullGhillie_lsh','U_O_FullGhillie_sard','U_O_FullGhillie_ard','U_I_FullGhillie_ard','U_I_FullGhillie_sard','_PlateCarrierGL_blk','V_PlateCarrierGL_mtp','V_PlateCarrierSpec_blk','V_PlateCarrierSpec_mtp','V_PlateCarrierIAGL_oli'];
_magazines = 		['Exile_Item_BBQSandwich','Exile_Item_Catfood','Exile_Item_ChristmasTinner','Exile_Item_GloriousKnakworst','Exile_Item_SausageGravy','Exile_Item_Surstromming','Exile_Item_Surstromming_Cooked','Exile_Item_PlasticBottleEmpty','Exile_Item_PlasticBottleDirtyWater','Exile_Item_PlasticBottleSaltWater','Exile_Item_PlasticBottleFreshWater','Exile_Item_Energydrink','Exile_Item_Beer','Exile_Item_JunkMetal','Exile_Item_LightBulb','Exile_Item_MetalBoard','Exile_Item_MetalPole','Exile_Item_Rope','Exile_Item_PortableGeneratorKit','Exile_Item_SafeKit','Exile_Item_FuelCanisterFull','Exile_Item_FuelCanisterEmpty','Exile_Item_ExtensionCord','Exile_Item_Flag','Exile_Item_FortificationUpgrade','Exile_Item_DuctTape','Exile_Item_CamoTentKit','Exile_Item_CampFireKit','Exile_Item_InstaDoc','Exile_Item_WoodLog','Exile_Item_WoodPlank','Exile_Item_WoodFloorKit','Exile_Item_WoodGateKit'];		
_aiunits = 			["O_recon_medic_F", "O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_A_F","O_Soldier_lite_F"];  			//Add or remove unit classnames for more or less ai

//random timer + calls in new drop/crash
if (_mode == 1) exitwith {
	sleep (round (random _time));
	[2] call fn_crashdrop;
};

//creates a drop/crash
if (_mode == 2) exitwith {
	
	//Get data
	_cord1 = [_mapcenter, 1, _centerrad, 3, 0, 600, 0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_cord2 = [_mapcenter, 1, _centerrad, 3, 0, 600, 0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_cord3 = [_mapcenter, 1, _centerrad, 3, 0, 600, 0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_cord4 = [_mapcenter, 1, _centerrad, 3, 0, 600, 0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_cord5 = [_mapcenter, 1, _centerrad, 3, 0, 600, 0] call BIS_fnc_findSafePos;
	
	//Spawn heli & cargo
	_veh = [[0,0,0], 180,"I_Heli_light_03_unarmed_F",EAST] call bis_fnc_spawnvehicle;
	_cargo = "B_CargoNet_01_ammo_F" createVehicle [0,0,0];
	_grp = group (_veh select 0);
	
	veh = _veh;
	cargo = _cargo;
	
	clearMagazineCargoGlobal _cargo;
	clearWeaponCargoGlobal _cargo;
	clearItemCargoGlobal _cargo;
	clearBackpackCargoGlobal _cargo;
	
	{
		_x disableAI "AUTOTARGET";
		_x disableAI "TARGET";
		_x disableAI "SUPPRESSION";
		removeBackpackGlobal _x;
		removeAllWeapons _x;
	} forEach units (_veh select 2);
	
	//Spawn loot
	_weapc = 0;
	_weapcount = round (random _MaxWeap);
	while {_weapc < _weapcount} do {
		sleep 0.1;
		_weapc = _weapc + 1;
		_curi = _Weapons call BIS_fnc_selectRandom;
		_ammount = 1;
		_mag = getArray (configFile / "CfgWeapons" / _curi / "magazines");
		_cargo addWeaponCargoGlobal [_curi,_ammount];
		_cargo addMagazineCargoGlobal [(_mag select 0),round random 8];
	};

	
	_magc = 0;
	_magcount = round (random _MaxMag);
	while {_magc < _magcount} do {
		sleep 0.1;
		_magc = _magc + 1;
		_curi = _magazines call BIS_fnc_selectRandom;
		_cargo addMagazineCargoGlobal [_curi,round (random 5)];	
	};

	
	_ic = 0;
	_ic = round (random _MaxItem);
	while {_ic < _ic} do {
		sleep 0.1;
		_ic = _ic + 1;
		_curi = _Items call BIS_fnc_selectRandom;
		_ammount = 1;
		_cargo addItemCargoGlobal [_curi,_ammount];	
	};

	
	_bpackc = 0;
	_backcount = round (random _MaxBpack);
	while {_bpackc < _backcount} do {
		sleep 0.1;
		_bpackc = _bpackc + 1;
		_curi = _Backpacks call BIS_fnc_selectRandom;
		_ammount = 1;
		_cargo addBackpackCargoGlobal [_curi,_ammount];	
	};
	
	(_veh select 0) setSlingLoad _cargo;

	//Set waypoints
	ETG_tvehdrop = false;
	ETG_tvehcrash = false;

	_wp = _grp addWaypoint [_cord1, 0];
	_wp setWaypointType "move";
	_wp setWaypointBehaviour "CARELESS";
	(_veh select 0) flyInHeight 220;
	[_grp,1]setWaypointSpeed "FULL";
	
	_wp = _grp addWaypoint [_cord2, 0];
	_wp setWaypointType "move";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ['true', "ETG_tvehdrop = true;"];
	
	_wp = _grp addWaypoint [_cord3, 0];
	_wp setWaypointType "move";
	_wp setWaypointBehaviour "CARELESS";
	
	_wp = _grp addWaypoint [_cord4, 0];
	_wp setWaypointType "move";
	_wp setWaypointBehaviour "CARELESS";
	
	_wp = _grp addWaypoint [_cord5, 0];
	_wp setWaypointType "move";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ['true', "ETG_tvehcrash = true;"];
	
	waituntil {ETG_tvehdrop};
	
	//Unload
	(_veh select 0) flyInHeight 90;
	(_veh select 0) setSlingLoad objNull;
	_chute = "B_Parachute_02_F" createVehicle position _cargo;
	_cargo attachTo [_chute,[0, 0, -1.2]];
	
	_smoke = "SmokeShellRed" createVehicle position _cargo;
	_smoke attachto [_cargo,[0,0,0]];
	sleep 10;
	_smoke setDamage 1;
	deleteVehicle _smoke;
	
	_smoke = "SmokeShellRed" createVehicle position _cargo;
	_smoke attachto [_cargo,[0,0,0]];
	
	waituntil {(getPos _cargo select 2) < 4};	
	detach _cargo;
	sleep 4;
	deleteVehicle _chute;
	_smoke = "SmokeShellRed" createVehicle position _cargo;
	_smoke attachto [_cargo,[0,0,0]];
	
	if (_rpt) then {
		diag_log "###ETG Heli Crash and Drop Script by Kellojo###";
		diag_log format ["###Cargodrop position: %1",position _cargo];
		diag_log "###End###";
	};

	if !(isNil "_markertp") then {
		_marker = createMarker ["",position _cargo];
		_marker setMarkerType _markertp;
	};
	
	if (_ai) then {
	_hcunits = [position _cargo, EAST, _aiunits,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
		_hcg = group (leader _hcunits);
		_hcg addWaypoint [position	_cargo, 0];
		[_hcg, 0] setWaypointType "GUARD";
		[_hcg, 0] setWaypointBehaviour "AWARE";
		{
			removeBackpackGlobal _x;
			removeAllWeapons _x;
			_curW = _weapons call BIS_fnc_selectRandom;
			[_x,_curW, 5] call BIS_fnc_addWeapon;
		} forEach units _hcunits;
	};
	
	//Wait for crash & crash
	waituntil {ETG_tvehcrash  || (getDammage (_veh select 0) > 0.2)};
	(_veh select 0) setDamage 1;
	
	waituntil {(getPos (_veh select 0) select 2) < 1};
	sleep 10;
	
	_crashpos = position (_veh select 0);
	_crashrot = getDir (_veh select 0);
	sleep 2;
	deleteVehicle (_veh select 0);
	
	if !(isNil "_markertp") then {
		_marker = createMarker ["",_crashpos];
		_marker setMarkerType _markertp;
	};
	
	_cheli = createVehicle ["Land_Wreck_Heli_Attack_01_F",_crashpos,[], 0, "can_collide"];
	_cheli setDir _crashrot;
	_cheli setPos [position _cheli select 0,position _cheli select 1, 0.1];
	_cheli setVectorUp surfaceNormal position _cheli;
	_smokeeff = createVehicle ["test_EmptyObjectForSmoke",position _cheli,[], 0, "can_collide"];
	_smokeeff attachTo [_cheli, [0.5, -2, 1] ];
	_fireeff = createVehicle ["Campfire_burning_F",_crashpos,[], 0, "can_collide"];
	
	if (_ai) then {
		_hcunits = [position _cheli, EAST, _aiunits,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
		_hcg = group (leader _hcunits);
		_hcg addWaypoint [position	_cargo, 0];
		[_hcg, 0] setWaypointType "GUARD";
		[_hcg, 0] setWaypointBehaviour "AWARE";
		{
			removeBackpackGlobal _x;
			removeAllWeapons _x;
			_curW = _weapons call BIS_fnc_selectRandom;
			[_x,_curW, 5] call BIS_fnc_addWeapon;
		} forEach units _hcunits;
	};
	
	if (_rpt) then {
		diag_log "###ETG Heli Crash and Drop Script by Kellojo###";
		diag_log format ["###Helicrash position: %1",_crashpos];
		diag_log "###End###";
	};
	
	_weapc = 0;
	_maxweapc = round (random _MaxWeap);
	_whold = createVehicle ["Box_IND_Wps_F",_crashpos,[], 25, "none"];
	clearMagazineCargoGlobal _whold;
	clearWeaponCargoGlobal _whold;
	clearItemCargoGlobal _whold;
	clearBackpackCargoGlobal _whold;
	while {_weapc < _maxweapc} do {
		_weapc = _weapc + 1;
		_curri = _Weapons call BIS_fnc_selectRandom;
		_Ammount = 1;
		_whold addWeaponCargoGlobal [_curri,_Ammount];
		_mag = getArray (configFile / "CfgWeapons" / _curri / "magazines");
		_whold addMagazineCargoGlobal [(_mag select 0),round random 6];
	};

	_magc = 0;
	_maxmagc = round (random _MaxMag);
	_whold = createVehicle ["Box_IND_Wps_F",_crashpos,[], 25, "none"];
	clearMagazineCargoGlobal _whold;
	clearWeaponCargoGlobal _whold;
	clearItemCargoGlobal _whold;
	clearBackpackCargoGlobal _whold;
	while {_magc < _maxmagc} do {
		_magc = _magc + 1;
		_curri = _magazines call BIS_fnc_selectRandom;
		_Ammount = round (random _MaxItem);

		_whold addMagazineCargoGlobal [_curri,_Ammount];	
	};

	_ic = 0;
	_maxic = round (random _MaxItem);
	_whold = createVehicle ["Box_East_Grenades_F",_crashpos,[], 25, "none"];
	clearMagazineCargoGlobal _whold;
	clearWeaponCargoGlobal _whold;
	clearItemCargoGlobal _whold;
	clearBackpackCargoGlobal _whold;
	while {_ic < _maxic} do {
		_ic = _ic + 1;
		_curri = _Items call BIS_fnc_selectRandom;
		_Ammount = 1;
		_whold addItemCargoGlobal [_curri,_Ammount];	
	};

	_bpackc = 0;
	_maxbpackc = round (random _MaxBpack);
	_whold = createVehicle ["Box_East_Grenades_F",_crashpos,[], 25, "none"];
	clearMagazineCargoGlobal _whold;
	clearWeaponCargoGlobal _whold;
	clearItemCargoGlobal _whold;
	clearBackpackCargoGlobal _whold;
	while {_bpackc < _maxbpackc} do {
		_bpackc = _bpackc + 1;
		_curri = _Backpacks call BIS_fnc_selectRandom;
		_Ammount = 1;
		clearBackpackCargoGlobal _whold;
		_whold addBackpackCargoGlobal [_curri,_Ammount];	
	};

	[1] call fn_crashdrop;
};