/*
	Author: maca134

	Description:
	Check all triggers
*/

for "_i" from 0 to ((count TRG_triggers) - 1) step 2 do {
	[TRG_triggers select (_i + 1)] call TRG_fnc_checkTrigger;
};