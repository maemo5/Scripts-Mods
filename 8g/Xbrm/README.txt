Xbrm - Xtended base raiding mechaniX by: oSoDirty

Credits to w4rgo for original idea.

Installation: (All download files are structured cooresponding to their location in an Exile server)



Database: In Xbrm-Master / MySql: you will find Xbrm_db.sql. Run this as a query on the database of the server you wish to install this on.

In Xbrm-Master / @ExileServer / extDB / exile.ini: you will find the changes and additons needed for your exile.ini.



Serverside: Within Xbrm-Master / @ExileServer / addons: copy HEG_Xbrm.pbo into your serverside addons folder.

In Xbrm-Master / @ExileServer / addons / exile_server / code: copy and replace ExileServer_object_container_database_load.sqf (Make a backup to be safe!!!!)



Clientside: Within Xbrm-Master / mpmissions / Exile.mapName: copy the addons folder into the root of your mission file. (If you have an existing addons folder in your mission root already, just paste the contents of my addons folder into your existing folder.
Now just make the edits found in config.cpp, description.ext, and init.sqf all found in Xbrm-Master / mpmissions / Exile.mapName and you're all done!