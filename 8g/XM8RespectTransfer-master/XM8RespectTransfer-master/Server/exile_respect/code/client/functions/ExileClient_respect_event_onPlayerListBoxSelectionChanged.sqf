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
 
private["_listBox","_index","_playerNetID","_display","_respectButton"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_playerNetID = _listBox lbData _index;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_respectButton = _display displayCtrl 7011;
_respectButton ctrlEnable !(_playerNetID isEqualTo (netId player));  
