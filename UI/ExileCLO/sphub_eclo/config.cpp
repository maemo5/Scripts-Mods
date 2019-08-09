class CfgPatches
{
	class sphub_eclo
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgFunctions
{
	class sphub_data
	{
		class main
		{
			file = "sphub_eclo\init";
			class preInit {preInit = 1; };
			class postInit { postInit = 1; };
		};
	};
};