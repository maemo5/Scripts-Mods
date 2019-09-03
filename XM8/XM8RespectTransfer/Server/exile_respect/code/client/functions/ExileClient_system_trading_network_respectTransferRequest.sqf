/*
 * ORIGINAL: ExileClient_system_trading_network_moneySentRequest
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
 
private["_newPlayerRespect","_recipientName","_transferAmount"];
_newPlayerRespect = parseNumber (_this select 0);
_recipientName = _this select 1;
_transferAmount = ExileClientPlayerScore - _newPlayerRespect;
ExileClientPlayerScore = _newPlayerRespect;
true