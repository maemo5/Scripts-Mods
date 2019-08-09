private ["_keyed","_shift","_alt","_key","_ctrl","_ctrlKey","_keysToNotUse","_speed"];
_ctrl = _this select 0;
_key = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_keyed = false;
_keysToNotUse = [17,30,31,32,2,3,4,5,6,7,11]; //A,S,W,D,1,2,3,4,5,6,0
if(_key in _keysToNotUse) exitWith{};
//diag_log format["_key keybind %1",_key];//for debugging

switch (_key) do {
	case 211 : 
	{ 
			[] spawn exsys_fnc_quickStats;
	};
};

_keyed;
