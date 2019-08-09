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
 
	private["_display","_playersListBox","_playerNetID","_amountInputBox","_amount","_otherPlayer"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_playersListBox = _display displayCtrl 7000;
_playerNetID = _playersListBox lbData (lbCurSel _playersListBox);
_amountInputBox = _display displayCtrl 7010;
_amount = abs (parseNumber (ctrlText _amountInputBox));
if (_playerNetID isEqualTo (netId player)) then
{
	["You cannot send respect to yourself!", "Okay"] call ExileClient_respect_showMessageDenied;
}
else 
{
	if (_amount > ExileClientPlayerScore) then
	{
		["You do not have enough respect to transfer!", "Okay"] call ExileClient_respect_showMessageDenied;	
	}
	else 
	{
		_otherPlayer = objectFromNetId _playerNetID;
		[format ["Transfer %1 Respect to %2?", _amount, name _otherPlayer], "Send", "Don't send"] call ExileClient_gui_xm8_showConfirm;
		waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
		if (ExileClientXM8ConfirmResult) then
		{
			[format ["You have transfered %1 respect to %2!", _amount, name _otherPlayer], "Okay"] call ExileClient_gui_xm8_showMessage;
			["transferRespectRequest", [str _amount, _playerNetID]] call ExileClient_system_network_send;
		};
	};
};