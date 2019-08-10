createDialog'RscExileXm8';
private["_display","_control","_controlsToShow","_backgroundSplash"];
disableSerialization;
_display = findDisplay 24015;
_backgroundSplash = _display displayCtrl 4002;
_backgroundSplash ctrlShow false;  
ExileClientXM8IsPowerOn = true;

execVM'XM8APPS\ExileClient_gui_xm8_slide_apps_onOpen.sqf';