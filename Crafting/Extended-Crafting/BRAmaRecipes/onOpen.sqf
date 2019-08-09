/*
*
* Edited by Novax
*
*/
fnc_recipe_Load = {
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

	lbClear 85502;
	lbClear 85501;
	(_display displayCtrl 85507) ctrlSetText BRAmaRecipesPath + "\BRAma.paa";

	_CategoryCtrl = _this select 0;
	_SelectedCategory 	= _CategoryCtrl lbData (lbCurSel _CategoryCtrl);

	for '_j' from 0 to (count (missionConfigFile >> "CfgCraftingRecipes"))-1 do
	{
		
		_CategoryConfig = (missionConfigFile >> "CfgCraftingRecipes") select _j;	
		_pictureItemClassName = getText(_CategoryConfig >> "pictureItem");
		_RecipeCategory = getText(_CategoryConfig >> "category");
		_RecipeClass = configName _CategoryConfig;	
		_currentRecipeName = getText(_CategoryConfig >> "name");	
		_wSPictureItemConfig = getText (configFile >> "CfgMagazines" >> _pictureItemClassName >> "picture");
		_wSPictureWeapConfig = getText (configFile >> "CfgWeapons" >> _pictureItemClassName >> "picture");		
		_recipePicture = _wSPictureItemConfig + _wSPictureWeapConfig;	
		if (_RecipeCategory == _SelectedCategory) then
		{
			_lbsize = lbSize (_display displayCtrl 85501);
			(_display displayCtrl 85501) lbAdd Format["%1",_currentRecipeName];
			(_display displayCtrl 85501) lbSetPicture [_lbsize,_recipePicture];
			(_display displayCtrl 85501) lbSetData [_lbsize,_RecipeClass];
		}
		else 
		{
			if (_SelectedCategory == "Uncategorised" && _RecipeCategory == "") then
			{
				_lbsize = lbSize (_display displayCtrl 85501);
				(_display displayCtrl 85501) lbAdd Format["%1",_currentRecipeName];
				(_display displayCtrl 85501) lbSetPicture [_lbsize,_recipePicture];
				(_display displayCtrl 85501) lbSetData [_lbsize,_RecipeClass];
			};		
		};
			
	};
	lbSort (_display displayCtrl 85501);
};
 
fnc_components_Load = {
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

	_equippedMagazines = magazines player + weapons player + (items player - weapons player);
	_SelectedRecipeCtrl = _this select 0;
	SelectedRecipe 	= _SelectedRecipeCtrl lbData (lbCurSel _SelectedRecipeCtrl);

	_components 				   = getArray(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "components");
	_Tools 						   = getArray(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "tools");
	_requiredInteractionModelGroup = getText(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiredInteractionModelGroup");
	_requiresOcean 				   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresOcean");
	_requiresFire 				   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresFire");
	_requiresWeld 				   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresWeld");
	_requiresGen 				   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresGen");
	_requiresToolTrolley		   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresToolTrolley");
	_returnedItems 				   = getArray(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "returnedItems");
	_wSpictureItem 				   = getText(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe >> "pictureItem");

	lbClear 85502;

	//Populate Components 
	(_display displayCtrl 85502) lbAdd Format["====== COMPONENTS ======"];

	{
		_Quantity = _x select 0;
		_Component = _x select 1;
		
		_ComponentDispName = getText (configfile >> "CfgMagazines" >> _Component >> "displayName");
		_ComponentPicture  = getText (configfile >> "CfgMagazines" >> _Component >> "picture");
		_ComponentWeapDispName = getText (configfile >> "CfgWeapons" >> _Component >> "displayName");
		_ComponentWeapPicture = getText (configfile >> "CfgWeapons" >> _Component >> "picture");	
		_ComponentItemName = _ComponentDispName + _ComponentWeapDispName;
		_ComponentItemPicture = _ComponentWeapPicture + _ComponentPicture;
		//Exile Code
		_equippedComponentQuantity = { _x == _Component} count _equippedMagazines;
		if (_equippedComponentQuantity < _Quantity ) then
		{
			(_display displayCtrl 85502) lbAdd Format["%3 - [%1/%2]",  _equippedComponentQuantity, _Quantity, _ComponentItemName];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];
		}
		else
		{ 
			(_display displayCtrl 85502) lbAdd Format["%3 - [%1/%2]",  _equippedComponentQuantity, _Quantity, _ComponentItemName];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
		};		
		
		
		
		(_display displayCtrl 85502) lbSetPicture [_forEachIndex+1,_ComponentItemPicture];
		(_display displayCtrl 85502) lbSetData [_forEachIndex+1,_Component];
		
	} forEach _components;
	  
	  
	//Populate Tools  
	if (count _Tools > 0)  then { (_display displayCtrl 85502) lbAdd Format["====== TOOLS ======"]; };
	{	
		_Tool = _x;
		
		_ToolDispName = getText (configfile >> "CfgMagazines" >> _Tool >> "displayName");
		_ToolPicture  = getText (configfile >> "CfgMagazines" >> _Tool >> "picture");			
		
		//Exile Code
		_equippedToolQuantity = { _x == _Tool } count _equippedMagazines;
		if (_equippedToolQuantity == 0 ) then
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]",_ToolDispName];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];			
		}
		else 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]",_ToolDispName];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
			
		};		
		
		_lbsize = lbSize (_display displayCtrl 85502);
		(_display displayCtrl 85502) lbSetPicture [_lbsize-1,_ToolPicture];
		(_display displayCtrl 85502) lbSetData [_lbsize-1,_Tool];
	} forEach _Tools;	  
	  
	  
	//Populate Required
	 if (_requiredInteractionModelGroup != "" || _requiresOcean == 1 || _requiresFire == 1 || _requiresWeld == 1 || _requiresGen == 1 || _requiresToolTrolley == 1) then { (_display displayCtrl 85502) lbAdd Format["====== REQUIRES ======"]; };
	  
	//Populate Models
	if (_requiredInteractionModelGroup != "")  then 
	{
		_foundObject = false;
		
		_interactionModelGroupConfig = missionConfigFile >> "CfgInteractionModels" >> _requiredInteractionModelGroup;
		_RequiredDispName = getText(_interactionModelGroupConfig >> "name");
		_interactionModelGroupModels = getArray(_interactionModelGroupConfig >> "models");
	
		//Exile Code
		if ([ASLtoAGL (getPosASL player), 10, _interactionModelGroupModels] call ExileClient_util_model_isNearby) then
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]",_RequiredDispName];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
			_foundObject = true;	
		}
		else 
		{
			if ( _interactionModelGroupModels call ExileClient_util_model_isLookingAt ) then
			{
				(_display displayCtrl 85502) lbAdd Format["%1 - [OK]",_RequiredDispName];
				_lbsize = lbSize (_display displayCtrl 85502);
				(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
				_foundObject = true;	
			};
		};
		if !(_foundObject) then
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]",_RequiredDispName];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		};
	
		_lbsize = lbSize (_display displayCtrl 85502);
		(_display displayCtrl 85502) lbSetData [_lbsize-1,_requiredInteractionModelGroup];
	};
	  
	//Populate Ocean
	if (_requiresOcean == 1)  then 
	{
		//Exile Code
		if !(surfaceIsWater getPos player) then 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]", "Ocean"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		}
		else 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]", "Ocean"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];				
		};
	};	  
	  
	//Populate Fire 
	if (_requiresFire == 1)  then 
	{
		//Exile Code
		if !([player, 4] call ExileClient_util_world_isFireInRange) then 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]", "Fire"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		}
		else
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]", "Fire"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
		};			
	};	

	//Populate Weld
	 
	if (_requiresWeld == 1)  then 
	{
		//Exile Code
		_weld = (ASLtoAGL (getPosASL player)) call compile preprocessFileLineNumbers "custom\weaponsCraft\data\ExileClient_util_world_getNearestwelder.sqf";
		if (isNull _weld) then 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]", "EBM Welder"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		}
		else
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]", "EBM Welder"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
		};			

	};	
	
	 //Populate Generator
	 
	 if (_requiresGen == 1)  then 
	 {
		//Exile Code
		_gen = (ASLtoAGL (getPosASL player)) call compile preprocessFileLineNumbers "custom\weaponsCraft\data\ExileClient_util_world_getNearestGenerator.sqf";
		if (isNull _gen) then 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]", "EBM Generator"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		}
		else
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]", "EBM Generator"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
		};			

	 };	

	 //Populate Tool trolley
	 
	 if (_requiresToolTrolley == 1)  then 
	 {
		//Exile Code
		_toolTrolley = (ASLtoAGL (getPosASL player)) call compile preprocessFileLineNumbers "custom\weaponsCraft\data\ExileClient_util_world_getNearestToolTrolley.sqf";
		if (isNull _toolTrolley) then 
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [MISSING]", "EBM Tool Trolley (Blue)"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		}
		else
		{
			(_display displayCtrl 85502) lbAdd Format["%1 - [OK]", "EBM Tool Trolley (Blue)"];
			_lbsize = lbSize (_display displayCtrl 85502);
			(_display displayCtrl 85502) lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
		};			

	 };	
	  	  		  	  	 
	//Populate Returns
	(_display displayCtrl 85502) lbAdd Format["====== RETURNS ======"];
	{
		_Quantity = _x select 0;
		_Component = _x select 1;
		
		_ComponentDispName = getText (configfile >> "CfgMagazines" >> _Component >> "displayName");
		_ComponentPicture  = getText (configfile >> "CfgMagazines" >> _Component >> "picture");
		_ComponentWeapDispName = getText (configfile >> "CfgWeapons" >> _Component >> "displayName");
		_ComponentWeapPicture = getText (configfile >> "CfgWeapons" >> _Component >> "picture");
		_wSrecipeConfig = missionConfigFile >> "CfgCraftingRecipes" >> _recipeClassName;
		_wSrecipePicture = getText(_wSrecipeConfig >> "pictureItem");
		_wSItemPicture 	 = getText(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "pictureItem");
		_ComponentItemName = _ComponentDispName + _ComponentWeapDispName;
		_ComponentItemPicture = _ComponentWeapPicture + _ComponentPicture;
		_wSWeapPic = getText(configfile >> "CfgWeapons" >> _wSItemPicture >> "picture");
		_wSItemPic = getText(configFile >> "CfgMagazines" >> _wSItemPicture >> "picture");
		_wSGlobalPic = _wSWeapPic + _wSItemPic;
		
		(_display displayCtrl 85502) lbAdd Format["%2 - [%1]",  _Quantity, _ComponentItemName];
		_lbsize = lbSize (_display displayCtrl 85502);
		(_display displayCtrl 85502) lbSetPicture [_lbsize-1,_ComponentItemPicture];
		(_display displayCtrl 85502) lbSetData [_lbsize-1,_Component];
		(_display displayCtrl 85507) ctrlSetText _wSGlobalPic;

	} forEach _returnedItems; 

};
