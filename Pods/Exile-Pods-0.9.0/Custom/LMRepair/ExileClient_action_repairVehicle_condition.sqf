/**
 * ExileClient_action_repairVehicle_condition
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_result","_availableHitpoints","_canBeReparied"];
_vehicle = _this;
_result = "";
try 
{
	if (ExileClientPlayerIsInCombat) then
	{
		throw "You are in combat!";
	};
	if ((vehicle player) isEqualTo _vehicle) then 
	{
		throw "Are you serious?";
	};
	if (isEngineOn _vehicle) then 
	{
		throw "Turn off the engine first!";
	};
	if ((locked _vehicle) isEqualTo 2) then 
	{
		throw "Unlock the vehicle first!";
	};

	if (!((_vehicle isKindof "Pod_Heli_Transport_04_base_F") or (_vehicle isKindof "Slingload_base_F"))) then {		//For vehicles, not Pods

		_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
		_canBeReparied = false;
		{
			if ((_vehicle getHitPointDamage _x) > 0) exitWith
			{
				_canBeReparied = true;
			};
		}
		forEach _availableHitpoints; 
		if !(local _vehicle) then
		{
			throw "Please get in as driver/pilot first.";
		};

	} else {

		if ((damage _vehicle) > 0) then		//For Pods
			{
				_canBeReparied = true;
			};
	};

	if !(_canBeReparied) then 
	{
		throw "This vehicle looks fine.";
	};
	if !("Exile_Item_DuctTape" in (magazines player)) then
	{
		throw "You need duct tape to do that!";
	};
	if ((_vehicle distance player) > 5) then 
	{
		throw "You are too far away!";
	};
}
catch 
{
	_result = _exception;
};
_result
