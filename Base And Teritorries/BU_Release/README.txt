Many thanks and credits to Shix and Taylor Swift
as I have learned a great deal from the apps the
two of them have released in the Exile forums.
The text part of this script was taken (with permission) directly 
from Shix's Info App, I take absolutely zero credit for this!

Enigma Exile UpdateRP By HappyDayz Required!!!!!!!!!
This will NOT work without it.
Find it here: https://github.com/happydayz-enigma/Enigma_Exile_UpdateRP

And obviously you need XM8Apps By Shix
Find it here: http://www.exilemod.com/topic/9040-xm8-apps/

If you have modified the respect required to upgrade bases
you will need to open fnc_upgrade.sqf and modify the price
and payout for each of the 9 upgrades. Be sure to scroll and get all of them!
You will also want to put your server's name there. (at top)
Then you will need to open baseLevel.sqf and edit the tet config
to match your priced and payouts. Prices are currently set at a 5:1 ratio.



Note: If you wish to use/modify any code you find in my scripts for your own, feel free to do so.
I require only one thing in return, learn something from it!
Just take note that i may for one reason or another sometimes 
directly use a part (with permission) of someone elses script.
In an event which i do this, I will make it known who's and which
script it is, and prefer you to ask them before using it.



To install simply drop the "BaseUpgrade" folder inside your "Apps" folder.

Then add the call into XM8Apps_Init.sqf like any other app.
Example:

//App 6
_app6Text = "Base Upgrades";
_app6Logo = "";							// sorry, I don't even graphics bro
app6_action = {
execVM "xm8Apps\Apps\BaseUpgrade\baseLevel.sqf";
};

If you're using battleye (which you should be!),
place the lines below in scripts.txt at the end of the line that begins with "7 ctrlCreate". (both are similar but i have been kicked for both during testing.)

!="chase Base Upgrade</t>\"]));\n\n_StructuredTextBox = _display ctrlCreate [\"RscStructuredText\", 1120];\n_StructuredTextBox ctrlSetPos"
!="hase Base Upgrade</t>\"]));\n\n\n_StructuredTextBox = _display ctrlCreate [\"RscStructuredText\", 1120];\n_StructuredTextBox ctrlSetPos"