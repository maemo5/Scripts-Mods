




::Put your server executable name here
:: This is used if you are using this batch file to actually kill the server, such as from BEC. 
:: If you use a different method to bring down the server, such as the restart functionality built into Exile,
:: Then you must trigger this file in some other manner (daemon tools, windows scheduled tasks, etc)
:: If you do not wish to use this functionality, add two colons to the beginning of the following line to comment it out (like this one)
taskkill /im arma3server.exe

:: Give the server a bit of time to shut down
timeout 10

:: Auto Backup Files
:: Here we are going to use the syntax Copy "My File Path" "My Backup Folder and desired file name Path" 
:: Example: 
:: copy "C:\Server Directory\mpmissions\Exile.Altis.pbo" "F:\Backup Folder\Exile.Altis.backup"

:: Replace this path with your server's configuration. Multiple files are allowed. Simply place them in their own line one at a time. 

copy "C:\Server Directory\mpmissions\Exile.Altis.pbo" "C:\Backup Folder\Exile.Altis.backup"
copy "C:\Server Directory\@ExileServer\addons\exile_server_config.pbo" "C:\Server Directory\@ExileServer\addons\exile_server_config.pbo"





:: Auto Pack PBO Files
:: This requires PBO Manager to be installed on the server machine. 
:: Here we will put the path to the PBOConsole.exe path (usually doesn't need to be changed unless you installed PBO Manager to a different folder than default
:: Followed by '-pack'
:: Followed by the folder you want to pack up in quotes
:: Followed by the path and file name of the final packed folder in quotes
:: Example:
::"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "F:\Server Directory\mpmissions\Exile.Altis" "F:\Server Directory\mpmissions\Exile.Altis.pbo"

:: Replace this with any folders you wish to be automatically packed into a PBO file on restart. 

"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Server Directory\mpmissions\Exile.Altis" "C:\Server Directory\mpmissions\Exile.Altis.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Server Directory\@ExileServer\addons\exile_server_config" "C:\Server Directory\@ExileServer\addons\exile_server_config.pbo"






:: Import new configs
:: Use this to make edits to files not in PBO's, and deploy them on restart. 
:: This simply copies a file to another location, just like the backup script. 
:: Make a "Staging folder" and copy your files (such as your config.cfg) into that folder. 
:: On restart, this will copy from your staging folder into the server folder. 
:: If you wish to make edits to one of these files, make the edits in the staging file, and it will be copied over on restart. 
:: Replace this with the path to the file you want to copy, followed by the path to its FOLDER in the server directory. 

copy "C:\Config Staging\config.cfg" "C:\Server Directory\@ExileServer"


:: Give the server a bit of time to start up
timeout 120


:: start BEC
:: This is optional. If you use Battleye Extended Controls for your restart, you can use this to make sure BEC starts back up after server restart. 
:: Replace becpath with the path to your BEC folder
:: Then replace "startbec.bat" with the name of your BEC start batch file
:: If you do not want to use this, delete the entire block of code below, or put two colons at the beginning of each line to comment it out (like this line) 

set becpath="C:\Bec"
cd /d %becpath%
start "StartBEC" "startbec.bat"


::
timeout 3

cls
@exit