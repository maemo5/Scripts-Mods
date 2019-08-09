# Exile-Automated-Build
An automated build system for Arma 3 Exile and other mod servers

This is a simple system to automatically add edits to your Arma 3 server on restart. 
This prevents the administrator from having to be present when the server restarts,
and manually add PBO's and files. 

To set up, simply edit "autobuild.bat" to your liking, with any folders and files you wish 
to have backed up, packed into PBO's or imported to the server. Then on server restart,
trigger "autobuild.bat" This can be done by triggering it with Battleye extended controls,
and can replace whatever script you are using to kill the server. If you use any other 
method to restart the server (such as the built-in Exile restart) then you can trigger
this script via any other manner on restart (daemon tools, task scheduler, etc.) Simply 
make sure that this script executes AFTER server shutdown, and BEFORE server startup. 
It takes about a second to run, even with several files to handle, so it shouldn't be
too much trouble. 

It is recommended that you set up a staging server directory, and configure the 
script to copy the changes made to the staging area, to the live server directory. 
Whenever a new change is made, add the file or folder to the restart script, 
and it will be automatically transferred to the live server. 

Due it's nature, this script will obviously only be available to those using 
a dedicated server with full file system access. 
