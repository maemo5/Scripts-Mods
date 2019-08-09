class RscTitles {
	class serverMenuItemShow
	{ 
		idd = 777; 
		duration = 99999; 
		name = "serverMenuItemShow";
		onLoad = "with uiNameSpace do { serverMenuItemShow = _this select 0 }";
		fadeIn = 0.2;
				
		class controls 
		{ 
			class structuredText
			{ 
				idc = 7777; 
				type = 13; 
				style = 0;  
				font = "PuristaMedium"; 
				x = 0.02; 
				y = 0.01; 
				w = 1; 
				h = 1;
				sizeEx = 0;
				size = 0.04;
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1}; 
				text = "";
				lineSpacing = 0;			
			};
			class RscBackground
			{
				idc = 77777; 
				type = 13; 
				style = 0;  
				font = "PuristaMedium"; 
				x = 0; 
				y = 0; 
				w = 1; 
				h = 1;
				sizeEx = 0;
				size = 0;
				colorBackground[] = {0,0,0,0.5};
				colorText[] = {1,1,1,1}; 
				text = "";
				lineSpacing = 0;
			};
		}; 
	};
};