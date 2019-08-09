/*
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
if (hasInterface || isServer) exitWith{};

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

if !(isNil "blck_Initialized") exitWith{};
private _blck_loadingStartTime = diag_tickTime;
#include "\q\addons\custom_server\init\build.sqf";
//call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\blck_variables.sqf";
call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Compiles\blck_functions.sqf";
//call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Configs\blck_configs.sqf";
//call compileFinal preprocessFileLineNumbers "\q\addons\custom_server\Configs\blck_custom_config.sqf";
diag_log format["[blckeagls] Loading Headless Client Version %2 |  Build Date %1 | loaded in %4 seconds",_blck_versionDate,blck_versionNumber,blck_buildNumber,diag_tickTime - _blck_loadingStartTime];


