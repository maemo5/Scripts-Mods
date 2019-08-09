/* 
fnc_upgrade.sqf by -NFK- aka oSoDirty
Did this on a different file because
it's the only way I know to keep the code
in a scheduled environment. Feel free to 
enlighten me on a better way. =D
*/




//////////////////////////////
// Set your server name below
//////////////////////////////
_serverName = "CHANGEME";   // Keep it short!!
//////////////////////////////

 /*
 Price configs found below.
 If you have modified your
 your upgrade prices in your
 servers config you will need
 to change the respect payouts,
 and prices accordingly.
 (be sure to get them all)
 */

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_upgradeNum = _this select 0;
  switch (_upgradeNum) do {
    case (1): {
	  ///////////////
	  //Lvl 2 Config
	  ///////////////
	  _price = 50000;		 // poptabs taken							
	  _tradeOut = 10000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {			//Keep all of these set to greater than. If set to greater than or equal to it will allow player to even out their poptabs to match the cost and get it for free. For some reason Enigma will not take your exact amount of poptabs/respect	
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (2): {
	  ///////////////
	  //Lvl 3 Config
	  ///////////////
	  _price = 75000;		 // poptabs taken							
	  _tradeOut = 15000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (3): {
	  ///////////////
	  //Lvl 4 Config
	  ///////////////
	  _price = 100000;		 // poptabs taken							
	  _tradeOut = 20000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (4): {
	  ///////////////
	  //Lvl 5 Config
	  ///////////////
	  _price = 125000;		 // poptabs taken							
	  _tradeOut = 25000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (5): {
	  ///////////////
	  //Lvl 6 Config
	  ///////////////
	  _price = 150000;		 // poptabs taken							
	  _tradeOut = 30000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (6): {
	  ///////////////
	  //Lvl 7 Config
	  ///////////////
	  _price = 175000;		 // poptabs taken							
	  _tradeOut = 35000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (7): {
	  ///////////////
	  //Lvl 8 Config
	  ///////////////
	  _price = 200000;		 // poptabs taken							
	  _tradeOut = 40000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (8): {
	  ///////////////
	  //Lvl 9 Config
	  ///////////////
	  _price = 225000;		 // poptabs taken							
	  _tradeOut = 45000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {					
		  execVM "xm8Apps\Apps\BaseUpgrade\antiSpam.sqf";
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
    case (9): {
	  ///////////////
	  //Lvl 10 Config
	  ///////////////
	  _price = 250000;		 // poptabs taken							
	  _tradeOut = 50000;     // respect given
	  ///////////////
	  //End
	  ///////////////

	  _short = _price - ExileClientPlayerMoney + 1;

	  if (ExileClientPlayerMoney > _price) then {
		  call fnc_disable;
		  _take = format ["Removing: %1 Poptabs", _price];
		  ["Whoops", [_take]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _cost = ExileClientPlayerMoney - _price;				
		  ENIGMA_UpdateStats = [player,_cost];					
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _give = format ["Adding: %1 Respect", _tradeOut];
		  ["Whoops", [_give]] call ExileClient_gui_notification_event_addNotification;
		  sleep 2;
		  _resp = ExileClientPlayerScore + _tradeOut;
		  ENIGMA_UpdateStats = [player,0,_resp];
		  publicVariableServer "ENIGMA_UpdateStats";
		  sleep 2;
		  _thanks = format ["Thank you %1, for choosing %2!", name player, _serverName];
		  ["Whoops", [_thanks]] call ExileClient_gui_notification_event_addNotification;
		  call fnc_enable;
	  } else {
		  _nope = format ["Sorry %1, you need at least %2 more poptab(s) for the selected upgrade!", name player, _short];
		  ["Whoops", [_nope]] call ExileClient_gui_notification_event_addNotification;
		};  
    };
  };
};