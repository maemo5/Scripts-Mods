WARNING! This DOES NOT include all the files from engima revive. Credit for this addon belongs to the author. You may get the full mod and information in regards to it here: https://github.com/HAPPY3N1GMA/Enigma_Exile_Revive

To get Enigma Revive to work with MultiMap, you will need to perform one of the 2 options below:

Easy Option
1. Copy the included 'enigma_exile_revive.pbo' and overwrite '@Engima\Addons\enigma_exile_revive.pbo' (Possibly in your @exileserver\addons folder)

Manual Option
1. Unpack @Engima\Addons\enigma_exile_revive.pbo (Possibly in your @exileserver\addons folder)
2. Open 'enigma_exile_revive\compile\Enigma\Exile_RevivePlayer.sqf'
3. Change the following lines:
From:
```SQF
Line 270: 
	_playerID = format["createPlayer:%1:%2", _player getVariable ["ExileOwnerUID", "SomethingWentWrong"], _player getVariable ["ExileName", "SomethingWentWrong"]] call ExileServer_system_database_query_insertSingle;

Line 314-317:
	_player getVariable ["ExileWetness", 0],
	_playerID,
	worldName
];
```

To:
```SQF
Line 270:
	_playerID = format["createPlayer:%1:%2:%3", _player getVariable ["ExileOwnerUID", "SomethingWentWrong"], _player getVariable ["ExileName", "SomethingWentWrong"],worldName] call ExileServer_system_database_query_insertSingle;

Line 314-318:
	_player getVariable ["ExileWetness", 0],
	_playerID,
	worldName
];
```
