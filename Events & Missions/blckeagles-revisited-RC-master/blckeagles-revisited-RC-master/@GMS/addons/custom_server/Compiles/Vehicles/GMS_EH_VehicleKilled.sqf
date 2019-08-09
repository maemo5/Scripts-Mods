
/*
	_EH_VehicleKilled
	Killed handler for destruction of vehicles
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
//#include "\q\addons\custom_server\Configs\blck_defines.hpp";
if !(isServer) exitWith {};
_this call blck_fnc_processAIVehicleKill;
