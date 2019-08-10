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
if ( _playerMoney >= 1000 ) then{
		 //remove cost
		_newPoptabs = ExileClientPlayerMoney - 1000;
		ENIGMA_UpdateStats = [player,_newPoptabs];
		publicVariableServer "ENIGMA_UpdateStats";
		 //add credit
		 SlotsPlayerCredits = SlotsPlayerCredits + 1;
		 titleText ["Added 1 credit.","PLAIN DOWN",3];
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
		 titleText ["You need 1000 to add 1 credit!","PLAIN DOWN",3];
		 titleFadeOut 5;
	   };
   };