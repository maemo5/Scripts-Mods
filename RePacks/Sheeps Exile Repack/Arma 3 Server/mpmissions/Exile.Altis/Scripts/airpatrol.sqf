/** DYNAMIC AIR PATROL EVENT by JohnO **/

diag_log "[UNREST] Ambient air patrol engaged";

if (!isServer) exitWith{};

private ["_possiblePosStart","_fixedStart","_fixedStartLoc","_markerWaypointOne","_markerWaypointTwo","_markerWaypointThree","_markerWayPointFour","_wayPointOne","_wayPointTwo","_wayPointThree","_wayPointFour","_mk","_pos","_interceptor","_interceptorAircraft"];


/************************************************************************************************/
/** Random location settings ********************************************************************/
/************************************************************************************************/

_spawnCenter = [15834.2,15787.8,0] ; //Center of your map -- this is Altis 
_min = 50; // minimum distance from the center position (Number) in meters
_max = 17000; // maximum distance from the center position (Number) in meters
_mindist = 20; // minimum distance from the nearest object (Number) in meters, ie. create waypoint this distance away from anything within x meters..
_water = 0; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; // 0: does not have to be at a shore , 1: must be at a shore

/************************************************************************************************/
/** DEBUG MARKER ********************************************************************************/
/************************************************************************************************/

_debug = false; // Will create a marker that will follow the trader.

/************************************************************************************************/
/** If using fixed locations or waypoints *******************************************************/
/************************************************************************************************/

_fixedStart = false; //If true trader will spawn at fixed location
_fixedStartLoc = getMarkerPos "yourmarker"; //If _fixedStart is true, create a marker and put the marker name here

_useMarkerWaypoints = false; //If true, will use set markers instead of random positions - If true populate "yourmarker" with the marker names created

_markerWaypointOne = getMarkerPos "waypoint1"; //Create a marker and name it waypoint1
_markerWaypointTwo = getMarkerPos "waypoint2"; //Create a marker and name it waypoint2
_markerWaypointThree = getMarkerPos "waypoint3"; //Create a marker and name it waypoint3
_markerWayPointFour = getMarkerPos "waypoint4"; //Create a marker and name it waypoint4

/************************************************************************************************/

if (_useMarkerWaypoints) then
{
        _wayPointOne = getPos _markerWaypointOne;
        _wayPointTwo = getPos _markerWaypointTwo;
        _wayPointThree = getPos _markerWaypointThree;
        _wayPointFour = getPos _markerWayPointFour;
    }
    else
    {
    _wayPointOne = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos; 
    _wayPointTwo = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
    _wayPointThree = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
    _wayPointFour = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
};

if (_fixedStart) then
{
        _possiblePosStart = getPos _fixedStartLoc;
    }
    else
    {
        _possiblePosStart = [_spawnCenter,_min,_max,_mindist,_water,5,_shoremode] call BIS_fnc_findSafePos;
};

// LOOT

_amountOfWeapons = 5+floor(random 5);
_amountOfItems = 7+floor(random 5);


// Starting position for the interceptor and rescue chopper.

_rescueStartPos = [[29.9291,30692.8,0],[30683.4,30681.3,0],[30628.1,98.2361,0],[6931.06,179.696,0]];
_startPos = _rescueStartPos call BIS_fnc_selectRandom;

_lootWeapons =
[
"arifle_MXM_Black_F",
"arifle_MXM_F",
"srifle_DMR_01_F",
"srifle_DMR_02_camo_F",
"srifle_DMR_02_F",
"srifle_DMR_02_sniper_F",
"srifle_DMR_03_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_multicam_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_woodland_F",
"srifle_DMR_04_F",
"srifle_DMR_04_Tan_F",
"srifle_DMR_05_blk_F",
"srifle_DMR_05_hex_F",
"srifle_DMR_05_tan_f",
"srifle_DMR_06_camo_F",
"srifle_DMR_06_olive_F",
"srifle_EBR_F",
"srifle_GM6_camo_F",
"srifle_GM6_F",
"srifle_LRR_camo_F",
"srifle_LRR_F",

"arifle_MX_SW_Black_F",
"arifle_MX_SW_F",
"LMG_Mk200_F",
"MMG_01_hex_F",
"MMG_01_tan_F",
"MMG_02_camo_F",
"MMG_02_black_F",
"MMG_02_sand_F",
"LMG_Zafir_F",

"arifle_Katiba_C_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"arifle_Mk20_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_GL_plain_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_F",
"arifle_Mk20C_plain_F",
"arifle_MX_Black_F",
"arifle_MX_F",
"arifle_MX_GL_Black_F",
"arifle_MX_GL_F",
"arifle_MXC_Black_F",
"arifle_MXC_F",
"arifle_SDAR_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"arifle_TRG21_GL_F"
];

_lootItems =
[
"HandGrenade",
"MiniGrenade",
"B_IR_Grenade",
"O_IR_Grenade",
"I_IR_Grenade",
"1Rnd_HE_Grenade_shell",
"3Rnd_HE_Grenade_shell",
"APERSBoundingMine_Range_Mag",
"APERSMine_Range_Mag",
"APERSTripMine_Wire_Mag",
"ClaymoreDirectionalMine_Remote_Mag",
"DemoCharge_Remote_Mag",
"IEDLandBig_Remote_Mag",
"IEDLandSmall_Remote_Mag",
"IEDUrbanBig_Remote_Mag",
"IEDUrbanSmall_Remote_Mag",
"SatchelCharge_Remote_Mag",
"SLAMDirectionalMine_Wire_Mag",

"B_AssaultPack_blk",
"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_ocamo",
"B_FieldPack_oucamo",
"B_TacticalPack_blk",
"B_TacticalPack_rgr",
"B_TacticalPack_ocamo",
"B_TacticalPack_mcamo",
"B_TacticalPack_oli",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_sgg",
"B_Carryall_cbr",
"B_Carryall_khk",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_oli",
"B_Carryall_oucamo",
"B_Bergen_blk",
"B_Bergen_mcamo",
"B_Bergen_rgr",
"B_Bergen_sgg",
"B_HuntingBackpack",
"B_OutdoorPack_blk",
"B_OutdoorPack_blu",

"Rangefinder",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",

"Exile_Item_InstaDoc",
"Exile_Item_Vishpirin",
"Exile_Item_Bandage"
];



// Randomize the start time of the script

uiSleep 600; // Do not start for 10 minutes.

_randomStartTime = floor (random 3600); // Continue the delayed start for a random time between 0 and 60 minutes

uiSleep _randomStartTime;

_side = createCenter EAST;
_airCraft = [_possiblePosStart, EAST, ["B_Plane_CAS_01_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_airCraftSelection = nearestObjects [_possiblePosStart, ["air"], 100];

_airCraftLead = _airCraftSelection select 0;

_titlePatrol = "WARNING";
_messagePatrol = "A NATO A10 Strike aircraft has been seen patrolling the Island";

for "_i" from 1 to 3 do
{
    ["systemChatRequest", [format ["%1: %2",_titlePatrol,_messagePatrol]]] call ExileServer_system_network_send_broadcast;
};

if (_debug) then
{
    [_airCraftLead] spawn
    {
        _planes = _this select 0;
        _pos = position _planes;
        _mk = createMarker ["AirCraftLocation",_pos];
        while {true} do
        {
            _pos = position _planes;
            "AirCraftLocation" setMarkerType "mil_warning";
            "AirCraftLocation" setMarkerText "Planes";
            _mk setMarkerPos _pos;
            uiSleep 1;
        };  
    };  
};

diag_log "UNREST Aircraft Patrol created";

_airCraft setCombatMode "BLUE";

{
    _x disableAI "AUTOTARGET";
    _x disableAI "TARGET";
    _x disableAI "SUPPRESSION";
    
} forEach units _airCraft;

_wp1 = _airCraft addWaypoint [_wayPointOne, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointspeed "NORMAL";
 
_wp2 = _airCraft addWaypoint [_wayPointTwo, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";
_wp2 setWaypointspeed "NORMAL";
  
_wp3 = _airCraft addWaypoint [_wayPointThree, 0];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setWaypointspeed "NORMAL";
 
_wp4 = _airCraft addWaypoint [_wayPointFour, 0];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointBehaviour "CARELESS";
_wp4 setWaypointspeed "NORMAL";
 
_wp5 = _airCraft addWaypoint [_wayPointOne, 0];
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointBehaviour "CARELESS";
_wp5 setWaypointspeed "NORMAL";

uiSleep 600;

_chanceForIntercept = random 1;

if (_chanceForIntercept >= 0.5) then {intercept = true;} else {intercept = false;};

if (intercept) then
{
    diag_log "UNREST Intercept aircraft despatched";
    _interceptor = createGroup resistance;
    
    _interceptorStartPos = _rescueStartPos call BIS_fnc_selectRandom;
    
    [_interceptorStartPos, 180,"I_Plane_Fighter_03_AA_F", _interceptor] call BIS_fnc_spawnVehicle;
    _interceptorSelection = nearestObjects [_interceptorStartPos, ["air"], 100];

    _interceptorAircraft = _interceptorSelection select 0;
    
    _interceptor setCombatMode "RED";
    
    _waypoints = [_WayPointFour,_wayPointThree,_wayPointTwo,_wayPointOne];
    {
    _intWP = _interceptor addWaypoint [_x, 0];
    _intWP setWaypointType "MOVE";
    _intWP setWaypointBehaviour "SAFE";
    _intWP setWaypointspeed "FULL";
    } forEach _waypoints;

    if (_debug) then
    {    
        [_interceptorAircraft] spawn
        {
            _plane2 = _this select 0;
            _pos2 = position _plane2;
            _mk1 = createMarker ["Y",_pos2];
            while {true} do
            {    
                _pos2 = position _plane2;
                "Y" setMarkerType "mil_warning";
                "Y" setMarkerText "Inter";
                _mk1 setMarkerPos _pos2;
            };
        };  
    };       
    uiSleep 360; // Give the interceptor 5 minutes to down the enemy Jet
    if (alive _airCraftLead) then
    {   
        _airCraftLead setDamage 1;
    };    
}
else
{
    uiSleep 600;
    _airCraftLead setDamage 1;
};

waituntil {(getPos _airCraftLead select 2) < 5};

diag_log "UNREST Aircraft Patrol -- Crash sequence initiated";

_titleQRF = "WARNING";
_messageQRF = "A NATO Quick reaction force has been despatched to secure the crash site";

for "_i" from 1 to 3 do
{
    ["systemChatRequest", [format ["%1: %2",_titleQRF,_messageQRF]]] call ExileServer_system_network_send_broadcast;
};

_landPos = position _airCraftLead;

_helipad = "Land_HelipadEmpty_F" createVehicle _landPos;
sleep 10;
deleteVehicle _airCraftLead;

_crash = createVehicle ["Plane_Fighter_03_wreck_F",_landPos,[], 0, "can_collide"];
_crash setPos [position _crash select 0,position _crash select 1, 0.1];
_crash setVectorUp surfaceNormal position _crash;
_smoke = createVehicle ["test_EmptyObjectForFireBig",position _crash,[], 0, "can_collide"];
_smoke attachTo [_crash, [0.5, -2, 1] ];

if (intercept) then
{

    while {(count (waypoints _interceptor)) > 0} do
    {
        deleteWaypoint ((waypoints _interceptor) select 0);
    };

    diag_log "UNREST Interceptor -- Remaining offensive waypoints deleted";

    _interceptorExitPos = _rescueStartPos call BIS_fnc_selectRandom;
    
    _intExitWP = _interceptor addWaypoint [_interceptorExitPos, 0];
    _intExitWP setWaypointType "MOVE";
    _intExitWP setWaypointBehaviour "CARELESS";
    _intExitWP setWaypointspeed "NORMAL";
    
    _interceptor setCombatMode "BLUE";
    
    {
    _x disableAI "AUTOTARGET";
    _x disableAI "TARGET";
    _x disableAI "SUPPRESSION";
    
    } forEach units _interceptor;
    
    diag_log "UNREST Interceptor Aircraft dismiss order initiated";
};
    
_rescueCrew = createGroup EAST;

[_startPos, 180,"B_Heli_Transport_01_camo_F", _rescueCrew] call BIS_fnc_spawnVehicle;
_rescueSelection = nearestObjects [_startPos, ["air"], 100];
_chopper = _rescueSelection select 0;

if (_debug) then
{    
    [_chopper] spawn
    {
        _chopper1 = _this select 0;
        _pos3 = position _chopper1;
        _mk2 = createMarker ["E",_pos3];
        while {true} do
        {    
            _pos3 = position _chopper1;
            "E" setMarkerType "mil_warning";
            "E" setMarkerText "rescue";
            _mk2 setMarkerPos _pos3;
        };
    };  
};

diag_log "UNREST Rescue HELO Despatched";

_rescueCrew setCombatMode "BLUE";

_rescueWP1 = _rescueCrew addWaypoint [_landPos, 0];
_rescueWP1 setWaypointType "GETOUT";
_rescueWP1 setWaypointBehaviour "CARELESS";
_rescueWP1 setWaypointspeed "NORMAL";

clearMagazineCargoGlobal _chopper; 
clearWeaponCargoGlobal _chopper; 
clearItemCargoGlobal _chopper;
clearBackpackCargoGlobal _chopper; 

// Add weapons to the chopper

for "_i" from 1 to _amountOfWeapons do
{
    _weapon = _lootWeapons call BIS_fnc_selectRandom;
    _chopper addWeaponCargoGlobal [_weapon,1];
    
    _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    _chopper addMagazineCargoGlobal [(_magazines select 0),round random 8];
};

for "_i" from 1 to _amountOfItems do
{
    _items = _lootItems call BIS_fnc_selectRandom;
    _chopper addMagazineCargoGlobal [_items,1];
    
};

waituntil {(getPos _chopper select 2) < 1};
_rescueCrew setCombatMode "RED";
_rescueCrew allowFleeing 0;


[_rescueCrew, _crash, 50] call bis_fnc_taskPatrol;

_aiUnits = ["O_recon_medic_F", "O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_A_F","O_Soldier_lite_F"];

_HeliAiUnits = [position _crash, EAST, _aiUnits,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
//Add waypoint for the AI
_HeliCrashGroupLeader = leader _HeliAiUnits;
_HeliCrashUnitsGroup = group _HeliCrashGroupLeader;

{
    removeBackpackGlobal _x;
    removeAllWeapons _x;
    _curWeapon = _lootWeapons call BIS_fnc_selectRandom;
    [_x,_curWeapon, 5] call BIS_fnc_addWeapon;
} forEach units _HeliAiUnits;

_HeliAIUnits allowFleeing 0;

_HeliCrashUnitsGroup addWaypoint [position _crash, 0];
[_HeliCrashUnitsGroup, 0] setWaypointType "GUARD";
[_HeliCrashUnitsGroup, 0] setWaypointBehaviour "AWARE";

uiSleep 1800;

if (intercept) then
{    
    deleteVehicle _interceptorAircraft;
};