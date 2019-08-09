/*
 * ORIGINAL: ExileServer_system_trading_network_sendMoneyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * XM8APPS Respect Server Addon
 * By: Andrew_S90 - http://www.exilemod.com/profile/14063-andrew_s90/
*/
 

private ["_sessionID", "_parameters", "_amountToTransferString", "_receiverNetID", "_amountToTransfer", "_senderPlayerObject", "_receiverPlayerObject", "_senderNetID", "_randomNetID", "_randomPlayerObject", "_senderRespectAmount", "_receiverRespectAmount", "_randomRespectAmount", "_respectLost", "_hijackedRespect"];
 _sessionID = _this select 0;
_parameters = _this select 1;
_amountToTransferString = _parameters select 0;
_receiverNetID = _parameters select 1;
try
{
	_amountToTransfer = floor (parseNumber _amountToTransferString);
	if (_amountToTransfer < 1) then
	{
		throw "You cannot transfer weird amounts.";
	};
	_senderPlayerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _senderPlayerObject) then
	{
		throw "Player (sender) object not found.";
	};
	_receiverPlayerObject = objectFromNetId _receiverNetID;
	if (isNull _receiverPlayerObject) then
	{
		throw "Player (receiver) object not found.";
	};
	_senderNetID = (netID _senderPlayerObject);
	OnlinePlayersNetID = OnlinePlayersNetID - [_receiverNetID]; //removing the reciever from onlineplayers
	OnlinePlayersNetID = OnlinePlayersNetID - [_senderNetID]; //removing sender.. because just in case..(even though they wouldnt be in this list)
	diag_log format["[XM8APPS] Respect Transfer OnlinePlayersNetID (OnlinePlayers) %1",OnlinePlayersNetID];
	_randomNetID = OnlinePlayersNetID call BIS_fnc_selectRandom; //getting our random online net ID
	_randomPlayerObject = objectFromNetId _randomNetID;
	if (isNull _randomPlayerObject) then 
	{ //Custom Throw incase a random player isn't selected.. I.E. there must be 2+ players online ;)
		throw "Player (random) object not found.";
	};
	if (_senderPlayerObject isEqualTo _receiverPlayerObject) then
	{
		throw "You want to transfer yourself some respect?!, Disrespectful!";
	};
	if (_senderPlayerObject isEqualTo _randomPlayerObject) then
	{//Custom Throw incase sender is SOMEHOW selected as a random player, even though ID is not in array+removed incase..
		throw " Error: Sender selected as random player to recieve respect.";
	};
	if (_receiverPlayerObject isEqualTo _randomPlayerObject) then
	{//Custom Throw incase reciever is SOMEHOW selected as a random player, even though ID is removed from array
		throw " Error: Reciever selected as random player to recieve respect.";
	};
	_senderRespectAmount = _senderPlayerObject getVariable ["ExileScore", 0];
	_receiverRespectAmount = _receiverPlayerObject getVariable ["ExileScore", 0];
	_randomRespectAmount = _randomPlayerObject getVariable ["ExileScore", 0];
	if (_amountToTransfer > _senderRespectAmount) then
	{
		throw "You do not have enough respect";
	};
	_respectLost = floor random [0,(MaxPercentAllowed/2),MaxPercentAllowed];
	_hijackedRespect = _amountToTransfer*(_respectLost/100);
	_amountToTransfer = _amountToTransfer - _hijackedRespect;
	
	diag_log format["[XM8APPS] Respect Transfer Checks Passed. Player %1 Transfering to %2 Random Hijacker %3 Amount Transfered:%4 hijacked Amount:%5",_senderPlayerObject,_receiverPlayerObject,_randomPlayerObject, _amountToTransfer,_hijackedRespect];

	_senderRespectAmount = _senderRespectAmount - _amountToTransfer; //sender
	_senderPlayerObject setVariable ["ExileScore", _senderRespectAmount]; //sender
	format["setAccountScore:%1:%2", _senderRespectAmount, getPlayerUID _senderPlayerObject] call ExileServer_system_database_query_fireAndForget; //sender
	[_sessionID, "respectTransferRequest", [str _senderRespectAmount, name _receiverPlayerObject]] call ExileServer_system_network_send_to; //sender
	//
	_receiverRespectAmount = _receiverRespectAmount + _amountToTransfer; //Receiver
	_receiverPlayerObject setVariable ["ExileScore", _receiverRespectAmount]; //Receiver
	format["setAccountScore:%1:%2", _receiverRespectAmount, getPlayerUID _receiverPlayerObject] call ExileServer_system_database_query_fireAndForget; //Receiver
	[_receiverPlayerObject, "respectReceivedRequest", [str _receiverRespectAmount, name _senderPlayerObject]] call ExileServer_system_network_send_to; //Receiver
	//
	_randomRespectAmount = _randomRespectAmount + _hijackedRespect; //RandomPlayer
	_randomPlayerObject setVariable ["ExileScore", _randomRespectAmount]; //RandomPlayer
	format["setAccountScore:%1:%2", _randomRespectAmount, getPlayerUID _randomPlayerObject] call ExileServer_system_database_query_fireAndForget; //RandomPlayer
	[_randomPlayerObject, "respectHijackedRequest", [str _randomRespectAmount, name _senderPlayerObject]] call ExileServer_system_network_send_to; //RandomPlayer
}
catch
{
	[_sessionID, "notificationRequest", ["Whoops", [_exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
