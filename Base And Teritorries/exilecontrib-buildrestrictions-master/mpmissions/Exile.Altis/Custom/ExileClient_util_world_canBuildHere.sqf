/**
 * ExileClient_util_world_canBuildHere
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_constructionConfigName","_position","_playerUID","_result","_requiresTerritory","_canBePlacedOnRoad","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_minimumDistanceToOtherTerritories","_maximumTerritoryRadius","_positionObject","_nearestFlags","_radius","_buildRights","_territoryLevelConfigs","_territoryLevelConfig","_numberOfConstructionsAllowed","_territoryLevel","_territoryRestrictionArray","_nearestRestrictedObject","_restrictedItemName","_restrictedItemLevel","_restrictedItemCount"];
_constructionConfigName = _this select 0;
_position = _this select 1;
_playerUID = _this select 2;
_result = 0;
_requiresTerritory = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "requiresTerritory") isEqualTo 1;
_canBePlacedOnRoad = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "canBePlacedOnRoad") isEqualTo 1;
_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
_minimumDistanceToSpawnZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToSpawnZones");
_minimumDistanceToOtherTerritories = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToOtherTerritories");
_maximumTerritoryRadius = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumRadius");
try 
{
	if ([_position, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
	{
		throw 4;
	};
	if ([_position, _minimumDistanceToSpawnZones] call ExileClient_util_world_isSpawnZoneInRange) then
	{
		throw 5;
	};
	if ((AGLtoASL _position) call ExileClient_util_world_isInRadiatedZone) then
	{
		throw 8;
	};
	if !(_canBePlacedOnRoad) then
	{
		if (isOnRoad [_position select 0, _position select 1, 0]) then
		{
			throw 3;
		};
	};
	{
		_positionObject = (ASLtoAGL (getPosASL _x));
		if (_position isEqualTo _positionObject) then
		{
			throw 7;
		};
	} forEach (_position nearObjects ["Exile_Construction_Abstract_Static", 3]);
	if (_constructionConfigName isEqualTo "Flag") then 
	{
		if ([_position, _minimumDistanceToOtherTerritories] call ExileClient_util_world_isTerritoryInRange) then
		{
			throw 2; 
		};
	}
	else 
	{
		_nearestFlags = (nearestObjects [_position, ["Exile_Construction_Flag_Static"], _maximumTerritoryRadius]);
		if !(_nearestFlags isEqualTo []) then
		{
			{
				_radius = _x getVariable ["ExileTerritorySize", -1];
				if (((AGLtoASL _position) distance (getPosASL _x)) < _radius) then
				{
					_buildRights = _x getVariable ["ExileTerritoryBuildRights", []];
					if (_playerUID in _buildRights) then
					{
						_territoryLevel					= _x getVariable ["ExileTerritoryLevel", 0]; // Added by alexslx
						_territoryLevelConfigs			= getArray (missionConfigFile >> "CfgTerritories" >> "prices");
						_territoryLevelConfig			= _territoryLevelConfigs select (_territoryLevel - 1);
						_numberOfConstructionsAllowed   = _territoryLevelConfig select 2;
						if ((_x getVariable ["ExileTerritoryNumberOfConstructions", 0]) >= _numberOfConstructionsAllowed) then
						{
							throw 6; 
						};
						
						/**
						 * Specific build restrictions - by @alexslx
						 */
						_territoryRestrictionArray  = getArray (missionConfigFile >> "CfgTerritories" >> "buildRestrictions");
						{
							_restrictedItemName  = _x select 0;
							_restrictedItemLevel = _x select 1;
							_restrictedItemCount = _x select 2;
							
							if ( _constructionConfigName isEqualTo _restrictedItemName) then
							{
								if ( _territoryLevel < _restrictedItemLevel ) then
								{
									throw 101;
								}
								else
								{
									_nearestRestrictedObject = (nearestObjects [_position, [_restrictedItemName], _maximumTerritoryRadius]);
									if ( count _nearestRestrictedObject >= _restrictedItemCount ) then
									{
										throw 102;
									}
									throw 0;
								}
							}
						} forEach _territoryRestrictionArray;
						throw 0;
					};
				};
				throw 2;
			}
			forEach _nearestFlags; 
		};
		if (_requiresTerritory) then 
		{
			throw 1;	
		};
	};
}
catch 
{
	_result = _exception;
};
_result