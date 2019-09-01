
# Apoc's Airdrop Assistance XM8 App
This app allows you to call in chopper-carried airdrops of supplies or vehicles.  You can configure as many aidrops as you'd like, with as many categories as you'd like.


#Install Instructions (ExAd Version)

1) Install ExAd, w/ XM8 Plugin (You currently need the Dev version, due to a ComboBox function)

2) Copy the client folder from the Airdrop Github to the Apps folder.

3) From the config.cpp in the Airdrop Github, you need to add the ExAd_APOC_Airdrop class to the CfgXM8 class within your mission config.cpp

4) You'll need to PBO the exad_apoc_airdrop folder from within the @ExileServer\addons  and drop it into your server's ExileServer\addons folder.

5) PROFIT

#Config Notes

You can set the respect threshold for each drop.  That is the last numeric field in the included file.  If you leave that field out, the script will treat it as if there is no respect threshold.  Or so it should. :)

You can copy your old configs over to the new system.  You just have to make sure you leave the header and such in the new file.  As well as line 11, #include "functions.sqf"
