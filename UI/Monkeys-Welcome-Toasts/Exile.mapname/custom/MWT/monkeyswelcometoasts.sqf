/*		
	Script name: Monkey's Welcome Toasts
	Author: [GADD] Monkeynutz
	Description: Fully customizable welcome messages.
	Liscence: You are free to edit the script as you please. Steal it from my mission file/download it or what ever,
	just edit what you want and if you have questions, come and ask me on TeamSpeak: ts3.gamingatdeathsdoor.com or 
	www.gamingatdeathsdoor.com on my forums. Don't distribute it to other people under your own name. Send them to
	my download links on the Exile Forums.
*/

private ["_servername","_serverclantag","_website","_teamspeakip","_donatelink","_generaltitlecolor","_generaltextcolor","_generaltoastcolor","_importanttitlecolor","_importanttextcolor","_importanttoastcolor"];

//	Modify the below variables to what you want to be displayed as messages to players.

_servername = "Gaming At Death's Door";
_serverclantag = "[GADD]";
_website = "gamingatdeathsdoor.com";
_teamspeakip = "ts3.gamingatdeathsdoor.com";
_donatelink = "donate.gamingatdeathsdoor.com";

//	The colors can be edited below and there is a great tool I recommend you use to get the color codes designed by |GITS|Root here: https://arma3rgb.com
//	^ Website is in beta so dont judge

//General toast colors for normal messages

_generaltitlecolor = "#f47cff"; 
_generaltextcolor = "#fffa00"; 
_generaltoastcolor = [0, 1, 0.58, 1];

//Important colors below (used for rules info etc. to stand out)

_importanttitlecolor = "#ff0000"; 
_importanttextcolor = "#6aff2b"; 
_importanttoastcolor = [1, 0.39, 0.17, 1];

waitUntil{!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};  

if ( alive player ) then {

  	uiSleep 15;
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Hello, %2!</t><br /> 
	<t size='22' font='PuristaMedium' color='%3'>And Welcome to %4 %5!</t>",_generaltitlecolor, name player, _generaltextcolor, _servername, worldName], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Join Our TeamSpeak!</t><br />
	<t size='21' font='PuristaMedium' color='%2'>%3</t>", _generaltitlecolor, _generaltextcolor, _teamspeakip], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Visit Our Website!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>%3<br />To keep up to date with our rules and information!</t>", _generaltitlecolor, _generaltextcolor, _website], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Consider Donating?</t><br />
	<t size='20' font='PuristaMedium' color='%2'>%3<br />Spare change is much appreciated!</t>", _generaltitlecolor, _generaltextcolor, _donatelink], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server Rules!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Our server rules are displayed and updated on our Forums!</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server Rules!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>There is a link to the rules in the XM8 app >> 'Rules and Info'</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server Rules!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>All of our rules are to be followed even if you haven't read them!</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server Information!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Any information you might like to know about is also on our forums...</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 15;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Server Information!</t><br /> 
	<t size='22' font='PuristaMedium' color='%2'>Just follow the link in the XM8 app!</t>", _importanttitlecolor, _importanttextcolor], _importanttoastcolor] call ExileClient_gui_toaster_addToast; sleep 30;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Customizable StatusBar!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Check out the XM8 app!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Customizable View Distance!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Want to see further? Or sick of the Lag? Change your view distance in the XM8 App!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Depoly Vehicles!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Deploy a bike for free or a quad for that junk metal you're carrying to get around faster!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 60;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Revive players!</t><br />
	<t size='20' font='PuristaMedium' color='%2'>Revive your friends with a defibrillator! If you have no friends, you can respawn faster by pressing esc when dead!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 300;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Virtual Garage!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Set up a territory and within it, access the Virtual Garage XM8 app to store your vehicles safely away!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 300;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Building Recepies!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Don't know how or what to build next? Check out the XM8 app for recepies!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 300;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Load and Sell!</t><br />
	<t size='22' font='PuristaMedium' color='%2'>Crates can be loaded into certain vehicles and unloaded, then dropped infront of the waste dump to sell the contents! Grab the money from it after!</t>", _generaltitlecolor, _generaltextcolor], _generaltoastcolor] call ExileClient_gui_toaster_addToast; sleep 300;
	
	[format ["<t size='30' font='OrbitronMedium' color='%1'>Lastly!</t><br /> 
	<t size='22' font='PuristaMedium' color='%2'>Thank you for playing %3, %4! We hope to see you more often!</t>", _generaltitlecolor, _generaltextcolor, _serverclantag, name player], _generaltoastcolor] call ExileClient_gui_toaster_addToast;
};
