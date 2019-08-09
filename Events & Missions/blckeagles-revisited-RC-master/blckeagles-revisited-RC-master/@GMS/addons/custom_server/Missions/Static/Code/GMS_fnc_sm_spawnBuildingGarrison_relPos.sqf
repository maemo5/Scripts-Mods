

params["_building","_skillLevel","_noStatics","_typesStatics","_noUnits"];
diag_log format["_fnc_sm_spawnBuildingGarrison_relPos: handling _building = %1 | at location = %2",_building,position _building];
private _group = [] call blck_fnc_create_AI_Group;
// ["_building","_group","_noStatics","_typesStatics","_noUnits",["_aiDifficultyLevel","Red"],
[_building,_group,_noStatics,[],_noUnits,_skillLevel] call blck_fnc_spawnGarrisonInsideBuilding_relPos;
_group