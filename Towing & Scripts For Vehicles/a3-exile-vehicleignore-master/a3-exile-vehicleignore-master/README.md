# Vehicle Spawn IgnoreList addon for ExileMod

<sup>Version: 0.1 | Author: ole1986 | This addon is licensed under the Arma Public Licence</sup>

This addon is used to skip vehicle from spawning at specific areas using grid numbers of the map
An example is included in the configuration file using the map CUP Sahrani.

### Installation

- Customize the `vehiclesGridIgnore` located in `config.cpp` with grid numbers which should be ignored by the vehicle spawn script
- Pack the `exile_server_vehicles` folder into `exile_server_vehicles.pbo` using PBO Manager (or any other pbo packer)
- Copy the `exile_server_vehicles.pbo` into your `@ExileServer\addons` directory.
- Restart the server

During the test I recommend to enable the vehicle DebugMarkers to verify the settings.

**Please note:**

The packed version `exile_server_vehicles.pbo` is a working example for *CUP Sahrani* map only.
Please follow the instruction below to add your custom areas being ignored by the vehicle spawn script.

### Configuration

Dependent on the VehicleGridSize defined in the exile server config section "VehicleSpawn" the number of GRID may vary.
The Sahrani map for instance has 324 GRIDS when using VehicleGridSize of 1200

By calculating sqrt(324) we get 18 x 18. Which means every line has 18 grids

To keep it simple, the below "map" has only **three** grids per line.
As you can see the number increases vertically.

**This is very important to define it properly**

```
--- --- ---
 3 | 6 | 9
--- --- ---
 2 | 5 | 8
--- --- ---
 1 | 4 | 7
--- --- ---
```

We want to ignore grid 2 and 3 as well as 7 to 9.

```
--- --- ---
 X | 6 | X
--- --- ---
 X | 5 | X
--- --- ---
 1 | 4 | X
--- --- ---
```

So, the setting `vehicleGridIgnore` will be written as follow:

**config.cpp**

```
vehiclesGridIgnore[] = { 
	{2, 3}, /* ignore top left */
	{7, 9} /* ignore the complete right side (one vertical line) */
};
```

