/**
 * ExileServer_object_crash_bots
 * © 2018 ejik designer
 *
 */
 
private["_weaponBoats","_type","_positionMove","_uniformBots","_itemBots","_countItemBots","_rifleOpticsBots","_vestBots","_weaponSecondaryBots","_weaponBots","_backpacksBots","_vehicle","_randomCountBoats","_classBots","_rankBoats","_abilityBots"];
_vehicle = _this select 0;
_positionMove = _this select 1;
_randomCountBoats = _this select 2;
_type = _this select 3;
_classBots = getText (configFile >> "cfgCrash" >> "options" >> "classBoats");
_rankBoats = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "rankBoats");
_abilityBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "abilityBots");
_uniformBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "uniformBots");
_vestBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "vestBots");
_backpacksBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "backpacksBots");
_weaponBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "weaponBotsPrimary");
_weaponSecondaryBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "weaponBotsSecondary");
_rifleOpticsBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "rifleOpticsBots");
_countItemBots = getNumber (configFile >> "cfgCrash" >> "options" >> "countItemBots");
_itemBots = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "itemBots");
_spawnFly = getNumber (configFile >> "cfgCrash" >> "options" >> "spawnFly");
_group_crash = createGroup EAST;
for "_i" from 1 to _randomCountBoats do{
    _pospos = getPos _vehicle;
    _boxPos = (_pospos select 0) + 15; 
    _boxPos2 = (_pospos select 1) + 15;
	_unit_60 = objNull;
	if (true) then
	{
		_unit = _group_crash createUnit [_classBots, [_boxPos, _boxPos2, _pospos select 2], [], 0, "CAN_COLLIDE"];
		_unit_60 = _unit;
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;	
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit setPos [_boxPos, _boxPos2, _pospos select 2];
		if((count _rankBoats) > 0)then{
			_rankBot = _rankBoats select (random (count _rankBoats -1));
			_unit setUnitRank _rankBot;
		};
		if((count _abilityBots) > 0)then{
			_abilityBot = _abilityBots select (random (count _abilityBots -1));
			_unit setUnitAbility _abilityBot;
		};
		if((count _uniformBots) > 0)then{
			_uniformBot = _uniformBots select (random (count _uniformBots -1));	
			_unit forceAddUniform  _uniformBot;
		};
		if((count _vestBots) > 0)then{
			_vestBot = _vestBots select (random (count _vestBots -1));	
			_unit addVest _vestBot;
		};
		if((count _backpacksBots) > 0)then{
			_backBoats = _backpacksBots select (random (count _backpacksBots -1));
			_unit addBackpack _backBoats;
		};
		if((count _weaponBots) > 0)then{
		    _wpnBoats = _weaponBots select (random (count _weaponBots -1));
			_wpnBoats = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "weaponBots" >> _wpnBoats);
            if(count (_wpnBoats select 0) > 0)then{
                if(count (_wpnBoats select 1) > 0)then{			
			        _unit addMagazines [(_wpnBoats select 1),(_wpnBoats select 2)];
				};
			    _unit addWeapon (_wpnBoats select 0);
			};
		};
		if((count _weaponSecondaryBots) > 0)then{
			_wpnBoats = _weaponSecondaryBots select (random (count _weaponSecondaryBots -1));
			_wpnBoats = getArray (configFile >> "cfgCrash" >> "crashLoot" >> "weaponSecondaryBots" >> _wpnBoats);
			if(count (_wpnBoats select 0) > 0)then{
				if(count (_wpnBoats select 1) > 0)then{
					_unit addMagazines [(_wpnBoats select 1),(_wpnBoats select 2)];
				};
				_unit addWeapon (_wpnBoats select 0);
			};
		};
		if((count _rifleOpticsBots) > 0)then{
			_opticBot = _rifleOpticsBots select (random (count _rifleOpticsBots -1));
			_unit addPrimaryWeaponItem _opticBot;
		};
		_countItemBot = floor(random _countItemBots) + 1;
		if(_countItemBot > 0)then{
			for "_i" from 1 to _countItemBot do{
				_itemBot = _itemBots select (random (count _itemBots -1));
				_unit addItem _itemBot;
			};
		};
		if(_type == 1)then{
			if(_spawnFly == 1)then{
				removeBackpack _unit;
				_unit addBackpack "B_Parachute";
			};
		};
		_unit addEventHandler ["killed", "[_this select 0, _this select 1] call ExileServer_object_crash_killedBots"];
		_unit addEventHandler ["Dammaged", "[_this select 0] call ExileServer_object_crash_damageTerritory"];
		_unit setVariable ["objectCrash",_vehicle];
		[_unit] join _group_crash;
		_unit moveInAny _vehicle;
	};
	sleep 0.1;
};
_group_crash
