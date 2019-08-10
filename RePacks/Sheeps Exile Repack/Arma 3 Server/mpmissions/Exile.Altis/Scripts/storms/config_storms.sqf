uiSleep 30;


_interval = 720; 														// How often the script will check required conditions to spawn the storms -- Default 10 mins
_randomInterval = true;													// Additional random amount of time to ontop of the interval time to call a storm
_randomIntervalTime = 360;												// Amount of time in seconds to be randomly added to the interval time

boltAmount = 25;														// Defines the amount of lightning strikes around a location each time the storm happens


strikeRadius = 150;														// Radius around the Storm center lightning bolts can strike
requiredRain = 0.5;														// Required rain level for storms to spawn

/*
	Warning message settings -- Format is Chat: Alpha: Bravo
	Example message players receive for the below settings -- Global chat: ELECTRICAL STORM WARNING: An intense electrical storm has been seen near: 081495
*/

warnPlayers = true;														// If true - players receive a warning of an incoming storm
stormMessageAlpha = "ELECTRIC STORM WARNING";							// First portion of the message
stormMessageBravo = "An intense electric storm has been detected near";	// Second portion of the message
showGridLocation = true;												// If true, the grid location of the storm is displayed in the warning message
messageNumber = 3;														// How many times you want the message to display
messageDelay = 2;														// Delay in seconds between each message
stormDelay = 30;														// Delay in seconds after the messages for the storm to start **THIS CANNOT EXCEDE YOUR INTERVAL SETTINGS**

stormMarker = false;													// Create a marker at the center of the storm

debugStorms = false;													// Removes delays for testing and removes conditions to activate storms

JohnO_fnc_storm = compileFinal preprocessFileLineNumbers "scripts\storms\JohnO_fnc_storm.sqf";

if (debugStorms) then
{	
	_interval = 30;
	diag_log format ["Debug active interval set to %1",_interval];
};

if (_randomInterval) then
{
	_interval = _interval + floor (random _randomIntervalTime);
};	

if (stormDelay >= _interval) then
{
	stormDelay = 0;
	diag_log format ["Storm delay is more than storm interval -- Storm delay:%1 Storm interval:%1 -- Removing storm delay",stormDelay,_interval];
};	

uiSleep 30;

[_interval, JohnO_fnc_storm, [], true] call ExileServer_system_thread_addtask;

diag_log format ["STORM SYSTEM ACTIVATED WITH [Storm interval:%1][Randomized Storm:%2][Bolt amount:%3][Strike Radius:%4][Required rain:%5][Warn players:%6][Show grid:%7][Show marker:%8]",_interval,_randomInterval,boltAmount,strikeRadius,requiredRain,warnPlayers,showGridLocation,stormMarker];