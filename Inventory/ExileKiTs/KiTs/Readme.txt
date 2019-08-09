Created By [TBI] Liam 

GamersRoost 


How to Install 

1. Install XM8 Apps from @shix from: http://www.exilemod.com/topic/9040-xm8-apps  

2. Download the KiTs package: https://onedrive.live.com/?authkey=%21AK7rjY7g7W6BEHs&cid=1DE446DEA2275EAF&id=1DE446DEA2275EAF%2125870&parId=1DE446DEA2275EAF%2125858&action=locate  

3. Unzip the “KiTs” folder  

4. Open MPmissions\Exile.yourmission\xm8Apps folder 

5. Place the KiTs folder inside of your xm8Apps folder inside of your mission folder 

6. Open your Description.ext 

7. Search for allowFunctionsRecompile = 0; 

8. BELOW that type #include "xm8Apps\KiTs\dialog.hpp”  

9. Go to your Xm8Apps_Init.sqf and define one of the Apps as KiTs and in the action type execVM "xm8Apps\KiTs\Loadout.sqf"; (see @shix’s thread above for details) 

It should look like this but replace App1 AND the App1logo AND App1_action to match your xm8app button number. 

//App 1 

_app1Text = "App 1"; 

_app1Logo = "xm8Apps\KiTs\Default.paa"; 

app1_action = { 

ExecVM "xm8apps\KiTs\Loadout.sqf"; 

}; 

10. Save all files  

11. Repack your mission file 

12. Profit! 

To change your KiTs and go into the dialog.hpp and follow the instructions there, go to line 100 DO NOT TOUCH above line 100, unless you are 100% sure what you are doing. 


To create your custom kits you will need to copy and RENAME the DefaultLoadout.sqf to the name of your kit. 

 Example. 

Kit 1 will be named something like “SniperKit.sqf” 

Kit 2 will be named something like “Rifleman.sqf” 

Modify the classnames of the items you want to spawn on the player. 

NOTE: For it to work in safezones only take out the Loadout.sqf and rename the LoadoutInSafezoneOnly.sqf to Loadout.sqf once you have done this it will only work inside of a safezone!
