/*

    Handle case where a unit reloads weapon.
    This was used in place of fired event handlers to add realism and deal with issues with the arma engine post v1.64
    By Ghostrider [GRG]

	https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/Reloaded
	
	The EH returns array in _this variable of the following format [entity, weapon, muzzle, newMagazine, (oldMagazine)], where:

    entity: Object - unit or vehicle to which EH is assigned
    weapon: String - weapon that got reloaded
    muzzle: String - weapons muzzle that got reloaded
    newMagazine: Array - new magazine info in format [magazineClass, ammoCount, magazineID, magazineCreator], where:
        magazineClass: String - class name of the magazine
        ammoCount: Number - amount of ammo in magazine
        magazineID: Number - global magazine id
        magazineCreator: Number - owner of the magazine creator	
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

//private ["_unit","_mag"];
//_unit = _this select 0;
//_mag = _this select 3 select 0;
(_this select 0) addMagazine (_this select 3 select 0);
#ifdef blck_debugMode
if (blck_debugLevel > 2) then {
	//diag_log format["_EH_unitWeaponReloaded:: unit %1 reloaded weapon %2 with magazine %3",_this select 0, (_this select 3 select 0)];
	//diag_log format["_EH_unitWeaponReloaded:: unit %1 currently has the following magazines 2",_this select 0,magazines (_this select 0)];
	diag_log format["_EH_unitWeaponReloaded:: one magazine of type %1 added to inventory of unit %2",_mag,_unit];
};
#endif

