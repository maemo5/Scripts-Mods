class CfgPatches {
    class TreeLogging {
        requiredVersion = 0.1;
        requiredAddons[] = {
            "exile_server"
        };
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class TreeLogging {
        class main {
            file="TreeLogging\bootstrap";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};
