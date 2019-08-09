// Protect Vehicles from being cleaned up by the server

/*
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

params["_Vehicle"];

switch (blck_modType) do {
	case "Epoch":
		{
			#ifdef blck_debugMode
			if (blck_debugLevel > 2) then {diag_log format["GMS_fnc_protectVehicle::  Tokens set for vehicle %1",_Vehicle];};
			#endif
			//_Vehicle call EPOCH_server_vehicleInit;
			_Vehicle call EPOCH_server_setVToken;
		};
};


