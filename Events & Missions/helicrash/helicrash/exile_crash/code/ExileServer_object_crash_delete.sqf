/**
 * ExileServer_object_crash_delete
 * © 2018 ejik designer
 *
 */
 
private["_group","_objVehicle","_varnameYawik","_varnameDum","_varnameMarker"];
_group = _this select 0;
_objVehicle = _this select 1;
_varnameYawik = _objVehicle getVariable ["crashYawik",objNull];
_varnameDum = _objVehicle getVariable ["crashDum",objNull];
_varnameMarker = _objVehicle getVariable ["crashMarker",""];
//deleteVehicle helik;
deleteVehicle _objVehicle;
deleteVehicle _varnameYawik;
deleteMarker _varnameMarker;
_emitterArray = _varnameDum getVariable "effects";
{deleteVehicle _x} forEach _emitterArray;
deleteVehicle _varnameDum;
if(count(units _group) > 0)then{
	{
		deleteVehicle _x;
		sleep 0.2;
	}forEach units _group;
};
true