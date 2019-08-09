
/*
	By Ghostrider-GRG-
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_center","_garrisonedBuilding_ATLsystem",
        ["_aiDifficultyLevel","Red"],
        ["_uniforms",[]],
        ["_headGear",[]],
        ["_vests",[]],
        ["_backpacks",[]],
        ["_weaponList",[]],
        ["_sideArms",[]]
];

if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};

/*
{
    diag_log format["_fnc_garrisonBuilding_ATLsystem:  _this %1 = %2",_forEachIndex,_this select _forEachIndex];
}forEach _this;
*/

private["_group","_buildingsSpawned","_staticsSpawned","_g","_building","_return"];
_buildingsSpawned = [];
_staticsSpawned = [];   
_group = call blck_fnc_create_AI_Group; 
{
    _g = _x;
    //{
            //diag_log format["_g %1 = %2",_forEachIndex,_g select _forEachIndex];
    //}forEach _g;   
    //   ["Land_Unfinished_Building_02_F",[-28.3966,34.8145,-0.00268841],0,true,true,[["B_HMG_01_high_F",[-5.76953,1.16504,7.21168],360]],[]],          
    _x params["_bldClassName","_bldRelPos","_bldDir","_s","_d","_statics","_men"];
    //diag_log format["_bldClassName = %1 | _bldRelPos = %2 | _bldDir = %3",_bldClassName,_bldRelPos,_bldDir];
    _building = createVehicle[_bldClassName,[0,0,0],[],0,"CAN_COLLIDE"];
    _building setPosATL (_bldRelPos vectorAdd _center);
    _building setDir _bldDir;
    _buildingsSpawned pushBack _building;
    _staticsSpawned = [_building,_group,_statics,_men,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,"none",_weaponList,_sideArms] call blck_fnc_spawnGarrisonInsideBuilding_ATL;
}forEach _garrisonedBuilding_ATLsystem;
//{
    //diag_log format["__fnc_garrisonBuilding_ATLsystem: %2 = %1",_x select 1, _x select 0];
//}forEach [ [_buildingsSpawned,"Buildings"],[_staticsSpawned,"Statics"]];
_return = [_group,_buildingsSpawned,_staticsSpawned];
_return
