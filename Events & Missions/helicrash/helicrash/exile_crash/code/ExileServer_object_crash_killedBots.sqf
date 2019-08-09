/**
 * ExileServer_object_crash_killedBots
 * © 2018 ejik designer
 *
 */
private["_pl","_respect","_radiusMetrsCrash","_getMovePos"]; 

_pl = vehicle (_this select 1);
_minrespect = getNumber (configFile >> "cfgCrash" >> "options" >> "minrespectKilledBoat");
_maxrespect = getNumber (configFile >> "cfgCrash" >> "options" >> "maxrespectKilledBoat");
if(_minrespect == _maxrespect)then{
   _respect = _minrespect;
}else{
   _respect = round(random [_minrespect,_maxrespect,_minrespect]);
};
if(isPlayer _pl)then{
    if(_maxrespect > 0)then{
		_playerUid = getPlayerUID _pl;
		_response = format ["getAccountScore:%1", _playerUid] call ExileServer_system_database_query_selectSingle;
		_newScore = _response select 0;
		_newScore = _newScore + _respect;
		_pl setVariable ["ExileScore", _newScore];
		ExileClientPlayerScore = _newScore;
		(owner _pl) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
		format["setAccountScore:%1:%2", _newScore, getPlayerUID _pl] call ExileServer_system_database_query_fireAndForget;
		_newKillerFrags = _pl getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_killerStatsNeedUpdate = true;
		_pl setVariable ["ExileKills", _newKillerFrags];
		format["addAccountKill:%1", getPlayerUID _pl] call ExileServer_system_database_query_fireAndForget;
		[_pl, "freeResponse", [str _respect]] call ExileServer_system_network_send_to;
	};
};
true