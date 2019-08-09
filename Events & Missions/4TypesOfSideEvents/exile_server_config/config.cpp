	class Events 
	{
		/*
			A list of events that are active
		*/
		enabledEvents[] = {"IKEA","MilitaryDrop","MoneyDrop","Weed"}; 

		
		class MilitaryDrop 
		{
			/*
				Drops a supply box on a parachute next to a random airport on the map.
				The box may contain items. The box can be transported to a territory
				and installed to become a normal storage container.
			*/
			type = "spawn";
			function = "ExileServer_system_event_militarydrop_start";
			minTime = 25; // minutes
			maxTime = 40; // minutes
			minimumPlayersOnline = 1;
			dropRadius = 500; // 500m around an airport (including the main airport on Altis!)
			dropAltitude = 0; // altitude of the drop
			markerTime = 10; // minutes

			/*
				These are different types of boxes can be dropped.
				You can specify the cargo a box should contain.
				The type of box is chosen randomly from the following list.
				Add a type multiple times to increase the chance of being used.
			*/
			types[] = {"KSVK_2", "Lynx_2","AS50_2", "L115A3_2","Stinger_2","SPMG_2","M107_2","M320_2","Ak_2","RPG_2"};

			class BoxTypes5
			{
				class KSVK_2 
				{
					items[] = 
					{
						{"CUP_srifle_ksvk", 3},
						{"CUP_5Rnd_127x108_KSVK_M", 8},
						{"5Rnd_127x108_APDS_Mag", 2},
						{"optic_KHS_tan", 3}  
					};
				};
				
				class M320_2
				{
					items[] = 
					{
						{"srifle_LRR_camo_F", 1},
						{"srifle_LRR_F", 1},
						{"srifle_LRR_tna_F", 1},
						{"7Rnd_408_Mag", 15},
						{"optic_LRPS", 3}
					};
				};

				class Lynx_2 
				{
					items[] = 
					{
						{"srifle_GM6_ghex_F", 3},
						{"Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag", 12},
						{"optic_LRPS_ghex_F", 3}
					};
				};

				class AS50_2
				{
					items[] = 
					{
						{"CUP_srifle_AS50", 3},
						{"CUP_5Rnd_127x99_as50_M", 12},
						{"CUP_optic_CWS", 3}
					};
				};
				
				class M107_2
				{
					items[] = 
					{
						{"CUP_srifle_M107_Base", 3},
						{"CUP_10Rnd_127x99_m107", 12},
						{"CUP_optic_CWS", 3}
					};
				};
				
				class SPMG_2
				{
					items[] = 
					{
						{"MMG_02_black_F", 2},
						{"MMG_02_camo_F", 1},
						{"MMG_02_sand_F", 1},
						{"130Rnd_338_Mag", 10}
					};
				};

				class L115A3_2 
				{
					items[] = 
					{
						{"CUP_srifle_AWM_des", 3},
						{"CUP_5Rnd_86x70_L115A1", 20},
						{"optic_LRPS_ghex_F", 3}
					};
				};
				
				class Stinger_2 
				{
					items[] = 
					{
						{"CUP_Stinger", 3},
						{"CUP_Stinger_M", 12}
					};
				};
				
				class Ak_2
				{
					items[] = 
					{
						{"Exile_Weapon_AK47", 3},
						{"Exile_Weapon_AK74_GL", 3},
						{"Exile_Weapon_AK107_GL", 3},
						{"Exile_Weapon_AKM", 3},
						{"Exile_Weapon_AKS_Gold", 3},
						{"Exile_Magazine_30Rnd_762x39_AK", 10},
						{"Exile_Magazine_30Rnd_545x39_AK",10},
						{"1Rnd_HE_Grenade_shell",5}
						
						
					};
				};
				
				class RPG_2
				{
					items[] = 
					{
						{"CUP_launch_RPG7V", 3},
						{"CUP_PG7V_M", 10}					
						
					};
				};

			};
		};
		
		class IKEA 
		{
			/*
				Drops a supply box on a parachute next to a random airport on the map.
				The box may contain items. The box can be transported to a territory
				and installed to become a normal storage container.
			*/
			type = "spawn";
			function = "ExileServer_system_event_ikea_start";
			minTime = 25; // minutes
			maxTime = 45; // minutes
			minimumPlayersOnline = 0;
			dropRadius = 500; // 500m around an airport (including the main airport on Altis!)
			dropAltitude = 0; // altitude of the drop
			markerTime = 10; // minutes

			/*
				These are different types of boxes can be dropped.
				You can specify the cargo a box should contain.
				The type of box is chosen randomly from the following list.
				Add a type multiple times to increase the chance of being used.
			*/
			types[] = {"Materials1", "Materials2", "Materials3", "WoodBox", "WoodBox2", "ConcreteBuildingSupplies", "SpecialBuildingSupplies", "FortifiedUpgradeSupplies", "FortifiedSupplies"};

			class BoxTypes2
			{
				class Materials1 
				{
					items[] = 
					{
						{"Exile_Item_Cement", 5},
						{"Exile_Item_Sand", 12},
						{"Exile_Item_MetalPole", 8},
						{"Exile_Item_WaterCanisterDirtyWater", 5},
						{"Exile_Item_FuelCanisterFull", 3}
					};
				};

				class Materials2 
				{
					items[] = 
					{
						{"Exile_Item_Cement", 11},
						{"Exile_Item_Sand", 6},
						{"Exile_Item_MetalPole", 9},
						{"Exile_Item_WaterCanisterDirtyWater", 8},
						{"Exile_Item_FuelCanisterFull", 2}
					};
				};

				class Materials3
				{
					items[] = 
					{
						{"Exile_Item_Cement", 8},
						{"Exile_Item_Sand", 9},
						{"Exile_Item_MetalPole", 12},
						{"Exile_Item_WaterCanisterDirtyWater", 4},
						{"Exile_Item_FuelCanisterFull", 5}
					};
				};

				class WoodBox 
				{
					items[] = 
					{
						{"Exile_Item_WoodFloorKit", 8},
						{"Exile_Item_WoodWallKit", 12},
						{"Exile_Item_WooDDoorKit", 2}
					};
				};

				class WoodBox2
				{
					items[] = 
					{
						{"Exile_Item_WoodFloorKit", 14},
						{"Exile_Item_WoodWallKit", 9},
						{"Exile_IteM_WoodGateKit", 2}
					};
				};

				class ConcreteBuildingSupplies 
				{
					items[] = 
					{
						{"Exile_Item_ConcreteWallKit", 3},
						{"Exile_Item_ConcreteDoorKit", 1},
						{"Exile_Item_ConcreteFloorKit", 3}
					};
				};

				class SpecialBuildingSupplies 
				{
					items[] = 
					{
						{"Exile_Item_CodeLock", 2},
						{"Exile_Item_MetalBoard", 4},
						{"Exile_Item_CamoTentKit", 3},
						{"Exile_Item_DuctTape", 3}
						
					};
				};

				class FortifiedUpgradeSupplies 
				{
					items[] = 
					{
						{"Exile_Item_MetalPole", 10},
						{"Exile_Item_MetalBoard", 20}
					};
				};

				class FortifiedSupplies 
				{
					items[] = 
					{
						{"Exile_Item_FortificationUpgrade", 6},
						{"Exile_Item_Grinder", 4}
					};
				};

			};
		};
		
		class Weed 
		{
			/*
				Drops a supply box on a parachute next to a random airport on the map.
				The box may contain items. The box can be transported to a territory
				and installed to become a normal storage container.
			*/
			type = "spawn";
			function = "ExileServer_system_event_weed_start";
			minTime = 30; // minutes
			maxTime = 50; // minutes
			minimumPlayersOnline = 0;
			dropRadius = 150; // 500m around an airport (including the main airport on Altis!)
			markerTime = 12; // minutes
		};
		

		class MoneyDrop 
		{
			/*
				Drops a supply box on a parachute next to a random airport on the map.
				The box may contain items. The box can be transported to a territory
				and installed to become a normal storage container.
			*/
			type = "spawn";
			function = "ExileServer_system_event_MoneyDrop_start";
			minTime = 27; // minutes
			maxTime = 29; // minutes
			minimumPlayersOnline = 0;
			dropRadius = 500; // 500m around an airport (including the main airport on Altis!)
			dropAltitude = 0; // altitude of the drop
			markerTime = 10; // minutes

			/*
				These are different types of boxes can be dropped.
				You can specify the cargo a box should contain.
				The type of box is chosen randomly from the following list.
				Add a type multiple times to increase the chance of being used.
			*/
			types[] = {"MoneyDrop1","MoneyDrop2","MoneyDrop3","MoneyDrop4","MoneyDrop5","MoneyDrop6","MoneyDrop7"};

			class BoxTypes4
			{
				class MoneyDrop1 
				{
					items[] = 
					{
						{"CUP_item_Money", 4}
					};
				};

				class MoneyDrop2 
				{
					items[] = 
					{
						{"CUP_item_Money", 5}
					};
				};

				class MoneyDrop3
				{
					items[] = 
					{
						{"CUP_item_Money", 4}
					};
				};
				
				class MoneyDrop4
				{
					items[] = 
					{
						{"CUP_item_Money", 3}
					};
				};
				
				class MoneyDrop5
				{
					items[] = 
					{
						{"CUP_item_Money", 6}
					};
				};
				
				class MoneyDrop6
				{
					items[] = 
					{
						{"Exile_Item_RubberDuck", 1}
					};
				};
				
				class MoneyDrop7
				{
					items[] = 
					{
						{"Exile_Item_RubberDuck", 1}
					};
				};

			};
		};

	

};