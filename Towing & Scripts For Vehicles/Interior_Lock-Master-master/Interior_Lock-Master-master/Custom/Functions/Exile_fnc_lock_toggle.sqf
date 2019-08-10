private["_condition", "_object", "_known", "_pincode"];
_condition = _this;
_object = cameraOn;
if(ExileLockIsShown)exitWith{};
ExileLockIsShown = true;
_known = _object getVariable ["ExileAlreadyKnownCode",""];
if ((_known isEqualTo "") || ExileClientPlayerIsInCombat) then
{
	_pincode = 4 call Exile_fnc_keypadDialog_show;
}
else
{
	_pincode = _known;
};
if!(_pincode isEqualTo "")then
{
	["lockToggle",[netId _object,_pincode,_condition]] call ExileClient_system_network_send;
};
call ExileClient_gui_interactionMenu_unhook;
ExileLockIsShown = false;
true