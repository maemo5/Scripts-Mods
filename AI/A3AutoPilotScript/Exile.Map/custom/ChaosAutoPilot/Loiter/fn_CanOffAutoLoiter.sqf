#include "..\AutoPilotConfig.h"

_veh = vehicle _this;
//check if its a plane first
if (!(_veh isKindOf "Plane")) exitWith {false};

_AutoPilotOn = _veh getVariable ["ChaosPilot_AutoPilotOn",false];
if (!_AutoPilotOn) exitWith {false};

_PreviousOwner = _veh getVariable "ChaosPilot_PreviousOwner";
if (!(_PreviousOwner isEqualTo player) && !(ALLOW_TAKE_OVER)) exitWith {false}; 

_unit = _veh getVariable "ChaosPilot_PilotUnit";
if (!(driver _veh isEqualTo _unit)) exitWith {false}; 

true
