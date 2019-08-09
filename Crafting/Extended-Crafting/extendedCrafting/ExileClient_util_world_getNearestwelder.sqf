/**
 * ExileClient_util_world_getNearestWelder
 * dekela
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_position", "_welder", "_object"];
_position = _this;
_welder = objNull;
_object = _position nearestObject "Land_WeldingTrolley_01_F";
if !(isNull _object) then 
{
	if ((_object distance _position) < 5) then 
	{
		_welder = _object;
	};
};
_welder