class CfgExileCustomCode 
{
	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon\myfunction.sqf";
	*/

	// dynamicLockerLimit
	ExileClient_gui_lockerDialog_event_onDepositButtonClick = "Custom\dynamicLockerLimit\ExileClient_gui_lockerDialog_event_onDepositButtonClick.sqf";
	ExileClient_gui_lockerDialog_show = "Custom\dynamicLockerLimit\ExileClient_gui_lockerDialog_show.sqf";
	ExileClient_system_locker_network_lockerResponse = "Custom\dynamicLockerLimit\ExileClient_system_locker_network_lockerResponse.sqf";
	ExileServer_system_locker_network_lockerDepositRequest = "Custom\dynamicLockerLimit\ExileServer_system_locker_network_lockerDepositRequest.sqf";
};

class CfgLocker 
{
	numbersOnly = "0123456789";
	maxDeposit = 40000;

	multiplyer = 2; // the multiplier to scale the maxDeposit value
};

class CfgTrading 
{
	/*
	* This factor defines the difference between sales/purchase price of
	* items and vehicles. It is used if there is no sales price defined
	* in CfgExileArsenal. 
	*/
	sellPriceFactor = 0.5;
	
	rekeyPriceFactor = 0.1;

	class requiredRespect 
	{
		Level1 = 0;
		Level2 = 5000;
		Level3 = 10000;
		Level4 = 20000;
		Level5 = 30000;
		Level6 = 40000;
		Level7 = 50000;
		Level8 = 60000;
		Level9 = 70000;
		Level10 = 80000;
		Level11 = 100000;
		Level12 = 110000;
		Level13 = 120000;
		Level14 = 130000;
		Level15 = 140000;
		Level16 = 150000;
		Level17 = 160000;
		Level18 = 170000;
		Level19 = 180000;
		Level20 = 190000;
		Level21 = 200000;
		Level22 = 210000;
		Level23 = 220000;
		Level24 = 230000;
		Level25 = 240000;
		Level26 = 250000;
		Level27 = 260000;
		Level28 = 270000;
		Level29 = 280000;
		Level30 = 290000;
		Level31 = 300000;
		Level32 = 310000;
		Level33 = 320000;
		Level34 = 330000;
		Level35 = 340000;
		Level36 = 350000;
		Level37 = 360000;
		Level38 = 370000;
		Level39 = 380000;
		Level40 = 390000;
		Level41 = 400000;
		Level42 = 410000;
		Level43 = 420000;
		Level44 = 430000;
		Level45 = 440000;
		Level46 = 450000;
		Level47 = 460000;
		Level48 = 470000;
		Level49 = 480000;
		Level50 = 500000;
		Level51 = 520000;
		Level52 = 540000;
		Level53 = 560000;
		Level54 = 580000;
		Level55 = 600000;
		Level56 = 620000;
		Level57 = 640000;
		Level58 = 660000;
		Level59 = 680000;
		Level60 = 700000;
		Level61 = 720000;
		Level62 = 740000;
		Level63 = 760000;
		Level64 = 780000;
		Level65 = 800000;
		Level66 = 820000;
		Level67 = 840000;
		Level68 = 860000;
		Level69 = 880000;
		Level70 = 900000;
		Level71 = 920000;
		Level72 = 940000;
		Level73 = 960000;
		Level74 = 980000;
		Level75 = 1000000;
		Level76 = 1020000;
		Level77 = 1040000;
		Level78 = 1060000;
		Level79 = 1080000;
		Level80 = 1100000;
		Level81 = 1120000;
		Level82 = 1140000;
		Level83 = 1160000;
		Level84 = 1180000;
		Level85 = 1200000;
		Level86 = 1220000;
		Level87 = 1240000;
		Level88 = 1260000;
		Level89 = 1280000;
		Level90 = 1300000;
		Level91 = 1320000;
		Level92 = 1340000;
		Level93 = 1360000;
		Level94 = 1380000;
		Level95 = 1400000;
		Level96 = 1420000;
		Level97 = 1440000;
		Level98 = 1460000;
		Level99 = 1500000;
		Level100 = 999999999999;
		//LevelN = N;
		// add as many levels you want!
	};
};