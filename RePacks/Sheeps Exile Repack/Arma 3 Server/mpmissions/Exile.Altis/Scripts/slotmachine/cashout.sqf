disableSerialization;

if (SlotsPlayerCredits >= 1) then {
	//Disable btns
	_dialog = findDisplay 9000;
	_spinbtn = _dialog displayCtrl 1600;
	_bet1 = _dialog displayCtrl 1601;
	_bet10 = _dialog displayCtrl 1602;
	_cashout = _dialog displayCtrl 1603;
	_spinbtn ctrlEnable false;
	_bet1 ctrlEnable false;
	_bet10 ctrlEnable false;
	_cashout ctrlEnable false;
	
	_CashBack = SlotsPlayerCredits * 1000;
	
	//Remove credits
	SlotsPlayerCredits = 0;
	//cash back
	_newPoptabs = ExileClientPlayerMoney + _CashBack;
	ENIGMA_UpdateStats = [player,_newPoptabs];
	publicVariableServer "ENIGMA_UpdateStats";
	//Update text
	_dialog = findDisplay 9000;
	_slotcredits = _dialog displayCtrl 1001;
	_slotcredits ctrlSetText format["%1",SlotsPlayerCredits];

	titleText ["Credits refunded.","PLAIN DOWN", 3]; 
	titleFadeOut 5;
	sleep 0.5;
	closeDialog 9000;
}else{
	titleText ["No Credits - Closing app.","PLAIN DOWN", 3]; 
	titleFadeOut 5;
	closeDialog 9000;
};
