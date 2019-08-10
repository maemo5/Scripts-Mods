////
// Static Objects
////

// Taken away for now
//#include "initServer.sqf"

if (!hasInterface || isServer) exitWith {};

_MAPNAME 				= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "MAPNAME");

if (_MAPNAME == "Altis") then{
	[] execVM "scripts\traders\altistraders.sqf";
};
if (_MAPNAME == "Esseker") then{
	[] execVM "scripts\traders\Essekertraders.sqf";
};
if (_MAPNAME == "Chernarus") then{
	[] execVM "scripts\traders\Chernarustraders.sqf";
};
if (_MAPNAME == "Sahrani") then{
	[] execVM "scripts\traders\Sahranitraders.sqf";
};
//al Rayak Map
if (_MAPNAME == "pja310") then{
	[] execVM "scripts\traders\pja310traders.sqf";
};
if (_MAPNAME == "Bornholm") then{
	[] execVM "scripts\traders\Bornholmtraders.sqf";
};
