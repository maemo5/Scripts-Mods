/*
	Define constants for SLS for Exile

	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
_lootBoxes = 
[
				#ifdef GRG_TestServer
				["altis","APTrader",10,
					[
					[[14658.1, 16790.9, 18.3795],0,false,false],
					[[14660, 16788.5, 18.3795],0,false,false],
					[[17518.4,13260.7,12.7337],0,false,false],
					[[17528.1,13270.2,12.725],0,false,false],
					[[17537.4,13278.2,12.706],0,false,false],
					[[17547.9,13286,12.6121],0,false,false],
					[[17599.5,13240.5,13.327],0,false,false],
					[[17593.1,13231.9,13.4375],0,false,false],
					[[17586.5,13224.6,13.5832],0,false,false],
					[[17580.5,13217.8,13.6708],0,false,false]					
					]
				],
				#endif

				// Ferres
				/*
				["altis","Ferres", 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[21693.887,7731.0264,13.955027],0,true, true], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[21850.063,7504.3203,14.677059],0,true, true],
					[[21693.674,7431.4141,15.578629],0,true, true],
					[[21631.227,7773.9927,14.149431],0,true, true],
					[[21572.559,7462.2661,17.827536],0,true, true],
					[[21801.348,7631.4448,13.80711],0,true, true],
					[[21508.932,7585.6309,15.844649],0,true, true],
					[[21547.027,7695.6738,15.754698],0,true, true]
					]
				],*/		
				#ifndef blck_milServer
				// Dump
				["altis","Dump", 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[5791,20314.5,0],0,false,true], // crate position 1, loadout (0-4), false=random placement near position, true = show smoke at position
					[[5902.33,20272.7,0],0,false,true],
					[[5955.21,20136.2,0],0,false,true],
					[[5908.32,20088.3,0],0,false,true],
					[[55843.54,20171.6,0],0,false,true],
					[[5775.42,20163.3,0],0,false,true],
					[[5979.18,20206.5,0],0,false,true],
					[[5943.89,20076.7,0],0,false,true]
					]
				],
				// Beach #1
				["altis","Beach", 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[22769.8,7051.28,0],0,false,true], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[22934.3,6990.53,0],0,false,true],
					[[22831.7,7003.24,0],0,false,true],
					[[22666.6,7009.22,0],0,false,true],
					[[22634.6,6985.3,0],0,false,true],
					[[22583.4,6935.63,0],0,false,true],
					[[22651.1,7060.75,0],0,false,true]
					]
				],
				["altis","Pack-1", 1,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[14269.6,13016.2,0],0,false,false], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[14359.9,13047.7,0],0,false,false],
					[[14293.5,12956.9,0],0,false,false] 
					]
				],
				["altis","Pack-2", 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[26810,24557.2,0.00140762],0,false,false], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[26746,24652.6,0.520973],0,false,false],
					[[26798.1,24668.3,0.001297],0,false,false],
					[[26873,24635.1,17.4495],0,false,false],
					[[26940.7,24642.2,0.732187],0,false,false],
					[[26955.5,24658.4,0.739138],0,false,false],
					[[26943.8,24666.2,0.722866],0,false,false],
					[[26930.2,24651.9,0.727114],0,false,false],
					[[26965.5,24684.1,7.63653],0,false,false],
					[[26928.3,24714.8,7.63206],0,false,false],
					[[26940.7,24730.5,7.76619],0,false,false],
					[[26952,24750.5,0.602812],0,false,false],
					[[26932.7,24730.8,0.635454],0,false,false],
					[[26931.2,24739,0.724504],0,false,false],
					[[26968.1,24700.1,0.599913],0,false,false],
					[[26847.9,24821.4,0.340788],0,false,false],
					[[26783.4,24788.2,12.5849],0,false,false],
					[[26729.8,24759.1,0.296225],0,false,false]					
					]
				],
				#endif
				["taviana","Zoo", 3,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[18614.1,3029.22,0],0,false, true], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[19215.7,2260.17,0],0,false, true],
					[[19073.2,2775.83,0],0,false, true],
					[[18632.1,2967.54,0],0,false, true],
					[[18671.2,2869.73,0],0,false, true]
					]
				],
				// Power Plant
				["taviana","NPP", 3,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[9478.98,4481.12,0],0,false, false], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[9584.39,4474.86,0],0,false, false],
					[[9485.74,4303.65,0],0,false, false],
					[[9549.64,4236.95,0],0,false, false],
					[[9347.52,4656.96,0],0,false, false],
					[[9427.53,4585.94,0],0,false, false],
					[[9542.42,4603.89,0],0,false, false]					
					]
				],
				["bornholm","Stronghold1",4,
				// Stronghold 1
					[
					[[16776.3,2841.59,0.115455],2,true, false],
					[[16885.1,2763.64,0.0635304],4,true, false],
					[[16953.7,2588.12,0.0866053],2,true, false],
					[[17028.5,2645.56,0.0632489],4,true, false],		
					[[16818.7,2627.68,0.0635295],2,true, false],
					[[16828.1,2794.94,0.086482],4,true, false],
					[[16776.8,2842.19,0.115454],2,true, false]					
					]
				],
				["bornholm","Stronghold2", 4,
				// Stronghold 2
					[
					[[4342.52,19974.5,1.5059],2,false, false],
					[[4364.01,19957.2,1.7643],4,false, false],
					[[4337.55,19886.1,0.923979],2,false, false],
					[[4317.76,19915.3,0.336912],4,false, false],
					[[4261.73,19957,0.0783005],2,false, false],				
					[[4280.66,19961.2,0.180275],4,false, false],
					[[4318.1,19916.5,0.514435],2,false, false]					
					]
				],			
				["bornholm","Object99",4,// ** Note that there is no comma after the last entry.
				// Object 99 blah blah
					[
						/*
						// Darthrogues Obj 99
					[[7231.91,11975.8,0.836342],2,false, false],
					[[7266.08,11981.6,1.0471],4,false, false],
					[[7337.64,12011.6,12.7679],2,false, false],
					[[7264.35,12020.1,0.661186],4,false, false],
					[[7204.27,12058.5,0.632904],2,false, false],
					[[7265.46,12128.6,0.00143433],4,false, false],
					[[7250.85,12142.9,3.16084],2,false, false],
					[[7215.93,12121.1,0.224915],4,false, false],
					[[7207.59,12159.8,0.73732],2,false, false],
					[[7184.07,12231.1,8.72117],4,false, false],
					[[7172.28,12021.2,0.664284],2,false, false],
					[[7147.93,12056.5,0.848099],4,false, false],					
					[[7137.67,12110.8,4.0068],2,false, false],	
					[[7166,12138,3.86438],4,false, false],	
					[[7130.52,12207.9,0.56971],4,false, false]	
					*/					
					// Mr. Squirrel's Obj 69
					[[7253.48,12101.4,0],2,false, false],
					[[7276.15,12118.1,0],4,false, false],
					[[7158.4,12068.5,0],2,false, false],
					[[7128.27,12206.9,0],4,false, false],
					[[7167.57,12218.9,0],2,false, false],
					[[7218.71,12188.5,0],4,false, false],
					[[7209.02,12166.9,0],2,false, false],
					[[7233.2,12067.5,0],4,false, false],
					[[7167.75,12038.4,0],2,false, false],
					[[7106.96,12119.2,0],4,false, false],
					[[7161.82,12126.7,0],2,false, false],
					[[7096.61,12195.9,0],4,false, false],					
					[[7083.88,12141.1,0],2,false, false],	
					[[7060.33,12146.2,0],4,false, false],	
					[[7135.81,12168.1,0],2,false, false],		
					[[7055.72,12159.2,0.38678],4,false, false],
					[[7119.19,12100.2,0.801155],2,false, false],
					[[7124.51,12095.7,1.16968],4,false, false]
					]
				],
				["bornholm","Mafia Island", 4,
				  [// Mafia Island
					[[19296.5, 22308.8, 0],2,false, false],
					[[19279, 22352.2, 0],4,false, false],
					[[19213.8, 22358.6, 0],2,false, false],
					[[19190.4, 22367.4, 0],4,false, false],
					[[19204.3, 22314.9, 0],2,false, false],
					[[19368.7, 22347.3, 0],4,false, false],
					[[19462.8, 22306.1, 0],2,false, false],
					[[19321.4, 22240.1, 3.46751],4,false, false]			
				  ]
				],
				["bornholm","Science Compound", 4,
				  [// Science Compound
					[[7922.43,7347, 0],2,false, false],
					[[7926.59,7427.49, 0],4,false, false],
					[[7929.08,7421.45, 0],2,false, false],
					[[7984.89,7474.71, 0],4,false, false],
					[[7974.01,7472.63, 0],2,false, false],
					[[7934.56,7572.23, 0],4,false, false],
					[[7945.09,7587.68, 0],2,false, false],
					[[7949.19,7567.18,0],4,false, false]			
				  ]
				], 
					//[[21572.559,7462.2661,17.827536],4,true, true]
					//[[21801.348,7631.4448,13.80711],1,true, true],
					//[[21508.932,7585.6309,15.844649],2,true, true],
					//[[21547.027,7695.6738,15.754698],3,true, true]

   [   "lythium", "RaiderBase", 3, 
        [
            [[18950.6,13115.8,233.078],1,true, false], // loadout (0-4), false=random placement near position, true = show smoke at position
            [[18958,13095.9,231.687],2,true, false],
            [[19048.7,13134,229.004],2,true, false],
            [[19062.3,13126.6,229.646],1,true, false],
            [[19032.2,13087.3,227.428],3,true, false],
            [[18988,13192.7,223.058],1,true, false],
            [[19076.2,13105.2,231.051],3,true, false]
        ]
    ],
	[   "lythium","chemical", 4, 
        [
            [[9081.29,19774.8,704.102],1,true, false], // loadout (0-4), false=random placement near position, true = show smoke at position
            [[9081.29,19774.8,704.102],2,true, false],
            [[8926.25,19856.5,728.456],2,true, false],
            [[8999.95,19917.9,714.447],1,true, false],
            [[9391.22,19888,713.624],3,true, false],
            [[9026.12,20360,687.103],1,true, false],
			[[8972.81,20222.4,714.263],3,true, false],
            [[9406.59,19506.8,635.903],3,true, false],
			[[7715.5,20352.6,822.616],3,true, false]
        ]
    ],
	[   "lythium","nwaste", 4, 
        [
            [[19123.5,1726.78,77.169],1,true, false], // loadout (0-4), false=random placement near position, true = show smoke at position
            [[19000.5,1657.84,79.3068],2,true, false],
            [[19028.6,1525.28,80.0602],2,true, false],
            [[19076.7,1536.15,78.7828],1,true, false],
            [[19393.5,1784.66,32.3623],3,true, false],
            [[19391,1783.63,32.5241],1,true, false],
			[[19255.1,2204.95,46.3486],3,true, false],
            [[19398.7,2323,42.8409],3,true, false]
			
        ]
    ],
	[   "lythium","mine", 4, 
        [
            [[4114.84,905.004,357.621],1,true, false], // loadout (0-4), false=random placement near position, true = show smoke at position
            [[3714.22,760.414,383.659],2,true, false],
            [[3774.63,684.883,384.924],2,true, false],
            [[3747.2,777.427,384.203],1,true, false],
            [[3761.07,611.827,383.125],3,true, false],
            [[3709.12,780.889,383.27],1,true, false],
			[[3712.96,805.05,382.848],3,true, false],
            [[3688.47,713.877,382.692],3,true, false],
			[[4373.19,607.184,370.77],3,true, false]
        ]
    ]					

];


private["_loot_uniforms","_loot_pistols","_loot_rifles","_loot_snipers","_loot_LMG","_loot_silencers"];
// Edit these to your liking
//Uniforms
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_uniforms = ["U_O_CombatUniform_ocamo", "U_O_GhillieSuit", "U_O_PilotCoveralls", "U_O_Wetsuit", "U_OG_Guerilla1_1", "U_OG_Guerilla2_1", "U_OG_Guerilla2_3", "U_OG_Guerilla3_1", "U_OG_Guerilla3_2", "U_OG_leader", "U_C_Poloshirt_stripped", "U_C_Poloshirt_blue",
				"U_C_Poloshirt_burgundy", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_C_Poor_1", "U_C_WorkerCoveralls", "U_C_Journalist", "U_C_Scientist", "U_OrestesBody", "U_Wetsuit_uniform", "U_Wetsuit_White", "U_Wetsuit_Blue", 
				"U_Wetsuit_Purp", "U_Wetsuit_Camo", "U_CamoRed_uniform", "U_CamoBrn_uniform", "U_CamoBlue_uniform", "U_Camo_uniform", "U_ghillie1_uniform", "U_ghillie2_uniform", "U_ghillie3_uniform","U_B_FullGhillie_ard","U_I_FullGhillie_ard","U_O_FullGhillie_ard",
				"Full Ghillie Suit Semi-Arid:","U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard","Full Ghillie Suit Lush","U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh"];

//Weapons
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_loot_pistols = 	blck_Pistols;
_loot_rifles 	= 	blck_RifleAsault + blck_apexWeapons;
_loot_snipers 	= 	blck_RifleSniper + blck_DLC_Sniper;
_loot_LMG 		= 	blck_RifleLMG + blck_DLC_MMG;
_loot_magazines = 	[  //  Ignored 5.56, SMG and pistol ammo as most players seem to have little interest in it when given the choice to use higher caliber amo.
			"100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer",
			"10Rnd_127x54_Mag",
			"10Rnd_338_Mag",
			"10Rnd_762x54_Mag",
			"10Rnd_93x64_DMR_05_Mag",
			"130Rnd_338_Mag", // SPMG
			"150Rnd_762x54_Box",
			"150Rnd_762x54_Box_Tracer",
			"150Rnd_93x64_Mag", // NAVID
			"16Rnd_9x21_Mag",
			"200Rnd_65x39_cased_Box",
			"200Rnd_65x39_cased_Box_Tracer",
			"20Rnd_762x51_Mag",
			"30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag_Tracer",
			// Apex
			"30Rnd_580x42_Mag_F",
			"30Rnd_580x42_Mag_Tracer_F",
			"100Rnd_580x42_Mag_F",
			"100Rnd_580x42_Mag_Tracer_F",
			"20Rnd_650x39_Cased_Mag_F",
			"10Rnd_50BW_Mag_F",
			"150Rnd_556x45_Drum_Mag_F",
			"150Rnd_556x45_Drum_Mag_Tracer_F",
			"30Rnd_762x39_Mag_F",
			"30Rnd_762x39_Mag_Green_F",
			"30Rnd_762x39_Mag_Tracer_F",
			"30Rnd_762x39_Mag_Tracer_Green_F",
			"30Rnd_545x39_Mag_F",
			"30Rnd_545x39_Mag_Green_F",
			"30Rnd_545x39_Mag_Tracer_F",
			"30Rnd_545x39_Mag_Tracer_Green_F",
			"200Rnd_556x45_Box_F",
			"200Rnd_556x45_Box_Red_F",
			"200Rnd_556x45_Box_Tracer_F",
			"200Rnd_556x45_Box_Tracer_Red_F",
			"10Rnd_9x21_Mag"
	];
	
//Silencers
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_silencers = ["muzzle_sr25S_epoch","muzzle_snds_H","muzzle_snds_M","muzzle_snds_L","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_acp","muzzle_snds_93mmg","muzzle_snds_93mmg_tan",
					"muzzle_snds_338_black","muzzle_snds_338_greenmuzzle_snds_338_sand"];

private["_loot_optics","_loot_backpacks","_loot_vests","_loot_headgear","_loot_food","_loot_misc","_loot_build"];
//Optics
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_optics = ["optic_NVS","optic_tws","optic_tws_mg","optic_SOS","optic_LRPS","optic_DMS","optic_Arco","optic_Hamr","Elcan_epoch","Elcan_reflex_epoch","optic_MRCO","optic_Holosight",
				"optic_Holosight_smg","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Yorris","optic_MRD","optic_AMS","optic_AMS_khk","optic_AMS_snd",
				"optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan"];

//Backpacks
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_backpacks = blck_backpacks;

//Vests
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_vests = blck_vests;

//Head Gear
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_headgear = 
[
	"H_Cap_blk",
	"H_Cap_blk_Raven",
	"H_Cap_blu",
	"H_Cap_brn_SPECOPS",
	"H_Cap_grn",
	"H_Cap_headphones",
	"H_Cap_khaki_specops_UK",
	"H_Cap_oli",
	"H_Cap_press",
	"H_Cap_red",
	"H_Cap_tan",
	"H_Cap_tan_specops_US",
	"H_Watchcap_blk",
	"H_Watchcap_camo",
	"H_Watchcap_khk",
	"H_Watchcap_sgg",
	"H_MilCap_blue",
	"H_MilCap_dgtl",
	"H_MilCap_mcamo",
	"H_MilCap_ocamo",
	"H_MilCap_oucamo",
	"H_MilCap_rucamo",
	"H_Bandanna_camo",
	"H_Bandanna_cbr",
	"H_Bandanna_gry",
	"H_Bandanna_khk",
	"H_Bandanna_khk_hs",
	"H_Bandanna_mcamo",
	"H_Bandanna_sgg",
	"H_Bandanna_surfer",
	"H_Booniehat_dgtl",
	"H_Booniehat_dirty",
	"H_Booniehat_grn",
	"H_Booniehat_indp",
	"H_Booniehat_khk",
	"H_Booniehat_khk_hs",
	"H_Booniehat_mcamo",
	"H_Booniehat_tan",
	"H_Hat_blue",
	"H_Hat_brown",
	"H_Hat_camo",
	"H_Hat_checker",
	"H_Hat_grey",
	"H_Hat_tan",
	"H_StrawHat",
	"H_StrawHat_dark",
	"H_Beret_02",
	"H_Beret_blk",
	"H_Beret_blk_POLICE",
	"H_Beret_brn_SF",
	"H_Beret_Colonel",
	"H_Beret_grn",
	"H_Beret_grn_SF",
	"H_Beret_ocamo",
	"H_Beret_red",
	"H_Shemag_khk",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_Shemag_tan",
	"H_ShemagOpen_khk",
	"H_ShemagOpen_tan",
	"H_TurbanO_blk",
	"H_HelmetB",
	"H_HelmetB_black",
	"H_HelmetB_camo",
	"H_HelmetB_desert",
	"H_HelmetB_grass",
	"H_HelmetB_light",
	"H_HelmetB_light_black",
	"H_HelmetB_light_desert",
	"H_HelmetB_light_grass",
	"H_HelmetB_light_sand",
	"H_HelmetB_light_snakeskin",
	"H_HelmetB_paint",
	"H_HelmetB_plain_blk",
	"H_HelmetB_sand",
	"H_HelmetB_snakeskin",
	"H_HelmetCrew_B",
	"H_HelmetCrew_I",
	"H_HelmetCrew_O",
	"H_HelmetIA",
	"H_HelmetIA_camo",
	"H_HelmetIA_net",
	"H_HelmetLeaderO_ocamo",
	"H_HelmetLeaderO_oucamo",
	"H_HelmetO_ocamo",
	"H_HelmetO_oucamo",
	"H_HelmetSpecB",
	"H_HelmetSpecB_blk",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecO_blk",
	"H_HelmetSpecO_ocamo",
	"H_CrewHelmetHeli_B",
	"H_CrewHelmetHeli_I",
	"H_CrewHelmetHeli_O",
	"H_HelmetCrew_I",
	"H_HelmetCrew_B",
	"H_HelmetCrew_O",
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetHeli_I",
	"H_PilotHelmetHeli_O"	
	];

//Food
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_food = blck_ConsumableItems;

//Misc
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_Misc = ["Exile_Item_InstaDoc","Exile_Item_Matches","Exile_Item_CookingPot","Exile_Item_CanOpener"];

//Construction
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_build = ["Exile_Item_Rope","Exile_Item_DuctTape","Exile_Item_ExtensionCord","Exile_Item_FuelCanisterEmpty",
				"Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_CamoTentKit","Exile_Item_WorkBenchKit",
				"Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_Sand","Exile_Item_Cement","Exile_Item_MetalWire","Exile_Item_MetalScrews" ];
_loot_tools = ["Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_Grinder","Exile_Item_Foolbox"];

// Explosives
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_explosives = [["HandGrenade",3],["MiniGrenade",3],["SatchelCharge_Remote_Mag",3],["DemoCharge_Remote_Mag",3],["ClaymoreDirectionalMine_Remote_Mag",3]];
_loot_launchers = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_Titan_short_F"];

//  Loot Configuration 1: Heavy Weapons and explosives
_box1_Pistols = [2,4];
_box1_Rifles = [5,8];
_box1_LMG = [1,4];
_box1_Snipers = 0;
_box1_Mags = [4,8];
_box1_Optics = [3,6];
_box1_Silencers = [3,6];
_box1_Explosives = [3,6];
_box1_FoodDrink = 3;
_box1_Misc = 0;
_box1_Backpacks = 3;
_box1_BuildingSupplies = 0;
_box1_Tools = 0;

#ifdef blck_milServer
_box1_launchers = 4;
#else
_box1_launchers = 0;
#endif
//  Note that the bonus items are listed in a nexted array within the _box1_cbonus array. It was more difficult to ocde otherwise and would have needed indexing to make it work.
_box1_bonus_items = [["ItemGPS",1],["Rangefinder",1],["SatchelCharge_Remote_Mag",3],["DemoCharge_Remote_Mag",3],["ClaymoreDirectionalMine_Remote_Mag",3]];
_box1_bonus = 1;

// Loot Configuration 2: Sniper Weapons and sniper scopes
_box2_Pistols = 2;
_box2_Rifles = 2;
_box2_LMG = [3,6];
_box2_Snipers = [4,8];
_box2_Mags = [2,6];  // [number of times to select a mag, min # of that mag to add, max # of that mag to add]
_box2_Optics = 6;
_box2_Silencers = 5;
_box2_Explosives = 6;
_box2_FoodDrink = 2;
_box2_Misc = 1;
_box2_Backpacks = 3;
_box2_BuildingSupplies = 0;
_box2_Tools = 0;
_box2_Misc = 0;
#ifdef blck_milServer
_box2_launchers = 4;
#else
_box2_launchers = 0;
#endif

_box2_bonus_items = [["ItemGPS",2],["Rangefinder",2],["SatchelCharge_Remote_Mag",1],["DemoCharge_Remote_Mag",10]];
_box2_bonus = 1;

// Loot Configuration 3: building materials and tools
_box3_Pistols = 2;
_box3_Rifles = 2;
_box3_LMG = 1;
_box3_Snipers = 1;
_box3_Mags = [4,6];
_box3_Optics = 1;
_box3_Silencers = 1;
_box3_Explosives = 2;
_box3_FoodDrink = 12;
_box3_Misc = 6;
_box3_Backpacks = 1;
_box3_BuildingSupplies = [12,20]; // [Number of items, min for item, max for item]
_box3_Tools = 4;
_box3_Misc = 6;
#ifdef blck_milServer
_box3_launchers = 4;
#else
_box3_launchers = 0;
#endif

_box3_bonus_items = [["Exile_Item_Matches",2],[	"Exile_Item_CookingPot",2],["Exile_Item_CanOpener",3],["Exile_Item_Handsaw",2],["Exile_Item_Pliers",2],["Exile_Item_Grinder",1],["Exile_Item_Foolbox",1]];
_box3_bonus = 1;


////////////////////////////
// End of configurations
