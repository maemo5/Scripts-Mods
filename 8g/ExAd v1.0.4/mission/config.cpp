/*
* Overwrite your old CfgXM8 with the below. Remove any apps you do not wish to have. 
* Make sure if you remove an app that you remove it from all locations: CfgXM8, extraApps, & XM8 app buttons.
* If you wish to use ExAd Virtual Garage make sure to disable the new Exile VG.
*   class CfgVirtualGarage
*	{	
*		enableVirtualGarage = 0;
*	}; 
*/
class CfgXM8 
{
	extraApps[] = {"ExAd_JX","ExAd_Info","ExAd_CHVD","ExAd_VG","BRAmaRecipes","BaseMarker","ExAd_SB","ExAd_Quad","ExAd_Unit"};
	
	class settings
	{
		controlID = 4070;
		appID = "App01";
		title = "Settings";
	};
	
	class healthScanner
	{
		controlID = 4120;
		appID = "App02";
		title = "Health Scanner";
	};
	
	class slothMachine
	{
		controlID = 4140;
		appID = "App03";
		title = "Sloth Machine";
	};
	/*
	* Make sure you change the server rules to match your desires.
	* You can find the file at ExAdClient\XM8\apps\info
	* The file you want to change is message.sqf
	*/
	class ExAd_Info
    {
        title = "Server Rules";				//IDC:50100 -> 50102 || These need to be unique and out of range from each other
        controlID = 50100;                  
        logo = "ExadClient\XM8\Apps\Info\Icon_SI.paa";
        onLoad = "ExAdClient\XM8\Apps\Info\onLoad.sqf";
        onOpen = "ExAdClient\XM8\Apps\Info\onOpen.sqf";
        onClose = "ExAdClient\XM8\Apps\Info\onClose.sqf";
    };
    class ExAd_CHVD
    {
        title = "View Distance Settings";
        controlID = 50200;                  
        config = "ExadClient\XM8\Apps\CHVD\config.sqf";
        logo = "ExadClient\XM8\Apps\CHVD\Icon_CHVD.paa";
        onLoad = "ExAdClient\XM8\Apps\CHVD\onLoad.sqf";
        onOpen = "ExAdClient\XM8\Apps\CHVD\onOpen.sqf";
        onClose = "ExAdClient\XM8\Apps\CHVD\onClose.sqf";
    };
    class ExAd_JX
    {
        title = "Unit Scanner";
        controlID = 85100;                    
        logo = "ExadClient\XM8\Apps\JX\logo.paa";
        onLoad = "ExAdClient\XM8\Apps\JX\onLoad.sqf";
        onOpen = "ExAdClient\XM8\Apps\JX\onOpen.sqf";
        onClose = "ExAdClient\XM8\Apps\JX\onClose.sqf";
    };
	 class ExAd_VG
    {
        title = "Virtual Garage";
        controlID = 50000;                  //IDC:50000 -> 50015 || These need to be unique and out of range from each other
        logo = "ExadClient\XM8\Apps\VG\Icon_VG.paa";
        onLoad = "ExAdClient\XM8\Apps\VG\onLoad.sqf";
        onOpen = "ExAdClient\XM8\Apps\VG\onOpen.sqf";
        onClose = "ExAdClient\XM8\Apps\VG\onClose.sqf";
    };
	class BRAmaRecipes
    {
        controlID = 107000;
        title = "Recipies";
        logo = "ExAdClient\XM8\Apps\BRAmaRecipes\BRAma.paa";
        config = "ExAdClient\XM8\Apps\BRAmaRecipes\config.sqf";
        onLoad = "ExAdClient\XM8\Apps\BRAmaRecipes\onLoad.sqf";
        onOpen = "ExAdClient\XM8\Apps\BRAmaRecipes\onOpen.sqf";
    };
	class BaseMarker
	 {
		 title = "Base Marker";
		 controlID = 70001;
		 logo = "ExAdClient\XM8\Apps\BaseMarker\BaseMarker.paa";
		 onLoad = "ExAdClient\XM8\Apps\BaseMarker\onLoad.sqf";
	 };
	 class ExAd_SB
    {
        title = "Statsbar Settings";
        controlID = 50400;                  //IDC:50400 -> 50475 || These need to be unique and out of range from each other
        logo = "exile_assets\texture\ui\xm8_app_settings_ca.paa";
        onLoad = "ExAdClient\XM8\Apps\SB_Settings\onLoad.sqf";
    };
	class ExAd_Quad
     {
        title = "Deploy Quad Bike";
        config = "ExAdClient\XM8\Apps\DeployVehicle\config.sqf";
        logo = "ExAdClient\XM8\Apps\DeployVehicle\Quad.paa";
        bambiState = 0;
        vehicleClass = "Exile_Bike_QuadBike_Fia";
        recipe[] = {{"Exile_Item_ExtensionCord",1}};
        packable = 1;
        autoCleanUp = 1;
        quickFunction = "['ExAd_Quad'] call ExAd_XM8_DV_fnc_spawnVehicle";
     };
	 class ExAd_Unit
     {
        title = "Recruit Soldier: x2 Beef Parts needed";
        logo = "ExAdClient\XM8\Apps\DeployVehicle\dog.paa";
        bambiState = 0;
        vehicleClass = "Land_AncientStatue_01_F";
        recipe[] = {{"Exile_Item_BeefParts",1}};
        packable = 0;
        autoCleanUp = 0;
        quickFunction = "['ExAd_Unit'] call ExAd_XM8_DV_fnc_spawnVehicle";
     };
};
/*
	XM8 Extra apps, the Exile way of doing it
	
	Here is an example app layout:
	class XM8_App01_Button: RscExileXM8AppButton1x1
	{
	    textureNoShortcut = "";  	// Path to picture. This can be via mission file or client side PBO
	    text = "";					// The name of the app to be display on the button
	    onButtonClick = "";			// The code to fire when the app is clicked
	    resource = "";				// The name of the resource to load for the app, leave as an empty string if you just want to run code without a GUI, like BOOM or spawning a bike
	};
*/

class XM8_App01_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_settings_ca.paa";
    text = "Settings";
    onButtonClick = "['settings', 0] call ExileClient_gui_xm8_slide";
    resource = "XM8SlideSettings";
};

class XM8_App02_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_health_scanner_ca.paa";
    text = "Health Scanner";
    onButtonClick = "['healthScanner', 0] call ExileClient_gui_xm8_slide";
    resource = "XM8SlideHealthScanner";
};

class XM8_App03_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_slothMachine_ca.paa";
    text = "Sloth Machine";
    onButtonClick = "['slothMachine', 0] call ExileClient_gui_xm8_slide";
    resource = "XM8SlideSlothMachine";
};

class XM8_App04_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_boom_ca.paa";
    text = "BOOM!";
    onButtonClick = "call ExileClient_system_breaching_detonate";
    resource = "";
};

class XM8_App05_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExadClient\XM8\Apps\CHVD\Icon_CHVD.paa";
    text = "View Distance Settings";
    onButtonClick = "['ExAd_CHVD', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App06_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExadClient\XM8\Apps\Info\Icon_SI.paa";
    text = "Server Rules";
    onButtonClick = "['ExAd_Info', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App07_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExadClient\XM8\Apps\JX\logo.paa";
    text = "Unit Scanner";
    onButtonClick = "['ExAd_JX', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App08_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExAdClient\XM8\Apps\DeployVehicle\dog.paa";
    text = "Recruit Soldier: 1x Beef Parts needed";
    onButtonClick = "ExileClientXM8CurrentSlide = 'apps';closeDialog 0;[] execVM 'ExAdClient\XM8\Apps\DeployVehicle\bodyguard.sqf'";
    resource = "";
};

class XM8_App09_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExAdClient\XM8\Apps\BRAmaRecipes\BRAma.paa";
    text = "BRAmaRecipes";
    onButtonClick = "['BRAmaRecipes', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App10_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExAdClient\XM8\Apps\BaseMarker\BaseMarker.paa";
    text = "Base Marker";
    onButtonClick = "['Basemarker', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App11_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "exile_assets\texture\ui\xm8_app_settings_ca.paa";
    text = "Status Bar Settings";
    onButtonClick = "['ExAd_SB', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App12_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExAdClient\XM8\Apps\DeployVehicle\Quad.paa";
    text = "Deploy Quad Bike";
    onButtonClick = "['ExAd_Quad'] call ExAd_XM8_DV_fnc_spawnVehicle";
    resource = "";
};

class XM8_App13_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExadClient\XM8\Apps\VG\Icon_VG.paa";
    text = "ExAD Virtual Garage";
    onButtonClick = "['ExAd_VG', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

class XM8_App14_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "";
    text = "";
    onButtonClick = "";
    resource = "";
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//											   BELOW IS WHERE ALL THE XM8 APP RESOURCES CAN GO
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class XM8SlideSettings: RscExileXM8Slide 
{
	idc = 4070;
	class Controls 
	{
		class GoBackButton: RscExileXM8ButtonMenu
		{
			idc = 4071;
			text = "GO BACK"; 
			x = (30 - 3) * (0.025);
			y = (19 - 2) * (0.04);
			w = 6 * (0.025);
			h = 1 * (0.04);
			onButtonClick = "['extraApps', 1] call ExileClient_gui_xm8_slide";
		};

		class 8GDropDown: RscExileXM8Combo
		{
			idc = 4072;
			x = (5 - 3) * (0.025);
			y = (5 - 2) * (0.04);
			w = 7 * (0.025);
			h = 1 * (0.04);
			onLBSelChanged = "_this call ExileClient_gui_xm8_slide_settings_event_on8GSelectionChanged";
		};

		class 8GLabel: RscExileXM8Text
		{
			idc = -1;
			text = "Show my device in global 8G network."; 
			x = (13 - 3) * (0.025);
			y = (5 - 2) * (0.04);
			w = 22 * (0.025);
			h = 1 * (0.04);
			shadow = 0;
		};

		class SoundDropDown: RscExileXM8Combo
		{
			idc = 4075;
			x = (5 - 3) * (0.025);
			y = (7 - 2) * (0.04);
			w = 7 * (0.025);
			h = 1 * (0.04);
			onLBSelChanged = "_this call ExileClient_gui_xm8_slide_settings_event_onSoundSelectionChanged";
		};

		class SoundLabel: RscExileXM8Text
		{
			idc = -1;
			text = "Play a beep sound on notifications."; 
			x = (13 - 3) * (0.025);
			y = (7 - 2) * (0.04);
			w = 22 * (0.025);
			h = 1 * (0.04);
			shadow = 0;
		};

		class PartyEspDropDown: RscExileXM8Combo
		{
			idc = 4076;
			x = (5 - 3) * (0.025);
			y = (9 - 2) * (0.04);
			w = 7 * (0.025);
			h = 1 * (0.04);
			onLBSelChanged = "_this call ExileClient_gui_xm8_slide_settings_event_onPartyEspSelectionChanged";
		};

		class PartyEspLabel: RscExileXM8Text
		{
			idc = -1;
			text = "Color of 3D party icons and name tags."; 
			x = (13 - 3) * (0.025);
			y = (9 - 2) * (0.04);
			w = 22 * (0.025);
			h = 1 * (0.04);
			shadow = 0;
		};

		class PartyEspSlider: RscExileXM8XSliderH
		{
			idc = 4078;
			x = (5 - 3) * (0.025);
			y = (11 - 2) * (0.04);
			w = 7 * (0.025);
			h = 1 * (0.04);
			onSliderPosChanged = "_this call ExileClient_gui_xm8_slide_settings_event_onPartyEspSliderChanged";
		};

		class PartyEspSliderLabel: RscExileXM8Text
		{
			idc = -1;
			text = "Opacity of 3D party icons and name tags."; 
			x = (13 - 3) * (0.025);
			y = (11 - 2) * (0.04);
			w = 22 * (0.025);
			h = 1 * (0.04);
			shadow = 0;
		};

		class PartyMarkerSlider: RscExileXM8XSliderH
		{
			idc = 4079;
			x = (5 - 3) * (0.025);
			y = (13 - 2) * (0.04);
			w = 7 * (0.025);
			h = 1 * (0.04);
			onSliderPosChanged = "_this call ExileClient_gui_xm8_slide_settings_event_onPartyMarkerSliderChanged";
		};

		class PartyMarkerSliderLabel: RscExileXM8Text
		{
			idc = -1;
			text = "Opacity of 3D party markers."; 
			x = (13 - 3) * (0.025);
			y = (13 - 2) * (0.04);
			w = 22 * (0.025);
			h = 1 * (0.04);
			shadow = 0;
		};

		class StreamModeDropDown: RscExileXM8Combo
		{
			idc = 4077;
			x = (5 - 3) * (0.025);
			y = (15 - 2) * (0.04);
			w = 7 * (0.025);
			h = 1 * (0.04);
			onLBSelChanged = "_this call ExileClient_gui_xm8_slide_settings_event_onStreamModeSelectionChanged";
		};

		class StreamModeLabel: RscExileXM8Text
		{
			idc = -1;
			text = "Masquerade PIN codes. Perfect for streamers."; 
			x = (13 - 3) * (0.025);
			y = (15 - 2) * (0.04);
			w = 22 * (0.025);
			h = 1 * (0.04);
			shadow = 0;
		};
	};
};

class XM8SlideHealthScanner: RscExileXM8Slide
{
	idc = 4120;
	class Controls 
	{
		class GoBackButton: RscExileXM8ButtonMenu
		{
			idc = 4122;
			text = "GO BACK"; 
			x = (30 - 3) * (0.025);
			y = (19 - 2) * (0.04);
			w = 6 * (0.025);
			h = 1 * (0.04);
			onButtonClick = "['extraApps', 1] call ExileClient_gui_xm8_slide";
		};

		class HealthInfoControlGroup: RscExileXM8ControlsGroupNoHScrollbars
		{
			idc = -1;
			x = (5 - 3) * (0.025);
			y = (5 - 2) * (0.04);
			w = 30 * (0.025);
			h = 15 * (0.04);
			colorBackground[] = {0,0,0,0.25};

			class controls
			{
				class HealthInfo: RscExileXM8StructuredText
				{
					idc = 4121;
					x = 0;
					y = 0;
					w = 29 * (0.025); // minus 1!
					h = 15 * (0.04);
				};
			};
		};
	};
};

class XM8SlideSlothMachine: RscExileXM8Slide
{
	idc = 4140;
	class Controls 
	{
		class Background: RscExileXM8PictureKeepAspect
		{
			idc = -1;
			text = "\exile_assets\texture\ui\slothMachine\xm8_slothMachineBackground.paa";
			x = -3.1 * (0.025) + (0);
			y = -6 * (0.04) + (0);
			w = 40 * (0.025);
			h = 33 * (0.04);
		};
		
		class XM8SlothMachineSpinButton: RscExileXM8PictureButton
		{
			idc = 4141;
			style = 0x30;
			x = 14.3 * (0.025) + (0);
			y = 15.9 * (0.04) + (0);
			w = 5.7 * (0.025);
			h = 2 * (0.04);
			text = "\exile_assets\texture\ui\slothMachine\button_off_ca.paa";
			action = "[] call ExileClient_gui_xm8_slide_slothMachine_event_onSpinButtonClick;";
		};
		
		class GoBackButton: RscExileXM8ButtonMenu
		{
			idc = 4148;
			text = "GO BACK"; 
			x = (30 - 3) * (0.025);
			y = (19 - 2) * (0.04);
			w = 6 * (0.025);
			h = 1 * (0.04);
			sizeEx = .9 * (0.04);
			onButtonClick = "['extraApps', 1] call ExileClient_gui_xm8_slide";
		};
		
		class PopTabsLabel: RscExileXM8StructuredText
		{
			idc = 4142;
			text = "<t align='center'><t color='#e14141'><img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>";
			x = 6.5 * (0.025) + (0);
			y = 13 * (0.04) + (0);
			w = 6 * (0.025);
			h = 2 * (0.04);
		};
		
		class JackpotLabel: RscExileXM8StructuredText
		{
			idc = 4143;
			text = "<t align='center'><t color='#e14141'></t>";
			x = 14 * (0.025) + (0);
			y = 13 * (0.04) + (0);
			w = 6 * (0.025);
			h = 2 * (0.04);
		};
		
		class WinningsLabel: RscExileXM8StructuredText
		{
			idc = 4144;
			text = "<t align='center'><t color='#e14141'>0</t>";
			x = 21.5 * (0.025) + (0);
			y = 13 * (0.04) + (0);
			w = 6 * (0.025);
			h = 2 * (0.04);
		};
		
		class Symbol01: RscExileXM8PictureKeepAspect
		{
			idc = 4145;
			text = "";
			x = 6.55 * (0.025) + (0);
			y = 4 * (0.04) + (0);
			w = 5.83 * (0.025);
			h = 5 * (0.04);
		};
		
		class Symbol02: RscExileXM8PictureKeepAspect
		{
			idc = 4146;
			text = "";
			x = 14.1 * (0.025) + (0);
			y = 4 * (0.04) + (0);
			w = 5.83 * (0.025);
			h = 5 * (0.04);
		};
		
		class Symbol03: RscExileXM8PictureKeepAspect
		{
			idc = 4147;
			text = "";
			x = 21.6 * (0.025) + (0);
			y = 4 * (0.04) + (0);
			w = 5.83 * (0.025);
			h = 5 * (0.04);
		};
	};
};