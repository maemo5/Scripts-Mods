

params["_building","_aiDifficultyLevel","_statics","_units"];
diag_log format["_fnc_sm_spawnBuildingGarrisonASL: handling _building = %1 | at location = %2",_building,position _building];
private _group = [] call blck_fnc_create_AI_Group;
//params["_building","_group","_statics","_men","_aiDifficultyLevel","_uniforms","_headGear","_vests","_backpacks",["_launcher","none"],"_weaponList","_sideArms"];
[_building,_group,_statics,_units,_aiDifficultyLevel] call blck_fnc_spawnGarrisonInsideBuilding_ATL;
_group
