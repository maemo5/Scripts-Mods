/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 26 NPCs
private _npcs = [
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "WhiteHead_08", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [6954.19, 7500.08, 2.66144], [0, 1, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "AfricanHead_01", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [6929.05, 7495.84, 3.21844], [0.911288, -0.411769, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["InBaseMoves_assemblingVehicleErc"], "Exile_Trader_Vehicle", "GreekHead_A3_08", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_Cap_red","",[],["","","","","",""]], [6907.36, 7445.64, 2.66144], [0.508913, 0.860818, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_VehicleCustoms", "GreekHead_A3_08", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","",[],["","","","","",""]], [6900.83, 7448.93, 2.77344], [-0.0307129, -0.999528, 0], [0, 0, 1]],
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "WhiteHead_08", [[],[],[],["U_C_Man_casual_6_F",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [6993.68, 7452.74, 2.89644], [-0.475332, -0.879806, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_WasteDump", "WhiteHead_20", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Tactical_Black",[],["","","","","",""]], [6981.42, 7433.99, 2.66144], [-0.454437, 0.890779, 0], [0, 0, 1]],
["Exile_Trader_Office", ["UnaErcPoslechVelitele2","UnaErcPoslechVelitele3","UnaErcPoslechVelitele4"], "Exile_Trader_Office", "AfricanHead_02", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"","",[],["","","","","",""]], [6988.64, 7495.21, 2.75115], [-0.696465, -0.717591, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["InBaseMoves_patrolling1","InBaseMoves_patrolling2"], "Exile_Trader_Equipment", "WhiteHead_21", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [6922.17, 7493.17, 3.20544], [-0.875987, 0.482335, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["InBaseMoves_patrolling1","InBaseMoves_patrolling2"], "Exile_Trader_Armory", "AfricanHead_01", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"","",[],["","","","","",""]], [6912, 7499.43, 3.19944], [-0.435412, -0.900231, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "GreekHead_A3_06", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [11517.5, 13180.3, 6.94138], [-0.449882, -0.893088, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "WhiteHead_11", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [11541.8, 13172.8, 7.49838], [-0.628665, 0.777676, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "GreekHead_A3_07", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [2282.88, 13446.9, 13.4374], [-0.491213, 0.87104, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "WhiteHead_04", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [2263.06, 13430.8, 13.9944], [0.996033, 0.0889812, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "GreekHead_A3_07", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [2097.95, 3490.22, 12.9387], [-0.132637, 0.991165, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "WhiteHead_19", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [2073.6, 3482.69, 13.4957], [0.957855, -0.287252, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "WhiteHead_14", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [11773.3, 3006.31, 4.86003], [-0.72629, -0.687388, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "WhiteHead_08", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [11793.7, 2990.96, 5.41703], [-0.327361, 0.944899, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendA","AmovPercMstpSnonWnonDnon_exercisekneeBendB"], "Exile_Trader_SpecialOperations", "WhiteHead_06", [[],[],[],["U_I_C_Soldier_Para_1_F",[]],[],[],"","",[],["","","","","",""]], [11233.9, 8683.04, 367.849], [-0.500978, -0.86546, 0], [0, 0, 1]],
["Exile_Trader_RussianRoulette", ["InBaseMoves_table1"], "Exile_Trader_RussianRoulette", "WhiteHead_14", [[],[],["hgun_Pistol_Signal_F","","","",[],[],""],["U_Marshal",[]],["V_Rangemaster_belt",[]],[],"H_Cap_marshal","G_Sport_Blackyellow",[],["","","","","",""]], [6877.07, 7496.44, 2.93944], [-0.559106, -0.829096, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Boat", "WhiteHead_04", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Cap_usblack","",[],["","","","","",""]], [9428.12, 6152.02, 0.747677], [-0.483221, 0.875498, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Boat", "WhiteHead_06", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Cap_usblack","",[],["","","","","",""]], [9459.03, 4273.52, 1.35289], [0.853468, -0.521145, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Boat", "WhiteHead_20", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Cap_usblack","",[],["","","","","",""]], [3438.43, 3417.04, 1.36199], [-0.855841, -0.517239, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Boat", "WhiteHead_15", [[],[],[],["U_C_man_sport_1_F",[]],[],[],"H_Cap_usblack","",[],["","","","","",""]], [4003.16, 14038.7, 1.64849], [-0.502058, -0.864834, 0], [0, 0, 1]],
["Exile_Trader_Diving", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Diving", "WhiteHead_09", [[],[],[],["U_I_Wetsuit",[]],["V_RebreatherIA",[]],[],"","G_I_Diving",[],["","","","","",""]], [9433.04, 6161.25, 0.771721], [0.534867, 0.844936, 0], [0, 0, 1]],
["Exile_Guard_01", ["LHD_krajPaluby"], "", "WhiteHead_03", [[],[],[],["U_C_Scientist",[]],[],[],"
Exile_Headgear_GasMask","",[],["","","","","",""]], [4792.94, 5130.04, 15.0269], [-0.599542, -0.800343, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Hardware", "GreekHead_A3_07", [["arifle_CTAR_GL_hex_F","","","",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_B_T_Soldier_AR_F",[["30Rnd_580x42_Mag_F",3,30]]],[],[],"","G_Spectacles_Tinted",[],["","","","","",""]], [6901.63, 7463.77, 2.66144], [0.928894, -0.370347, 0], [0, 0, 1]]
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