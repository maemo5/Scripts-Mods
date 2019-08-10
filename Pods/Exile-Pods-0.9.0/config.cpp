
class CfgExileCustomCode 
{
	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon\myfunction.sqf";
	*/

	ExileClient_action_repairVehicle_condition = "Custom\LMRepair\ExileClient_action_repairVehicle_condition.sqf"; //Vandest Ductape
};


class CfgInteractionMenus
{
	
	class StaticWeapon
	{
		target = "StaticWeapon";
		targetType = 2;

		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((locked ExileClientInteractionObject) != 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Check state of object
			class Checkstate: ExileAbstractAction
			{
				title = "Check state";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this execVM 'addons\Check_state_of_object.sqf';";
			};			
			
			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Flips a vehicle so the player doesnt have to call an admin
			// Check if vector up is fucked
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};
		};
	};
};

class CfgVehicleCustoms
{
	///////////////////////////////////////////////////////////////////////////////
    // Taru Pods
    ///////////////////////////////////////////////////////////////////////////////
	class Pod_Heli_Transport_04_base_F
	{
		skins[] = 
		{			
			{"Land_Pod_Heli_Transport_04_covered_F",			2000, "CSAT",			{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"};},
			{"Land_Pod_Heli_Transport_04_covered_black_F",		2000, "Black",			{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_black_CO.paa"};},
			{"Land_Pod_Heli_Transport_04_fuel_F",				2000, "CSAT Fuel",		{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_CO.paa"};},
			{"Land_Pod_Heli_Transport_04_fuel_black_F",			2000, "Black Fuel",		{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_black_CO.paa"};},
			{"Land_Pod_Heli_Transport_04_bench_F",				2000, "CSAT Bench",		{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_bench_CO.paa"};},
			{"Land_Pod_Heli_Transport_04_bench_black_F",		2000, "Black Bench",	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_bench_black_CO.paa"};}
		};
	};
};
