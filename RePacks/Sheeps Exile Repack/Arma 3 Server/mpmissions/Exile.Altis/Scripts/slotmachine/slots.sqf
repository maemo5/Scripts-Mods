//////////////////////////////////
//			SLOT MACHINE		//
//		By - Fallingsheep		//
//		ReWritten for exile		//
////////////////////////////////// 
disableSerialization;

reelArray = ["cherry","lemon","grape","watermelon","orange","bar","seven","diamond"];
slotspictures = ["pictures\image1.jpg","pictures\image2.jpg","pictures\image3.jpg","pictures\image4.jpg","pictures\image5.jpg","pictures\image6.jpg","pictures\image7.jpg","pictures\image8.jpg"];

_dialog = findDisplay 9000;
_spinbtn = _dialog displayCtrl 1600;
_bet1 = _dialog displayCtrl 1601;
_bet10 = _dialog displayCtrl 1602;
_cashout = _dialog displayCtrl 1603;
_reel1 = _dialog displayCtrl 1200;
_reel2 = _dialog displayCtrl 1201;
_reel3 = _dialog displayCtrl 1202;

//Check if has credits
if (SlotsPlayerCredits <= 0) then {
	 hasSlotsCredits = false;
	 titleText ["You have no credits!","PLAIN DOWN",3]; 
	 titleFadeOut 5;
}else{
	 hasSlotsCredits = true;
};

//Begin Spin	   
if (hasSlotsCredits) then {
	//disable btns
	_spinbtn ctrlEnable false;
	_bet1 ctrlEnable false;
	_bet10 ctrlEnable false;
	_cashout ctrlEnable false;
	IsSpinning = true;
	//remove credit update display
	SlotsPlayerCredits = SlotsPlayerCredits - 1;	 
	_dialog = findDisplay 9000;
	_slotcredits = _dialog displayCtrl 1001;
	_slotcredits ctrlSetText format["%1",SlotsPlayerCredits];
	
	//random images	 
	_counter = 0;
	while {_counter < 20} do
	{
		reel1 = slotspictures call BIS_fnc_selectRandom;
		reel2 = slotspictures call BIS_fnc_selectRandom;
		reel3 = slotspictures call BIS_fnc_selectRandom;
		//starting images
		_reel1 ctrlSetText format ["%1" ,reel1];
		_reel2 ctrlSetText format ["%1" ,reel2];
		_reel3 ctrlSetText format ["%1" ,reel3];
		sleep 0.01;
		_counter = _counter + 1;
	};
	
	SlotsWinChance = random 100;
	//10% chance to win
	if(SlotsWinChance > 90) then{
		reel1 = reelArray call BIS_fnc_selectRandom;
		reel2 = reel1;
		reel3 = reel1;
	}else{
		reel1 = reelArray call BIS_fnc_selectRandom;
		reel2 = reelArray call BIS_fnc_selectRandom;
		reel3 = reelArray call BIS_fnc_selectRandom;
	};
	SlotsWinChance = 0; //reset win chance
	sleep 0.1;
	//reel 1
	if (reel1 == "cherry") then {
	_reel1 ctrlSetText "pictures\image1.jpg";
	};
	if (reel1 == "lemon") then {
	_reel1 ctrlSetText "pictures\image2.jpg";
	};
	if (reel1 == "grape") then {
	_reel1 ctrlSetText "pictures\image3.jpg";
	};
	if (reel1 == "watermelon") then {
	_reel1 ctrlSetText "pictures\image4.jpg";
	};
	if (reel1 == "orange") then {
	_reel1 ctrlSetText "pictures\image5.jpg";
	};
	if (reel1 == "bar") then {
	_reel1 ctrlSetText "pictures\image6.jpg";
	};
	if (reel1 == "seven") then {
	_reel1 ctrlSetText "pictures\image7.jpg";
	};
	if (reel1 == "diamond") then {
	_reel1 ctrlSetText "pictures\image8.jpg";
	};
	//reel2
	if (reel2 == "cherry") then {
	_reel2 ctrlSetText "pictures\image1.jpg";
	};
	if (reel2 == "lemon") then {
	_reel2 ctrlSetText "pictures\image2.jpg";
	};
	if (reel2 == "grape") then {
	_reel2 ctrlSetText "pictures\image3.jpg";
	};
	if (reel2 == "watermelon") then {
	_reel2 ctrlSetText "pictures\image4.jpg";
	};
	if (reel2 == "orange") then {
	_reel2 ctrlSetText "pictures\image5.jpg";
	};
	if (reel2 == "bar") then {
	_reel2 ctrlSetText "pictures\image6.jpg";
	};
	if (reel2 == "seven") then {
	_reel2 ctrlSetText "pictures\image7.jpg";
	};
	if (reel2 == "diamond") then {
	_reel2 ctrlSetText "pictures\image8.jpg";
	};
	 //reel 3
	if (reel3 == "cherry") then {
	_reel3 ctrlSetText "pictures\image1.jpg";
	};
	if (reel3 == "lemon") then {
	_reel3 ctrlSetText "pictures\image2.jpg";
	};
	if (reel3 == "grape") then {
	_reel3 ctrlSetText "pictures\image3.jpg";
	};
	if (reel3 == "watermelon") then {
	_reel3 ctrlSetText "pictures\image4.jpg";
	};
	if (reel3 == "orange") then {
	_reel3 ctrlSetText "pictures\image5.jpg";
	};
	if (reel3 == "bar") then {
	_reel3 ctrlSetText "pictures\image6.jpg";
	};
	if (reel3 == "seven") then {
	_reel3 ctrlSetText "pictures\image7.jpg";
	};
	if (reel3 == "diamond") then {
	_reel3 ctrlSetText "pictures\image8.jpg";
	};
	//Check Prize and pay out
	if ((reel1 == reel2) && (reel2 == reel3)) then {
		if (reel1 == "cherry") then {
		titleText ["You won 500","PLAIN DOWN",3]; 
		titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE1;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		};
		if (reel1 == "lemon") then {
		titleText ["You won 750","PLAIN DOWN",3]; 
		titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE2;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		};
		if (reel1 == "grape") then {
		titleText ["You won 1200","PLAIN DOWN",3]; 
		titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE3;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		};
		if (reel1 == "watermelon") then {
		titleText ["You won 2500","PLAIN DOWN",3]; 
		   titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE4;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		 };
		 if (reel1 == "orange") then {
		   titleText ["You won 5000","PLAIN DOWN",3]; 
		   titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE5;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		 };
		 if (reel1 == "bar") then {
		   titleText ["You won 7500","PLAIN DOWN",3]; 
		   titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE6;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		 };
		 if (reel1 == "seven") then {
		   titleText ["Jackpot! You won 10000","PLAIN DOWN",3]; 
		   titleFadeOut 5;
			_newPoptabs = ExileClientPlayerMoney + PRIZE7;
			ENIGMA_UpdateStats = [player,_newPoptabs];
			publicVariableServer "ENIGMA_UpdateStats";
		 };
		 if (reel1 == "diamond") then {
		   SlotsPlayerCredits = SlotsPlayerCredits + 3;
		   //update credits display  
		_dialog = findDisplay 9000;
		_slotcredits ctrlSetText format["%1",SlotsPlayerCredits];   
		   titleText ["You won 3 free spins!","PLAIN DOWN",3]; 
		   titleFadeOut 5;
		 };
   }else{
		titleText ["You lost.","PLAIN DOWN",3]; 
		titleFadeOut 5;
   };
   //enable btns
   IsSpinning = false;
	_spinbtn ctrlEnable true;
	_bet1 ctrlEnable true;
	_bet10 ctrlEnable true;
	_cashout ctrlEnable true;
   
};