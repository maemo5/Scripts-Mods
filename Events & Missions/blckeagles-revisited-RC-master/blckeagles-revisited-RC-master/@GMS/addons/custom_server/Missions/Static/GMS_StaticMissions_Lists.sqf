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

private ["_staticMissions"];

_staticMissions = [
	// [mod (Epoch, Exile), map (Altis, Tanoa etc), mission center, eg [10445,2014,0], filename.sqf (name of static mission template for that mission)];
	//["Epoch","Altis","template.sqf"],
	//["Epoch","Altis","staticMissionExample2_Epoch.sqf"],
	//["Epoch","Altis","destroyer.sqf"],
	//["Exile","Altis","template.sqf"],	
	//["Exile","Altis","staticMissionExample2_Exile.sqf"]
];

diag_log "[blckeagls] GMS_StaticMissions_Lists.sqf <Loaded>";
