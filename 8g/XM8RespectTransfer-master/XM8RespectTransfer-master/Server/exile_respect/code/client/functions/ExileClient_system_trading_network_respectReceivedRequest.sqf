/*
 * ORIGINAL: ExileClient_system_trading_network_moneyReceivedRequest
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
 
private["_newPlayerRespect","_senderName","_transferAmount"];
_newPlayerRespect = parseNumber (_this select 0);
_senderName = _this select 1;
_transferAmount = _newPlayerRespect - ExileClientPlayerScore;
ExileClientPlayerScore = _newPlayerRespect;
["RespectReceived", [_transferAmount, _senderName]] call ExileClient_respect_event_notification_addNotification;
true