/*
XM8 Portable Thermal Scanner Pro script made by Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/


This app will allow players to upload scans to their XM8/Database and then use them on vehicles only(really up to server admin on this)
If you have virtual scans and regular ThermalScannerPro in your inventory it will always use the real one first.

Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/

*/
 
class CfgPatches {
    class xm8apps_Server {
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
    class xm8apps_Server {
        class main {
            file="xm8apps_scans_Server\bootstrap";
            class preInit { 
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
        };
    };
};