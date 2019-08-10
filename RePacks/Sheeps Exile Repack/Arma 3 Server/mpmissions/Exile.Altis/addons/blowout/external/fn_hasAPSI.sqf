//check if player has apsi item
//Created by Fallingsheep
private["_hasAPSI","_x"];
//diag_log "BLOWOUT - APSI CHECK";

// 1=Headgear 2=Vest 3=Item  4=Goggles 5=Uniform
_hasAPSI = 0;

//Check Headgear
if(ns_blow_itemtype == 1)then{ 
	if ((headgear player) in ns_blow_itemapsi)then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
//Vest
if(ns_blow_itemtype == 2)then{ 
	if ((vest player) in ns_blow_itemapsi)then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
//Check items
if(ns_blow_itemtype == 3)then{ 
	{
		if (_x in ns_blow_itemapsi)then{
		_hasAPSI = true;
		}else{
			_hasAPSI = false;
		};
	} foreach (assignedItems player);
};
//goggles
if(ns_blow_itemtype == 4)then{ 
	if ((goggles player) in ns_blow_itemapsi)then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
//Uniform
if(ns_blow_itemtype == 5)then{ 
	if ((uniform player) in ns_blow_itemapsi)then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
_hasAPSI