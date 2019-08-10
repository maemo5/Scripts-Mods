# Enigma_Exile_Custom
Exile Serverside Custom Functions


Currently with exile there is no means of updating poptabs/respect of a player from clientside code that saves to the database. 

Say you wanted to add 10000 poptabs to a player - You could try and use:

_target = player;
			_playerscore = _target getVariable ['ExileScore', 0];
			_newscorevalue = _playerscore + 10000;
			
			_target setVariable ['ExileScore', _newscorevalue];
			
			_target setVariable['PLAYER_STATS_VAR',[_target getVariable ['ExileMoney', 0],_newscorevalue],true];
			ExileClientPlayerScore = _newscorevalue;
			(owner _target) publicVariableClient 'ExileClientPlayerScore';
			
			format['setAccountScore:%1:%2', _newscorevalue, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
The player would show that they have an extra 10k poptabs on xm8.....But this would NOT save to the database as call ExileServer_system_database_query_fireAndForget; is NOT a client recognised function. So once player logged off/server restarted they would roll back to their old amount of poptabs/respect.

This addon adds the ability to update any players poptabs/respect and save it to the database.



HOW TO INSTALL:

If your not running any extra addons folders the easiest way to run this is just adding the Enigma_Exile_Custom.pbo to the @ExileServer/Addons path where it will be loaded up automatically. Otherwise place into any addon folderpath that is loaded on the server!


HOW TO USE:


Then in any of your scripts that you run on a client you can simply run the following code:

//	_addrespect = Whatever total value you want it to be!		
//example --- _addpoptabs = 10000;

			_newScore = ExileClientPlayerScore + _addrespect;
			ENIGMA_UpdateStats = [player,0,_newScore];
			publicVariableServer "ENIGMA_UpdateStats";


//_addpoptabs = Whatever you want it to be!
//
example --- _addpoptabs = 10000;
			_newPoptabs = ExileClientPlayerMoney + _addpoptabs;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";


//You can remove respect or poptabs simply by changing the plus to a minus!
