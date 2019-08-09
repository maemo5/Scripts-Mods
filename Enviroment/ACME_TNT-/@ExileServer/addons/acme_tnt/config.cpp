class CfgPatches {
	class acme_tnt {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class acmetnt {
		class main {
			file = "\x\addons\acme_tnt\init";
			class init {
				postInit = 1;
			};
		};
	};
};

