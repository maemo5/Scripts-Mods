
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

params["_center","_garrisonedBuilding_relPosSystem",
        ["_aiDifficultyLevel","Red"],
        ["_uniforms",[]],
        ["_headGear",[]],
        ["_vests",[]],
        ["_backpacks",[]],
        ["_weaponList",[]],
        ["_sideArms",[]]
    ];
{
    diag_log format["_fnc_garrisonBuilding_relPosSystem: _this %1 = %2",_forEachIndex,_this select _forEachIndex];
}forEach _this;
if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call blck_fnc_selectAIBackpacks};
private["_group","_buildingsSpawned","_staticsSpawned","_g","_building","_return"];
_buildingsSpawned = [];
_staticsSpawned = [];
_group = call blck_fnc_create_AI_Group;
{
    _g = _x;
    //       ["Land_Unfinished_Building_02_F",[-21.8763,-45.978,-0.00213432],0,true,true,0.67,3,[],4],
    _g params["_bldClassName","_bldRelPos","_bldDir","_s","_d","_p","_noStatics","_typesStatics","_noUnits"];
    if (_typesStatics isEqualTo []) then {_typesStatics = ["B_HMG_01_high_F"]};
    _building = createVehicle[_bldClassName,[0,0,0],[],0,"CAN_COLLIDE"];
    _buildingsSpawned pushBack _building;
    _building setPosATL (_bldRelPos vectorAdd _center);
    _building setDir _bldDir;
    _staticsSpawned = [_building,_group,_noStatics,_typesStatics,_noUnits,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,"none",_weaponList,_sideArms] call blck_fnc_spawnGarrisonInsideBuilding_relPos;
}forEach _garrisonedBuilding_relPosSystem;
_return = [_group,_buildingsSpawned,_staticsSpawned];
_return

