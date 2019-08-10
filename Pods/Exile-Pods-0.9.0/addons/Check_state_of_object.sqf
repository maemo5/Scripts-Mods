private["_object","_objectDamage"];
_object = cursorTarget;

if ((_object isKindof "Pod_Heli_Transport_04_base_F") or (_object isKindof "Slingload_base_F")) then {
	_objectDamage = damage _object;
	_objectDamage = _objectDamage * 100;
	_objectDamage = 100 - _objectDamage;
	_objectDamage = round _objectDamage;
	_damagetext = format["State of the pod: %1%2", _objectDamage,"%"];
	["Success", [_damagetext]] call ExileClient_gui_notification_event_addNotification;
};
