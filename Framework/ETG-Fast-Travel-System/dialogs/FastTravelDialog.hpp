/*
	Filename: FastTravel_OnLbSelChange.sqf
	Author: Kellojo
	Description: Sets up fast travel system dialog (Price&Time)
	If you want to edit the dialog use this:
	
/* #Wudowu
$[
	1.063,
	["FastTravel_Dialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"FastTravel_Background",[1,"",["0.324687 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.350625 * safezoneW","0.396 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"FastTravel_Button",[1,"Reisen",["0.561875 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.103125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"FastTravel_Listbox",[1,"",["0.561875 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.103125 * safezoneW","0.22 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Wï¿½hle ein Reiseziel aus.","-1"],[]],
	[1001,"FastTravel_Text_Headline",[1,"Schnellreise System",["0.324687 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.350625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"FastTravel_Map_Map",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.334999 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.216563 * safezoneW","0.352 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"FastTravel_Text_Price",[1,"Preis:",["0.561875 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0309375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"FastTravel_Text_PriceCounter",[1,"0.00ï¿½",["0.603125 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"FastTravel_Text_Time",[1,"Reisedauer:",["0.561875 * safezoneW + safezoneX","0.423 * safezoneH + safezoneY","0.0515625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"FastTravel_TimeCounter",[1,"0 s",["0.62375 * safezoneW + safezoneX","0.423 * safezoneH + safezoneY","0.04125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


/* #Xihecy
$[
	1.063,
	["FastTravel_Countdown",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"FastTravel_Text_Countdown",[1,"Verbleibende Zeit:",["0.876406 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.103125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"FastTravel_Text_Counter",[1,"1573 s",["0.876406 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.103125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class ETG_FastTravelSystem_Dialog
{
    idd = 147410;
    movingEnable = false;
    moving = 0;
    onLoad = "[2] spawn fn_ftravel"

    class controlsBackground
    {
        class FastTravel_Background: IGUIBack
        {
            idc = 2200;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.350625 * safezoneW;
            h = 0.396 * safezoneH;
        };
    };
    class controls
    {
        class FastTravel_Button: RscButton
        {
            idc = 147412;
            text = "Travel";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            action = "_destination = lbData [147413,(lbCurSel 147413)];[3,_destination] spawn fn_ftravel; closeDialog 0;";
            colorBackground[] = {0.59,0.98,0.13,0.6};
        };
        class FastTravel_Listbox: RscListbox
        {
            idc = 147413;
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.22 * safezoneH;
            tooltip = "Select your destination.";
            onLBSelChanged = "[1] spawn fn_ftravel";
        };
        class FastTravel_Text_Headline: RscText
        {
            idc = 147414;
            text = "Fast Travel System";
            colorBackground[] = {0.59,0.98,0.13,0.6};
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.350625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FastTravel_Map_Map: rscMapControl
        {
            idc = 147415;
            x = 0.334999 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.352 * safezoneH;
        };
        class FastTravel_Text_Price: RscText
        {
            idc = 147416;
            text = "Price:";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FastTravel_Text_PriceCounter: RscText
        {
            idc = 147417;
            text = "0.00 tabs";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FastTravel_Text_Time: RscText
        {
            idc = 147418;
            text = "Duration:";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FastTravel_TimeCounter: RscText
        {
            idc = 147419;
            text = "0 s";
            x = 0.62375 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

