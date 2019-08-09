/*
	Made By: Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/

	Features: Allows  players to transfer respect to one another. Group members appear as the same
			color to the player, so its easier to see who is in your group.
			Players can lose up to 10% (admin Configurable) and 10+ (admin Configurable) players
			must be online to transfer.
			
	Requirements: XM8Apps http://www.exilemod.com/topic/9040-xm8-apps/
				Edits in exile_server.pbo
				Custom exile_respect.pbo
				
	Credits: ExileMod (Mimics PoptabsTrasnfer.. 99%)
			Shix XM8Apps
			Happydayz - Told me how to load 2+ clients ingame at once <3

*/

private ["_display", "_xm8Controlls", "_fade", "_minPlayers", "_maxPercent", "_fontStyle", "_respectListBox", "_respectInfoGroup", "_respectGroupCaption1", "_respectGroupCaption2", "_respectGroupCaption3", "_respectGroupCaption4", "_respectGroupCaption5", "_respectGroupCaption6", "_respectSendGroup", "_respectSendGroupCaption", "_respectInputBox", "_respectTransferButton", "_poptabsButton", "_index", "_members", "_goBackButton"];

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


/* CONFIG */
_minPlayers = 10; //if less than this # of players is online, nothing can be done
_maxPercent = 10; //keep this as a whole number.. Ex.. up to 20% loss would be 20
_fontStyle = 0; 
/* CONFIG END */
/* DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING */


Switch (_fontStyle) Do
{
	Case 0:{fontType = "OrbitronLight";fontSize = 0.025;};
	Case 1:{fontType = "OrbitronMedium";fontSize = 0.025;};
	Case 2:{fontType = "RobotoMedium";fontSize = 0.029;};
	Case 3:{fontType = "puristaMedium";fontSize = 0.032;};
};


_respectListBox = _display ctrlCreate ["RscExileXM8ListBox", 7000];
_respectListBox ctrlSetPosition [(8 - 3) * (0.025) + (0), (7 - 2) * (0.04) + (0), 19 * (0.025), 14 * (0.04)];
_respectListBox ctrlCommit 0;
_respectListBox ctrlSetEventHandler ["LBSelChanged", "_this call ExileClient_respect_event_onPlayerListBoxSelectionChanged"];

_respectInfoGroup = _display ctrlCreate ["RscExileXM8Frame", 7001];
_respectInfoGroup ctrlSetPosition [(29 - 3) * (0.025) + (0), (9 - 2) * (0.04) + (0), 9.5 * (0.025), 4 * (0.04)];
_respectInfoGroup ctrlCommit 0;

_respectGroupCaption1 = _display ctrlCreate ["RscText", 7002];
_respectGroupCaption1 ctrlSetPosition [(29 - 3) * (0.025) + (0), (9 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_respectGroupCaption1 ctrlSetText format["Transfering is risky.."];
_respectGroupCaption1 ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectGroupCaption1 ctrlSetFont fontType;
_respectGroupCaption1 ctrlSetFontHeight fontSize;
_respectGroupCaption1 ctrlCommit 0;

_respectGroupCaption2 = _display ctrlCreate ["RscText", 7003];
_respectGroupCaption2 ctrlSetPosition [(29 - 3) * (0.025) + (0), (9.6 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_respectGroupCaption2 ctrlSetText format["You could lose up to"];
_respectGroupCaption2 ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectGroupCaption2 ctrlSetFont fontType;
_respectGroupCaption2 ctrlSetFontHeight fontSize;
_respectGroupCaption2 ctrlCommit 0;

_respectGroupCaption3 = _display ctrlCreate ["RscText", 7004];
_respectGroupCaption3 ctrlSetPosition [(29 - 3) * (0.025) + (0), (10.2 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_respectGroupCaption3 ctrlSetText format["%1%2 of transfered respect.",_maxPercent,"%"];
_respectGroupCaption3 ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectGroupCaption3 ctrlSetFont fontType;
_respectGroupCaption3 ctrlSetFontHeight fontSize;
_respectGroupCaption3 ctrlCommit 0;

_respectGroupCaption4 = _display ctrlCreate ["RscText", 7005];
_respectGroupCaption4 ctrlSetPosition [(29 - 3) * (0.025) + (0), (10.8 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_respectGroupCaption4 ctrlSetText format["In order to not be caught"];
_respectGroupCaption4 ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectGroupCaption4 ctrlSetFont fontType;
_respectGroupCaption4 ctrlSetFontHeight fontSize;
_respectGroupCaption4 ctrlCommit 0;

_respectGroupCaption5 = _display ctrlCreate ["RscText", 7006];
_respectGroupCaption5 ctrlSetPosition [(29 - 3) * (0.025) + (0), (11.4 - 2) * (0.04) + (0), 9.5 * (0.025), 1 * (0.04)];
_respectGroupCaption5 ctrlSetText format["%1+ Players must be online",_minPlayers];
_respectGroupCaption5 ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectGroupCaption5 ctrlSetFont fontType;
_respectGroupCaption5 ctrlSetFontHeight fontSize;
_respectGroupCaption5 ctrlCommit 0;

_respectGroupCaption6 = _display ctrlCreate ["RscText", 7007];
_respectGroupCaption6 ctrlSetPosition [(29 - 3) * (0.025) + (0), (12 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_respectGroupCaption6 ctrlSetText format["Good Luck.."];
_respectGroupCaption6 ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectGroupCaption6 ctrlSetFont fontType;
_respectGroupCaption6 ctrlSetFontHeight fontSize;
_respectGroupCaption6 ctrlCommit 0;

_respectSendGroup = _display ctrlCreate ["RscExileXM8Frame", 7008];
_respectSendGroup ctrlSetPosition [(29 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 9.5 * (0.025), 4 * (0.04)];
_respectSendGroup ctrlCommit 0;

_respectSendGroupCaption = _display ctrlCreate ["RscText", 7009];
_respectSendGroupCaption ctrlSetPosition [(29 - 3) * (0.025) + (0), (14 - 2) * (0.04) + (0), 9 * (0.025), 1 * (0.04)];
_respectSendGroupCaption ctrlSetText format["Transfer Respect."];
_respectSendGroupCaption ctrlSetTextColor [252/255, 253/255, 255/255, 1];
_respectSendGroupCaption ctrlSetFont fontType;
_respectSendGroupCaption ctrlSetFontHeight fontSize;
_respectSendGroupCaption ctrlCommit 0;

_respectInputBox = _display ctrlCreate ["RscExileXM8Edit", 7010];
_respectInputBox ctrlSetPosition [(29.5 - 3) * (0.025) + (0), (15 - 2) * (0.04) + (0), 8 * (0.025), 1.5 * (0.04)];
_respectInputBox ctrlCommit 0;
_respectInputBox ctrlSetBackgroundColor [41/255, 39/255, 46/255, 1];
_respectInputBox ctrlSetEventHandler ["Char", "_this call ExileClient_respect_event_onRespectInputBoxChar"];

_respectTransferButton = _display ctrlCreate ["RscButtonMenu", 7011];
_respectTransferButton ctrlSetPosition [(29.5 - 3) * (0.025) + (0), (16.75 - 2) * (0.04) + (0), 8 * (0.025), 1 * (0.04)];
_respectTransferButton ctrlCommit 0;
_respectTransferButton ctrlSetEventHandler ["ButtonClick", "_this spawn ExileClient_respect_event_onSendRespectButtonClick"];
_respectTransferButton ctrlSetText format["TRANSFER"];

_poptabsButton = _display ctrlCreate ["RscButtonMenu", 7012];
_poptabsButton ctrlSetPosition [(29 - 3) * (0.025) + (0), (7 - 2) * (0.04) + (0), 9.5 * (0.025), 1 * (0.04)];
_poptabsButton ctrlCommit 0;
_poptabsButton ctrlSetEventHandler ["ButtonClick", "call OpenSlidePlayers"];
_poptabsButton ctrlSetText format["POPTABS TRANSFER"];

OpenSlidePlayers = {
	private ["_display", "_Ctrls", "_ctrl","_appsSlide","_ctrlMain","_ctrlArray"];
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_Ctrls = [7000,7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,8999];
	{
		_ctrl = (_display displayCtrl _x);
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0.25;
		ctrlEnable [_x, false];
	} forEach _Ctrls;
	_ctrlArray = [4007,4060,4040,4120,4080,4070,4090,4100,4110,4130,4030];
	{
		_ctrlMain = (_display displayCtrl _x);
		_ctrlMain ctrlSetFade 0;
		_ctrlMain ctrlCommit 0;
		ctrlEnable [_x, true];
	} forEach _ctrlArray;
	_appsSlide = (_display displayCtrl 4040);
	_appsSlide ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
	_appsSlide ctrlCommit 0.25;
	["players", 0] call ExileClient_gui_xm8_slide;
	uiSleep 1;
	{
		ctrlDelete ((findDisplay 24015) displayCtrl _x);
	} forEach _Ctrls;
};


if((count (allPlayers - allMissionObjects "HeadlessClient_F")) >= _minPlayers) then {
	_respectListBox ctrlEnable true;
	_respectTransferButton ctrlEnable true;
} else {
	_respectListBox ctrlEnable false;
	_respectTransferButton ctrlEnable false;
};


OnlinePlayersNetID = [];


lbClear _respectListBox;
if ((player getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
{
	{
		if ((_x getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
		{
			_index = _respectListBox lbAdd (name _x);
			_respectListBox lbSetData [_index, netId _x];
			_members = units (group player);
			if (_x isEqualTo player) then
			{
				_respectListBox lbSetColor [_index, [0/255, 178/255, 205/255, 1]];
			};
			if (_x in _members && _x != player) then
			{
				_respectListBox lbSetColor [_index, [0/255, 178/255, 205/255, 1]];
			}
			else
			{
				if !(alive _x) then
				{
					_respectListBox lbSetColor [_index, [225/255, 65/255, 65/255, 1]];
				};
			};
			if(_x != player) then
			{
				OnlinePlayersNetID pushBack (netId _x);
			};
		};
	}
	forEach allPlayers;
};
publicVariableServer "OnlinePlayersNetID";
MaxPercentAllowed = _maxPercent;
publicVariableServer "MaxPercentAllowed";


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
	_Ctrls = [7000,7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,8999];
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
