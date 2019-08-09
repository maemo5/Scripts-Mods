/*
XM8 Portable Thermal Scanner Pro script made by Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/


This app will allow players to upload scans to their XM8/Database and then use them on vehicles only(really up to server admin on this)
If you have virtual scans and regular ThermalScannerPro in your inventory it will always use the real one first.

Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/

*/
 
private ["_passedInfo", "_scans", "_result", "_call", "_sessionId", "_player", "_scans2Save", "_hasScans", "_unit", "_MaxScans"];
_passedInfo = _this;
_scans = 0;
try 
{
    _call = _passedInfo select 0;
    _sessionId = _passedInfo select 1;
    _player = _passedInfo select 2;
    _scans2Save = _passedInfo select 3;
	
	_MaxScans = 20; //Set this to the same number as in your missionfile
	
	if (_scans2Save>_MaxScans) then 
	{
		diag_log format["Illegal Uploader: %1",_player];
		throw "Player tried to upload more then max scans!";
	};
	
	
    _hasScans = format ["playerHasScans:%1", getPlayerUID _player] call ExileServer_system_database_query_selectSingle;    
	
    if !(isNil "_hasScans") then {
        _scans = _hasScans select 0; //they have data from DB.. lets store it.
    };
	
    if(isNil "_hasScans") then {
		format["playerAddScanData:%1",getPlayerUID _player] call ExileServer_system_database_query_insertSingle; //add to database if they have nothing.
    };
	
    switch (_call) do {
        case "upload": {
			_scans = _scans2Save;
            format["playerAddScan:%1:%2", _scans2Save, getPlayerUID _player] call ExileServer_system_database_query_insertSingle; //I do all the additions clientside, simply replacing num

			//[_player, "notificationRequest", ["PartyInviteMessage", ["Uploaded Scans!"]]] call ExileServer_system_network_send_to; //uncomment to give player a message when they upload
        };
        case "use": {            
			format["playerUseScan:%1", getPlayerUID _player] call ExileServer_system_database_query_insertSingle; //subtracting one from DB
			
			//[_player, "notificationRequest", ["PartyInviteMessage", ["Used One Scan!"]]] call ExileServer_system_network_send_to;//uncomment to give player a message when they scan
        };
    }; 
	
    ScanCount = _scans;
    _unit = owner _player;
    _unit publicVariableClient "ScanCount";
}
catch
{
    format["[XM8APPSCANS]: Error: %1", _exception]  call ExileServer_util_log;
};