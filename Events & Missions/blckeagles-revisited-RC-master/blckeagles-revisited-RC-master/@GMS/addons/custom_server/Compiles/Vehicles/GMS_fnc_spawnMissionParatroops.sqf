/*
	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	
	This is basically a container that determines whether a paragroop group should be created and if so creates a group and passes it off to the routine that spawns the paratroops.
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_coords","_skillAI","_weapons","_uniforms","_headGear",["_grpParatroops",grpNull],["_heli",objNull]];

private["_grpParatroops","_chanceParatroops","_aborted","_return"];

_skillAI = toLower _skillAI;
_chanceParatroops = 0;
_noPara = 0;
_aborted = false;

if (_skillAI isEqualTo "blue") then {

	#ifdef blck_debugMode
	if (blck_debugON) then {diag_log "_fnc_spawnMissionParatroops: BLUE difficulty settings applied";};
	#endif

	_chanceParatroops = blck_chanceParaBlue;
	_noPara = blck_noParaBlue;
};
if (_skillAI isEqualTo "green") then {
	
	#ifdef blck_debugMode
	if (blck_debugON) then {diag_log "_fnc_spawnMissionParatroops: GREEN difficulty settings applied";};
	#endif

	_chanceParatroops = blck_chanceParaGreen;
	_noPara = blck_noParaGreen;
};
if (_skillAI isEqualTo "orange") then {

	#ifdef blck_debugMode
	if (blck_debugON) then {diag_log "_fnc_spawnMissionParatroops: ORANGE difficulty settings applied";};
	#endif

	_chanceParatroops = blck_chanceParaOrange;
	_noPara = blck_noParaOrange;
};
if (_skillAI isEqualTo "red") then {

	#ifdef blck_debugMode
	if (blck_debugON) then {diag_log "_fnc_spawnMissionParatroops: RED difficulty settings applied";};
	#endif

	_chanceParatroops = blck_chanceParaRed;
	_noPara = blck_noParaRed;
};

#ifdef blck_debugMode
if (blck_debugLevel > 2) then {diag_log format["_fnc_spawnMissionParatroops (47): _chanceParatroops %1",_chanceParatroops];};
if (blck_debugLevel > 2) then {diag_log format["_fnc_spawnMissionParatroops (48): _coords %1 | _numAI %2 | _skillAI %3 | _grpParatroops %4 | _heli %5",_coords,_noPara,_skillAI,_grpParatroops,_heli];};
#endif

if ( (random(1) < _chanceParatroops)) then
{
	if (isNull _grpParatroops) then
	{
		_grpParatroops = createGroup blck_AI_Side; 

		#ifdef blck_debugMode
		if (blck_debugLevel > 2) then 
		{
			diag_log format["_fnc_spawnMissionParatroops (53):No group passed as a parameter, _grpParatroops %4 created",_grpParatroops];
		};
		#endif
	};

	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then 
	{
			diag_log format["_fnc_spawnMissionParatroops (58):  function running and group %1 successfully created; now calling blck_fnc_spawnParaUnits",_grpParatroops];
	};
	#endif

	//params["_missionPos","_paraGroup",["_numAI",3],"_skillAI","_weapons","_uniforms","_headGear",["_heli",objNull]];
	_aborted = [_coords,_grpParatroops,_noPara,_skillAI,_weapons,_uniforms,_headGear,_heli] call blck_fnc_spawnParaUnits;
	//diag_log format["_fnc_spawnMissionParatroops:  blck_fnc_spawnParaUnits returned a value of %1",_aborted];
};
#ifdef blck_debugMode
diag_log format["_fnc_spawnMissionParatroops:  _aborted = %1",_aborted];
#endif
if (_aborted) then
{
	_return = [[],true];
} else {
	_return = [(units _grpParatroops),false];
};

#ifdef blck_debugMode
diag_log format["_fnc_spawnMissionParatroops:->  _return = %1 | _abort = %2",_return,_aborted];
#endif

_return

