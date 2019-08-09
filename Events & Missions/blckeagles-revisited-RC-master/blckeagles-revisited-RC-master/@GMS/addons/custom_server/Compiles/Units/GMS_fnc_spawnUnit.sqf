/*
	blck_fnc_spawnUnit
	Original Code by blckeagls
	Modified by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private ["_i","_weap","_skin","_unit","_skillLevel","_aiSkills","_launcherRound","_index","_ammoChoices","_optics","_pointers","_muzzles","_underbarrel","_legalOptics"];
params["_pos","_aiGroup",["_skillLevel","red"],["_uniforms", []],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_Launcher","none"],["_weaponList",[]],["_sideArms",[]],["_scuba",false],["_garrison",false]];

if (_weaponList isEqualTo []) then {_weaponList = [_skillLevel] call blck_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_skillLevel] call blck_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_skillLevel] call blck_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_skillLevel] call blck_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_skillLevel] call blck_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_skillLevel] call blck_fnc_selectAIBackpacks};

#ifdef blck_debugMode
if (blck_debugLevel >= 2) then
{
	private _params = ["_pos","_aiGroup","_skillLevel","_uniforms","_headGear","_vests","_backpacks","_Launcher","_weaponList","_sideArms","_scuba","_garrison"];  //"_weaponList",  "_Launcher"
	{
		diag_log format["_fnc_spawnUnit::-> _this select %1 (%2) = %3",_forEachIndex, _params select _forEachIndex, _this select _forEachIndex];
	}forEach _this;
};
#endif
if (isNull _aiGroup) exitWith {diag_log "[blckeagls] ERROR CONDITION:-->> NULL-GROUP Provided to _fnc_spawnUnit"};

_unit = ObjNull;
//private _unitType = "";
if (blck_modType isEqualTo "Epoch") then
{
	"I_Soldier_EPOCH" createUnit [_pos, _aiGroup, "_unit = this", blck_baseSkill, "COLONEL"];
	_unit setVariable ["LAST_CHECK",28800,true];
	switch(_skillLevel) do
	{
		case "blue":{_unit setVariable["Crypto",2 + floor(random(blck_maxMoneyBlue)),true];};
		case "red":{_unit setVariable["Crypto",4 + floor(random(blck_maxMoneyRed)),true];};
		case "green":{_unit setVariable["Crypto",6 + floor(random(blck_maxMoneyGreen)),true];};
		case "orange":{_unit setVariable["Crypto",8 + floor(random(blck_maxMoneyOrange)),true];};
	};
};
if (blck_modType isEqualTo "Exile") then
{
	"i_g_soldier_unarmed_f" createUnit [_pos, _aiGroup, "_unit = this", blck_baseSkill, "COLONEL"];
	switch(_skillLevel) do
	{
		case "blue":{_unit setVariable["ExileMoney",2 + floor(random(blck_maxMoneyBlue)),true];};
		case "red":{_unit setVariable["ExileMoney",4 + floor(random(blck_maxMoneyRed)),true];};
		case "green":{_unit setVariable["ExileMoney",6 + floor(random(blck_maxMoneyGreen)),true];};
		case "orange":{_unit setVariable["ExileMoney",8 + floor(random(blck_maxMoneyOrange)),true];};
	};
};
//  findEmptyPosition [minDistance, maxDistance, vehicleType] 
private _tempPos = _pos findEmptyPosition [0.1, 3, typeOf _unit];
//diag_log format["_fnc_spawnUnit: _pos = %1 | _tempPos = %2",_pos,_tempPos];
if !(_tempPos isEqualTo []) then {_unit setPos _tempPos};
#ifdef blck_debugMode
if (blck_debugLevel >= 2) then
{
	diag_log format["_fnc_spawnUnit::-->> unit spawned = %1",_unit];
};
#endif
[_unit] call blck_fnc_removeGear;
if (_scuba) then
{
	_unit swiminDepth (_pos select 2);
	#ifdef blck_debugMode
	if (blck_debugLevel >= 2) then
	{
		diag_log format["_fnc_spawnUnit:: -- >> unit depth = %1 and underwater for unit = %2",_pos select 2, underwater _unit];
	};
	#endif
};

_skin = "";
_counter = 1;
//diag_log format["_fnc_spawnUnit: _uniforms = %1",_uniforms];
while {_skin isEqualTo "" && _counter < 10} do
{
	_unit forceAddUniform (selectRandom _uniforms);
	_skin = uniform _unit;
	#ifdef blck_debugMode
	if (blck_debugLevel > 2) then
	{
		diag_log format["_fnc_spawnUnit::-->> for unit _unit % uniform is %2",_unit, uniform _unit];
	};
	#endif	
	_counter =+1;
};
//Sets AI Tactics
_unit enableAI "ALL";
if(_garrison) then
{
	_unit disableAI "PATH";
};
_unit allowDammage true;
_unit setBehaviour "COMBAT";
_unit setunitpos "AUTO";

if !(_headGear isEqualTo []) then 
{
	_unit addHeadgear (selectRandom _headGear);
	//diag_log format["Headgear for unit %1 = %2",_unit, headgear _unit];
};
if !(_vests  isEqualTo []) then 
{
	_unit addVest (selectRandom _vests);
	//diag_log format["Vest for unit %1 = %2",_unit, vest _unit];
};

if (_weaponList isEqualTo []) then {_weaponList = call blck_fnc_selectAILoadout};
_weap = selectRandom _weaponList;  
_unit addWeaponGlobal  _weap; 
_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
_optics = getArray (configfile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
_pointers = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_muzzles = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_underbarrel = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
_legalOptics = _optics - blck_blacklistedOptics;

_unit addMagazines [selectRandom _ammoChoices, 3];

if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _muzzles)};
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _legalOptics)};
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _pointers)};
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _muzzles)};
if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _underbarrel)};
if ((count(getArray (configFile >> "cfgWeapons" >> _weap >> "muzzles"))) > 1) then 
{
	_unit addMagazine "1Rnd_HE_Grenade_shell";
};

if !(_sideArms  isEqualTo []) then
{
	_weap = selectRandom _sideArms;
	//diag_log format["[spawnUnit.sqf] _weap os %1",_weap];
	_unit addWeaponGlobal  _weap; 
	_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
	_unit addMagazines [selectRandom _ammoChoices, 2];
};
for "_i" from 1 to (1+floor(random(4))) do 
{
	_unit addItem (selectRandom blck_ConsumableItems);
};

// Add  First Aid or Grenade 50% of the time
if (round(random 10) <= 5) then 
{
	//diag_log format["spawnUnit.sqf] -- Item is %1", _item];
	_unit addItem selectRandom blck_specialItems;
};
//diag_log format["_spawnUnit: _Launcher = %1",_Launcher];
if ( !(_Launcher isEqualTo "none") && !(_backpacks  isEqualTo [])) then
{
	_unit addWeaponGlobal _Launcher;
	_unit addBackpack (selectRandom _backpacks);
	for "_i" from 1 to 3 do 
	{
		_unit addItemToBackpack (getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines") select 0); // call BIS_fnc_selectRandom;
	};
	_unit setVariable["Launcher",_launcher,true];
} else {
	if ( random (1) < blck_chanceBackpack && !(_backpacks  isEqualTo [])) then
	{ 
		_unit addBackpack selectRandom _backpacks;
	};
};

if(sunOrMoon < 0.2 && blck_useNVG)then
{
	_unit addWeapon selectRandom blck_NVG;
	_unit setVariable ["hasNVG", true,true];
}
else
{
	_unit setVariable ["hasNVG", false,true];
};

_unit addWeapon selectRandomWeighted["",4,"Binocular",3,"Rangefinder",1];

#ifdef blck_debugMode
if (blck_debugLevel > 2) then
{
	diag_log format["_fnc_spawnUnit:: --> unit loadout = %1", getUnitLoadout _unit];
};
#endif

_unit addEventHandler ["Reloaded", {_this call blck_EH_unitWeaponReloaded;}];
_unit addMPEventHandler ["MPKilled", {[(_this select 0), (_this select 1)] call blck_EH_AIKilled;}];
_unit addMPEventHandler ["MPHit",{[_this] call blck_EH_AIHit;}];

switch (_skillLevel) do 
{
	case "blue": {_index = 0;_aiSkills = blck_SkillsBlue;};
	case "red": {_index = 1;_aiSkills = blck_SkillsRed;};
	case "green": {_index = 2;_aiSkills = blck_SkillsGreen;};
	case "orange": {_index = 3;_aiSkills = blck_SkillsOrange;};
	default {_index = 0;_aiSkills = blck_SkillsBlue;};
};

[_unit,_aiSkills] call blck_fnc_setSkill;
_unit setVariable ["alertDist",blck_AIAlertDistance select _index,true];
_unit setVariable ["intelligence",blck_AIIntelligence select _index,true];
_unit setVariable ["GMS_AI",true,true];

_unit


