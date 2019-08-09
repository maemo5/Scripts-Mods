//////////////////////////////
//
// Original Script created by: Sumrak, ©2010
// Modified by: Fallingsheep 
// Contributers: Khunt, John, hawkie52 
//
/////////////////////////////

// to use only 1 type 
ns_blow_itemapsi = ["H_PilotHelmetFighter_B","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O"];//set headgear protection here
ns_blow_itemtype = 1; // 1=Headgear 2=Vest 3=Item  4=Goggles 5=Uniform
ns_blow_removeapsi = true; // remove/destroy APSI item after storm
ns_blow_delaymod = 0.1; //blowout delay - higher number longer time between blowouts

//amount of damage blowout causes - value of 1 or higher will kill player!
 // set to 0 to have player take no damage regardless of having APSI
ns_blow_damage_unprotected = 0.60; //damage taken when outside unprotected
ns_blow_damage_invehicle = 0.0; //damage taken when in vehicle
ns_blow_damage_inbuilding = 0.0; // damage taken when inside

ns_prep_time = 20; //time to prepare/hide after storm is started 

ns_blowout = true;//Do not change
ns_blowout_exile = true;//Do not change
ns_blow_prep = false;//Do not change
ns_blow_status = false;//Do not change
ns_blow_action = false;//Do not change
phasAPSI = false;//Do not change
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//				TESTING MAY NOT WORK IF THEY CAUSE ANY ISSUES SET TO FALSE
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ns_blow_lightning = false; //spawn lightning at storm location
//WARNING can destroy already damaged vehicles!!
ns_blow_damage_vehicles = false; //damage ALL vehicles on map
ns_blow_vehicle_damageamount = 0.10; // amount of damage vehicles take - value of 1 or higher will destroy vehicles!
//WARNING - can cause choppers/planes to crash!!!
ns_blow_disable_vehicles = false; // disable vehicles during storm - 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


fnc_isInsideBuilding = compile preprocessFileLineNumbers "addons\blowout\external\fn_isInsideBuilding.sqf";
fnc_hasAPSI = compile preprocessFileLineNumbers "addons\blowout\external\fn_hasAPSI.sqf";

if (!isDedicated) then {
	 _bul = [] execVM "addons\blowout\module\blowout_client.sqf";
	diag_log "BLOWOUT CLIENT - Loading";
};
if (isServer) then {
	_bul = [] execVM "addons\blowout\module\blowout_server.sqf";
	sleep 2;
};

systemChat "EVR, ready!";