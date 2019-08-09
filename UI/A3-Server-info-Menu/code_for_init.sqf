// [ScarCode] Servermenu script by IT07
if (hasInterface) then 
{
	[true] call compile preprocessFileLineNumbers "ScarCode\SC_compileMenu.sqf";
	[true] ExecVM "ScarCode\SC_startMenu.sqf";
};