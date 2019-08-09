/*
	Made By: Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/ 
	
	Features: Allows players to set 10 custom markers on the map
	All markers can toggle: Hide/Show, Color of Marker, and description of marker
	Markers will save over restart as they use their profile to save.
	If they change names/switch profiles they will loose their markers!
	
	Some good markers: "Select" / "Waypoint" / "mil_circle" / "mil_triangle" / "mil_box" / "mil_dot"
	ctrl+f "//marker type" (exclude " ") to find all points to change type of marker :D

*/









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

/* meh */
mapMarker1 = profileNamespace getVariable "map_marker1";mapMarker2 = profileNamespace getVariable "map_marker2";mapMarker3 = profileNamespace getVariable "map_marker3";
mapMarker4 = profileNamespace getVariable "map_marker4";mapMarker5 = profileNamespace getVariable "map_marker5";mapMarker6 = profileNamespace getVariable "map_marker6";


if (isNil "mapMarker1" || isNil "mapMarker2" || isNil "mapMarker3" 
	|| isNil "mapMarker4" || isNil "mapMarker5" || isNil "mapMarker6") then {
	profileNamespace setVariable ["map_marker1",[0,0,false,"POI","map_marker1","Marker1","Black"]];
	profileNamespace setVariable ["map_marker2",[0,0,false,"POI","map_marker2","Marker2","Black"]];
	profileNamespace setVariable ["map_marker3",[0,0,false,"POI","map_marker3","Marker3","Black"]];
	profileNamespace setVariable ["map_marker4",[0,0,false,"POI","map_marker4","Marker4","Black"]];
	profileNamespace setVariable ["map_marker5",[0,0,false,"POI","map_marker5","Marker5","Black"]];
	profileNamespace setVariable ["map_marker6",[0,0,false,"POI","map_marker6","Marker6","Black"]];
	saveProfileNamespace;
	mapMarker1 = profileNamespace getVariable "map_marker1";mapMarker2 = profileNamespace getVariable "map_marker2";mapMarker3 = profileNamespace getVariable "map_marker3";
	mapMarker4 = profileNamespace getVariable "map_marker4";mapMarker5 = profileNamespace getVariable "map_marker5";mapMarker6 = profileNamespace getVariable "map_marker6";
};

_mapsMainTitle = _display ctrlCreate ["RscStructuredText", 8000];
_mapsMainTitle ctrlSetFade 1;
_mapsMainTitle ctrlSetPosition [12 * (0.025) + (0), 3.2 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_mapsMainTitle ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1.6' color='#ffffff'>XM8 Map Tracker</t>"])); 
_mapsMainTitle ctrlCommit 0;

_markersInfo1 = _display ctrlCreate ["RscStructuredText", 8001];
_markersInfo1 ctrlSetFade 1;
_markersInfo1 ctrlSetPosition [4 * (0.025) + (0), 6 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_markersInfo1 ctrlSetStructuredText (parseText (format ["Toggle:"])); 
_markersInfo1 ctrlCommit 0;

_markersInfo2 = _display ctrlCreate ["RscStructuredText", 8002];
_markersInfo2 ctrlSetFade 1;
_markersInfo2 ctrlSetPosition [8.25 * (0.025) + (0), 6 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_markersInfo2 ctrlSetStructuredText (parseText (format ["Text:"])); 
_markersInfo2 ctrlCommit 0;

_markersInfo3 = _display ctrlCreate ["RscStructuredText", 8003];
_markersInfo3 ctrlSetFade 1;
_markersInfo3 ctrlSetPosition [20.5 * (0.025) + (0), 6 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_markersInfo3 ctrlSetStructuredText (parseText (format ["Toggle:"])); 
_markersInfo3 ctrlCommit 0;

_markersInfo4 = _display ctrlCreate ["RscStructuredText", 8004];
_markersInfo4 ctrlSetFade 1;
_markersInfo4 ctrlSetPosition [24.75 * (0.025) + (0), 6 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_markersInfo4 ctrlSetStructuredText (parseText (format ["Text:"])); 
_markersInfo4 ctrlCommit 0;

_markersInfo5 = _display ctrlCreate ["RscStructuredText", 8005];
_markersInfo5 ctrlSetFade 1;
_markersInfo5 ctrlSetPosition [12.75 * (0.025) + (0), 6 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_markersInfo5 ctrlSetStructuredText (parseText (format ["Color:"])); 
_markersInfo5 ctrlCommit 0;

_markersInfo6 = _display ctrlCreate ["RscStructuredText", 8006];
_markersInfo6 ctrlSetFade 1;
_markersInfo6 ctrlSetPosition [29.25 * (0.025) + (0), 6 * (0.04) + (0), 22 * (0.025), 6 * (0.04)]; 
_markersInfo6 ctrlSetStructuredText (parseText (format ["Color:"])); 
_markersInfo6 ctrlCommit 0;


/* Marker1 */
_marker1title = _display ctrlCreate ["RscStructuredText", 8007];
_marker1title ctrlSetFade 1;
_marker1title ctrlSetPosition [3 * (0.025) + (0), 7.5 * (0.04) + (0), 2 * (0.025), 2 * (0.04)]; 
_marker1title ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1' color='#ffffff'>1.</t>"]));
_marker1title ctrlCommit 0;

_marker1display = _display ctrlCreate ["RscCombo", 8008];
_marker1display ctrlSetFade 1;
_marker1display ctrlSetPosition [4.5 * (0.025) + (0), 7.5 * (0.04) + (0), 3.1 * (0.025), 1 * (0.04)]; 
_marker1display ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8008,_x]} forEach ["On","Off"];
_marker1display ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker1] call EventMarkerOn"];
_marker1display ctrlCommit 0;
_marker1toggle=0;
if ((mapMarker1 select 2) isEqualTo true) then {_marker1toggle=0;} else {_marker1toggle=1;};
_marker1display lbSetCurSel _marker1toggle;

_marker1name = _display ctrlCreate ["RscCombo", 8009];
_marker1name ctrlSetFade 1;
_marker1name ctrlSetPosition [7.75 * (0.025) + (0), 7.5 * (0.04) + (0), 4.6 * (0.025), 1 * (0.04)]; 
_marker1name ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8009,_x]} forEach ["Vehicle","Base","POI","Cache"];
_marker1name ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker1] call EventMarkerChangeName"];
_marker1name ctrlCommit 0;
_marker1type=0;
Switch ((mapMarker1 select 3)) do {case "Vehicle":{_marker1type=0;};case "Base":{_marker1type=1;};case "POI":{_marker1type=2;};case "Cache":{_marker1type=3;};};
_marker1name lbSetCurSel _marker1type;


_marker1color = _display ctrlCreate ["RscCombo", 8010];
_marker1color ctrlSetFade 1;
_marker1color ctrlSetPosition [12.5 * (0.025) + (0), 7.5 * (0.04) + (0), 4 * (0.025), 1 * (0.04)]; 
_marker1color ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8010,_x]} forEach ["Black","Red","Green","Blue","Orange","White","Pink","Brown","Yellow"];
_marker1color ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker1] call EventMarkerChangeColor"];
_marker1color ctrlCommit 0;
_marker1selcolor=0;
Switch ((mapMarker1 select 6)) do {case "Black":{_marker1selcolor=0;};case "Red":{_marker1selcolor=1;};case "Green":{_marker1selcolor=2;};case "Blue":{_marker1selcolor=3;};case "Orange":{_marker1selcolor=4;};case "White":{_marker1selcolor=5;};case "Pink":{_marker1selcolor=6;};case "Brown":{_marker1selcolor=7;};case "Yellow":{_marker1selcolor=8;};};
_marker1color lbSetCurSel _marker1selcolor;

_marker1ButtonSet = _display ctrlCreate ["RscButtonMenu", 8011];
_marker1ButtonSet ctrlSetFade 1;
_marker1ButtonSet ctrlSetPosition [16.75 * (0.025) + (0), 7.5 * (0.04) + (0), 2.25 * (0.025), 1 * (0.04)];
_marker1ButtonSet ctrlCommit 0;
_marker1ButtonSet ctrlSetEventHandler ["ButtonClick", "mapMarker1 call fnc_openMap;"]; 
_marker1ButtonSet ctrlSetText format["Set"];


/* Marker 2 */
_marker2title = _display ctrlCreate ["RscStructuredText", 8012];
_marker2title ctrlSetFade 1;
_marker2title ctrlSetPosition [19.4 * (0.025) + (0), 7.5 * (0.04) + (0), 2 * (0.025), 2 * (0.04)]; 
_marker2title ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1' color='#ffffff'>2.</t>"]));
_marker2title ctrlCommit 0;

_marker2display = _display ctrlCreate ["RscCombo", 8013];
_marker2display ctrlSetFade 1;
_marker2display ctrlSetPosition [21 * (0.025) + (0), 7.5 * (0.04) + (0), 3.1 * (0.025), 1 * (0.04)]; 
_marker2display ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8013,_x]} forEach ["On","Off"];
_marker2display ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker2] call EventMarkerOn"];
_marker2display ctrlCommit 0;
_marker2toggle=0;
if ((mapMarker2 select 2) isEqualTo true) then {_marker2toggle=0;} else {_marker2toggle=1;};
_marker2display lbSetCurSel _marker2toggle;

_marker2name = _display ctrlCreate ["RscCombo", 8014];
_marker2name ctrlSetFade 1;
_marker2name ctrlSetPosition [24.25 * (0.025) + (0), 7.5 * (0.04) + (0), 4.6 * (0.025), 1 * (0.04)]; 
_marker2name ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8014,_x]} forEach ["Vehicle","Base","POI","Cache"];
_marker2name ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker2] call EventMarkerChangeName"];
_marker2name ctrlCommit 0;
_marker2type=0;
Switch ((mapMarker2 select 3)) do {case "Vehicle":{_marker2type=0;};case "Base":{_marker2type=1;};case "POI":{_marker2type=2;};case "Cache":{_marker2type=3;};};
_marker2name lbSetCurSel _marker2type;

_marker2color = _display ctrlCreate ["RscCombo", 8015];
_marker2color ctrlSetFade 1;
_marker2color ctrlSetPosition [29 * (0.025) + (0), 7.5 * (0.04) + (0), 4 * (0.025), 1 * (0.04)]; 
_marker2color ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8015,_x]} forEach ["Black","Red","Green","Blue","Orange","White","Pink","Brown","Yellow"];
_marker2color ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker2] call EventMarkerChangeColor"];
_marker2color ctrlCommit 0;
_marker2selcolor=0;
Switch ((mapMarker2 select 6)) do {case "Black":{_marker2selcolor=0;};case "Red":{_marker2selcolor=1;};case "Green":{_marker2selcolor=2;};case "Blue":{_marker2selcolor=3;};case "Orange":{_marker2selcolor=4;};case "White":{_marker2selcolor=5;};case "Pink":{_marker2selcolor=6;};case "Brown":{_marker2selcolor=7;};case "Yellow":{_marker2selcolor=8;};};
_marker2color lbSetCurSel _marker2selcolor;

_marker2ButtonSet = _display ctrlCreate ["RscButtonMenu", 8016];
_marker2ButtonSet ctrlSetFade 1;
_marker2ButtonSet ctrlSetPosition [33.25 * (0.025) + (0), 7.5 * (0.04) + (0), 2.25 * (0.025), 1 * (0.04)];
_marker2ButtonSet ctrlCommit 0;
_marker2ButtonSet ctrlSetEventHandler ["ButtonClick", "mapMarker2 call fnc_openMap;"]; 
_marker2ButtonSet ctrlSetText format["Set"];


/* Marker 3 */
_marker3title = _display ctrlCreate ["RscStructuredText", 8017];
_marker3title ctrlSetFade 1;
_marker3title ctrlSetPosition [3 * (0.025) + (0), 11.5 * (0.04) + (0), 2 * (0.025), 2 * (0.04)]; 
_marker3title ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1' color='#ffffff'>3.</t>"])); 
_marker3title ctrlCommit 0;

_marker3display = _display ctrlCreate ["RscCombo", 8018];
_marker3display ctrlSetFade 1;
_marker3display ctrlSetPosition [4.5 * (0.025) + (0), 11.5 * (0.04) + (0), 3.1 * (0.025), 1 * (0.04)]; 
_marker3display ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8018,_x]} forEach ["On","Off"];
_marker3display ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker3] call EventMarkerOn"];
_marker3display ctrlCommit 0;
_marker3toggle=0;
if ((mapMarker3 select 2) isEqualTo true) then {_marker3toggle=0;} else {_marker3toggle=1;};
_marker3display lbSetCurSel _marker3toggle;

_marker3name = _display ctrlCreate ["RscCombo", 8019];
_marker3name ctrlSetFade 1;
_marker3name ctrlSetPosition [7.75 * (0.025) + (0), 11.5 * (0.04) + (0), 4.6 * (0.025), 1 * (0.04)]; 
_marker3name ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8019,_x]} forEach ["Vehicle","Base","POI","Cache"];
_marker3name ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker3] call EventMarkerChangeName"];
_marker3name ctrlCommit 0;
_marker3type=0;
Switch ((mapMarker3 select 3)) do {case "Vehicle":{_marker3type=0;};case "Base":{_marker3type=1;};case "POI":{_marker3type=2;};case "Cache":{_marker3type=3;};};
_marker3name lbSetCurSel _marker3type;


_marker3color = _display ctrlCreate ["RscCombo", 8020];
_marker3color ctrlSetFade 1;
_marker3color ctrlSetPosition [12.5 * (0.025) + (0), 11.5 * (0.04) + (0), 4 * (0.025), 1 * (0.04)]; 
_marker3color ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8020,_x]} forEach ["Black","Red","Green","Blue","Orange","White","Pink","Brown","Yellow"];
_marker3color ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker3] call EventMarkerChangeColor"];
_marker3color ctrlCommit 0;
_marker3selcolor=0;
Switch ((mapMarker3 select 6)) do {case "Black":{_marker3selcolor=0;};case "Red":{_marker3selcolor=1;};case "Green":{_marker3selcolor=2;};case "Blue":{_marker3selcolor=3;};case "Orange":{_marker3selcolor=4;};case "White":{_marker3selcolor=5;};case "Pink":{_marker3selcolor=6;};case "Brown":{_marker3selcolor=7;};case "Yellow":{_marker3selcolor=8;};};
_marker3color lbSetCurSel _marker3selcolor;

_marker3ButtonSet = _display ctrlCreate ["RscButtonMenu", 8021];
_marker3ButtonSet ctrlSetFade 1;
_marker3ButtonSet ctrlSetPosition [16.75 * (0.025) + (0), 11.5 * (0.04) + (0), 2.25 * (0.025), 1 * (0.04)];
_marker3ButtonSet ctrlCommit 0;
_marker3ButtonSet ctrlSetEventHandler ["ButtonClick", "mapMarker3 call fnc_openMap;"]; 
_marker3ButtonSet ctrlSetText format["Set"];


/* Marker 4 */
_marker4title = _display ctrlCreate ["RscStructuredText", 8022];
_marker4title ctrlSetFade 1;
_marker4title ctrlSetPosition [19.4 * (0.025) + (0), 11.5 * (0.04) + (0), 2 * (0.025), 2 * (0.04)]; 
_marker4title ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1' color='#ffffff'>4.</t>"])); 
_marker4title ctrlCommit 0;

_marker4display = _display ctrlCreate ["RscCombo", 8023];
_marker4display ctrlSetFade 1;
_marker4display ctrlSetPosition [21 * (0.025) + (0), 11.5 * (0.04) + (0), 3.1 * (0.025), 1 * (0.04)]; 
_marker4display ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8023,_x]} forEach ["On","Off"];
_marker4display ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker4] call EventMarkerOn"];
_marker4display ctrlCommit 0;
_marker4toggle=0;
if ((mapMarker4 select 2) isEqualTo true) then {_marker4toggle=0;} else {_marker4toggle=1;};
_marker4display lbSetCurSel _marker4toggle;

_marker4name = _display ctrlCreate ["RscCombo", 8024];
_marker4name ctrlSetFade 1;
_marker4name ctrlSetPosition [24.25 * (0.025) + (0), 11.5 * (0.04) + (0), 4.6 * (0.025), 1 * (0.04)]; 
_marker4name ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8024,_x]} forEach ["Vehicle","Base","POI","Cache"];
_marker4name ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker4] call EventMarkerChangeName"];
_marker4name ctrlCommit 0;
_marker4type=0;
Switch ((mapMarker4 select 3)) do {case "Vehicle":{_marker4type=0;};case "Base":{_marker4type=1;};case "POI":{_marker4type=2;};case "Cache":{_marker4type=3;};};
_marker4name lbSetCurSel _marker4type;

_marker4color = _display ctrlCreate ["RscCombo", 8025];
_marker4color ctrlSetFade 1;
_marker4color ctrlSetPosition [29 * (0.025) + (0), 11.5 * (0.04) + (0), 4 * (0.025), 1 * (0.04)]; 
_marker4color ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8025,_x]} forEach ["Black","Red","Green","Blue","Orange","White","Pink","Brown","Yellow"];
_marker4color ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker4] call EventMarkerChangeColor"];
_marker4color ctrlCommit 0;
_marker4selcolor=0;
Switch ((mapMarker4 select 6)) do {case "Black":{_marker4selcolor=0;};case "Red":{_marker4selcolor=1;};case "Green":{_marker4selcolor=2;};case "Blue":{_marker4selcolor=3;};case "Orange":{_marker4selcolor=4;};case "White":{_marker4selcolor=5;};case "Pink":{_marker4selcolor=6;};case "Brown":{_marker4selcolor=7;};case "Yellow":{_marker4selcolor=8;};};
_marker4color lbSetCurSel _marker4selcolor;

_marker4ButtonSet = _display ctrlCreate ["RscButtonMenu", 8026];
_marker4ButtonSet ctrlSetFade 1;
_marker4ButtonSet ctrlSetPosition [33.25 * (0.025) + (0), 11.5 * (0.04) + (0), 2.25 * (0.025), 1 * (0.04)];
_marker4ButtonSet ctrlCommit 0;
_marker4ButtonSet ctrlSetEventHandler ["ButtonClick", "mapMarker4 call fnc_openMap;"]; 
_marker4ButtonSet ctrlSetText format["Set"];

/* Marker 5 */
_marker5title = _display ctrlCreate ["RscStructuredText", 8027];
_marker5title ctrlSetFade 1;
_marker5title ctrlSetPosition [3 * (0.025) + (0), 15.5 * (0.04) + (0), 2 * (0.025), 2 * (0.04)]; 
_marker5title ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1' color='#ffffff'>5.</t>"])); 
_marker5title ctrlCommit 0;

_marker5display = _display ctrlCreate ["RscCombo", 8028];
_marker5display ctrlSetFade 1;
_marker5display ctrlSetPosition [4.5 * (0.025) + (0), 15.5 * (0.04) + (0), 3.1 * (0.025), 1 * (0.04)]; 
_marker5display ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8028,_x]} forEach ["On","Off"];
_marker5display ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker5] call EventMarkerOn"];
_marker5display ctrlCommit 0;
_marker5toggle=0;
if ((mapMarker5 select 2) isEqualTo true) then {_marker5toggle=0;} else {_marker5toggle=1;};
_marker5display lbSetCurSel _marker5toggle;

_marker5name = _display ctrlCreate ["RscCombo", 8029];
_marker5name ctrlSetFade 1;
_marker5name ctrlSetPosition [7.75 * (0.025) + (0), 15.5 * (0.04) + (0), 4.6 * (0.025), 1 * (0.04)]; 
_marker5name ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8029,_x]} forEach ["Vehicle","Base","POI","Cache"];
_marker5name ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker5] call EventMarkerChangeName"];
_marker5name ctrlCommit 0;
_marker5type=0;
Switch ((mapMarker5 select 3)) do {case "Vehicle":{_marker5type=0;};case "Base":{_marker5type=1;};case "POI":{_marker5type=2;};case "Cache":{_marker5type=3;};};
_marker5name lbSetCurSel _marker5type;


_marker5color = _display ctrlCreate ["RscCombo", 8030];
_marker5color ctrlSetFade 1;
_marker5color ctrlSetPosition [12.5 * (0.025) + (0), 15.5 * (0.04) + (0), 4 * (0.025), 1 * (0.04)]; 
_marker5color ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8030,_x]} forEach ["Black","Red","Green","Blue","Orange","White","Pink","Brown","Yellow"];
_marker5color ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker5] call EventMarkerChangeColor"];
_marker5color ctrlCommit 0;
_marker5selcolor=0;
Switch ((mapMarker5 select 6)) do {case "Black":{_marker5selcolor=0;};case "Red":{_marker5selcolor=1;};case "Green":{_marker5selcolor=2;};case "Blue":{_marker5selcolor=3;};case "Orange":{_marker5selcolor=4;};case "White":{_marker5selcolor=5;};case "Pink":{_marker5selcolor=6;};case "Brown":{_marker5selcolor=7;};case "Yellow":{_marker5selcolor=8;};};
_marker5color lbSetCurSel _marker5selcolor;

_marker5ButtonSet = _display ctrlCreate ["RscButtonMenu", 8031];
_marker5ButtonSet ctrlSetFade 1;
_marker5ButtonSet ctrlSetPosition [16.75 * (0.025) + (0), 15.5 * (0.04) + (0), 2.25 * (0.025), 1 * (0.04)];
_marker5ButtonSet ctrlCommit 0;
_marker5ButtonSet ctrlSetEventHandler ["ButtonClick", "mapMarker5 call fnc_openMap;"]; 
_marker5ButtonSet ctrlSetText format["Set"];

/* Marker 6 */
_marker6title = _display ctrlCreate ["RscStructuredText", 8032];
_marker6title ctrlSetFade 1;
_marker6title ctrlSetPosition [19.4 * (0.025) + (0), 15.5 * (0.04) + (0), 2 * (0.025), 2 * (0.04)]; 
_marker6title ctrlSetStructuredText (parseText (format ["<t font='OrbitronMedium' size='1' color='#ffffff'>6.</t>"])); 
_marker6title ctrlCommit 0;

_marker6display = _display ctrlCreate ["RscCombo", 8033];
_marker6display ctrlSetFade 1;
_marker6display ctrlSetPosition [21 * (0.025) + (0), 15.5 * (0.04) + (0), 3.1 * (0.025), 1 * (0.04)]; 
_marker6display ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8033,_x]} forEach ["On","Off"];
_marker6display ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker6] call EventMarkerOn"];
_marker6display ctrlCommit 0;
_marker6toggle=0;
if ((mapMarker6 select 2) isEqualTo true) then {_marker6toggle=0;} else {_marker6toggle=1;};
_marker6display lbSetCurSel _marker6toggle;

_marker6name = _display ctrlCreate ["RscCombo", 8034];
_marker6name ctrlSetFade 1;
_marker6name ctrlSetPosition [24.25 * (0.025) + (0), 15.5 * (0.04) + (0), 4.6 * (0.025), 1 * (0.04)]; 
_marker6name ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8034,_x]} forEach ["Vehicle","Base","POI","Cache"];
_marker6name ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker6] call EventMarkerChangeName"];
_marker6name ctrlCommit 0;
_marker6type=0;
Switch ((mapMarker6 select 3)) do {case "Vehicle":{_marker6type=0;};case "Base":{_marker6type=1;};case "POI":{_marker6type=2;};case "Cache":{_marker6type=3;};};
_marker6name lbSetCurSel _marker6type;

_marker6color = _display ctrlCreate ["RscCombo", 8035];
_marker6color ctrlSetFade 1;
_marker6color ctrlSetPosition [29 * (0.025) + (0), 15.5 * (0.04) + (0), 4 * (0.025), 1 * (0.04)]; 
_marker6color ctrlSetTextColor [.988, .99, 1, 1];
{lbAdd[8035,_x]} forEach ["Black","Red","Green","Blue","Orange","White","Pink","Brown","Yellow"];
_marker6color ctrlSetEventHandler ["LBSelChanged","[(_this select 0),mapMarker6] call EventMarkerChangeColor"];
_marker6color ctrlCommit 0;
_marker6selcolor=0;
Switch ((mapMarker6 select 6)) do {case "Black":{_marker6selcolor=0;};case "Red":{_marker6selcolor=1;};case "Green":{_marker6selcolor=2;};case "Blue":{_marker6selcolor=3;};case "Orange":{_marker6selcolor=4;};case "White":{_marker6selcolor=5;};case "Pink":{_marker6selcolor=6;};case "Brown":{_marker6selcolor=7;};case "Yellow":{_marker6selcolor=8;};};
_marker6color lbSetCurSel _marker6selcolor;

_marker6ButtonSet = _display ctrlCreate ["RscButtonMenu", 8036];
_marker6ButtonSet ctrlSetFade 1;
_marker6ButtonSet ctrlSetPosition [33.25 * (0.025) + (0), 15.5 * (0.04) + (0), 2.25 * (0.025), 1 * (0.04)];
_marker6ButtonSet ctrlCommit 0;
_marker6ButtonSet ctrlSetEventHandler ["ButtonClick", "mapMarker6 call fnc_openMap;"]; 
_marker6ButtonSet ctrlSetText format["Set"];

/* Bottom Buttons */
_infoButton = _display ctrlCreate ["RscButtonMenu", 8037];
_infoButton ctrlSetFade 1;
_infoButton ctrlSetPosition [4.5 * (0.025) + (0), (20 - 2) * (0.04) + (0), 3 * (0.025), 1 * (0.04)];
_infoButton ctrlCommit 0;
_infoButton ctrlSetEventHandler ["ButtonClick", "call fnc_info"]; 
_infoButton ctrlSetText format["Info"];

_loadAllButton = _display ctrlCreate ["RscButtonMenu", 8038];
_loadAllButton ctrlSetFade 1;
_loadAllButton ctrlSetPosition [8 * (0.025) + (0), (20 - 2) * (0.04) + (0), 7.25 * (0.025), 1 * (0.04)];
_loadAllButton ctrlCommit 0;
_loadAllButton ctrlSetEventHandler ["ButtonClick", "call fnc_loadAll"]; 
_loadAllButton ctrlSetText format["Load Changes"];

_disableButton = _display ctrlCreate ["RscButtonMenu", 8039];
_disableButton ctrlSetFade 1;
_disableButton ctrlSetPosition [15.75 * (0.025) + (0), (20 - 2) * (0.04) + (0), 6.25 * (0.025), 1 * (0.04)];
_disableButton ctrlCommit 0;
_disableButton ctrlSetEventHandler ["ButtonClick", "call fnc_disable"]; 
_disableButton ctrlSetText format["Disable All"];

_CtrlX = [8000,8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022,8023,8024,8025,8026,8027,8028,8029,8030,8031,8032,8033,8034,8035,8036,8037,8038,8039,8040];
	{
		_Ctrl = (_display displayCtrl _x);
		_Ctrl ctrlSetFade 0;
		_Ctrl ctrlCommit 0;
	} forEach _CtrlX;

fnc_openMap = {
	(findDisplay 24015) closeDisplay 0;
	openMap true;
	payload = _this;
	MapMouseControl = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonClick","[_this,payload] call fnc_mousebtn;"];
	_removeCtrl = {
		private["_display","_backgroundSplash"];
		systemchat format["You have 20 Seconds to place your marker."];
		Sleep 15;
		systemchat format["5 Seconds Left!"];
		Sleep 4; //i lied
		((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ['MouseButtonClick',MapMouseControl];
		systemchat format["Map Marker Saved"];
		openMap false;
		(findDisplay 24015) closeDisplay 0; //just incase a player gets cheeky
		createDialog'RscExileXm8';
		disableSerialization;
		_display = findDisplay 24015;
		_backgroundSplash = _display displayCtrl 4002;
		_backgroundSplash ctrlShow false;  
		ExileClientXM8IsPowerOn = true;
		execVM'XM8APPS\ExileClient_gui_xm8_slide_apps_onOpen.sqf';
	};
	MapMouseControl spawn _removeCtrl;
};

fnc_mousebtn = {
	private ["_mapcoords","_mapdata"];
	_mapcoords = (_this select 0);
	_mapdata = (_this select 1);
	_colorSelected = "Color" + (_mapdata select 6);
	_pos = ((_mapcoords select 0) posScreenToWorld [_mapcoords select 2, _mapcoords select 3]);
	deleteMarker (_mapdata select 5);
	_marker_name = (_mapdata select 5);		 
	_marker  =  createMarkerlocal [_marker_name , _pos];
	_marker setMarkerType "mil_dot"; //marker type
	_marker setMarkerColor _colorSelected;
	_marker setMarkerText format ["%1 %2",(_mapdata select 5),(_mapdata select 3)];
	[_pos,_mapdata] call fnc_save_marker;
};

fnc_save_marker = {
	private ["_mapcoords","_mapdata"];
	_mapcoords = (_this select 0);
	_mapdata = (_this select 1);
	_markerName = (_mapdata select 4);
	profileNamespace setVariable [_markerName,[(_mapcoords select 0),(_mapcoords select 1),true,(_mapdata select 3),(_mapdata select 4),(_mapdata select 5),(_mapdata select 6)]];
	saveProfileNamespace;
};

EventMarkerOn = {
	private ["_MarkerSentData", "_MarkerActual", "_marker_name", "_marker", "_colorSelected","_mkColorList","_index"];
	_index = lbCurSel (_this select 0);
	_MarkerSentData = (_this select 1);
	_MarkerActual = (_MarkerSentData select 4);
	
	Switch (_index) Do 
	{
		Case 0:
		{
			deleteMarker (_MarkerSentData select 5);
			_colorSelected = "Color" + (_MarkerSentData select 6);
			_marker_name = (_MarkerSentData select 5);		 
			_marker  =  createMarkerlocal [_marker_name , [(_MarkerSentData select 0),(_MarkerSentData select 1)]];
			_marker setMarkerType "mil_dot"; //marker type
			_marker setMarkerColor _colorSelected;
			_marker setMarkerText format ["%1 %2",(_MarkerSentData select 5),(_MarkerSentData select 3)];
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),true,(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),(_MarkerSentData select 6)]];
			saveProfileNamespace;
		};
		Case 1:
		{
			deleteMarker (_MarkerSentData select 5);
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),false,(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),(_MarkerSentData select 6)]];
			saveProfileNamespace;
		};
	};
};

EventMarkerChangeName = {
	private ["_MarkerSentData", "_MarkerActual" ,"_index"];
	_index = lbCurSel (_this select 0);
	_MarkerSentData = (_this select 1);
	_MarkerActual = (_MarkerSentData select 4);
	
	Switch (_index) Do 
	{
		Case 0:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),"Vehicle",(_MarkerSentData select 4),(_MarkerSentData select 5),(_MarkerSentData select 6)]];
			saveProfileNamespace;
		};
		Case 1:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),"Base",(_MarkerSentData select 4),(_MarkerSentData select 5),(_MarkerSentData select 6)]];
			saveProfileNamespace;
		};
		Case 2:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),"POI",(_MarkerSentData select 4),(_MarkerSentData select 5),(_MarkerSentData select 6)]];
			saveProfileNamespace;
		};
		Case 3:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),"Cache",(_MarkerSentData select 4),(_MarkerSentData select 5),(_MarkerSentData select 6)]];
			saveProfileNamespace;
		};
	};	
};

EventMarkerChangeColor = {
	private ["_MarkerSentData", "_MarkerActual" ,"_index"];
	_index = lbCurSel (_this select 0);
	_MarkerSentData = (_this select 1);
	_MarkerActual = (_MarkerSentData select 4);
	
	Switch (_index) Do 
	{
		Case 0:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Black"]];
			saveProfileNamespace;
		};
		Case 1:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Red"]];
			saveProfileNamespace;
		};
		Case 2:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Green"]];
			saveProfileNamespace;
		};
		Case 3:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Blue"]];
			saveProfileNamespace;
		};
		Case 4:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Orange"]];
			saveProfileNamespace;
		};
		Case 5:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"White"]];
			saveProfileNamespace;
		};
		Case 6:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Pink"]];
			saveProfileNamespace;
		};
		Case 7:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Brown"]];
			saveProfileNamespace;
		};
		Case 8:
		{
			profileNamespace setVariable [_MarkerActual,[(_MarkerSentData select 0),(_MarkerSentData select 1),(_MarkerSentData select 2),(_MarkerSentData select 3),(_MarkerSentData select 4),(_MarkerSentData select 5),"Yellow"]];
			saveProfileNamespace;
		};
	};	
};

fnc_info = {
	systemchat "To get the best saving results after changing options reload the app.";
	systemchat "If you can't select a button try clicking other buttons then go back to it.";
	systemchat "To load all your map markers press load changes button.";
};

fnc_loadAll = {
	private ["_markerList", "_markerData", "_colorSelected", "_marker_name", "_marker"];
	TempmapMarker1 = profileNamespace getVariable "map_marker1";TempmapMarker2 = profileNamespace getVariable "map_marker2";TempmapMarker3 = profileNamespace getVariable "map_marker3";
	TempmapMarker4 = profileNamespace getVariable "map_marker4";TempmapMarker5 = profileNamespace getVariable "map_marker5";TempmapMarker6 = profileNamespace getVariable "map_marker6";
	/* Need to reload the map markers at this point to detect new changes */
	_markerList = [TempmapMarker1,TempmapMarker2,TempmapMarker3,TempmapMarker4,TempmapMarker5,TempmapMarker6];
	{
		_markerData = _x;
		if ((_markerData select 2) isEqualTo true) then {
			deleteMarker (_markerData select 5);
			_colorSelected = "Color" + (_markerData select 6);
			_marker_name = (_markerData select 5);		 
			_marker  =  createMarkerlocal [_marker_name , [(_markerData select 0),(_markerData select 1)]];
			_marker setMarkerType "mil_dot"; //marker type
			_marker setMarkerColor _colorSelected;
			_marker setMarkerText format ["%1 %2",(_markerData select 5),(_markerData select 3)];
		} else {
			deleteMarker (_markerData select 5);
		};
	} forEach _markerList;
};

fnc_disable = {
	private ["_markerList", "_markerData", "_markerName"];
	_markerList = [mapMarker1,mapMarker2,mapMarker3,mapMarker4,mapMarker5,mapMarker6];
	{
		deleteMarker (_x select 5);
		_markerData = _x;
		_markerName = (_markerData select 4);
		profileNamespace setVariable [_markerName,[(_markerData select 0),(_markerData select 1),false,(_markerData select 3),(_markerData select 4),(_markerData select 5),(_markerData select 6)]];
		saveProfileNamespace;
	} forEach _markerList;
	call fnc_goBack;
};

//Created the go back button and add the button click event handeler to it
//Note you do need to add all Idds for all the controlls you have created to the _Ctrls array
_goBackButton = _display ctrlCreate ["RscButtonMenu", 8040];
_goBackButton ctrlSetFade 1;
_goBackButton ctrlSetPosition [(34 - 3) * (0.025) + (0), (20 - 2) * (0.04) + (0), 4.5 * (0.025), 1 * (0.04)];
_goBackButton ctrlSetFade 0;
_goBackButton ctrlCommit 0;
_goBackButton ctrlSetEventHandler ["ButtonClick", "call fnc_goBack"]; 
_goBackButton ctrlSetText format["GO BACK"];

fnc_goBack = {
	private ["_display", "_Ctrls", "_ctrl"];
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_Ctrls = [8000,8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022,8023,8024,8025,8026,8027,8028,8029,8030,8031,8032,8033,8034,8035,8036,8037,8038,8039,8040];
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