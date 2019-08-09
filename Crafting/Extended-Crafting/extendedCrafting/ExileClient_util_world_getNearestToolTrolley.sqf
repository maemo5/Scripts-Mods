/**
 * ExileClient_util_world_getNearestToolTrolley
 * dekela
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_position", "_toolTrolley", "_object1","_object2"];
_position = _this;
_toolTrolley = objNull;
_object1 = _position nearestObject "Land_ToolTrolley_02_F";
_object2 = _position nearestObject "Land_ToolTrolley_01_F";
if (!(isNull _object1) || !(isNull _object2))then 
{
	if ((_object1 distance _position) < 5) then 
	{
		_toolTrolley = _object1;
	};
	if ((_object2 distance _position) < 5) then 
	{
		_toolTrolley = _object2;
	};
};
_toolTrolley