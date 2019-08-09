private ["_playerScore", "_multiplyer", "_respectLevel", "_respectLevels", "_requiredRespect"];

_playerScore = _this select 0;
_respectLevels = count(missionConfigFile >> "CfgTrading" >> "requiredRespect");
_respectLevel = for "_i" from 1 to _respectLevels do {
	_requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format ["Level%1", _i]);
	if (_requiredRespect > _playerScore) exitWith { _i - 1 };
};

_multiplyer = getNumber(missionConfigFile >> "CfgLocker" >> "multiplyer") * (_respectLevel - 1);
if (_multiplyer <= 0) then { _multiplyer = 1; };

round((getNumber(missionConfigFile >> "CfgLocker" >> "maxDeposit")) * _multiplyer);