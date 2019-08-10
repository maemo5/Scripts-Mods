# SalvageWheels

Install:
Put the Onefox_fnc_salvageWheels.sqf in your mission.

Add the following in the config.cpp from your mission:
Add it within the CfgInteractionMenus -> Car -> Actions class.

````
class SalvageWheels: ExileAbstractAction
{
    title = "Salvage Wheels";
    condition = "call ExileClient_object_vehicle_interaction_show";
    action = "_this call Onefox_fnc_salvageWheels";
};
````

Add this to your initPlayerLocal.sqf.
````
Onefox_fnc_salvageWheels = compileFinal preprocessFileLineNumbers "Onefox_fnc_salvageWheels.sqf";
````
