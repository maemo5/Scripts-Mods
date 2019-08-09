This addon with numerous settings for crashes transport on your server. The player triggered a crash and crashes not far from him. The presence of bots

You can configure the addon in the config file.cpp

Main settings:
minPlayer = 1; / * the Minimum number of players for the appearance of the paint. */
spawnFly = 1; / * parameter is responsible for the appearance of bots in the air or on the ground. 0-on the ground, 1-in the air */
startCrash = 40; /* how much time will fall helices after the restart. In seconds. */ 
betweenTime = 1000; / * After what time the next crash will fall. In seconds. */
betweenTimeEndCrash = 1500; / * After what time the current crash will be removed. */
startCountBots = 5; / * how many will be the number of bots in the helicopter.  unexpectedly */
endCountBots = 5; /* how far will the number of bots in the helicopter.  unexpectedly */
startCountVehicleBots = 5; / * how many will be the number of bots in land transport.  unexpectedly */
endCountVehicleBots = 5; /* how far will the number of bots in land transport.  unexpectedly		/* 
betweenTimeCrash = 2; / * Delay in seconds before falling */
betweenTimeBots = 3; / * Delay in seconds between the start of the helicopter crash and landing * / 
betweenTimeYawik = 4; / * Delay in seconds before the box appears */
heightCrash = 600; /* Height of any falls helicopter */ 
countItemBots = 3; / * number of random loot in bots. Taken randomly */ 
minPlayerMetrsCrash = 500; /* minimum distance of occurrence from the player */
maxPlayerMetrsCrash = 700; / * maximum range of appearance from the player */
mincountWeapon = 2; / * minimum number of random weapons in the loot box. Taken randomly */
maxcountWeapon = 2; / * maximum number of random weapons in the box with loot. Taken randomly */
mincountItems = 5; / * minimum number of random loot in the loot box. Taken randomly */
maxcountItems = 5; / * maximum number of random loot in the loot box. Taken randomly */
countBackpack = 2; / * number of backpacks in the box with loot. Taken randomly */
radiusMetrsCrash = 50; / * Radius of movement of bots in passive mode. If they see the target, they'll follow. */ 
crashType = 0; / * 0 - all types of crash, 1 - only helicopters, 2 - only equipment. */
classBoats = "O_Soldier_unarmed_F"; / * bot Class */
classHeli = "B_Heli_Transport_01_F"; / * helicopter Class */
classVehicle = "B_MRAP_01_hmg_F"; / * equipment class * / 
classBox = "Box_IND_Ammo_F"; / * mailbox Class */
markerCrashEnabled = 1; / * Show marker on the map */
markerCrashText = "Crash with bots"; /* text of the token */
minrespectKilledBoat = 50; / * number of respect per bot */
maxrespectKilledBoat = 100; / * number of respect per bot */
alertCrashEnabled = 1; / * enable text notification */
alertCrashTitle = "crash with bots"; / * Header crash */
alertCrashContent = "Group bots suffered a crash. It is still possible to find something valuable"; /* Content of the crash */

Also you can configure the loot:

/ * List of weapons for bots */
 class weaponBots
{
 weapon1 [] = {"arifle_MX_SW_F", "100Rnd_65x39_caseless_mag_Tracer", 5}; 
 weapon2 [] = {"hgun_PDW2000_F","30Rnd_9x21_Mag", 5}; 
 weapon3 [] = {"arifle_MXM_F", "30Rnd_65x39_caseless_mag", 5};
 weapon4 [] = {"LMG_Mk200_F", "200Rnd_65x39_cased_Box", 5};
            weapon5 [] = {"LMG_Mk200_F", "200Rnd_65x39_cased_Box", 5};
            weapon6 [] = {"LMG_Mk200_F", "200Rnd_65x39_cased_Box", 5}; 
};

 /* A list of secondary weapon for the bots. {"","",0} - means there are no secondary weapons. */
 class weaponSecondaryBots
{
 weapon1[] = {"","",0}; 
 weapon2 [] = {"CUP_launch_RPG18","CUP_RPG18_M", 1}; 
 weapon3 [] = {"launch_RPG7_F","RPG7_F", 2};
 weapon4 [] = {"launch_RPG7_F","RPG7_F", 2};
};

 / * Primary weapons */
 weaponBotsPrimary [] = {"weapon1", "weapon2", "weapon3", "weapon4", "weapon5", " weapon6"};
 / * Secondary weapons */
 weaponBotsSecondary [] = {"weapon1", "weapon2", "weapon3", " weapon4"};
 / * List of optics for bots */
 rifleOpticsBots [] = {"optic_ERCO_khk_F", "optic_MRCO", "optic_Hamr", "optic_ERCO_khk_F", "optic_MRCO", " optic_Hamr"};
 / * List of clothing for bots */
 uniformBots [] = {"U_OG_Guerilla3_2", "U_O_CombatUniform_ocamo", " U_O_PilotCoveralls"};
 / * Bot armor plates */
 vestBots [] = {"V_PlateCarrier_Kerry", "V_Press_F", " V_PlateCarrierL_CTRG"};
 / * Backpacks for bots appear only if the parammeter _spawnFly = 0. If the array is left empty [], then bots will not have backpacks. */
 backpacksBots [] = {"B_Kitbag_rgr", "B_Kitbag_mcamo", " B_TacticalPack_mcamo"};
 / * Arbitrary loot in bots */
 itemBots [] = {"Exile_Item_EMRE", "Exile_Item_Surstromming_Cooked", " Exile_Item_PowerDrink"};
 / * List of bot ranks */
 rankBoats [] = {"CORPORATE", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", " COLONEL"};
 / * Random list of bots hardness. It is formed from 0 to 1, for example 50% is 0.5 */
 abilityBots[] = {0.5,0.6,0.7,0.8,0.9};

 /* Customize box */
 / * weapons in the box */
 class weaponAmmo
{
 weapon1 [] = {"arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer", 3}; 
 weapon2 [] = {"hgun_PDW2000_F","30Rnd_9x21_Mag", 3}; 
 weapon3 [] = {"arifle_MXM_F", "30Rnd_65x39_caseless_mag", 3};
 weapon4 [] = {"LMG_Mk200_F", "200Rnd_65x39_cased_Box", 3};
};
 / * Primary weapons */
 weaponBoxPrimary [] = {"weapon1", "weapon2", "weapon3", " weapon4"};
 /* List of optics in box */
 rifleOptics [] = {"optic_ERCO_khk_F", "optic_MRCO", "optic_Hamr", "optic_ERCO_khk_F", "optic_MRCO", " optic_Hamr"};
 / * List of backpacks in the drawer */
 backpacks [] = {"B_Kitbag_rgr", "B_Kitbag_mcamo", " B_TacticalPack_mcamo"};
 /* A list of the loot in the box */
 itemmy [] = {"muzzle_snds_L","muzzle_snds_H_SW","muzzle_snds_M","muzzle_snds_L","muzzle_snds_M","U_OG_Guerilla3_2","U_O_CombatUniform_ocamo","Exile_Item_EMRE","Exile_Item_Surstromming_Cooked","Exile_Item_PowerDrink","Exile_Item_PlasticBottleCoffee","Exile_Item_Vishpirin","Exile_Item_Matches","Exile_Item_DuctTape","Exile_Item_CanOpener","Exile_Item_Bandage","Exile_Item_InstaDoc"};
