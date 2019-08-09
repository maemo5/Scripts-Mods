/**
 * Scratchie - Lottery like minigame for Exile Mod
 * @author ole1986 - https://github.com/ole1986/a3-exile-scratchie
 */
 
class CfgPatches {
    class scratchie_server {
        requiredVersion = 0.1;
        requiredAddons[]=
        {
            "exile_client",
            "exile_server_config"
        };
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class ScratchieServer {
        class main {
            file="x\scratchie_server\bootstrap";
            class preInit { 
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
        };
    };
};

class CfgSettings
{
    /**
     * Scratchie Settings
     */
    class ScratchieSettings {
        /**
         * @var integer How often the number should be drawn (in seconds) - MIN: 60 = 1min MAX: 65435 = 18days XD
         */
        Interval = 60;
        
        /**
         * @var integer set the price per scratchie (default: 200)
         */
        Price = 200;
        
        /**
         * @var integer inform all players about the scratchie winner
         */
        AnnounceWinner = 1;
        
        /**
         * @var integer 1 = VERY RARE CHANCE, 50 = NEARLY 50:50 CHANCE 100 = PERFECTLY FOR TESTING (default: 2)
         */ 
        ChanceToWin = 2;
        
        /**
         * @var int ItemPrize lifetime - How long is the crate available for item prizes (default: 180 sec = 3 minutes)
         */
        CrateLifetime = 180;
               
        /**
         * Possible Types to win
         */
        PrizeType[] = { "VehiclePrize", "PoptabPrize", "WeaponPrize"};
        
        /* ### PRIZE LISTS ### */
        
        /**
         * @var array list of vehicle prizes
         */
        VehiclePrize[] = {
            "Exile_Chopper_Hummingbird_Green",
            "Exile_Chopper_Hummingbird_Civillian_Jeans",
            "Exile_Car_HEMMT",
            "Exile_Car_Ifrit",
            "Exile_Car_Offroad_Repair_Guerilla12", 
            "Exile_Car_Offroad_Armed_Guerilla08",
            "Exile_Chopper_Hellcat_FIA",
            "Exile_Chopper_Orca_CSAT",
            "Exile_Chopper_Huron_Black",
            "Exile_Plane_Cessna",
            "Exile_Car_Van_Black",
            "Exile_Car_Van_Box_Black",
            "Exile_Car_Van_Fuel_Black",
            "Exile_Car_Zamak",
            "Exile_Car_Tempest",
            "Exile_Car_Ikarus_Blue"
        };
        /**
         * @var array list of pop tab prizes
         */
        PoptabPrize[] = {
            1000,
            2500,
            5000,
            7500,   
            10000,
            15000,
            25000,
            50000,
            75000,   
            100000
        };

        /**
         * @var array known crates containing weapons already which can be the prize for weapon types
         */
        WeaponPrize[] = {
            "Box_NATO_Wps_F",
            /*"launch_NLAW_F",*/ /* i dont like rocket launchers */
            "Box_NATO_WpsSpecial_F",
            "Box_East_WpsSpecial_F",
            "Box_East_Wps_F",
            "Box_IND_WpsSpecial_F"
        };
    };
};
