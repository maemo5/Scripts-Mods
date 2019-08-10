private["_vehicle"];
_vehicle = cameraOn;
if(locked _vehicle isEqualTo 0)then
{
	true spawn Exile_fnc_lock_toggle;
}
else
{
	false spawn Exile_fnc_lock_toggle;
};
true