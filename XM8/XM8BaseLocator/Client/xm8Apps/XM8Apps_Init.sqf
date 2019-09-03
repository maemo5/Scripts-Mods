
//App 1
_app1Text = "Base Locator";
_app1Logo = "xm8Apps\images\xm8baselocate.paa";
app1_action = {
	private ["_position"];
	_position = getPosATL player;
	[_position] execVM "xm8Apps\custom\build_here.sqf";
};

//App 2
_app2Text = "XM8 Thermal Scanner";
_app2Logo = "xm8Apps\images\xm8scannerpro.paa";
app2_action = {
	[] execVM "xm8Apps\custom\XM8ScanPro.sqf";
};

//App 3
_app3Text = "Map Markers";
_app3Logo = "xm8Apps\images\xm8markers.paa";
app3_action = {
	//call XM8MapMarkers;
	[] execVM "xm8apps\custom\xm8mapmarkers.sqf";
};
