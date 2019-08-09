class CfgPatches
{
    class a2_searchlight
    {
        requiredaddons[] = {"A3_Static_F_Gamma"};
        requiredversion = 0.1;
        weapons[] = {};
        units[] = {"B_SearchLight","O_SearchLight","I_SearchLight","B_SearchLight_Cool","O_SearchLight_Cool","I_SearchLight_Cool"};
    };
};

class CfgMovesBasic
{
    class ManActions
    {
        searchlight_Gunner = "searchlight_Gunner";
    };
};

class CfgMovesMaleSdr: CfgMovesBasic
{
    class States
    {
        class Crew;
        class searchlight_Gunner: Crew
        {
            file = "a2_searchlight\searchlight_Gunner.rtm";
            connectTo[] = {"Static_Dead",1};
        };
    };
};

class CfgVehicles
{
    class LandVehicle;
    class StaticWeapon: LandVehicle
    {
        class Turrets
        {
            class MainTurret;
        };
        class UserActions;
    };
    class StaticSEARCHLight: StaticWeapon
    {
        class Turrets: Turrets
        {
            class MainTurret: MainTurret {};
        };
        class UserActions: UserActions {};
    };
    class SearchLight_Base: StaticSEARCHLight
    {
        scope = 0;
        model = "a2_searchlight\searchlight_manual.p3d";
        picture = "\a2_searchlight\data\searchlight_manual_CA.paa";
        mapSize = 3;
        nameSound = "light";
        //BIS uses "Search Light" :^)
        displayName = "Searchlight";
        typicalCargo[] = {};

        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                weapons[] = {"SEARCHLIGHT"};
                minElev = -25;
                maxElev = 85;
                initElev= 0;
                minTurn = -180;
                maxTurn = 180;
                initTurn = 0;
                gunnerAction = "searchlight_Gunner";
                //Reversed by default so when player exits he is looking forward
                //memoryPointsGetInGunner = "pos_gunner_dir";
                //memoryPointsGetInGunnerDir = "pos_gunner";
                ejectDeadGunner = true;
            };
        };
        
        class Reflectors
        {
            class main_reflector
            {
                color[] = {9500,9000,8500};
                ambient[] = {85,85,85};
                position = "light";
                direction = "lightEnd";
                hitpoint = "light";
                selection = "light";
                size = 1;
                intensity = 50;
                innerAngle = 15;
                outerAngle = 65;
                coneFadeCoef = 10;
                useFlare = true;
                dayLight = false;
                flareSize = 10;
                flareMaxDistance = 250;
                class Attenuation
                {
                    start = 0;
                    constant = 0;
                    linear = 1;
                    quadratic = 1;
                    hardLimitStart = 100;
                    hardLimitEnd = 200;
                };
            };
            class sub_reflector: main_reflector
            {
                flareSize = 5;
            };
        };
        aggregateReflectors[] = {{"main_reflector","sub_reflector"}};

        class Damage
        {
            tex[] = {};
            mat[] = 
            {
                "a2_searchlight\data\searchlight_manual.rvmat","a2_searchlight\data\searchlight_manual_damage.rvmat","a2_searchlight\data\searchlight_manual_damage.rvmat",
                "a2_searchlight\data\m2_stojan.rvmat","a2_searchlight\data\m2_stojan_damage.rvmat","a2_searchlight\data\m2_stojan_damage.rvmat",
                "a2_searchlight\data\searchlight_manual_glass.rvmat","a2_searchlight\data\searchlight_manual_glass_destruct.rvmat","a2_searchlight\data\searchlight_manual_glass_destruct.rvmat",
            };
        };

        class UserActions: UserActions
        {
            class lightOn
            {
                displayName = "Lights On";
                shortcut = "Headlights";
                condition = "player in this && {!(this getVariable ['a2LightOn', false])}";
                statement = "player action ['lightOn', this]; this setVariable ['a2LightOn', true]";
                position = "pos_gunner";
                radius = 2;
                onlyforplayer = 1;
                showWindow = 0;
                hideOnUse = 1;
            };
            class lightOff
            {
                displayName = "Lights Off";
                shortcut = "Headlights";
                condition = "player in this && {(this getVariable ['a2LightOn', false])}";
                statement = "player action ['lightOff', this]; this setVariable ['a2LightOn', false]";
                position = "pos_gunner";
                radius = 2;
                onlyforplayer = 1;
                showWindow = 0;
                hideOnUse = 1;
            };
        };

        class assembleInfo
        {
            primary = 0;
            base = "";
            assembleTo = "";
            dissasembleTo[] = {"B_Bag_Searchlight"};
            displayName = "";
        };
    };

    class SearchLight_Cool_Base: SearchLight_Base
    {
        model = "a2_searchlight\searchlight_manual_cool.p3d";
        displayName = "Searchlight (Cool)";
        class Reflectors: Reflectors
        {
            class main_reflector: main_reflector
            {
                color[] = {7000,7500,10000};
                ambient[] = {70,75,100};
            };
            class sub_reflector: main_reflector
            {
                flareSize = 5;
            };
        };

        class assembleInfo: assembleInfo
        {
            dissasembleTo[] = {"B_Bag_Searchlight_Cool"};
        };
    };

    class B_SearchLight: SearchLight_base
    {
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_Soldier_lite_F";
    };
    class O_SearchLight: SearchLight_base
    {
        scope = 2;
        side = 0;
        faction = "OPF_F";
        crew = "O_Soldier_lite_F";
        class assembleInfo: assembleInfo
        {
            dissasembleTo[] = {"O_Bag_Searchlight"};
        };
    };
    class I_SearchLight: SearchLight_base
    {
        scope = 2;
        side = 2;
        faction = "IND_F";
        crew = "I_Soldier_lite_F";
        class assembleInfo: assembleInfo
        {
            dissasembleTo[] = {"I_Bag_Searchlight"};
        };
    };

    class B_SearchLight_Cool: SearchLight_Cool_Base
    {
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_Soldier_lite_F";
    };
    class O_SearchLight_Cool: SearchLight_Cool_Base
    {
        scope = 2;
        side = 0;
        faction = "OPF_F";
        crew = "O_Soldier_lite_F";
        class assembleInfo: assembleInfo
        {
            dissasembleTo[] = {"O_Bag_Searchlight_Cool"};
        };
    };
    class I_SearchLight_Cool: SearchLight_Cool_Base
    {
        scope = 2;
        side = 2;
        faction = "IND_F";
        crew = "I_Soldier_lite_F";
        class assembleInfo: assembleInfo
        {
            dissasembleTo[] = {"I_Bag_Searchlight_Cool"};
        };
    };

    class Bag_Base;
    class Weapon_Bag_Base: Bag_Base
    {
        class assembleInfo;
    };
    class B_HMG_01_weapon_F: Weapon_Bag_Base {};
    class B_Bag_Searchlight: B_HMG_01_weapon_F
    {
        _generalMacro = "B_Bag_Searchlight";
        displayName = "Searchlight Bag";
        class assembleInfo: assembleInfo
        {
            displayName = "Searchlight";
            assembleTo = "B_SearchLight";
            base = "";
        };
    };
    class B_Bag_Searchlight_Cool: B_Bag_Searchlight
    {
        _generalMacro = "B_Bag_Searchlight_Cool";
        displayName = "Searchlight (Cool) Bag";
        class assembleInfo: assembleInfo
        {
            displayName = "Searchlight (Cool)";
            assembleTo = "B_SearchLight_Cool";
        };
    };
    class O_HMG_01_weapon_F: Weapon_Bag_Base {};
    class O_Bag_Searchlight: O_HMG_01_weapon_F
    {
        _generalMacro = "O_Bag_Searchlight";
        displayName = "Searchlight Bag";
        class assembleInfo: assembleInfo
        {
            displayName = "Searchlight";
            assembleTo = "O_SearchLight";
            base = "";
        };
    };
    class O_Bag_Searchlight_Cool: O_Bag_Searchlight
    {
        _generalMacro = "O_Bag_Searchlight_Cool";
        displayName = "Searchlight (Cool) Bag";
        class assembleInfo: assembleInfo
        {
            displayName = "Searchlight (Cool)";
            assembleTo = "O_SearchLight_Cool";
        };
    };
    class I_HMG_01_weapon_F: Weapon_Bag_Base {};
    class I_Bag_Searchlight: I_HMG_01_weapon_F
    {
        _generalMacro = "I_Bag_Searchlight";
        displayName = "Searchlight Bag";
        class assembleInfo: assembleInfo
        {
            displayName = "Searchlight";
            assembleTo = "I_SearchLight";
            base = "";
        };
    };
    class I_Bag_Searchlight_Cool: I_Bag_Searchlight
    {
        _generalMacro = "I_Bag_Searchlight_Cool";
        displayName = "Searchlight (Cool) Bag";
        class assembleInfo: assembleInfo
        {
            displayName = "Searchlight (Cool)";
            assembleTo = "I_SearchLight_Cool";
        };
    };
};