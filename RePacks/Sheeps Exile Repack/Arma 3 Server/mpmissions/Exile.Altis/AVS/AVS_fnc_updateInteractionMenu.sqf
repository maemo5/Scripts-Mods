/*
© 2015 Zenix Gaming Ops
Developed by Rod-Serling
Co-Developed by Vishpala

All rights reserved.

Function:
	AVS_fnc_updateInteractionMenu - Updates the interaction menu to allow the player to rearm a vehicle.

Usage (from the server):
	[] spawn AVS_fnc_updateInteractionMenu

Return Value:
	None
*/
if (hasInterface) then
{
	AVS_rearmAction = 0;
	AVS_rearmActionAdded = false;
	AVS_previousRearmCost = 0;

	AVS_refuelAction = 0;
	AVS_refuelActionAdded = false;
	AVS_previousRefuelCost = 0;

	while {true} do
	{
		try
		{
			_vehicle = vehicle player;

			if (!alive player || {_vehicle isEqualTo player}) then
			{
				throw 0;
			};

			if (!local _vehicle) then
			{
				throw 0;
			};

			_pos = getPosATL _vehicle;

			if (_pos select 2 > 0.1) then
			{
				throw 0;
			};

			_vel = velocity _vehicle;

			if (_vel select 0 > 0.1 || _vel select 1 > 0.1 || _vel select 2 > 0.1) then
			{
				throw 0;
			};


			if (AVS_RearmSystemActive) then
			{
				_rearmPoints = (nearestObjects [_vehicle, AVS_RearmObjects, AVS_RearmDistance]);

				if (count _rearmPoints > 0) then
				{
					_rearmCost = _vehicle call AVS_fnc_getRearmCost;

					if (AVS_rearmActionAdded && {!(AVS_previousRearmCost isEqualTo _rearmCost)}) then
					{
						player removeAction AVS_rearmAction;
					};

					if (_rearmCost > 0) then
					{
						_rearmTitle = format ["Rearm: %1 poptabs", _rearmCost];
						AVS_rearmAction = player addAction [_rearmTitle, AVS_fnc_requestRearm, [_vehicle]];
						AVS_previousRearmCost = _rearmCost;
						AVS_rearmActionAdded = true;
					}
					else
					{
						if (AVS_rearmActionAdded) then
						{
							player removeAction AVS_rearmAction;
							AVS_rearmActionAdded = false;
						};
					};
				};
			};

			if (AVS_RefuelSystemActive) then
			{
				_refuelPoints = (nearestObjects [_vehicle, AVS_RefuelObjects, AVS_RefuelDistance]);

				if (count _refuelPoints > 0) then
				{
					_refuelCost = _vehicle call AVS_fnc_getRefuelCost;

					if (AVS_refuelActionAdded && {!(AVS_previousRefuelCost isEqualTo _refuelCost)}) then
					{
						player removeAction AVS_refuelAction;
					};

					if (_refuelCost > 0) then
					{
						_refuelTitle = format ["Refuel: %1 poptabs", _refuelCost];
						AVS_refuelAction = player addAction [_rearmTitle, AVS_fnc_requestRefuel, [_vehicle]];
						AVS_previousRefuelCost = _refuelCost;
						AVS_refuelActionAdded = true;
					};
				};
			};
		}
		catch
		{
			if (_exception isEqualTo 0) then
			{
				if (AVS_rearmActionAdded) then
				{
					player removeAction AVS_rearmAction;
					AVS_rearmActionAdded = false;
				};
				if (AVS_refuelActionAdded) then
				{
					player removeAction AVS_refuelAction;
					AVS_refuelActionAdded = false;
				};
			};
		};
		sleep 2;
	};
};
