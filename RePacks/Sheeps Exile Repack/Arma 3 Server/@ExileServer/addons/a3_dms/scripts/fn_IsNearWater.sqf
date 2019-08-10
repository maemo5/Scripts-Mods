/*
	DMS_fnc_IsNearWater
	Original function by WAI
	Improved by eraser1

	Usage:
	[
		_position,
		_radius
	] call DMS_fnc_IsNearWater

*/

private["_result","_position","_radius"];

if !(params
[
	["_position",[],[[]],[2,3]],
	["_radius",0,[0]]
])
exitWith
{
	diag_log format["DMS ERROR :: Calling DMS_fnc_IsNearWater with invalid parameters: %1",_this];
	false
};
_position 	= _this select 0;
_radius		= _this select 1;


_result 	= false;

try
{
	if (surfaceIsWater _position) then
	{
		throw true;
	};

	for "_i" from 0 to 359 step 45 do
	{
		if (surfaceIsWater ([_position,_radius,_i] call DMS_fnc_SelectOffsetPos)) then
		{
			throw true;
		};
	};
}
catch
{
	_result = true;
};

_result