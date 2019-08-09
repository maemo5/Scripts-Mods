#include "..\AutoPilotConfig.h"

_err = 0;
_veh = vehicle _this;
//check if its a plane first
if (!(_veh isKindOf "Plane")) then {_err = 1};

//ignore the minimum speed and minimum height if the ai is in control.
_AutoPilotOn = _veh getVariable ["ChaosPilot_AutoPilotOn",false];
if (!_AutoPilotOn) then
{
	//check if driver seat is empty, if it's not and the driver isn't the player then exit with false
	_driver = driver _veh;
	if(!(isNull _driver) && _driver != _this) then {_err = 2}
	else
	{
		if (speed _veh < MINIMUM_SPEED) then {_err = 3}	//check the speed
		else
		{
			if ((getPosASL _veh) select 2 < MINIMUM_HEIGHT_ASL) exitWith {_err = 4};	//check height, dont want players to do it in the ground/
		};
	};
}
else
{
	_PreviousOwner = _veh getVariable ["ChaosPilot_PreviousOwner",false];
	if (!(_PreviousOwner isEqualTo player)) then {_err = 5}; 
};


_err