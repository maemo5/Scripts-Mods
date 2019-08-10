/********************************************************************
 * sneak_customs
 * file: sneak_customs\SneakCustoms_config.cpp
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
class CfgSneakCustoms{

	class SneakCustoms{};

	//add new skins like this
	class Exile_Car_Strider_Abstract{
		skins[] = {
			{"Exile_Car_Strider", 1750},
			{"SneakCustoms_Car_Strider_Desert", 1750},
			{"SneakCustoms_Car_Strider_Bangbus", 1750}
		};
	};

	class SneakCustoms_Car_Strider_Desert : SneakCustoms{ //class derivative to distinguish between standard and custom skins
		skinName = "Desert"; //Name that appears in the Vehicle Customs Trader Dialog
        hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa", "a3\data_f\vehicles\turret_co.paa"}; //Skin files to use
        availableFor = "Vip"; //what group will be able to purchase this skin
	};

	class SneakCustoms_Car_Strider_Bangbus : SneakCustoms{ //class derivative to distinguish between standard and custom skins
		skinName = "Bangbus by Aphex";
        hiddenSelectionsTextures[] = {"mpmissions\__cur_mp.Altis\textures\SneakVehicleCustoms\bangbus_by_aphex.jpg", "a3\data_f\vehicles\turret_co.paa"};
        availableFor = "Staff";
	};

	class Exile_Car_Strider : SneakCustoms{ //standard strider is listed here because there is no texture entry in the standard exile config
        skinName = "Hex";
        hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa", "a3\data_f\vehicles\turret_indp_co.paa"};
        availableFor = "All";
    };
};

