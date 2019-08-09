/*
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

private["_display","_inputBox","_character","_currentAmountEntered","_canSendAmount","_sendRespectButton"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_inputBox = _this select 0;
_character = _this select 1;
if !(_character in [48,49,50,51,52,53,54,55,56,57]) exitWith {false};
_currentAmountEntered = parseNumber (ctrlText _inputBox);
_canSendAmount = false;
if (_currentAmountEntered > 0) then
{
	if (_currentAmountEntered <= ExileClientPlayerScore) then
	{
		_canSendAmount = true;
	};
};
_sendRespectButton = _display displayCtrl 7011;
_sendRespectButton ctrlEnable _canSendAmount;
true
