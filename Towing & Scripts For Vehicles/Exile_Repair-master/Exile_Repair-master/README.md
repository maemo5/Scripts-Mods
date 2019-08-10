# Exile_Repair
You need to Repair:
1 Ductape
1 Junkmetal

Time to repair ~22 seconds and not able to abourt

Next Version:

only repair Wheels (each Wheel 1 Ductape)
OR
Full Repair (Ductape , Junkmetal and other stuff)



Install:
Copy file to missionfile
goto config.cpp
find class CfgExileCustomCode 
add like this:

class CfgExileCustomCode 
{
	/*
	You can overwrite every single file of our code without touching it.
	To do that, add the function name you want to overwrite plus the 
	path to your custom file here. If you wonder how this works, have a
	look at our bootstrap/fn_preInit.sqf function.
	Simply add the following scheme here:
	<Function Name of Exile> = "<New File Name>";
	Example:
	ExileClient_util_fusRoDah = "myaddon/myfunction.sqf";
	*/
	
	ExileClient_object_vehicle_repair = "overwrites\exile_client\code\ExileClient_object_vehicle_repair.sqf"
	
};

repack and done 
