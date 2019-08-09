# ACME_TNT - for Exile
>Terrible Nuke Territory - This script bombs randomized or static locations on your map.                              
>powered by ACME - Admins Can Manipulate Everything                                                                   
> Version 0.91
***
First of all
### CREDITS

                                                                                                               
 This is an adaption from "mmmyum's animated air raid dayz"
 So all credits for this goes to mmmyum                                                                        
***                                                                                                             
 #### Special thanks to:                                                                                            
 >   **$p4rkY** --> because he is my Mentor                                                     
 >   **adR1** --> because he is my testing and translation guy                                   
 >   **Eichi** --> for helping with the TraderZone detection                     
 >   **Squanchy** --> for beta-testing the files and pointing to some errors                                         
 >   **My wife** --> for making awesome coffee                                                                                
 >   **Saecco Minuto** --> because thats the reason why my wife could make such awesome coffee                             
 >   **Kids** --> dont forget the Kids
***
### INSTALLATION

This step is very hard, so if you are not familiar with scripting or setting up an arma 3 server with exile, I advise you to not install this on your server.....!

Just joking...

#### Step 1
Download the File, open **__ACME_TNT.pbo\server\ACME_TNT.sqf__** and read the Setup-Part between line 30 and 90. change the setups to your wishes and needs. If you dont want to use random locations you need to change line 75 to 79 for the static location. For now it is set to Balota airstrip on Chernarus.
If you are using DMS - Missions AI you need to check the freeze option in the config of DMS. If ***DMS_ai_freeze_Only_DMS_AI*** is false, the bomber will not bomb his target until a player is near to him to unfreeze him...

#### Step 2
Pack the folder into a pbo. Upload the **__ACME_TNT.pbo__** into **__@ExileServer\addons__**

#### Step 3 
Step 3a 

add the following code to your discription.ext / class CfgRemoteExec to improve an error in rpt while bomber is deleted by the script:                                                                             
```c++ 
class BIS_fnc_effectKilledAirDestruction { allowedTargets=2; };
```                                                                                                        

So it should look like this                                                                                                

```c++
class CfgRemoteExec
{
    class Functions
    {
        mode = 1;
        jip = 0;

        class ExileServer_system_network_dispatchIncomingMessage
        {
            allowedTargets = 2;
        };
        class BIS_fnc_effectKilledAirDestruction { allowedTargets=2; };
    };

    class Commands
    {
		mode = 0;
		jip = 0;
    };
};
```                                                                                                                             
If you are using infiSTAR you need to add this line to your CfgRemoteExec.hpp instead of discription.ext

Steb 3b

If you like to have sounds of hooting sirens, put the Folder **__Sounds__** to your mission.pbo (for example **__Exile.Altis.pbo__**) Otherwise skip ***Step 4*** and go to **__ACME_TNT.pbo\server\ACME_TNT.sqf__** , set on line 69 _ambientSound to **__false__**.

#### Step 4
Open your **__discription.ext__** and add the following lines to it. If you already have an existing **__CfgSound__**, merge it to that one...
```c++
            class CfgSounds
            {
                sounds[] = {drop,siren1,siren2,siren3};
                class drop
                {
                  name="drop";
                  sound[]={"@a3\data_f_curator\sound\cfgsounds\incoming2.wss",db+10,1};
                  titles[] = {};
                };
                class siren1
                {
                  name="siren1";
                  sound[]={\Sounds\siren1.ogg,db+6,1};
                  titles[] = {};
                };
                class siren2
                {
                  name="siren2";
                  sound[]={\Sounds\siren2.ogg,db+6,1};
                  titles[] = {};
                };
                class siren3
                {
                  name="siren3";
                  sound[]={\Sounds\siren3.ogg,db+6,1};
                  titles[] = {};
                };
            };
```

The script was original made for Chernarus, but you can use it on every map with random locations without any changes. Only thing, if you want to have a static location, you need to set it up. You will see what you need to change by looking to ACME_TNT.sqf.... 

Hope you have fun with it
