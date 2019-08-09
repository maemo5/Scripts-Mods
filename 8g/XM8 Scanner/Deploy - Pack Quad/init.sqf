// Deploy/Scrap Bike Functions
#include "xm8Apps\DeployQuad\createBike.sqf";
fnc_bike_deploy = compileFinal preprocessFileLineNumbers "xm8Apps\DeployQuad\deployBike.sqf";
fnc_bike_scrap = compileFinal preprocessFileLineNumbers "xm8Apps\DeployQuad\scrapBike.sqf";
