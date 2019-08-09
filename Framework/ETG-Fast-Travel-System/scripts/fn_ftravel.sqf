/*
    Filename:         fn_ftravel.sqf
    Author:         Kellojo, updated for Exile by Pattoh.
    Description:     Fast Travel main function - Part of the ETG script collection
*/

_mode = [_this, 0, 0, [0]] call BIS_fnc_param;
_dest = [_this, 1, "", [""]] call BIS_fnc_param;

//Modify these to change the price, travel time and the locations you can travel to
_distPriceMult = 0.08; //(price = distance * _distPriceMult)
_distTimeMultip = 10; //(time = distance * _distTimeMultip)
_Citys = ["YOURMarker","YOURMarker","YOURMarker","YOURMarker"];    //These have to be markers! - Marker names will be displayed as the name of the location

//lb sel change
if (_mode == 1) exitwith {
    _index = lbCurSel 147413;
    disableSerialization;
    _Parentdisplay_FastTravel = findDisplay 147410;
    _ctrl = _Parentdisplay_FastTravel displayCtrl 147415;

    //Refresh price and travel time
    // + 8 (cam intro/outro)
    {
        if ((lbData [147413, _index]) == _x) then {
            _posDest = getMarkerPos _x;
            _ctrl ctrlMapAnimAdd [1, 0.05, _posDest];
            ctrlMapAnimCommit _ctrl;
            _distance = player distance2D _posDest;
            _Price = round (_distance * _distPriceMult);
            _Time = round ((round _distance / 1000) * _distTimeMultip) + 8;
            ctrlSetText [147417,format ["%1 tabs",_Price]];
            ctrlSetText [147419,format ["%1s",_Time]];
        };
    } forEach _Citys;
};

//setup dialog
if (_mode == 2) exitwith {
    {
        if ((position player distance2D getMarkerPos _x) > 20) then {
            _index = lbAdd [147413,markerText _x];
            lbSetData [147413, _index, _x];
            lbSetCurSel [147413, _index];
        };
    } forEach _Citys;
};

//Travel
if (_mode == 3) exitwith {
    //Check for bad data / abuse of the script                        

    _destPos = getMarkerpos _dest;    
    _damagePlayer = getDammage player;
    _posPlayer = position player;
    _distance = player distance2D _destPos;
    _waitTime = round ((round _distance / 1000) * _distTimeMultip) - 8;
    _Price = round (_distance * _distPriceMult);
    _exilemoney = player getVariable ["ExileMoney", 0]; 
    _newexilemoney = (_exilemoney - _price);
    
    if !(vehicle player == player) exitwith { 
        ["ErrorTitleAndText", ["cmonBruh!", "You can't be in a vehicle to fast travel!"]] call ExileClient_gui_toaster_addTemplateToast;
    };    
    
    if !(_exilemoney > _price) exitWith {
        ["You don't have the funds to travel!"] spawn ExileClient_gui_baguette_show;
    };
    
    ["InfoTitleAndText", ["Fast Travel activated!", "Soo your journey begins!"]] call ExileClient_gui_toaster_addTemplateToast;
    //Start travel
    player setVariable ["ExileMoney", _newexilemoney, true];
    [
        "updateStatsRequest", 
        [
            str (player getVariable ["ExileMoney", 0]),
            str (player getVariable ["ExileScore", 0]),
            player getVariable ["ExileKills", 0],
            player getVariable ["ExileDatabaseID", 0]
        ]
    ] 
    call ExileClient_system_network_send;
    
    player allowDamage false;
    showCinemaBorder true;
    
    _camera = "camera" camCreate [position player select 0,position player select 1,3];
    _camera cameraEffect ["internal","back"];
    _camera camCommit 0;
    _camera camSetFOV 0.700;

    //Countdown
    [_waitTime + 8] spawn {
        _countdowntime = _this select 0;
        _countdown = 0;
        33 cutRsc ["FastTravelSystem_Dialog_Countdown","PLAIN"];
        disableSerialization;
        _ctrl = (uiNamespace getVariable "FastTravelCountdownHUD") displayCtrl 147432;
    
        while {_countdowntime > _countdown} do {
            _countdown = _countdown + 1;
            _countdownTimer = _countdowntime - _countdown;
            _ctrl ctrlSetText (format ["%1s",_countdownTimer]);
            sleep 1;
        };
        33 cutText ["", "PLAIN"];
    };

    _camera camSetTarget player;
    _camera camSetRelPos [20,20,350];
    _camera camCommit 4;
    uisleep 4;

    _randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
    player setPos _randomposition;

    _camera camSetTarget player;
    _camera camSetRelPos [-15,-18,250];
    _camera camCommit _waitTime;
    uisleep _waitTime;

    _camera camSetTarget player;
    _camera camSetRelPos [6,6,3];
    _camera camCommit 4;
    uisleep 4;
    playMusic "";

    _camera cameraEffect ["terminate","back"];
    camDestroy _camera;
    [] spawn {
        sleep 5;
        player allowDamage true;
    };
   
    //finish
    ["SuccessTitleAndText", ["Journey Reached!", format ["Welcome to %1 %2! The journey cost %3 pop tabs.",markerText _dest,name player,_Price]]] call ExileClient_gui_toaster_addTemplateToast;
};
