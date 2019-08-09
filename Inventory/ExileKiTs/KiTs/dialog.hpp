//Created By [TBI] Liam
//Gamersroost Senior Admin
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////DEFAULTS DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING///////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
class RscTextLoadout			
	{
		access = 0;			//0 - Read and Write, 1 - Read and create, 2 - Read, 3 - Read verified
		type = CT_STATIC;	//type of the control
 		idc = -1;			//control ID number
		style = ST_LEFT;	//style of the control
		w = 0.8;			//width (0-1)
		h = 0.05;			//height (0-1)
		x = 0.40;			//position on X axis (0-1)
		y = 0.50;			//position on Y axis (0-1)
		font = puristaMedium;		//font style
		sizeEx = 0.04;				//font size
		colorBackground[] = {0,0,0,0};		//background color, RGBA format (currently transparent)
		colorText[] = {1,1,1,1};			//background color, RGBA format (currently white)
		text = "example";				//text field
		fixedWidth = 0;				//0,1
		shadow = 0;				//0 - none, 1 - color affected by background, 2 - black
	};
	
class RscButtonLoadout
	{
    
  		access = 0;				//same as above
		idc = -1;				//ID number
		type = CT_BUTTON;		//type of the control
		text = "Close";		//text field
		colorText[] = {1,1,1,1};		//color of the text (currently white)
		colorDisabled[] = {0.4,0.4,0.4,0};		//color when disabled 
		colorBackground[] = {0.4,0.4,0.4,0};			//background color 
		colorBackgroundDisabled[] = {0.4,0.4,0.4,0};		//background color when disabled 
		colorBackgroundActive[] = {0.4,0.4,0.4,0};		//background color when active (selected, or hovered over) 
		colorFocused[] = {0.4,0.4,0.4,0};			//bakcground color when focused (selected) 
		colorShadow[] = {0.023529,0,0.0313725,0};		//shadow color (currently dark gray)
		colorBorder[] = {0.023529,0,0.0313725,0};		//border color (currently dark gray)
  		soundEnter[] = {"",0.09,1};			//sound upon hovering over the control (sound, volume, pitch)
    	soundPush[] = {"",0,0};			//sound upon pushing the button (sound, volume, pitch)
    	soundClick[] = {"",0.07,1};			//sound upon clicking the button (sound, volume, pitch)
    	soundEscape[] = {"",0.09,1};		//sound upon releasing the pushed button (sound, volume, pitch)
		x = 0.40;			//position on X axis (0-1)
		y = 0.6;			//position on Y axis (0-1)
		w = 0.2;			//width (0-1)
		h = 0.1;			//height (0-1)
    	style = 2;		//style of the control
    	shadow = 2;			//above
    	font = puristaMedium;	//font type
    	sizeEx = 0.05;			//font size
    	offsetX = 0;		//offset when not pressed on X axis
    	offsetY = 0;		//offset when not pressed on Y axis
    	offsetPressedX = 0.003;			//offset when pressed on X axis
    	offsetPressedY = 0.003;			//offset when pressed on Y axis
    	borderSize = 0;			//border size
		action = "closedialog 0";	//action executed upon clicking the button (currently closes the dialog itself)
	};

class LoadoutButtonDefault: RscButtonLoadout
	{
	idc = 1600;
	x = 0.358409 * safezoneW + safezoneX;
	y = 0.33984 * safezoneH + safezoneY;
	w = 0.035 * safezoneW;
	h = 0.0798888 * safezoneH;
	colorText[] = {255,255,255,0};
	colorBackground[] = {255,255,255,0};
	colorActive[] = {255,255,255,0};
	shadow = 0;
	action = hint "No Loadout Defined";
	};
	
class RscPictureLoadout
{
	access = 0;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	fixedWidth = 0;
	font = "TahomaB";
	h = 0.15;
	idc = -1;
	linespacing = 0;
	shadow = 0;
	sizeEx = 0;
	style = "0x30 + 0x800";
	text ="";
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 0;
	w = 0.2;
	x = 0;
	y = 0;
};
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//EDIT THE LOADOUTS HERE EACH LOADOUT HAS A TEXT, AN IMAGE AND AN ACTION.                                                                                                                                                       //////////////////////
//To edit the text under the image go to 	class Loadout*Text:RscText\text = "EDIT THIS";                                                                                                                                      //////////////////////
//To edit the image go to class LoadOut*: RscPicture\text = "EDIT THIS";                                                                                                                                                        //////////////////////
//To edit the action go the class Button*: LoadoutButtonDefault\action = EDIT WHAT IS HERE                        Example:   action = execVM "example.sqf";               Example:	  action = hint "EXAMPLE";					//////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Loadout			//Dialog class name
{
idd=-1;						//Display control number     -1 means the idd isn't used put an idd to be able to call this class
movingenable=false;			//True/False to enable moving the dialog with mouse
enableSimulation = 1;		//True/False to enable world simulation in the background
class controls {
	class BackgroundOn: RscPictureLoadout
		{
			idc = 901;
			text = "xm8apps\KiTs\Images\Xm8_Loadout_Background.paa";
			x = 0.293777 * safezoneW + safezoneX;
			y = 0.137015 * safezoneH + safezoneY;
			w = 0.412446 * safezoneW;
			h = 0.733303 * safezoneH;
		};
	
	class ButtonClose : RscButtonLoadout {
		x = 0.4;
		y = 0.76;
		text = "Back";
		action = "closeDialog 0;";
	};

	class LoadOut1: RscPictureLoadout
		{
			idc = 902;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.343777 * safezoneW + safezoneX;
			y = 0.337015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
	
	class LoadOut1Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.150;
		y = 0.317015;
		sizeEx = 0.03;
		text = "Default";
		};
		
	class Button1: LoadoutButtonDefault
		{
		idc = 903;
		x = 0.355625 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = execVM "Custom\Loadout\Loadouts\DefaultLoadout.sqf";
		};
		
	class LoadOut2: RscPictureLoadout
		{
			idc = 904;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.393777 * safezoneW + safezoneX;
			y = 0.337015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut2Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.265;
		y = 0.317015;
		sizeEx = 0.03;
		text = "Loadout2";
		};
		
	class Button2: LoadoutButtonDefault
		{
		idc = 905;
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};

	class LoadOut3: RscPictureLoadout																															
		{
			idc = 906;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.443777 * safezoneW + safezoneX;
			y = 0.337015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut3Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.39;
		y = 0.317015;
		sizeEx = 0.03;
		text = "Loadout3";
		};
		
	class Button3: LoadoutButtonDefault
		{
		idc = 907;
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};

	class LoadOut4: RscPictureLoadout
		{
			idc = 908;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.493777 * safezoneW + safezoneX;
			y = 0.337015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut4Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.51;
		y = 0.317015;
		sizeEx = 0.03;
		text = "Loadout4";
		};
		
	class Button4: LoadoutButtonDefault
		{
		idc = 909;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
	
	class LoadOut5: RscPictureLoadout
		{
			idc = 910;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.543777 * safezoneW + safezoneX;
			y = 0.337015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut5Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.63;
		y = 0.317015;
		sizeEx = 0.03;
		text = "Loadout5";
		};

	class Button5: LoadoutButtonDefault
		{
		idc = 911;
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};	
		
	class LoadOut6: RscPictureLoadout
		{
			idc = 912;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.593777 * safezoneW + safezoneX;
			y = 0.337015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut6Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.75;
		y = 0.317015;
		sizeEx = 0.03;
		text = "Loadout6";
		};
		
	class Button6: LoadoutButtonDefault
		{
		idc = 913;
		x = 0.613437 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};	
		
	class LoadOut7: RscPictureLoadout
		{
			idc = 914;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.343777 * safezoneW + safezoneX;
			y = 0.437015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut7Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.145;
		y = 0.49615;
		sizeEx = 0.03;
		text = "Loadout7";
		};
		
	class Button7: LoadoutButtonDefault
		{
		idc = 915;
		x = 0.355625 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut8: RscPictureLoadout
		{
			idc = 916;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.393777 * safezoneW + safezoneX;
			y = 0.437015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut8Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.265;
		y = 0.49615;
		sizeEx = 0.03;
		text = "Loadout8";
		};
		
	class Button8: LoadoutButtonDefault
		{
		idc = 917;
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut9: RscPictureLoadout
		{
			idc = 918;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.443777 * safezoneW + safezoneX;
			y = 0.437015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut9Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.39;
		y = 0.49615;
		sizeEx = 0.03;
		text = "Loadout9";
		};
		
	class Button9: LoadoutButtonDefault
		{
		idc = 919;
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut10: RscPictureLoadout
		{
			idc = 920;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.493777 * safezoneW + safezoneX;
			y = 0.437015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut10Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.51;
		y = 0.49615;
		sizeEx = 0.03;
		text = "Loadout10";
		};
		
	class Button10: LoadoutButtonDefault
		{
		idc = 921;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut11: RscPictureLoadout
		{
			idc = 922;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.543777 * safezoneW + safezoneX;
			y = 0.437015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut11Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.63;
		y = 0.49615;
		sizeEx = 0.03;
		text = "Loadout11";
		};
		
	class Button11: LoadoutButtonDefault
		{
		idc = 923;
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut12: RscPictureLoadout
		{
			idc = 924;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.593777 * safezoneW + safezoneX;
			y = 0.437015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut12Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.75;
		y = 0.49615;
		sizeEx = 0.03;
		text = "Loadout12";
		};
		
	class Button12: LoadoutButtonDefault
		{
		idc = 925;
		x = 0.613437 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut13: RscPictureLoadout
		{
			idc = 926;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.343777 * safezoneW + safezoneX;
			y = 0.537015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut13Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.145;
		y = 0.67615;
		sizeEx = 0.03;
		text = "Loadout13";
		};
		
	class Button13: LoadoutButtonDefault
		{
		idc = 927;
		x = 0.355625 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut14: RscPictureLoadout
		{
			idc = 928;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.393777 * safezoneW + safezoneX;
			y = 0.537015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut14Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.265;
		y = 0.67615;
		sizeEx = 0.03;
		text = "Loadout14";
		};
		
	class Button14: LoadoutButtonDefault
		{
		idc = 929;
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut15: RscPictureLoadout
		{
			idc = 930;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.443777 * safezoneW + safezoneX;
			y = 0.537015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut15Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.39;
		y = 0.67615;
		sizeEx = 0.03;
		text = "Loadout15";
		};
		
	class Button15: LoadoutButtonDefault
		{
		idc = 931;
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut16: RscPictureLoadout
		{
			idc = 932;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.493777 * safezoneW + safezoneX;
			y = 0.537015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut16Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.51;
		y = 0.67615;
		sizeEx = 0.03;
		text = "Loadout16";
		};
		
	class Button16: LoadoutButtonDefault
		{
		idc = 933;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut17: RscPictureLoadout
		{
			idc = 934;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.543777 * safezoneW + safezoneX;
			y = 0.537015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut17Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.63;
		y = 0.67615;
		sizeEx = 0.03;
		text = "Loadout17";
		};
		
	class Button17: LoadoutButtonDefault
		{
		idc = 935;
		x = 0.561875 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};
		
	class LoadOut18: RscPictureLoadout
		{
			idc = 936;
			text = "xm8apps\KiTs\Images\Default.paa";
			x = 0.593777 * safezoneW + safezoneX;
			y = 0.537015 * safezoneH + safezoneY;
			w = 0.062446 * safezoneW;
			h = 0.062446 * safezoneH;
		};
		
	class LoadOut18Text: RscTextLoadout
		{
		w = 0.3;
		h = 0.04;
		x = 0.75;
		y = 0.67615;
		sizeEx = 0.03;
		text = "Loadout18";
		};
		
	class Button18: LoadoutButtonDefault
		{
		idc = 937;
		x = 0.613437 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.088 * safezoneH;
		action = hint "No Loadout Defined";
		};

};	//ends controls class

};	//ends Loadouts class

//idc's used [901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937];





	




































