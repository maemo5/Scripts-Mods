/*
	_fnc_alertNearbyGroups
	by Ghostrider
	Allerts all units within the nearest group to the location of a killer.
	**  Not in use at this time; reserved for the future  **
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private["_nearbyGroups","_intelligence"];
params["_unit","_killer",["_searchRadius",300]];
private _nearbyGroups = allGroups select{(_unit distance (leader _x) < _searchRadius)};
{
	private _group = _x;
	{
		_x reveal[_killer,(_x knowsAbout _killer) + (_x getVariable ["intelligence",1])];
	}forEach (units _group);
}forEach _nearbyGroups;
