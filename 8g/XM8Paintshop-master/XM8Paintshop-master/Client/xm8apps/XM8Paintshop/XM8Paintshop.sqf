/*
	Made By: Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/

	Features: Allows player to paint their vehicles, choosing any RGB color combo they want with 3 sliders
			Allows players to save 4 custom paint colors to use later, shows the preview color and allows
			players to test on their vehicles. Does not save over restart currently.
			Allows players to reset the texture to default if desired.
			Allows admins to set custom textures if they want.
			
	Requires: XM8Apps http://www.exilemod.com/topic/9040-xm8-apps/
			 Enigma Exile Update Respect/Poptabs http://www.exilemod.com/topic/7577-enigma-exile-update-respectpoptabs-180316/
			 
	Credits: Halv - Original Paintshop, getting the textures and default texture was derived from his script, most was created fresh for the XM8 however
			Shix - created XM8Apps!
			Exile - yes +1
			Happydayz - Update Respect/Poptabs + is cool
			Taylor Swift (Mezo) - get rekt
			
	Admins - To set prices and custom textures see the PaintshopPresets.sqf file, keep both this file and the presets.sqf in the same folder! (do not rename either)
*/

/* Do not edit below unless you know what you are doing.. set prices and configs in the other file! */

private ["_display", "_xm8Controlls", "_fade", "_msg", "_colortxtR", "_colortxtG", "_colortxtB", "_paintMainTitle", "_savedColorsTitle", "_savedColors1", "_savedColors2", "_savedColors3", "_savedColors4", "_colorSavedLeftBorder", "_colorSavedRightBorder", "_colorSavedTopBorder", "_colorSavedBottomBorder", "_presetColorsTitle", "_presetColorsBox", "_index", "_vehicleLayersTitle", "_vehicleLayersBox", "_indexVeh", "_presetPaintTitle", "_previewButtonPreset", "_applyButtonPreset", "_defaultButton", "_customPaintTitle", "_paint2Override", "_saveCustomButton", "_previewButton", "_applyButton", "_colorPreviewTitle", "_colorPreviewBox", "_colorPreviewLeftBorder", "_colorPreviewRightBorder", "_colorPreviewTopBorder", "_colorPreviewBottomBorder", "_sliderRtitle", "_sliderR", "_sliderGtitle", "_sliderG", "_sliderBtitle", "_sliderB" ,"_goBackButton"];


disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

//Hides all xm8 apps controlls then deletes them for a smooth transition
_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.2;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;


/* RGB Current Values */
PaintShopRed = profileNamespace getVariable "PaintShopRedColor";
PaintShopGreen = profileNamespace getVariable "PaintShopGreenColor";
PaintShopBlue = profileNamespace getVariable "PaintShopBlueColor";

/* SavedColors */
PaintShopSaved1 = profileNamespace getVariable "PaintShopSavedColor1";
PaintShopSaved2 = profileNamespace getVariable "PaintShopSavedColor2";
PaintShopSaved3 = profileNamespace getVariable "PaintShopSavedColor3";
PaintShopSaved4 = profileNamespace getVariable "PaintShopSavedColor4";


if (isNil "PaintShopRed" || isNil "PaintShopGreen" || isNil "PaintShopBlue" || isNil "PaintShopSaved1" || isNil "PaintShopSaved2" || isNil "PaintShopSaved3" || isNil "PaintShopSaved4") then {
	profileNamespace setVariable ["PaintShopRedColor",1];
	profileNamespace setVariable ["PaintShopGreenColor",1];
	profileNamespace setVariable ["PaintShopBlueColor",1];
	profileNamespace setVariable ["PaintShopSavedColor1",[0,0,0,1]];
	profileNamespace setVariable ["PaintShopSavedColor2",[0,0,0,1]];
	profileNamespace setVariable ["PaintShopSavedColor3",[0,0,0,1]];
	profileNamespace setVariable ["PaintShopSavedColor4",[0,0,0,1]];
	saveProfileNamespace;
  PaintShopRed = profileNamespace getVariable "PaintShopRedColor";
  PaintShopGreen = profileNamespace getVariable "PaintShopGreenColor";
  PaintShopBlue = profileNamespace getVariable "PaintShopBlueColor";

  /* SavedColors */
  PaintShopSaved1 = profileNamespace getVariable "PaintShopSavedColor1";
  PaintShopSaved2 = profileNamespace getVariable "PaintShopSavedColor2";
  PaintShopSaved3 = profileNamespace getVariable "PaintShopSavedColor3";
  PaintShopSaved4 = profileNamespace getVariable "PaintShopSavedColor4";
};

Vehiclesides2Paint = [];
InDriver = false;

if ( (vehicle player != player) && ((driver (vehicle player)) == player)) then { 
	VEHICLEsidesDefault = (vehicle player) getVariable ["VEHICLE_DEFAULT_TEXTURE",[]];
	CurrentVehicle = (vehicle player);
	if(VEHICLEsidesDefault isEqualTo []) then {
		VEHICLEsidesDefault = getObjectTextures CurrentVehicle;
		CurrentVehicle setVariable ["VEHICLE_DEFAULT_TEXTURE",VEHICLEsidesDefault];
	};
	_msg = (gettext (configFile >> "cfgvehicles" >> (typeOf CurrentVehicle) >> "displayName"));
	if(count(VEHICLEsidesDefault) < 1)exitWith{
		systemChat format["[PAINTSHOP] %1 can not be painted :(",_msg];
	};
	{
		Vehiclesides2Paint pushBack [_forEachIndex,_x];
	}forEach getObjectTextures CurrentVehicle;
	InDriver = true;
} else {
	systemChat format["[PAINTSHOP] Must be in Driver to edit colors!"];
	InDriver = false;
};

_colortxtR = (random 250)+1;//Dont judge my non zero calculations
_colortxtG = (random 250)+1;
_colortxtB = (random 250)+1;

#include "XM8PaintshopPresets.sqf";

_paintMainTitle = _display ctrlCreate ["RscStructuredText", 4999];
_paintMainTitle ctrlSetPosition [12 * (0.025) + (0), 3.1 * (0.04) + (0), 22 * (0.025), 6 * (0.04)];
_paintMainTitle ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1.6'>XM8 Paintshop</t>"]));
_paintMainTitle ctrlSetTextColor [_colortxtR/255, _colortxtG/255, _colortxtB/255, 1];
_paintMainTitle ctrlCommit 0;

_savedColorsTitle = _display ctrlCreate ["RscStructuredText", 5000];
_savedColorsTitle ctrlSetPosition [(23.5 - 3) * (0.025) + (0), 4.5 * (0.04) + (0), 7 * (0.025), 1 * (0.04)];
_savedColorsTitle ctrlSetStructuredText (parseText (format ["<t font='RobotoMedium'>Saved Colors:</t>"]));
_savedColorsTitle ctrlCommit 0;

_savedColors1 = _display ctrlCreate ["RscText", 5001];
_savedColors1 ctrlSetPosition [(24.5 - 3) * (0.025), (7.75 - 2) * (0.04), 2 * (0.025), 2 * (0.025)];
_savedColors1 ctrlSetText format["  1"];
_savedColors1 ctrlSetBackgroundColor PaintShopSaved1;
_savedColors1 ctrlCommit 0;

_savedColors2 = _display ctrlCreate ["RscText", 5002];
_savedColors2 ctrlSetPosition [(27.75 - 3) * (0.025), (7.75 - 2) * (0.04), 2 * (0.025), 2 * (0.025)];
_savedColors2 ctrlSetText format["  2"];
_savedColors2 ctrlSetBackgroundColor PaintShopSaved2;
_savedColors2 ctrlCommit 0;

_savedColors3 = _display ctrlCreate ["RscText", 5003];
_savedColors3 ctrlSetPosition [(24.5 - 3) * (0.025), (9.5 - 2) * (0.04), 2 * (0.025), 2 * (0.025)];
_savedColors3 ctrlSetText format["  3"];
_savedColors3 ctrlSetBackgroundColor PaintShopSaved3;
_savedColors3 ctrlCommit 0;

_savedColors4 = _display ctrlCreate ["RscText", 5004];
_savedColors4 ctrlSetPosition [(27.75 - 3) * (0.025), (9.5 - 2) * (0.04), 2 * (0.025), 2 * (0.025)];
_savedColors4 ctrlSetText format["  4"];
_savedColors4 ctrlSetBackgroundColor PaintShopSaved4;
_savedColors4 ctrlCommit 0;

_colorSavedLeftBorder = _display ctrlCreate ["RscPicture", 5005];
_colorSavedLeftBorder ctrlSetPosition [(24 - 3) * (0.025), (7.5 - 2) * (0.04), 0.1 * (0.04), 3.5 * (0.04)];
_colorSavedLeftBorder ctrlSetFade 0;
_colorSavedLeftBorder ctrlCommit 0;
_colorSavedLeftBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_colorSavedRightBorder = _display ctrlCreate ["RscPicture", 5006];
_colorSavedRightBorder ctrlSetPosition [(30.25 - 3) * (0.025), (7.5 - 2) * (0.04), 0.1 * (0.04), 3.5 * (0.04)];
_colorSavedRightBorder ctrlSetFade 0;
_colorSavedRightBorder ctrlCommit 0;
_colorSavedRightBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_colorSavedTopBorder = _display ctrlCreate ["RscPicture", 5007];
_colorSavedTopBorder ctrlSetPosition [(24 - 3) * (0.025), (7.5 - 2) * (0.04), 4 * (0.04), 0.1 * (0.04)];
_colorSavedTopBorder ctrlSetFade 0;
_colorSavedTopBorder ctrlCommit 0;
_colorSavedTopBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_colorSavedBottomBorder = _display ctrlCreate ["RscPicture", 5008];
_colorSavedBottomBorder ctrlSetPosition [(24 - 3) * (0.025), (11 - 2) * (0.04), 4 * (0.04), 0.1 * (0.04)];
_colorSavedBottomBorder ctrlSetFade 0;
_colorSavedBottomBorder ctrlCommit 0;
_colorSavedBottomBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_presetColorsTitle = _display ctrlCreate ["RscStructuredText", 5009];
_presetColorsTitle ctrlSetPosition [(6.5 - 3) * (0.025) + (0), 4.5 * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_presetColorsTitle ctrlSetStructuredText (parseText (format ["<t font='RobotoMedium'>Preset Textures:</t>"]));
_presetColorsTitle ctrlCommit 0;

_presetColorsBox = _display ctrlCreate ["RscExileXM8ListBox", 5010];
_presetColorsBox ctrlSetPosition [(6.5 - 3) * (0.025) + (0), (7.5 - 2) * (0.04), 8.5 * (0.025), 7.25 * (0.04)];
_presetColorsBox ctrlSetFontHeight 0.03;
_presetColorsBox ctrlCommit 0;
_presetColorsBox ctrlSetEventHandler ["LBSelChanged", "_this call EventPaintListBoxChanged"];

lbClear _presetColorsBox;
{
	_index = _presetColorsBox lbAdd (_x select 0);
	_presetColorsBox lbSetData [_index, (_x select 1)];
} forEach PresetTextures;

_vehicleLayersTitle = _display ctrlCreate ["RscStructuredText", 5011];
_vehicleLayersTitle ctrlSetPosition [(16 - 3) * (0.025) + (0), 4.5 * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_vehicleLayersTitle ctrlSetStructuredText (parseText (format ["<t font='RobotoMedium'>Vehicle Layers:</t>"]));
_vehicleLayersTitle ctrlCommit 0;

_vehicleLayersBox = _display ctrlCreate ["RscExileXM8ListBox", 5012];
_vehicleLayersBox ctrlSetPosition [(16.5 - 3) * (0.025) + (0), (7.5 - 2) * (0.04), 5 * (0.025), 5 * (0.04)];
_vehicleLayersBox ctrlCommit 0;
_vehicleLayersBox ctrlSetEventHandler ["LBSelChanged", "_this call EventLayersListBoxChanged"];

lbClear _vehicleLayersBox;
{
	_indexVeh = _vehicleLayersBox lbAdd format["Side: %1",(_x select 0)];;
	_vehicleLayersBox lbSetData [_indexVeh, (_x select 0)];
} forEach Vehiclesides2Paint;

_presetPaintTitle = _display ctrlCreate ["RscText", 5013];
_presetPaintTitle ctrlSetPosition [(33.6 - 3) * (0.025) + (0), (6.5 - 2) * (0.04) + (0), 4.9 * (0.025), 1 * (0.04)];
_presetPaintTitle ctrlSetText format["Preset Paint:"];
_presetPaintTitle ctrlCommit 0;

_previewButtonPreset = _display ctrlCreate ["RscButtonMenu", 5014];
_previewButtonPreset ctrlSetPosition [(34 - 3) * (0.025) + (0), (8 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_previewButtonPreset ctrlEnable InDriver;
_previewButtonPreset ctrlCommit 0;
_previewButtonPreset ctrlSetEventHandler ["ButtonClick", "[_this,0] spawn PaintPreview"];
_previewButtonPreset ctrlSetText format["PREVIEW"];

_applyButtonPreset = _display ctrlCreate ["RscButtonMenu", 5015];
_applyButtonPreset ctrlSetPosition [(34 - 3) * (0.025) + (0), (9.5 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_applyButtonPreset ctrlEnable InDriver;
_applyButtonPreset ctrlCommit 0;
_applyButtonPreset ctrlSetEventHandler ["ButtonClick", "[_this,0] spawn PaintApply"];
_applyButtonPreset ctrlSetText format["APPLY"];

_defaultButton = _display ctrlCreate ["RscButtonMenu", 5016];
_defaultButton ctrlSetPosition [(34 - 3) * (0.025) + (0), (11.25 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_defaultButton ctrlEnable InDriver;
_defaultButton ctrlCommit 0;
_defaultButton ctrlSetEventHandler ["ButtonClick", "_this spawn SetDefaultTexture"];
_defaultButton ctrlSetText format["DEFAULT"];

//SIDE BUTTONS AND CONTROLS

_customPaintTitle = _display ctrlCreate ["RscText", 5017];
_customPaintTitle ctrlSetPosition [(33.6 - 3) * (0.025) + (0), (12.75 - 2) * (0.04) + (0), 4.9 * (0.025), 1 * (0.04)];
_customPaintTitle ctrlSetText format["Custom Paint:"];
_customPaintTitle ctrlCommit 0;

SelectedColor = 0;
_paint2Override = _display ctrlCreate ["RscCombo", 5018];
_paint2Override ctrlSetPosition [(34 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)]; 
{lbAdd[5018,_x]} forEach ["Color 1","Color 2","Color 3","Color 4"];
_paint2Override ctrlSetEventHandler ["LBSelChanged","[(_this select 0)] call EventSelectedColor"];
_paint2Override ctrlCommit 0;
_paint2Override lbSetCurSel 0;

_saveCustomButton = _display ctrlCreate ["RscButtonMenu", 5019];
_saveCustomButton ctrlSetPosition [(34 - 3) * (0.025) + (0), (15.5 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_saveCustomButton ctrlCommit 0;
_saveCustomButton ctrlSetEventHandler ["ButtonClick", "_this spawn SavePaint"];
_saveCustomButton ctrlSetText format["SAVE"];


_previewButton = _display ctrlCreate ["RscButtonMenu", 5020];
_previewButton ctrlSetPosition [(34 - 3) * (0.025) + (0), (17 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_previewButton ctrlEnable InDriver;
_previewButton ctrlCommit 0;
_previewButton ctrlSetEventHandler ["ButtonClick", "[_this,1] spawn PaintPreview"];
_previewButton ctrlSetText format["PREVIEW"];

_applyButton = _display ctrlCreate ["RscButtonMenu", 5021];
_applyButton ctrlSetPosition [(34 - 3) * (0.025) + (0), (18.5 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_applyButton ctrlEnable InDriver;
_applyButton ctrlCommit 0;
_applyButton ctrlSetEventHandler ["ButtonClick", "[_this,1] spawn PaintApply"];
_applyButton ctrlSetText format["APPLY"];

_colorPreviewTitle = _display ctrlCreate ["RscStructuredText", 5022];
_colorPreviewTitle ctrlSetPosition [(23.5 - 3) * (0.025),(16 - 2) * (0.04), 7 * (0.025), 1 * (0.04)];
_colorPreviewTitle ctrlSetStructuredText (parseText (format ["<t font='RobotoMedium'>Color Preview:</t>"]));
_colorPreviewTitle ctrlCommit 0;

_colorPreviewBox = _display ctrlCreate ["RscText", 5023];
_colorPreviewBox ctrlSetPosition [(23.5 - 3) * (0.025),(18 - 2) * (0.04), 7 * (0.025), 3 * (0.04)];
_colorPreviewBox ctrlSetBackgroundColor [PaintShopRed, PaintShopGreen, PaintShopBlue, 1];
_colorPreviewBox ctrlCommit 0;

_colorPreviewLeftBorder = _display ctrlCreate ["RscPicture", 5024];
_colorPreviewLeftBorder ctrlSetPosition [(23.5 - 3) * (0.025), (18 - 2) * (0.04), 0.1 * (0.04), 3 * (0.04)];
_colorPreviewLeftBorder ctrlSetFade 0;
_colorPreviewLeftBorder ctrlCommit 0;
_colorPreviewLeftBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_colorPreviewRightBorder = _display ctrlCreate ["RscPicture", 5025];
_colorPreviewRightBorder ctrlSetPosition [(30.5 - 3) * (0.025), (18 - 2) * (0.04), 0.1 * (0.04), 3 * (0.04)];
_colorPreviewRightBorder ctrlSetFade 0;
_colorPreviewRightBorder ctrlCommit 0;
_colorPreviewRightBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_colorPreviewTopBorder = _display ctrlCreate ["RscPicture", 5026];
_colorPreviewTopBorder ctrlSetPosition [(23.5 - 3) * (0.025), (18 - 2) * (0.04), 4.5 * (0.04), 0.1 * (0.04)];
_colorPreviewTopBorder ctrlSetFade 0;
_colorPreviewTopBorder ctrlCommit 0;
_colorPreviewTopBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_colorPreviewBottomBorder = _display ctrlCreate ["RscPicture", 5027];
_colorPreviewBottomBorder ctrlSetPosition [(23.5 - 3) * (0.025), (21 - 2) * (0.04), 4.5 * (0.04), 0.1 * (0.04)];
_colorPreviewBottomBorder ctrlSetFade 0;
_colorPreviewBottomBorder ctrlCommit 0;
_colorPreviewBottomBorder ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

_sliderRtitle = _display ctrlCreate ["RscText", 5028];
_sliderRtitle ctrlSetPosition [(6.5 - 3) * (0.025),(16 - 2) * (0.04), 7 * (0.025), 1 * (0.04)];
_sliderRtitle ctrlSetText format["RED"];
_sliderRtitle ctrlSetTextColor [1, 0, 0, 1];
_sliderRtitle ctrlCommit 0;

_sliderR = _display ctrlCreate ["RscXSliderH", 5029];
_sliderR ctrlSetPosition [(9.5 - 3) * (0.025),(16 - 2) * (0.04), 10 * (0.025), 1 * (0.04)];
_sliderR ctrlSetEventHandler ["SliderPosChanged", "_this call redSliderOnChange"];
_sliderR ctrlCommit 0;

_sliderGtitle = _display ctrlCreate ["RscText", 5030];
_sliderGtitle ctrlSetPosition [(6.5 - 3) * (0.025),(18 - 2) * (0.04), 7 * (0.025), 1 * (0.04)];
_sliderGtitle ctrlSetText format["GREEN"];
_sliderGtitle ctrlSetTextColor [0, 1, 0, 1];
_sliderGtitle ctrlCommit 0;

_sliderG = _display ctrlCreate ["RscXSliderH", 5031];
_sliderG ctrlSetPosition [(9.5 - 3) * (0.025),(18 - 2) * (0.04), 10 * (0.025), 1 * (0.04)];
_sliderG ctrlSetEventHandler ["SliderPosChanged", "_this call greenSliderOnChange"];
_sliderG ctrlCommit 0;

_sliderBtitle = _display ctrlCreate ["RscText", 5032];
_sliderBtitle ctrlSetPosition [(6.5 - 3) * (0.025),(20 - 2) * (0.04), 7 * (0.025), 1 * (0.04)];
_sliderBtitle ctrlSetText format["BLUE"];
_sliderBtitle ctrlSetTextColor [0, 0, 1, 1];
_sliderBtitle ctrlCommit 0;

_sliderB = _display ctrlCreate ["RscXSliderH", 5033];
_sliderB ctrlSetPosition [(9.5 - 3) * (0.025),(20 - 2) * (0.04), 10 * (0.025), 1 * (0.04)];
_sliderB ctrlSetEventHandler ["SliderPosChanged", "_this call blueSliderOnChange"];
_sliderB ctrlCommit 0;

redSliderOnChange = {
	private ["_sliderpos", "_colorRed"];
	_sliderpos = (_this select 1);
	_colorRed = (_sliderpos/10);
	profileNamespace setVariable ["PaintShopRedColor",_colorRed];
	saveProfileNamespace;
	call LoadPaintPreview;
};

greenSliderOnChange = {
	private ["_sliderpos", "_colorGreen"];
	_sliderpos = (_this select 1);
	_colorGreen = (_sliderpos/10);
	profileNamespace setVariable ["PaintShopGreenColor",_colorGreen];
	saveProfileNamespace;
	call LoadPaintPreview;
};

blueSliderOnChange = {
	private ["_sliderpos", "_colorBlue"];
    _sliderpos = (_this select 1);
	_colorBlue = (_sliderpos/10);
	profileNamespace setVariable ["PaintShopBlueColor",_colorBlue];
	saveProfileNamespace;
	call LoadPaintPreview;
};

LoadPaintPreview = {
	private ["_display", "_previewBox"];
	disableSerialization;
	PaintShopRed = profileNamespace getVariable "PaintShopRedColor";
	PaintShopGreen = profileNamespace getVariable "PaintShopGreenColor";
	PaintShopBlue = profileNamespace getVariable "PaintShopBlueColor";
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_previewBox = _display displayCtrl 5023;
	_previewBox ctrlSetBackgroundColor [PaintShopRed, PaintShopGreen, PaintShopBlue, 1];
};

EventSelectedColor = {
	private ["_index"];
	_index = lbCurSel (_this select 0);
	Switch (_index) Do 
	{
		Case 0:
		{
			SelectedColor = 1;
		};
		Case 1:
		{
			SelectedColor = 2;
		};
		Case 2:
		{
			SelectedColor = 3;
		};
		Case 3:
		{
			SelectedColor = 4;
		};
	};	
};

SavePaint = {

	OverrideAllowed = false;
	
	[format["Overwrite Saved Color %1?",SelectedColor], "Yes", "Nah"] call ExileClient_gui_xm8_showConfirm;
	waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
	if (ExileClientXM8ConfirmResult isEqualTo true) then
	{
		OverrideAllowed = true;
	};
	if (ExileClientXM8ConfirmResult isEqualTo false) then
	{
		OverrideAllowed = false;
	};
	
	if (OverrideAllowed) then {
		Switch(SelectedColor) Do
		{
			Case 1:
			{
				private ["_display","_previewBox"];
				disableSerialization;
				profileNamespace setVariable ["PaintShopSavedColor1",[PaintShopRed, PaintShopGreen, PaintShopBlue,1]];
				saveProfileNamespace;
				_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
				_previewBox = _display displayCtrl 5001;
				_previewBox ctrlSetBackgroundColor [PaintShopRed, PaintShopGreen, PaintShopBlue, 1];
				systemChat format["[PAINTSHOP] Changes will fully take place next time you boot the app."];
			};
			Case 2:
			{
				private ["_display","_previewBox"];
				disableSerialization;
				profileNamespace setVariable ["PaintShopSavedColor2",[PaintShopRed, PaintShopGreen, PaintShopBlue,1]];
				saveProfileNamespace;
				_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
				_previewBox = _display displayCtrl 5002;
				_previewBox ctrlSetBackgroundColor [PaintShopRed, PaintShopGreen, PaintShopBlue, 1];
				systemChat format["[PAINTSHOP] Changes will fully take place next time you boot the app."];
			};
			Case 3:
			{
				private ["_display","_previewBox"];
				disableSerialization;
				profileNamespace setVariable ["PaintShopSavedColor3",[PaintShopRed, PaintShopGreen, PaintShopBlue,1]];
				saveProfileNamespace;
				_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
				_previewBox = _display displayCtrl 5003;
				_previewBox ctrlSetBackgroundColor [PaintShopRed, PaintShopGreen, PaintShopBlue, 1];
				systemChat format["[PAINTSHOP] Changes will fully take place next time you boot the app."];
			};
			Case 4:
			{
				private ["_display","_previewBox"];
				disableSerialization;
				profileNamespace setVariable ["PaintShopSavedColor4",[PaintShopRed, PaintShopGreen, PaintShopBlue,1]];
				saveProfileNamespace;
				_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
				_previewBox = _display displayCtrl 5004;
				_previewBox ctrlSetBackgroundColor [PaintShopRed, PaintShopGreen, PaintShopBlue, 1];
				systemChat format["[PAINTSHOP] Changes will fully take place next time you boot the app."];
			};
		};
	};
};

EventPaintListBoxChanged = {
	private["_paintPresetListBox","_display"];
	disableSerialization;
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_paintPresetListBox = _display displayCtrl 5010;
	presetTexture = _paintPresetListBox lbData (lbCurSel _paintPresetListBox);
};

EventLayersListBoxChanged = {
	Selectedlayer = (_this select 1);
};

PaintPreview = {

	PreviewType = (_this select 1);
	
	Switch (PreviewType) Do
	{
		Case 0:
		{
			CurrentVehicle setObjectTexture [Selectedlayer,presetTexture];
			SystemChat "[PAINTSHOP] 10 Second Preview.";
			(findDisplay 24015) closeDisplay 0;
			uiSleep 10;
			SystemChat "[PAINTSHOP] Preview Ended.";
			[] spawn SetDefaultTexture;	
		};
		Case 1:
		{
			private["_color"];
			_color = format["#(argb,8,8,3)color(%1,%2,%3,%4)",PaintShopRed, PaintShopGreen, PaintShopBlue,1];
			CurrentVehicle setObjectTexture [Selectedlayer,_color];
			SystemChat "[PAINTSHOP] 10 Second Preview.";
			(findDisplay 24015) closeDisplay 0;
			uiSleep 10;
			SystemChat "[PAINTSHOP] Preview Ended.";
			[] spawn SetDefaultTexture;	
		};
	};
};

PaintApply = {
	
	[format["Apply Paint to your %1 for %2 Poptabs?",(gettext (configFile >> "cfgvehicles" >> (typeOf CurrentVehicle) >> "displayName")),PaintApplyCost], "Yes", "Nah"] call ExileClient_gui_xm8_showConfirm;
	waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
	if (ExileClientXM8ConfirmResult isEqualTo true) then
	{
		PaintApplyAllowed = true;
	};
	if (ExileClientXM8ConfirmResult isEqualTo false) then
	{
		PaintApplyAllowed = false;
	};
	
	ApplyType = (_this select 1);
	
	if (PaintApplyAllowed) then {
	private["_newPoptabs"];
		Switch (ApplyType) Do
		{
			Case 0:
			{
				CurrentVehicle setObjectTextureGlobal [Selectedlayer,presetTexture];
			};
			Case 1:
			{
				private["_color"];
				_color = format["#(argb,8,8,3)color(%1,%2,%3,%4)",PaintShopRed, PaintShopGreen, PaintShopBlue,1];
				CurrentVehicle setObjectTextureGlobal [Selectedlayer,_color];
			};
		};
		
		//saving poptabs
		_newPoptabs = ExileClientPlayerMoney - PaintApplyCost;
		ENIGMA_UpdateStats = [player,_newPoptabs];
		publicVariableServer "ENIGMA_UpdateStats";
	};
};

SetDefaultTexture = {
	private["_Textures"];
	_Textures = CurrentVehicle getVariable ["VEHICLE_DEFAULT_TEXTURE",[]];
	CurrentVehicle setObjectTextureGlobal [Selectedlayer,(_Textures select 0)];
};


//Created the go back button and add the button click event handeler to it
//Note you do need to add all Idds for all the controlls you have created to the _Ctrls array
_goBackButton = _display ctrlCreate ["RscButtonMenu", 8999];
_goBackButton ctrlSetPosition [(34 - 3) * (0.025) + (0), (20 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_goBackButton ctrlCommit 0;
_goBackButton ctrlSetEventHandler ["ButtonClick", "call fnc_goBack"];
_goBackButton ctrlSetText format["GO BACK"];

fnc_goBack = {
	private ["_display", "_Ctrls", "_ctrl"];
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_Ctrls = [4999,5000,5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023,5024,5025,5026,5027,5028,5029,5030,5031,5032,5033,8999];
	{
		_ctrl = (_display displayCtrl _x);
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0.25;
		ctrlEnable [_x, false];
	} forEach _Ctrls;
	[] execVM "xm8Apps\XM8Apps_Init.sqf";
	uiSleep 1;
	{
		ctrlDelete ((findDisplay 24015) displayCtrl _x);
	} forEach _Ctrls;
};
