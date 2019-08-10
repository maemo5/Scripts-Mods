/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 16 NPCs
private _npcs = [
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "WhiteHead_06", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [8111.49, 9658.81, 29.4595], [0.980989, -0.194063, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "WhiteHead_15", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [8117.98, 9669.65, 32.4984], [0.561855, 0.827236, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_WasteDump", "WhiteHead_11", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Chestrig_khk",[]],[],"","G_Spectacles",[],["","","","","",""]], [7667.09, 4219.86, 37.8324], [0.775441, 0.63142, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Boat", "GreekHead_A3_07", [[],[],[],["U_C_man_sport_3_F",[]],[],[],"H_Bandanna_blu","G_Sport_Greenblack",[],["","","","","",""]], [3586.02, 3140.56, 0.886333], [-0.902638, 0.430401, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["InBaseMoves_assemblingVehicleErc"], "Exile_Trader_Vehicle", "WhiteHead_20", [[],[],[],["U_C_Driver_3",[]],["V_TacVestIR_blk",[]],[],"","G_Bandanna_blk",[],["","","","","",""]], [7750.17, 4138.79, 36.1904], [-0.706316, 0.707896, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_VehicleCustoms", "WhiteHead_15", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [7754.06, 4142.41, 36.3256], [-0.985525, -0.169533, 0], [0, 0, 1]],
["Exile_Guard_01", ["HubFixingVehicleProne_idle1"], "", "WhiteHead_01", [[],[],[],["U_C_Driver_1_white",[]],[],[],"H_Bandanna_surfer_grn","G_Bandanna_blk",[],["","","","","",""]], [7705.58, 4117.54, 36.4699], [0.998646, 0.0520223, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "GreekHead_A3_07", [[],[],[],["U_C_Man_casual_6_F",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [7711.98, 4143.61, 36.2794], [0.975079, 0.221857, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["InBaseMoves_patrolling1","InBaseMoves_patrolling2"], "Exile_Trader_Armory", "WhiteHead_17", [["arifle_Katiba_F","muzzle_snds_H","acc_flashlight","optic_MRCO",["30Rnd_65x39_caseless_green",30],[],""],[],[],["U_B_CTRG_3",[["30Rnd_65x39_caseless_green",3,30]]],["V_TacVest_blk",[]],[],"H_Bandanna_khk_hs","G_Bandanna_khk",[],["","","","","","NVGoggles"]], [7705.79, 4161.87, 36.1857], [0.712761, -0.701407, 0], [0, 0, 1]],
["Exile_Guard_02", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "GreekHead_A3_07", [["arifle_Katiba_C_F","muzzle_snds_H","acc_flashlight","optic_MRCO",["30Rnd_65x39_caseless_green",30],[],""],[],[],["U_B_CTRG_3",[["30Rnd_65x39_caseless_green",3,30]]],["V_TacVest_blk_POLICE",[]],[],"H_Beret_Colonel","",[],["","","","","",""]], [7718.83, 4173.24, 36.1814], [-0.994277, -0.106834, 0], [0, 0, 1]],
["Exile_Guard_02", ["HubStanding_idle1","HubStanding_idle2","HubStanding_idle3"], "", "WhiteHead_11", [["arifle_Katiba_C_F","muzzle_snds_H","acc_flashlight","optic_MRCO",["30Rnd_65x39_caseless_green",30],[],""],[],[],["U_B_CTRG_3",[["30Rnd_65x39_caseless_green",3,30]]],["V_TacVest_blk_POLICE",[]],[],"H_Beret_Colonel","",[],["","","","","",""]], [7713.05, 4165.27, 36.1834], [0.17291, -0.984938, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Equipment", "GreekHead_A3_07", [[],[],[],["U_Rangemaster",[]],[],[],"H_Hat_grey","",[],["","","","","",""]], [7720.84, 4156.22, 36.1805], [-0.93075, 0.365657, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Hardware", "WhiteHead_14", [["arifle_CTAR_GL_hex_F","","","",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_B_T_Soldier_AR_F",[["30Rnd_580x42_Mag_F",3,30]]],[],[],"","G_Spectacles_Tinted",[],["","","","","",""]], [7750.19, 4184.96, 36.1556], [-0.455199, -0.89039, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "Exile_Trader_SpecialOperations", "WhiteHead_14", [[],[],[],["U_I_C_Soldier_Para_1_F",[]],[],[],"","",[],["","","","","",""]], [4344.2, 6765.63, 448.107], [0.976403, 0.215956, 0], [0, 0, 1]],
["Exile_Trader_Office", ["UnaErcPoslechVelitele2","UnaErcPoslechVelitele3","UnaErcPoslechVelitele4"], "Exile_Trader_Office", "WhiteHead_12", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"","",[],["","","","","",""]], [7721.78, 4147.17, 36.1804], [-0.987223, -0.159347, 0], [0, 0, 1]],
["Exile_Trader_Diving", ["HubStandingUC_idle1","HubStandingUC_idle2","HubStandingUC_idle3","HubStandingUC_move1","HubStandingUC_move2"], "Exile_Trader_Diving", "AfricanHead_01", [["arifle_SDAR_F","","","",[],[],""],[],[],["U_I_Wetsuit",[]],["V_RebreatherIA",[]],[],"","G_I_Diving",[],["","","","","",""]], [3577.72, 3141.32, 0.958461], [0.176364, 0.984325, 0], [0, 0, 1]]
];

{
    private _logic = "Logic" createVehicleLocal [0, 0, 0];
    private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
    private _animations = _x select 1;
    
    _logic setPosWorld (_x select 5);
    _logic setVectorDirAndUp [_x select 6, _x select 7];
    
    _trader setVariable ["BIS_enableRandomization", false];
    _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _trader setVariable ["ExileAnimations", _animations];
    _trader setVariable ["ExileTraderType", _x select 2];
    _trader disableAI "ANIM";
    _trader disableAI "MOVE";
    _trader disableAI "FSM";
    _trader disableAI "AUTOTARGET";
    _trader disableAI "TARGET";
    _trader disableAI "CHECKVISIBLE";
    _trader allowDamage false;
    _trader setFace (_x select 3);
    _trader setUnitLoadOut (_x select 4);
    _trader setPosWorld (_x select 5);
    _trader setVectorDirAndUp [_x select 6, _x select 7];
    _trader reveal _logic;
    _trader attachTo [_logic, [0, 0, 0]];
    _trader switchMove (_animations select 0);
    _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
}
forEach _npcs;