/*
BASE script made by Shix http://www.exilemod.com/profile/4566-shix/ 
this is just the base for any project so scripters do not have to figure out how to hide controlls and figure out a go back solution
baseLevel.sqf by: -NFK- aka oSoDirty
credits to Shix and Taylor Swift as
I have learned a great deal of info 
from apps the 2 of them have released
The text part of this app is taken 
(with permission) directly from Shix's 
Info App, I take absolutely no credit for this.
*/ 

//////////////////////////////////////////////////
// Text Config **From Info App Created By Shix**
//////////////////////////////////////////////////
_line1Text = "This app does not upgrade your base.";
_line2Text = "It simply sells you the required";
_line3Text = "amount of respect to do so.";
_line4Text = "Prices in poptabs are as follows:";
_line5Text = "Level 2: $50000 - 10k respect";
_line6Text = "Level 3: $75000 - 15k respect";
_line7Text = "Level 4: $100000 - 20k respect";
_line8Text = "Level 5: $125000 - 25k respect";
_line9Text = "Level 6: $150000 - 30k respect";
_line10Text = "Level 7: $175000 - 35k respect";
_line11Text = "Level 8: $200000 - 40k respect";
_line12Text = "Level 9: $225000 - 45k respect";
_line13Text = "Level 10: $250000 - 50k respect";
////////////////////
//Text Config end
////////////////////


//Base script to remove and disable the app buttons
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

_curViewDist = viewDistance;
_curObjViewDist = getObjectViewDistance select 0;

_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;
//Base script end

(_display displayCtrl 4004) ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>Purchase Base Upgrade</t>"]));

//From Info App created by Shix
_StructuredTextBox = _display ctrlCreate ["RscStructuredText", 1120];
_StructuredTextBox ctrlSetPosition [(7 - 3) * (0.025), (6 - 2) * (0.04),(0.8),(0.54)];
_StructuredTextBox ctrlCommit 0;
_StructuredTextBox ctrlSetBackgroundColor [1,1,1,0.05];
_StructuredTextBox ctrlSetStructuredText parseText (format["<t align='left'>%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7<br/>%8<br/>%9<br/>%10<br/>%11<br/>%12<br/>%13</t>",_line1Text,_line2Text,_line3Text,_line4Text,_line5Text,_line6Text,_line7Text,_line8Text,_line9Text,_line10Text,_line11Text,_line12Text,_line13Text]);
_StructuredTextBox ctrlSetTextColor [0.886,0.255,0.259,1];
//End Info App

ctrlEnable [1120, false]; // Added this to prevent breaking of buttons due to clicking the text box

_LvlTwoBtn = _display ctrlCreate ["RscButtonMenu", 1110];
_LvlTwoBtn ctrlSetPosition [(24 - 3) * (0.025),(6.4 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlTwoBtn ctrlCommit 0;
_LvlTwoBtn ctrlSetText "Level 2";
_LvlTwoBtn ctrlSetEventHandler ["ButtonClick", "[1]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlThreeBtn = _display ctrlCreate ["RscButtonMenu", 1121];
_LvlThreeBtn ctrlSetPosition [(32 - 3) * (0.025),(6.4 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlThreeBtn ctrlCommit 0;
_LvlThreeBtn ctrlSetText "Level 3";
_LvlThreeBtn ctrlSetEventHandler ["ButtonClick", "[2]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlFourBtn = _display ctrlCreate ["RscButtonMenu", 1112];
_LvlFourBtn ctrlSetPosition [(24 - 3) * (0.025),(8.9 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlFourBtn ctrlCommit 0;
_LvlFourBtn ctrlSetText "Level 4";
_LvlFourBtn ctrlSetEventHandler ["ButtonClick", "[3]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlFiveBtn = _display ctrlCreate ["RscButtonMenu", 1122];
_LvlFiveBtn ctrlSetPosition [(32 - 3) * (0.025),(8.9 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlFiveBtn ctrlCommit 0;
_LvlFiveBtn ctrlSetText "Level 5";
_LvlFiveBtn ctrlSetEventHandler ["ButtonClick", "[4]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlSixBtn = _display ctrlCreate ["RscButtonMenu", 1114];
_LvlSixBtn ctrlSetPosition [(24 - 3) * (0.025),(11.4 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlSixBtn ctrlCommit 0;
_LvlSixBtn ctrlSetText "Level 6";
_LvlSixBtn ctrlSetEventHandler ["ButtonClick", "[5]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlSevenBtn = _display ctrlCreate ["RscButtonMenu", 1115];
_LvlSevenBtn ctrlSetPosition [(32 - 3) * (0.025),(11.4 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlSevenBtn ctrlCommit 0;
_LvlSevenBtn ctrlSetText "Level 7";
_LvlSevenBtn ctrlSetEventHandler ["ButtonClick", "[6]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlEightBtn = _display ctrlCreate ["RscButtonMenu", 1116];
_LvlEightBtn ctrlSetPosition [(24 - 3) * (0.025),(13.9 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlEightBtn ctrlCommit 0;
_LvlEightBtn ctrlSetText "Level 8";
_LvlEightBtn ctrlSetEventHandler ["ButtonClick", "[7]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlNineBtn = _display ctrlCreate ["RscButtonMenu", 1123];
_LvlNineBtn ctrlSetPosition [(32 - 3) * (0.025),(13.9 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlNineBtn ctrlCommit 0;
_LvlNineBtn ctrlSetText "Level 9";
_LvlNineBtn ctrlSetEventHandler ["ButtonClick", "[8]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

_LvlTenBtn = _display ctrlCreate ["RscButtonMenu", 1118];
_LvlTenBtn ctrlSetPosition [(24 - 3) * (0.025),(16.4 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_LvlTenBtn ctrlCommit 0;
_LvlTenBtn ctrlSetText "Level 10";
_LvlTenBtn ctrlSetEventHandler ["ButtonClick", "[9]execVM 'xm8Apps\Apps\BaseUpgrade\fnc_upgrade.sqf'"];

//Create the go back button
_GoBackBtn = _display ctrlCreate ["RscButtonMenu", 1119];
_GoBackBtn ctrlSetPosition [(32 - 3) * (0.025),(20 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_GoBackBtn ctrlCommit 0;
_GoBackBtn ctrlSetText "Go Back";
_GoBackBtn ctrlSetEventHandler ["ButtonClick", "call fnc_goBack"];

// Base function to return to apps
fnc_goBack = {
  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
  _vdCtrls = [1110,1121,1112,1122,1114,1115,1116,1123,1118,1119,1120];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, false];
  } forEach _vdCtrls;
  execVM "xm8Apps\XM8Apps_Init.sqf";
  uiSleep 1;
  {
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _vdCtrls;
};