/**
 * ExileServer_object_construction_network_buildConstructionRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_objectClassName","_objectPosition","_playerObject","_constructionConfig","_canBuildHereResult","_object"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectClassName = _parameters select 0;
_objectPosition = _parameters select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player object is null!";
	};
	_constructionConfig = ("getText(_x >> 'previewObject') == _objectClassName" configClasses(configFile >> "CfgConstruction")) select 0;
	_canBuildHereResult = [configName _constructionConfig, (ASLtoAGL (ATLtoASL _objectPosition)), getPlayerUID _playerObject] call ExileClient_util_world_canBuildHere;
	switch (_canBuildHereResult) do
	{
		case 1:
		{
			throw "You are not in your territory!";
		};
		case 2:
		{
			throw "You are inside enemy territory!";
		};
		case 3:
		{
			throw "This cannot be placed on roads!";
		};
		case 5:
		{
			throw "You are too close to a spawn zone!";
		};
		case 4:
		{
			throw "You are too close to traders!";
		};
		case 6:
		{
			throw "Maximum number of objects reached!";
		};
	};
	_object = createVehicle[_objectClassName, _objectPosition, [], 0, "CAN_COLLIDE"];
	_object setPosATL _objectPosition;
	_object setVariable ["BIS_enableRandomization", false];
	_object enableSimulationGlobal false;
	_object setVariable ["ExileOwnerUID", getPlayerUID _playerObject];
	[_object, _playerObject] call ExileServer_system_swapOwnershipQueue_add;
	[_sessionID, "constructionResponse", [netid _object]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID,"notificationRequest", ["Whoops", [_exception]]] call ExileServer_system_network_send_to;
};
true