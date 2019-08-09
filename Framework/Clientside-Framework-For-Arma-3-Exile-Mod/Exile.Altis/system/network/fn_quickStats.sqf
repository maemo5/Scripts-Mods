hintSilent parseText format 
["
		<t size='1.65' align='center'>QUICK STATS</t><br/>
		<t size='1.15' align='left'>  Tabs: </t><t size='1.15'  align='right'>%1</t><br/>
		<t size='1.15' align='left'>  Respect: </t><t size='1.15'  align='right'>%2</t><br/>
		<t size='1.15' align='left'>  Health: </t><t size='1.15'  align='right'>%3</t><br/>
		<t size='1.15' align='left'>  Thirst: </t><t size='1.15'  align='right'>%4</t><br/>
		<t size='1.15' align='left'>  Hunger: </t><t size='1.15'  align='right'>%5</t><br/>
		<t size='1.15' align='left'>  Players Online: </t><t size='1.15'  align='right'>%6</t><br/>
		<br/>
		<t size='1.15'  align='left'>  Website: </t><t size='1.15'  align='right'>EDIT WEB INFO</t><br/>
		<t size='1.15'  align='left'>  Teamspeak: </t><t size='1.15'  align='right'>EDIT TS INFO</t><br/>
		<t size='1'  align='center'>=====================</t><br/>
		<t size='1.15' align='left'>  FPS: </t><t size='1.15'  align='right'>%7</t><br/>
		<t size='1.15'  align='left'>  Set User Action 1 For Lock/UnL Key </t><br/>
		<t size='1.15'  align='left'>  Double-Click Radio to deploy bike</t><br/>
		<t size='1.15'  align='left'>  Check the map sidebar for more info</t><br/>
		<br/>",
		ExileClientPlayerMoney,
		ExileClientPlayerScore,
		round((1 - (damage player)) * 100),
		round (ExileClientPlayerAttributes select 3),
		round (ExileClientPlayerAttributes select 2),
		independent countSide playableUnits,
		round diag_fps
];
sleep 4;
hintSilent "";