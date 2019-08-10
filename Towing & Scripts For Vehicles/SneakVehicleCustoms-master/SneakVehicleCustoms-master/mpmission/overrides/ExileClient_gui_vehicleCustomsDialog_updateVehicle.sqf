/**
 * ExileClient_gui_vehicleCustomsDialog_updateVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_lbText", "_originalVehicleObject","_dialog","_skinListBox","_parentClassName","_vehicleCustomsConfig","_availableSkins","_skinClass","_skinPrice","_indexEntryIndex","_purchaseButton"];
disableSerialization;
_originalVehicleObject = _this;
ExileClientVehicleCustomsOriginalVehicle = _originalVehicleObject;
ExileClientVehicleCustomsOriginalSkin = typeOf _originalVehicleObject;
_dialog = uiNameSpace getVariable ["RscExileVehicleCustomsDialog", displayNull];
_skinListBox = _dialog displayCtrl 4001;
ExileClientVehicleCustomsOriginalSkin call ExileClient_gui_modelBox_update;
lbClear _skinListBox;
_parentClassName = configName (inheritsFrom (configFile >> "CfgVehicles" >> ExileClientVehicleCustomsOriginalSkin));

//add custom classes
if (isClass (missionConfigFile >> "CfgVehicleCustoms" >> _parentClassName)  || isClass (missionConfigFile >> "CfgSneakCustoms" >> _parentClassName) ) then
{
	_vehicleCustomsConfig = (missionConfigFile >> "CfgVehicleCustoms" >> _parentClassName);
	_availableSkins = ((getArray(_vehicleCustomsConfig >> "skins")) + (getArray(missionConfigFile >> "CfgSneakCustoms" >> _parentClassName >> "skins")));
	{
		_skinClass = _x select 0;
		_skinPrice = _x select 1;
		if(configName(inheritsFrom(missionConfigFile >> "CfgSneakCustoms" >> _skinClass)) isEqualTo "SneakCustoms") then {
			_lbText = getText(missionConfigFile >> "CfgSneakCustoms" >> _skinClass >> "skinName");
		} else {
			_lbText = getText(configFile >> "CfgVehicles" >> _skinClass >> "skinName");
		};
		_indexEntryIndex = _skinListBox lbAdd _lbText;
		_skinListBox lbSetData [_indexEntryIndex, _skinClass];
	    _skinListBox lbSetTextRight [_indexEntryIndex, format["%1", _skinPrice]];
	    _skinListBox lbSetPictureRight [_indexEntryIndex, "exile_assets\texture\ui\poptab_trader_ca.paa"];
	    if (_skinPrice > ExileClientPlayerMoney) then
		{
			_skinListBox lbSetColorRight [_indexEntryIndex, [0.91, 0, 0, 0.6]];
		};
	}
	forEach _availableSkins;
	_purchaseButton = _dialog displayCtrl 4002;
	_purchaseButton ctrlEnable !(ExileClientVehicleCustomsOriginalSkin isEqualTo ((_availableSkins select 0) select 0));	
};
