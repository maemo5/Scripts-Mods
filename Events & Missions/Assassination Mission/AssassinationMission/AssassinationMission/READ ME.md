
    Assassination Mission

    Author: Fresqo
	Edits for Exile by Fresqo and ♜ Ģօɾɱ էհε Ølძ
	
	Information:
	   This script was originally written by Fresqo for a Roleplay server but has now been adapted work on Exile.
	   It has been structured to work serverside with DMS however it could also be edited to work without it.
	
	Description: Assassination side mission
		Nikos spawns at one of the random start markers and walks to a random end marker.
		If anyone gets within a certain distance he goes into hiding.
		If he gets to his destination he goes into hiding and initiates the mission again.
		The aim is to snipe him, take his poptabs and item in his backpack and briefcase he drops and sell it.
		
	Installation:
	1. Navigate to and de-pbo your a3_dms.pbo found in @ExileServer\addons\
	2. Copy the Assassination folder into it.
	3. If you wish to configure any settings edit the fn_Assassin.sqf file in the folder and follow the instructions at the top.
	4. Add the following line to the bottom of your DMS_preinit.sqf file:
	
	// Initialize Assassination Mission
    [] execVM "\x\addons\DMS\Assassination\fn_initAssassin.sqf";
	
	5. Re-pbo your a3_dms.pbo
	6. Upload, start server and enjoy.
	
	NB: This script has developed some minor bugs since the last Exile update (1.0.4) and as a result Nikos may tend to not drop the briefcase and the toast stating who killed him may not be displayed. 
	I've been trying my best to to fix but no luck as of yet. 
	Apologies in advance. 
	- ♜ Ģօɾɱ էհε Ølძ
