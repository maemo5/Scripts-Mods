/********************************************************************
 * sneak_server
 * file: sneak_server\code\SneakCustoms_spend_money.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ["_this", "_playerMoney", "_sessionId"];
_skinPrice = _this select 1;
_sessionId = _this select 2;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
_playerMoney = _player getVariable ["ExileMoney", 0];
_playerMoney = _playerMoney - _skinPrice;
_player setVariable ["ExileMoney", _playerMoney];

diag_log "[SNEAK_CUSTOMS]spend money";

format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
[_sessionId, "toastRequest", ["SuccessTitleAndText", ["Skin applied", format ["%1 Tabs",(_skinPrice * -1)]]]] call ExileServer_system_network_send_to;
//[_sessionId, "moneyTransactionResponse", [str _playerMoney, "Skin"]] call ExileServer_system_network_send_to;
true