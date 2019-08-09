class CfgPatches
{
	class exile_crash
	{
		requiredVersion=1.0;
		requiredAddons[]=
		{
			"exile_server"
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};

class CfgFunctions
{
    class exile_crash
    {
        class Bootstrap
        {
            file = "\exile_crash\bootstrap";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};

class cfgCrash
{
	class options
	{
	    minPlayer = 1; /* Минимальное количество игроков для появления краша. */
        spawnFly = 1; /* Параметр отвечает за появление ботов в воздухе или на земле. 0 - на земле, 1 - в воздухе */
        startCrash = 40; /* Через какое время начнет падать хеликраш после рестарта. В секундах. */	
        betweenTime = 1000; /* Через какое время упадет следующий краш. В секундах. */
		betweenTimeEndCrash = 1500; /* Через какое время удалится текущий краш. */
        startCountBots = 5; /* От скольки будет количество ботов в вертолете. Рандомно */
        endCountBots = 5; /* До скольки будет количество ботов в вертолете. Рандомно */
        startCountVehicleBots = 5; /* От скольки будет количество ботов в наземном транспорте. Рандомно */
        endCountVehicleBots = 5; /* До скольки будет количество ботов в наземном транспорте. Рандомно */		
        betweenTimeCrash = 2; /* Задержка в секундах перед падением */
        betweenTimeBots = 3; /* Задержка в секундах между началом падения вертолета и выгрузкой десанта */	
        betweenTimeYawik = 4; /* Задержка в секундах перед появлением ящика */
        heightCrash = 600; /* Высота с какой падает вертолет */	
        countItemBots = 3; /* Количество произвольного лута в ботах. Береться рандомно */	
        minPlayerMetrsCrash = 500; /* минимальное растояние появления от игрока */
		maxPlayerMetrsCrash = 700; /* максимальное растояние появления от игрока */
        mincountWeapon = 2; /* минимальное количество произвольного оружие в ящике с лутом. Береться рандомно */
		maxcountWeapon = 2; /* максимальное количество произвольного оружие в ящике с лутом. Береться рандомно */
		mincountItems = 5; /* минимальное количество произвольного лута в ящике с лутом. Береться рандомно */
        maxcountItems = 5; /* максимальное количество произвольного лута в ящике с лутом. Береться рандомно */
        countBackpack = 2; /* Количество рюкзаков в ящике с лутом. Береться рандомно */
        radiusMetrsCrash = 50; /* Радиус передвижения ботов в пасивном режиме. Если увидят цель будут преследовать. */	
        crashType = 0; /* 0 - все типы крашей, 1 - только вертолеты, 2 - только техника. */
        classBoats = "O_Soldier_unarmed_F"; /* Класс бота */
        classHeli = "B_Heli_Transport_01_F"; /* Класс вертолета */
        classVehicle = "B_MRAP_01_hmg_F"; /* Класс техники */	
        classBox = "Box_IND_Ammo_F"; /* Класс ящика */
        markerCrashEnabled = 1; /* Показывать маркер на карте */
        markerCrashText = "Краш с ботами"; /* Текст маркера */
        minrespectKilledBoat = 50; /* Количество респекта за бота */
        maxrespectKilledBoat = 100; /* Количество респекта за бота */
        alertCrashEnabled = 1; /* Включить текстовое оповещение */
        alertCrashTitle = "Краш с ботами"; /* Заголовок краша */
        alertCrashContent = "Группа ботов потерпела краш. Там ещё можно найти что-то ценное"; /* Контент краша */ 		
	};
	
	class crashLoot
	{
		/* Список оружия для ботов */
		class weaponBots
		{
			weapon1[] = {"arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer",5}; 
			weapon2[] = {"hgun_PDW2000_F","30Rnd_9x21_Mag",5}; 
			weapon3[] = {"arifle_MXM_F","30Rnd_65x39_caseless_mag",5};
			weapon4[] = {"LMG_Mk200_F","200Rnd_65x39_cased_Box",5};
            weapon5[] = {"LMG_Mk200_F","200Rnd_65x39_cased_Box",5};
            weapon6[] = {"LMG_Mk200_F","200Rnd_65x39_cased_Box",5};				
		};
		
		/* Список второстепенного оружия для ботов. {"","",0} - означает, что второстепенного оружия нет */
		class weaponSecondaryBots
		{
			weapon1[] = {"","",0}; 
			weapon2[] = {"CUP_launch_RPG18","CUP_RPG18_M",1}; 
			weapon3[] = {"launch_RPG7_F","RPG7_F",2};
			weapon4[] = {"launch_RPG7_F","RPG7_F",2};
		};
		
		/* Первичное оружие */
		weaponBotsPrimary[] = {"weapon1","weapon2","weapon3","weapon4","weapon5","weapon6"};
		/* Вторичное оружие */
		weaponBotsSecondary[] = {"weapon1","weapon2","weapon3","weapon4"};
		/* Список оптики для ботов */
		rifleOpticsBots[] = {"optic_ERCO_khk_F","optic_MRCO","optic_Hamr","optic_ERCO_khk_F","optic_MRCO","optic_Hamr"};
		/* Список одежды для ботов */
		uniformBots[] = {"U_OG_Guerilla3_2","U_O_CombatUniform_ocamo","U_O_PilotCoveralls"};
		/* Бронижелеты для ботов */
		vestBots[] = {"V_PlateCarrier_Kerry","V_Press_F","V_PlateCarrierL_CTRG"};
		/* Рюкзаки для ботов, появляются только если парамметр _spawnFly = 0. Если массив оставить пустым [], то рюкзаков у ботов просто не будет. */
		backpacksBots[] = {"B_Kitbag_rgr","B_Kitbag_mcamo","B_TacticalPack_mcamo"};
		/* Произвольный лут в ботах */
		itemBots[] = {"Exile_Item_EMRE","Exile_Item_Surstromming_Cooked","Exile_Item_PowerDrink"};
		/* Список рангов ботов */
		rankBoats[] = {"CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"};
		/* Рандомный список жесткости ботов. Формируется от 0 до 1, к примеру 50% это 0.5 */
		abilityBots[] = {0.5,0.6,0.7,0.8,0.9};
		
		/* Настройки ящика */
		/* оружие в ящике */
		class weaponAmmo
		{
			weapon1[] = {"arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer",3}; 
			weapon2[] = {"hgun_PDW2000_F","30Rnd_9x21_Mag",3}; 
			weapon3[] = {"arifle_MXM_F","30Rnd_65x39_caseless_mag",3};
			weapon4[] = {"LMG_Mk200_F","200Rnd_65x39_cased_Box",3};
		};
		/* Первичное оружие */
		weaponBoxPrimary[] = {"weapon1","weapon2","weapon3","weapon4"};
		/* Список оптики в ящике */
		rifleOptics[] = {"optic_ERCO_khk_F","optic_MRCO","optic_Hamr","optic_ERCO_khk_F","optic_MRCO","optic_Hamr"};
		/* Список рюкзаков в ящике */
		backpacks[] = {"B_Kitbag_rgr","B_Kitbag_mcamo","B_TacticalPack_mcamo"};
		/* Список лута в ящике */
		itemmy[] = {"muzzle_snds_L","muzzle_snds_H_SW","muzzle_snds_M","muzzle_snds_L","muzzle_snds_M","U_OG_Guerilla3_2","U_O_CombatUniform_ocamo","Exile_Item_EMRE","Exile_Item_Surstromming_Cooked","Exile_Item_PowerDrink","Exile_Item_PlasticBottleCoffee","Exile_Item_Vishpirin","Exile_Item_Matches","Exile_Item_DuctTape","Exile_Item_CanOpener","Exile_Item_Bandage","Exile_Item_InstaDoc"};	
    };
};