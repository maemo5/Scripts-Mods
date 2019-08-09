/*
  Delete a unit.
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_ai","_group"];
params["_unit"];

//if (blck_debugLevel > 2) then {diag_log format["_fnc_deleteAI::-> deleting unit = %1",_unit];};

{
	_unit removeAllEventHandlers  _x;
}forEach ["reloaded"];
{
	_unit removeAllMPEventHandlers _x;
} forEach ["MPKilled","MPHit"];
_group = (group _unit);
[_unit] joinSilent grpNull;
deleteVehicle _unit;
if (count units _group isEqualTo 0) then
{
	deletegroup _group;
};

