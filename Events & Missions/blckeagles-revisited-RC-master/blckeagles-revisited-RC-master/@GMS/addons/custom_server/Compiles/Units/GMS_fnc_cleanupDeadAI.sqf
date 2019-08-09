/*
  Delete Dead AI and nearby weapons after an appropriate period.
  by Ghostrider-GRG-
  
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

#ifdef blck_debugMode
if (blck_debugLevel > 2) then {diag_log format["fnc_cleanupDeadAI called at time %1",diag_tickTime];};
#endif

private["_aiList","_ai"];
_aiList = +blck_deadAI;
{
	if (diag_tickTime > _x getVariable ["blck_cleanupAt",0]) then 
	{
		_ai = _x;
		_nearplayer = (_ai nearEntities 1500) select {isplayer _x};
		if (_nearplayer isequalto []) then {
			{
				deleteVehicle _x;
			}forEach nearestObjects [getPos _ai,["WeaponHolderSimulated","GroundWeapoonHolder"],3];	
			blck_deadAI = blck_deadAI - [_ai];
			deleteVehicle _ai;
		};
	};
} forEach _aiList;

