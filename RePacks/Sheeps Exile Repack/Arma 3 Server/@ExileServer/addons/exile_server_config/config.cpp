/**
 * config
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
class CfgPatches
{
	class exile_server_config
	{
		requiredVersion = 0.1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};


class CfgBuildings
{
	#include "loot.cpp"
};
class CfgLootTables
{
	/**
	  Result of 100 rounds:

	  U_C_Poloshirt_tricolour
	  H_Cap_headphones
	  U_C_Journalist
	  H_Hat_brown
	  B_HuntingBackpack
	  Chemlight_blue
	  Exile_Item_Can_Empty
	  U_C_Poor_1
	  U_C_Poloshirt_blue
	  Exile_Item_ToiletPaper
	  Exile_Item_CatFood
	  Chemlight_yellow
	  Chemlight_yellow
	  B_AssaultPack_khk
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ChristmasTinner
	  B_AssaultPack_cbr
	  Exile_Item_SausageGravy
	  SMG_02_F
	  Chemlight_yellow
	  FlareWhite_F
	  Exile_Item_InstantCoffee
	  Chemlight_blue
	  Exile_Item_ToiletPaper
	  Exile_Item_Beer
	  Exile_Item_ChristmasTinner
	  U_C_Poloshirt_blue
	  30Rnd_9x21_Mag
	  U_C_Scientist
	  Chemlight_red
	  B_AssaultPack_mcamo
	  U_C_Poor_2
	  B_HuntingBackpack
	  hgun_P07_F
	  Exile_Item_MountainDupe
	  ItemRadio
	  U_NikosAgedBody
	  hgun_P07_F
	  ItemRadio
	  U_C_Scientist
	  U_Rangemaster
	  H_Bandanna_surfer
	  B_AssaultPack_rgr
	  Exile_Item_Can_Empty
	  Exile_Item_PlasticBottleEmpty
	  U_C_Poloshirt_burgundy
	  H_Cap_tan
	  B_AssaultPack_sgg
	  ItemRadio
	  H_Bandanna_surfer
	  Exile_Item_ToiletPaper
	  Chemlight_green
	  Exile_Item_InstantCoffee
	  H_Beret_blk_POLICE
	  11Rnd_45ACP_Mag
	  U_C_Poor_2
	  Exile_Item_Dogfood
	  Exile_Item_MountainDupe
	  Exile_Item_PlasticBottleEmpty
	  Binocular
	  SMG_01_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_CookingPot
	  Exile_Item_Raisins
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ToiletPaper
	  Exile_Item_Raisins
	  H_StrawHat
	  Exile_Item_Dogfood
	  B_AssaultPack_khk
	  Exile_Item_SausageGravy
	  U_C_Poor_1
	  Exile_Item_Moobar
	  Exile_Item_InstantCoffee
	  muzzle_snds_L
	  U_C_Journalist
	  Chemlight_red
	  Chemlight_green
	  B_AssaultPack_dgtl
	  optic_Yorris
	  Exile_Item_PlasticBottleFreshWater
	  V_Press_F
	  H_Hat_grey
	  Exile_Item_Beer
	  ItemWatch
	  U_C_Poloshirt_blue
	  Exile_Item_PlasticBottleDirtyWater
	  Exile_Item_ToiletPaper
	  Exile_Item_Beer
	  Exile_Item_CookingPot
	  30Rnd_45ACP_Mag_SMG_01_Tracer_Green
	  30Rnd_45ACP_Mag_SMG_01
	  Exile_Item_Raisins
	  muzzle_snds_L
	  B_OutdoorPack_blk
	  Chemlight_blue
	  9Rnd_45ACP_Mag
	  hgun_Rook40_F
	  H_Beret_blk_POLICE
	  Exile_Item_ToiletPaper
	*/
	class CivillianLowerClass
	{
		count = 117;
		half = 7310.1552180397;
		halfIndex = 58;
		sum = 10000;
		items[] = 
		{
			{552.486187845304, "Exile_Item_Can_Empty"}, // 5.52%
			{1104.97237569061, "Exile_Item_ToiletPaper"}, // 5.52%
			{1657.45856353591, "Exile_Item_PlasticBottleEmpty"}, // 5.52%
			{1823.2044198895, "ItemRadio"}, // 1.66%
			{1988.95027624309, "ItemWatch"}, // 1.66%
			{2154.69613259669, "Exile_Item_PlasticBottleDirtyWater"}, // 1.66%
			{2294.17625215107, "Exile_Item_InstantCoffee"}, // 1.39%
			{2432.2977991124, "FlareRed_F"}, // 1.38%
			{2570.41934607373, "FlareGreen_F"}, // 1.38%
			{2708.54089303505, "Chemlight_yellow"}, // 1.38%
			{2846.66243999638, "Chemlight_red"}, // 1.38%
			{2984.7839869577, "Chemlight_green"}, // 1.38%
			{3122.90553391903, "Chemlight_blue"}, // 1.38%
			{3261.02708088036, "V_Rangemaster_belt"}, // 1.38%
			{3399.14862784168, "FlareWhite_F"}, // 1.38%
			{3537.27017480301, "FlareYellow_F"}, // 1.38%
			{3651.39027262024, "Exile_Item_Raisins"}, // 1.14%
			{3765.51037043746, "Exile_Item_Moobar"}, // 1.14%
			{3876.00760800652, "Binocular"}, // 1.10%
			{3986.50484557559, "Exile_Item_MountainDupe"}, // 1.10%
			{4097.00208314465, "ItemGPS"}, // 1.10%
			{4198.44217009329, "Exile_Item_SeedAstics"}, // 1.01%
			{4296.90505505582, "U_C_Poor_1"}, // 0.98%
			{4395.36794001835, "U_C_Poor_2"}, // 0.98%
			{4493.83082498088, "U_C_Poor_shorts_1"}, // 0.98%
			{4592.29370994341, "U_Rangemaster"}, // 0.98%
			{4690.75659490594, "U_C_HunterBody_grn"}, // 0.98%
			{4789.21947986847, "U_C_Scientist"}, // 0.98%
			{4887.682364831, "U_C_Journalist"}, // 0.98%
			{4981.6050167647, "Exile_Item_EnergyDrink"}, // 0.94%
			{5074.42269632271, "hgun_P07_F"}, // 0.93%
			{5163.18277240278, "Exile_Item_Noodles"}, // 0.89%
			{5251.94284848284, "Exile_Item_CatFood"}, // 0.89%
			{5340.70292456291, "Exile_Item_Cheathas"}, // 0.89%
			{5429.46300064297, "Exile_Item_ChristmasTinner"}, // 0.89%
			{5518.22307672304, "Exile_Item_SausageGravy"}, // 0.89%
			{5606.9831528031, "Exile_Item_Dogfood"}, // 0.89%
			{5695.74322888317, "Exile_Item_Surstromming"}, // 0.89%
			{5784.50330496323, "Exile_Item_BeefParts"}, // 0.89%
			{5873.2633810433, "Exile_Item_BBQSandwich"}, // 0.89%
			{5961.66117109855, "hgun_Rook40_F"}, // 0.88%
			{6050.0589611538, "hgun_ACPC2_F"}, // 0.88%
			{6132.93188933059, "30Rnd_45ACP_Mag_SMG_01"}, // 0.83%
			{6215.80481750739, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"}, // 0.83%
			{6293.15288380573, "Exile_Item_Beer"}, // 0.77%
			{6369.73512766548, "U_C_Poloshirt_blue"}, // 0.77%
			{6446.31737152522, "U_C_Poloshirt_burgundy"}, // 0.77%
			{6522.89961538497, "U_C_Poloshirt_stripped"}, // 0.77%
			{6599.48185924471, "U_C_Poloshirt_tricolour"}, // 0.77%
			{6676.06410310446, "U_C_Poloshirt_salmon"}, // 0.77%
			{6752.14416831594, "Exile_Item_GloriousKnakworst"}, // 0.76%
			{6827.2822898629, "SMG_01_F"}, // 0.75%
			{6900.21046665848, "hgun_PDW2000_F"}, // 0.73%
			{6973.13864345406, "SMG_02_F"}, // 0.73%
			{7042.19941693472, "V_Press_F"}, // 0.69%
			{7111.26019041539, "V_TacVest_blk_POLICE"}, // 0.69%
			{7177.55853295682, "H_Hat_grey"}, // 0.66%
			{7243.85687549826, "H_Hat_tan"}, // 0.66%
			{7310.1552180397, "H_Hat_checker"}, // 0.66%
			{7376.45356058113, "H_StrawHat_dark"}, // 0.66%
			{7442.75190312257, "H_Cap_press"}, // 0.66%
			{7509.05024566401, "H_Cap_red"}, // 0.66%
			{7575.34858820544, "Exile_Item_PlasticBottleFreshWater"}, // 0.66%
			{7641.64693074688, "H_StrawHat"}, // 0.66%
			{7707.94527328832, "H_Hat_brown"}, // 0.66%
			{7774.24361582976, "H_Hat_blue"}, // 0.66%
			{7840.54195837119, "H_Cap_tan"}, // 0.66%
			{7903.9420127141, "Exile_Item_CanOpener"}, // 0.63%
			{7967.342067057, "Exile_Item_Matches"}, // 0.63%
			{8028.11554771998, "B_OutdoorPack_blk"}, // 0.61%
			{8087.78405600728, "muzzle_snds_L"}, // 0.60%
			{8147.45256429457, "muzzle_snds_acp"}, // 0.60%
			{8204.91112783048, "hgun_Pistol_heavy_02_F"}, // 0.57%
			{8262.36969136639, "hgun_Pistol_heavy_01_F"}, // 0.57%
			{8319.8282549023, "hgun_Pistol_Signal_F"}, // 0.57%
			{8375.07687368683, "H_Cap_blu"}, // 0.55%
			{8430.32549247136, "H_Cap_blk"}, // 0.55%
			{8485.57411125589, "H_Beret_blk_POLICE"}, // 0.55%
			{8540.82273004042, "H_Bandanna_surfer"}, // 0.55%
			{8596.07134882495, "H_Cap_headphones"}, // 0.55%
			{8651.31996760948, "H_Cap_oli"}, // 0.55%
			{8706.56858639401, "H_Cap_grn"}, // 0.55%
			{8761.81720517854, "H_Cap_blk_Raven"}, // 0.55%
			{8817.06582396307, "11Rnd_45ACP_Mag"}, // 0.55%
			{8872.3144427476, "30Rnd_9x21_Mag"}, // 0.55%
			{8927.56306153213, "9Rnd_45ACP_Mag"}, // 0.55%
			{8982.81168031666, "Exile_Item_ZipTie"}, // 0.55%
			{9037.50781291334, "B_OutdoorPack_blu"}, // 0.55%
			{9092.20394551003, "B_OutdoorPack_tan"}, // 0.55%
			{9140.82273004042, "B_HuntingBackpack"}, // 0.49%
			{9185.02162506804, "6Rnd_45ACP_Cylinder"}, // 0.44%
			{9227.56306153213, "B_AssaultPack_mcamo"}, // 0.43%
			{9270.10449799622, "B_AssaultPack_cbr"}, // 0.43%
			{9312.64593446031, "B_AssaultPack_dgtl"}, // 0.43%
			{9355.1873709244, "B_AssaultPack_sgg"}, // 0.43%
			{9397.72880738849, "B_AssaultPack_blk"}, // 0.43%
			{9440.27024385258, "B_AssaultPack_khk"}, // 0.43%
			{9482.81168031666, "B_AssaultPack_rgr"}, // 0.43%
			{9521.48571346584, "Exile_Item_PowerDrink"}, // 0.39%
			{9559.52574607158, "Exile_Item_EMRE"}, // 0.38%
			{9597.56577867732, "Exile_Item_CookingPot"}, // 0.38%
			{9630.71494994804, "optic_ACO_grn_smg"}, // 0.33%
			{9663.86412121876, "optic_Aco"}, // 0.33%
			{9697.01329248947, "optic_ACO_grn"}, // 0.33%
			{9730.16246376019, "optic_Aco_smg"}, // 0.33%
			{9763.31163503091, "optic_Holosight_smg"}, // 0.33%
			{9793.6983753624, "B_Kitbag_cbr"}, // 0.30%
			{9824.08511569389, "B_Kitbag_sgg"}, // 0.30%
			{9854.47185602539, "B_Kitbag_mcamo"}, // 0.30%
			{9882.09616541765, "16Rnd_9x21_Mag"}, // 0.28%
			{9905.30058530715, "optic_Yorris"}, // 0.23%
			{9928.50500519666, "optic_MRD"}, // 0.23%
			{9947.84202177124, "6Rnd_GreenSignal_F"}, // 0.19%
			{9967.17903834583, "6Rnd_RedSignal_F"}, // 0.19%
			{9978.11935889722, "U_NikosAgedBody"}, // 0.11%
			{9989.05967944861, "U_NikosBody"}, // 0.11%
			{10000, "U_OrestesBody"} // 0.11%
		};
	};

	/**
	  Result of 100 rounds:

	  hgun_Pistol_Signal_F
	  hgun_Pistol_Signal_F
	  Exile_Item_BeefParts
	  Exile_Item_Noodles
	  arifle_Mk20_F
	  arifle_MX_F
	  FlareWhite_F
	  30Rnd_45ACP_Mag_SMG_01
	  Chemlight_yellow
	  30Rnd_556x45_Stanag_Tracer_Red
	  arifle_MXM_F
	  FlareRed_F
	  V_Press_F
	  muzzle_snds_L
	  H_Cap_blu
	  FlareRed_F
	  Exile_Item_PlasticBottleEmpty
	  ItemRadio
	  Exile_Item_Can_Empty
	  B_AssaultPack_mcamo
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_PlasticBottleEmpty
	  U_C_Journalist
	  optic_ACO_grn_smg
	  FlareGreen_F
	  V_TacVest_blk_POLICE
	  H_StrawHat
	  6Rnd_45ACP_Cylinder
	  arifle_Katiba_GL_F
	  Exile_Item_CatFood
	  Exile_Item_SeedAstics
	  30Rnd_9x21_Mag
	  H_Cap_headphones
	  Exile_Item_Noodles
	  30Rnd_45ACP_Mag_SMG_01
	  6Rnd_RedSignal_F
	  optic_Hamr
	  Chemlight_blue
	  Exile_Item_Can_Empty
	  H_Cap_red
	  Exile_Item_BeefParts
	  ItemWatch
	  Exile_Item_Beer
	  hgun_PDW2000_F
	  Exile_Item_Can_Empty
	  H_Beret_blk_POLICE
	  optic_ACO_grn_smg
	  hgun_PDW2000_F
	  U_OrestesBody
	  Exile_Item_PlasticBottleEmpty
	  H_StrawHat
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_BBQSandwich
	  Exile_Item_Can_Empty
	  H_Cap_red
	  U_C_Poloshirt_burgundy
	  Exile_Item_PlasticBottleEmpty
	  U_C_Poloshirt_blue
	  H_Hat_brown
	  FlareRed_F
	  Exile_Item_Beer
	  Exile_Item_PlasticBottleFreshWater
	  FlareYellow_F
	  Exile_Item_CatFood
	  Exile_Item_Beer
	  U_C_Poor_shorts_1
	  11Rnd_45ACP_Mag
	  Chemlight_green
	  Chemlight_green
	  Exile_Item_Moobar
	  Exile_Item_PlasticBottleDirtyWater
	  optic_ACO_grn_smg
	  Exile_Item_Can_Empty
	  ItemRadio
	  U_C_Poor_1
	  Exile_Item_ZipTie
	  Exile_Item_BeefParts
	  B_OutdoorPack_blk
	  optic_ACO_grn
	  U_C_Poor_1
	  Exile_Item_CanOpener
	  Exile_Item_Can_Empty
	  B_AssaultPack_sgg
	  B_OutdoorPack_tan
	  muzzle_snds_acp
	  Chemlight_blue
	  Exile_Item_Moobar
	  H_Beret_blk_POLICE
	  H_Beret_blk_POLICE
	  acc_flashlight
	  H_Cap_grn
	  Exile_Item_Moobar
	  Exile_Item_Surstromming
	  H_Hat_checker
	  Exile_Item_PlasticBottleEmpty
	  30Rnd_9x21_Mag
	  Exile_Item_CookingPot
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ToiletPaper
	*/
	class CivillianUpperClass
	{
		count = 153;
		half = 8030.99428493325;
		halfIndex = 76;
		sum = 10000;
		items[] = 
		{
			{526.315789473684, "Exile_Item_Can_Empty"}, // 5.26%
			{1052.63157894737, "Exile_Item_ToiletPaper"}, // 5.26%
			{1578.94736842105, "Exile_Item_PlasticBottleEmpty"}, // 5.26%
			{1736.84210526316, "ItemRadio"}, // 1.58%
			{1894.73684210526, "Exile_Item_PlasticBottleDirtyWater"}, // 1.58%
			{2052.63157894737, "ItemWatch"}, // 1.58%
			{2185.50474547023, "Exile_Item_InstantCoffee"}, // 1.33%
			{2317.08369283865, "Chemlight_red"}, // 1.32%
			{2448.66264020708, "Chemlight_green"}, // 1.32%
			{2580.2415875755, "Chemlight_blue"}, // 1.32%
			{2711.82053494392, "FlareGreen_F"}, // 1.32%
			{2843.39948231234, "Chemlight_yellow"}, // 1.32%
			{2974.97842968076, "FlareYellow_F"}, // 1.32%
			{3106.55737704918, "FlareRed_F"}, // 1.32%
			{3238.1363244176, "FlareWhite_F"}, // 1.32%
			{3369.71527178602, "V_Rangemaster_belt"}, // 1.32%
			{3478.42968075928, "Exile_Item_Raisins"}, // 1.09%
			{3587.14408973253, "Exile_Item_Moobar"}, // 1.09%
			{3692.40724762727, "ItemGPS"}, // 1.05%
			{3797.670405522, "Binocular"}, // 1.05%
			{3902.93356341674, "Exile_Item_MountainDupe"}, // 1.05%
			{3999.56859361519, "Exile_Item_SeedAstics"}, // 0.97%
			{4093.36744718476, "U_Rangemaster"}, // 0.94%
			{4187.16630075432, "U_C_Scientist"}, // 0.94%
			{4280.96515432389, "U_C_Journalist"}, // 0.94%
			{4374.76400789346, "U_C_HunterBody_grn"}, // 0.94%
			{4468.56286146303, "U_C_Poor_shorts_1"}, // 0.94%
			{4562.36171503259, "U_C_Poor_2"}, // 0.94%
			{4656.16056860216, "U_C_Poor_1"}, // 0.94%
			{4745.63425281269, "Exile_Item_EnergyDrink"}, // 0.89%
			{4834.05530544427, "hgun_P07_F"}, // 0.88%
			{4918.61095686791, "Exile_Item_CatFood"}, // 0.85%
			{5003.16660829155, "Exile_Item_BBQSandwich"}, // 0.85%
			{5087.72225971519, "Exile_Item_ChristmasTinner"}, // 0.85%
			{5172.27791113883, "Exile_Item_SausageGravy"}, // 0.85%
			{5256.83356256247, "Exile_Item_Surstromming"}, // 0.85%
			{5341.38921398612, "Exile_Item_Dogfood"}, // 0.85%
			{5425.94486540976, "Exile_Item_Noodles"}, // 0.85%
			{5510.5005168334, "Exile_Item_Cheathas"}, // 0.85%
			{5595.05616825704, "Exile_Item_BeefParts"}, // 0.85%
			{5679.26669457283, "hgun_Rook40_F"}, // 0.84%
			{5763.47722088862, "hgun_ACPC2_F"}, // 0.84%
			{5842.42458930967, "30Rnd_45ACP_Mag_SMG_01"}, // 0.79%
			{5921.37195773072, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"}, // 0.79%
			{5995.05616825704, "Exile_Item_Beer"}, // 0.74%
			{6068.01083214448, "U_C_Poloshirt_stripped"}, // 0.73%
			{6140.96549603192, "U_C_Poloshirt_blue"}, // 0.73%
			{6213.92015991936, "U_C_Poloshirt_tricolour"}, // 0.73%
			{6286.87482380681, "U_C_Poloshirt_salmon"}, // 0.73%
			{6359.82948769425, "U_C_Poloshirt_burgundy"}, // 0.73%
			{6432.30576034308, "Exile_Item_GloriousKnakworst"}, // 0.72%
			{6503.8847077115, "SMG_01_F"}, // 0.72%
			{6573.35839192203, "SMG_02_F"}, // 0.69%
			{6642.83207613256, "hgun_PDW2000_F"}, // 0.69%
			{6708.62154981677, "V_Press_F"}, // 0.66%
			{6774.41102350098, "V_TacVest_blk_POLICE"}, // 0.66%
			{6837.56891823782, "H_Cap_press"}, // 0.63%
			{6900.72681297466, "H_Cap_tan"}, // 0.63%
			{6963.88470771151, "H_Hat_grey"}, // 0.63%
			{7027.04260244835, "Exile_Item_PlasticBottleFreshWater"}, // 0.63%
			{7090.20049718519, "H_StrawHat_dark"}, // 0.63%
			{7153.35839192203, "H_StrawHat"}, // 0.63%
			{7216.51628665888, "H_Hat_tan"}, // 0.63%
			{7279.67418139572, "H_Hat_blue"}, // 0.63%
			{7342.83207613256, "H_Hat_brown"}, // 0.63%
			{7405.9899708694, "H_Hat_checker"}, // 0.63%
			{7469.14786560625, "H_Cap_red"}, // 0.63%
			{7529.54475948028, "Exile_Item_CanOpener"}, // 0.60%
			{7589.9416533543, "Exile_Item_Matches"}, // 0.60%
			{7647.83639019641, "B_OutdoorPack_blk"}, // 0.58%
			{7704.67849545957, "muzzle_snds_L"}, // 0.57%
			{7761.52060072272, "muzzle_snds_acp"}, // 0.57%
			{7816.25744282799, "hgun_Pistol_Signal_F"}, // 0.55%
			{7870.99428493325, "hgun_Pistol_heavy_02_F"}, // 0.55%
			{7925.73112703851, "hgun_Pistol_heavy_01_F"}, // 0.55%
			{7978.36270598588, "H_Beret_blk_POLICE"}, // 0.53%
			{8030.99428493325, "H_Cap_blk"}, // 0.53%
			{8083.62586388062, "H_Cap_blk_Raven"}, // 0.53%
			{8136.25744282799, "H_Cap_blu"}, // 0.53%
			{8188.88902177536, "H_Cap_grn"}, // 0.53%
			{8241.52060072272, "H_Cap_headphones"}, // 0.53%
			{8294.15217967009, "H_Bandanna_surfer"}, // 0.53%
			{8346.78375861746, "H_Cap_oli"}, // 0.53%
			{8399.41533756483, "Exile_Item_ZipTie"}, // 0.53%
			{8452.0469165122, "9Rnd_45ACP_Mag"}, // 0.53%
			{8504.67849545957, "11Rnd_45ACP_Mag"}, // 0.53%
			{8557.31007440693, "30Rnd_9x21_Mag"}, // 0.53%
			{8609.41533756483, "B_OutdoorPack_blu"}, // 0.52%
			{8661.52060072272, "B_OutdoorPack_tan"}, // 0.52%
			{8707.83639019641, "B_HuntingBackpack"}, // 0.46%
			{8749.9416533543, "6Rnd_45ACP_Cylinder"}, // 0.42%
			{8790.46796914378, "B_AssaultPack_blk"}, // 0.41%
			{8830.99428493325, "B_AssaultPack_sgg"}, // 0.41%
			{8871.52060072272, "B_AssaultPack_rgr"}, // 0.41%
			{8912.0469165122, "B_AssaultPack_khk"}, // 0.41%
			{8952.57323230167, "B_AssaultPack_cbr"}, // 0.41%
			{8993.09954809114, "B_AssaultPack_dgtl"}, // 0.41%
			{9033.62586388062, "B_AssaultPack_mcamo"}, // 0.41%
			{9070.46796914378, "Exile_Item_PowerDrink"}, // 0.37%
			{9106.70610546819, "Exile_Item_EMRE"}, // 0.36%
			{9142.94424179261, "Exile_Item_CookingPot"}, // 0.36%
			{9174.52318916103, "optic_ACO_grn"}, // 0.32%
			{9206.10213652945, "optic_Aco"}, // 0.32%
			{9237.68108389787, "optic_Aco_smg"}, // 0.32%
			{9269.2600312663, "optic_ACO_grn_smg"}, // 0.32%
			{9300.83897863472, "optic_Holosight_smg"}, // 0.32%
			{9329.78634705577, "B_Kitbag_sgg"}, // 0.29%
			{9358.73371547682, "B_Kitbag_mcamo"}, // 0.29%
			{9387.68108389788, "B_Kitbag_cbr"}, // 0.29%
			{9413.99687337156, "16Rnd_9x21_Mag"}, // 0.26%
			{9438.927621294, "30Rnd_65x39_caseless_green"}, // 0.25%
			{9463.85836921644, "30Rnd_556x45_Stanag"}, // 0.25%
			{9486.18691786078, "acc_flashlight"}, // 0.22%
			{9508.29218101867, "optic_MRD"}, // 0.22%
			{9530.39744417657, "optic_Yorris"}, // 0.22%
			{9548.81849680814, "6Rnd_RedSignal_F"}, // 0.18%
			{9567.23954943972, "6Rnd_GreenSignal_F"}, // 0.18%
			{9585.52209791618, "20Rnd_556x45_UW_mag"}, // 0.18%
			{9601.47106123356, "optic_Holosight"}, // 0.16%
			{9617.42002455095, "muzzle_snds_M"}, // 0.16%
			{9633.36898786833, "muzzle_snds_H"}, // 0.16%
			{9649.31795118571, "optic_DMS"}, // 0.16%
			{9665.2669145031, "optic_Hamr"}, // 0.16%
			{9681.21587782048, "optic_MRCO"}, // 0.16%
			{9697.16484113786, "acc_pointer_IR"}, // 0.16%
			{9713.11380445525, "optic_Arco"}, // 0.16%
			{9728.90327813946, "arifle_Katiba_F"}, // 0.16%
			{9743.86172689292, "30Rnd_556x45_Stanag_Tracer_Red"}, // 0.15%
			{9758.82017564638, "30Rnd_556x45_Stanag_Tracer_Green"}, // 0.15%
			{9773.77862439985, "30Rnd_65x39_caseless_mag_Tracer"}, // 0.15%
			{9788.73707315331, "30Rnd_65x39_caseless_mag"}, // 0.15%
			{9803.69552190677, "30Rnd_65x39_caseless_green_mag_Tracer"}, // 0.15%
			{9818.65397066023, "30Rnd_556x45_Stanag_Tracer_Yellow"}, // 0.15%
			{9831.2855496076, "arifle_MXC_F"}, // 0.13%
			{9843.91712855497, "arifle_MX_F"}, // 0.13%
			{9856.54870750234, "arifle_Katiba_GL_F"}, // 0.13%
			{9869.18028644971, "arifle_TRG21_F"}, // 0.13%
			{9881.81186539708, "arifle_TRG20_F"}, // 0.13%
			{9892.86449697602, "arifle_Mk20_F"}, // 0.11%
			{9903.91712855497, "arifle_Mk20C_F"}, // 0.11%
			{9914.33922339603, "U_NikosBody"}, // 0.10%
			{9924.7613182371, "U_OrestesBody"}, // 0.10%
			{9935.18341307816, "U_NikosAgedBody"}, // 0.10%
			{9944.65709728869, "arifle_SDAR_F"}, // 0.09%
			{9954.13078149921, "arifle_MXM_F"}, // 0.09%
			{9962.10526315791, "optic_NVS"}, // 0.08%
			{9968.42105263159, "arifle_Mk20_GL_F"}, // 0.06%
			{9974.73684210528, "arifle_MX_GL_F"}, // 0.06%
			{9981.05263157896, "arifle_TRG21_GL_F"}, // 0.06%
			{9985.78947368422, "arifle_MXM_Black_F"}, // 0.05%
			{9990.52631578949, "arifle_MXC_Black_F"}, // 0.05%
			{9995.26315789475, "arifle_MX_GL_Black_F"}, // 0.05%
			{10000, "arifle_MX_Black_F"} // 0.05%
		};
	};

	/**
	  Result of 100 rounds:

	  Exile_Item_ChristmasTinner
	  Exile_Item_ChristmasTinner
	  Exile_Item_InstantCoffee
	  ItemGPS
	  Exile_Item_Rope
	  6Rnd_GreenSignal_F
	  Exile_Item_ZipTie
	  hgun_Pistol_Signal_F
	  Exile_Item_PlasticBottleDirtyWater
	  H_Beret_blk_POLICE
	  U_C_Poor_shorts_1
	  Exile_Item_ZipTie
	  FlareYellow_F
	  Exile_Item_CatFood
	  Exile_Item_CanOpener
	  Exile_Item_ZipTie
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Can_Empty
	  muzzle_snds_acp
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_ToiletPaper
	  Exile_Item_Beer
	  Exile_Item_JunkMetal
	  Exile_Item_PlasticBottleDirtyWater
	  Chemlight_yellow
	  Exile_Item_SeedAstics
	  30Rnd_9x21_Mag
	  optic_Yorris
	  Exile_Item_Vishpirin
	  hgun_P07_F
	  V_Rangemaster_belt
	  SmokeShellBlue
	  ItemGPS
	  hgun_Pistol_Signal_F
	  optic_Aco
	  H_Hat_blue
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Can_Empty
	  Exile_Item_Surstromming
	  Binocular
	  Exile_Item_PlasticBottleEmpty
	  hgun_Pistol_heavy_01_F
	  FlareWhite_F
	  Exile_Item_Can_Empty
	  Exile_Item_GloriousKnakworst
	  B_AssaultPack_cbr
	  FlareWhite_F
	  U_C_Journalist
	  Exile_Item_ToiletPaper
	  Exile_Item_SeedAstics
	  Exile_Item_ToiletPaper
	  SMG_01_F
	  Exile_Item_Can_Empty
	  Exile_Item_Surstromming
	  Chemlight_red
	  Exile_Item_ToiletPaper
	  Chemlight_green
	  Exile_Item_BeefParts
	  Exile_Item_ZipTie
	  hgun_Pistol_heavy_01_F
	  Exile_Item_Raisins
	  Exile_Item_PlasticBottleDirtyWater
	  Exile_Item_Vishpirin
	  hgun_Pistol_heavy_01_F
	  hgun_Rook40_F
	  SmokeShellGreen
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_EnergyDrink
	  Exile_Item_PlasticBottleEmpty
	  B_AssaultPack_cbr
	  Exile_Item_Can_Empty
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleFreshWater
	  SmokeShellPurple
	  Binocular
	  Exile_Item_Dogfood
	  B_AssaultPack_khk
	  Exile_Item_PlasticBottleFreshWater
	  Exile_Item_Noodles
	  Exile_Item_Can_Empty
	  9Rnd_45ACP_Mag
	  B_OutdoorPack_blu
	  Exile_Item_BBQSandwich
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_EnergyDrink
	  Exile_Item_GloriousKnakworst
	  Exile_Item_GloriousKnakworst
	  optic_ACO_grn_smg
	  SmokeShellOrange
	  Exile_Item_EnergyDrink
	  hgun_PDW2000_F
	  Exile_Item_Cheathas
	  Exile_Item_ToiletPaper
	  30Rnd_45ACP_Mag_SMG_01_Tracer_Green
	  B_AssaultPack_sgg
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	*/
	class Shop
	{
		count = 140;
		half = 8965.58823529411;
		halfIndex = 70;
		sum = 9999.99999999999;
		items[] = 
		{
			{833.333333333333, "Exile_Item_Can_Empty"}, // 8.33%
			{1666.66666666667, "Exile_Item_ToiletPaper"}, // 8.33%
			{2500, "Exile_Item_PlasticBottleEmpty"}, // 8.33%
			{2875, "Exile_Item_PlasticBottleDirtyWater"}, // 3.75%
			{3125, "Exile_Item_ZipTie"}, // 2.50%
			{3375, "Exile_Item_MountainDupe"}, // 2.50%
			{3587.5, "Exile_Item_EnergyDrink"}, // 2.13%
			{3762.5, "ItemRadio"}, // 1.75%
			{3937.5, "ItemWatch"}, // 1.75%
			{4112.5, "hgun_P07_F"}, // 1.75%
			{4287.5, "Exile_Item_Beer"}, // 1.75%
			{4454.16666666667, "hgun_Rook40_F"}, // 1.67%
			{4620.83333333333, "hgun_ACPC2_F"}, // 1.67%
			{4770.83333333333, "Exile_Item_PlasticBottleFreshWater"}, // 1.50%
			{4917.89215686275, "Exile_Item_Vishpirin"}, // 1.47%
			{5059.55882352941, "SMG_01_F"}, // 1.42%
			{5197.05882352941, "hgun_PDW2000_F"}, // 1.38%
			{5334.55882352941, "SMG_02_F"}, // 1.38%
			{5451.22549019608, "ItemGPS"}, // 1.17%
			{5567.89215686275, "Binocular"}, // 1.17%
			{5680.59707489553, "Exile_Item_InstantCoffee"}, // 1.13%
			{5788.93040822887, "hgun_Pistol_Signal_F"}, // 1.08%
			{5897.2637415622, "hgun_Pistol_heavy_02_F"}, // 1.08%
			{6005.59707489553, "hgun_Pistol_heavy_01_F"}, // 1.08%
			{6109.7637415622, "Chemlight_blue"}, // 1.04%
			{6213.93040822887, "Chemlight_green"}, // 1.04%
			{6318.09707489553, "Chemlight_red"}, // 1.04%
			{6422.2637415622, "FlareGreen_F"}, // 1.04%
			{6526.43040822887, "FlareRed_F"}, // 1.04%
			{6630.59707489553, "FlareWhite_F"}, // 1.04%
			{6734.7637415622, "FlareYellow_F"}, // 1.04%
			{6838.93040822887, "Chemlight_yellow"}, // 1.04%
			{6931.14352298297, "Exile_Item_Moobar"}, // 0.92%
			{7023.35663773707, "Exile_Item_Raisins"}, // 0.92%
			{7110.85663773707, "Exile_Item_PowerDrink"}, // 0.88%
			{7192.82385085182, "Exile_Item_SeedAstics"}, // 0.82%
			{7266.35326261653, "Exile_Item_Bandage"}, // 0.74%
			{7338.07457409194, "Exile_Item_BeefParts"}, // 0.72%
			{7409.79588556735, "Exile_Item_Cheathas"}, // 0.72%
			{7481.51719704275, "Exile_Item_Surstromming"}, // 0.72%
			{7553.23850851816, "Exile_Item_Noodles"}, // 0.72%
			{7624.95981999357, "Exile_Item_Dogfood"}, // 0.72%
			{7696.68113146898, "Exile_Item_CatFood"}, // 0.72%
			{7768.40244294439, "Exile_Item_BBQSandwich"}, // 0.72%
			{7840.1237544198, "Exile_Item_ChristmasTinner"}, // 0.72%
			{7911.84506589521, "Exile_Item_SausageGravy"}, // 0.72%
			{7973.32047573128, "Exile_Item_GloriousKnakworst"}, // 0.61%
			{8028.32047573128, "Exile_Melee_Axe"}, // 0.55%
			{8079.549983928, "Exile_Item_Matches"}, // 0.51%
			{8130.77949212472, "Exile_Item_CanOpener"}, // 0.51%
			{8180.77949212472, "SmokeShellOrange"}, // 0.50%
			{8230.77949212472, "SmokeShellBlue"}, // 0.50%
			{8277.44615879138, "SmokeShellYellow"}, // 0.47%
			{8324.11282545805, "SmokeShellRed"}, // 0.47%
			{8370.77949212472, "SmokeShell"}, // 0.47%
			{8417.44615879138, "SmokeShellPurple"}, // 0.47%
			{8464.11282545805, "SmokeShellGreen"}, // 0.47%
			{8505.77949212472, "30Rnd_45ACP_Mag_SMG_01"}, // 0.42%
			{8547.44615879138, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"}, // 0.42%
			{8589.11282545805, "V_Rangemaster_belt"}, // 0.42%
			{8630.77949212471, "B_OutdoorPack_blk"}, // 0.42%
			{8668.27949212471, "B_OutdoorPack_blu"}, // 0.38%
			{8705.77949212471, "B_OutdoorPack_tan"}, // 0.38%
			{8739.11282545805, "B_HuntingBackpack"}, // 0.33%
			{8772.44615879138, "30Rnd_9x21_Mag"}, // 0.33%
			{8805.77949212472, "11Rnd_45ACP_Mag"}, // 0.33%
			{8839.11282545805, "9Rnd_45ACP_Mag"}, // 0.33%
			{8871.61282545805, "Exile_Item_Handsaw"}, // 0.33%
			{8904.11282545805, "Exile_Item_Pliers"}, // 0.33%
			{8934.85053037608, "Exile_Item_EMRE"}, // 0.31%
			{8965.58823529411, "Exile_Item_CookingPot"}, // 0.31%
			{8995.58823529411, "muzzle_snds_L"}, // 0.30%
			{9025.58823529411, "muzzle_snds_acp"}, // 0.30%
			{9055, "Exile_Item_InstaDoc"}, // 0.29%
			{9084.16666666666, "B_AssaultPack_dgtl"}, // 0.29%
			{9113.33333333333, "B_AssaultPack_rgr"}, // 0.29%
			{9142.49999999999, "B_AssaultPack_sgg"}, // 0.29%
			{9171.66666666666, "B_AssaultPack_khk"}, // 0.29%
			{9200.83333333333, "B_AssaultPack_blk"}, // 0.29%
			{9229.99999999999, "B_AssaultPack_mcamo"}, // 0.29%
			{9259.16666666666, "B_AssaultPack_cbr"}, // 0.29%
			{9286.66666666666, "Exile_Item_JunkMetal"}, // 0.28%
			{9313.33333333332, "6Rnd_45ACP_Cylinder"}, // 0.27%
			{9335.83333333332, "Exile_Item_LightBulb"}, // 0.23%
			{9356.66666666666, "B_Kitbag_cbr"}, // 0.21%
			{9377.49999999999, "V_TacVest_blk_POLICE"}, // 0.21%
			{9398.33333333333, "V_Press_F"}, // 0.21%
			{9419.16666666666, "B_Kitbag_mcamo"}, // 0.21%
			{9439.99999999999, "B_Kitbag_sgg"}, // 0.21%
			{9459.99999999999, "Exile_Item_ExtensionCord"}, // 0.20%
			{9476.66666666666, "optic_ACO_grn_smg"}, // 0.17%
			{9493.33333333333, "optic_Aco_smg"}, // 0.17%
			{9509.99999999999, "optic_ACO_grn"}, // 0.17%
			{9526.66666666666, "16Rnd_9x21_Mag"}, // 0.17%
			{9543.33333333332, "optic_Aco"}, // 0.17%
			{9559.99999999999, "optic_Holosight_smg"}, // 0.17%
			{9574.99999999999, "H_StrawHat_dark"}, // 0.15%
			{9589.99999999999, "H_StrawHat"}, // 0.15%
			{9604.99999999999, "H_Cap_red"}, // 0.15%
			{9619.99999999999, "H_Hat_grey"}, // 0.15%
			{9634.99999999999, "H_Hat_checker"}, // 0.15%
			{9649.99999999999, "H_Hat_brown"}, // 0.15%
			{9664.99999999999, "H_Hat_blue"}, // 0.15%
			{9679.99999999999, "H_Cap_tan"}, // 0.15%
			{9694.99999999999, "H_Cap_press"}, // 0.15%
			{9709.99999999999, "H_Hat_tan"}, // 0.15%
			{9722.49999999999, "Exile_Item_Grinder"}, // 0.13%
			{9734.99999999999, "H_Bandanna_surfer"}, // 0.13%
			{9747.49999999999, "H_Beret_blk_POLICE"}, // 0.13%
			{9759.99999999999, "H_Cap_blk_Raven"}, // 0.13%
			{9772.49999999999, "H_Cap_grn"}, // 0.13%
			{9784.99999999999, "H_Cap_headphones"}, // 0.13%
			{9797.49999999999, "H_Cap_oli"}, // 0.13%
			{9809.99999999999, "H_Cap_blk"}, // 0.13%
			{9822.49999999999, "H_Cap_blu"}, // 0.13%
			{9834.16666666666, "6Rnd_GreenSignal_F"}, // 0.12%
			{9845.83333333332, "optic_MRD"}, // 0.12%
			{9857.49999999999, "optic_Yorris"}, // 0.12%
			{9869.16666666666, "6Rnd_RedSignal_F"}, // 0.12%
			{9879.16666666666, "Exile_Item_MetalBoard"}, // 0.10%
			{9889.16666666666, "Exile_Item_Rope"}, // 0.10%
			{9899.16666666666, "Exile_Item_CamoTentKit"}, // 0.10%
			{9906.66666666666, "Exile_Item_PortableGeneratorKit"}, // 0.08%
			{9914.16666666666, "Exile_Item_FloodLightKit"}, // 0.08%
			{9921.59240924091, "U_C_Journalist"}, // 0.07%
			{9929.01815181517, "U_Rangemaster"}, // 0.07%
			{9936.44389438943, "U_C_Scientist"}, // 0.07%
			{9943.86963696369, "U_C_HunterBody_grn"}, // 0.07%
			{9951.29537953795, "U_C_Poor_shorts_1"}, // 0.07%
			{9958.7211221122, "U_C_Poor_1"}, // 0.07%
			{9966.14686468646, "U_C_Poor_2"}, // 0.07%
			{9971.92244224422, "U_C_Poloshirt_blue"}, // 0.06%
			{9977.69801980197, "U_C_Poloshirt_burgundy"}, // 0.06%
			{9983.47359735973, "U_C_Poloshirt_stripped"}, // 0.06%
			{9989.24917491748, "U_C_Poloshirt_tricolour"}, // 0.06%
			{9995.02475247524, "U_C_Poloshirt_salmon"}, // 0.06%
			{9997.52475247524, "Exile_Item_ThermalScannerPro"}, // 0.03%
			{9998.34983498349, "U_NikosAgedBody"}, // 0.01%
			{9999.17491749174, "U_NikosBody"}, // 0.01%
			{9999.99999999999, "U_OrestesBody"} // 0.01%
		};
	};

	/**
	  Result of 100 rounds:

	  FlareRed_F
	  FlareRed_F
	  Exile_Item_Pliers
	  Exile_Item_Pliers
	  Exile_Item_FloodLightKit
	  Exile_Item_PortableGeneratorKit
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Pliers
	  Exile_Item_ToiletPaper
	  Exile_Item_CamoTentKit
	  Exile_Item_FloodLightKit
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ZipTie
	  FlareGreen_F
	  FlareWhite_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_DuctTape
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_Can_Empty
	  Exile_Item_FuelCanisterFull
	  Exile_Item_Grinder
	  Exile_Item_ToiletPaper
	  Exile_Item_JunkMetal
	  FlareYellow_F
	  Exile_Item_ExtensionCord
	  Exile_Item_PortableGeneratorKit
	  Exile_Melee_Axe
	  Exile_Item_FuelCanisterFull
	  Exile_Item_LightBulb
	  FlareWhite_F
	  Exile_Item_Pliers
	  Exile_Item_Pliers
	  Exile_Item_MetalBoard
	  Exile_Item_CamoTentKit
	  Exile_Item_ToiletPaper
	  Exile_Item_FuelCanisterEmpty
	  FlareGreen_F
	  Exile_Item_Pliers
	  Exile_Item_ToiletPaper
	  Exile_Item_Handsaw
	  Exile_Item_ZipTie
	  Exile_Item_FuelCanisterEmpty
	  FlareRed_F
	  Exile_Item_Grinder
	  Exile_Item_ZipTie
	  Exile_Item_FloodLightKit
	  Exile_Item_Can_Empty
	  FlareYellow_F
	  Exile_Item_Can_Empty
	  Exile_Melee_Axe
	  Exile_Item_FuelCanisterEmpty
	  FlareGreen_F
	  Exile_Item_ZipTie
	  Exile_Item_Can_Empty
	  Exile_Item_Handsaw
	  FlareYellow_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Handsaw
	  Exile_Item_JunkMetal
	  Exile_Item_PlasticBottleEmpty
	  Exile_Melee_Axe
	  Exile_Item_Handsaw
	  Exile_Item_FuelCanisterFull
	  Exile_Item_LightBulb
	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Can_Empty
	  Exile_Item_Grinder
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_Can_Empty
	  Exile_Melee_Axe
	  Exile_Item_LightBulb
	  Exile_Item_Pliers
	  FlareGreen_F
	  Exile_Item_DuctTape
	  Exile_Melee_Axe
	  FlareGreen_F
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_ExtensionCord
	  Exile_Item_LightBulb
	  FlareRed_F
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  FlareRed_F
	  FlareRed_F
	  Exile_Item_Rope
	  FlareWhite_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Melee_Axe
	  FlareYellow_F
	  Exile_Item_Can_Empty
	  Exile_Item_LightBulb
	  Exile_Item_DuctTape
	  Exile_Item_Can_Empty
	  Exile_Item_FuelCanisterEmpty
	*/
	class Industrial
	{
		count = 24;
		half = 8030.4347826087;
		halfIndex = 12;
		sum = 10000;
		items[] = 
		{
			{1086.95652173913, "Exile_Item_FuelCanisterEmpty"}, // 10.87%
			{1956.52173913043, "Exile_Item_Can_Empty"}, // 8.70%
			{2826.08695652174, "Exile_Item_ToiletPaper"}, // 8.70%
			{3695.65217391304, "Exile_Item_PlasticBottleEmpty"}, // 8.70%
			{4565.21739130435, "Exile_Item_FuelCanisterFull"}, // 8.70%
			{5330.4347826087, "Exile_Melee_Axe"}, // 7.65%
			{5782.60869565217, "Exile_Item_Pliers"}, // 4.52%
			{6234.78260869565, "Exile_Item_Handsaw"}, // 4.52%
			{6669.5652173913, "Exile_Item_ZipTie"}, // 4.35%
			{7052.17391304348, "Exile_Item_JunkMetal"}, // 3.83%
			{7378.26086956522, "FlareYellow_F"}, // 3.26%
			{7704.34782608696, "FlareGreen_F"}, // 3.26%
			{8030.4347826087, "FlareRed_F"}, // 3.26%
			{8356.52173913043, "FlareWhite_F"}, // 3.26%
			{8669.5652173913, "Exile_Item_LightBulb"}, // 3.13%
			{8947.82608695652, "Exile_Item_ExtensionCord"}, // 2.78%
			{9165.21739130435, "Exile_Item_DuctTape"}, // 2.17%
			{9339.13043478261, "Exile_Item_Grinder"}, // 1.74%
			{9478.26086956522, "Exile_Item_Rope"}, // 1.39%
			{9617.39130434782, "Exile_Item_MetalBoard"}, // 1.39%
			{9756.52173913043, "Exile_Item_CamoTentKit"}, // 1.39%
			{9860.86956521739, "Exile_Item_PortableGeneratorKit"}, // 1.04%
			{9965.21739130434, "Exile_Item_FloodLightKit"}, // 1.04%
			{10000, "Exile_Item_ThermalScannerPro"} // 0.35%
		};
	};

	/**
	  Result of 100 rounds:

	  Exile_Item_LightBulb
	  Exile_Item_LightBulb
	  Exile_Item_BaseCameraKit
	  Exile_Item_BaseCameraKit
	  Exile_Item_FloodLightKit
	  Exile_Item_FloodLightKit
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_BaseCameraKit
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PortableGeneratorKit
	  Exile_Item_FloodLightKit
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Handsaw
	  Exile_Item_JunkMetal
	  Exile_Item_LightBulb
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	  Exile_Item_MetalBoard
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_ToiletPaper
	  Exile_Melee_Axe
	  Exile_Item_Rope
	  Exile_Item_ToiletPaper
	  Exile_Item_Handsaw
	  Exile_Item_Handsaw
	  Exile_Item_Grinder
	  Exile_Item_FloodLightKit
	  Exile_Melee_Axe
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ExtensionCord
	  Exile_Item_LightBulb
	  Exile_Item_BaseCameraKit
	  Exile_Item_BaseCameraKit
	  Exile_Item_Laptop
	  Exile_Item_PortableGeneratorKit
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	  Exile_Item_JunkMetal
	  Exile_Item_BaseCameraKit
	  Exile_Item_ToiletPaper
	  Exile_Item_Pliers
	  Exile_Item_Handsaw
	  Exile_Item_Can_Empty
	  Exile_Item_LightBulb
	  Exile_Item_CamoTentKit
	  Exile_Item_Handsaw
	  Exile_Item_FloodLightKit
	  Exile_Item_Can_Empty
	  Exile_Item_Handsaw
	  Exile_Item_ToiletPaper
	  Exile_Melee_Axe
	  Exile_Item_Can_Empty
	  Exile_Item_JunkMetal
	  Exile_Item_Pliers
	  Exile_Item_ToiletPaper
	  Exile_Item_Pliers
	  Exile_Item_JunkMetal
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Pliers
	  Exile_Item_Handsaw
	  Exile_Item_PlasticBottleEmpty
	  Exile_Melee_Axe
	  Exile_Item_Pliers
	  Exile_Melee_Axe
	  Exile_Item_ExtensionCord
	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ToiletPaper
	  Exile_Item_CamoTentKit
	  Exile_Item_Can_Empty
	  Exile_Item_ToiletPaper
	  Exile_Melee_Axe
	  Exile_Item_ExtensionCord
	  Exile_Item_BaseCameraKit
	  Exile_Item_JunkMetal
	  Exile_Item_CamoTentKit
	  Exile_Melee_Axe
	  Exile_Item_JunkMetal
	  Exile_Item_Can_Empty
	  Exile_Item_Grinder
	  Exile_Item_Grinder
	  Exile_Item_JunkMetal
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_LightBulb
	  Exile_Item_LightBulb
	  Exile_Item_Laptop
	  Exile_Item_LightBulb
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_BaseCameraKit
	  Exile_Item_JunkMetal
	  Exile_Item_ToiletPaper
	  Exile_Item_ExtensionCord
	  Exile_Item_CamoTentKit
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	*/
	class Factories
	{
		count = 18;
		half = 8600;
		halfIndex = 9;
		sum = 10000;
		items[] = 
		{
			{1333.33333333333, "Exile_Item_Can_Empty"}, // 13.33%
			{2666.66666666667, "Exile_Item_ToiletPaper"}, // 13.33%
			{4000, "Exile_Item_PlasticBottleEmpty"}, // 13.33%
			{5100, "Exile_Melee_Axe"}, // 11.00%
			{5900, "Exile_Item_BaseCameraKit"}, // 8.00%
			{6550, "Exile_Item_Pliers"}, // 6.50%
			{7200, "Exile_Item_Handsaw"}, // 6.50%
			{7750, "Exile_Item_JunkMetal"}, // 5.50%
			{8200, "Exile_Item_LightBulb"}, // 4.50%
			{8600, "Exile_Item_ExtensionCord"}, // 4.00%
			{8850, "Exile_Item_Grinder"}, // 2.50%
			{9050, "Exile_Item_MetalBoard"}, // 2.00%
			{9250, "Exile_Item_CamoTentKit"}, // 2.00%
			{9450, "Exile_Item_Rope"}, // 2.00%
			{9650, "Exile_Item_Laptop"}, // 2.00%
			{9800, "Exile_Item_PortableGeneratorKit"}, // 1.50%
			{9950, "Exile_Item_FloodLightKit"}, // 1.50%
			{10000, "Exile_Item_ThermalScannerPro"} // 0.50%
		};
	};

	/**
	  Result of 100 rounds:

	  FlareGreen_F
	  FlareGreen_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_FloodLightKit
	  Exile_Item_CamoTentKit
	  Exile_Item_FuelCanisterFull
	  Exile_Melee_Axe
	  Exile_Item_FuelCanisterFull
	  Exile_Item_Rope
	  Exile_Item_PortableGeneratorKit
	  Exile_Item_FuelCanisterFull
	  Exile_Item_DuctTape
	  FlareGreen_F
	  FlareYellow_F
	  Exile_Item_FuelCanisterFull
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_JunkMetal
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_ToiletPaper
	  Exile_Item_LightBulb
	  Exile_Item_FuelCanisterFull
	  Exile_Item_DuctTape
	  FlareWhite_F
	  Exile_Item_Pliers
	  Exile_Item_CamoTentKit
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Can_Empty
	  Exile_Item_Handsaw
	  FlareYellow_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Melee_Axe
	  Exile_Item_Grinder
	  Exile_Item_MetalBoard
	  Exile_Item_FuelCanisterFull
	  Exile_Item_FuelCanisterEmpty
	  FlareRed_F
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_FuelCanisterFull
	  Exile_Melee_Axe
	  Exile_Item_ZipTie
	  Exile_Item_FuelCanisterEmpty
	  FlareGreen_F
	  Exile_Item_LightBulb
	  Exile_Item_ZipTie
	  Exile_Item_PortableGeneratorKit
	  Exile_Item_FuelCanisterEmpty
	  FlareWhite_F
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_FuelCanisterEmpty
	  FlareRed_F
	  Exile_Item_ZipTie
	  Exile_Item_FuelCanisterEmpty
	  Exile_Melee_Axe
	  FlareWhite_F
	  Exile_Item_FuelCanisterFull
	  Exile_Melee_Axe
	  FlareWhite_F
	  Exile_Item_FuelCanisterFull
	  Exile_Item_ToiletPaper
	  Exile_Melee_Axe
	  Exile_Item_ToiletPaper
	  Exile_Item_Handsaw
	  Exile_Item_FuelCanisterFull
	  Exile_Item_FuelCanisterFull
	  Exile_Item_Can_Empty
	  Exile_Item_FuelCanisterFull
	  Exile_Item_LightBulb
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_ToiletPaper
	  Exile_Item_Handsaw
	  Exile_Item_PlasticBottleEmpty
	  FlareRed_F
	  Exile_Item_LightBulb
	  Exile_Item_ToiletPaper
	  FlareRed_F
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_Pliers
	  Exile_Item_Pliers
	  FlareGreen_F
	  Exile_Item_FuelCanisterFull
	  Exile_Item_Can_Empty
	  FlareGreen_F
	  FlareGreen_F
	  Exile_Item_ExtensionCord
	  FlareYellow_F
	  Exile_Item_Can_Empty
	  Exile_Item_PlasticBottleEmpty
	  FlareRed_F
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_Handsaw
	  Exile_Item_LightBulb
	  Exile_Item_FuelCanisterEmpty
	  Exile_Item_FuelCanisterEmpty
	*/
	class VehicleService
	{
		count = 24;
		half = 8586.95652173913;
		halfIndex = 12;
		sum = 10000;
		items[] = 
		{
			{1739.13043478261, "Exile_Item_FuelCanisterEmpty"}, // 17.39%
			{3130.4347826087, "Exile_Item_FuelCanisterFull"}, // 13.91%
			{4000, "Exile_Item_Can_Empty"}, // 8.70%
			{4869.5652173913, "Exile_Item_ToiletPaper"}, // 8.70%
			{5739.13043478261, "Exile_Item_PlasticBottleEmpty"}, // 8.70%
			{6217.39130434783, "Exile_Melee_Axe"}, // 4.78%
			{6652.17391304348, "Exile_Item_ZipTie"}, // 4.35%
			{7000, "Exile_Item_DuctTape"}, // 3.48%
			{7326.08695652174, "FlareWhite_F"}, // 3.26%
			{7652.17391304348, "FlareRed_F"}, // 3.26%
			{7978.26086956522, "FlareGreen_F"}, // 3.26%
			{8304.34782608696, "FlareYellow_F"}, // 3.26%
			{8586.95652173913, "Exile_Item_Handsaw"}, // 2.83%
			{8869.5652173913, "Exile_Item_Pliers"}, // 2.83%
			{9108.69565217391, "Exile_Item_JunkMetal"}, // 2.39%
			{9304.34782608696, "Exile_Item_LightBulb"}, // 1.96%
			{9478.26086956522, "Exile_Item_ExtensionCord"}, // 1.74%
			{9586.95652173913, "Exile_Item_Grinder"}, // 1.09%
			{9673.91304347826, "Exile_Item_MetalBoard"}, // 0.87%
			{9760.86956521739, "Exile_Item_Rope"}, // 0.87%
			{9847.82608695652, "Exile_Item_CamoTentKit"}, // 0.87%
			{9913.04347826087, "Exile_Item_FloodLightKit"}, // 0.65%
			{9978.26086956522, "Exile_Item_PortableGeneratorKit"}, // 0.65%
			{10000, "Exile_Item_ThermalScannerPro"} // 0.22%
		};
	};

	/**
	  Result of 100 rounds:

	  V_PlateCarrierGL_rgr
	  V_PlateCarrierGL_rgr
	  150Rnd_93x64_Mag
	  MiniGrenade
	  H_HelmetB_plain_blk
	  H_HelmetB_light
	  Exile_Item_ToiletPaper
	  APERSBoundingMine_Range_Mag
	  Exile_Item_ToiletPaper
	  U_O_OfficerUniform_ocamo
	  H_TurbanO_blk
	  Exile_Item_ToiletPaper
	  IEDLandSmall_Remote_Mag
	  arifle_MX_F
	  5Rnd_127x108_Mag
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	  srifle_DMR_02_camo_F
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_PlasticBottleEmpty
	  V_BandollierB_oli
	  Exile_Item_ToiletPaper
	  10Rnd_338_Mag
	  UGL_FlareYellow_F
	  optic_KHS_tan
	  H_HelmetSpecB_paint1
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PlasticBottleEmpty
	  V_PlateCarrier1_rgr
	  muzzle_snds_338_black
	  MiniGrenade
	  LMG_Mk200_F
	  3Rnd_SmokeGreen_Grenade_shell
	  H_Booniehat_tan
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	  B_Bergen_sgg
	  Exile_Item_Vishpirin
	  Exile_Item_ToiletPaper
	  Rangefinder
	  DemoCharge_Remote_Mag
	  Exile_Item_Can_Empty
	  U_B_CombatUniform_mcam_tshirt
	  V_HarnessO_brn
	  DemoCharge_Remote_Mag
	  H_BandMask_khk
	  Exile_Item_Can_Empty
	  UGL_FlareWhite_F
	  Exile_Item_Can_Empty
	  1Rnd_HE_Grenade_shell
	  Exile_Item_Can_Empty
	  B_Bergen_sgg
	  U_IG_Guerilla2_1
	  Exile_Item_Can_Empty
	  3Rnd_HE_Grenade_shell
	  B_Carryall_oucamo
	  Exile_Item_ToiletPaper
	  LMG_Zafir_F
	  B_Carryall_oli
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Rangefinder
	  Exile_Item_PlasticBottleEmpty
	  optic_Arco
	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ToiletPaper
	  V_HarnessO_brn
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_PlasticBottleEmpty
	  1Rnd_SmokeBlue_Grenade_shell
	  Exile_Item_Vishpirin
	  SmokeShellYellow
	  Exile_Item_InstaDoc
	  Exile_Item_PlasticBottleEmpty
	  SmokeShellPurple
	  Exile_Item_Can_Empty
	  30Rnd_65x39_caseless_green_mag_Tracer
	  V_PlateCarrier1_blk
	  V_PlateCarrierSpec_blk
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  U_B_CTRG_2
	  U_B_CTRG_2
	  V_Chestrig_blk
	  muzzle_snds_338_sand
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ZipTie
	  B_Carryall_ocamo
	  Exile_Item_Can_Empty
	  optic_Holosight
	  bipod_01_F_mtp
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	*/
	class Military
	{
		count = 337;
		half = 9071.22307938943;
		halfIndex = 168;
		sum = 9999.99999999997;
		items[] = 
		{
			{1650.16501650165, "Exile_Item_Can_Empty"}, // 16.50%
			{3300.3300330033, "Exile_Item_ToiletPaper"}, // 16.50%
			{4950.49504950495, "Exile_Item_PlasticBottleEmpty"}, // 16.50%
			{5050, "1Rnd_HE_Grenade_shell"}, // 1.00%
			{5149.0099009901, "ItemCompass"}, // 0.99%
			{5248.0198019802, "Exile_Item_ZipTie"}, // 0.99%
			{5322.27722772277, "HandGrenade"}, // 0.74%
			{5396.53465346535, "MiniGrenade"}, // 0.74%
			{5455.94059405941, "ItemRadio"}, // 0.59%
			{5515.34653465346, "ItemWatch"}, // 0.59%
			{5573.58765288293, "Exile_Item_Vishpirin"}, // 0.58%
			{5624.08270238789, "150Rnd_93x64_Mag"}, // 0.50%
			{5673.58765288293, "APERSTripMine_Wire_Mag"}, // 0.50%
			{5723.09260337798, "arifle_MX_SW_Black_F"}, // 0.50%
			{5772.59755387303, "APERSBoundingMine_Range_Mag"}, // 0.50%
			{5822.10250436808, "LMG_Mk200_F"}, // 0.50%
			{5871.60745486313, "arifle_MX_SW_F"}, // 0.50%
			{5921.11240535818, "NVGoggles"}, // 0.50%
			{5970.61735585323, "Rangefinder"}, // 0.50%
			{6020.12230634828, "LMG_Zafir_F"}, // 0.50%
			{6069.62725684333, "APERSMine_Range_Mag"}, // 0.50%
			{6118.63715783343, "3Rnd_HE_Grenade_shell"}, // 0.49%
			{6160.22131624927, "srifle_DMR_01_F"}, // 0.42%
			{6201.80547466511, "srifle_EBR_F"}, // 0.42%
			{6241.40943506115, "U_IG_Guerilla2_3"}, // 0.40%
			{6281.01339545719, "U_IG_Guerilla2_2"}, // 0.40%
			{6320.61735585323, "U_IG_Guerilla2_1"}, // 0.40%
			{6360.22131624927, "U_IG_Guerilla1_1"}, // 0.40%
			{6399.82527664531, "ItemGPS"}, // 0.40%
			{6439.42923704135, "Binocular"}, // 0.40%
			{6476.55794991264, "U_IG_Guerilla3_2"}, // 0.37%
			{6513.68666278393, "U_IG_Guerilla3_1"}, // 0.37%
			{6546.35993011066, "srifle_GM6_F"}, // 0.33%
			{6579.03319743739, "srifle_LRR_F"}, // 0.33%
			{6608.73616773442, "IEDUrbanSmall_Remote_Mag"}, // 0.30%
			{6638.43913803145, "DemoCharge_Remote_Mag"}, // 0.30%
			{6668.14210832848, "IEDLandSmall_Remote_Mag"}, // 0.30%
			{6697.26266744321, "Exile_Item_Bandage"}, // 0.29%
			{6725.48048922539, "B_Carryall_cbr"}, // 0.28%
			{6753.27274213489, "10Rnd_338_Mag"}, // 0.28%
			{6781.06499504439, "10Rnd_93x64_DMR_05_Mag"}, // 0.28%
			{6808.78776732162, "10Rnd_762x51_Mag"}, // 0.28%
			{6836.51053959885, "20Rnd_762x51_Mag"}, // 0.28%
			{6864.23331187608, "B_FieldPack_oucamo"}, // 0.28%
			{6891.95608415331, "B_FieldPack_cbr"}, // 0.28%
			{6919.67885643053, "B_FieldPack_blk"}, // 0.28%
			{6947.40162870776, "B_FieldPack_ocamo"}, // 0.28%
			{6974.67986673565, "optic_DMS"}, // 0.27%
			{7001.41254000297, "B_Carryall_khk"}, // 0.27%
			{7028.1452132703, "B_Carryall_oli"}, // 0.27%
			{7054.41314618604, "optic_LRPS"}, // 0.26%
			{7080.68107910178, "optic_SOS"}, // 0.26%
			{7105.92860385426, "UGL_FlareRed_F"}, // 0.25%
			{7131.17612860673, "UGL_FlareYellow_F"}, // 0.25%
			{7156.42365335921, "UGL_FlareWhite_F"}, // 0.25%
			{7181.67117811168, "UGL_FlareGreen_F"}, // 0.25%
			{7206.42365335921, "arifle_Katiba_F"}, // 0.25%
			{7230.74187465502, "10Rnd_127x54_Mag"}, // 0.24%
			{7254.19158804741, "30Rnd_556x45_Stanag"}, // 0.23%
			{7277.6413014398, "30Rnd_65x39_caseless_green"}, // 0.23%
			{7299.91852916257, "B_Carryall_oucamo"}, // 0.22%
			{7322.19575688535, "SmokeShellOrange"}, // 0.22%
			{7344.47298460812, "B_Carryall_ocamo"}, // 0.22%
			{7366.75021233089, "SmokeShellBlue"}, // 0.22%
			{7389.02744005366, "B_Carryall_mcamo"}, // 0.22%
			{7410.80961827149, "B_Bergen_mcamo"}, // 0.22%
			{7432.59179648931, "B_Bergen_sgg"}, // 0.22%
			{7454.37397470713, "B_Bergen_blk"}, // 0.22%
			{7476.15615292495, "B_Bergen_rgr"}, // 0.22%
			{7497.15825313497, "acc_flashlight"}, // 0.21%
			{7517.95033234289, "SmokeShellPurple"}, // 0.21%
			{7538.74241155081, "V_PlateCarrierSpec_rgr"}, // 0.21%
			{7559.53449075874, "SmokeShell"}, // 0.21%
			{7580.32656996666, "SmokeShellRed"}, // 0.21%
			{7601.11864917458, "SmokeShellGreen"}, // 0.21%
			{7621.9107283825, "SmokeShellYellow"}, // 0.21%
			{7641.71270858052, "arifle_TRG20_F"}, // 0.20%
			{7661.51468877854, "arifle_Katiba_GL_F"}, // 0.20%
			{7681.31666897656, "arifle_TRG21_F"}, // 0.20%
			{7701.11864917458, "arifle_MX_F"}, // 0.20%
			{7720.9206293726, "arifle_MXC_F"}, // 0.20%
			{7740.22756006567, "V_PlateCarrierSpec_mtp"}, // 0.19%
			{7759.53449075874, "V_PlateCarrierSpec_blk"}, // 0.19%
			{7778.73028788947, "muzzle_snds_B"}, // 0.19%
			{7797.83746176475, "20Rnd_762x51_Mag"}, // 0.19%
			{7815.65924394297, "V_PlateCarrierGL_rgr"}, // 0.18%
			{7833.48102612119, "V_PlateCarrierIAGL_dgtl"}, // 0.18%
			{7851.30280829941, "V_PlateCarrierIAGL_oli"}, // 0.18%
			{7869.12459047763, "V_PlateCarrierGL_blk"}, // 0.18%
			{7886.94637265584, "V_PlateCarrierGL_mtp"}, // 0.18%
			{7904.27310532911, "U_B_CTRG_3"}, // 0.17%
			{7921.59983800238, "arifle_Mk20_F"}, // 0.17%
			{7938.92657067565, "arifle_Mk20C_F"}, // 0.17%
			{7956.25330334891, "U_B_CTRG_2"}, // 0.17%
			{7973.58003602218, "U_B_CombatUniform_mcam_tshirt"}, // 0.17%
			{7990.90676869545, "U_B_CombatUniform_mcam_vest"}, // 0.17%
			{8008.23350136872, "U_B_CTRG_1"}, // 0.17%
			{8025.56023404198, "U_B_CombatUniform_mcam_worn"}, // 0.17%
			{8042.75669052974, "20Rnd_556x45_UW_mag"}, // 0.17%
			{8059.58837369806, "7Rnd_408_Mag"}, // 0.17%
			{8076.42005686637, "V_RebreatherIA"}, // 0.17%
			{8093.25174003469, "U_I_GhillieSuit"}, // 0.17%
			{8110.08342320301, "5Rnd_127x108_Mag"}, // 0.17%
			{8126.58507336802, "muzzle_snds_B"}, // 0.17%
			{8143.08672353304, "muzzle_snds_93mmg_tan"}, // 0.17%
			{8159.58837369806, "muzzle_snds_93mmg"}, // 0.17%
			{8176.09002386307, "muzzle_snds_338_sand"}, // 0.17%
			{8192.59167402809, "muzzle_snds_338_green"}, // 0.17%
			{8209.09332419311, "muzzle_snds_338_black"}, // 0.17%
			{8225.42995785647, "V_RebreatherIR"}, // 0.16%
			{8241.76659151984, "V_RebreatherB"}, // 0.16%
			{8258.1032251832, "U_B_GhillieSuit"}, // 0.16%
			{8274.43985884657, "U_O_GhillieSuit"}, // 0.16%
			{8290.49551846659, "srifle_DMR_05_tan_F"}, // 0.16%
			{8306.5511780866, "srifle_DMR_05_blk_F"}, // 0.16%
			{8322.60683770662, "srifle_DMR_05_hex_F"}, // 0.16%
			{8337.76141438878, "1Rnd_SmokeYellow_Grenade_shell"}, // 0.15%
			{8352.91599107094, "1Rnd_SmokeOrange_Grenade_shell"}, // 0.15%
			{8368.0705677531, "1Rnd_SmokeGreen_Grenade_shell"}, // 0.15%
			{8383.22514443525, "1Rnd_SmokeBlue_Grenade_shell"}, // 0.15%
			{8398.37972111741, "1Rnd_Smoke_Grenade_shell"}, // 0.15%
			{8413.53429779957, "1Rnd_SmokeRed_Grenade_shell"}, // 0.15%
			{8428.68887448173, "1Rnd_SmokePurple_Grenade_shell"}, // 0.15%
			{8443.69037463174, "muzzle_snds_M"}, // 0.15%
			{8458.69187478176, "muzzle_snds_H"}, // 0.15%
			{8473.69337493177, "optic_Arco"}, // 0.15%
			{8488.69487508178, "optic_DMS"}, // 0.15%
			{8503.6963752318, "optic_Hamr"}, // 0.15%
			{8518.69787538181, "optic_MRCO"}, // 0.15%
			{8533.69937553183, "acc_pointer_IR"}, // 0.15%
			{8548.70087568184, "optic_Holosight"}, // 0.15%
			{8563.55236083036, "V_PlateCarrier1_rgr"}, // 0.15%
			{8578.40384597887, "V_PlateCarrier2_rgr"}, // 0.15%
			{8593.25533112738, "arifle_SDAR_F"}, // 0.15%
			{8608.1068162759, "V_PlateCarrier3_rgr"}, // 0.15%
			{8622.95830142441, "arifle_MXM_F"}, // 0.15%
			{8637.80978657293, "V_PlateCarrier1_blk"}, // 0.15%
			{8652.66127172144, "V_PlateCarrierGL_rgr"}, // 0.15%
			{8667.51275686996, "V_PlateCarrierIA1_dgtl"}, // 0.15%
			{8682.36424201847, "V_PlateCarrierIA2_dgtl"}, // 0.15%
			{8697.21572716698, "V_PlateCarrierIAGL_dgtl"}, // 0.15%
			{8712.0672123155, "V_PlateCarrierSpec_rgr"}, // 0.15%
			{8726.21148388551, "optic_KHS_old"}, // 0.14%
			{8740.35575545553, "optic_KHS_hex"}, // 0.14%
			{8754.50002702554, "optic_KHS_tan"}, // 0.14%
			{8768.64429859555, "optic_AMS_snd"}, // 0.14%
			{8782.78857016557, "optic_AMS_khk"}, // 0.14%
			{8796.93284173558, "optic_AMS"}, // 0.14%
			{8811.0771133056, "optic_KHS_blk"}, // 0.14%
			{8825.14694134103, "30Rnd_65x39_caseless_green_mag_Tracer"}, // 0.14%
			{8839.21676937647, "30Rnd_65x39_caseless_mag"}, // 0.14%
			{8853.2865974119, "30Rnd_65x39_caseless_mag_Tracer"}, // 0.14%
			{8867.35642544734, "30Rnd_556x45_Stanag_Tracer_Yellow"}, // 0.14%
			{8881.42625348277, "30Rnd_556x45_Stanag_Tracer_Red"}, // 0.14%
			{8895.49608151821, "30Rnd_556x45_Stanag_Tracer_Green"}, // 0.14%
			{8909.54478368572, "srifle_DMR_04_F"}, // 0.14%
			{8923.59348585324, "srifle_DMR_04_Tan_F"}, // 0.14%
			{8936.15444344153, "bipod_02_F_blk"}, // 0.13%
			{8948.71540102983, "bipod_01_F_snd"}, // 0.13%
			{8961.27635861812, "bipod_01_F_blk"}, // 0.13%
			{8973.83731620642, "bipod_03_F_blk"}, // 0.13%
			{8986.39827379472, "bipod_02_F_tan"}, // 0.13%
			{8998.95923138301, "bipod_03_F_oli"}, // 0.13%
			{9011.33546900677, "U_B_CombatUniform_mcam"}, // 0.12%
			{9023.37721372179, "srifle_DMR_02_camo_F"}, // 0.12%
			{9035.4189584368, "srifle_DMR_02_sniper_F"}, // 0.12%
			{9047.46070315181, "srifle_DMR_02_F"}, // 0.12%
			{9059.34189127062, "100Rnd_65x39_caseless_mag"}, // 0.12%
			{9071.22307938943, "3Rnd_UGL_FlareGreen_F"}, // 0.12%
			{9083.10426750825, "150Rnd_762x54_Box"}, // 0.12%
			{9094.98545562706, "3Rnd_UGL_FlareRed_F"}, // 0.12%
			{9106.86664374587, "3Rnd_UGL_FlareWhite_F"}, // 0.12%
			{9118.74783186468, "3Rnd_UGL_FlareYellow_F"}, // 0.12%
			{9130.56990959484, "bipod_02_F_hex"}, // 0.12%
			{9142.39198732501, "bipod_01_F_mtp"}, // 0.12%
			{9154.0402109709, "Exile_Item_InstaDoc"}, // 0.12%
			{9164.43625057486, "V_HarnessO_gry"}, // 0.10%
			{9174.83229017882, "V_BandollierB_khk"}, // 0.10%
			{9185.22832978278, "V_BandollierB_cbr"}, // 0.10%
			{9195.62436938674, "V_HarnessOSpec_gry"}, // 0.10%
			{9206.0204089907, "V_HarnessOSpec_brn"}, // 0.10%
			{9216.41644859466, "V_HarnessOGL_gry"}, // 0.10%
			{9226.81248819862, "V_BandollierB_rgr"}, // 0.10%
			{9237.20852780258, "V_HarnessOGL_brn"}, // 0.10%
			{9247.60456740654, "V_HarnessO_brn"}, // 0.10%
			{9258.0006070105, "V_BandollierB_blk"}, // 0.10%
			{9268.39664661446, "V_BandollierB_oli"}, // 0.10%
			{9278.29763671347, "5Rnd_127x108_APDS_Mag"}, // 0.10%
			{9288.19862681248, "arifle_TRG21_GL_F"}, // 0.10%
			{9298.09961691149, "150Rnd_762x54_Box_Tracer"}, // 0.10%
			{9308.0006070105, "100Rnd_65x39_caseless_mag_Tracer"}, // 0.10%
			{9317.90159710951, "arifle_MX_GL_F"}, // 0.10%
			{9327.80258720852, "arifle_Mk20_GL_F"}, // 0.10%
			{9337.70357730753, "SatchelCharge_Remote_Mag"}, // 0.10%
			{9347.60456740654, "U_B_PilotCoveralls"}, // 0.10%
			{9357.50555750555, "U_B_HeliPilotCoveralls"}, // 0.10%
			{9367.40654760456, "U_I_CombatUniform_shortsleeve"}, // 0.10%
			{9377.30753770357, "U_I_CombatUniform_tshirt"}, // 0.10%
			{9387.20852780258, "U_I_CombatUniform"}, // 0.10%
			{9397.10951790158, "U_I_pilotCoveralls"}, // 0.10%
			{9407.01050800059, "U_I_HeliPilotCoveralls"}, // 0.10%
			{9416.9114980996, "U_O_PilotCoveralls"}, // 0.10%
			{9426.81248819861, "U_IG_leader"}, // 0.10%
			{9434.31323827362, "optic_NVS"}, // 0.08%
			{9441.73898084788, "V_PlateCarrierL_CTRG"}, // 0.07%
			{9449.16472342214, "arifle_MX_Black_F"}, // 0.07%
			{9456.59046599639, "arifle_MXC_Black_F"}, // 0.07%
			{9464.01620857065, "V_Chestrig_khk"}, // 0.07%
			{9471.44195114491, "V_Chestrig_blk"}, // 0.07%
			{9478.86769371917, "V_Chestrig_oli"}, // 0.07%
			{9486.29343629343, "arifle_MXM_Black_F"}, // 0.07%
			{9493.71917886768, "arifle_MX_GL_Black_F"}, // 0.07%
			{9501.14492144194, "V_Chestrig_rgr"}, // 0.07%
			{9508.5706640162, "V_PlateCarrierH_CTRG"}, // 0.07%
			{9515.99640659046, "U_B_SpecopsUniform_sgg"}, // 0.07%
			{9522.05823726332, "3Rnd_SmokePurple_Grenade_shell"}, // 0.06%
			{9528.12006793618, "3Rnd_Smoke_Grenade_shell"}, // 0.06%
			{9534.18189860905, "3Rnd_SmokeBlue_Grenade_shell"}, // 0.06%
			{9540.24372928191, "3Rnd_SmokeGreen_Grenade_shell"}, // 0.06%
			{9546.30555995477, "3Rnd_SmokeOrange_Grenade_shell"}, // 0.06%
			{9552.36739062764, "3Rnd_SmokeYellow_Grenade_shell"}, // 0.06%
			{9558.4292213005, "3Rnd_SmokeRed_Grenade_shell"}, // 0.06%
			{9564.450093658, "srifle_DMR_06_camo_F"}, // 0.06%
			{9570.47096601551, "srifle_DMR_06_olive_F"}, // 0.06%
			{9576.49183837301, "srifle_DMR_03_woodland_F"}, // 0.06%
			{9582.51271073052, "srifle_DMR_03_tan_F"}, // 0.06%
			{9588.53358308802, "srifle_DMR_03_khaki_F"}, // 0.06%
			{9594.55445544553, "srifle_DMR_03_F"}, // 0.06%
			{9600.49504950494, "H_Booniehat_khk"}, // 0.06%
			{9606.43564356434, "H_Booniehat_khk_hs"}, // 0.06%
			{9612.37623762375, "H_MilCap_dgtl"}, // 0.06%
			{9618.31683168315, "H_MilCap_rucamo"}, // 0.06%
			{9624.25742574256, "H_MilCap_blue"}, // 0.06%
			{9630.19801980197, "H_MilCap_oucamo"}, // 0.06%
			{9636.13861386137, "H_MilCap_mcamo"}, // 0.06%
			{9642.07920792078, "H_Booniehat_indp"}, // 0.06%
			{9648.01980198018, "H_Booniehat_mcamo"}, // 0.06%
			{9653.96039603959, "H_Booniehat_tan"}, // 0.06%
			{9659.900990099, "H_Booniehat_dirty"}, // 0.06%
			{9665.8415841584, "H_Booniehat_dgtl"}, // 0.06%
			{9671.78217821781, "H_Booniehat_grn"}, // 0.06%
			{9677.72277227722, "H_MilCap_ocamo"}, // 0.06%
			{9683.66336633662, "U_I_FullGhillie_sard"}, // 0.06%
			{9689.10891089108, "U_I_FullGhillie_lsh"}, // 0.05%
			{9694.55445544553, "U_I_FullGhillie_ard"}, // 0.05%
			{9699.99999999999, "U_O_FullGhillie_sard"}, // 0.05%
			{9705.44554455444, "U_O_FullGhillie_lsh"}, // 0.05%
			{9710.8910891089, "U_O_FullGhillie_ard"}, // 0.05%
			{9716.33663366335, "U_B_FullGhillie_sard"}, // 0.05%
			{9721.78217821781, "U_B_FullGhillie_lsh"}, // 0.05%
			{9727.22772277226, "U_B_FullGhillie_ard"}, // 0.05%
			{9732.17821782177, "U_I_Wetsuit"}, // 0.05%
			{9737.12871287127, "U_I_G_resistanceLeader_F"}, // 0.05%
			{9742.07920792078, "U_O_OfficerUniform_ocamo"}, // 0.05%
			{9747.02970297028, "U_I_OfficerUniform"}, // 0.05%
			{9751.98019801979, "U_B_Wetsuit"}, // 0.05%
			{9756.93069306929, "U_O_Wetsuit"}, // 0.05%
			{9761.8811881188, "130Rnd_338_Mag"}, // 0.05%
			{9766.8316831683, "U_O_CombatUniform_ocamo"}, // 0.05%
			{9771.78217821781, "U_O_CombatUniform_oucamo"}, // 0.05%
			{9776.73267326731, "U_O_SpecopsUniform_ocamo"}, // 0.05%
			{9781.68316831682, "U_O_SpecopsUniform_blk"}, // 0.05%
			{9786.13861386137, "H_Bandanna_khk"}, // 0.04%
			{9790.59405940592, "H_Bandanna_khk_hs"}, // 0.04%
			{9795.04950495048, "H_Bandanna_cbr"}, // 0.04%
			{9799.50495049503, "H_Bandanna_sgg"}, // 0.04%
			{9803.96039603959, "H_Bandanna_gry"}, // 0.04%
			{9808.41584158414, "H_Bandanna_camo"}, // 0.04%
			{9812.8712871287, "H_Bandanna_mcamo"}, // 0.04%
			{9817.32673267325, "V_I_G_resistanceLeader_F"}, // 0.04%
			{9821.7821782178, "H_BandMask_blk"}, // 0.04%
			{9826.23762376236, "H_Cap_khaki_specops_UK"}, // 0.04%
			{9830.69306930691, "H_HelmetSpecB"}, // 0.04%
			{9835.14851485147, "H_HelmetB_light"}, // 0.04%
			{9839.60396039602, "H_HelmetB_paint"}, // 0.04%
			{9844.05940594057, "H_HelmetB"}, // 0.04%
			{9848.51485148513, "H_HelmetSpecB_paint1"}, // 0.04%
			{9852.97029702968, "H_HelmetSpecB_paint2"}, // 0.04%
			{9857.42574257424, "H_HelmetSpecB_blk"}, // 0.04%
			{9861.88118811879, "H_Hat_camo"}, // 0.04%
			{9866.33663366334, "H_Cap_brn_SPECOPS"}, // 0.04%
			{9870.7920792079, "H_Cap_tan_specops_US"}, // 0.04%
			{9875.24752475245, "H_HelmetIA"}, // 0.04%
			{9879.70297029701, "H_Watchcap_blk"}, // 0.04%
			{9884.15841584156, "H_Watchcap_khk"}, // 0.04%
			{9888.61386138611, "H_HelmetB_plain_blk"}, // 0.04%
			{9891.58415841582, "H_HelmetIA_net"}, // 0.03%
			{9894.55445544552, "H_HelmetB_grass"}, // 0.03%
			{9897.52475247522, "H_HelmetB_black"}, // 0.03%
			{9900.49504950492, "H_HelmetB_desert"}, // 0.03%
			{9903.46534653463, "H_HelmetB_sand"}, // 0.03%
			{9906.43564356433, "H_HelmetB_light_grass"}, // 0.03%
			{9909.40594059403, "H_HelmetB_light_snakeskin"}, // 0.03%
			{9912.37623762373, "H_HelmetB_light_desert"}, // 0.03%
			{9915.34653465343, "H_BandMask_demon"}, // 0.03%
			{9918.31683168314, "H_BandMask_reaper"}, // 0.03%
			{9921.28712871284, "H_BandMask_khk"}, // 0.03%
			{9924.25742574254, "H_HelmetB_snakeskin"}, // 0.03%
			{9927.22772277224, "H_HelmetIA_camo"}, // 0.03%
			{9930.19801980194, "H_HelmetB_light_sand"}, // 0.03%
			{9933.16831683165, "H_ShemagOpen_khk"}, // 0.03%
			{9936.13861386135, "H_Shemag_olive_hs"}, // 0.03%
			{9939.10891089105, "H_Shemag_olive"}, // 0.03%
			{9942.07920792075, "H_Shemag_tan"}, // 0.03%
			{9945.04950495046, "H_Shemag_khk"}, // 0.03%
			{9948.01980198016, "H_TurbanO_blk"}, // 0.03%
			{9950.99009900986, "H_Watchcap_sgg"}, // 0.03%
			{9953.96039603956, "H_Watchcap_camo"}, // 0.03%
			{9956.93069306926, "H_HelmetB_light_black"}, // 0.03%
			{9959.90099009897, "H_ShemagOpen_tan"}, // 0.03%
			{9961.38613861382, "H_HelmetB_camo"}, // 0.01%
			{9962.87128712867, "H_PilotHelmetHeli_I"}, // 0.01%
			{9964.35643564352, "H_PilotHelmetHeli_O"}, // 0.01%
			{9965.84158415837, "H_PilotHelmetHeli_B"}, // 0.01%
			{9967.32673267323, "H_HelmetCrew_O"}, // 0.01%
			{9968.81188118808, "H_PilotHelmetFighter_O"}, // 0.01%
			{9970.29702970293, "H_PilotHelmetFighter_B"}, // 0.01%
			{9971.78217821778, "H_HelmetCrew_I"}, // 0.01%
			{9973.26732673263, "H_CrewHelmetHeli_B"}, // 0.01%
			{9974.75247524749, "H_HelmetCrew_B"}, // 0.01%
			{9976.23762376234, "H_PilotHelmetFighter_I"}, // 0.01%
			{9977.72277227719, "H_CrewHelmetHeli_O"}, // 0.01%
			{9979.20792079204, "H_HelmetO_oucamo"}, // 0.01%
			{9980.69306930689, "H_Beret_brn_SF"}, // 0.01%
			{9982.17821782175, "H_Beret_grn_SF"}, // 0.01%
			{9983.6633663366, "H_Beret_grn"}, // 0.01%
			{9985.14851485145, "H_HelmetLeaderO_oucamo"}, // 0.01%
			{9986.6336633663, "H_HelmetSpecO_ocamo"}, // 0.01%
			{9988.11881188115, "H_HelmetSpecO_blk"}, // 0.01%
			{9989.60396039601, "H_HelmetO_ocamo"}, // 0.01%
			{9991.08910891086, "H_HelmetLeaderO_ocamo"}, // 0.01%
			{9992.57425742571, "H_Beret_Colonel"}, // 0.01%
			{9994.05940594056, "H_Beret_red"}, // 0.01%
			{9995.54455445541, "H_Beret_blk"}, // 0.01%
			{9997.02970297027, "H_Beret_02"}, // 0.01%
			{9998.51485148512, "H_CrewHelmetHeli_I"}, // 0.01%
			{9999.99999999997, "H_Beret_ocamo"} // 0.01%
		};
	};

	/**
	  Result of 100 rounds:

	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_Bandage
	  Exile_Item_Bandage
	  Exile_Item_InstaDoc
	  Exile_Item_InstaDoc
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_Vishpirin
	  Exile_Item_InstaDoc
	  Exile_Item_InstaDoc
	  Exile_Item_Vishpirin
	  Exile_Item_Can_Empty
	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_InstaDoc
	  Exile_Item_Vishpirin
	  Exile_Item_Can_Empty
	  Exile_Item_Can_Empty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_InstaDoc
	  Exile_Item_Bandage
	  Exile_Item_Vishpirin
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Bandage
	  Exile_Item_Bandage
	  Exile_Item_InstaDoc
	  Exile_Item_InstaDoc
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_ToiletPaper
	  Exile_Item_Bandage
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_Can_Empty
	  Exile_Item_Vishpirin
	  Exile_Item_ToiletPaper
	  Exile_Item_InstaDoc
	  Exile_Item_Can_Empty
	  Exile_Item_InstaDoc
	  Exile_Item_Vishpirin
	  Exile_Item_Can_Empty
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_Vishpirin
	  Exile_Item_ToiletPaper
	  Exile_Item_Can_Empty
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_ToiletPaper
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_Can_Empty
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_Bandage
	  Exile_Item_Bandage
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_InstaDoc
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Bandage
	  Exile_Item_ToiletPaper
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Bandage
	  Exile_Item_ToiletPaper
	  Exile_Item_Vishpirin
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_ToiletPaper
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	  Exile_Item_ToiletPaper
	  Exile_Item_ToiletPaper
	  Exile_Item_InstaDoc
	  Exile_Item_ToiletPaper
	  Exile_Item_Vishpirin
	  Exile_Item_Bandage
	  Exile_Item_ToiletPaper
	  Exile_Item_Vishpirin
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_PlasticBottleEmpty
	  Exile_Item_Vishpirin
	  Exile_Item_Vishpirin
	*/
	class Medical
	{
		count = 6;
		half = 8176.47058823529;
		halfIndex = 3;
		sum = 10000;
		items[] = 
		{
			{4117.64705882353, "Exile_Item_Vishpirin"}, // 41.18%
			{6176.47058823529, "Exile_Item_Bandage"}, // 20.59%
			{7176.47058823529, "Exile_Item_Can_Empty"}, // 10.00%
			{8176.47058823529, "Exile_Item_ToiletPaper"}, // 10.00%
			{9176.47058823529, "Exile_Item_PlasticBottleEmpty"}, // 10.00%
			{10000, "Exile_Item_InstaDoc"} // 8.24%
		};
	};

	/**
	  Result of 100 rounds:

	  U_O_FullGhillie_ard
	  U_O_FullGhillie_ard
	  srifle_DMR_02_sniper_F
	  srifle_DMR_02_F
	  H_CrewHelmetHeli_B
	  H_HelmetSpecO_ocamo
	  srifle_DMR_05_tan_F
	  B_Carryall_oucamo
	  srifle_DMR_05_blk_F
	  H_BandMask_demon
	  H_PilotHelmetFighter_O
	  srifle_DMR_05_hex_F
	  srifle_DMR_03_woodland_F
	  U_I_FullGhillie_ard
	  optic_SOS
	  srifle_DMR_05_hex_F
	  srifle_LRR_F
	  srifle_GM6_F
	  srifle_DMR_01_F
	  H_HelmetSpecB_blk
	  srifle_DMR_01_F
	  srifle_DMR_01_F
	  srifle_LRR_F
	  srifle_DMR_04_F
	  H_HelmetB_plain_blk
	  Exile_Item_Vishpirin
	  srifle_DMR_06_camo_F
	  ItemGPS
	  7Rnd_408_Mag
	  H_HelmetLeaderO_oucamo
	  U_O_GhillieSuit
	  srifle_DMR_04_Tan_F
	  H_MilCap_blue
	  10Rnd_127x54_Mag
	  srifle_DMR_02_F
	  B_Carryall_oucamo
	  H_HelmetB_desert
	  H_HelmetB_light_desert
	  Exile_Item_Vishpirin
	  srifle_DMR_01_F
	  10Rnd_93x64_DMR_05_Mag
	  srifle_DMR_02_sniper_F
	  Exile_Item_ZipTie
	  B_Carryall_mcamo
	  srifle_DMR_03_tan_F
	  srifle_DMR_01_F
	  U_B_FullGhillie_ard
	  H_HelmetB_plain_blk
	  srifle_DMR_03_tan_F
	  H_PilotHelmetHeli_O
	  srifle_LRR_F
	  APERSMine_Range_Mag
	  srifle_LRR_F
	  U_B_GhillieSuit
	  srifle_DMR_01_F
	  10Rnd_93x64_DMR_05_Mag
	  Exile_Item_Bandage
	  srifle_LRR_F
	  ItemWatch
	  APERSBoundingMine_Range_Mag
	  srifle_DMR_05_tan_F
	  B_Carryall_mcamo
	  APERSTripMine_Wire_Mag
	  srifle_DMR_05_hex_F
	  U_O_GhillieSuit
	  B_Carryall_mcamo
	  B_Carryall_oli
	  H_MilCap_ocamo
	  Exile_Item_ZipTie
	  Exile_Item_ZipTie
	  HandGrenade
	  srifle_GM6_F
	  H_HelmetB_light
	  srifle_DMR_01_F
	  srifle_GM6_F
	  U_I_GhillieSuit
	  Exile_Item_InstaDoc
	  srifle_DMR_02_sniper_F
	  optic_DMS
	  H_HelmetIA
	  U_I_GhillieSuit
	  20Rnd_762x51_Mag
	  srifle_DMR_01_F
	  muzzle_snds_93mmg_tan
	  H_MilCap_dgtl
	  U_O_FullGhillie_lsh
	  Exile_Item_Vishpirin
	  HandGrenade
	  U_B_FullGhillie_lsh
	  U_B_FullGhillie_lsh
	  optic_AMS_snd
	  optic_LRPS
	  HandGrenade
	  srifle_DMR_02_camo_F
	  U_I_FullGhillie_sard
	  srifle_LRR_F
	  H_MilCap_blue
	  H_HelmetIA
	  srifle_EBR_F
	  srifle_EBR_F
	*/
	class Tourist
	{
		count = 128;
		half = 8618.62799856785;
		halfIndex = 64;
		sum = 10000;
		items[] = 
		{
			{560, "srifle_DMR_01_F"}, // 5.60%
			{1120, "srifle_EBR_F"}, // 5.60%
			{1560, "srifle_LRR_F"}, // 4.40%
			{2000, "srifle_GM6_F"}, // 4.40%
			{2400, "Exile_Item_ZipTie"}, // 4.00%
			{2635.29411764706, "Exile_Item_Vishpirin"}, // 2.35%
			{2851.51033386328, "srifle_DMR_05_blk_F"}, // 2.16%
			{3067.72655007949, "srifle_DMR_05_hex_F"}, // 2.16%
			{3283.94276629571, "srifle_DMR_05_tan_F"}, // 2.16%
			{3483.94276629571, "MiniGrenade"}, // 2.00%
			{3683.94276629571, "HandGrenade"}, // 2.00%
			{3873.94276629571, "B_Carryall_cbr"}, // 1.90%
			{4063.1319554849, "srifle_DMR_04_Tan_F"}, // 1.89%
			{4252.32114467409, "srifle_DMR_04_F"}, // 1.89%
			{4432.32114467409, "B_Carryall_khk"}, // 1.80%
			{4612.32114467409, "B_Carryall_oli"}, // 1.80%
			{4782.32114467409, "U_I_GhillieSuit"}, // 1.70%
			{4947.32114467409, "U_O_GhillieSuit"}, // 1.65%
			{5112.32114467409, "U_B_GhillieSuit"}, // 1.65%
			{5274.48330683625, "srifle_DMR_02_camo_F"}, // 1.62%
			{5436.64546899841, "srifle_DMR_02_F"}, // 1.62%
			{5598.80763116057, "srifle_DMR_02_sniper_F"}, // 1.62%
			{5748.80763116057, "B_Carryall_ocamo"}, // 1.50%
			{5898.80763116057, "B_Carryall_oucamo"}, // 1.50%
			{6048.80763116057, "B_Carryall_mcamo"}, // 1.50%
			{6168.80763116057, "ItemWatch"}, // 1.20%
			{6288.80763116057, "ItemRadio"}, // 1.20%
			{6406.4546899841, "Exile_Item_Bandage"}, // 1.18%
			{6487.53577106518, "srifle_DMR_03_F"}, // 0.81%
			{6568.61685214627, "srifle_DMR_06_olive_F"}, // 0.81%
			{6649.69793322735, "srifle_DMR_03_tan_F"}, // 0.81%
			{6730.77901430843, "srifle_DMR_03_woodland_F"}, // 0.81%
			{6811.86009538951, "srifle_DMR_06_camo_F"}, // 0.81%
			{6892.94117647059, "srifle_DMR_03_khaki_F"}, // 0.81%
			{6972.94117647059, "Binocular"}, // 0.80%
			{7052.94117647059, "APERSTripMine_Wire_Mag"}, // 0.80%
			{7132.94117647059, "ItemGPS"}, // 0.80%
			{7212.94117647059, "APERSMine_Range_Mag"}, // 0.80%
			{7292.94117647059, "APERSBoundingMine_Range_Mag"}, // 0.80%
			{7352.94117647059, "U_I_FullGhillie_sard"}, // 0.60%
			{7409.08152734778, "10Rnd_338_Mag"}, // 0.56%
			{7465.22187822497, "10Rnd_93x64_DMR_05_Mag"}, // 0.56%
			{7521.22187822497, "20Rnd_762x51_Mag"}, // 0.56%
			{7577.22187822497, "10Rnd_762x51_Mag"}, // 0.56%
			{7632.3239190413, "optic_DMS"}, // 0.55%
			{7687.3239190413, "U_I_FullGhillie_lsh"}, // 0.55%
			{7742.3239190413, "U_I_FullGhillie_ard"}, // 0.55%
			{7797.3239190413, "U_O_FullGhillie_lsh"}, // 0.55%
			{7852.3239190413, "U_O_FullGhillie_ard"}, // 0.55%
			{7907.3239190413, "U_B_FullGhillie_sard"}, // 0.55%
			{7962.3239190413, "U_B_FullGhillie_lsh"}, // 0.55%
			{8017.3239190413, "U_B_FullGhillie_ard"}, // 0.55%
			{8072.3239190413, "U_O_FullGhillie_sard"}, // 0.55%
			{8125.3851435311, "optic_SOS"}, // 0.53%
			{8178.44636802089, "optic_LRPS"}, // 0.53%
			{8227.56917503844, "10Rnd_127x54_Mag"}, // 0.49%
			{8275.56917503844, "IEDLandSmall_Remote_Mag"}, // 0.48%
			{8323.56917503844, "IEDUrbanSmall_Remote_Mag"}, // 0.48%
			{8371.56917503844, "DemoCharge_Remote_Mag"}, // 0.48%
			{8418.62799856785, "Exile_Item_InstaDoc"}, // 0.47%
			{8458.62799856785, "H_MilCap_oucamo"}, // 0.40%
			{8498.62799856785, "H_MilCap_ocamo"}, // 0.40%
			{8538.62799856785, "H_MilCap_mcamo"}, // 0.40%
			{8578.62799856785, "H_MilCap_blue"}, // 0.40%
			{8618.62799856785, "H_MilCap_rucamo"}, // 0.40%
			{8658.62799856785, "H_MilCap_dgtl"}, // 0.40%
			{8697.40350877193, "muzzle_snds_B"}, // 0.39%
			{8736, "20Rnd_762x51_Mag"}, // 0.39%
			{8770, "7Rnd_408_Mag"}, // 0.34%
			{8804, "5Rnd_127x108_Mag"}, // 0.34%
			{8837.33333333333, "muzzle_snds_93mmg_tan"}, // 0.33%
			{8870.66666666667, "muzzle_snds_338_green"}, // 0.33%
			{8904, "muzzle_snds_B"}, // 0.33%
			{8937.33333333334, "muzzle_snds_338_sand"}, // 0.33%
			{8970.66666666667, "muzzle_snds_93mmg"}, // 0.33%
			{9004, "muzzle_snds_338_black"}, // 0.33%
			{9034, "H_HelmetSpecB_blk"}, // 0.30%
			{9064, "H_HelmetSpecB_paint2"}, // 0.30%
			{9094, "H_HelmetSpecB_paint1"}, // 0.30%
			{9124, "H_HelmetSpecB"}, // 0.30%
			{9154, "H_HelmetIA"}, // 0.30%
			{9184, "H_HelmetB"}, // 0.30%
			{9214, "H_HelmetB_paint"}, // 0.30%
			{9244, "H_HelmetB_light"}, // 0.30%
			{9274, "H_HelmetB_plain_blk"}, // 0.30%
			{9302.57142857143, "optic_KHS_blk"}, // 0.29%
			{9331.14285714286, "optic_AMS_khk"}, // 0.29%
			{9359.71428571429, "optic_AMS"}, // 0.29%
			{9388.28571428572, "optic_KHS_tan"}, // 0.29%
			{9416.85714285715, "optic_KHS_hex"}, // 0.29%
			{9445.42857142858, "optic_KHS_old"}, // 0.29%
			{9474.00000000001, "optic_AMS_snd"}, // 0.29%
			{9494.00000000001, "H_HelmetB_light_sand"}, // 0.20%
			{9514.00000000001, "H_HelmetB_grass"}, // 0.20%
			{9534.00000000001, "H_HelmetB_snakeskin"}, // 0.20%
			{9554.00000000001, "H_HelmetB_desert"}, // 0.20%
			{9574.00000000001, "H_HelmetB_black"}, // 0.20%
			{9594.00000000001, "H_HelmetB_sand"}, // 0.20%
			{9614.00000000001, "H_HelmetB_light_grass"}, // 0.20%
			{9634.00000000001, "H_HelmetB_light_snakeskin"}, // 0.20%
			{9654.00000000001, "H_HelmetB_light_desert"}, // 0.20%
			{9674.00000000001, "H_HelmetB_light_black"}, // 0.20%
			{9694.00000000001, "5Rnd_127x108_APDS_Mag"}, // 0.20%
			{9714.00000000001, "H_BandMask_khk"}, // 0.20%
			{9734.00000000001, "H_BandMask_reaper"}, // 0.20%
			{9754.00000000001, "H_BandMask_demon"}, // 0.20%
			{9774.00000000001, "H_HelmetIA_net"}, // 0.20%
			{9794.00000000001, "H_HelmetIA_camo"}, // 0.20%
			{9810.00000000001, "SatchelCharge_Remote_Mag"}, // 0.16%
			{9820.00000000001, "H_HelmetCrew_B"}, // 0.10%
			{9830.00000000001, "H_HelmetLeaderO_ocamo"}, // 0.10%
			{9840.00000000001, "H_HelmetSpecO_ocamo"}, // 0.10%
			{9850.00000000001, "H_HelmetLeaderO_oucamo"}, // 0.10%
			{9860.00000000001, "H_HelmetO_oucamo"}, // 0.10%
			{9870.00000000001, "H_CrewHelmetHeli_I"}, // 0.10%
			{9880.00000000001, "H_CrewHelmetHeli_O"}, // 0.10%
			{9890.00000000001, "H_CrewHelmetHeli_B"}, // 0.10%
			{9900.00000000001, "H_HelmetSpecO_blk"}, // 0.10%
			{9910.00000000001, "H_HelmetB_camo"}, // 0.10%
			{9920.00000000001, "H_PilotHelmetHeli_O"}, // 0.10%
			{9930.00000000001, "H_PilotHelmetHeli_B"}, // 0.10%
			{9940.00000000001, "H_PilotHelmetFighter_I"}, // 0.10%
			{9950.00000000001, "H_PilotHelmetFighter_O"}, // 0.10%
			{9960.00000000001, "H_PilotHelmetFighter_B"}, // 0.10%
			{9970.00000000001, "H_HelmetCrew_I"}, // 0.10%
			{9980.00000000001, "H_HelmetCrew_O"}, // 0.10%
			{9990.00000000001, "H_PilotHelmetHeli_I"}, // 0.10%
			{10000, "H_HelmetO_ocamo"} // 0.10%
		};
	};

};

class CfgSettings
{
	///////////////////////////////////////////////////////////////////////
	// GARBAGE COLLECTOR
	///////////////////////////////////////////////////////////////////////
	class GarbageCollector
	{
		/*
			Remark: 
			In 0.9.35 and below, Exile has checked if a player was nearby and then delayed
			the deletion. This check has been removed to save server performance.

			Do NOT touch these if you are not 10000% sure what you do!	
		*/
		class Ingame 
		{
			// Dropped items without fissix
			class GroundWeaponHolder
			{
				lifeTime = 10;
				interval = 5;
			};

			// Dropped items with fissix
			class WeaponHolderSimulated
			{
				lifeTime = 10;
				interval = 5;
			};

			// Corpses and wrecks
			class AllDead 
			{
				lifeTime = 15;
				interval = 5;
			};

			// Loot spawned inside a building
			class Loot 
			{
				lifeTime = 15;
				interval = 5;
			};

			// Never touch this or you will break your sever!
			class Groups 
			{
				interval = 0.5;
			};
		};

		class Database 
		{
			// Remove all territories (and contructions + containers in it) that were not paid after X days
			territoryLifeTime = 7;

			// Remove all containers outside of territories that have not been used for X days
			// Example: Tents
			containerLifeTime = 7;

			// Remove all constructions outside of territories that are older than X days or not moved for X days 
			// Example: Work Benches
			constructionLifeTime = 2;

			// Remove all vehicles that were not moved/used for X days
			vehicleLifeTime = 3;
		};
	};

	///////////////////////////////////////////////////////////////////////
	// RESPECT, YO
	///////////////////////////////////////////////////////////////////////
	class Respect
	{
		/**
		* Defines the factor of respect you gain for every pop tab in revenue
		*
		* Default: Get 1 respect for every 10 pop tabs 
		*/
		tradingRespectFactor = 0.1;

		/**
		* Defines the amount of respect earned/lost for certain types of frags
		*/
		class Frags
		{
			bambi = -500;				// Bambi slayers
			friendlyFire = -1000;		// For party members
			standard = 100;				// Normal kill
			domination = 80;			// Keeps killing the same guy
			letItRain = 150;			// MG, also vehicle MGs
			humiliation = 300;			// Axe
			passenger = 400;			// Out of car/chopper/boat
			roadKill = 200;				// :)
			bigBird = 600;				// Roadkill, but with chopper/plane
			chuteGreaterChopper = 1000;	// Someone flies into chute and chopper/plane explodes	
		};

		class Handcuffs 
		{
			trapping = -50;					// A handcuffs B
			breakingFree = 100; 			// B broke free
			releasedByHero = 100; 			// C releases B
			releasedByHostageTaker = 50; 	// A releases B	
		};

		class Bonus
		{
			// Bonus per full 100m 
			per100mDistance = 10;

			// First blood after server restart
			firstBlood = 100;

			// If you kill someone while you are in your own territory
			homie = 20;

			// If you kill someone who is in his own territory
			raid = 20;

			/*
				Example with killstreak = 50

				Frag  Factor   Bonus
				2    * 50      +100
				3    * 50      +150
				4    * 50      +200
				5    * 50      +250
			*/
			killStreak = 50;

			// Kills within this amount of seconds stack (default: 2 minutes)
			killStreakTimeout = 120;
		};
	};

	///////////////////////////////////////////////////////////////////////
	// KILLFEED MAN!
	///////////////////////////////////////////////////////////////////////

	class KillFeed
	{
		// Shows a kill feed for well kills
		showKillFeed = 1;
	};

	///////////////////////////////////////////////////////////////////////
	// PLAYER SPAWN CONFIGURATION
	///////////////////////////////////////////////////////////////////////
	class BambiSettings
	{
		/**
		 * Loadout of new bambi players
		 *
		 * (They will always spawn with a bambi overall - you cannot 
		 * change the loadout uniform)
		 */
		loadOut[] = 
		{
			"ItemCompass",
			"ItemMap",
			"Exile_Item_XM8",
			"ItemRadio",
			"Exile_Item_PlasticBottleFreshWater"
		};

		/**
		 * Enables or disables parachute spawning.
		 *
		 * 1 = On
		 * 0 = Off
		 */
		parachuteSpawning = 1;

		/**
		 * Enables or disables halo jumping. Only applies 
		 * if parachute spawning is enabled.
		 *
		 * Remember that if you enable halo jump, it is adviced
		 * to adjust the parachuteDropHeight to something around
		 * 1km or so.
		 *
		 * 1 = On
		 * 0 = Off
		 */
		haloJump = 1;

		/**
		 * Parachute drop height in meters. 
		 */
		parachuteDropHeight = 1000;

		/**
		 * Number of minutes where a fresh spawned player remains in the
		 * bambi state. It will end the bambi state after this timeout
		 * expired or when they pick up their first weapon. Whatever
		 * happens first.
		 */
		protectionDuration = 5;

		/**
		 * Radius of spawn zones around the center of spawn zone markers.
		 */
		spawnZoneRadius = 500;

		/**
		 * These vehicles spawn on server restart close to spawn zones.
		 * They are non-persistent and will despawn on server restart.
		 * Basically they are just used to get away from the spawn zone
		 * faster.
		 *
		 * {Number of vehicles *per* spawn zone, vehicle class name}
		 */
		spawnZoneVehicles[] =
		{
			{5, "Exile_Bike_OldBike"},
			{5, "Exile_Bike_MountainBike"}
		};
	};

	///////////////////////////////////////////////////////////////////////
	// LOOT CONFIGURATION
	///////////////////////////////////////////////////////////////////////
	class LootSettings
	{
		/**
		 * Chance in % to spawn loot in a building
		 */
		spawnChancePerBuilding = 50;

		/**
		 * Chance in % to spawn loot per loot spot per building.
		 *
		 * 100% = Super high loot
		 * 50%  = Normal loot spawn rates
		 * 20%  = You get the point
		 */
		spawnChancePerPosition = 75;

		/**
		 * Should be self-explanatory :)
		 */
		maximumNumberOfLootSpotsPerBuilding = 4;

		/**
		 * Exile spawns a random number of items per loot spot. This 
		 * is the upper cap for that. So 3 means it could spawn 1, 2 
		 * or 3.
		 */
		maximumNumberOfItemsPerLootSpot = 3;

		/**
		 * Radius in meter to spawn loot AROUND each player.
		 * Do NOT touch this value if you dont know what you do.
		 * The higher the number, the higher the drop rates, the
		 * easier your server will lag.
		 *
		 * 50m  = Minimum
		 * 200m = Maximum
		 */
		spawnRadius = 60;

		/**
		 * Notify players that loot spawned for them
		 *
		 * 1 = Yes
		 * 0 = No
		 */
		notifyPlayer = 1;

		/**
		 * Defines the radius around trader cities where the system should
		 * not spawn loot. Set this to 0 if you want to have loot spawning
		 * in trader citites, ugh.
		 */
		minimumDistanceToTraderZones = 500;

		/**
		 * Defines the radius around territories where no loot spawns.
		 * This does not regard the actual size of a territory. So do not
		 * set this to a lower value than the maximum radius of a territory,
		 * which is 150m by default.
		 */
		minimumDistanceToTerritories = 150;
	};

	///////////////////////////////////////////////////////////////////////
	// VEHICLE SPAWN CONFIGURATION
	///////////////////////////////////////////////////////////////////////

	class VehicleSpawn
	{
		/**
		* Grid Size for vehicle spawning,
		* smaller the number more vehicles,
		* you get the point
		*/
		vehiclesGridSize = 2200;

		/**
		* Vehicle ammount per grid
		* kinda self explanitory
		*/
		vehiclesGridAmount = 2;

		/**
		* Creates global markers for vehicle spawn tweeking,
		* after you are satisfied with vehicle ammount and spread set this to 0.
		*/
		vehiclesDebugMarkers = 0;

		/**
		* The server will apply random damage up to this value when spawning a vehicle.
		*/
		damageChance = 20; // 20% chance for a vehicle HITPOINT to be damaged
		maximumDamage = 0.9;

		// Stuff to spawn on water
		water[] = 
		{
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey"
		};

		// Stuff to spawn on roads
		ground[] = 
		{
			"Exile_Bike_QuadBike_Black",
			"Exile_Bike_QuadBike_Blue",
			"Exile_Bike_QuadBike_Red",
			"Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato",
			"Exile_Bike_QuadBike_Csat",
			"Exile_Bike_QuadBike_Fia",
			"Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02",
			"Exile_Car_Volha_Blue",
			"Exile_Car_Volha_White",
			"Exile_Car_Lada_Green",
			"Exile_Car_Lada_Taxi"
		};

		/**
		 * Enables or disables nightvision optics on ALL vehicles
		 *
		 * 0 = off
		 * 1 = on
		 */
		nightVision = 1;

		/**
		 * Enables or disables thermal optics on ALL vehicles
		 *
		 * 0 = off
		 * 1 = on
		 */
		thermalVision = 0;

		/**
		 * Set this to 1 to unlock vehicles on server boot if they are in safe zones
		 *
		 * 0 = off
		 * 1 = on
		 */
		unlockInSafeZonesAfterRestart = 1;	
	};

	class Weather
	{
		/*
			You can define multiple "keyframes" for the weather to change. The server will pick
			a keyframe randomly to simulate the weather. It will change the weather-keyframes
			based on the following interval
		*/
		interval = 30;

		/*
			Add the keyframes here. The server will pick one random, so if you want one 
			weather type of be more dominant compared to others, add it multiple times
		*/
		keyframes[] = {"Sunny", "Cloudy", "Thunderstorm"}; 

		/*
			This is a keyframe. Look up the BIKI to get more details about the parameters

			Be sure to design the fog settings at a view distance of 1,600m as this is the
			limit in multiplayer by default

			https://community.bistudio.com/wiki/fogParams
			https://community.bistudio.com/wiki/overcast
			https://community.bistudio.com/wiki/setWaves
			https://community.bistudio.com/wiki/setWindStr
			https://community.bistudio.com/wiki/setGusts
			https://community.bistudio.com/wiki/setRain
			https://community.bistudio.com/wiki/setLightnings
			https://community.bistudio.com/wiki/setRainbow
		*/
		class Sunny
		{
			fogValue = 0.1;
			fogDecay = 0.2;
			fogBase = 5;
			overcast = 0.2;
			waves = 0.2;
			wind = 0.25;
			gusts = 0.1;
			rain = 0;
			lightnings = 0;
			rainbows = 0;
		};

		class Cloudy
		{
			fogValue = 0.2;
			fogDecay = 0.1;
			fogBase = 5;
			overcast = 0.4;
			waves = 0.4;
			wind = 0.25;
			gusts = 0.5;
			rain = 0.1;
			lightnings = 0.1;
			rainbows = 1;
		};

		class Thunderstorm
		{
			fogValue = 0.7;
			fogDecay = 0.2;
			fogBase = 5;
			overcast = 1;
			waves = 1;
			wind = 0.25;
			gusts = 0.5;
			rain = 1;
			lightnings = 1;
			rainbows = 0.5;
		};
	};

	class Time
	{
		// Uses Dedicated Server time as ingame Time
		useRealTime = 0;

		// Will overide RealTime
		useStaticTime = 1;

		// time in ARMA FORMAT << CONFIG
		// https://community.bistudio.com/wiki/setDate

		staticTime[] = {2039,10,24,15,30};
	};


	class RCON
	{
		/*
			Note that for this to work you need to have serverCommandPassowrd defined in config.cfg and BE enabled
		*/

		// This needs to match config.cfg serverCommandPassword
		serverPassword = "";

		// Autolocks server until its ready to accept players
		useAutoLock = 0;

		// Server will autoLock at that time before restart (minutes)
		restartAutoLock = 3;

		/*
			Number of hours and minutes of your restart period.

			Examples:

			{4, 0} = Every 4 hours
			{1, 30} = Every one and a half hour (who the hell would do this?)
		*/
		restartTimer[] = {3, 0};

		/*
			Kicks players before restart to prevent gear loss.
			We strongely recommend to use this!

			0 = off
			1 = on
		*/
		useAutoKick = 0;

		/*
			Number of minutes before the server kicks players that did
			not disconnect before the restart. Should at least be two
			minutes!
		*/
		kickTime = 2;

		/*
			Self-explanatory

			0 = off
			1 = on
		*/
		useRestartMessages = 0;

		/*
			Number of minutes before the restart to inform your players.

			Only use full minutes here. Value like 5.5 have not been tested.
		*/
		restartWarningTime[] = {15, 10, 5, 3}; 

		/* 
			If set to 1 server will execute '#shutdown',
			to try to shutdown the server
		*/

		useShutdown = 0;
	};

	class ServerSettings
	{
		/*
			Support for custom server FSM if wanted
		*/
		serverFSM = "exile_server\fsm\main.fsm";

		/*
			If this is enabled, Exile developers will spawn with a ton of pop tabs.
			We will have a hard time debugging things if you disable this.
		*/
		devFriendyMode = 1;

		devs[] = 
		{
			"76561197985241690", // Eichi
			"76561198022879703", // Grim
			"76561197968999666", // Mr.White^ex
			"76561198075905447"  // Vishpala
		};
	};

	class Events 
	{
		/*
			A list of events that are active
		*/
		enabledEvents[] = {}; 

		class SupplyBox // DONT USE IT: WIP BROKEN
		{
			/*
				Drops a supply box on a parachute next to a random airport on the map.
				The box may contain items. The box can be transported to a territory
				and installed to become a normal storage container.
			*/
			type = "spawn";
			function = "ExileServer_system_event_supplyBox_start";
			interval = 1; // minutes
			minimumPlayersOnline = 0;
			dropRadius = 500; // 500m around an airport (including the main airport on Altis!)
			dropAltitude = 100; // altitude of the drop

			/*
				These are different types of boxes can be dropped.
				You can specify the cargo a box should contain.
				The type of box is chosen randomly from the following list.
				Add a type multiple times to increase the chance of being used.
			*/
			types[] = {"Beer", "Beer", "Tools", "Food", "Food", "RepairParts", "Nades"};

			class BoxTypes
			{
				class Beer 
				{
					items[] = 
					{
						{"Exile_Item_Beer", 24}
					};
				};

				class Nades 
				{
					items[] = 
					{
						{"Exile_Item_Beer", 10}
					};
				};

				class Food 
				{
					items[] = 
					{
						{"Exile_Item_BBQSandwich", 5},
						{"Exile_Item_Catfood", 5},
						{"Exile_Item_ChristmasTinner", 5},
						{"Exile_Item_GloriousKnakworst", 5},
						{"Exile_Item_SausageGravy", 5},
						{"Exile_Item_Surstromming", 5},
						{"Exile_Item_CanOpener", 1},
						{"Exile_Item_CookingPot", 1},
						{"Exile_Item_Matches", 1}
					};
				};

				class Tools 
				{
					items[] = 
					{
						{"Exile_Item_Wrench", 1},
						{"Exile_Item_Shovel", 1},
						{"Exile_Item_Screwdriver", 1},
						{"Exile_Item_Pliers", 1},
						{"Exile_Item_Handsaw", 1},
						{"Exile_Item_FireExtinguisher", 1},
						{"Exile_Item_DuctTape", 1}
					};
				};

				class RepairParts 
				{
					items[] = 
					{
						{"Exile_Item_CarWheel", 8},
						{"Exile_Item_FuelCanisterFull", 4},
						{"Exile_Item_OilCanister", 1},
						{"Exile_Item_Grinder", 1},
						{"Exile_Item_CordlessScrewdriver", 1}
					};
				};
			};
		};
	};
};