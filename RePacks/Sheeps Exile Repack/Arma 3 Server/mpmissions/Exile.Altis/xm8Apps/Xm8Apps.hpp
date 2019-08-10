/*
XM8 Apps dialog made by shix
*/
class XM8Apps
{
    idd = 8457;
    movingenable=false;
	class Controls
	{ 
		class BackgroundOff: RscPictureKeepAspect
		{
			idc = 4000;

			text = "\exile_assets\texture\ui\xm8_off_ca.paa"; //--- ToDo: Localize;
			x = 0.293777 * safezoneW + safezoneX;
			y = 0.137015 * safezoneH + safezoneY;
			w = 0.412446 * safezoneW;
			h = 0.733303 * safezoneH;
		};
		class BackgroundOn: RscPictureKeepAspect
		{
			idc = 4001;

			text = "\exile_assets\texture\ui\xm8_on_ca.paa"; //--- ToDo: Localize;
			x = 0.293777 * safezoneW + safezoneX;
			y = 0.137015 * safezoneH + safezoneY;
			w = 0.412446 * safezoneW;
			h = 0.733303 * safezoneH;
		};
		class LeftHeader: RscStructuredText
		{
			idc = 4003;

			text = "<t align='left' font='RobotoRegular' shadow='0'>147257</t>"; //--- ToDo: Localize;
			x = 0.33471 * safezoneW + safezoneX;
			y = 0.273409 * safezoneH + safezoneY;
			w = 0.17529 * safezoneW;
			h = 0.0219991 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RightHeader: RscStructuredText
		{
			idc = 4005;

			text = "<t align='right' font='RobotoRegular' shadow='0'><img image='\exile_assets\texture\ui\xm8_signal_0_ca.paa' shadow='0'/> 21:45</t>"; //--- ToDo: Localize;
			x = 0.49 * safezoneW + safezoneX;
			y = 0.273409 * safezoneH + safezoneY;
			w = 0.17529 * safezoneW;
			h = 0.0219991 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class CenterHeader: RscStructuredText
		{
			idc = 4004;

			text = "<t align='center' font='RobotoMedium' shadow='0'>XM8</t>"; //--- ToDo: Localize;
			x = 0.386577 * safezoneW + safezoneX;
			y = 0.273409 * safezoneH + safezoneY;
			w = 0.226846 * safezoneW;
			h = 0.0219991 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class PowerButton: RscButton
		{
			idc = 4006;
			onButtonClick = "[] execVM 'xm8Apps\Power_Off.sqf';";
			colorBackgroundActive[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};

			x = 0.489689 * safezoneW + safezoneX;
			y = 0.686992 * safezoneH + safezoneY;
			w = 0.0206223 * safezoneW;
			h = 0.0439982 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "On/Off"; //--- ToDo: Localize;
		};
		class App1_Btn: RscButton
		{
			idc = 1601;
			onButtonClick = "call app1_action;";

			x = 0.355663 * safezoneW + safezoneX;
			y = 0.291085 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App1_txt: RscText
		{
			idc = 1000;

			text = "App 1 Text"; //--- ToDo: Localize;
			x = 0.355663 * safezoneW + safezoneX;
			y = 0.357058 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App1_Logo: RscPictureKeepAspect
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.360818 * safezoneW + safezoneX;
			y = 0.30208 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App2_Btn: RscButton
		{
			idc = 1602;
			onButtonClick = "call app2_action;";

			x = 0.469071 * safezoneW + safezoneX;
			y = 0.291085 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App2_txt: RscText
		{
			idc = 1001;

			text = "App 2 Text"; //--- ToDo: Localize;
			x = 0.469071 * safezoneW + safezoneX;
			y = 0.357058 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App2_Logo: RscPictureKeepAspect
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.474225 * safezoneW + safezoneX;
			y = 0.30208 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App3_Btn: RscButton
		{
			idc = 1603;
			onButtonClick = "call app3_action;";

			x = 0.582479 * safezoneW + safezoneX;
			y = 0.291085 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App3_txt: RscText
		{
			idc = 1002;

			text = "App 3 Text"; //--- ToDo: Localize;
			x = 0.582479 * safezoneW + safezoneX;
			y = 0.357058 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App3_Logo: RscPictureKeepAspect
		{
			idc = 1202;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.587633 * safezoneW + safezoneX;
			y = 0.30208 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App4_Btn: RscButton
		{
			idc = 1607;
			onButtonClick = "call app4_action;";

			x = 0.355663 * safezoneW + safezoneX;
			y = 0.412036 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App4_txt: RscText
		{
			idc = 1003;

			text = "App 4 Text"; //--- ToDo: Localize;
			x = 0.355663 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App4_Logo: RscPictureKeepAspect
		{
			idc = 1203;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.360818 * safezoneW + safezoneX;
			y = 0.423031 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App5_Btn: RscButton
		{
			idc = 1604;
			onButtonClick = "call app5_action;";

			x = 0.469071 * safezoneW + safezoneX;
			y = 0.412036 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App5_txt: RscText
		{
			idc = 1004;

			text = "App 5 Text"; //--- ToDo: Localize;
			x = 0.469071 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App5_Logo: RscPictureKeepAspect
		{
			idc = 1204;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.474225 * safezoneW + safezoneX;
			y = 0.423031 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App6_Btn: RscButton
		{
			idc = 1606;
			onButtonClick = "call app6_action;";

			x = 0.582479 * safezoneW + safezoneX;
			y = 0.412036 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App6_txt: RscText
		{
			idc = 1005;

			text = "App 6 Text"; //--- ToDo: Localize;
			x = 0.582479 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App6_Logo: RscPictureKeepAspect
		{
			idc = 1205;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.587633 * safezoneW + safezoneX;
			y = 0.423031 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App7_Btn: RscButton
		{
			idc = 1608;
			onButtonClick = "call app7_action;";

			x = 0.355663 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App7_txt: RscText
		{
			idc = 1006;

			text = "App 7 Text"; //--- ToDo: Localize;
			x = 0.355663 * safezoneW + safezoneX;
			y = 0.59896 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App7_Logo: RscPictureKeepAspect
		{
			idc = 1206;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.360818 * safezoneW + safezoneX;
			y = 0.543982 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App8_Btn: RscButton
		{
			idc = 1605;
			onButtonClick = "call app8_action;";

			x = 0.469071 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App8_txt: RscText
		{
			idc = 1007;

			text = "App 8 Text"; //--- ToDo: Localize;
			x = 0.469071 * safezoneW + safezoneX;
			y = 0.59896 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App8_Logo: RscPictureKeepAspect
		{
			idc = 1207;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.474225 * safezoneW + safezoneX;
			y = 0.543982 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class App9_Btn: RscButton
		{
			idc = 1609;
			onButtonClick = "call app9_action;";

			x = 0.582479 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.109955 * safezoneH;
		};
		class App9_txt: RscText
		{
			idc = 1008;

			text = "App 9 Text"; //--- ToDo: Localize;
			x = 0.582479 * safezoneW + safezoneX;
			y = 0.59896 * safezoneH + safezoneY;
			w = 0.061867 * safezoneW;
			h = 0.0439822 * safezoneH;
		};
		class App9_Logo: RscPictureKeepAspect
		{
			idc = 1208;

			text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
			x = 0.587633 * safezoneW + safezoneX;
			y = 0.543982 * safezoneH + safezoneY;
			w = 0.0515558 * safezoneW;
			h = 0.0659733 * safezoneH;
		};
		class GoBackBtn: RscButton
		{
			idc = 1610;
			text = "Go Back"; //--- ToDo: Localize;
			x = 0.582479 * safezoneW + safezoneX;
			y = 0.650859 * safezoneH + safezoneY;
			w = 0.0618589 * safezoneW;
			h = 0.0329866 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 8457);  execVM'XM8APPS\Scripts\open_Main_Menu.sqf';";
		};
	};
};