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
 

Basic Troubleshooting tips:

IMPORTANT NOTE: UPDATED 3.14.2013 IF YOU GET AN ERROR IN THE COMMAND PROMPT STATING “MYSQLDUMP: UNKOWN OPTION ‘–NO-BEEP’ THIS IS DUE TO YOUR MY.INI FILE HAVING AN INVALID OPTION UNDER [CLIENT]. OPEN YOUR MY.INI FILE FIND THE [CLIENT] SECTION AND COMMENT OUT #NO-BEEP WITH A HASH, RE-RUN THE BAT FILE AND IT WILL WORK. THIS ERROR HAS NOTHING TO DO WITH THIS SCRIPT, YOU’D GET THE SAME ERROR IF YOU RAN MYSQLDUMP.EXE DIRECTLY. I BELIEVE THAT MYSQL ADMIN ADDS THAT LINE TO THE INI FILE WHEN INSTALLED, THANKS ORACLE.
80% OF THE “DIDN’T WORK FOR ME” ISSUES TEND TO BE RESOLVED BY TRIPLE CHECKING THAT YOUR DIRECTORY PATHS EXIST AND ARE CORRECT.
 

To save you some time I zipped up all the necessary files including the 7zip.exe app with the folder structure to match the batch file. Simply unzip and update your specific paths in the .bat file and you’re done.


<a href="https://www.redolive.com/downloads/Auto-MySQL-Backup-Win-1.5.zip
">BACKUP .BAT DIRECT DOWNLOAD</a>


```sh
make install
npm test
```

## Release History

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * CHANGE: Remove `setDefaultXYZ()`
    * ADD: Add `init()`
* 0.1.1
    * FIX: Crash when calling `baz()` (Thanks @GenerousContributorName!)
* 0.1.0
    * The first proper release
    * CHANGE: Rename `foo()` to `bar()`
* 0.0.1
    * Work in progress

## Meta

Mr. Sage – [@NeoGryph](https://twitter.com/NeoGryph) – mrsage@xcsv.tv



Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/XCSVs/Scripts-Mods](https://github.com/XCSVs)