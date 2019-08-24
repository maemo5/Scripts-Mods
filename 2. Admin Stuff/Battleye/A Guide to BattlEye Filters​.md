###A Guide to BattlEye Filters​
I noticed a severe lack of information on BattlEye across Arma and DayZ modding communities. This guide will give an overview of BE filters, BEServer.cfg and automatic banning with BE.

###What they are:
BE filters are an optional feature of BattlEye Anti-Cheat for Arma games. They provide some additional protection that is customizable by mod makers and server admins. Currently Bastian ($able) is the sole developer of BE for Arma. However, other Bohemia devs like Dwarden contribute ideas for him to implement. Dwarden also made the original filters for DayZ mod a few years ago.

Mod developers usually provide filters with their server files. Below are links to current filters for popular DayZ mods:
DayZ Epoch
DayZ Mod
DayZ Overwatch
Infistar also maintains filters for compatibility with his antihack. Place the .txt files in your dedicated server config directory\BattlEye\ folder. If you are using a managed host this will usually be accessible through FTP.

###How they work:
BE searches all scripts running on the client (scripts.txt) and specific command parameters (other filters) for the keywords provided in the filter .txt files. If a match is found it can take one of the following actions:

```
1 = Log to .log file only
2 = Log to console only
3 = Log to both
4 = Kick with no log
5 = Kick and log to .log file only
6 = Kick and log to console only
7 = Kick and log to both
```

Console refers to the window which opens when running the Arma server.exe. The console always shows all connects, disconnects and kicks. Its output is saved in a .txt file in the config directory if logFile option is set in server.cfg. It is also visible when connected over Rcon.

Logging to .log is recommended because it creates separate .log files in the \BattlEye\ folder for each restriction type. This makes it much easier to review than one large console log file with all types mixed together.

Logging to console is only useful if a live stream of BE logs is needed over Rcon. Beware it increases server resource usage, especially when streaming frequently written to logs. It also tends to flood Rcon and make connect, disconnect and kick messages difficult to read. For this reason logging to console is not advised unless your filters are configured to log very little. It should also be noted logging to both console and .log with logFile set in server.cfg is writing the same data to disk in two different files.

Adding keywords:
On a new line add the number followed by a single space and a keyword:
5 keyword

If a keyword contains spaces it must be enclosed in double quotes:
5 "key word"

If a keyword contains double quotes " they must be preceded by a \ like so:
5 "key \"word\""

If a keyword contains regex metacharacters ({}[]()^$.|*+? and \) they must also be preceded by a \ like so:
5 "key \(word\)"

Note: The one exception to this rule is scripts.txt. Currently it is the only filter that does not support regex. It will be added later according to Bastian. This means the only characters that need to be preceded with a \ in scripts.txt are ", \ and line breaks for now.

Use keywords that catch multiple strings when possible. For example, say in createVehicle.txt you want to kick for spawning humvees. Instead of adding a keyword for each class name like this:
5 HMMWV_DES_EP1
5 HMMWV_M1035_DES_EP1
5 HMMWV_Ambulance_DES_EP1
...

It is more efficient to use a single keyword that covers all humvees:
5 HMMWV_

To catch everything use empty double quotes for the keyword "" or leave it blank:
5 ""

Adding exceptions (fixing unwanted kicks):
On the same line add a single space after the keyword. Then add either != or ! with the exception:
5 keyword !keywordException

Exceptions follow the same rules as keywords. If an exception contains spaces it must be enclosed in double quotes:
5 keyword !"keyword exception"

If an exception contains double quotes " they must be preceded by a \ like so:
5 "key word" !"key word \"exception\""

If an exception contains regex metacharacters ({}[]()^$.|*+? and \) they must also be preceded by a \ like so:
5 keyword !"keyword \(exception\)"

Note: Again this regex rule does not apply to scripts.txt.


The two options for exceptions are:
!= The parameter must exactly match the exception. In scripts.txt the entire statement the keyword is found in must exactly match the exception.
! The parameter must contain the exception. In scripts.txt the statement the keyword is found in must contain the exception.

For example, if this is our createvehicle.txt filter:
5 "HMMWV_" !"HMMWV_Ambulance"

The code example below will not kick because the type parameter contains HMMWV_Ambulance which is an exception:
createVehicle ["HMMWV_Ambulance_DES_EP1",getPosATL player,[],10,"NONE"];

The code example below will kick because the parameter does not contain HMMWV_Ambulance:
createVehicle ["HMMWV_DES_EP1",getPosATL player,[],10,"NONE"];

If we change our filter to use != like so:
5 "HMMWV_" !="HMMWV_Ambulance"

Now both of the above code examples will kick because the parameters are not exact matches to HMMWV_Ambulance. The below code example will not kick because it is an exact match:
createVehicle ["HMMWV_Ambulance",getPosATL player,[],10,"NONE"];

Exceptions work differently in scripts.txt as noted above. For example, if this is our filter in scripts.txt:
5 keyword !=keywordException

The code example below will kick because the exception is not an exact match to the statement:
systemChat "keywordException";

To fix we need to change the filter to include the entire statement as an exception:
5 keyword !="systemChat \"keywordException\";"

Now the above code example will not kick.

Note: Statements can span multiple lines. For example:
Code:
if (2 > 1) then
{
    systemChat "keywordException"
};
There is no semicolon ; on the end of the systemChat line, so the above code still kicks. Line breaks can be escaped with \n:
5 keyword !="if (2 > 1) then\n{\nsystemChat \"keywordException\"\n};"

The filter could also be changed to use ! instead of != so the statement the keyword is found in must only contain the exception:
5 keyword !keywordException
Now both of the above code examples will not kick.

In general exceptions should be written with != when ever possible. Using ! allows much more through the filter. There are some exceptions to this, such as the createvehicle.txt HMMWV_Ambulance example above. In that case it is more efficient to use a single ! exception to allow multiple class names, rather than multiple != exceptions. Many more fancy things can be done in filters that support regex. To learn more about regex check this out.

Note: BE filters are not case sensitive, but they are sensitive to single spaces and line breaks. Tabs are automatically stripped out in scripts.txt.

Below is a walk through of each filter file in this format:
filename.txt:
[Filters] Which command(s) parameter(s) are searched for keywords
[Kick] Suggested keywords to kick and log (5)
[Log] Optional keywords to log (1). Opting to log extra keywords may provide more information for identifying cheaters and monitoring server activity. The trade off is larger logs to review, extra resource usage from searching for more keywords and more writes to disk.
[Logs] Additional info the log file shows
[Abuse] How the command(s) can be abused by cheaters (if no other prevention is in place)