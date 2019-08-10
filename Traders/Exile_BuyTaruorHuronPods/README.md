# Exile_BuyTaruorHuronPods

This is a Fix for the People who want to make the Taru/Huron Pods buyable. You will not spawn in the Pods.

The Filename is ExileClient_system_trading_network_purchaseVehicleResponse.sqf you 
can overwrite this with the missionfile in the class CfgExileCustomCode Section.
Example:

	ExileClient_system_trading_network_purchaseVehicleResponse = "folderwhereisthefile"\ExileClient_system_trading_network_purchaseVehicleResponse.sqf";

The Classnames you can Copy to the ExileArsenal in the Config.Cpp
Then add it to class Cars OR class Trucks in the Shop section

!!!Important!!!

    You need additional Scripts like R3F or Igiload to Transport the Pods
    You must Lock and Unlock the Pod after Moving for the database saving
    Lock and Unlock only over the Keybind (User Action 1)
    Taru Pods can used WITHOUT the DLC
    
