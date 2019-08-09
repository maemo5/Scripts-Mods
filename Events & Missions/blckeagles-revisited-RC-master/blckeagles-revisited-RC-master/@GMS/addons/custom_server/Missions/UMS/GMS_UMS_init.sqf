/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
diag_log "[blckeagls] Initializing UMS";

#include "\q\addons\custom_server\Configs\blck_defines.hpp";
blck_dynamicUMS_MissionsRuning = 0;
blck_priorDynamicUMS_Missions = [];
blck_UMS_ActiveDynamicMissions = [];


#include "GMS_UMS_configurations.sqf";
#include "code\GMS_UMS_functions.sqf";
#include "GMS_UMS_dynamicMissionList.sqf";
[] execVM "q\addons\custom_server\Missions\UMS\GMS_UMS_StaticMissions_init.sqf";

diag_log "[blckeagls]  UMS <Initialized>";
 

