/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 0 Vehicles
private _vehicles = [

];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

// 114 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4268.18, 11641.9, -2.13327], [-0.983152, -0.134348, -0.123946], [-0.122805, -0.0167835, 0.992289]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4283.38, 11644, -1.18721], [-0.99065, -0.136425, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4299.19, 11646.1, -1.19848], [-0.99065, -0.136425, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4314.97, 11648.3, -1.20369], [-0.99065, -0.136425, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4326.35, 11649.5, -1.6284], [0.988338, 0.152273, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4330.46, 11647.1, -1.62832], [0.919221, -0.393743, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4353.91, 11613.3, -1.23574], [-0.574522, 0.818489, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4344.77, 11626.3, -1.23054], [-0.574522, 0.818489, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4335.6, 11639.4, -1.21926], [-0.574522, 0.818489, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4359.09, 11605.4, -1.5996], [-0.907431, 0.420201, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4369.24, 11600.3, -1.21101], [-0.908049, 0.418865, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4383.73, 11593.6, -1.22229], [-0.908049, 0.418865, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4398.18, 11587, -1.2275], [-0.908049, 0.418865, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4557.41, 11515, -1.22497], [0.911313, -0.411714, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4542.87, 11521.5, -1.23625], [0.911313, -0.411714, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4528.35, 11528.1, -1.24146], [0.911313, -0.411714, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4514.01, 11534.6, -1.23319], [0.909372, -0.415983, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4499.5, 11541.3, -1.24447], [0.909372, -0.415983, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4485.03, 11547.9, -1.24968], [0.909372, -0.415983, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4470.56, 11554.5, -1.24715], [0.912701, -0.408627, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4455.99, 11561, -1.25842], [0.912701, -0.408627, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4441.45, 11567.5, -1.26326], [0.912705, -0.40862, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\canals\canal_dutch_01_bridge_f.p3d", [4419.76, 11577.2, -0.326769], [-0.409328, -0.912387, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4660.44, 11468.6, -0.729284], [0.909372, -0.415983, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4718.34, 11442.3, -0.709788], [0.911313, -0.411714, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4703.8, 11448.9, -0.721065], [0.911313, -0.411714, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4689.28, 11455.5, -0.726274], [0.911313, -0.411714, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4674.94, 11462, -0.718008], [0.909372, -0.415983, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4645.96, 11475.3, -0.734493], [0.909372, -0.415983, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4631.49, 11481.8, -0.731965], [0.912701, -0.408627, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4616.92, 11488.3, -0.743241], [0.912701, -0.408627, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4602.38, 11494.9, -0.748075], [0.912705, -0.40862, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\canals\canal_dutch_01_bridge_f.p3d", [4580.69, 11504.6, 0.188413], [-0.409328, -0.912387, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\canals\canal_dutch_01_bridge_f.p3d", [4741.56, 11431.9, 0.744769], [-0.409328, -0.912387, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4760.69, 11423, -1.14884], [0.911016, -0.412371, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4774.7, 11402.1, -0.760198], [0.565061, -0.825049, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4810.76, 11349.7, -0.740703], [0.568924, -0.82239, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4801.69, 11362.9, -0.751979], [0.568924, -0.82239, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4792.63, 11376, -0.757188], [0.568924, -0.82239, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4783.7, 11388.9, -0.748922], [0.565061, -0.825049, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4765.7, 11415.3, -0.765407], [0.565061, -0.825049, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4828.51, 11323.8, -0.74404], [0.565061, -0.825049, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4864.58, 11271.4, -0.724544], [0.568924, -0.82239, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4855.5, 11284.6, -0.73582], [0.568924, -0.82239, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4846.45, 11297.7, -0.741029], [0.568924, -0.82239, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4837.52, 11310.6, -0.732734], [0.565068, -0.825044, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4819.52, 11337, -0.749249], [0.565061, -0.825049, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4997.62, 11370.1, -1.70656], [0.529548, 0.778724, -0.336404], [0.189155, 0.278187, 0.941718]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4989.94, 11358.6, 0.695375], [-0.553146, -0.833084, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4981.12, 11345.5, 0.696042], [-0.558627, -0.829419, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4945.72, 11292.7, 0.715538], [-0.554732, -0.832029, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4954.58, 11306, 0.704261], [-0.554732, -0.832029, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4963.42, 11319.2, 0.699052], [-0.554732, -0.832029, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4972.2, 11332.3, 0.707318], [-0.558627, -0.829419, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4881.4, 11246.5, 0.716151], [0.569731, -0.821831, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4872.84, 11259.2, -0.0509262], [0.547393, -0.830726, 0.101274], [-0.0581155, 0.0829885, 0.994855]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4904.52, 11240.3, 0.696152], [-0.903195, -0.42923, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4919.28, 11253.2, 0.705292], [-0.554732, -0.832029, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4928.13, 11266.5, 0.700083], [-0.554732, -0.832029, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_16m_f.p3d", [4936.9, 11279.5, 0.708349], [-0.558627, -0.829419, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4886.58, 11238.6, 0.310964], [-0.907574, 0.419892, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4890.46, 11236.2, 0.302041], [-0.994432, -0.105377, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4894.16, 11235.8, 0.301715], [-0.898906, -0.438141, 0], [0, 0, 1]],
["a3\structures_f_exp\naval\piers\pierconcrete_01_30deg_f.p3d", [4912.79, 11244, 0.301126], [-0.541068, -0.840979, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4983.45, 11329.2, 4.0499], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4968.1, 11329.2, -6.45758], [-0.917223, 0.398355, 0.00382073], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_round_f.p3d", [4909.53, 11252.5, -5.41416], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4903.48, 11240.5, -5.99943], [-0.42634, 0.904563, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4882.13, 11231.9, 0.782229], [0.687539, -0.726147, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4875.06, 11254.6, -6.77211], [0.820834, 0.571167, 2.6077e-008], [-0.0649146, 0.0932898, 0.993521]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4906, 11231.3, 0.565514], [0.940787, 0.338999, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4723.21, 11433, -4.33822], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4751.78, 11420.2, -3.32993], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4769.01, 11409.1, -7.34723], [0.810253, 0.58608, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4759.24, 11431.7, -2.89819], [-0.734496, 0.678613, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4727.28, 11443.7, -5.15191], [-0.596623, -0.802522, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4709.28, 11445.8, -7.93912], [0.375235, 0.92693, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4562.63, 11505.3, -3.52434], [0.712898, -0.701268, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4570.45, 11516.5, -3.95608], [-0.0313079, -0.99951, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4598.61, 11502.7, -4.96437], [-0.0313079, -0.99951, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4594.2, 11492.2, -5.77805], [0.621449, 0.783455, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4949.25, 11299.3, -7.32311], [-0.871524, 0.4902, 0.0122678], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4929.93, 11269.1, -8.37943], [-0.871524, 0.4902, 0.0122678], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4833.09, 11315.4, -15.2392], [-0.808483, -0.588519, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4812.26, 11346.4, -15.247], [-0.808483, -0.588519, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4791.16, 11377.7, -15.2389], [-0.808483, -0.588519, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4773.67, 11401.7, -15.2432], [-0.808483, -0.588519, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4853.93, 11284.7, -15.2313], [-0.808483, -0.588519, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4618.87, 11488.2, -16.0326], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4653.11, 11473, -16.0298], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4684.58, 11458.9, -16.0266], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4543.16, 11521.7, -16.2012], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4511.2, 11536.2, -16.1846], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4476.96, 11551.3, -16.1982], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4453.49, 11561.8, -16.2142], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4418.03, 11577.1, -17.7297], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4387.58, 11593.6, -15.0993], [-0.40504, -0.910584, -0.0823341], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4359.78, 11611.6, -15.0763], [-0.72028, -0.689669, -0.0745246], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4338.76, 11637, -12.0789], [-0.83159, -0.551322, -0.0671007], [-0.0293202, -0.077069, 0.996595]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4309.19, 11646.5, -10.5052], [0.182887, -0.983134, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4278.35, 11642.6, -10.4887], [0.182887, -0.983134, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4248, 11637.9, -12.4292], [0.182887, -0.983134, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4212.5, 11644.8, -12.4331], [-0.731124, -0.682244, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4402.44, 11577.7, -4.05332], [0.712898, -0.701268, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4410.25, 11588.9, -4.48506], [-0.0313079, -0.99951, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4438.41, 11575.2, -5.49335], [-0.0313079, -0.99951, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4434.01, 11564.6, -6.30703], [0.621449, 0.783455, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_long_f.p3d", [4892.76, 11228.4, -11.2411], [0.153163, 0.988201, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_tall_f.p3d", [4331.48, 11658.5, -11.9221], [-0.490075, -0.87168, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4315.34, 11658.7, -5.54545], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4322.72, 11638.4, -1.42851], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_tall_f.p3d", [4321.94, 11637.1, -19.8665], [-0.490075, -0.87168, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_wall_tall_f.p3d", [4891.05, 11251.8, -19.2136], [0.873238, 0.487294, 0], [0, 0, 1]],
["a3\rocks_f_exp\cliff\cliff_peak_f.p3d", [4894.15, 11226.8, -0.348613], [0.990636, -0.133485, -0.0286698], [-0.0525987, -0.56692, 0.822092]]
];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;