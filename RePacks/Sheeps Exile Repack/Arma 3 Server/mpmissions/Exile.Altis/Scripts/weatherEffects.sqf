// weatherEffects.sqf: v1.1

//Changelog: Removed legacy fatigue settings and put  new stamina settings in

// ** Weather effects by JohnO **//
 
private ["_exitA","_exitB","_exitWeather","_fatigue","_rainLevel","_damage","_uniform","_cover","_fire","_distanceToCover","_distanceToFire","_showSick","_showCold","_effectsCheck","_warm","_sick","_healthyInd"];
 
/** SETTINGS **/
/** Notifications **/
 
_showSick = true; //True to enable notifications "Eg You are getting sick"
_showCold = true; //True to enable notifications "Eg You are getting cold"
_effectsCheck = 60; //Time in seconds that the weather effects will apply. This time is x2, so 60 is actually 120. Due to the way the script works.
_healthyInd = true; // If true - will display a "You are healthy" status when the character is not sick or cold.
 
 
_coldClothes =
[
"", //NAKED - DO NOT CHANGE
"U_BasicBody",
"U_AttisBody",
"U_AntigonaBody",
"Exile_Uniform_BambiOverall",
//Civilian
"U_C_Journalist",
"U_C_Poloshirt_blue",
"U_C_Poloshirt_burgundy",
"U_C_Poloshirt_salmon",
"U_C_Poloshirt_stripped",
"U_C_Poloshirt_tricolour",
"U_C_Poor_1",
"U_C_Poor_2",
"U_C_Poor_shorts_1",
"U_OrestesBody",
"U_Rangemaster",
"U_NikosBody",
"U_Competitor", 
//Soldier
"U_B_CombatUniform_mcam_tshirt",
"U_I_CombatUniform_shortsleeve",
"U_I_CombatUniform_tshirt",
"U_I_G_Story_Protagonist_F",
//Guarilla
"U_I_G_resistanceLeader_F",
"U_BG_Guerilla1_1",
"U_BG_Guerilla2_2",
"U_BG_Guerilla2_3",
"U_BG_Guerilla3_1",
"U_BG_Guerilla2_1",
"U_IG_Guerilla2_3",
"U_IG_Guerilla2_2",
"U_IG_Guerilla1_1",
"U_IG_Guerilla2_1",
//Special
"U_B_survival_uniform",
"U_I_Wetsuit",
"U_O_Wetsuit",
"U_B_Wetsuit",
"Exile_Uniform_Woodland"
];     
 
sick = false;
_warm = true;
cold = 0;
_sickChance = 0;
sickValue = 0;
_fatigue = 0;
_rainLevel = rain;
_damage = damage player;
_uniform = uniform player;
_cover = nearestBuilding player;
_fire = nearestObject [player,"Exile_Construction_CampFire_Static"];
_distanceToCover = player distance _cover;
_distanceToFire = player distance _fire;
 
[sick,sickValue,cold] spawn
{
        _exitA = false;
        waituntil 
        {
               
                if (!alive player) then
                {     
                        sick = false;
                        cold = 0;
                        sickValue = 0;
                        player enableStamina false;
                        player allowSprint true;
                };
                uiSleep 1;
                _exitA      
        };        
           
};
 
[] spawn 
{
        _exitB = false;       
        waituntil 
        {
                if (damage player > 0.75) then
                {      
                        playSound "SndExileHeartbeatStopping";
                        enableCamShake true;
                        addCamShake [5, 3, 30];
                        uiSleep 5;
                };
                uiSleep 1;
                _exitB
        };      
};

_exitWeather = false; 
waitUntil
{     
        if (alive player) then
        {        
                if (_healthyInd) then
                {      
                        if ((!sick) && (_warm) && (sickValue <= 0)) then
                        {
                                titleText ["You are healthy", "PLAIN DOWN",0.5];
                        };
                };
         
                if (sickValue <= 0) then
                {
                        sickValue = 0;
                }
                else
                {
                        if (sickValue >= 1) then
                        {
                                sickValue = 1;
                        };
                };
                if (cold <= 0) then
                {                
                        cold = 0;
                }
                else
                {
                        if (cold >= 1) then
                        {
                                cold = 0.9;
                        };
                };
                                               
                uiSleep _effectsCheck;
         
                _rainLevel = rain;
                _damage = damage player;
                _uniform = uniform player;
                _cover = nearestBuilding player;
                _fire = nearestObject [player,"Exile_Construction_CampFire_Static"];
                _distanceToCover = player distance _cover;
                _distanceToFire = player distance _fire;
         
                if ((daytime >= 19 || daytime < 5) || (_rainLevel > 0.5 )) then {_warm = false};
         
                if ((!_warm) && (_uniform in _coldClothes)) then {_warm = false};
                if ((!_warm) && (_distanceToFire < 20) || (_distanceToCover < 50)) then {_warm = true};
                if !(_uniform in _coldClothes) then {_warm = true};
               
                if (_warm) then
                {
                        _warm = true;
                        cold = cold - 0.1;
                        if (cold <= 0) then
                        {
                                if (sickValue >= 0) then
                                {
                                        sickValue = sickValue - 0.05;
                                        if (sickValue <= 0.25) then
                                        {
                                                sick = false;
                                                enableCamShake false;
                                                player enableStamina false;
                                                player allowSprint true;
                                                uiSleep 1;
                                                if ((_showSick) && (sickValue >= 0 && sickValue <= 0.25)) then
                                                {
                                                        titleText ["You are feeling better", "PLAIN DOWN",0.5];
                                                };
                                        };
                                };     
                        };
                }
                else
                {
                        _warm = false;
                        cold = cold + 0.1;
                };
                if ((_showCold) && (cold >= 0 && cold <=0.1) && (!_warm)) then
                {
                        titleText ["It is getting cold", "PLAIN DOWN",0.5];
                }
                else
                {
                        if ((_showCold) && (cold >= 0.2 && cold <= 0.3) && (!_warm)) then
                        {
                                titleText ["You are starting to freeze", "PLAIN DOWN",0.5];
                        };
                };
         
                uiSleep _effectsCheck; 
               
                if ((cold > 0.3) && (!_warm)) then
                {
                        cold = cold + 0.1;
                        player setDamage _damage +0.07;
                        enableCamShake true;
                        addCamShake [5, 3, 60];
                        if (_showCold) then
                        {
                                titleText ["You are freezing", "PLAIN DOWN",1];
                        };
                };
               
                if ((!_warm) && (cold > 0.3 )) then
                {
                        _sickChance = random 1;
         
                        if ((_sickChance > 0.5) || (sickValue > 0)) then
                        {
                                sick = true;
                                sickValue = sickValue + 0.05;
                                if ((_showSick) && (sickValue < 0.25)) then
                                {
         
                                        titleText ["You are getting sick", "PLAIN DOWN",0.5];
         
                                };
                                if ((sickValue > 0.25) && (sickValue < 0.50)) then
                                {
                                        player enableStamina true;
                                        player allowSprint false;
                                        enableCamShake true;
                                        addCamShake [5, 3, 30];
                                        
         
                                        if (_showSick) then
                                        {
                                                titleText ["You are very sick", "PLAIN DOWN",0.5];
                                        };
                                }
                                else
                                {
                                        if (sickValue > 0.50) then
                                        {
                                                player enableStamina true;
                                                player allowSprint false;
                                                enableCamShake true;
                                                addCamShake [10, 10, 15];
                                                [120] call BIS_fnc_bloodEffect;
                                                player setDamage _damage + 0.02;
                                                
         
                                                if (_showSick) then
                                                {
                                                        titleText ["You are dying", "PLAIN DOWN",0.5];
                                                };
                                        };
                                };
                        };
                };             
                if ((_warm) && (sick)) then
                {      
                        if ((_showSick) && (sickValue < 0.25)) then
                        {
                                titleText ["You are sick", "PLAIN DOWN",0.5];
                        };
                        if ((sickValue > 0.25) && (sickValue < 0.50)) then
                        {
                               
                                enableCamShake true;
                                addCamShake [5, 3, 30];
                                
         
                                if (_showSick) then
                                {
                                        titleText ["You are very sick", "PLAIN DOWN",0.5];
                                };
                        }
                        else
                        {
                                if (sickValue > 0.50) then
                                {
                                        player enableStamina true;
                                        player allowSprint false;
                                        enableCamShake true;
                                        addCamShake [10, 10, 15];
                                        [120] call BIS_fnc_bloodEffect;
                                        player setDamage _damage + 0.02;
                                        
         
                                        if (_showSick) then
                                        {
                                                titleText ["You are dying", "PLAIN DOWN",0.5];
                                        };
                                };
                        };
                };
        };
        uiSleep 1;
        _exitWeather  
};