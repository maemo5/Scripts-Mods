 ## Installation:
>
> 1.	Drop the bootstrap, core, holdactions, dialogs and Exile_Client_Overrides folders + the >  CfgFunctions.cpp, CfgExileScavange.cpp, CfgScavengeRecipes.cpp, CfgExileHoldActions.cpp files into the root of your mission directory.
> 2.	Merge the content of the provided description.ext with your Exile missions description.ext.
>
> So it looks like this for example:
>
>	  // Add this on the end of your missions description.ext
>	  #include "CfgFunctions.cpp"
>	  #include "CfgRemoteExec.cpp"
>	  #include "CfgScavengeRecipes.cpp"
>	  #include "CfgExileScavenge.cpp"
>	  #include "CfgExileHoldActions.cpp"
>
>	  // Just add this if you dont have already a RscTitles class within your mission!
>	  #include "CfgDialogs.cpp"
>
>	  // If you dont have any ExileCustommCode entrys yet
>	  #include "CfgExileCustomCode.cpp"
>
>
> 3.   Merge the content of the provided CfgDialogs.cpp with your missions RscTitles class.
>
> So it looks like this for example:
>
>	  class RscTitles
>	  {
>	       class Default
>	       {
>	           idd = -1;
>	           fadein = 0;
>	           fadeout = 0;
>	           duration = 0;
>	       };
>	       // Scavenge system
>	       #include "dialogs\ExileScavengeUI.hpp"
>	   };
>
>      If you dont have any RscTitles class within your mission then just include the provided CfgDialogs.cpp in your missions description.ext.
>
>
> 4.   Merge the content of the provided CfgRemoteExec.cpp with your missions CfgRemoteExec class. Normaly this class is inside your missions description.ext.
>
> So it looks like this for example:
>
>	  class CfgRemoteExec
>	  {
>		class Functions
>		{
>			mode = 2;
>			jip = 0;
>			class fnc_AdminReq 												{ allowedTargets=2; };
>			class ExileServer_system_network_dispatchIncomingMessage 		{ allowedTargets=2; };
>			class ExileExpansionServer_system_scavenge_spawnLoot			{ allowedTargets=0; };
>		};
>		class Commands
>		{
>			mode=0;
>			jip=0;
>		};
>	  };
>
>
> 5.	Open your mission config.cpp find the class CfgExileCustomCode and add this into the class:
>
> So it looks like this for example:
>
>	  ////////////////////////////////////
>	  //	Exile Client Overrides
>	  ///////////////////////////////////
>	  // Custom player client init
>	  ExileClient_object_player_initialize = "Exile_Client_Overrides\ExileClient_object_player_initialize.sqf";
>
>     If you dont have any CfgExileCustomCode entrys yet within your mission then you can also just include the provided CfgExileCustomCode.cpp in your missions description.ext.
>	  Delete the CfgExileCustomCode class in the main exile confip.cpp if you do so then!
>
>
> 6.	Edit the CfgExileScavange.cpp to suit your server.
>
>	  Enjoy :)
>

> ## Thanks and Credits:
> Thanks and Credits:<br />
> Credits to Larrow for the base script: https://forums.bistudio.com/forums/topic/184456-looting-trash-piles-bins/?do=findComment&comment=2942397<br />
> Credits to Kurewe for the first port and rewrite for the exile mod.<br />
> Credits to oldmatechoc for a base rewrite and port for the exile mod.<br />
> Credits to yukihito23 for plenty amount of help, expansions and additions of the system.<br />
> Credits to NiiRoZz for plenty amount of help, expansions, additions and optimizations of the system.<br />
> Credits to Salutesh for a complete rewrite and buildup of the framework and system.
