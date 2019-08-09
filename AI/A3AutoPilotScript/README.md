# A3AutoPilotScript
Spawn in an AI as a pilot and loiter around a selected area

## Installation
### Exile
Copy the custom folder into your Exile.MapName folder.  
Merge or copy the description.ext  
Merge or copy the initPlayerLocal.sqf  
  
## Settings
All the settings that can be changed are inside \custom\ChaosAutoPilot\AutoPilotConfig.h
<br />

| Variable      | Purpose |
|---------------|---------|
| DEBUG_MARKERS | Draw debug markers on the map,\nwon't get cleared properly so only use for testing |
| MINIMUM_SPEED | Minimum speed required for the option to show up in the action menu (scroll wheel) |
| MINIMUM_HEIGHT_ASL | Minimum height above sea level required for the option to show up in the action menu (scroll wheel) |
| ALLOW_TAKE_OVER | Allow another player to disable auto pilot and get in the seat |
| LOITER_RADIUSES | Radius options (distance from the marker) make sure to add/remove from LOITER_POINTS |
| LOITER_POINTS | The number of additional waypoints for each corresponding radius |
| LOITER_COMPLETION_DISTANCE | the completion radius for each waypoint, a multiple of the distance between 2 neighboring waypoints |
| LOITER_HEIGHTS | heights options available for the players to select |
| LOITER_SIDES | side (which side the weapons are on) options available for the players to select |
| LOITER_START_DIST | distance at which to reposition for the radius and fly in |
| LOITER_POINTS | The number of additional waypoints for each corresponding radius |
| LOITER_SPEED | Limit the speed of the vehicle (only for AI) default 200 otherwise the ai cannot change direction in time for the next waypoint |


## License
Noncommercial - You may not use this material for any commercial purposes.  
Feel free to Modify and Distribute.
