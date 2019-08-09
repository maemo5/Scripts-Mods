/*
  Delete alive AI.
  by Ghostrider
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

for "_i" from 1 to (count blck_liveMissionAI) do {
	if ((_i) <= count blck_liveMissionAI) then {
		_units = blck_liveMissionAI deleteat 0;
		_units params ["_unitsarr","_timer"];
		if (diag_tickTime > _timer) then {
			{
				if ((alive _x) && !(isNull objectParent _x)) then {
					[objectParent _x] call blck_fnc_deleteAIvehicle;
				};
				[_x] call blck_fnc_deleteAI;
			} forEach _unitsarr;
		}
		else {
			blck_liveMissionAI pushback _units;
		};
	};
};
