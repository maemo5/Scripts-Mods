/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
params["_obj","_difficulty"];


#ifdef blck_debugMode
{
	diag_log format["_fnc_addMoneyToOject: _this select %1 = %2",_foreachindex, _this select _foreachindex];
}forEach _this;
#endif
if (blck_modType isEqualTo "Exile") then
{
	switch (_difficulty) do
	{
		case "blue":{_obj setVariable["ExileMoney", floor(random([blck_crateMoneyBlue] call blck_fnc_getNumberFromRange)),true];};
		case "red":{_obj setVariable["ExileMoney", floor(random([blck_crateMoneyRed] call blck_fnc_getNumberFromRange)),true];};
		case "green":{_obj setVariable["ExileMoney", floor(random([blck_crateMoneyGreen] call blck_fnc_getNumberFromRange)),true];};
		case "orange":{_obj setVariable["ExileMoney", floor(random([blck_crateMoneyGreen] call blck_fnc_getNumberFromRange)),true];};
		#ifdef blck_debugMode
		diag_log format["_fnc_addMoneyToOject: ExileMoney set to %1", _obj getVariable "ExileMoney"];
		#endif
	};
};

if (blck_modType isEqualTo "Epoch") then
{
	switch (_difficulty) do
	{
		case "blue":{_obj setVariable["Crypto", floor(random([blck_crateMoneyBlue] call blck_fnc_getNumberFromRange)),true];};
		case "red":{_obj setVariable["Crypto", floor(random([blck_crateMoneyRed] call blck_fnc_getNumberFromRange)),true];};
		case "green":{_obj setVariable["Crypto", floor(random([blck_crateMoneyGreen] call blck_fnc_getNumberFromRange)),true];};
		case "orange":{_obj setVariable["Crypto", floor(random([blck_crateMoneyGreen] call blck_fnc_getNumberFromRange)),true];};
	};
};