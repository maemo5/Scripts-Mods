/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
//["purchaseVehicleSkinRequest", [netId ExileClientVehicleCustomsOriginalVehicle, ExileClientVehicleCustomsSelectedSkin]] call ExileClient_system_network_send;

[ExileClientSessionId, netId ExileClientVehicleCustomsOriginalVehicle, SkinClassName, netId player, SkinPrice, OriginalTextures, AvailableForGroup] remoteExecCall ['SneakCustoms_change_skin', 2];

closeDialog 0;