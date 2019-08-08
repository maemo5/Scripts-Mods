# XCSV's Exile Scripts Mods & Tools Collection
> Credits Will Be Given When Credits Can Be Gathered.


![](header.png)

## Installation

Instructions For Most Mods & Scripts Inside Folders :

<a href="https://github.com/XCSVs/Scripts-Mods/blob/master/INSTRUCTIONS/Exile%20Server%20Owner%20Guide%20v1.7.pdf
">Full Server Install Instructions Here</a>

BACKING UP MYSQL: HOW TO AUTOMATICALLY BACKUP ALL MYSQL DATABASES ON WINDOWS WITH A BATCH FILE.


 Typically we have used the backup facility built into MySQL administrator, which unfortunately has now reached end of life. While it worked well it had some major shortcomings. For example once you created a scheduled backup it would only include the databases you told it to at the time of creation.
  Well, if you are like us and you constantly add new databases the new ones simply wouldn’t be backed up, Annoying. What replaced MySQL administrator? Enter the new MySQL Workbench. Great tool save one missing feature, they decided to no longer support scheduled MySQL backups.

Obviously there are lots of scripts out there and easier solutions for linux based systems. The only windows solutions seemed to use php which seemed overly complex, relied on unnecessary systems that could fail, and introduced security concerns when you could use a simple batch file with a few lines of code to accomplish the same task. 
I had little luck Googling solutions on how to backup all the databases individually, zip them into one file, and delete the older archives so I sat down and wrote my own batch file. It was so useful to us that I feel compelled to share it with others. It should work on any version of windows x86 or x64 and any version of MySQL.


## FEATURES:

NO COST DIY SOLUTION
BACKUP ALL MYSQL DATABASES, INCLUDING ALL NEWLY CREATED ONES AUTOMATICALLY
CREATE AN INDIVIDUAL .SQL FILE FOR EACH DATABASE (GOD SEND WHEN RESTORING)
ZIP ALL THE .SQL FILES INTO ONE ZIP FILE AND DATE/TIMESTAMP THE FILE NAME TO SAVE SPACE
AUTOMATICALLY DELETE MYSQL BACKUPS OLDER THAN N DAYS (SET TO HOWEVER MANY DAYS YOU LIKE)
FTP YOUR BACKUP ZIP TO A REMOTE LOCATION
HIGHLY SUGGEST YOU ALSO SETUP A SCHEDULED TASK TO BACKUP YOUR MYSQL DIRECTORY AND YOUR NEW BACKUP FOLDER TO AN OFF SITE LOCATION
SETUP INSTRUCTIONS:
Right click and edit mysqlbackup.bat file in notepad
Set the backupdate format, whatever your preference, mine is yyyy-mm-dd-m-s ( I have not tested other variants)
Set the root u/p (or user with adequate permissions)
Set the MySQL data directory to match your install
Set the path to your mysqldump.exe to match your install path
Set the destination of the backups should go, make sure there are write permissions obviously
Set the path to your zip application with it’s flags/commands to zip an item, I am using the command line version of 7zip which is free.
Update the path where your backups will be saved and then deleted once zipped
Set the number of days to keep backups, using the win program “Forfiles” for this, mine is set to 30 days “-30”
Test your batch file on a dummy directory. You’ll see the backup directory fill up with .sql files, then a timestamped zip file is made, and the directory is cleared. Put some files older than 30 days in there and they will be wiped at the end.
Finally create a scheduled task in windows to run the batch file on a schedule, remember to choose “Run whether user is logged on or not” otherwise it will fail.
 


```sh
Basic Troubleshooting tips:

IMPORTANT NOTE: UPDATED 3.14.2013 IF YOU GET AN ERROR IN THE COMMAND PROMPT STATING
“MYSQLDUMP: UNKOWN OPTION ‘–NO-BEEP’ THIS IS DUE TO YOUR MY.INI FILE HAVING AN INVALID OPTION UNDER [CLIENT].
OPEN YOUR MY.INI FILE FIND THE [CLIENT] SECTION AND COMMENT OUT 
#NO-BEEP WITH A HASH, RE-RUN THE BAT FILE AND IT WILL WORK.
THIS ERROR HAS NOTHING TO DO WITH THIS SCRIPT, YOU’D GET THE SAME ERROR IF YOU RAN MYSQLDUMP.EXE DIRECTLY.
I BELIEVE THAT MYSQL ADMIN ADDS THAT LINE TO THE INI FILE WHEN INSTALLED, THANKS ORACLE.
80% OF THE “DIDN’T WORK FOR ME” ISSUES TEND TO BE RESOLVED BY TRIPLE CHECKING THAT YOUR DIRECTORY PATHS EXIST AND ARE CORRECT.
```

 

To save you some time I zipped up all the necessary files including the 7zip.exe app with the folder structure to match the batch file. Simply unzip and update your specific paths in the .bat file and you’re done.


<a href="https://www.redolive.com/downloads/Auto-MySQL-Backup-Win-1.5.zip
">BACKUP .BAT DIRECT DOWNLOAD</a>


Here is a quick look at the .bat file:


```sh

:: If the time is less than two digits insert a zero so there is no space to break the filename

:: If you have any regional date/time issues call this include: getdate.cmd  credit: Simon Sheppard for this cmd - untested
:: call getdate.cmd

set year=%DATE:~10,4%
set day=%DATE:~7,2%
set mnt=%DATE:~4,2%
set hr=%TIME:~0,2%
set min=%TIME:~3,2%

IF %day% LSS 10 SET day=0%day:~1,1%
IF %mnt% LSS 10 SET mnt=0%mnt:~1,1%
IF %hr% LSS 10 SET hr=0%hr:~1,1%
IF %min% LSS 10 SET min=0%min:~1,1%

set backuptime=%year%-%day%-%mnt%-%hr%-%min%
echo %backuptime%



:: SETTINGS AND PATHS 
:: Note: Do not put spaces before the equal signs or variables will fail

:: Name of the database user with rights to all tables
set dbuser=root

:: Password for the database user
set dbpass=youradminpassword

:: Error log path - Important in debugging your issues
set errorLogPath="c:\MySQLBackups\backupfiles\dumperrors.txt"

:: MySQL EXE Path
set mysqldumpexe="C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe"

:: Error log path
set backupfldr=c:\MySQLBackups\backupfiles\

:: Path to data folder which may differ from install dir
set datafldr="C:\ProgramData\MySQL\MySQL Server 5.5\data"

:: Path to zip executable
set zipper="c:\MySQLBackups\zip\7za.exe"

:: Number of days to retain .zip backup files 
set retaindays=5

:: DONE WITH SETTINGS



:: GO FORTH AND BACKUP EVERYTHING!

:: Switch to the data directory to enumerate the folders
pushd %datafldr%

echo "Pass each name to mysqldump.exe and output an individual .sql file for each"


:: turn on if you are debugging
@echo off

FOR /D %%F IN (*) DO (

IF NOT [%%F]==[performance_schema] (
SET %%F=!%%F:@002d=-!
%mysqldumpexe% --user=%dbuser% --password=%dbpass% --databases --routines --log-error=%errorLogPath% %%F > "%backupfldr%%%F.%backuptime%.sql"
) ELSE (
echo Skipping DB backup for performance_schema
)
)

echo "Zipping all files ending in .sql in the folder"


:: .zip option clean but not as compressed
%zipper% a -tzip "%backupfldr%FullBackup.%backuptime%.zip" "%backupfldr%*.sql"


echo "Deleting all the files ending in .sql only"
 
del "%backupfldr%*.sql"

echo "Deleting zip files older than 30 days now"
Forfiles -p %backupfldr% -s -m *.* -d -%retaindays% -c "cmd /c del /q @path"


::FOR THOSE WHO WISH TO FTP YOUR FILE UNCOMMENT THESE LINES AND UPDATE - Thanks Kamil for this addition!

::cd\[path to directory where your file is saved]
::@echo off
::echo user [here comes your ftp username]>ftpup.dat
::echo [here comes ftp password]>>ftpup.dat
::echo [optional line; you can put "cd" command to navigate through the folders on the ftp server; eg. cd\folder1\folder2]>>ftpup.dat
::echo binary>>ftpup.dat
::echo put [file name comes here; eg. FullBackup.%backuptime%.zip]>>ftpup.dat
::echo quit>>ftpup.dat
::ftp -n -s:ftpup.dat [insert ftp server here; eg. myserver.com]
::del ftpup.dat

echo "done"

::return to the main script dir on end
popd

```



## Contact Me @

Mr. Sage – [@NeoGryph](https://twitter.com/NeoGryph) – mrsage@xcsv.tv

Discord [@mrsage](https://discord.gg/tvhquY6)

[https://github.com/XCSVs/Scripts-Mods](https://github.com/XCSVs)