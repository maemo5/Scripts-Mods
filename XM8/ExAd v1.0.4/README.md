<img src="logo.png" alt="ExAd" width="200" />

[![Arma 1.80](https://img.shields.io/badge/Arma-1.80-blue.svg)](https://dev.arma3.com/post/spotrep-00077) [![Exile 1.0.4 "Pineapple"](https://img.shields.io/badge/Exile-1.0.4%20"Lemon"-yellow.svg)](http://www.exilemod.com/topic/25026-104-pineapple/) [![ExAd Version](https://img.shields.io/badge/ExAd-v1.0.0%20Kumquat-orange.svg)](http://bjanski.github.io/ExAd/)

Exile Addons by Janski - originally small projects developed for the Arma Exile communities EXO and SP4R but now rewritten and collected here for public use. Contributers to the code can be found in the "Contributers" section at the top of the Repo.
Repo now looked after and updated by [[GADD]](https://gamingatdeathsdoor.com)Monkeynutz.

# PLEASE NOTE: Exile already contains Virtual Garage by default. We DO NOT reccomend anyone uses ExAd Virtual Garage. The Virtual Garage by ExAd is up to you, use one or the other, not both.

Janski No longer works on ExAd but you can donate to him here to appreciate his work... :smirk: | [Donate here](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=jan%2ebabor%2e383%40gmail%2ecom&lc=GB&item_name=ExAd&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)

## Installation & Examples
Instructions for installation is found under [docs](https://github.com/Bjanski/ExAd/tree/master/docs). 
Each plugin must be installed seperately, I've done it this way to make the update procedure easier. 
Below you can see what dependencies each plugin has. 

### NEW INSTRUCTIONS
Step 1: Copy the files located in the "@ExileServer\addons" folder into your servers "@ExileServer\addons" 
Note: Do not copy over "exad_vg" if you do not wish to utilize the ExAd Virtual Garage.

Step 2: Open the "@ExileServer\extDB\sql_custom_v2" folder and follow steps within "exile.ini"
Note: If you are not using ExAd VG disregard those steps. Also if using extDB3 utilize steps within (64-bit) folder.

Step 3: Copy the folder "ExAdClient" located within mission folder into your own mission (i.e. Exile.Altis)

Step 4: Open the file "config.cpp" and follow steps.
Note: If you did not include ExAd VG in previous steps ensure to remove it here as well.

Step 5: Open the "CfgExileCustomCode.cpp" and follow steps.
Note: Same thing applies here if you are not using ExAd VG.

Step 6: Open the "CfgInteractionMenus.cpp" and follow steps.
Note: If not using Recruit AI app don't include the bodyguard block.

Step 7: Open the "description.ext" and follow steps.

Step 8: Copy the file "stringtable.xml" into your mission pbo.

Step 9: Apply the necessary additions to your BattlEye "scripts.txt" and "remoteexec.txt".

Step 10: If using ExAd Virtual Garage apply the following Query to your MYSQL database:

ALTER TABLE `vehicle` ADD `territory_id` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `vehicle` ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

Note: If you have done this previously you can skip this step.

I have included original ExAd documentation if you get confused with any of these steps.

IF YOU DON'T WANT EXAD VIRTUAL GARAGE REMOVE THE FOLLOWING LINES:

Under "class XM8" remove:

class ExAd_VG
    {
        title = "Virtual Garage";
        controlID = 50000;                  //IDC:50000 -> 50015 || These need to be unique and out of range from each other
        logo = "ExadClient\XM8\Apps\VG\Icon_VG.paa";
        onLoad = "ExAdClient\XM8\Apps\VG\onLoad.sqf";
        onOpen = "ExAdClient\XM8\Apps\VG\onOpen.sqf";
        onClose = "ExAdClient\XM8\Apps\VG\onClose.sqf";
    };
	
Also remove "ExAd_VG" from Extra apps.

For the app buttons find:

class XM8_App13_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "ExadClient\XM8\Apps\VG\Icon_VG.paa";
    text = "ExAD Virtual Garage";
    onButtonClick = "['ExAd_VG', 0] call ExileClient_gui_xm8_slide";
    resource = "";
};

and replace with:

class XM8_App13_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "";
    text = "";
    onButtonClick = "";
    resource = "";
};


## Update Instructions
After you have installed the entire or parts of the ExAd Package you will easiest update by checking each subproject documentation folder to retrieve the changelog and update instructions. 

## Collection
  * Core
  * Halo & Parachute
  * Virtual Garage
  * Grinding
  * Hacking
  * StatsBar
  * XM8
  * Admin Events .. *Coming Soon*
  * VehicleUpgrade -- *Coming Soon*

## Dependencies
* Core
    * [Exile](http://www.exilemod.com/downloads/)
* Virtual Garage
    * Core
    * XM8
* XM8
    * Core
* StatsBar
    * Core
    * XM8
* Admin Events
    * Core
    * [Infistar](https://infistar.de/)
* Hacking
    * Core
    * (Virtual Garage)
* Grinding
    * Core
* Halo & Parachute
    * Core
* VehicleUpgrade
    * Core

## Contribute
Contributions are allways welcome, please read [Contribution Guidlines](CONTRIBUTING.md) first.

All contributed code first needs to be rewieved and tested before pushed to master. 

## License
Apache License

## Contact
Janski doesn't reply as much anymore as he is not in the ArmA scene. But here is his [Exile profile](http://www.exilemod.com/profile/7143-janski/)  
Contact Monkeynutz Directly for a fast reply: [Monkey's Profile](http://www.exilemod.com/profile/61794-monkeynutz/)

If you want help with an issue, report a bug or maybe just request a new feature first make sure now one else have had the same issue by searching the [Issue Tracker](https://github.com/Bjanski/ExAd/issues) and the [Exile Forum](http://www.exilemod.com/topic/13865-exad-package-of-virtual-garagexm8statsbarhalo-parachuteadmin-eventshackinggrindingvehicle-upgrade/).
