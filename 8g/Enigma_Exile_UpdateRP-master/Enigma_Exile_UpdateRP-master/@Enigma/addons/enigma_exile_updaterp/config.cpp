
class CfgPatches 
{
	class enigma_exile_updaterp {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		author[]= {"Happydayz_EngimaTeam"}; 	
	};
};
class CfgFunctions 
{
	class EnigmaUpdateRP
	{
		class main 
		{
			file = "\enigma_exile_updaterp\init";
			class init
			{
				preInit = 1;
			};
			class postinit
			{
				postInit = 1;
			};
		};
	};
};

