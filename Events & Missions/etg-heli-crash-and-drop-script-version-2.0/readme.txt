Filename :readme.txt
Author : Kellojo
Version : 2.0 




Usage

This script allows you to add heli crashes and supply drops to your mission.


Features

- cargo drops
- heli crashes
- random loot
- adjustable loot tables
- time between drops is configurable
- toggable markers
- 'easy configuration'
- toggable fire at crashsites
- toggable AI
- debug function


Notes

If you have any ideas for the script feel free to add me on Steam. My name is "Kellojo" ;).


Can I use this script for my missionserver?

Yes, you can use this script for your server aswell as you can modify it however you want.
Its not necessary to give credit to me but it would be appreciated. :)


How can i run the script?---> Installation


Simply add these two lines below to your init.sqf and the script will do the rest for you.

//ETG Heli Crash And Drop Script
if (isServer) then {
     fn_crashdrop = compile preprocessFile "fn_crashdrop.sqf";
     [2] call fn_crashdrop;
};


You are not running you server on Altis?

Then edit the _mapcenter in the script itself to a position somewhere in the middle of your map and adjust the _centerrad to a radius around that position.



How can i test the script?
Run the example mission or add these actions to your player.

player addAction ["Move in cargo", "if !(isNil 'veh') then {player allowDamage false;player moveInCargo (veh select 0);} else {hint 'There is no active drop/crash'};"];
player addAction ["Teleport to cargo", "if !(isNil 'cargo') then {player allowDamage false;player setPos position cargo;} else {hint 'There is no active cargo'};"];



Changelog:


v1.0
- first release

v1.1
- added crates to heli crashes
- added random staring points of the heli
- added selectable time between crashesdrops
- added randomized loot function
- fixed bug where loot was not spawning at heli crashes
- added readme.txt

v1.2
- added toggable markers at the heli crashessupply drops
- added loot spawning on the ground or inside of the boxes at the heli crash
- cleaned up my code ;)


v1.3
- even more code cleanup (removed some global variables)
- Added configurable altitude
- Added configurable loot spawn radius
- Added configurable fire at crashsites
- Added configurable AI to heli crashes and supply drops
- Added configurable despawn of supplys and onjects after x ammount of time
- Added random time between crashesdrops (toggable)
- Made configuration and customisation much more easyer, by adding a 'menu' to the top of the script
- Added Screen number five


v1.4
- added AI to the cleanup
- added function to delete crates at heli crashes
- added function to spawn loot inside of the supply drop crate (not on the ground)
- removed old loot spawning mechanism and replaced it with a new one which is completely random
- added entry in the rpt file
- added debug function to see if the script is wokring


v1.4.1
- fixed _SleepTime undefined error
- turned some parts of the AI of the helicrew off (thanks to John)
 
v1.5
- fixed smoke bug (probably)
- added magazines being read out from the config
- removed all weapons that could be duplicated in Exile (Loottable & AI)

v1.6
- Fixed heli hovering at [0,0,0] bug

v2.0
- complete rewrite of the script (simplifyed)
