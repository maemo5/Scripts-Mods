# ETG-Login-Reward-Script
A script that enables login rewards for Arma 3 (https://arma3.com/) Armaholic page (http://www.armaholic.com/page.php?id=29856)


## Description:
This script will add login rewards to your Exile server.
It rewards the player with items added to his inventory. 
The script has a built in progress system with ten different tiers of rewards.


## Features:
- easy to set up (plug and play)
- 10 configurable reward tiers
- performance friendly (runs only on client)


## Screenshots
![Screenshot](https://i.imgur.com/QKHAFeR.png)


## Installation/Usage:
1. Add this line to you init.sqf:
    ```
    if (hasInterface) then {_nul = execVM "ETG_LoginrewardScript.sqf";};
    ```
1. Or Add this to the initPlayerLocal.sqf:
    ```
    _nul = execVM "ETG_LoginrewardScript.sqf";
    ```

