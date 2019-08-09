# ETG-Fast-Travel-System
A script that enables fast travel for Arma 3 (https://arma3.com/) Armaholic page (http://www.armaholic.com/page.php?id=30222)


## Screenshots & Videos

[![Showcase Video](https://img.youtube.com/vi/DTaZlDzel4Y/0.jpg)](https://www.youtube.com/watch?v=DTaZlDzel4Y)


![UI](https://i.imgur.com/P0RQejk.jpg)

![Travel "Animation"](https://i.imgur.com/M1KIIRA.jpg)

## Installation guide:

1. Put the folders "scripts" and "dialogs" into you root mission file!

2. Add to init.sqf:
	```
		fn_ftravel = compile preprocessFile "scripts\fn_ftravel.sqf";
	```
3. Add to description.ext:

	```
		#include "dialogs\defines.hpp"
		#include "dialogs\FastTravelDialog.hpp"
		class RscTitles {
			#include "dialogs\FastTravelHUD.hpp"
		};
	```

4. Add this code to an action or sth. else where you want the fasttravel dialog to be opend
	```
		createDialog "ETG_FastTravelSystem_Dialog";
	```
or add this action to any object you like...
	```
		this addAction ["Fast Travel System", {createDialog "ETG_FastTravelSystem_Dialog";}];
	```

## For this to work in Exile you have to install this too:

http://www.exilemod.com/topic/7577-update-respectpoptabs-and-save-to-database/
---> thx to happydayz btw ;)

## How to add destinations?:

Go to scripts\fn_ftravel.sqf and add markernames to the _Citys Array
(_Citys = ["ftravel_Athira","ftravel_Pyrgos","ftravel_Sofia"];)
