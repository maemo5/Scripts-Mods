//////////////////////////////////////////////////////
/////// ARMA 3 EPOCH SERVERMENU SCRIPT BY IT07 ///////
/////// VERSION: 02314_BETA                    ///////
/////// SUPPORT: it07@scarcode.com		   	   ///////
//////////////////////////////////////////////////////

private["_compileMenu"];
_compileMenu = _this select 0;

if(_compileMenu) then 
{
	SC_handleServerMenuContent =
	{
		777 cutText ['','PLAIN'];
		sleep 0.2;
		777 cutRsc ['serverMenuItemShow','PLAIN'];
	};
	
	disclaimer = "The above is subject to change and should be checked regularly.";	// This shows on the rules and info. Change it if you want.

	SC_loadServerMenu =
	{
		[] spawn 
		{
			SC_serverMenuYES = player addAction ["Display server menu? [YES]", { ["YES"] call SC_fnc_serverMenu }, "", -1, false, false, "", ""];
			SC_serverMenuNO = player addAction ["Display server menu? [NO]", { ["NO"] call SC_fnc_serverMenu }, "", -1, false, false, "", ""];
		};
	};

	SC_fnc_serverMenu = // This function is called when player chooses to show the server menu
	{
		private["_showMenu"];
		_showMenu = _this select 0;
		switch (_showMenu) do 
		{ 
			case "YES":
			{
				// This will be called if players chooses to show the menu
				player removeAction SC_serverMenuYES; // Remove the YES action
				player removeAction SC_serverMenuNO; // Remove the NO action
				SC_spwn_ServerMenuLoop = [] spawn
				{
					while {(!isNull Player) and (alive Player) and (player == player)} do // While the player exist, is alive and a player, then do
					{
						if (isNil "SC_preventActionLoop") then // Make sure that this var does not exist
						{
							SC_serverMenuAction = player addAction ["Server Menu (show)", { ["Show"] call SC_fnc_menuHandle }, "", -1, false, false, "", ""];	// Add the server menu (show) action
							SC_preventActionLoop = true; // This will return false on the check in line 10
							waitUntil { (isNil "SC_preventActionLoop") }; // I hate while do's to be honest so we'll just cheat a little and use a waitUntil to prevent waste of CPU power
						};
					};
				};				
			};
		
			case "NO":
			{
				// This will be called if player chooses to NOT show the menu
				player removeAction SC_serverMenuYES; // Remove the YES action
				player removeAction SC_serverMenuNO; // Remove the NO action
				private"_name"; _name = name player; // Var local to this scope that contains the name of the player
				systemChat format["Ok %1, server menu action is now gone until next relog.", _name]; // Just a little notification in the systemChat to assure that the player hid the actions
			};
		};
	};

	SC_fnc_menuHandle = // This will be called when the (show) option is clicked
	{
		private["_SChandler"];
		_SChandler = _this select 0;
		switch (_SChandler) do
		{
			case "Show":
			{
				if (isNil "SC_isCalled") then // This is from earlier testing version. Don't want to remove it.
				{
					player removeAction SC_serverMenuAction; // Remove the (show) action
					SC_serverMenuAction = player addAction ["Server Menu (hide)", { ["Hide"] call SC_fnc_menuHandle }, "", -1, false, false, "", ""];	// Add (hide) action
					SC_serverMenuItemRules = player addAction ["    Rules", { ["Rules"] call SC_fnc_menuItemHandle }, "", -1, false, false, "", ""];
					SC_serverMenuItemInfo = player addAction ["    Server info", { ["Info"] call SC_fnc_menuItemHandle }, "", -1, false, false, "", ""];
					SC_serverMenuItemSupport = player addAction ["    Need help?", { ["Support"] call SC_fnc_menuItemHandle }, "", -1, false, false, "", ""];
					SC_serverMenuItemDonate = player addAction ["    Donate", { ["Donate"] call SC_fnc_menuItemHandle }, "", -1, false, false, "", ""];
					SC_serverMenuItemClose = player addAction ["  Remove menu", { ["Remove"] call SC_fnc_menuHandle }, "", -1, false, false, "", ""];
					SC_isCalled = true; // This was because it prevented the player from reclicking the server menu action again
				};
			};
		
			case "Hide":
			{
				player removeAction SC_serverMenuAction;
				player removeAction SC_serverMenuItemRules;
				player removeAction SC_serverMenuItemInfo;
				player removeAction SC_serverMenuItemSupport;
				player removeAction SC_serverMenuItemDonate;
				player removeAction SC_serverMenuItemClose;
				777 cutText ['','PLAIN'];
				SC_preventActionLoop = nil;
				SC_isCalled = nil;
			};
		
			case "Remove":
			{
				player removeAction SC_serverMenuAction;
				player removeAction SC_serverMenuItemRules;
				player removeAction SC_serverMenuItemInfo;
				player removeAction SC_serverMenuItemSupport;
				player removeAction SC_serverMenuItemDonate;
				player removeAction SC_serverMenuItemClose;
				777 cutText ['','PLAIN'];
				terminate SC_spwn_ServerMenuLoop;
			};
		};
	};
	
	SC_fnc_menuItemHandle = 
	{
		private["_whichItem"];
		_whichItem = _this select 0;
		
		switch (_whichItem) do
		{
			case "Rules":
			{
				[] spawn 
				{
					call SC_handleServerMenuContent;
					private ["_title", "_ruleOne"];
					// If you want to add rules in this, you have to know how to code.
					_title = "THE RULES"; // This is %1
					_ruleOne = "1. No profanity"; // This is %2		
					_serverMenuCurrentText = format["<t size='3.5'>%1</t><br />%2<br /><t size='0.8'>%3</t>", _title, _ruleOne, disclaimer]; // <br /> is a linebreak
					waitUntil {!isNull (uiNameSpace getVariable "serverMenuItemShow")};
					_display = uiNameSpace getVariable "serverMenuItemShow";
					_setText = _display displayCtrl 7777;
					_setText ctrlSetStructuredText (parseText format["%1", _serverMenuCurrentText]);
				};
			};
			
			case "Info":
			{
				[] spawn 
				{
					call SC_handleServerMenuContent;
					private ["_title", "_ip", "_port", "_mod", "_admins", "_hostedBy"];
					_title = "SERVER INFO";
					_ip = "IP = yourIpHere";
					_port = "PORT = yourPortHere";
					_mod = "MOD: ArmA 3 Epoch from http://epochmod.com";
					_admins = "ADMINS: youradmins here";
					_hostedBy = "HOSTED BY: yourhostedbyhere";
					_serverMenuCurrentText = format["<t size='3.5'>%1</t><br />%2<br />%3<br />%4<br />%5<br />%6<br /><t size='0.8'>%7</t>", _title, _ip, _port, _mod, _admins, _hostedBy, disclaimer]; // <br /> is a linebreak
					waitUntil {!isNull (uiNameSpace getVariable "serverMenuItemShow")};
					_display = uiNameSpace getVariable "serverMenuItemShow";
					_setText = _display displayCtrl 7777;
					_setText ctrlSetStructuredText (parseText format["%1", _serverMenuCurrentText]);
				};
			};
			
			case "Support":
			{
				[] spawn 
				{
					call SC_handleServerMenuContent;
					private ["_title", "_email", "_ts"];
					_title = "NEED HELP?";
					_email = "Have a question or need long-term support? e-mail us: YOUR EMAIL";
					_ts = "Need quick help? Message an admin on our TeamSpeak 3 server: YOUR TS SERVER";
					_serverMenuCurrentText = format["<t size='3.5'>%1</t><br />%2<br />%3", _title, _email, _ts]; // <br /> is a linebreak
					waitUntil {!isNull (uiNameSpace getVariable "serverMenuItemShow")};
					_display = uiNameSpace getVariable "serverMenuItemShow";
					_setText = _display displayCtrl 7777;
					_setText ctrlSetStructuredText (parseText format["%1", _serverMenuCurrentText]);
				};
			};
			
			case "Donate":
			{
				[] spawn 
				{
					call SC_handleServerMenuContent;
					private ["_title", "_pleaseDonate", "_url"];
					_title = "DONATE";
					_pleaseDonate = "Please help us making the server bills less heavy by donating to us:";
					_url = "your URL here";
					_serverMenuCurrentText = format["<t size='3.5'>%1</t><br />%2<br />%3", _title, _pleaseDonate, _url]; // <br /> is a linebreak
					waitUntil {!isNull (uiNameSpace getVariable "serverMenuItemShow")};
					_display = uiNameSpace getVariable "serverMenuItemShow";
					_setText = _display displayCtrl 7777;
					_setText ctrlSetStructuredText (parseText format["%1", _serverMenuCurrentText]);
				};
			};
		};
	};
SC_fnc = true;
};