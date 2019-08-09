	class Events 
	{
		/*
			A list of events that are active
		*/
		enabledEvents[] = {"IKEA"}; 

		
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