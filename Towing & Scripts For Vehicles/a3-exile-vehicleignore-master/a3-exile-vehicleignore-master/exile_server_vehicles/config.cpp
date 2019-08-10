/**
 * Vehicle Spawn Ignore addon for ExileMod
 * 
 * version 0.1 | Author: ole1986 | This addon is licensed under the Arma Public Licence
 * https://github.com/ole1986/a3-exile-vehicleignore
 */

class CfgPatches
{
	class exile_server
	{
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"exile_server_config"
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};
class CfgFunctions
{
	class ExileServerVehicles
	{
		class Bootstrap
		{
			file="exile_server_vehicles\bootstrap";
			class preInit
			{
				preInit=1;
			};
		};
	};
};

class CfgSettings {
    class VehicleSpawnIgnore
	{
        /** 
		 * Sahrani has 324 GRIDS when using VehicleGridSize = 1200
		 * By calculating sqrt(324) we get 18 x 18 meaning every vertical line has 18 grids
		 * 
		 * Example for 3 GRIDS each line:
		 * --- --- ---
		 *  3 | 6 | 9
		 * --- --- ---
		 *  2 | 5 | 8
		 * --- --- ---
		 *  1 | 4 | 7
		 * --- --- ---
		 */
        vehiclesGridIgnore[] = { 
            {1, 90}, /* 18 x 5 = 90: exclude the Islands from the left side */
            {320,324}, {302,306}, {284 ,288}, {266,270}, /* Upper right island */
            {307, 313}, {289, 295}, {271, 277}, {253, 259}, {235, 241} /* Lower right island */
        };
    }
};