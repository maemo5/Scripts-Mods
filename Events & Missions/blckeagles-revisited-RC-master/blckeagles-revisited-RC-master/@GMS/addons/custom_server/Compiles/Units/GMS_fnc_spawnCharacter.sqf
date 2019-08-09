/*
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_coords","_charConfigs"];
private["_char","_charGroup"];
_charConfigs params["_classname","_posn","_dir","_simDamg","_animations","_headgear","_uniforms"];

#ifdef blck_debugMode
{
	diag_log format["_fnc_spawnchar: _forEachIndex = %1 | _x = %2",_forEachIndex,_x];
}forEach _charConfigs;
diag_log format["_fnc_spawnchar: _this = %1",_this];
diag_log format["_fnc_spawnchar _classname = %1 | _posn = %2 | _dir = %3 | _animations = %4",_classname,_posn,_dir,_animations];
#endif

_charGroup = createGroup [blck_AI_Side, true];
_char = _charGroup createUnit [_classname,[0,0,0], [], 0, "NONE"]; 
_char setCaptive true;
if (count _headgear > 0) then
{
	_char addHeadgear (selectRandom(_headgear));
};
if (count _uniforms > 0) then
{
	_char forceAddUniform selectRandom(_uniforms);
};
_posn = (_coords vectorAdd _posn);
_char setPos [_posn select 0, _posn select 1, 0];

#ifdef blck_debugMode
diag_log format["_fnc_spawnchar  _char = %1 at Position = %2 | _coords = %3",_char, getPos _char,_coords];
#endif

if (blck_modType isEqualTo "Epoch") then {_char setVariable ["LAST_CHECK",28800,true]};
_char setPos (_posn);
_char setDir (_dir);
removeAllWeapons  _char;
_char setVariable ["BIS_enableRandomization", false];
_char setVariable ["BIS_fnc_animalBehaviour_disable", true];
_char disableAI "ALL";
_char enableAI "ANIM";
_char enableAI "MOVE";
_char allowDamage true; 
_char enableSimulationGlobal true;
_char setVariable["GMSAnimations",_animations,true];
_char setUnitPos "UP";
//diag_log format["_fnc_spawncharacter: _char = %1",_char];
_char