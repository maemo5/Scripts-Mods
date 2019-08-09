/*
	by Ghostrider [GRG]
	Last Modified 3/14/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";

///////////////////////////////////////////////
//  prevent the system from being started twice
//////////////////////////////////////////////
if !(isNil "blck_missionSystemRunning") exitWith {};
blck_missionSystemRunning = true;

/////////////////////////////////////////////
//  Run the initialization routinge
////////////////////////////////////////////

if (isServer) then 
{
	execVM "\q\addons\custom_server\init\blck_init_server.sqf";
};

if(!(isServer) && !(hasInterface)) then
{
	execVM "\q\addons\custom_server\init\blck_init_HC.sqf";	
};

if ((!isServer) && (hasInterface)) then
{
	diag_log "[blckeagls] <ERROR CONDITION: this mission system must be run on either a dedicated server or headless client";
};
