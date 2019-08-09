# Reserved_Slots
## A little script that kicks players in reserved slots. Great if you are a busy server and need admin slots.

Join my Discord at http://discord.gamingatdeathsdoor.com if you have any problems.

Original by TheMeq.

Modified by [GADD]Monkeynutz

It's really simple.
Drop or merge the custom folder into your mission folder so that there is a reserved_slots folder inside of custom which 
will contain the slots.sqf (Exile.Mapname)

Put this into the init.sqf (If you don't have one, make a new one.)

[] execVM "custom\reserved_slots\slots.sqf";

Now edit slots.sqf with the following info:

Add UIDs to the list in the slots.sqf and modify the reserved slots amount by changing the total number of slots in 
your server to match your setup and then how many slots you want to be reserved for people.
e.g. you have 50 slots and want 5 reserved:

// Max Players of your server. MUST MATCH YOUR MAX SLOTS!
_server_maxplayers = 50;

// Reserved Slots. HOW MANY SLOTS YOU WANT TO BE RESERVED IN TOTAL!
_server_reservedslots = 5;

Re-PBO your mission file and start your server!
