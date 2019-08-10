/********************************************************************
 * sneak_server
 * file: sneak_server\config.cpp
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
 
class CfgPatches {
    class sneak_server {
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
    class SneakServer {
        class main {
            file="sneak_server\bootstrap";
            class Sneak_preInit{ 
                preInit = 1;
            };
            class Sneak_postInit {
                postInit = 1;
            };
        };
    };
};

class CfgSettings
{
    groupsActive = 1; //All animals are equal, but some animals are more equal than others... 1 for using group feature
    liteVersion = 0; //set to 1 if you want to manage the UID list in this config instead of the Database

    class SneakCustomsGroup_Vip{
        // Sneak, 
        uids[] = {"76561197964219162", "xxxxxxx"}; //append your uids in here, it would be very kind of you if you leave mine in place and accept this addon as a donation :D
    };

    class SneakCustomsGroup_Staff{
        // Sneak, 
        uids[] = {/*"76561197964219162", */"xxxxxxx"}; //append your uids in here, it would be very kind of you if you leave mine in place and accept this addon as a donation :D
    };

    //add new groups like this: class SneakCustomsGroup_YOURGORUPNAMEHERE{};
};


