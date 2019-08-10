/**
 * ExileServer_object_vehicle_carefulCreateVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_vehicleClassName", "_position", "_direction", "_usePositionATL", "_temporaryPositionInOuterSpace", "_vehicleObject"];
_vehicleClassName = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_temporaryPositionInOuterSpace = 
[
	(_position select 0) - 250 + (random 500),
	(_position select 1) - 250 + (random 500),
	1000 + (random 1000)
];
_vehicleObject = createVehicle [_vehicleClassName, _temporaryPositionInOuterSpace, [], 0, "CAN_COLLIDE"];
_vehicleObject allowDamage false;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject addEventHandler["HandleDamage", {false}];
_vehicleObject setVelocity [0, 0, 0];
if ((typeName _direction) isEqualTo "ARRAY") then 
{
	_vehicleObject setVectorDirAndUp _direction;
}
else 
{
	_vehicleObject setDir _direction;
};
if (_usePositionATL) then
{
	_vehicleObject setPosATL _position;
}
else 
{
	_vehicleObject setPosASL _position;
};
_vehicleObject setVelocity [0, 0, 0];
_vehicleObject allowDamage true;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject setDamage 0;
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;
if (_vehicleClassName isKindOf "I_UGV_01_F") then 
{
	createVehicleCrew _vehicleObject;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "nightVision") isEqualTo 0) then 
{
	_vehicleObject disableNVGEquipment true;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "thermalVision") isEqualTo 0) then 
{
	_vehicleObject disableTIEquipment true;
};

if(_vehicleClassName == "B_Heli_Attack_01_F") then
{
	_vehicleObject removeWeaponTurret  ["gatling_20mm",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_DAGR",[0]];
    _vehicleObject removeWeaponTurret  ["missiles_ASRAAM",[0]];
	_vehicleObject addWeaponTurret     ["M134_minigun",[0]];
	_vehicleObject addWeaponTurret     ["M134_minigun",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt",[-1]];
};

if(_vehicleClassName == "B_Heli_Light_01_armed_F") then
{
	_vehicleObject removeWeaponTurret  	   ["missiles_DAR",[-1]];		
	_vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[0]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addWeaponTurret         ["CMFlareLauncher",[0]];
	_vehicleObject addWeaponTurret         ["CMFlareLauncher",[-1]];
	_vehicleObject addMagazineTurret       ["60Rnd_CMFlare_Chaff_Magazine",[0]];
	_vehicleObject addMagazineTurret   	   ["60Rnd_CMFlare_Chaff_Magazine",[-1]];
};

if(_vehicleClassName == "O_T_VTOL_02_vehicle_F") then
{
	_vehicleObject removeWeaponTurret  	   ["gatling_30mm_VTOL_02",[0]];
	_vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
	_vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
	_vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
	_vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
	_vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
	_vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[0]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
};
if(_vehicleClassName in ["O_T_VTOL_02_Infantry_F","O_T_VTOL_02_Vehicle_F","O_T_VTOL_02_Infantry_hex_F","O_T_VTOL_02_Vehicle_hex_F","O_T_VTOL_02_Infantry_grey_F","O_T_VTOL_02_Vehicle_grey_F"]) then
{
	_vehicleObject removeWeaponTurret  	   ["gatling_30mm_VTOL_02",[0]];
	_vehicleObject removeWeaponTurret      ["missiles_SCALPEL",[0]];
	_vehicleObject removeWeaponTurret      ["rockets_Skyfire",[0]];
	_vehicleObject removeWeaponTurret      ["Laserdesignator_mounted",[0]];
	_vehicleObject removeMagazinesTurret   ["8Rnd_LG_scalpel",[0]];
	_vehicleObject removeMagazinesTurret   ["38Rnd_80mm_rockets",[0]];
	_vehicleObject removeMagazinesTurret   ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicleObject removeMagazinesTurret   ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[0]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
};

if(_vehicleClassName == "O_Heli_Attack_02_F") then
{
	_vehicleObject removeWeaponTurret ["missiles_SCALPEL",[0]]; 
    _vehicleObject removeWeaponTurret ["rockets_Skyfire",[0]]; 
    _vehicleObject removeWeaponTurret  ["gatling_30mm",[0]]; 
    _vehicleObject addWeaponTurret     ["LMG_coax",[0]]; 
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Red",[0]]; 
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Red",[0]]; 
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Red",[0]]; 
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Red",[0]]; 
    _vehicleObject addMagazineTurret   ["2000Rnd_762x51_Belt_T_Red",[0]];
};

if(_vehicleClassName == "O_APC_Wheeled_02_rcws_F") then
{
	_vehicleObject removeMagazinesTurret   ["96Rnd_40mm_G_belt",[0]];
	_vehicleObject addMagazineTurret       ["32Rnd_40mm_G_belt",[0]];
};
if(_vehicleClassName == "I_APC_Wheeled_03_cannon_F") then
{
	_vehicleObject removeWeaponTurret  	   ["autocannon_30mm_CTWS",[-1]];
	_vehicleObject removeWeaponTurret  	   ["autocannon_30mm_CTWS",[0]];
	_vehicleObject removeWeaponTurret  	   ["autocannon_30mm_CTWS",[1]];

	_vehicleObject removeWeaponTurret  	   ["missiles_titan",[-1]];
	_vehicleObject removeWeaponTurret  	   ["missiles_titan",[0]];
	_vehicleObject removeWeaponTurret  	   ["missiles_titan",[1]];

	_vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[-1]];
	_vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[0]];
	_vehicleObject removeMagazinesTurret   ["2Rnd_GAT_missiles",[1]];

	_vehicleObject addWeaponTurret     ["missiles_ASRAAM",[0]];
	_vehicleObject addMagazineTurret   ["2Rnd_AAA_missiles",[0]];
	_vehicleObject addMagazineTurret   ["2Rnd_AAA_missiles",[0]];
	_vehicleObject addMagazineTurret   ["2Rnd_AAA_missiles",[0]];
	_vehicleObject addMagazineTurret   ["2Rnd_AAA_missiles",[0]];

	_vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Yellow",[-1]];
	_vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[-1]];
	_vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0]];
	_vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0]];
	_vehicleObject removeMagazinesTurret   ["140Rnd_30mm_MP_shells_Tracer_Yellow",[1]];
	_vehicleObject removeMagazinesTurret   ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[1]];
};

if(_vehicleClassName in ["O_Heli_Light_02_F","O_Heli_Light_02_v2_F"]) then
{
	_vehicleObject removeWeaponTurret  ["missiles_DAGR",[-1]];
	_vehicleObject removeWeaponTurret  ["missiles_DAGR",[0]];
	_vehicleObject removeWeaponTurret  ["missiles_DAGR",[1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[0]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
	_vehicleObject addMagazineTurret   ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[1]];
};

if(_vehicleClassName == "CUP_B_AH1Z_NoWeapons") then
{
	_vehicleObject removeWeaponTurret  ["CUP_Vacannon_M197_veh",[0]];
	_vehicleObject addWeaponTurret     ["HMG_127",[0]]; 
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
};
if(_vehicleClassName == "CUP_B_AH64D_NO_USA") then
{
	_vehicleObject removeWeaponTurret  ["CUP_Vacannon_M230_veh",[0]];
	_vehicleObject addWeaponTurret     ["HMG_127",[0]]; 
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Red",[0]];
};
if(_vehicleClassName == "CUP_B_AW159_Unarmed_RN_Blackcat") then
{
	_vehicleObject addWeaponTurret     ["HMG_127",[-1]];  
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]]; 
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]]; 
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]]; 
	_vehicleObject addMagazineTurret   ["500Rnd_127x99_mag_Tracer_Yellow",[-1]];
};

if(_vehicleClassName in ["I_Heli_light_03_dynamicLoadout_F","I_Heli_light_03_F"]) then
{
	_vehicleObject removeWeaponTurret      ["missiles_DAR",[0]]; 
	_vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[0]]; 
	_vehicleObject removeWeaponTurret      ["missiles_DAR",[-1]];
	_vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[0]]; 
	_vehicleObject addWeaponTurret         ["M134_minigun",[-1]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]]; 
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
};

//Blackfish
if (_vehicleClassName in ["B_T_VTOL_01_armed_olive_F","B_T_VTOL_01_armed_blue_F"]) then
{                             	
    _vehicleObject removeWeaponTurret		["cannon_105mm_VTOL_01",[1]];
    _vehicleObject removeWeaponTurret 		["autocannon_40mm_VTOL_01",[2]];
	_vehicleObject removeMagazineTurret 	["240Rnd_40mm_GPR_Tracer_Red_shells",[2]];
	_vehicleObject removeMagazineTurret 	["160Rnd_40mm_APFSDS_Tracer_Red_shells",[2]];
};

//RHS A10 CAS
if (_vehicleClassName in ["RHS_A10_AT"]) then
{
    _vehicleObject removeMagazineTurret  ["rhs_pod_lau68",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_pod_agm65x3_rack",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_pod_agm65x3_rack",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_pod_lau68",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_ANALQ131",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_Sidewinder_a10_2",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_FFAR_A10_14",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_agm65_x3",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_agm65_x3",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_agm65_x3",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_agm65_x3",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_agm65_x3",[-1]];
    _vehicleObject removeMagazineTurret  ["rhs_mag_agm65_x3",[-1]];
    _vehicleObject removeWeaponTurret 	 ["rhs_weap_SidewinderLauncher",[-1]];
    _vehicleObject removeWeaponTurret 	 ["rhs_weap_agm65",[-1]];
    _vehicleObject removeWeaponTurret 	 ["rhs_weap_FFARLauncher",[-1]];
    _vehicleObject removeWeaponTurret 	 ["rhs_weap_gbu12",[-1]];
};

//RHS A10 AT
if (_vehicleClassName in ["RHS_A10"]) then
{
    _vehicleObject removeMagazineTurret ["rhs_pod_lau68",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_pod_agm65",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_gbu12",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_pod_agm65",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_pod_lau68",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_ANALQ131",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_Sidewinder_a10_2",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_FFAR_A10_14",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_agm65",[-1]];
    _vehicleObject removeMagazineTurret ["rhs_mag_agm65",[-1]];
    _vehicleObject removeWeaponTurret 	["rhs_weap_SidewinderLauncher",[-1]];
    _vehicleObject removeWeaponTurret 	["rhs_weap_agm65",[-1]];
    _vehicleObject removeWeaponTurret 	["rhs_weap_FFARLauncher",[-1]];
    _vehicleObject removeWeaponTurret 	["rhs_weap_gbu12",[-1]];
};

// RHS Littlebird
if (_VehicleClassName in ["RHS_MELB_AH6M_L"]) then
{
	_vehicleObject removeWeaponTurret ["RHS_M260_MELB",[-1]];
	_vehicleObject removeMagazineTurret ["rhs_pod_FFAR_7",[-1]];
	_vehicleObject removeMagazineTurret ["rhs_pod_FFAR_7",[-1]];
	_vehicleObject removeMagazineTurret ["RHS_14Rnd_M151_Magazine_MELB",[-1]];
};

// RHS Littlebird
if (_VehicleClassName in ["RHS_MELB_AH6M_M"]) then
{
	_vehicleObject removeWeaponTurret ["RHS_M261_MELB",[-1]];
	_vehicleObject removeMagazineTurret ["rhs_pod_FFAR_19",[-1]];
	_vehicleObject removeMagazineTurret ["RHS_19Rnd_M151_Magazine_MELB",[-1]];
};

// RHS UH1Y
if (_VehicleClassName in ["RHS_UH1Y"]) then
{
	_vehicleObject removeMagazineTurret ["rhs_pod_FFAR_7_green",[-1]];
	_vehicleObject removeMagazineTurret ["rhs_pod_FFAR_7_green",[-1]];
	_vehicleObject removeMagazineTurret ["rhs_mag_M151_14",[-1]];
};

// Wipeout
if (_VehicleClassName in ["B_Plane_CAS_01_F"]) then
{
	_vehicleObject removeMagazineTurret ["7Rnd_Rocket_04_HE_F",[-1]];
	_vehicleObject removeMagazineTurret ["7Rnd_Rocket_04_AP_F",[-1]];
	_vehicleObject removeMagazineTurret ["4Rnd_Bomb_04_F",[-1]];
	_vehicleObject removeMagazineTurret ["2Rnd_Missile_AA_04_F",[-1]];
	_vehicleObject removeMagazineTurret ["6Rnd_Missile_AGM_02_F",[-1]];
	_vehicleObject removeWeaponTurret ["Rocket_04_HE_Plane_CAS_01_F",[-1]];
	_vehicleObject removeWeaponTurret ["Rocket_04_AP_Plane_CAS_01_F",[-1]];
	_vehicleObject removeWeaponTurret ["Missile_AA_04_Plane_CAS_01_F",[-1]];
	_vehicleObject removeWeaponTurret ["Missile_AGM_02_Plane_CAS_01_F",[-1]];
	_vehicleObject removeWeaponTurret ["Bomb_04_Plane_CAS_01_F",[-1]];
};

// Shikra
if (_VehicleClassName in ["O_Plane_Fighter_02_F"]) then
{
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_R73Launcher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_R77Launcher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_KAB250Launcher",[-1]];
};

// Black Wasp
if (_VehicleClassName in ["B_Plane_Fighter_01_F"]) then
{
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AMRAAM_D_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AMRAAM_D_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AGM_02_x2",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AGM_02_x2",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_AMRAAMLauncher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_AGM_65Launcher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_BIM9xLauncher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_GBU12Launcher",[-1]];
};

// Gryphon
if (_VehicleClassName in ["I_Plane_Fighter_04_F"]) then
{
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AGM_02_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AGM_02_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AMRAAM_C_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonRack_Missile_AMRAAM_C_x1",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_BIM9xLauncher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_AGM_65Launcher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_AMRAAMLauncher",[-1]];
};

// Black Wasp Stealth
if (_VehicleClassName in ["B_Plane_Fighter_01_Stealth_F"]) then
{
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_BIM9xLauncher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_AMRAAMLauncher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_GBU12Launcher",[-1]];
};

// Shikra Stealth
if (_VehicleClassName in ["O_Plane_Fighter_02_Stealth_F"]) then
{
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_INT_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Missile_AA_R77_INT_x1",[-1]];
	_vehicleObject removeMagazineTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_R73Launcher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_R77Launcher",[-1]];
	_vehicleObject removeWeaponTurret ["weapon_KAB250Launcher",[-1]];
};

// Neophron
if (_VehicleClassName in ["O_Plane_CAS_02_F"]) then
{
    _vehicleObject removeMagazineTurret ["2Rnd_Missile_AA_03_F_x1",[-1]];
    _vehicleObject removeMagazineTurret ["4Rnd_Missile_AGM_01_F",[-1]];
    _vehicleObject removeMagazineTurret ["2Rnd_Bomb_03_F",[-1]];
    _vehicleObject removeMagazineTurret ["20Rnd_Rocket_03_HE_F",[-1]];
    _vehicleObject removeMagazineTurret ["20Rnd_Rocket_03_AP_F",[-1]];
    _vehicleObject removeWeaponTurret ["Missile_AA_03_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret ["Missile_AGM_01_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret ["Rocket_03_HE_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret ["Rocket_03_AP_Plane_CAS_02_F",[-1]];
    _vehicleObject removeWeaponTurret ["Bomb_03_Plane_CAS_02_F",[-1]];
};

// Buzzard CAS
if (_VehicleClassName in ["I_Plane_Fighter_03_CAS_F"]) then
{
    _vehicleObject removeMagazineTurret ["2Rnd_LG_scalpel",[-1]];
    _vehicleObject removeMagazineTurret ["2Rnd_AAA_missiles",[-1]];
    _vehicleObject removeMagazineTurret ["2Rnd_GBU12_LGB_MI10",[-1]];
    _vehicleObject removeWeaponTurret ["missiles_SCALPEL",[-1]];
    _vehicleObject removeWeaponTurret ["missiles_ASRAAM",[-1]];
    _vehicleObject removeWeaponTurret ["GBU12BombLauncher_Plane_Fighter_03_F",[-1]];
};

// Buzzard AA
if (_VehicleClassName in ["I_Plane_Fighter_03_AA_F"]) then
{
    _vehicleObject removeMagazineTurret ["4Rnd_GAA_missiles",[-1]];
    _vehicleObject removeMagazineTurret ["2Rnd_AAA_missiles_MI06",[-1]];
    _vehicleObject removeWeaponTurret ["missiles_Zephyr",[-1]];
    _vehicleObject removeWeaponTurret ["missiles_ASRAAM",[-1]];
};
_vehicleObject