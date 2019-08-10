/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

 /********************************************************************
 * aurentis server addons
 * file bootstrap\fn_preInit.sqf
 * author Sneak
 * ver 0.1
 ********************************************************************/
private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
	
    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['SneakCustoms_change_skin', 'sneak_server\code\SneakCustoms_change_skin.sqf'],
	['SneakCustoms_update_vehicle', 'sneak_server\code\SneakCustoms_update_vehicle.sqf'],
	['SneakCustoms_spend_money', 'sneak_server\code\SneakCustoms_spend_money.sqf']
];

diag_log "[SNEAK_CUSTOMS] Loading sneak_server addon.";

true