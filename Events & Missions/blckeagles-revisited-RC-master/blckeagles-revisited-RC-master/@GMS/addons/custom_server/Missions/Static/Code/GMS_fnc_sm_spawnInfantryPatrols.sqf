/*
	by Ghostrider [GRG]
	for ghostridergaming
	12/5/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

//  	params["_coords",["_minNoAI",3],["_maxNoAI",6],["_aiDifficultyLevel","red"],["_uniforms",blck_SkinList],["_headGear",blck_BanditHeadgear]];
params["_patrols","_coords",["_minNoAI",3],["_maxNoAI",6],["_aiDifficultyLevel","red"],["_weapons",blck_WeaponList_Orange],["_uniforms",blck_SkinList],["_headGear",blck_BanditHeadgear]];
//diag_log format["_sm_spawnInfantryPatrols:: _this = %1",_this];
//diag_log format["_sm_spawnInfantryPatrols:: patrols = %1",_patrols];
if (_patrols isEqualTo []) then 
{
	// Use the random spawn logic from the regular dyanmic mission system.
	//params[_coords,"_maxNoAI,_missionGroups,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,_weapons,sideArms,_isScubaGroup];
	[_coords,_minNoAI,_maxNoAI,_aiDifficultyLevel,_uniforms,_headGear] call blck_fnc_spawnMissionAI
} else {
	{
		//diag_log format["_sm_spawnInfantryPatrols.sqf:: _x = %1",_x];
		// Use the pre-defined spawn positions and other parameters for each group.
		//  [[22819.4,16929.5,5.33892],"red",4, 75]
		private["_pos","_difficulty","_noAI","_patrolRadius"];
		_pos = _x select 0;  // Position at which to spawn the group 
		_difficulty = _x select 1; // AI difficulty setting (blue, green etc)
		_noAI = _x select 2; // Number of AI to spawn with the group
		_patrolRadius = _x select 3;  // Radius within which AI should patrol
		//  params["_pos", ["_numai1",5], ["_numai2",10], ["_skillLevel","red"], "_center", ["_minDist",20], ["_maxDist",35], ["_uniforms",blck_SkinList], ["_headGear",blck_headgear],["_configureWaypoints",true] ];
		[_pos,_pos,_noAI,_noAI,_difficulty,_patrolRadius,_patrolRadius,true,_uniforms,_headGear] call blck_fnc_spawnGroup;
	}forEach _patrols;
};

