	/**	
	Reserved Slots Script by TheMeq
	Modified by [GADD]Monkeynutz to work with Exile and actually show why players are being kicked as hints were being covered by the display!
	I also added some other stuff to make it show how many player slots there are and how many are reserved for Admins automatically. (Love a bit of math)
	**/

private ["_reserved_uids", "_uid","_playercount","_servernoreserve","_server_reservedslots","_server_maxplayers","_actual_slots","_testplayer","_layer"];
uiSleep 30;

// Max Players of your server. MUST MATCH YOUR MAX SLOTS AND NOT HOW MANY SLOTS YOU WANT AVAILIBLE TO PLAYERS!
_server_maxplayers = 50;

// Reserved Slots. HOW MANY SLOTS YOU WANT TO BE RESERVED IN TOTAL! THIS IS NEGATED FROM MAX_PLAYERS SO IT MAKES IT 45 PLAYER SLOTS AND 5 ADMIN SLOTS!
_server_reservedslots = 5;

// Reserved Player UID's
_reserved_uids = [
		"00000000000000000",		// First UID
		"00000000000000000"			// Second UID
		];

		waitUntil {!isNull player};
		waitUntil {(vehicle player) == player};
		waitUntil {(getPlayerUID player) != ""};
		
		_playercount = count allPlayers;
		_uid = getPlayerUID player;
		_layer = 85125;
		_actual_slots = _server_maxplayers - _server_reservedslots;
		_servernoreserve = _server_maxplayers - _server_reservedslots;
		{
			_testplayer = getPlayerUID _x;
			if(_testplayer in _reserved_uids) then
				{
					_servernoreserve = _servernoreserve + 1;
					if (_servernoreserve > _server_maxplayers) then
						{
							_servernoreserve = _server_maxplayers;
						};
				};
		} forEach allPlayers;
		
		if ((_playercount > _servernoreserve)&& !(_uid in _reserved_uids)) then 
			{
				uiSleep 5;
				disableUserInput true;
				player allowDamage false;
				_layer cutText [format["You are in an admin slot!\nYou are being kicked in 10 seconds!\n
				Our player slot cap is %1!\n
				The last %2 slots are admin slots.\n
				So we can always join the game and help you!",_actual_slots,_server_reservedslots],"BLACK",-1];		// Blackout screen with Text
				playSound "FD_CP_Not_Clear_F";
				uiSleep 10;
				disableUserInput false;
				["ADMINSLOT",false,2] call BIS_fnc_endMission;
			};  