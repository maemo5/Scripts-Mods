# ExileDynamicLocker

These scripts add a dynamic locker limit to your server. The limit will scale with the respect level of the player.

Base idea from [KnatteAnka](http://www.exilemod.com/profile/4567-knatteanka/). I've just fixed a visual bug and cleaned the code a bit.

<b>Added by red_ned</b><br>
Tidied up display of long numbers<br>
Added my owned 100 levels including last huge one to prevent issues<br>
Forked 06/01/2018<br>

# Installation

1. DePbo your mpmissions pbo.
2. Move MPMission/Custom to your mpmissions folder.
3. Add **[] execVM "Custom\dynamicLockerLimit\init.sqf";** to your init.sqf or copy **MPMission/init.sqf** to your mpmissions folder.
4. Add the lines from **MPMission/config.cpp** to your mpmissions **config.cpp**.
5. Repack your mpmissions pbo.
6. Start your server and test everything.