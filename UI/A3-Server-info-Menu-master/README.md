`Version: 02314_BETA`
###ArmA 3 Server info Menu by IT07

First of all: it is really hard as a coder to explain someone how to install scripts. So please bare with me.<br />
<br />
**TYPE 1 instructions: for people that do NOT already have a previous version installed.** <br />
**TYPE 2 instructions: for people that DO already have a previous version installed**
<br /> <br />
####Installation instructions TYPE 1 <br />
1. Copy and paste the ScarCode folder into the root of your missionfile. <br />
2. Open your own init.sqf and look for this piece of code: <br />
`if(hasInterface) then {` <br />
If not found, please copy the entire content of `code_for_init.sqf` into your own init.sqf where it would be appropriate and correct according to ArmA syntax. <br />
If you did find it, please paste line **4 and 5** from `code_for_init.sqf` into the surrounding `{ };` of the `if(hasInterface)` check.
3. Add this to the BOTTOM of your **description.ext:** `#include "ScarCode\SC_Rsc.hpp"` 
4. Configure the contents of the menu Items by changing SC_compileMenu.sqf into your own likings.

####Installation instructions TYPE2 <br />
1. Please remove any files and code associated with the older version. It can be several different filenames depending on the version you have so I hope you know enough to determine which files or scripts to delete. <br />
2. Do the TYPE 1 instructions :)

#### Serious request
If you appreciate my work, please consider to donate to me. There goes a lot of hours into making these scripts so it would be great if you are willing to thank me through any amount of money.
There is a reason why I do not sell this script: I want very single server admin to be able to use this script.
Please, take my script and enjoy :)

Donate link: http://scarcode.com/donate/
