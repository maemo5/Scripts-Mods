/*
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

//diag_log format["_fnc_vehicleMonitor:: function called at %1 with _vehList %2 ",diag_tickTime,blck_monitoredVehicles];
private _serverIDs =  ([2] + (entities "HeadlessClient_F"));
for "_i" from 1 to (count blck_monitoredVehicles) do
{
	if (_i > (count blck_monitoredVehicles)) exitWith {};
	private _veh = blck_monitoredVehicles deleteAt 0;
	if !(_veh isEqualTo objNull) then
	{
		// if the owner is a player do not add back for further monitoring
		if ((owner _veh) in (_serverIDs)) then 
		{
			//diag_log format["_fnc_vehicleMonitor: vehicle %1 to be deleted at %2",_veh,(_veh getVariable ["blck_deleteAtTime",0])];
			
			if ((_veh getVariable ["blck_deleteAtTime",0]) > 0) then
			{
				if (diag_tickTime > ( _veh getVariable ["blck_deleteAtTime",0])) then
				{
					//diag_log format["_fnc_vehicleMonitor: deleting vehicle and crew for %1",_veh];
					[_veh] call blck_fnc_destroyVehicleAndCrew;				
				} else {
					blck_monitoredVehicles pushBack _veh;
				};
			} else {
				blck_monitoredVehicles pushBack _veh;
			};
		//} else {
			//diag_log format["_fnc_vehicleMonitor:  owner of vehicle %1 is a player, discontinuing further monitoring",_veh];
			// TODO: Add script(s) to add vehicle to database when blck_persistantMissionVehicles == true;
		};
	};
};
