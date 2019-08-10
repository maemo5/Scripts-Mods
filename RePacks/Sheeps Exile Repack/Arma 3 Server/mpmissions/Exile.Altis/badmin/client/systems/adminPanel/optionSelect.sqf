// *****************************************************************************************
// * This script is licensed under the GNU Lesser GPL v3. Copyright © 2015 A3Wasteland.com *
// *****************************************************************************************
//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
// bAdmin Exile by Biabock

#define debugMenu_option 50003
#define adminMenu_option 50001
disableSerialization;

private ["_panelType","_displayAdmin","_displayDebug","_displayShop","_adminSelect","_debugSelect","_shopSelect","_Poptabs","_Score"];
_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	_panelType = _this select 0;

	_displayAdmin = uiNamespace getVariable ["AdminMenu", displayNull];
	_displayDebug = uiNamespace getVariable ["DebugMenu", displayNull]; //tp menu
	_displayShop = uiNamespace getVariable ["ShopMenu", displayNull];

	switch (true) do
	{
		case (!isNull _displayAdmin): //Admin panel
		{
			_adminSelect = _displayAdmin displayCtrl adminMenu_option;

			switch (lbCurSel _adminSelect) do
			{
				case 0: //Player Menu
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\playerMenu.sqf";
				};
				case 1: //Tags
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\playerTags.sqf";
				};
				case 2: //Tags
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\vehicleManagement.sqf";
				};
				case 3: //Magazine 
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\exammo.sqf";
				};
				case 4: //Add Money
				{
					_newPoptabs = ExileClientPlayerMoney + 10000;
					ENIGMA_UpdateStats = [player,_newPoptabs];
					publicVariableServer "ENIGMA_UpdateStats";
					systemChat "Added 10000 Poptabs for you";
				};
				case 5: //Add Score
				{
					_newScore = ExileClientPlayerScore + 10000;
					ENIGMA_UpdateStats = [player,0,_newScore];
					publicVariableServer "ENIGMA_UpdateStats";
					systemChat "Added 10000 Score for you";
				};
				case 6: //TP Menu
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\loadDebugMenu.sqf";
				};
				case 7: //Server FPS
				{
					hint format["Server FPS: %1",serverFPS];
				};
				case 8: // toggle God mode
				{
					execVM "badmin\client\systems\adminPanel\toggleGodMode.sqf";
				};
				case 9: // Repair/Flip
				{
					execVM "badmin\client\systems\adminPanel\repairflip.sqf";
				};
				case 10: // No Recoil
				{
					execVM "badmin\client\systems\adminPanel\recoil.sqf";
				};
				case 11: // Delete Target
				{
					execVM "badmin\client\systems\adminPanel\deletetarget.sqf";
				};
				case 12: //Fix Target
				{
					execVM "badmin\client\systems\adminPanel\fixtarget.sqf";
				};
				case 13: 
				{
					closeDialog 0;
					[] call ExileClient_gui_purchaseTerritoryDialog_show;
				};
				case 14:
				{
					closeDialog 0;
					[] call ExileClient_gui_payTerritoryProtectionMoneyDialog_show;
				};
			};
		};
		case (!isNull _displayDebug): //TP panel
		{
			_debugSelect = _displayDebug displayCtrl debugMenu_option;

			switch (lbCurSel _debugSelect) do
			{
				case 0: //TP Map Position
				{
					closeDialog 0;
					onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
					hint "Click on map to teleport";
				};
				case 1: //TP Me to Player
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\tpmeto.sqf";
				};
				case 2: //TP Player to Me
				{
					closeDialog 0;
					execVM "badmin\client\systems\adminPanel\tptome.sqf";
				};
			};
		};
		case (!isNull _displayShop): //Shop panel
		{
			_shopSelect = _displayShop displayCtrl shopMenu_option;

			switch (lbCurSel _debugSelect) do
			{
				case 0: //soon
				{
					closeDialog 0;
					[] call ExileClient_gui_purchaseTerritoryDialog_show;
				};
				case 1: //soon
				{
					closeDialog 0;
					[] call ExileClient_gui_traderDialog_show;
				};
				case 2: //soon
				{
					closeDialog 0;
					[] call ExileClient_gui_vehicleTraderDialog_show;
				};
				case 3: //soon
				{
					closeDialog 0;
					systemChat "Not Implemented Yet";
				};
			};
		};
	};
};