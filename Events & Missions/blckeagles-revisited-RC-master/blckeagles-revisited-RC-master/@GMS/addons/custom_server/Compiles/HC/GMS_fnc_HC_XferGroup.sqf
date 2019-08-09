/*
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_group","_unit","_tempEH"];
_group = _this select 0;
{
	_unit = _x;
	_tempEH = _unit addEventHandler ["Reloaded", {_this call blck_EH_unitWeaponReloaded;}];
}forEach (units _group);
//diag_log format["blckHC:: group %1 transferred to HC %1",_group,clientOwner];