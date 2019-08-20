# XCSV's Exile Scripts Mods & Tools Collection

> Credits Will Be Given When Credits Can Be Gathered.

![](C:\Users\Administrator\Pictures\XCSV EXILE\exile.jpg)

## Installation

Instructions For Most Mods & Scripts Inside Folders :

<a href="https://github.com/XCSVs/Scripts-Mods/blob/master/INSTRUCTIONS/Exile%20Server%20Owner%20Guide%20v1.7.pdf
">Full Server Install Instructions Here</a>

## Contact Me @

Mr. Sage – [@NeoGryph](https://twitter.com/NeoGryph) – mrsage@xcsv.tv

Discord [@mrsage](https://discord.gg/tvhquY6)

[https://github.com/XCSVs/Scripts-Mods](https://github.com/XCSVs)

BattleEye Filters Tool

Tool Here https://jamiechivers.com/A3APTemp/BEFV2.php

If your anything like me and hate doing battleye filters, you will love the tool I made to format the script log into a exception with a click of a button :)

Example Log:

26.12.2015 21:30:37: NAMEHERE (IP:PORTHERE) GUIDHERE - #0 "ber do
            {
                _idKeydown24 = (finddisplay 24) displayAddEventHandler ['KeyDown',{false}];
            };
            if!(_idKeydown24 isEqualTo "
Just simply copy and paste the script restriction from the scripts.log file into the BIG textbox on the page

Be Sure to copy the first and last quotations in the restriction or this will not work correctly.

Example: 

"ber do
            {
                _idKeydown24 = (finddisplay 24) displayAddEventHandler ['KeyDown',{false}];
            };
            if!(_idKeydown24 isEqualTo "
Click the GREEN "Generate Exception" Button.

Now copy and paste the output above the button and place it in your scripts.txt File on the line: (Whatever the kick restriction Number is in the log file + 2)

At the End of the last exception.

In this example, the restriction Number is "#0" So we add 2 making it Line 2 we paste the exception!!! 

Example: 

1 eventHandler !="le \"BIS_RscMissionScreen_video\") displayctrl 1100) ctrladdeventhandler [\"videoStopped\",\"bis_fnc_playvideo_videoStopped = true; \"" !=";\n};\n\n\n[_display] call _fnc_animate;\n{\n_display displayaddeventhandler [_x,_fnc_animate];\n} foreach [\"mousemoving\",\"mouseholding" !="ber do\n            {\n                _idKeydown24 = (finddisplay 24) displayAddEventHandler ['KeyDown',{false}];\n            };\n            if!(_idKeydown24 isEqualTo "
Save the File and reload the scripts using rcon or restart the server.

Done :)

PS: PASTE 1 LOG AT A TIME!
