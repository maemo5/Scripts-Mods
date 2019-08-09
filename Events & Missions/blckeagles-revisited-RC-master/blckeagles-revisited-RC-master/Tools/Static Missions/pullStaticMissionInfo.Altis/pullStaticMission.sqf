
_fn_isInside = {  // returns true if an object is inside, underneath or on top of a building otherwise returns false.
	//////////////////////
	//  Determine if a unit is inside a building using two separate checkVisibility
	//////////////////////
	//  lineIntersects [ eyePos player, aimPos chopper, player, chopper]
	_u = _this select 0;
	private ["_u","_pos","_above","_below"];
	_pos = getPosASL _u;
	_above = lineIntersects [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u];
	_below = lineintersects [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 2],_u];
	//diag_log format["_fn_isInside: _u %1 (%8)| typeOf _u %4 | _above %2 | _below %3 ",_u,_above,_below,typeOf _u];
	// If there is something above or below the object do a quick double-check to make sure there is a building there and not something else.
	if (_above) then // test if any surfaces above are from buildingPos
	{
		_surfacesAbove = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u,_u,true,100];
		_above = false;
		{
			//diag_log format["_fn_isInside: _x-2 = %2 | typeOf _x = %3",_x,_x select 2,typeOf (_x select 2)];
			if ((_x select 2) isKindOf "House") then {_above = true};
		}forEach _surfacesAbove;
	};
	if (_below) then 
	{
		_surfacesBelow = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 10],_u,_u,true,100];
		_above = false;
		{
			//diag_log format["_fn_isInside: _x-2 = %2 | typeOf _x = %3",_x,_x select 2,typeOf (_x select 2)];
			if ((_x select 2) isKindOf "House") then {_above = true};
		}forEach _surfacesBelow;
	};	

	_isInside = if (_above || _below) then {true} else {false};
	//diag_log format["_fn_isInside: _isInside = %1",_isInside];
	_isInside
};

_fn_buildingContainer = {  //  returns the builing containing an object or objNull
	private["_u","_pos","_building","_surfacesAbove","_surfacesBelow"];
	_u = _this select 0;
	_pos = getPosASL _u;
	private _building = objNull;
	//  lineIntersectsSurfaces [begPosASL, endPosASL, ignoreObj1, ignoreObj2, sortMode, maxResults, LOD1, LOD2, returnUnique] 
	_surfacesAbove = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u,_u,true,10];
	{
		if ((_x select 2) isKindOf "House" && !(_x isEqualTo _u)) exitWith {_building = (_x select 2)};
	} forEach _surfacesAbove;
	if (_building isEqualTo objNull) then
	{
		_surfacesBelow = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 10],_u,_u,true,100];
		{
			if ((_x select 2) isKindOf "House" && !(_x isEqualTo _u)) exitWith {_building = (_x select 2)};
		} forEach _surfacesBelow;
	};
	//diag_log format["_fn_buildingContainer: _u = %1 | _building = %2",_u,_building];
	_building
};

_fn_isInfantry = {  //  returns true if a unit is on foot otherwise returns false.
	//////////////////////
	//  Determine if a unit isinfantry rather than a unit manning a turret or vehicle
	//////////////////////	
	_u = _this select 0;
	private _isInfantry = if ((_u isKindOf "Man") && (vehicle _u) isEqualTo _u) then {true} else {false};
	//diag_log format["_fn_isInfantry: _isInfantry = %1",_isInfantry];
	_isInfantry
};

diag_log "==========  <START>  ==========================";
_msg = "starting script, please wait";
systemChat _msg;
hint _msg;
///////////////////
// Identify any buildings in which a garrison should be spawned using the Arma building positions.
// Tell the script which buildings to garrison by placing an object inside that designates them as such.
// I use a large yellow sphere for this purpose.
// The function below assembles a list of such buildings for use in defining the data for mission buildings.
///////////////////

private _cb = "";


///////////////////
// Change values of these constants to suit your needs
///////////////////
#define aiDifficulty "Red"
#define minAI 3
#define maxAI 6
#define patrolRadius 45
#define AI_respawnTime 600
#define AI_timesToRespawn -1
#define aiVehiclePatrolRadius 75
#define vehiclePatrolRespawnTime 600
#define vehiclePatrolTimesToRespawn -1
#define staticWeaponRespawnTime 600
#define staticWeaponTimesToRespawn -1
#define aiAircraftPatrolRespawnTime 600
#define aiAircraftPatrolRadius 1700
#define aircraftPatrolTimesToRespawn -1
#define oddsOfGarrison 0.67
#define maxGarrisonStatics 3
#define maxGarrisonUnits 4
#define typesGarrisonStatics []  //  When empty a static will be randomly chosen from the defaults for blckeagls
#define garrisionsTimesToRespawn -1
#define garrisonMarkerObject "Sign_Sphere100cm_F"  //  This can be anything you like. I find this large sphere easy to see and convenient.
#define unitMarkerObject "Man" //"Sign_Arrow_Direction_Green_F"  //  This can be anything. I chose this arrow type because it allows you to easily indicate direction. 

////////////////////////
//   Begin pulling data here
///////////////////////

_cb = _cb + format["_garrisonedBuildings_BuildingPosnSystem = [",endl];
private _garrisonedBuildings = [];
_helpers = allMissionObjects garrisonMarkerObject; 
//diag_log format["_helpers = %1",_helpers];
{
	if ( (typeOf _x) isEqualTo garrisonMarkerObject) then
	{
		private _isInside = [_x] call _fn_isInside;
		if (_isInside) then
		{
			_building = [_x] call _fn_buildingContainer;
			_garrisonedBuildings pushbackunique _building;
			_garrisonedBuildings pushbackunique _x;			
			//  data structure ["building Classname",[/*building pos*/],/*building dir*/,/*odds of garrison*/, /*Max Statics*/,/*types statics*/,/*max units*/],
																					// 1				2					3			         4	  				5		6		7			   8				9						10         11			12				13
			_line = format['     ["%1",%2,[%3,%4],[%5,%6],"%7",%8,%9,10,%11,%12,%13]',typeOf _building,getPosASL _building,vectorDir _building, vectorUp _building, 'true','true',aiDifficulty,oddsOfGarrison,maxGarrisonStatics,typesGarrisonStatics,maxGarrisonUnits,AI_respawnTime,garrisionsTimesToRespawn];
			systemChat _line;
			//diag_log _line;
			if (_forEachIndex == 0) then
			{
				_cb = _cb + format["%1%2",endl,_line];
			} else {
				_cb = _cb + format[",%1%2",endl,_line];
			};			
		};
	};
} forEach _helpers;
_cb = _cb + format["%1];%1%1",endl];
//diag_log format["line (165): _cb = %1",_cb];
_configuredStatics = [];
_configuredUnits = [];

_fn_configureGarrisonForBuildingASL = {
	private["_b","_staticsInBuilding","_unitsInBuilding","_staticsText","_unitsText","_buildingGarrisonASL","_staticsInBuilding","_unitsInBuilding","_count"];
	_b = _this select 0;
	_count = 0;
	if (_b in _garrisonedBuildings) exitWith {""};
	_staticsText = "";
	_unitsText = "";
	_buildingGarrisonASL = "";
	_staticsInBuilding = nearestObjects[getPosASL _building,["StaticWeapon"],sizeOf (typeOf _building)];
	{
		if !(_x in _configuredStatics) then
		{
			_isInside = [_x] call _fn_isInside;
			if (_isInside) then {_building = [_x] call _fn_buildingContainer};
			if (_b isEqualTo _building) then
			{
				_configuredStatics pushBackUnique _x;
				
				if (_staticsText isEqualTo "") then
				{
					_staticsText = format['["%1",%2,%3]',typeOf _x,(getPosASL _x) vectorDiff (getPosASL _b),getDir _x];
				} else {
					_staticsText = _staticsText + format[',["%1",%2,%3]',typeOf _x,(getPosASL _x) vectorDiff (getPosASL _b),getDir _x];
				};
			};
		};
	} forEach _staticsInBuilding;
	_unitsInBuilding = nearestObjects[getPosASL _building,[unitMarkerObject],sizeOf (typeOf _building)];

	{
		if !(_x in _configuredUnits) then
		{
			_isInside = [_x] call _fn_isInside;
			if (_isInside) then {_building = [_x] call _fn_buildingContainer};
			if (_b isEqualTo _building) then
			{
				_configuredUnits pushBackUnique _x;
				
				if (_unitsText isEqualTo "") then
				{
					_unitsText = format["[%1,%2]",(getPosASL _x) vectorDiff (getPosASL _b),getDir _x];
				} else {
					_unitsText = _unitsText + format[",[%1,%2]",(getPosASL _x) vectorDiff (getPosASL _b),getDir _x];
				};
				_count = _count + 1;
			};
		};
	} forEach _unitsInBuilding;	
	if ( !(_staticsText isEqualTo "") || !(_unitsText isEqualTo "")) then
	{																						//  1		2			3			4			5		6		7			8				9		10				11
		_buildingGarrisonASL = format['     ["%1",%2,[%3,%4],[%5,%6],"%7",[%8],[%9],%10,%11]',typeOf _b,getPosASL _b,vectorDir _b,vectorUp _b,'true','true',aiDifficulty,_staticsText,_unitsText,AI_respawnTime,garrisionsTimesToRespawn];
		_garrisonedBuildings pushBackUnique _b;
	};
	_buildingGarrisonASL
};

private _count = 0;
private _buildingCount = 0;
_cb = _cb + "_garrisonedBuilding_ASLsystem = [";
{
	private _isInside = [_x] call _fn_isInside;
	if (_isInside) then
	{
		private _building = [_x] call _fn_buildingContainer;
		private _include = if ( !(_building in _garrisonedBuildings) && !((typeOf _building) isEqualTo unitMarkerObject) && !((typeOf _building) isEqualTo garrisonMarkerObject)) then {true} else {false};
		if (_include) then
		{
			//diag_log format["building info for garrisonedBuilding_ATL:  _x = %1 | _building = %1",_x,_building];
			private _buildingGarrisonInformation = [_building] call _fn_configureGarrisonForBuildingASL;
			//diag_log format["_buildingGarrisonInformation(ATL) = %1",_buildingGarrisonInformation];
			//diag_log format["_buildingGarrisonInformation(ATL) = %1",_buildingGarrisonInformation];
			//diag_log format["typeName _buildingGarrisonInformation(ATL) = %1",typeName _buildingGarrisonInformation];
			//if (typeName _buildingGarrisonInformation isEqualTo "STRING") then
			//{
				//diag_log format["length _buildingGarrisonInformation(ATL) = %1",count (toArray(_buildingGarrisonInformation))];
			//};
			private _strLength = count(toArray(_buildingGarrisonInformation));
			if (_strLength > 0) then
			{
				if (_count == 0) then
				{
					_cb = _cb + format["%1%2",endl,_buildingGarrisonInformation];
				} else {
					_cb = _cb + format[",%1%2",endl,_buildingGarrisonInformation];
				};

				_count = _count + 1;
			};
		};
	};
		
} forEach ((allMissionObjects "StaticWeapon") + (allMissionObjects unitMarkerObject));
_cb = _cb + format["%1];%1%1",endl];
diag_log format["line (227): _cb = %1",_cb];
uiSleep 1;
///////////////////
// Configure info remaining mission landscape
///////////////////
_land = allMissionObjects "Static";

_count = 0;
_cb = _cb + format["_missionLandscape = [",endl];
{
	diag_log format["evaluating mission landscape: _x = %1 | typeOf _x = %1",_x, typeOf _x];
	//diag_log format["evaluating mission landscape: _x %1 | typeOf _x %1",_x, _x isKindOf "Helper_Base_F"];
	if !(_x in _garrisonedBuildings && !((typeOf _x) isEqualTo unitMarkerObject) && !((typeOf _x) isEqualTo garrisonMarkerObject)) then
	{
		_line = format['     ["%1",%2,[%3,%4],[%5,%6]]',typeOf _x,getPosASL _x,vectorDir _x, vectorUp _x, 'true','true'];

		systemChat _line;
		if (_count == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};	
		_count = _count + 1;
	};
}forEach allMissionObjects "Static";
_cb = _cb + format["%1];%1%1",endl];
diag_log format["line (276): _cb = %1",_cb];

///////////////////
// Setup information for any remaining infantry groups
///////////////////
_count = 0;
_cb = _cb + format["_aiGroupParameters = ["];
{
		//[[22920.4,16887.3,3.19144],"red",[1,2], 75,120],
	_isInside = [_x] call _fn_isInside;
	_isInfantry = [_x] call _fn_isInfantry;

	diag_log format["_missionGroups: _unit %1 | _isInside %2 _isInfantry %3",_x,_isInside,_isInfantry];
	if (_isInfantry) then
	{
		if (!(surfaceIsWater (getPos _x))  && !(_isInside) && !(isPlayer _x) && !(_x in _configuredUnits)) then
		{													// 1			2			3	4	  5	  			6				7
			_line = format['     [%1,"%2",[%3,%4],%5,%6,%7]',getPosASL _x,aiDifficulty,minAI,maxAI,patrolRadius,AI_respawnTime,AI_timesToRespawn];
			systemChat _line;
			if (_count == 0) then
			{
				_cb = _cb + format["%1%2",endl,_line];
			} else {
				_cb = _cb + format[",%1%2",endl,_line];
			};
			_count = _count + 1;
		};
	};
}forEach allMissionObjects "Man";
_cb = _cb + format["%1];%1%1",endl];
diag_log format["line (303): _cb = %1",_cb];

_count = 0;
_cb = _cb+ format["_aiScubaGroupParameters = ["];
{
	//[[22920.4,16887.3,3.19144],"red",[1,2], 75,120],
	if (surfaceIsWater (getPos _x)) then
	{													//  1			2			3	4		5			6				7
		_line = format['     [%1,"%2",[%3,%4],%5,%6,%7]',getPosASL _x,aiDifficulty,minAI,maxAI,patrolRadius,AI_respawnTime,AI_timesToRespawn];
		systemChat _line;
		if (_count == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};
		_count = _count + 1;
	};
}forEach allMissionObjects "Man";
_cb = _cb + format["%1];%1%1",endl];
diag_log format["line (321)): _cb = %1",_cb];

///////////////////
// Setup Info for vehicle patrols
///////////////////
_cb = _cb + format["_vehiclePatrolParameters = ["];
{
	if !((typeOf _x) isKindOf "SDV_01_base_F") then
	{
		_line = format['     ["%1",%2,"%3",%4,%5,%6]',typeOf _x, getPosASL _x, aiDifficulty,aiVehiclePatrolRadius,vehiclePatrolRespawnTime,vehiclePatrolTimesToRespawn];	//["B_G_Offroad_01_armed_F",[22809.5,16699.2,0],"blue",600,10]
		systemChat _line;
		if (_forEachIndex == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};	
	};
}forEach ((allMissionObjects "Car") + (allMissionObjects "Tank") + allMissionObjects "Ship");
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Configs for Air Patrols
///////////////////
_cb = _cb + "_airPatrols = [";
	//[selectRandom _aircraftTypes,[22830.2,16618.1,11.4549],"blue",1000,60]
{
	_line = format['     ["%1",%2,"%3",%4,%5,%6]',typeOf _x, getPosASL _x, aiDifficulty,aiAircraftPatrolRadius,aiAircraftPatrolRespawnTime,aircraftPatrolTimesToRespawn];
	systemChat _line;
	if (_forEachIndex == 0) then
	{
		_cb = _cb + format["%1%2",endl,_line];
	} else {
		_cb = _cb + format[",%1%2",endl,_line];
	};		
}forEach allMissionObjects "Air";
_cb = _cb + format["%1];%1%1",endl];

///////////////////
// Setup info for static/emplaced weapons
///////////////////
_count = 0;
_cb = _cb + format["_missionEmplacedWeapons = ["];
{
	if !(_x in _configuredStatics) then
	{
		// 	["B_HMG_01_high_F",[22883.5,16757.6,6.31652],"blue",0,10]
							//						1			2			3			4	5						6
		_line = format['     ["%1",%2,"%3",%4,%5,%6]',typeOf _x,getPosASL _x,aiDifficulty,0,staticWeaponRespawnTime,staticWeaponTimesToRespawn];	
		systemChat _line;	
		if (_count == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};
		_count = _count + 1;
	};
}forEach allMissionObjects "StaticWeapon";
_cb = _cb + format["%1];%1%1",endl];

_cb = _cb + "_submarinePatrolParameters = [";
{
	if ((typeOf _x) isKindOf "SDV_01_base_F") then
	{											// 1		2			3				4						5							6	
		_line = format['  ["%1",%2,"%3",%4,%5,%6]',typeOf _x, getPosASL _x, aiDifficulty,aiSubmarinePatrolRadius,vehicleSubmarineRespawnTime,vehiclePatrolTimesToRespawn];	//["B_G_Offroad_01_armed_F",[22809.5,16699.2,0],"blue",600,10]
		systemChat _line;
		if (_forEachIndex == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};
	};
}forEach allMissionObjects "Ship";
_cb = _cb + format["%1];%1%1",endl];

_cb = _cb + "_missionLootBoxes = [";
{
	//  [selectRandom blck_crateTypes,[22904.8,16742.5,6.30195],[[0,1,0],[0,0,1]],[true,false], _crateLoot, _lootCounts]
	_line = format['     ["%1",%2,%3,[true,false],_crateLoot,_lootCounts]',typeOf _x,getPosASL _x,[VectorDir _x, VectorUp _x]];
		systemChat _line;
		if (_forEachIndex == 0) then
		{
			_cb = _cb + format["%1%2",endl,_line];
		} else {
			_cb = _cb + format[",%1%2",endl,_line];
		};	
}forEach (allMissionObjects "ReammoBox") + (allMissionObjects "ReammoBox_F");
_cb = _cb + format["%1];%1%1",endl];


///////////////////
// All done, notify the user and copy the output to the clipboard
///////////////////
_msg = "All Objects organzied, formated and copied to the Clipboard";
hint _msg;
systemChat _msg;
systemChat format["_cb has %1 characters",count _cb];
copyToClipboard _cb;
//if (true) exitWith{diag_log _cb};