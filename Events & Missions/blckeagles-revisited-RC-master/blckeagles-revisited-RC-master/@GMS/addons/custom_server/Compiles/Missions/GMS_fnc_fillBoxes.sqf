
/*
	By Ghostrider-GRG-
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

	private["_a1","_item","_diff","_tries"];
	params["_crate","_boxLoot","_itemCnts"];
	//diag_log format["_fnc_fillBoxes: _this = %1",_this];
	#ifdef blck_debugMode
	{
		diag_log format["_fnc_fillBoxes: _this select %1 = %2",_foreachindex, _this select _foreachindex];
	}foreach _this;
	#endif
	_itemCnts params["_wepCnt","_magCnt","_opticsCnt","_materialsCnt","_itemCnt","_bkcPckCnt"];
	_boxLoot params["_weapons","_magazines","_optics","_materials","_items","_backpacks"];

	//diag_log format["_fnc_fillBoxes: _weapons = %1",_weapons];
	if !(_weapons isEqualTo []) then
	{
		_tries = [_wepCnt] call blck_fnc_getNumberFromRange;
		//diag_log format["_fnc_fillBoxes (31): loading %1 weapons",_tries];
		// Add some randomly selected weapons and corresponding magazines
		for "_i" from 0 to (_tries - 1) do 
		{
			_item = selectRandom _weapons;
			//diag_log format["_fnc_fillBoxes with weapons: _item = %1",_item];
			if (typeName _item isEqualTo "ARRAY") then  //  Check whether weapon name is part of an array that might also specify an ammo to use
			{ 
				_crate addWeaponCargoGlobal [_item select 0,1];  // if yes then assume the first element in the array is the weapon name
				if (count _item >1) then {  // if the array has more than one element assume the second is the ammo to use.
					_crate addMagazineCargoGlobal [_item select 1, 1 + round(random(3))];
				} else { // if the array has only one element then lets load random ammo for it
					_crate addMagazineCargoGlobal [selectRandom (getArray (configFile >> "CfgWeapons" >> (_item select 0) >> "magazines")), 1 + round(random(3))];
				};
			} else {
				if (_item isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
				{
					_crate addWeaponCargoGlobal [_item, 1];
					_crate addMagazineCargoGlobal [selectRandom (getArray (configFile >> "CfgWeapons" >> _item >> "magazines")), 1 + round(random(3))];
				};
			};
		};
	};

	//diag_log format["_fnc_fillBoxes: _magazines = %1",_magazines];
	if !(_magazines isEqualTo []) then
	{
		_tries = [_magCnt] call blck_fnc_getNumberFromRange;
		//diag_log format["_fnc_fillBoxes (26): loading %1 magazines",_tries];	
		// Add Magazines, grenades, and 40mm GL shells
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _magazines;
				//diag_log format["_fnc_fillBoxes with magazines: _item = %1",_item];
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1);  // Take difference between max and min number of items to load and randomize based on this value
					_crate addMagazineCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addMagazineCargoGlobal [_item, 1];
				};
		};
	};

	//diag_log format["_fnc_fillBoxes: _optics = %1",_optics];
	if !(_optics isEqualTo []) then
	{
		_tries = [_opticsCnt] call blck_fnc_getNumberFromRange;
		//diag_log format["_fnc_fillBoxes (72): loading %1 optics",_tries];	
		// Add Optics
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _optics;
				//diag_log format["_fnc_fillBoxes with optics: _item = %1",_item];
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addItemCargoGlobal [_item,1];
				};
		};
	};

	//diag_log format["_fnc_fillBoxes: _materials = %1",_materials];
	if !(_materials isEqualTo []) then
	{
		_tries = [_materialsCnt] call blck_fnc_getNumberFromRange;
		//diag_log format["_fnc_fillBoxes (92): loading %1 materials",_materialsCnt];	
		// Add materials (cindar, mortar, electrical parts etc)
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _materials;
				//diag_log format["_fnc_fillBoxes with materials: _item = %1",_item];
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addItemCargoGlobal [_item, 1];
				};
		};
	};

	//diag_log format["_fnc_fillBoxes: _items = %1",_items];
	if !(_items isEqualTo []) then
	{
		_tries = [_itemCnt] call blck_fnc_getNumberFromRange;
		//diag_log format["_fnc_fillBoxes (112): loading %1 items",_itemCnt];	
		// Add Items (first aid kits, multitool bits, vehicle repair kits, food and drinks)
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _items;
				//diag_log format["_fnc_fillBoxes with items: _item = %1",_item];
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addItemCargoGlobal [_item, 1];
				};
		};	
	};

	//diag_log format["_fnc_fillBoxes: _backpacks = %1",_backpacks];
	if !(_backpacks isEqualTo []) then
	{	
		_tries = [_bkcPckCnt] call blck_fnc_getNumberFromRange;
		//diag_log format["_fnc_fillBoxes (132): loading %1 backpacks",_tries];	
		for "_i" from 0 to (_tries - 1) do 
		{
				_item = selectRandom _backpacks;
				//diag_log format["_fnc_fillBoxes with backpacks: _item = %1",_item];			
				if (typeName _item isEqualTo "ARRAY") then
				{
					_diff = (_item select 2) - (_item select 1); 
					_crate addbackpackcargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
				};
				if (typeName _item isEqualTo "STRING") then
				{
					_crate addbackpackcargoGlobal [_item, 1];
				};
		};
	};
	//diag_log "_fnc_fillBoxes <END>";
	//diag_log format["testCrateLoading:  crate inventory = %1",getItemCargo _crate];
	//diag_log "_fnc_fillBoxes <END>";
