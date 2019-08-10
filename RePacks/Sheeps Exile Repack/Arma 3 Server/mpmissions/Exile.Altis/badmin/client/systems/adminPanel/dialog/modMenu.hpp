// *****************************************************************************************
// * This script is licensed under the GNU Lesser GPL v3. Copyright © 2015 A3Wasteland.com *
// *****************************************************************************************
#define modMenu_dialog 50004
#define modMenu_option 50005

class ModMenu
{
	idd = modMenu_dialog;
	movingEnable=1;
	onLoad = "uiNamespace setVariable ['ModMenu', _this select 0]";

	class controlsBackground {

		class DebugMenu_background:w_RscPicture
		{
			idc=-1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "#(argb,8,8,3)color(0,0,0,0.6)";
			x=0.28;
			y=0.10;
			w=0.3505;
			h=0.70;
		};

		class TopBar: w_RscPicture
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "#(argb,8,8,3)color(0.25,0.51,0.96,0.8)";

			x=0.28;
			y=0.10;
			w=0.3505;
			h=0.05;
		};

		class ModMenu_Title:w_RscText
		{
			idc=-1;
			text="bAdmin Menu";
			x=0.29;
			y=0.108;
			w=0.088;
			h=0.035;
		};
	};

	class controls {

		class ModMenu_options:w_Rsclist
		{
			idc = modMenu_option;
			x=0.30;
			y=0.18;
			w=0.31;
			h=0.49;
		};

		class ModMenu_activate:w_RscButton
		{
			idc=-1;
			text="Select";
			onButtonClick = "[0] execVM 'badmin\client\systems\adminPanel\optionSelect.sqf'";
			x=0.345;
			y=0.70;
			w=0.22;
			h=0.071;
		};
	};
};
