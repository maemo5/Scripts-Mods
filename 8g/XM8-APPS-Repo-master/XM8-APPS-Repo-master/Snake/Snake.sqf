/*
http://www.exilemod.com/profile/4566-shix/
Snake script made by shix .... Cause why the fuck not
ohh and before some clever person tring to grow their EPEEN says this isnt efficient ..... just fuck off its snake in arma for fuck sake
*/
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
(findDisplay 24015) displayAddEventHandler ["KeyDown","_this select 1 call fnc_changeDir"];
_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;

gameInProgress = true;
Snakedirection = 1; //just gonna stick this shit here
foodCount = 0;
endBodyPos = [(21 - 3) * (0.025)+ 0.5 * (0.04), (12 - 2) * (0.04)+ 0.5 * (0.04)];
bodyArray = [1337];
playerscore = 0;

_LeftBorder = _display ctrlCreate ["RscPicture", 8882];
_LeftBorder ctrlSetPosition [(6 - 3) * (0.025), (4.1 - 2) * (0.04), 0.1 * (0.04), 18.9 * (0.04)];
_LeftBorder ctrlSetFade 0;
_LeftBorder ctrlCommit 0;
_LeftBorder ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";

_RightBorder = _display ctrlCreate ["RscPicture", 8883];
_RightBorder ctrlSetPosition [(40 - 3) * (0.025), (4.1 - 2) * (0.04), 0.1 * (0.04), 18.9 * (0.04)];
_RightBorder ctrlSetFade 0;
_RightBorder ctrlCommit 0;
_RightBorder ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";

_TopBorder = _display ctrlCreate ["RscPicture", 8884];
_TopBorder ctrlSetPosition [(6 - 3) * (0.025), (4.1 - 2) * (0.04), 21.4 * (0.04), 0.1 * (0.04)];
_TopBorder ctrlSetFade 0;
_TopBorder ctrlCommit 0;
_TopBorder ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";

_BottomBorder = _display ctrlCreate ["RscPicture", 8885];
_BottomBorder ctrlSetPosition [(6 - 3) * (0.025), (23 - 2) * (0.04), 21.4 * (0.04), 0.1 * (0.04)];
_BottomBorder ctrlSetFade 0;
_BottomBorder ctrlCommit 0;
_BottomBorder ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";

_Score = _display ctrlCreate ["RscStructuredText", 1120];
_Score ctrlSetPosition [(13 - 3) * (0.025), (4.5 - 2) * (0.04),(0.5),(0.5)];
_Score ctrlSetFont "OrbitronLight";
_Score ctrlCommit 0;
_Score ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='1' valign='middle' align='center' shadow='0'>SCORE: %1</t>",playerscore];

_leftHeader = _display displayCtrl 4003;
_leftHeader ctrlSetFade 1;
_leftHeader ctrlCommit 0;

_centreHeader = _display displayCtrl 4005;
_centreHeader ctrlSetFade 1;
_centreHeader ctrlCommit 0;

_rightHeader = _display displayCtrl 4004;
_rightHeader ctrlSetFade 1;
_rightHeader ctrlCommit 0;

fnc_spawnFood = {
    _randX = random [6, 23, 40];
    _randX = round _randX; //Yeah i know the mid numbers are not perfect so fuck off
    _randY = random [4.1, 14, 23];
    _randY = round _randY;
    _food = _display ctrlCreate ["RscPicture", 5004];
    _food ctrlSetPosition [(_randX - 3) * (0.025), (_randY - 2) * (0.04), 0.5 * (0.04), 0.5 * (0.04)];
    _food ctrlSetFade 0;
    _food ctrlCommit 0;
    _food ctrlSetText "#(argb,8,8,3)color(1,0,0,1)";
    foodCount = foodCount + 1;
};


fnc_changeDir = {
    switch (_this) do {
        case (1): {
            //if the player presses the esc button it will exit cause its fucking cool okay ?
            gameInProgress = false;
        };
        case (200): {
            if (Snakedirection != 4)then
            {
                Snakedirection = 3;
            };
        };
        case (203): {
            if (Snakedirection != 2)then
            {
                Snakedirection = 1;
            };
        };
        case (205): {
            if (Snakedirection != 1)then
            {
                Snakedirection = 2;
            };
        };
        case (208): {
            if (Snakedirection != 3)then
            {
                Snakedirection = 4;
            };
        };
        default {

        };
    };
};

Game = {
    disableSerialization;
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
    _snakeHead = _display displayCtrl 1337;
    _snakeHeadPos = ctrlPosition _snakeHead;
    _snakeHeadX = _snakeHeadPos select 0;
    _snakeHeadY = _snakeHeadPos select 1;
    if(foodCount < 1)then
    {
        call fnc_spawnFood;
    };
    if(gameInProgress)then
    {
        switch (Snakedirection) do {
            case (1): {
                _newPos = _snakeHeadX -0.01;
                _snakeHead ctrlSetPosition [_newPos, _snakeHeadY];
                _snakeHead ctrlCommit 0.001;
            };
            case (2): {
                _newPos = _snakeHeadX +0.01;
                _snakeHead ctrlSetPosition [_newPos, _snakeHeadY];
                _snakeHead ctrlCommit 0.001;
            };
            case (3): {
                _newPos = _snakeHeadY -0.01;
                _snakeHead ctrlSetPosition [_snakeHeadX, _newPos];
                _snakeHead ctrlCommit 0.001;
            };
            case (4): {
                _newPos = _snakeHeadY +0.01;
                _snakeHead ctrlSetPosition [_snakeHeadX, _newPos];
                _snakeHead ctrlCommit 0.01;
            };
        };
    };
    []spawn fnc_checkPos;
    []spawn fnc_eatFood;
    uiSleep 0.01;
};

fnc_addToSnake = {
    if (gameInProgress) then {
        disableSerialization;
        _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
        _randIDC = random [5000, 7500, 10000];
        _randIDC = round _randIDC;
        bodyArray pushBack _randIDC;
        _snakebody = _display ctrlCreate ["RscPicture", _randIDC];
        _snakebody ctrlSetPosition [endBodyPos select 0, endBodyPos select 1, 0.5 * (0.04), 0.5 * (0.04)];
        _snakebody ctrlSetFade 0;
        _snakebody ctrlCommit 0;
        _snakebody ctrlSetText "#(argb,8,8,3)color(0,1,0,1)";
    };
};

fnc_eatFood = {
        if (gameInProgress) then {
        disableSerialization;
        _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
        _snakeHead = _display displayCtrl 1337;
        _snakeHeadPos = ctrlPosition _snakeHead;
        _snakeHeadX = _snakeHeadPos select 0;
        _snakeHeadY = _snakeHeadPos select 1;
        _food = _display displayCtrl 5004;
        _foodPos = ctrlPosition _food;
        if(_snakeHeadX > (_foodPos select 0)-0.3 * (0.04))then{
            if (_snakeHeadX < (_foodPos select 0)+0.7 * (0.04)) then {
                if (_snakeHeadY > (_foodPos select 1)-0.3 * (0.04)) then {
                    if (_snakeHeadY < (_foodPos select 1)+0.7 * (0.04)) then {
                        //yeah i like ifs inside ifs inside ifs inside ifs because fuck &&
                        systemChat "NOM NOM NOM";
                        ctrlDelete ((findDisplay 24015) displayCtrl 5004);
                        foodCount = foodCount - 1;
                        playerscore = playerscore +1;
                        _score = _display displayCtrl 1120;
                        _Score ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='1' valign='middle' align='center' shadow='0'>SCORE: %1</t>",playerscore];
                        []spawn fnc_addToSnake;
                    };
                };
            };
        };
    };
};



fnc_checkPos = {
    if (gameInProgress) then {
        disableSerialization;
        _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
        _leftBorder = _display displayCtrl 8882;
        _leftBorderPos = ctrlPosition _leftBorder;
        _rightBorder = _display displayCtrl 8883;
        _rightBorderPos = ctrlPosition _rightBorder;
        _topBorder = _display displayCtrl 8884;
        _topBorderPos = ctrlPosition _topBorder;
        _bottomBorder = _display displayCtrl 8885;
        _bottomBorderPos = ctrlPosition _bottomBorder;
        _snakeHead = _display displayCtrl 1337;
        _snakeHeadPos = ctrlPosition _snakeHead;
        _snakeHeadX = _snakeHeadPos select 0;
        _snakeHeadY = _snakeHeadPos select 1;

        if(_snakeHeadX < (_leftBorderPos select 0)+0.3 * (0.04))then
        {
            systemChat "out of bounds left";
            gameInProgress = false;
        };
        if(_snakeHeadX > (_rightBorderPos select 0)-0.6 * (0.04))then
        {
            systemChat "out of bounds right";
            gameInProgress = false;
        };
        if(_snakeHeadY < (_topBorderPos select 1)+0.17 * (0.04))then
        {
            systemChat "out of bounds top";
            gameInProgress = false;
        };
        if(_snakeHeadY > (_bottomBorderPos select 1)-0.6 * (0.04))then
        {
            systemChat "out of bounds bottom";
            gameInProgress = false;
        }
        else
        {
            []spawn Game;
            []spawn fnc_updateEndOfBodyPos;
            []spawn fnc_moveBody;
        };
    };
};

fnc_moveBody = {
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 for "_i" from 0 to (count bodyArray)-1 do
 {
     _bodyPartIDC = bodyArray select _i;
     _curBodyPart = _display displayCtrl _bodyPartIDC;
     if !(_bodyPartIDC == 1337) then
     {
         _select = _i - 1;
         _previousBodypartIDC = bodyArray select _select;
         _ctrl = _display displayCtrl _previousBodypartIDC;
         _previousBodypartPos = ctrlPosition _ctrl;
         _curBodyPart ctrlSetPosition _previousBodypartPos;
         _curBodyPart ctrlCommit 0.001;
     };
 };
};

fnc_updateEndOfBodyPos = {
    disableSerialization;
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
    _snakeHead = _display displayCtrl 1337;
    _snakeHeadPos = ctrlPosition _snakeHead;
    _snakeHeadX = _snakeHeadPos select 0;
    _snakeHeadY = _snakeHeadPos select 1;
    endBodyPos = [_snakeHeadX + 0.5 * (0.04), _snakeHeadY+ 0.5 * (0.04)];
};

fnc_goBack = {
  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
  _ctrls = [9991,9992];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, false];
  } forEach _ctrls;
  execVM "xm8Apps\XM8Apps_Init.sqf";
  {
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _ctrls;
};

fnc_starterCountDown = {
    disableSerialization;
    _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
    _countDownText = _display ctrlCreate ["RscStructuredText", 1119];
    _countDownText ctrlSetPosition [(13 - 3) * (0.025), (12 - 2) * (0.04),(0.5),(0.5)];
    _countDownText ctrlSetFont "OrbitronLight";
    _countDownText ctrlCommit 0;
    _countDownText ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>3</t>"];
    uiSleep 1;
    _countDownText ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>2</t>"];
    uiSleep 1;
    _countDownText ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>1</t>"];
    uiSleep 1;
    _countDownText ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>GO</t>"];
    uiSleep 0.5;
    _countDownText ctrlSetFade 1;
    _countDownText ctrlCommit 0.5;

    _snakeHead = _display ctrlCreate ["RscPicture", 1337];
    _snakeHead ctrlSetPosition [(21 - 3) * (0.025), (12 - 2) * (0.04), 0.5 * (0.04), 0.5 * (0.04)];
    _snakeHead ctrlSetFade 0;
    _snakeHead ctrlCommit 0;
    _snakeHead ctrlSetText "#(argb,8,8,3)color(0,1,0,1)";

    [] spawn Game;
};

call fnc_starterCountDown;
