Add the folder FlagHacking in Directory Custom so it will be like  Mapname.pbo/Custom/FlagHacking

Config.ccP:
add this to config.ccp
class CfgExileDelayedActions
{
	class Abstract
	{
		duration=10;
		abortInCombatMode=1;
		durationFunction="";
		animation="";
		animationType="switchMove";
		failChance=0;
		conditionFunction="";
		completedFunction="";
		abortedFunction="";
		failedFunction="";
		repeatingCheckFunction="";
	};
	class HackFlag: Abstract
	{
		animationType="switchMove";
		animation="Acts_TerminalOpen";
		abortInCombatMode=0;
		failChanceFunction="ExileClient_action_hackFlag_failChance";
		durationFunction="ExileClient_action_hackFlag_duration";
		conditionFunction="ExileClient_action_hackFlag_condition";
		completedFunction="ExileClient_action_hackFlag_completed";
		failedFunction="ExileClient_action_hackFlag_failed";
		abortedFunction="ExileClient_action_hackFlag_aborted";
	};
};

class CfgFlagHacking
{
	enableHacking = 1;
	failChance = 25;
	hackDuration = 10;
	maxHackAttempts = 3;
	minPlayers = 30;
	maxHacks = 3;
	removeChance = 5;
	showMapIcon = 1;
	notifyServer = 1;
	notificationCooldown = 5;
};

Add to class class CfgNetworkMessages

class CfgNetworkMessages
{
    class hackFlagRequest
    {
        module="object_flag";
        parameters[]=
        {
            "STRING"
        };
    };
    class updateFlagHackAttemptRequest
    {
        module="object_flag";
        parameters[]=
        {
            "STRING"
        };
    };
    class startFlagHackRequest
    {
        module="object_flag";
        parameters[]=
        {
            "STRING"
        };
    };
};

Add this to class Flag

	class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";

		class Actions
		{
			class HackFlag: ExileAbstractAction
            {
                title = "Hack Flag";
                condition = "(getNumber(missionConfigFile >> 'CfgFlagHacking' >> 'enableHacking') isEqualTo 1) && ('Exile_Item_Laptop' in (magazines player)) && !ExilePlayerInSafezone";
                action = "['HackFlag', _this select 0] call ExileClient_action_execute";
            };
		};
	};


Add this to cfgcustomcode
	
		ExileClient_action_execute = "Custom\Flaghacking\Customcode\ExileClient_action_execute.sqf"; 
		
init.sqf: Thanks to Kuplion

Drop this at the end of your init.sqf if you don't have 1 make 1
{
    _code = "";
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
}
forEach
[
    // Server
    ["ExileServer_object_flag_network_hackFlagRequest","Custom\FlagHacking\ServerFiles\ExileServer_object_flag_network_hackFlagRequest.sqf"],
    ["ExileServer_object_flag_network_startFlagHackRequest","Custom\FlagHacking\ServerFiles\ExileServer_object_flag_network_startFlagHackRequest.sqf"],
    ["ExileServer_object_flag_network_updateFlagHackAttemptRequest","Custom\FlagHacking\ServerFiles\ExileServer_object_flag_network_updateFlagHackAttemptRequest.sqf"],
   
    // Client
    ["ExileClient_action_hackFlag_aborted","Custom\FlagHacking\ClientFiles\ExileClient_action_hackFlag_aborted.sqf"],
    ["ExileClient_action_hackFlag_completed","Custom\FlagHacking\ClientFiles\ExileClient_action_hackFlag_completed.sqf"],
    ["ExileClient_action_hackFlag_condition","Custom\FlagHacking\ClientFiles\ExileClient_action_hackFlag_condition.sqf"],
    ["ExileClient_action_hackFlag_duration","Custom\FlagHacking\ClientFiles\ExileClient_action_hackFlag_duration.sqf"],
    ["ExileClient_action_hackFlag_failChance","Custom\FlagHacking\ClientFiles\ExileClient_action_hackFlag_failChance.sqf"],
    ["ExileClient_action_hackFlag_failed","Custom\FlagHacking\ClientFiles\ExileClient_action_hackFlag_failed.sqf"]
];


Exile.init

EXILE.init (database) edit 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flag Hack Virtual Garage 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[confirmVehicleOwnership]
SQL1_1 = SELECT id FROM vehicle WHERE nickname = ? AND territory_id = ?
SQL1_INPUTS = 1, 2
OUTPUT = 1