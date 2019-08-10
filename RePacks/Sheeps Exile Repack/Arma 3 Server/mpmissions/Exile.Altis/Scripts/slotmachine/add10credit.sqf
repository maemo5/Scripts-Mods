disableSerialization;
_playerMoney = ExileClientPlayerMoney;
//disable to stop spam
_dialog = findDisplay 9000;
_spinbtn = _dialog displayCtrl 1600;
_bet1 = _dialog displayCtrl 1601;
_bet10 = _dialog displayCtrl 1602;
_cashout = _dialog displayCtrl 1603;
_spinbtn ctrlEnable false;
_bet1 ctrlEnable false;
_bet10 ctrlEnable false;
_cashout ctrlEnable false;

if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN",3]; 
		titleFadeOut 5;
	 } else {
	if ( _playerMoney >= 10000 ) then{
		 //remove cost
		_newPoptabs = ExileClientPlayerMoney - 10000;
		ENIGMA_UpdateStats = [player,_newPoptabs];
		publicVariableServer "ENIGMA_UpdateStats";
		 //add credits
		 SlotsPlayerCredits = SlotsPlayerCredits + 10;
		 titleText ["Added 10 credits.","PLAIN DOWN",3];
		 titleFadeOut 5;		 
		 //Update credits display	
		 _dialog = findDisplay 9000;
		 (_dialog displayCtrl 1001) ctrlSetText format ["%1" ,SlotsPlayerCredits];
		//Wait and enable button again
		sleep 0.5;
		_spinbtn ctrlEnable true;
		_bet1 ctrlEnable true;
		_bet10 ctrlEnable true;
		_cashout ctrlEnable true;
	   }else{
	   //Enable btn
	   _spinbtn ctrlEnable true;
		_bet1 ctrlEnable true;
		_bet10 ctrlEnable true;
		_cashout ctrlEnable true;
		 titleText ["You need 10000 to add 10 credits!","PLAIN DOWN",3]; 
		 titleFadeOut 5;
	   };
   };