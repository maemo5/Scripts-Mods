/*Created by Blacklistgaming.org Coder: PapaBear */
 
 #define GUI_GRID_X    (0)
 #define GUI_GRID_Y    (0)
 #define GUI_GRID_W    (0.025)
 #define GUI_GRID_H    (0.04)
 #define GUI_GRID_WAbs    (1)
 #define GUI_GRID_HAbs    (1)
 class BlackjackRscButton
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0.212,0.2,0.231,0.3};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBackgroundActive[] = {1,1,1,0.1};
	colorFocused[] = {1,1,1,0.1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {1,1,1,0.1};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};
 class BlackjackRscButtonMenu
{
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	textSecondary = "";
	colorSecondary[] = {1,1,1,1};
	colorFocusedSecondary[] = {0,0,0,1};
	color2Secondary[] = {0,0,0,1};
	colorDisabledSecondary[] = {1,1,1,0.25};
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "PuristaLight";
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.09,
		1
	};
};
 class BlackjackRscText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 2;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "PuristaMedium";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
 
 class BlackjackGUI{	
 idd = 5980; 
	name="black_jack"; 
	movingEnabled = 0; 
	enableSimulation = 1; 
	onLoad = ""; 
	class controlsBackground {			
		class RscFrame_1800: BlackjackRscText {			
		idc = 5981; 
			colorBackground[] = {0,0,0,0.7}; 
			x = 3 * GUI_GRID_W + GUI_GRID_X; 
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 31 * GUI_GRID_W; 
			h = 20.5 * GUI_GRID_H; 
		}; 
				class RscText_1000: BlackjackRscText {
				idc = 5988; 
			text = "Dealer"; 

			x = 5 * GUI_GRID_W + GUI_GRID_X; 
			y = 3 * GUI_GRID_H + GUI_GRID_Y; 
			w = 5 * GUI_GRID_W; 
			h = 2 * GUI_GRID_H; 
		}; 
		class RscText_1001: BlackjackRscText {
		idc = 5989; 
			text = "Player"; 

			x = 20 * GUI_GRID_W + GUI_GRID_X; 
			y = 3 * GUI_GRID_H + GUI_GRID_Y; 
			w = 6 * GUI_GRID_W; 
			h = 2 * GUI_GRID_H; 
		}; 
				class RscText_1012: BlackjackRscText {			
				idc = 5999; 
			text = "BLACKJACK"; 

			x = 9 * GUI_GRID_W + GUI_GRID_X; 
			y = 1 * GUI_GRID_H + GUI_GRID_Y; 
			w = 18.5 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
			sizeEx = 3 * GUI_GRID_H; 
		}; 
		class RscText_1013: BlackjackRscText {			
		idc = 6000; 
			text = "Winnings: "; 

			x = 5.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 15 * GUI_GRID_H + GUI_GRID_Y; 
			w = 5 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
	}; 
	class controls	{		
			class STAY_BTN: BlackjackRscButtonMenu {			
			idc = 5982; 
			text = "Stay"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[] execVM 'scripts\blackjack\fn_BJstay.sqf';"; 
			x = 20 * GUI_GRID_W + GUI_GRID_X; 
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class HIT_BTN: BlackjackRscButtonMenu {			
		idc = 5983; 
			text = "Hit"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[] execVM 'scripts\blackjack\fn_BJhit.sqf';";
			x = 27 * GUI_GRID_W + GUI_GRID_X; 
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class TOTAL: BlackjackRscText {			
		idc = 6007; 
			text = "Total: "; 

			x = 28 * GUI_GRID_W + GUI_GRID_X; 
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_5K: BlackjackRscButtonMenu {			
		idc = 5984; 
			text = "500"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[500] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 6 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_10K: BlackjackRscButtonMenu {			
		idc = 5985; 
			text = "1K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[1000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 13 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_25K: BlackjackRscButtonMenu {			
		idc = 5986; 
			text = "2K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[2000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 20 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_50K: BlackjackRscButtonMenu {			
		idc = 5987; 
			text = "5K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[5000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 27 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_1: BlackjackRscText {			
				idc = 5990; 
			x = 5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_2: BlackjackRscText {			
		idc = 5991; 
			x = 9.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_1: BlackjackRscText {			
		idc = 5992; 
			x = 20.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_2: BlackjackRscText {			
		idc = 5993; 
			x = 24.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_3: BlackjackRscText {			
		idc = 5994; 
			x = 28.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_4: BlackjackRscText {			
		idc = 5995; 
			x = 5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_5: BlackjackRscText {			
		idc = 5996; 
			x = 9.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_4: BlackjackRscText {			
		idc = 5997; 
			x = 20.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_5: BlackjackRscText {			
		idc = 5998; 
			x = 24.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
				class Winnings: BlackjackRscText {			
				idc = 6001; 
			x = 11 * GUI_GRID_W + GUI_GRID_X; 
			y = 15 * GUI_GRID_H + GUI_GRID_Y; 
			w = 5 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class EXIT_BTN: BlackjackRscButton {			
		idc = 6002; 
			text = "EXIT"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "closeDialog 0;"; 
			x = 30 * GUI_GRID_W + GUI_GRID_X; 
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1015: BlackjackRscText {			
		idc = 6003; 
			text = "BET"; 

			x = 7 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1016: BlackjackRscText {			
		idc = 6004; 
			text = "BET"; 

			x = 14 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1017: BlackjackRscText {			
		idc = 6005; 
			text = "BET"; 

			x = 21 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1018: BlackjackRscText {			
		idc = 6006; 
			text = "BET"; 

			x = 28 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
	}; 
}; 
