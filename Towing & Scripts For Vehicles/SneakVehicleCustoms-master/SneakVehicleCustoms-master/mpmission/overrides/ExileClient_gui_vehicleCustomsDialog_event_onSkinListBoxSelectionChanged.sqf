/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_listBox","_index","_skinClass","_dialog","_purchaseButton","_skinTextures"];

_getTextures = {
private ["_skinClassName", "_skinTextures", "_tmp", "_skinTexturesTmp"];
	_skinClassName = _this;
	_skinTextures = [];
	if(!(configName(inheritsFrom(missionConfigFile >> "CfgSneakCustoms" >> _skinClassName)) isEqualTo "SneakCustoms")) then {
		_skinTexturesTmp = getArray(configFile >> "CfgVehicles" >> _skinClassName >> "hiddenSelectionsTextures");
	    //delete first "/" from "/a3/..." to match getObjectTextures
	    {
	    	if([_x, 0, 1] call BIS_fnc_trimString isEqualTo "/") then {
	    		_tmp = [_x, 1] call BIS_fnc_trimString;
	    		_skinTextures pushBack (toLower _tmp);
	    	} else {
	    		_skinTextures pushBack (toLower _x);
	    	}

		} forEach _skinTexturesTmp;
		_skinTextures
	} else {
		_skinTexturesTmp = getArray(missionConfigFile >> "CfgSneakCustoms" >> _skinClassName >> "hiddenSelectionsTextures");
		{
	    	if([_x, 0, 1] call BIS_fnc_trimString isEqualTo "/") then {
	    		_tmp = [_x, 1] call BIS_fnc_trimString;
	    		_skinTextures pushBack (toLower _tmp);
	    	} else {
	    		_skinTextures pushBack (toLower _x);
	    	}

		} forEach _skinTexturesTmp;
		_skinTextures
	};
};


_SneakCustoms_update = {
private["_skinClassName","_modelBoundingDimensions","_modelBoundingRadius", "_originalTextures", "_skinTextures"];
	_skinClassName = _this;

		_skinTextures = _skinClassName call _getTextures;

		_originalTextures = getObjectTextures ExileClientModelBoxVehicle;

		{
			ExileClientModelBoxVehicle setObjectTexture [_forEachIndex, _x];
		} forEach _skinTextures;

		_modelBoundingDimensions = ExileClientModelBoxVehicle call BIS_fnc_boundingBoxDimensions;
		_modelBoundingRadius = ExileClientModelBoxVehicle call BIS_fnc_boundingCircle;


		if ((_vehicleClassName isEqualTo "Exile_Bike_OldBike") || (_vehicleClassName isEqualTo "Exile_Bike_MountainBike")) then
		{
			_modelBoundingDimensions set [2, 1];
		};
		ExileClientModelBoxCameraFocusPosition = 
		[
			ExileClientModelBoxPosition select 0, 
			ExileClientModelBoxPosition select 1, 
			(ExileClientModelBoxPosition select 2) + ((_modelBoundingDimensions select 2) * 0.5)
		];
		ExileClientModelBoxCameraFocusObject setPosATL ExileClientModelBoxCameraFocusPosition;
		ExileClientModelBoxCameraPosition = 
		[
			(ExileClientModelBoxCameraFocusPosition select 0) - _modelBoundingRadius, 
			ExileClientModelBoxCameraFocusPosition select 1, 
			(ExileClientModelBoxPosition select 2) + (_modelBoundingDimensions select 2) 
		];
		ExileClientModelBoxCamera camPrepareTarget ExileClientModelBoxCameraFocusObject;
		ExileClientModelBoxCamera setPosATL ExileClientModelBoxCameraPosition;
		ExileClientModelBoxCamera camCommitPrepared 0;
};


disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_skinClass = _listBox lbData _index;
_skinClass call _SneakCustoms_update; //call SneakCustoms
ExileClientVehicleCustomsSelectedSkin = _skinClass;
_dialog = uiNameSpace getVariable ["RscExileVehicleCustomsDialog", displayNull];
_purchaseButton = _dialog displayCtrl 4002;

_skinTextures = _skinClass call _getTextures;
_originalTextures = getObjectTextures ExileClientVehicleCustomsOriginalVehicle;

SkinClassName = _skinClass;
OriginalTextures = _originalTextures;
SkinPrice = parseNumber (_listBox lbTextRight _index);
//AvailableForGroup = getText (missionConfigFile >> "CfgSneakCustoms" >> _skinClass >> "availableFor");
AvailableForGroup = [(missionConfigFile >> "CfgSneakCustoms" >> _skinClass),"availableFor", "All"] call BIS_fnc_returnConfigEntry;

_purchaseButton ctrlEnable !(_originalTextures isEqualTo _skinTextures);


true