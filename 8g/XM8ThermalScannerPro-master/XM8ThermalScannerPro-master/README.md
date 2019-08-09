# XM8ThermalScannerPro
Virtual ThermalScannerPro App


THIS IS FOR SCRIPTERS OR PEOPLE WHO CAN FOLLOW DIRECTIONS REALLY WELL.

I AM NOT PROVIDING BLANK FILES FOR ANYTHING HERE. SIMPLY MERGE OR ADD TO YOUR FILES. DO NOT USE THESE FILES AS OVERWRITES!!


1. [Client] Add the Name, Image and exec to your xm8_apps_init.sqf file, image is inside of image folder and EVERYTHING
  inside of custom folder will go in that custom folder inside your xm8apps folder!!! ALL 4 Files
  
2. [Client] Paste the contents of initPlayerLocal on the very top of your initplayerlocal.sqf file!! 

3. [Client] Find your CfgRemoteExec, if its infistar it will be seperate, if not it might be in your description.ext
  Place the line of code marked with //start and //end in the correct place, it will match your other remoteExec calls

4. [Client] In your config.cpp file find class CfgExileCustomCode and add a new override (at the top of included file)
  //[XM8APPS] XM8 Scanner Pro Start
	ExileClient_object_lock_network_scanCodeLockResponse = "xm8apps\custom\ExileClient_object_lock_network_scanCodeLockResponse.sqf";
	//[XM8APPS] XM8 Scanner Pro End
	
5. [Client] In your config.cpp file find class CfgInteractionMenus and paste the interaction/addaction specific to which type
  of vehicle or object you would like this app to be used with.. For example if you want only vehicles only paste the two for car
  and air.. if you want to allow base objects and safes put those in the correct locations. Each one has a different type of requirement
  so use the correct ones included!!
  
6. [Server] Place/Compile the xm8apps_scans_Server/pbo in your server addons, right next to exile_server. If you want to allow more
  then 20 max scans(default) please make sure both the client and servers max scans match. (if you want to change these you will find them)
  
7. [Server] Modify ExileServer_object_lock_network_scanCodeLockRequest found inside the "Code" Folder 
  Add/Change what is inside //[XM8APPS] XM8 Scanner Pro Start and //END . Without doing these server steps CORRECTLY nothing will work!
  
8. [Server] Add what is inside exile.ini to the VERY BOTTEM of your exile.ini file that you use on your server the ; are comments
  Add these to the bottom of your file, no other changes needed, only additions

9. [Server] Open your database with whatever program you use, select your exile database and run the query inside the .sql file. 
  It will add the correct database tables to store UID and noScans. No you don't get a counter for how many added, I can be lazy.
  
10. If all steps done correctly, repack any pbos and fire up your server. Find or spawn in a Thermal Scanner Pro and open the app
  to test!
  
If you have any questions please double check all steps 3 times then ask on the thread!
