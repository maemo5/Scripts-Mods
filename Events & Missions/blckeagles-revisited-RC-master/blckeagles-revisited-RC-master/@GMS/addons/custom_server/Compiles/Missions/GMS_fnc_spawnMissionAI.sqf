/*
	blck_fnc_spawnMissionAI
	by Ghostrider [GRG]

	returns an array of the units spawned
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
#define configureWaypoints true

params["_coords",["_minNoAI",3],["_maxNoAI",6],"_missionGroups",["_aiDifficultyLevel","red"],["_uniforms",[]],["_headGear",blck_BanditHeadgear],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScubaGroup",false]];
#ifdef blck_debugMode
if (blck_debugLevel >=2) then
{
	private _params = ["_coords","_minNoAI","_maxNoAI","_missionGroups","_aiDifficultyLevel","_uniforms","_headGear","_vests","_backpacks","_weapons","_sideArms","_isScubaGroup"];
	{
		diag_log format["_fnc_spawnMissionAI:: param %1 | isEqualTo %2 | _forEachIndex %3",_params select _forEachIndex,_this select _forEachIndex, _forEachIndex];
	}forEach _this;
};
#endif

private["_unitsToSpawn","_unitsPerGroup","_ResidualUnits","_newGroup","_blck_AllMissionAI","_abort","_return","_adjusttedGroupSize","_minDist","_maxDist"];
_unitsToSpawn = 0;
_unitsPerGroup = 0;
_ResidualUnits = 0;
if (_noAIGroups > 0) then
{
 // Can add optional debug code here if needed.
_unitsToSpawn = [[_minNoAI,_maxNoAI]] call blck_fnc_getNumberFromRange;  //round(_minNoAI + round(random(_maxNoAI - _minNoAI)));
_unitsPerGroup = floor(_unitsToSpawn/_noAIGroups);
_ResidualUnits = _unitsToSpawn - (_unitsPerGroup * _noAIGroups);
};
_blck_AllMissionAI = [];
_abort = false;
if (count _weapons == 0) then 
{
	_weapons = [_aiDifficultyLevel] call blck_fnc_selectAILoadout;
};
#ifdef blck_debugMode
if (blck_debugLevel >= 2) then
{
	diag_log format["_fnc_spawnMissionAI (30):: _unitsToSpawn %1 ; _unitsPerGroup %2  _ResidualUnits %3",_unitsToSpawn,_unitsPerGroup,_ResidualUnits];
};
#endif
if ( (count _missionGroups > 0) && _noAIGroups > 0) then
{ 	
	{
		_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
		_groupSpawnPos = _coords vectorAdd _position;
		
		_newGroup = [_groupSpawnPos,_coords,_minAI,_maxAI,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
			
		#ifdef blck_debugMode
		if (blck_debugLevel >= 2) then
		{
			diag_log format["_fnc_spawnMissionAI (37):: case 1 - > _newGroup = %1",_newGroup];
		};
		#endif

		if (isNull _newGroup) then 
		{
			_abort = true;
		} 
		else
		{
			_newAI = units _newGroup;
			blck_monitoredMissionAIGroups pushback _newGroup;
			#ifdef blck_debugMode
			if (blck_debugLevel >= 2) then
			{
				diag_log format["_fnc_spawnMissionAI(41): Spawning Groups: _noAIGroups=1 _newGroup=%1 _newAI = %2",_newGroup, _newAI];
			};
			#endif
			
			_blck_AllMissionAI append _newAI;
			
		};
	}forEach _missionGroups;
};
if (_missionGroups isEqualTo [] && _noAIGroups > 0) then
{
	private _minPatrolRadius = blck_minimumPatrolRadius;
	private _maxPatrolRadius = blck_maximumPatrolRadius;
	
	switch (_noAIGroups) do
	{
		case 1: {  // spawn the group near the mission center
				
				#ifdef blck_debugMode
				if (blck_debugLevel >= 2) then
				{
					diag_log format["missionSpawner: Spawning Groups: _noAIGroups=1"];
				};
				#endif

				_newGroup = [_coords,_coords,_unitsToSpawn,_unitsToSpawn,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
				#ifdef blck_debugMode
				if (blck_debugLevel >= 2) then
				{
					diag_log format["_fnc_spawnMissionAI (37):: case 1 - > _newGroup = %1",_newGroup];
				};
				#endif

				if (isNull _newGroup) then 
				{
					_abort = true;
				} 
				else
				{
					_newAI = units _newGroup;
					blck_monitoredMissionAIGroups pushback _newGroup;
					#ifdef blck_debugMode
					if (blck_debugLevel >= 2) then
					{
						diag_log format["_fnc_spawnMissionAI(41): Spawning Groups: _noAIGroups=1 _newGroup=%1 _newAI = %2",_newGroup, _newAI];
					};
					#endif
					
					_blck_AllMissionAI append _newAI;
					
				};
			 };
		case 2: {

				#ifdef blck_debugMode
				if (blck_debugLevel >= 2) then
				{
					diag_log format["_fnc_spawnMissionAI(47): Spawning Groups: _noAIGroups=2"];  // spawn groups on either side of the mission area
				};
				#endif
				_groupLocations = [_coords,_noAIGroups,15,30] call blck_fnc_findPositionsAlongARadius;
				{
					if (_ResidualUnits > 0) then
					{
						_adjusttedGroupSize = _unitsPerGroup + _ResidualUnits;
						_ResidualUnits = 0;
					} else {
						_adjusttedGroupSize = _unitsPerGroup;
					};
					_newGroup = [_x,_coords,_adjusttedGroupSize,_adjusttedGroupSize,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
					if (isNull _newGroup) then 
					{
						_abort = true;
					} 
					else 
					{
						_newAI = units _newGroup;

						blck_monitoredMissionAIGroups pushback _newGroup;
						#ifdef blck_debugMode
						if (blck_debugLevel >= 2) then
						{
							diag_log format["_fnc_spawnMissionAI(61): case 2: _newGroup=%1",_newGroup];
						};
						#endif

						_blck_AllMissionAI append _newAI;
					};
				}forEach _groupLocations;

			};
		case 3: { // spawn one group near the center of the mission and the rest on the perimeter
				
				#ifdef blck_debugMode
				if (blck_debugLevel >= 2) then
				{
					diag_log format["_fnc_spawnMissionAI (68): Spawning Groups: _noAIGroups=3"];
				};
				#endif
				_newGroup = [_coords,_coords,_unitsPerGroup + _ResidualUnits,_unitsPerGroup + _ResidualUnits,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
				if (isNull _newGroup) then 
				{
					_abort = true;
				} 
				else
				{
					_newAI = units _newGroup;

					blck_monitoredMissionAIGroups pushback _newGroup;
					#ifdef blck_debugMode
					if (blck_debugLevel >= 2) then
					{
						diag_log format["_fnc_spawnMissionAI (73): Case 3:  _newGroup=%1",_newGroup];
					};
					#endif

					_blck_AllMissionAI append _newAI;

					_groupLocations = [_coords,2,20,35] call blck_fnc_findPositionsAlongARadius;
					{
						_newGroup = [_x,_coords,_unitsPerGroup,_unitsPerGroup,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
						if (isNull _newGroup) then 
						{
							_abort = true;
						}
						else
						{
							_newAI = units _newGroup;

							blck_monitoredMissionAIGroups pushback _newGroup;
							#ifdef blck_debugMode
							if (blck_debugLevel >= 2) then
							{
								diag_log format["_fnc_spawnMissionAI(78): Case 3: line 81: _newGroup = %1",_newGroup];
							};
							#endif

							_blck_AllMissionAI append _newAI;
						};
					}forEach _groupLocations;
				};
			};
		default {  // spawn one group near the center of the mission and the rest on the perimeter

				#ifdef blck_debugMode
				if (blck_debugLevel >= 2) then
				{
					diag_log format["_fnc_spawnMissionAI (88): default:"];
				};
				#endif

				_newGroup = [_coords,_coords,_unitsPerGroup + _ResidualUnits,_unitsPerGroup + _ResidualUnits,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
				if (isNull _newGroup) then 
				{
					_abort = true;
				};
				_newAI = units _newGroup;
				
				blck_monitoredMissionAIGroups pushback _newGroup;
				#ifdef blck_debugMode
				if (blck_debugLevel >= 2) then
				{
					diag_log format["_fnc_spawnMissionAI(92): Spawning Groups: _noAIGroups=1 _newGroup=%1 _newAI = %2",_newGroup, _newAI];
				};
				#endif

				_blck_AllMissionAI append _newAI;
				_groupLocations = [_coords,(_noAIGroups - 1),20,40] call blck_fnc_findPositionsAlongARadius;
				{
					_newGroup = [_x,_coords,_unitsPerGroup,_unitsPerGroup,_aiDifficultyLevel,_minPatrolRadius,_maxPatrolRadius,configureWaypoints,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call blck_fnc_spawnGroup;
					if (isNull _newGroup) then 
					{
						_abort = true;
					}
					else 
					{
						_newAI = units _newGroup;
						blck_monitoredMissionAIGroups pushback _newGroup;
						#ifdef blck_debugMode
						if (blck_debugLevel > 2) then
						{
							diag_log format["_fnc_spawnMissionAI(99): _newGroup=%1",_newGroup];
						};
						#endif
						_blck_AllMissionAI append _newAI;
					};
				}forEach _groupLocations;
			};
	};
};
#ifdef blck_debugMode
if (blck_debugLevel >= 1) then
{
	diag_log format["_fnc_spawnMissionAI(133): _abort = %1 | _blck_AllMissionAI = %2",_abort,_blck_AllMissionAI];
};
#endif

_return = [_blck_AllMissionAI,_abort];
_return
