/*
	by Ghostrider [GRG]
	for ghostridergaming
	12/5/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
//diag_log "[blckeagls] GMS_StaticMissions_init.sqf <Initializing Static Mission System>";

//static mission descriptor for code: [position,level, numAI or [min,maxAI],patrolRadius, respawn, group[groupNull],spawnedAt[0],respawn[0]]
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#include "\q\addons\custom_server\Missions\Static\Code\GMS_fnc_sm_init_functions.sqf";
#include "\q\addons\custom_server\Missions\Static\GMS_StaticMissions_Lists.sqf";

blck_sm_monitoring = 0;
blck_sm_groupDespawnTime = 10; // 120;
blck_sm_patrolRespawnInterval = 10;  // 600
{
	if ((toLower worldName) isEqualTo toLower(_x select 1)) then
	{
		if ((toLower blck_modType) isEqualTo (toLower(_x select 0))) then
		{
			call compilefinal preprocessFileLineNumbers format["\q\addons\custom_server\Missions\Static\missions\%1",(_x select 2)];
		};
	};
}forEach _staticMissions;
diag_log "[blckeagls] GMS_StaticMissions Initialized.sqf <Loaded>";

