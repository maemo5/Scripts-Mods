// Filename: ETG_LoginRewardScript.sqf
// Author: Kellojo
// Release : 26.11.2015
// Script: ETG Login Reward Script v1.1

//Loginreward tier setup
//Numbers represent logins
//Feel free to edit them to your likings
//Tier                  //Rewards
_tier1 = 5;				//Adds 1x food + 1x drink
_tier2 = 10;			//Adds 1x random food + 1x random drink
_tier3 = 15;			//Adds 1x magazine
_tier4 = 20;			//Adds 1x magazine + 1x drink
_tier5 = 25;			//Adds 1x magazine + 1x random drink + 1x random food
_tier6 = 30;			//Adds 1x magazine + 1x ductape/instadoc
_tier7 = 35;			//Adds 1/2x magazine + 1x ductape/instadoc
_tier8 = 40;			//Adds 1/2x magazine + 1/2x ductape/instadoc
_tier9 = 45;			//Adds 1/2x magazine + 1x ductape + 1x instadoc + 1x random food + 1x random drink
_tier10 = 50;			//Adds 1/2x magazine + 1x ductape + 1x instadoc + 1x random food + 1x random drink + 1x beer

//this is what random foods/drinks could be
//Add/remove classnames (only magazines!!!), if you want to
_randomDrinks = ["Exile_Item_PlasticBottleFreshWater","Exile_Item_PlasticBottleSaltWater","Exile_Item_Energydrink","Exile_Item_Beer"];
_randomFoods = ["Exile_Item_BBQSandwich","Exile_Item_BBQSandwich_Cooked","Exile_Item_Catfood","Exile_Item_Catfood_Cooked","Exile_Item_ChristmasTinner","Exile_Item_ChristmasTinner_Cooked","Exile_Item_GloriousKnakworst","Exile_Item_GloriousKnakworst_Cooked","Exile_Item_SausageGravy","Exile_Item_SausageGravy_Cooked","Exile_Item_Surstromming","Exile_Item_Surstromming_Cooked"];


//Do not edit below me - only if you know what you are doing ;)
//Check if client has logged in before
_LoginCount = profileNamespace getVariable "var_ETG_Logins";
if (isNil "_LoginCount") then {
	profileNamespace setVariable ["var_ETG_Logins",0];
	saveProfileNamespace;
	_LoginCount = profileNamespace getVariable "var_ETG_Logins";
};

//Reward player for loging in...
_Logins = profileNamespace getVariable "var_ETG_Logins";
systemChat format ["Welcome back %1!",(name player)];
systemChat format ["Thank you for logging in for the %1th time!",_Logins];
systemChat "You will get your reward in five minutes.";
sleep 300;
_NewLoginCount = _LoginCount + 1;
profileNamespace setVariable ["var_ETG_Logins",_NewLoginCount];
saveProfileNamespace;
systemChat "Here is your login reward!";
systemChat "Have fun.";

//Functions
//Adds a random drink and food to the players inventory
_FNC_AddFoodDrink = {
	_drink = _randomDrinks call BIS_fnc_selectRandom;
	_food = _randomFoods call BIS_fnc_selectRandom;
	player addMagazine [_food,1];
	player addMagazine [_drink,1];
};

//Adds one magazine for the current primary weapon
_FNC_1Mag = {
	_CurrentWeapon = primaryWeapon player;
	if !(isNil "_CurrentWeapon") then {
		_CurrentWeapon = primaryWeapon player;
		_magazines = getArray (configFile / "CfgWeapons" / _CurrentWeapon / "magazines");
		player addMagazine (_magazines select 0);
	};
};

//Adds one or two magazines for the current primary weapon (50%)
_FNC_2RandomMags = {
	_CurrentWeapon = primaryWeapon player;
	if !(isNil "_CurrentWeapon") then {
		_ammount = [1,2] call BIS_fnc_selectRandom;
		_CurrentWeapon = primaryWeapon player;
		_magazines = getArray (configFile / "CfgWeapons" / _CurrentWeapon / "magazines");
		player addMagazine (_magazines select 0);
		if (_ammount == 2) then {
			player addMagazine (_magazines select 0);
		};
	};
};

//Adds 1/2 ductape/instadoc
_FNC_randomDuctInsta = {
	_item = _this select 0;
	_ammount = [1,2] call BIS_fnc_selectRandom;
	player addMagazine _item;
	if (_ammount == 2) then {
		player addMagazine _item;
	};
};

//Giving the player a reward
//Tier 1
if (_Logins <= _tier1) then {
	player addMagazine ["Exile_Item_GloriousKnakworst_Cooked",1];
	player addMagazine ["Exile_Item_PlasticBottleFreshWater",1];
};

//Tier 2
if ((_tier1 <= _Logins) && (_Logins < _tier2)) then {
	[] call _FNC_AddFoodDrink;
};

//Tier 3
if ((_tier2 <= _Logins) && (_Logins < _tier3)) then {
	[] call _FNC_1Mag;
};

//Tier 4
if ((_tier3 <= _Logins) && (_Logins < _tier4)) then {	
	[] call _FNC_1Mag;
	_CurrentWeapon = primaryWeapon player;
	player addMagazine ["Exile_Item_PlasticBottleFreshWater",1];
};

//Tier 5
if ((_tier4 <= _Logins) && (_Logins < _tier5)) then {
	[] call _FNC_1Mag;
	_drink = _randomDrinks call BIS_fnc_selectRandom;
	_food = _randomFoods call BIS_fnc_selectRandom;
	player addMagazine [_drink,1];
	player addMagazine [_food,1];
};

//Tier 6
if ((_tier5 <= _Logins) && (_Logins < _tier6)) then {
	[] call _FNC_1Mag;
	_item = ["Exile_Item_InstaDoc","Exile_Item_DuctTape"] call BIS_fnc_selectRandom;
	player addMagazine [_item,1];
};

//Tier 7
if ((_tier6 <= _Logins) && (_Logins < _tier7)) then { 	
	[] call _FNC_2RandomMags;
	_item = ["Exile_Item_InstaDoc","Exile_Item_DuctTape"] call BIS_fnc_selectRandom;
	player addMagazine [_item,1];
};

//Tier 8
if ((_tier7 <= _Logins) && (_Logins < _tier8)) then { 
	[] call _FNC_2RandomMags;
	player addMagazine ["Exile_Item_InstaDoc",1];
	player addMagazine ["Exile_Item_DuctTape",1];
};

//Tier 9
if ((_tier8 <= _Logins) && (_Logins < _tier9)) then {	
	[] call _FNC_2RandomMags;
	player addMagazine ["Exile_Item_InstaDoc",1];
	player addMagazine ["Exile_Item_DuctTape",1];
	[] call _FNC_AddFoodDrink;
};

//Tier 10
if (_tier9 <= _Logins) then {
	[] call _FNC_2RandomMags; 
	player addMagazine ["Exile_Item_InstaDoc",1]; 
	player addMagazine ["Exile_Item_DuctTape",1]; 
	player addMagazine ["Exile_Item_Beer",1]; 
	[] call _FNC_AddFoodDrink;
};