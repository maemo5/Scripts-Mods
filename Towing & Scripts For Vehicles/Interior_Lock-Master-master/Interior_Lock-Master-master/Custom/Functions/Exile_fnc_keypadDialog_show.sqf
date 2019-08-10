private["_display", "_ctrlButtonOK", "_ctrlButtonCancel", "_screenText", "_fakeButton"];
disableSerialization;
ExileClientPinCodeLength = _this;
ExileClientPinCode = "";
if(cameraOn isKindOf "AllVehicles")then
{
	createDialog "RscExileKeypadCar";
}
else
{
	createDialog "RscExileKeypad";
};
waitUntil
{
	!isNull (findDisplay 24010);
};
_display = uiNameSpace getVariable ["RscExileKeypad", displayNull];
_ctrlButtonOK = _display displayCtrl 4000;
_ctrlButtonCancel = _display displayCtrl 4002;
_screenText = _display displayCtrl 4001;
_screenText ctrlSetText "ENTER PIN";
_fakeButton = _display displayCtrl 4013;
ctrlSetFocus _fakeButton;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
_ctrlButtonOK ctrlSetEventHandler ["ButtonClick","call ExileClient_gui_keypadDialog_event_onOkayButtonClick"];
_ctrlButtonCancel ctrlSetEventHandler ["ButtonClick","call ExileClient_gui_keypadDialog_event_onAbortButtonClick"];
call ExileClient_gui_keypadDialog_updateControls;
waitUntil 
{
	isNull (findDisplay 24010);
};
false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
if((count ExileClientPinCode) != ExileClientPinCodeLength)then
{
	ExileClientPinCode = "";
};
ExileClientPinCode