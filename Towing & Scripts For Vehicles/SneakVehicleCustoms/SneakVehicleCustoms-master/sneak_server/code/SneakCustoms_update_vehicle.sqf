/********************************************************************
 * sneak_server
 * file: sneak_server\code\SneakCustoms_update_vehicle.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ["_this", "_skinTexture", "_currentVehicle"];
_currentVehicle = _this select 0;
_skinTextures = _this select 1;
{
	_currentVehicle setObjectTextureGlobal [_forEachIndex, _x];
} forEach _skinTextures;