/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

if (!hasInterface || isServer) exitWith {};

// 11 NPCs
private _npcs = [
["Exile_Trader_Food", ["InBaseMoves_table1"], "Exile_Trader_Food", "WhiteHead_18", [[],[],[],["U_C_Man_casual_6_F",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [6556.02, 5597.2, 393.986], [-0.997986, -0.0634349, 0], [0, 0, 1]],
["Exile_Trader_Office", ["UnaErcPoslechVelitele2","UnaErcPoslechVelitele3","UnaErcPoslechVelitele4"], "Exile_Trader_Office", "WhiteHead_01", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"","",[],["","","","","",""]], [6554.15, 5595.44, 405.596], [-0.0243976, 0.999702, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_Hardware", "WhiteHead_03", [["arifle_CTAR_GL_hex_F","","","",["30Rnd_580x42_Mag_F",30],[],""],[],[],["U_B_T_Soldier_AR_F",[["30Rnd_580x42_Mag_F",3,30]]],[],[],"","G_Spectacles_Tinted",[],["","","","","",""]], [6552.77, 5624.32, 394.862], [0.567581, -0.823318, 0], [0, 0, 1]],
["Exile_Trader_Equipment", ["HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"], "Exile_Trader_Equipment", "WhiteHead_04", [[],[],[],["U_Rangemaster",[]],[],[],"H_Hat_grey","",[],["","","","","",""]], [6545.64, 5575.55, 392.285], [-0.0733725, 0.997305, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["InBaseMoves_assemblingVehicleErc"], "Exile_Trader_Vehicle", "WhiteHead_12", [[],[],[],["U_C_Driver_3",[]],["V_TacVestIR_blk",[]],[],"","G_Bandanna_blk",[],["","","","","",""]], [6747.07, 5601.5, 344.479], [-0.627513, 0.778604, -0.00149109], [-0.00218545, 0.000153728, 0.999998]],
["Exile_Trader_VehicleCustoms", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_VehicleCustoms", "WhiteHead_15", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Tactical_Black",[],["","","","","",""]], [6745.99, 5592.63, 344.66], [0.999503, 0.0315382, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_carFixingWheel"], "Exile_Trader_Aircraft", "WhiteHead_20", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"","G_Aviator",[],["","","","","",""]], [12152.2, 12644.8, 159.001], [-0.503557, -0.863962, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["InBaseMoves_table1"], "Exile_Trader_AircraftCustoms", "AfricanHead_03", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"","",[],["","","","","",""]], [12160.4, 12635.1, 162.04], [0.598656, -0.801006, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubSittingHighB_idle1","HubSittingHighB_idle2","HubSittingHighB_idle3"], "Exile_Trader_WasteDump", "WhiteHead_10", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Chestrig_khk",[]],[],"","G_Spectacles",[],["","","","","",""]], [6775.09, 5591.49, 342.603], [-0.975659, -0.219295, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["c4coming2cDf_genericstani1","c4coming2cDf_genericstani2","c4coming2cDf_genericstani3"], "Exile_Trader_SpecialOperations", "WhiteHead_10", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [6880.7, 11460.3, 393.847], [-0.186568, -0.982442, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["InBaseMoves_patrolling1","InBaseMoves_patrolling2"], "Exile_Trader_Armory", "WhiteHead_11", [["arifle_Katiba_F","muzzle_snds_H","acc_flashlight","optic_MRCO",["30Rnd_65x39_caseless_green",30],[],""],[],[],["U_B_CTRG_3",[["30Rnd_65x39_caseless_green",3,30]]],["V_TacVest_blk",[]],[],"H_Bandanna_khk_hs","G_Bandanna_khk",[],["","","","","","NVGoggles"]], [6506.68, 5603.54, 389.277], [0.999963, -0.00860446, 0], [0, 0, 1]]
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