/*
	Managages simulation using blckeagls logic 	
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";
private["_playerType","_players"];
_playerType = ["LandVehicle","SHIP","AIR","TANK"];
switch (toLower(blck_modType)) do
{
	case "exile": {_playerType = _playerType + ["Exile_Unit_Player"]};
	case "epoch": {_playerType = _playerType + ["Epoch_Male_F","Epoch_Female_F"]};
};
{
	private _group = _x;
	_players = ((leader _group) nearEntities [_playerType, blck_simulationEnabledDistance]) select {isplayer _x};
	
	if !(_players isEqualTo []) then
	{
		{	
			if !(simulationEnabled _x) then
			{	
				_x enableSimulationGlobal  true;
				(_players select 0) reveal _x;  //  Force simulation on
			};
		}forEach (units _group);
	}else{
		{
			if (simulationEnabled _x) then
			{	
				_x enableSimulationGlobal false;
			};
		}forEach (units _x);
	};
} forEach blck_monitoredMissionAIGroups;
