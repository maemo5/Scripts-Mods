	class Events 
	{
		/*
			A list of events that are active
		*/
		enabledEvents[] = {"MilitaryDrop"}; 

		
		 class MilitaryDrop 
        {
            /*
                Drops a supply box on a parachute next to a random airport on the map.
                The box may contain items. The box can be transported to a territory
                and installed to become a normal storage container.
            */
            type = "spawn";
            function = "ExileServer_system_event_militarydrop_start";
            minTime = 10; // minutes
            maxTime = 20; // minutes
            minimumPlayersOnline = 1;
            dropRadius = 200; // 500m around an airport (including the main airport on Altis!)
            dropAltitude = 100; // altitude of the drop
            markerTime = 15; // minutes

            /*
                These are different types of boxes can be dropped.
                You can specify the cargo a box should contain.
                The type of box is chosen randomly from the following list.
                Add a type multiple times to increase the chance of being used.
            */
            types[] = {"Ghillie", "LMG", "Backpacks", "Snipers", "RPG"};

            class BoxTypes5
            {
                class Ghillie 
                {
                    items[] = 
                    {
                         {"U_B_FullGhillie_ard", 2},            
                         {"U_B_FullGhillie_sard", 2},
                         {"U_B_GhillieSuit", 2},
                         {"U_I_FullGhillie_ard", 2},            
                         {"U_I_FullGhillie_sard", 2},
                         {"U_I_GhillieSuit", 2},
                         {"U_O_FullGhillie_ard", 2},
                         {"U_O_FullGhillie_sard", 2},
                         {"U_O_GhillieSuit", 2}     
                    };
                };

                class LMG
                {
                    items[] = 
                    {
                         {"LMG_Zafir_F", 2},            
                         {"LMG_Mk200_F", 2},
                         {"150Rnd_762x54_Box", 5},
                         {"200Rnd_65x39_cased_Box", 5},            
                         {"optic_DMS", 2},
                         {"optic_LRPS", 2},
                         {"optic_Nightstalker", 2},
                         {"optic_tws", 2}
                    };
                };

                class Backpacks 
                {
                    items[] = 
                    {
                         {"B_Bergen_mcamo_F", 2},            
                         {"B_Bergen_dgtl_F", 2},
                         {"B_Bergen_tna_F", 2}
                    };
                };

                class Snipers
                {
                    items[] = 
                    {
                         {"Exile_Weapon_DMR", 2},            
                         {"exile_weapons_m107", 2},
                         {"srifle_DMR_05_blk_F", 2},
                         {"srifle_DMR_02_F", 2},            
                         {"srifle_GM6_F", 2},
                         {"srifle_LRR_F", 2}, 
                         {"5Rnd_127x108_Mag", 5},
                         {"7Rnd_408_Mag", 5},
                         {"10Rnd_93x64_DMR_05_Mag", 5},            
                         {"10Rnd_127x99_m107", 5},
                         {"10Rnd_338_Mag", 5},
                         {"Exile_Magazine_20Rnd_762x51_DMR", 5},
                         {"optic_DMS", 2},
                         {"optic_LRPS", 2},
                         {"optic_Nightstalker", 2},
                         {"optic_tws", 2}
                    };
                };
                
                class RPG
                {
                    items[] = 
                    {
                         {"launch_RPG32_F", 2},            
                         {"launch_RPG7_F", 2},
                         {"launch_B_Titan_F", 2},
                         {"launch_Titan_F", 2},            
                         {"launch_B_Titan_short_F", 2},
                         {"launch_Titan_short_F", 2},                         
                         {"RPG32_F", 2},
                         {"RPG32_HE_F", 2},
                         {"RPG7_F", 2},            
                         {"Titan_AA", 2},
                         {"Titan_AP", 2},
                         {"Titan_AT", 2}
                    };
                };
            };
        }; 