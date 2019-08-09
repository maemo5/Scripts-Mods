# Exile Build Restrictions
These edits allow you to restrict the number of a specific item per territory and if this item need a specific minimum level to be built.


There are two files you gonna need to override:
* ExileClient_util_world_canBuildHere.sqf
* ExileServer_object_construction_network_buildConstructionRequest.sqf

To override these files, you just need to copy my already edited files to a folder like "Custom\Overrides" inside of your missionfolder and then, add the following likes to the section named "CfgExileCustomCode" in your config file. Example below:

```
class CfgExileCustomCode 
{   
    // Build Restriction
    ExileServer_object_construction_network_buildConstructionRequest    = "Custom\Overrides\ExileServer_object_construction_network_buildConstructionRequest.sqf"
    ExileClient_util_world_canBuildHere                                 = "Custom\Overrides\ExileClient_util_world_canBuildHere.sqf"
};
```

After that, just add the following under your **CfgTerritories** configuration:
```
    /**
     * Territory build restrictions - by alexslx
     *
     * Usage:
     * {"classname", limit},
     * {"classname", limit} // <- Remember the last doesn't have comma
     */
    buildRestrictions[] =
    {
        // Classname                       Base Level,  Max Objects
        {"Land_Cargo_House_V2_F",                   1,              1},
        {"Land_Cargo40_light_green_F",              1,              1}
    };
```

Done.
