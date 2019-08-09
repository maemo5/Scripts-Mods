waitUntil {!(isNull (findDisplay 46))};
diag_log "Safe to initialize clientside scripts";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call exsys_fnc_keybinds"];