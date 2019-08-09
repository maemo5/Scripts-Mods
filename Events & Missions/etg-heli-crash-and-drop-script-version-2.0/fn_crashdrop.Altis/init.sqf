if (isServer) then {fn_crashdrop = compile preprocessFile "fn_crashdrop.sqf";};
player addAction ["Drop", "[2] call fn_crashdrop"];
player addAction ["Move in cargo", "if !(isNil 'veh') then {player allowDamage false;player moveInCargo (veh select 0);} else {hint 'There is no active drop/crash'};"];
player addAction ["Teleport to cargo", "if !(isNil 'cargo') then {player allowDamage false;player setPos position cargo;} else {hint 'There is no active cargo'};"];