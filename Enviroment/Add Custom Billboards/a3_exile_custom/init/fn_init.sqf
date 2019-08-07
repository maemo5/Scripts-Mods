// Include shit in here

/*
include map content.
Call compile preprocess'ing them is MUCH better. 
Creating spawn/execvm's IS BAD unless the script is a long running one.
If you try call compile and it all goes to shit, use execvm =P
*/

diag_log "Starting Custom Content PBO";

call compile preprocessFileLineNumbers "\x\addons\custom\mapcontent\billboards.sqf";
call compile preprocessFileLineNumbers "\x\addons\custom\mapcontent\mapaddons.sqf";