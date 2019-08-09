#Improved XM8 apps for Exile mod

This script adds "apps" button to XM8. This allow use of custom scripts and slides in Exile
This script doing preatty much same thing as Shix xm8Apps, hovewer, there are following deferences:
 - Sliding functionality of Exile is used in natural way.
 - Go back button is there.
 - Script allow creating custom slides and use them naturally via exile`s functions.
 - Script does not take away any buttons, "Territory" button is shrinked to half size instead.
 - When XM8 is closed and opened last opened slide will be on, same way as Exile`s slides.
 - Whole system is very native to Exile, devs can easily integrate into exile any app, made for this system.
 - Detailed step by step guide, how to make own apps. Visit THIS thread for more info.
 - Support for legacy apps, those made for Shix`s xm8Apps.
 
WARNING!!! This script MAY have problems with some existing apps.
Old (legacy) apps SHOULD work. But "GO BACK" button may be broken.
Press "ESC" to close XM8 and then open it again in such a case.
See legacyAppInstall.txt to see how to install old apps.

TO APP AUTHORS
If you are author of app, and you would like to adapt it to new system, please 
read legacy\legacyAppAdapt.txt, there you will find instructions and examples.

Authors
code - vitaly 'mind' chizhikov 
art - DaCoon
original idea by Shix

Future plans
1) Get feedback on forum
2) Make requested features
3) Conquer the galaxy

INSTALLATION
1) Copy XM8_apps folder to ROOT of your mission folder.
2) Edit "initPlayerLocal.sqf" Add line.
	execVM "XM8_apps\scripts\XM8_apps_init.sqf";
3) Edit "description.ext". Add line to the very bottom.
	#include "XM8_apps\XM8_apps_sliders.hpp"
4) Edit "config.cpp". Add following lines to CfgExileCustomCode class
    class CfgExileCustomCode 
    {
        ExileClient_gui_xm8_show = "XM8_apps\scripts\ExileClient_gui_xm8_show.sqf";
        ExileClient_gui_xm8_slide_apps_onOpen = "XM8_apps\scripts\ExileClient_gui_xm8_slide_apps_onOpen.sqf";
        ExileClient_gui_xm8_slide = "XM8_apps\scripts\ExileClient_gui_xm8_slide.sqf";
    };
5) Edit "XM8_apps\XM8_apps_config.sqf" according to instructions provided with apps you want to have.
6) Edit "XM8_apps\XM8_apps_sliders.hpp" according to instructions provided with apps you want to have. 
7) Enjoy!