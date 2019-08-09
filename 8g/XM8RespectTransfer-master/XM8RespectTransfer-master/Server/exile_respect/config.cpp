/*
XM8APPS Respect Server Addon
By: Andrew_S90 - http://www.exilemod.com/profile/14063-andrew_s90/
*/
 
class CfgPatches {
    class exile_respect_Server {
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
    class exile_respect_Server {
        class main {
            file="exile_respect\bootstrap";
            class preInit { 
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
        };
    };
};