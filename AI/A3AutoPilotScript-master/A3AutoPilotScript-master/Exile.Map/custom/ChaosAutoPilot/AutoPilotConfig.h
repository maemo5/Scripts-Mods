/*
 *draw the debug markers on the map, 
 *never use unless for debugging some of them wont get deleted and stay on the map if radius changes
*/
#define DEBUG_MARKERS 1 

//minimum speed and minimum height is ignored if the ai is in control.
#define MINIMUM_SPEED 200 //minimum speed required for the ai to take over
#define MINIMUM_HEIGHT_ASL 700 //minimum height required for the ai to take over

#define ALLOW_TAKE_OVER false //allow other players to take over the pilot seat from the AI

#define LOITER_RADIUSES [700,800,900,1000,1200,1400,1600,1800,2000, 2200, 2400, 2600, 2800, 3000] //radiuses available for the players to select
#define LOITER_POINTS   [0  ,  0,  4,   8,   8,   8,   8,   8,   8,    8,   10,    12,    14,    16] //additional waypoints for each radius, default radius + whatever matches on here
#define LOITER_COMPLETION_DISTANCE 0.6 //the completion radius for each waypoint, a multiple of the distance between 2 neighboring waypoints
#define LOITER_HEIGHTS [700,800,900,1000,1200,1400,1600,1800,2000, 2200, 2400, 2600, 2800, 3000] //heights available for the players to select
#define LOITER_SIDES ["Left", "Right"]

#define LOITER_START_DIST 3000 //distance at which to reposition for the radius
#define LOITER_SPEED 200 //Limit the speed of the vehicle (only for AI) default 200 otherwise the ai cannot change direction in time for the next waypoint