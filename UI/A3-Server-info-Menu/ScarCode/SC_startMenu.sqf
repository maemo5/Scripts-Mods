private["_launchTheAwesome"];
_launchTheAwesome = _this select 0;
if(_launchTheAwesome) then 
{
	waitUntil { !(isNil "SC_fnc"); (!isNull Player); (alive Player); (player == player); !(isNull (findDisplay 46)); (speed player > 0.2) }; // Wait for the functions to be loaded
	call SC_loadServerMenu;
};