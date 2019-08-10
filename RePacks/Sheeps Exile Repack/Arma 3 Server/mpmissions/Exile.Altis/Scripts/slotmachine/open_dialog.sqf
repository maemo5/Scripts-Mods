//Open dialog
disableSerialization;
createDialog "RscDisplaySlots";

slotspictures = ["pictures\image1.jpg","pictures\image2.jpg","pictures\image3.jpg","pictures\image4.jpg","pictures\image5.jpg","pictures\image6.jpg","pictures\image7.jpg","pictures\image8.jpg"];

//Random image
startreel1 = slotspictures call BIS_fnc_selectRandom;
startreel2 = slotspictures call BIS_fnc_selectRandom;
startreel3 = slotspictures call BIS_fnc_selectRandom;

	_dialog = findDisplay 9000;
	_reel1 = _dialog displayCtrl 1200;
	_reel2 = _dialog displayCtrl 1201;
	_reel3 = _dialog displayCtrl 1202;
	//starting images
	_reel1 ctrlSetText format ["%1" ,startreel1];
	_reel2 ctrlSetText format ["%1" ,startreel2];
	_reel3 ctrlSetText format ["%1" ,startreel3];

//Variables
IsSpinning = false;
SlotsPlayerCredits = 0;
hasSlotsCredits = false;

PRIZE1 = 500;
PRIZE2 = 750;
PRIZE3 = 1200;
PRIZE4 = 2500;
PRIZE5 = 5000;
PRIZE6 = 7500;
PRIZE7 = 10000;