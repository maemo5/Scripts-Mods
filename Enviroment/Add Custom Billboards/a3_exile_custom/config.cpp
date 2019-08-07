class CfgPatches {
	class a3_exile_custom {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};
class CfgFunctions {
	class Enigma {
		class main {
			file = "\x\addons\custom\init";
			class init {
				postInit = 1;
			};
		};
	};
};

