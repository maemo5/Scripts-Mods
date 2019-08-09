/**
 * ExileClient_util_world_getNearestGenerator
 * dekela
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
 private["_position", "_gen", "_object1", "_object2"];
_position = _this;
_gen = objNull;
_object1 = _position nearestObject "Land_PortableGenerator_01_F";
_object2 = _position nearestObject "Land_DieselGroundPowerUnit_01_F";
if (!(isNull _object1) || !(isNull _object2))then 
{
	if ((_object1 distance _position) < 5) then 
	{
		_gen = _object1;
	};
	if ((_object2 distance _position) < 50) then 
	{
		_gen = _object2;
	};
};
_gen
 