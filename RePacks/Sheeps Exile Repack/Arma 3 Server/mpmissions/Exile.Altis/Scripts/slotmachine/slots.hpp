//////////////////////////////////////////
//	Slot Dialog made by Fallingsheep	//
//////////////////////////////////////////
class RscDisplaySlots
{
   idd = 9000;
   movingenable = false;

   class Controls
   {
	 class RscBackground_5000: RscBackground
     {
       idc = 5000;
	   colorBackground[] = {0,0,0,1};
	   colorText[] = {1,1,1,1};
       x = 0.32375 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.367188 * safezoneW;
       h = 0.3055 * safezoneH;
     };
     class RscFrame_1800: MyRscFrame
     {
       idc = 1800;
	   colorBackground[] = {0,0,0,1};
	   colorText[] = {1,1,1,1};
       x = 0.32375 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.367188 * safezoneW;
       h = 0.3055 * safezoneH;
     };
     class credittext_TXT: RscText
     {
       idc = 1000;
       text = "Credits:";
       x = 0.32375 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.0440625 * safezoneW;
       h = 0.0235 * safezoneH;
     };
     class credits_TXT: RscText
     {
       idc = 1001;
       text = "0";
       x = 0.367812 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.0514062 * safezoneW;
       h = 0.0235 * safezoneH;
     };
     class RscPicture_1201: RscPicture
     {
       idc = 1201;
       text = "#(argb,8,8,3)color(1,1,1,1)";
       x = 0.477969 * safezoneW + safezoneX;
       y = 0.3825 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.1175 * safezoneH;
     };
     class RscPicture_1202: RscPicture
     {
       idc = 1202;
       text = "#(argb,8,8,3)color(1,1,1,1)";
       x = 0.573438 * safezoneW + safezoneX;
       y = 0.3825 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.1175 * safezoneH;
     };
     class RscPicture_1200: RscPicture
     {
       idc = 1200;
       text = "#(argb,8,8,3)color(1,1,1,1)";
       x = 0.3825 * safezoneW + safezoneX;
       y = 0.3825 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.1175 * safezoneH;
     };
     class spin_BTN: RscButton
     {
       idc = 1600;
       text = "SPIN";
       x = 0.338437 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.0235 * safezoneH;
	   onButtonClick = "[] execVM 'scripts\slotmachine\slots.sqf';";
     };
     class credit1_BTN: RscButton
     {
       idc = 1601;
       text = "1 Spin";
       x = 0.419219 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.0734375 * safezoneW;
       h = 0.0235 * safezoneH;
	   onButtonClick = "[] execVM 'scripts\slotmachine\add1credit.sqf';";
     };
     class credit10_BTN: RscButton
     {
       idc = 1602;
       text = "10 Spins";
       x = 0.514687 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.0807813 * safezoneW;
       h = 0.0235 * safezoneH;
	   onButtonClick = "[] execVM 'scripts\slotmachine\add10credit.sqf';";
     };
     class cashout_BTN: RscButton
     {
       idc = 1603;
       text = "CASH OUT";
       x = 0.6175 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.0235 * safezoneH;
	   onButtonClick = "[] execVM 'scripts\slotmachine\cashout.sqf';";
     };
   };
};