/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 89 Vehicles
private _vehicles = [
["Exile_Construction_WoodFloor_Static", [8925.12, 3736.53, 4.09751], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8925.05, 3734.57, 4.09559], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8919.3, 3734.77, 4.09792], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8919.37, 3736.73, 4.0996], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8913.53, 3734.96, 4.09791], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8913.6, 3736.92, 4.09959], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8907.79, 3735.14, 4.09791], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8907.86, 3737.1, 4.09959], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8902.05, 3735.33, 4.09138], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8902.12, 3737.29, 4.09306], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8896.33, 3735.53, 4.09133], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8896.4, 3737.49, 4.09301], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8890.58, 3735.74, 4.09131], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodFloor_Static", [8890.64, 3737.7, 4.09299], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodSupport_Static", [8888.84, 3734.85, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8891.79, 3734.74, 3.96561], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8894.73, 3734.63, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8897.7, 3734.52, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8900.67, 3734.41, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8903.62, 3734.31, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8906.57, 3734.19, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8909.51, 3734.08, 3.96559], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8912.44, 3733.98, 3.96562], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8921.3, 3733.66, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8918.35, 3733.77, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8915.4, 3733.87, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8924.24, 3733.54, 3.96557], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8927.17, 3733.44, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8930.12, 3733.33, 3.94784], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8888.92, 3736.81, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8891.87, 3736.7, 3.98342], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8894.81, 3736.58, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8897.77, 3736.48, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8900.74, 3736.37, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8903.69, 3736.27, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8906.64, 3736.15, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8909.58, 3736.04, 3.9834], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8912.52, 3735.94, 3.98343], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8915.47, 3735.83, 3.98341], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8918.42, 3735.73, 3.98341], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8921.38, 3735.61, 3.98341], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8924.32, 3735.5, 3.98338], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8927.25, 3735.4, 3.98341], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8930.2, 3735.29, 3.96566], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8888.98, 3738.93, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8891.94, 3738.82, 3.96559], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8894.88, 3738.71, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8897.84, 3738.6, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8900.81, 3738.49, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8903.76, 3738.39, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8906.71, 3738.28, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8909.65, 3738.16, 3.96557], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8912.58, 3738.06, 3.9656], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8915.54, 3737.96, 3.96558], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8918.49, 3737.85, 3.96558], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8921.44, 3737.74, 3.96558], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8924.38, 3737.63, 3.96555], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8927.32, 3737.52, 3.96558], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8930.26, 3737.42, 3.94783], [0.0370853, 0.998701, 0.0349454], [-0.999312, 0.0370626, 0.00129683], false],
["Exile_Construction_WoodSupport_Static", [8930.13, 3737.46, 2.88035], [0.0370853, 0.998701, 0.0349451], [-0.991988, 0.0325649, 0.122064], false],
["Exile_Construction_WoodSupport_Static", [8927.22, 3737.55, 3.23524], [0.0370853, 0.998701, 0.0349451], [-0.991988, 0.0325649, 0.122064], false],
["Exile_Construction_WoodSupport_Static", [8924.3, 3737.65, 3.59053], [0.0370853, 0.998701, 0.0349451], [-0.991988, 0.0325649, 0.122064], false],
["Exile_Construction_WoodSupport_Static", [8924.89, 3733.53, 3.61281], [0.0370853, 0.998701, 0.0349451], [-0.991988, 0.0325649, 0.122064], false],
["Exile_Construction_WoodSupport_Static", [8927.8, 3733.43, 3.25752], [0.0370853, 0.998701, 0.0349451], [-0.991988, 0.0325649, 0.122064], false],
["Exile_Construction_WoodSupport_Static", [8930.71, 3733.34, 2.90263], [0.0370853, 0.998701, 0.0349451], [-0.991988, 0.0325649, 0.122064], false],
["Exile_Construction_WoodSupport_Static", [8890.2, 3734.81, 3.4459], [0.0370854, 0.998701, 0.0349432], [-0.995337, 0.0400309, -0.0877546], false],
["Exile_Construction_WoodSupport_Static", [8893.12, 3734.69, 3.70817], [0.0370837, 0.998701, 0.0349451], [-0.995338, 0.0400293, -0.0877503], false],
["Exile_Construction_WoodSupport_Static", [8896.04, 3734.58, 3.96883], [0.0370837, 0.998701, 0.0349451], [-0.995338, 0.0400293, -0.0877503], false],
["Exile_Construction_WoodSupport_Static", [8892.52, 3738.83, 3.73499], [0.0370837, 0.998701, 0.0349451], [-0.995338, 0.0400293, -0.0877503], false],
["Exile_Construction_WoodSupport_Static", [8889.6, 3738.95, 3.47323], [0.0370837, 0.998701, 0.0349451], [-0.995338, 0.0400293, -0.0877503], false],
["Exile_Construction_WoodSupport_Static", [8895.44, 3738.72, 3.99566], [0.0370837, 0.998701, 0.0349451], [-0.995338, 0.0400293, -0.0877503], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8924.15, 3731.73, 4.34453], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8918.28, 3731.93, 4.34792], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8912.4, 3732.14, 4.34791], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8906.53, 3732.35, 4.34138], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8900.66, 3732.55, 4.34138], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8894.78, 3732.76, 4.34131], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8890.76, 3732.88, 4.34131], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8891.05, 3740.55, 4.34299], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8896.93, 3740.33, 4.34301], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8902.8, 3740.12, 4.34306], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8908.68, 3739.92, 4.34959], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8914.58, 3739.73, 4.34959], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8920.45, 3739.53, 4.3496], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8924.42, 3739.41, 4.34751], [0.0349693, 0.999388, 0], [0, 0, 1], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8930.1, 3739.21, 3.91349], [0.0349692, 0.999388, -6.98725e-006], [0.153924, -0.00537897, 0.988068], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8929.84, 3731.54, 3.91427], [0.0349692, 0.999388, -6.98725e-006], [0.153924, -0.00537897, 0.988068], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8885.05, 3733.11, 3.9651], [0.0349696, 0.999388, -8.63429e-006], [-0.133359, 0.00467493, 0.991057], false],
["Exile_Construction_WoodWallHalf_Reinforced_Static", [8885.33, 3740.73, 3.97156], [0.0349696, 0.999388, -8.63429e-006], [-0.133359, 0.00467493, 0.991057], false]
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

// 52 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9264.31, 3729.78, -19.894], [0, 1, 0], [0.0207746, 0, 0.999784]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9225.56, 3729.72, -19.4956], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9185.72, 3729.7, -19.5], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9145.97, 3729.69, -19.5035], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8549.81, 3748.68, -19.4881], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8589.57, 3747.28, -19.5132], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8629.27, 3745.91, -19.4951], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8669.04, 3744.51, -19.4974], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8708.88, 3743.11, -19.4884], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8748.74, 3741.73, -19.4967], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8788.62, 3740.34, -19.4929], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8828.39, 3738.95, -19.4771], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8987.03, 3733.38, -19.5119], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9066.37, 3730.6, -19.5297], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9106.2, 3729.8, -19.5199], [0.00574236, 0.999983, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8867.94, 3737.48, -19.4756], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [8947.38, 3734.78, -19.4944], [0.0349693, 0.999388, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\pier_addon.p3d", [8942.58, 3740.51, 1.68042], [0.0349693, 0.999388, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\pier_addon.p3d", [8872.32, 3731.62, 1.76363], [-0.0356947, -0.999363, 0], [0, 0, 1]],
["a3\structures_f\naval\piers\nav_pier_m_f.p3d", [9026.64, 3731.99, -19.5203], [0.0349631, 0.999389, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallv_f.p3d", [9170.67, 3715.05, -23.2433], [0.999905, 0.0138103, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9171.93, 3745.53, -0.999369], [0.999216, -0.0395897, 0], [0, 0, 1]],
["a3\rocks_f\sharp\sharprock_apart.p3d", [9197.76, 3743.31, 1.91707], [0, 1, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9129.18, 3729.46, -10.2632], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9072.26, 3731.11, -13.9452], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9014.83, 3732.93, -11.4867], [0.999188, -0.0402785, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8961.29, 3735.39, -16.5249], [-0.993823, 0.0523119, -0.0978749], [-0.104229, -0.137119, 0.985056]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8862.99, 3738.12, -13.8068], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8804, 3740.71, -13.3936], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8740.6, 3742.96, -16.1079], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8691.2, 3744.29, -11.462], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8630.31, 3745.53, -15.4567], [0.994089, -0.0488918, -0.0969307], [0.0995034, 0.0532583, 0.993611]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8572.8, 3745.7, -14.9787], [0.981561, -0.072074, -0.177042], [0.186281, 0.152954, 0.970518]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8521.86, 3746.58, -11.8011], [0.983727, -0.145827, -0.104952], [0.119928, 0.098003, 0.987933]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9170.19, 3747.07, -19.5553], [0.999216, -0.0395897, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9127.43, 3731, -24.1619], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9070.52, 3732.65, -17.0191], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [9013.09, 3734.47, -21.7166], [0.999188, -0.0402785, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8959.55, 3736.92, -37.6861], [-0.994917, 0.0367487, -0.0937542], [-0.0931921, 0.0167242, 0.995508]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8861.25, 3739.65, -32.454], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8802.26, 3742.25, -40.3355], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8738.85, 3744.5, -43.5381], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8689.46, 3745.82, -33.3613], [-0.999266, 0.0383183, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8628.57, 3747.06, -39.6506], [0.992663, -0.0404602, 0.113944], [-0.112874, 0.0278106, 0.99322]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8571.06, 3747.23, -38.7821], [0.9947, -0.0504211, -0.0896092], [0.0931919, 0.073872, 0.992904]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8520.12, 3748.12, -34.3772], [0.989777, -0.134377, -0.0477934], [0.0471468, -0.00799169, 0.998856]],
["a3\rocks_f\sharp\sharprock_spike.p3d", [8938.8, 3729.63, -3.56646], [-0.117468, -0.993077, 0], [0, 0, 1]],
["a3\rocks_f\sharp\sharprock_spike.p3d", [8951.02, 3726.99, -5.62006], [-0.960663, -0.277716, 0], [0, 0, 1]],
["a3\rocks_f\sharp\sharprock_spike.p3d", [8961.06, 3738.39, -5.93203], [-0.0147574, 0.999891, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallh_f.p3d", [8522.47, 3762.99, -6.73935], [0.998869, -0.0475566, 0], [0, 0, 1]],
["a3\rocks_f_argo\limestone\limestone_01_wallv_f.p3d", [8508.17, 3727.14, -18.7282], [0.996592, -0.00454993, -0.0823599], [0.0813289, 0.22082, 0.971918]],
["a3\rocks_f_argo\limestone\limestone_01_wallv_f.p3d", [8506.78, 3766.47, -20.4963], [-0.188664, -0.973859, -0.126511], [-0.067049, -0.11575, 0.991013]]
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