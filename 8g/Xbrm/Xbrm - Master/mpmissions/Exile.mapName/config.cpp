//CfgInteractionMenus
//Any feature you don't wish to use can be removed from here.

//add to: class Safe

			class RaidSafe : ExileAbstractAction
			{
				title = "Attempt Lockpicking";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "[ExileClientInteractionObject,'safe'] execVM 'addons\HEG_Xbrm_client\functions\Xbrm_lockpick_init.sqf'";
			};
			
			class TrapSafe : ExileAbstractAction
			{
				title = "Rig With Explosives";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "ExileClientInteractionObject execVM 'addons\HEG_Xbrm_client\functions\addTrap.sqf'";
			};
			
			class ScanSafe : ExileAbstractAction
			{
				title = "Scan For Explosives";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "ExileClientInteractionObject execVM 'addons\HEG_Xbrm_client\functions\scanTrap.sqf'";
			};
			
// add to: class Construction

			class RaidDoor : ExileAbstractAction
			{
				title = "Attempt Break In";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "[ExileClientInteractionObject,'door'] execVM 'addons\HEG_Xbrm_client\functions\Xbrm_lockpick_init.sqf'";
			};