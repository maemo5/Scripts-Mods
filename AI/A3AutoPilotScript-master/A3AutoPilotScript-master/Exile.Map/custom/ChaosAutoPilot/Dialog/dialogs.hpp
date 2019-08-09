class ChaosPilot_Loiter_Dialog
{
	idd = 53565; //random number
	movingEnabled = false;
	class controlsBackground 
	{
		//background tablet picture
		class ChaosPilot_rsc_Background: ChaosRscPicture
		{
			idc = -1;
			//text = "#(argb,8,8,3)color(1,1,1,1)";
			text = "custom\ChaosAutoPilot\Dialog\images\tablet_co.paa";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorText[] = {1,1,1,1};
			//colorBackground[] = {1,1,1,1};
			//colorActive[] = {1,1,1,1};
		};
	};
	
	
	class controls
	{
		//map
		class ChaosPilot_rsc_Map: ChaosRscMapControl
		{
			idc = 1800;
			x = 0.3 * safezoneW + safezoneX; //starting 0.3 seems good split
			y = 0.1201171875 * safezoneH + safezoneY; //starting point is 123.0 pixels so 123.0 is 12.01171875% of 1024
			w = 0.6009765625 * safezoneW; //end point is 101.4 pixels from edge so 101.4 is  9.90234375% of 1024, 1-(0.0990234375 + 0.3) = 0.6009765625
			h = 0.73046875 * safezoneH; //end point is 153.0 pixels from edge so 153.0 is 14.94140625% of 1024, 1-(0.1494140625 + 0.1201171875) = 0.73046875
			scaleMin = 0.01;
			scaleMax = 0.65;
			scaleDefault = 0.65; //0.16
		};

		//TEXT START//
		class ChaosPilot_rsc_text_Radius: ChaosRscText
		{
			idc = -1;
			text = "Radius"; //--- ToDo: Localize;
			x = 0.127372 * safezoneW + safezoneX;
			y = 0.269098 * safezoneH + safezoneY;
			w = 0.186314 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class ChaosPilot_rsc_text_Height: ChaosRscText
		{
			idc = -1;
			text = "Height"; //--- ToDo: Localize;
			x = 0.127372 * safezoneW + safezoneX;
			y = 0.357061 * safezoneH + safezoneY;
			w = 0.186314 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class ChaosPilot_rsc_text_Side: ChaosRscText
		{
			idc = -1;
			text = "Side"; //--- ToDo: Localize;
			x = 0.127372 * safezoneW + safezoneX;
			y = 0.445023 * safezoneH + safezoneY;
			w = 0.186314 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		//TEXT END//
		
		//COMBO START//
		class ChaosPilot_rsc_combo_Radius: ChaosRscCombo
		{
			idc = 3100;
			x = 0.127372 * safezoneW + safezoneX;
			y = 0.302084 * safezoneH + safezoneY;
			w = 0.144911 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.113, 0.635, 0.862};
			colorActive[] = {0.101, 0.341, 0.560};
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class ChaosPilot_rsc_combo_Height: ChaosRscCombo
		{
			idc = 3101;
			x = 0.127372 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.144911 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.113, 0.635, 0.862};
			colorActive[] = {0.101, 0.341, 0.560};
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class ChaosPilot_rsc_combo_Side: ChaosRscCombo
		{
			idc = 3102;
			x = 0.127372 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.144911 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.113, 0.635, 0.862};
			colorActive[] = {0.101, 0.341, 0.560};
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class ChaosPilot_rsc_btn_TurnOn: ChaosRscButton
		{
			idc = 3600;
			text = "Turn On"; //--- ToDo: Localize;
			x = 0.158424 * safezoneW + safezoneX;
			y = 0.697916 * safezoneH + safezoneY;
			w = 0.0828063 * safezoneW;
			h = 0.0439812 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.149, 0.549, 0.266};
			colorFocused[] = {0.788, 0.121, 0.113};
			//sizeEx = 1.5 * GUI_GRID_H;
		};		
		//COMBO END//
	};
};




