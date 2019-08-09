class FastTravelSystem_Dialog_Countdown
{
	idd = 147430;
	fadeout=0;
	fadein=0;
	duration = 120;
	onLoad = "uiNamespace setVariable ['FastTravelCountdownHUD', _this select 0]";

	class controlsBackground 
	{
		class FastTravel_Text_Countdown: RscText
		{
			idc = 147431;
			text = "Remaining time:";
			x = 0.876406 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FastTravel_Text_Counter: RscText
		{
			idc = 147432;
			text = "0 s";
			x = 0.876406 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	class controls
	{
	};
};

