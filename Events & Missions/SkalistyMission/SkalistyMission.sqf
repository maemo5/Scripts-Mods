/*
	"Skalisty Base" static mission for Chernarus.
	Created by Bork
	Credits to "Bork" for editing the map and using compositions.
*/

// For logging purposes
_num = DMS_MissionCount;


// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [13650.7,2853.51,0.623184];

if ([_pos,DMS_StaticMinPlayerDistance] call DMS_fnc_IsPlayerNearby) exitWith {"delay"};


// Set general mission difficulty
_difficulty = "hardcore";


// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
// The center spawn location is added 3 times so at least 3 AI will spawn initially at the center location, and so that future reinforcements are more likely to spawn at the center.
_AISoldierSpawnLocations =
[
[13655.8,2934.71,0.623253],
[13701.9,2861.95,0.623249],
[13660.8,2882.3,0.623192],
[13589.5,2927.17,0.623119],
[13650.7,2853.51,0.623184],
[13738.1,2837.21,0.623318],
[13754.1,2895.08,0.623276],
[13734.1,2940.35,0.62323],
[13673.3,2894.92,0.623249],
[13696.7,2925.4,0.623238]
];

// Create AI
_AICount = 30 + (round (random 10));


_group =
[
	_AISoldierSpawnLocations+[_pos,_pos,_pos],			// Pass the regular spawn locations as well as the center pos 3x
	_AICount,
	_difficulty,
	"random",
	_side
] call DMS_fnc_SpawnAIGroup_MultiPos;

//Static HMGs, comment out and change positions! If you want...

/*_staticGuns =
[
	[
		[15914.6,16284.2,0],
		[15919.9,16271.2,0],
		[16087.8,16229.4,1.4],
		[16088.7,16192.4,0.15],
		[16100.4,16225.1,0],
		[16019.2,16216.5,2.93]
	],
	_group,
	"assault",
	_difficulty,
	"bandit",
	"random"
] call DMS_fnc_SpawnAIStaticMG;
*/


// Define the classnames and locations where the crates can spawn (at least 2, since we're spawning 2 crates)
_crateClasses_and_Positions =
[
	[[16018,16210,0.61],"I_CargoNet_01_ammo_F"],
	[[15916,16262,0],"I_CargoNet_01_ammo_F"],
	[[15975,16223.5,0.2],"I_CargoNet_01_ammo_F"],
	[[16014,16242.5,4.5],"I_CargoNet_01_ammo_F"],
	[[16026,16226.5,0.72],"I_CargoNet_01_ammo_F"]
];

{
	deleteVehicle (nearestObject _x);		// Make sure to remove any previous crates.
} forEach _crateClasses_and_Positions;

// Shuffle the list
_crateClasses_and_Positions = _crateClasses_and_Positions call ExileClient_util_array_shuffle;


// Create Crates
_crate0 = [_crateClasses_and_Positions select 0 select 1, _crateClasses_and_Positions select 0 select 0] call DMS_fnc_SpawnCrate;
_crate1 = [_crateClasses_and_Positions select 1 select 1, _crateClasses_and_Positions select 1 select 0] call DMS_fnc_SpawnCrate;

// Disable smoke on the crates so that the players have to search for them >:D
{
	_x setVariable ["DMS_AllowSmoke", true];
} forEach [_crate0,_crate1];

//Reward Vehicles

_truck1 = ["CUP_B_AH1_DL_BAF",[0,0,0]] call DMS_fnc_SpawnNonPersistentVehicle;
_truck1 setDir (0);
_truck1 setPosATL [13699.1,2943.73,0.812202];
_truck1 setVariable ["DMS_AllowSmoke", true];

//AI Vehicles!

_ai_vehicle_0 = "CUP_I_ZU23_NAPA"; // Class name of vehicle *Change This*
_veh =  [
            [
                [13663.9,2974.81,0.406296]
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_0
        ] call DMS_fnc_SpawnAIVehicle;
 
_ai_vehicle_1 = "CUP_I_ZU23_NAPA"; // Class name of vehicle *Change This*
_veh1 = [
            [
                [13674,2829.89,0.406975] // Using just one location will make the vehicle stay put unless engaged.
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_1
        ] call DMS_fnc_SpawnAIVehicle;
_ai_vehicle_2 = "CUP_I_ZU23_NAPA"; // Class name of vehicle *Change This*
_veh2 = [
            [
                [13739.9,2874.37,0.407059] // Using just one location will make the vehicle stay put unless engaged.
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_2
        ] call DMS_fnc_SpawnAIVehicle;
_ai_vehicle_3 = "CUP_B_LAV25M240_USMC"; // Class name of vehicle *Change This*
_veh3 = [
            [
                [13613.7,2845.79,2.38726] // Using just one location will make the vehicle stay put unless engaged.
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_3
        ] call DMS_fnc_SpawnAIVehicle;
_ai_vehicle_4 = "CUP_B_LAV25M240_USMC"; // Class name of vehicle *Change This*
_veh4 = [
            [
                [13768,2927.11,2.96126] // Using just one location will make the vehicle stay put unless engaged.
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_4
        ] call DMS_fnc_SpawnAIVehicle;
		
_ai_vehicle_5 = "B_APC_Tracked_01_AA_F"; // Class name of vehicle *Change This*
_veh5 = [
            [
                [13613.3,2896.27,1.13964] // Using just one location will make the vehicle stay put unless engaged.
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_5
        ] call DMS_fnc_SpawnAIVehicle;
_ai_vehicle_6 = "B_APC_Tracked_01_AA_F"; // Class name of vehicle *Change This*
_veh6 = [
            [
                [13738.1,2970.22,2.08517] // Using just one location will make the vehicle stay put unless engaged.
            ],
            _group,
            "random",
            _difficulty,
            _side,
            _ai_vehicle_6
        ] call DMS_fnc_SpawnAIVehicle;

// Define mission-spawned AI Units
_missionAIUnits =
[
	_group 		// We only spawned the single group for this mission
];

// Define the group reinforcements
_groupReinforcementsInfo =
[
	[
		_group,			// pass the group
		[
			[
				0,		// Let's limit number of units instead...
				0
			],
			[
				100,	// Maximum 100 units can be given as reinforcements.
				0
			]
		],
		[
			240,		// About a 4 minute delay between reinforcements.
			diag_tickTime
		],
		_AISoldierSpawnLocations,
		"random",
		_difficulty,
		_side,
		"reinforce",
		[
			10,			// Reinforcements will only trigger if there's fewer than 10 members left in the group
			7			// 7 reinforcement units per wave.
		]
	]
];

// Define mission-spawned objects and loot values
_missionObjs =  [  
                    [],
                    [_crate0, _crate1, _truck1],
                    [
                        [
                            _crate0,
                            [
                                1,
                                [8,DMS_Box_BaseParts_Concrete],
                                1
                            ]
                        ],
                        [
                            _crate1,
                            [
                                [10,DMS_sniper_weps],                // Spawn a random 5 weapons that AI snipers can spawn with.
                                [10,DMS_BoxSurvivalSupplies],
                                1
                            ]
                        ],
						[
                            _truck1,
                            [
                                [20,DMS_sniper_weps],                // Spawn a random 5 weapons that AI snipers can spawn with.
                                [20,DMS_BoxSurvivalSupplies],
                                1
                            ]
                        ] 						
                    ]
                ];

// Define Mission Start message
_msgStart = ['#FFFF00', "A large base of insurrectionists has been spotted on Skalisty Island! Destroy it and claim the loot!"];

// Define Mission Win message
_msgWIN = ['#0080ff',"Convicts have successfully attacked the base at Skalisty!"];

// Define Mission Lose message
_msgLOSE = ['#FF0000',"The insurrectionists have packed up their base and fled. Better luck next time!"];

// Define mission name (for map marker and logging)
_missionName = "Skalisty Base";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficulty
] call DMS_fnc_CreateMarker;

_circle = _markers select 1;
_circle setMarkerDir 20;
_circle setMarkerSize [150,50];


_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =    [
                _pos,
                [
                    [
                        "kill",
                        _group            // Only need to kill the AI group.
                    ],
                    [
                        "playerNear",
                        [_pos,100]
                    ]
                ],
                _groupReinforcementsInfo,
                [
                    _time,
                    DMS_StaticMissionTimeOut call DMS_fnc_SelectRandomVal
                ],
                _missionAIUnits,
                _missionObjs,
                [_missionName,_msgWIN,_msgLOSE],
                _markers,
                _side,
                "hardcore",
                [],
                [
                    [
                        [
                            _truck1,
                            {_this setVariable ["ExileMoney",350000,true]}                       // The helicopter will have 25,000 poptabs after the mission completes. The capacity is actually 5000, but I just overload it.
                        ]
                    ],
                    [],
                    {},
                    {}
                ]
            ] call DMS_fnc_AddMissionToMonitor_Static;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_fnc_AddMissionToMonitor_Static! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	_cleanup = [];
	{
		_cleanup pushBack _x;
	} forEach _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));

	{
		_cleanup pushBack (_x select 0);
	} foreach (_missionObjs select 2);

	_cleanup call DMS_fnc_CleanUp;


	// Delete the markers directly
	{deleteMarker _x;} forEach _markers;


	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};


// Notify players
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;



if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};
