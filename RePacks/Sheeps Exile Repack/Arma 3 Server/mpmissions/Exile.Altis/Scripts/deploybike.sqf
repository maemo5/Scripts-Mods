

/* 
	Author: †RiH† StokesMagee / RiH Dev Team.
	Credits: †RiH† StokesMagee, Arzumata.
	Website: www.restinhellgamers.com - www.exilemod.com
	Description: Deploy bike / quad.
*/

/*Use how many items? 1, 2, or 3*/
_SMusehowmanyitems = 2;


/*items*/
_SMitem1 = "Exile_Item_PlasticBottleFreshWater";
_SMitem2 = "Exile_Item_DuctTape";
_SMitem3 = "Exile_Item_JunkMetal";

/*Uses poptabs?*/
_SMusepoptabs = true;

/*^^ if so how much?*/
_SMremovepoptabsammount = 100;
_smremovepoptabsammount1 = 99; // one below above!

/*Quadbike or bike?*/
_SMbike = true; //true for bike, false for quad

/*
	functions :)
	--- === ---
	Use 1 item.
*/
if(!((vehicle player) isEqualTo player)) exitWith {hint "Exit the vehicle to deploy!"};
if(_SMusehowmanyitems == 1) then {
	if(_SMbike) then {
		if(_SMitem1 in magazines player) then {
			player removeMagazine _SMitem1;
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 8;
			if(_SMusepoptabs) then {
				if(ExileClientPlayerMoney < _smremovepoptabsammount1) then {
					hint "you do not have enough poptabs!";
				} else {
					ExileClientPlayerMoney = ExileClientPlayerMoney -_SMremovepoptabsammount;
					['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
					_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
					_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
					_vehicle setDir (getDir player);
				};
			} else {
				['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
				_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
				_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
				_vehicle setDir (getDir player);
			};
		} else {
			hint "You do not have the required items in your inventory to deploy a Bike!";
		};
	} else {
		if(_SMitem1 in magazines player) then {
			player removeMagazine _SMitem1;
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 8;
			if(_SMusepoptabs) then {
				if(ExileClientPlayerMoney < _smremovepoptabsammount1) then {
					hint "you do not have enough poptabs!";
				} else {
					ExileClientPlayerMoney = ExileClientPlayerMoney -_SMremovepoptabsammount;
					['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
					_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
					_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
					_vehicle setDir (getDir player);
				};
			} else {
				['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
				_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
				_vehicle = createVehicle ["Exile_Bike_QuadBike_Black", _posplr, [], 0, "NONE"];
				_vehicle setDir (getDir player);
			};
		} else {
			hint "You do not have the required items in your inventory to deploy a Quad!";
		};
	};
};
/*
	--- === ---
	Use 2 items
*/
if(_SMusehowmanyitems == 2) then {
	if(_SMbike) then {
		if(_SMitem1 in magazines player and _SMitem2 in magazines player) then {
			player removeMagazine _SMitem1;
			player removeMagazine _SMitem2;
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 8;
			if(_SMusepoptabs) then {
				if(ExileClientPlayerMoney < _smremovepoptabsammount1) then {
					hint "you do not have enough poptabs!";
				} else {
					ExileClientPlayerMoney = ExileClientPlayerMoney -_SMremovepoptabsammount;
					['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
					_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
					_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
					_vehicle setDir (getDir player);
				};
			} else {
				['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
				_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
				_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
				_vehicle setDir (getDir player);
			};
		} else {
			hint "You do not have the required items in your inventory to deploy a Bike!";
		};
	} else {
		if(_SMitem1 in magazines player and _SMitem2 in magazines player) then {
			player removeMagazine _SMitem1;
			player removeMagazine _SMitem2;
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 8;
			if(_SMusepoptabs) then {
				if(ExileClientPlayerMoney < _smremovepoptabsammount1) then {
					hint "you do not have enough poptabs!";
				} else {
					ExileClientPlayerMoney = ExileClientPlayerMoney -_SMremovepoptabsammount;
					['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
					_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
					_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
					_vehicle setDir (getDir player);
				};
			} else {
				['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
				_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
				_vehicle = createVehicle ["Exile_Bike_QuadBike_Black", _posplr, [], 0, "NONE"];
				_vehicle setDir (getDir player);
			};
		} else {
			hint "You do not have the required items in your inventory to deploy a Quad!";
		};
	};
};

/*
	--- === ---
	Use 3 items
*/
if(_SMusehowmanyitems == 3) then {
	if(_SMbike) then {
		if(_SMitem1 in magazines player and _SMitem2 in magazines player and _SMitem3 in magazines player) then {
			player removeMagazine _SMitem1;
			player removeMagazine _SMitem2;
			player removeMagazine _SMitem3;
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 8;
			if(_SMusepoptabs) then {
				if(ExileClientPlayerMoney < _smremovepoptabsammount1) then {
					hint "you do not have enough poptabs!";
				} else {
					ExileClientPlayerMoney = ExileClientPlayerMoney -_SMremovepoptabsammount;
					['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
					_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
					_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
					_vehicle setDir (getDir player);
				};
			} else {
				['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
				_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
				_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
				_vehicle setDir (getDir player);
			};
		} else {
			hint "You do not have the required items in your inventory to deploy a Bike!";
		};
	} else {
		if(_SMitem1 in magazines player and _SMitem2 in magazines player and _SMitem3 in magazines player) then {
			player removeMagazine _SMitem1;
			player removeMagazine _SMitem2;
			player removeMagazine _SMitem3;
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 8;
			if(_SMusepoptabs) then {
				if(ExileClientPlayerMoney < _smremovepoptabsammount1) then {
					hint "you do not have enough poptabs!";
				} else {
					ExileClientPlayerMoney = ExileClientPlayerMoney -_SMremovepoptabsammount;
					['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
					_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
					_vehicle = createVehicle ["Exile_Bike_OldBike", _posplr, [], 0, "NONE"];
					_vehicle setDir (getDir player);
				};
			} else {
				['Bike Deployed!',0,1,2,2] spawn bis_fnc_dynamictext;
				_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
				_vehicle = createVehicle ["Exile_Bike_QuadBike_Black", _posplr, [], 0, "NONE"];
				_vehicle setDir (getDir player);
			};
		} else {
			hint "You do not have the required items in your inventory to deploy a Quad!";
		};
	};
};