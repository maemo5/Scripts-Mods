class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			//Bikes
			class PackDeployedVehicle: ExileAbstractAction
			{
				title = "Pack Vehicle";
				condition = "true";
				action = "_this call fnc_bike_scrap";
			};
		};
	};



class XM8_App06_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "xm8Apps\DeployQuad\icon_DeployVehicle.paa";
    text = "Deploy Quad";
    onButtonClick = "call fnc_bike_deploy;";
    resource = "";
};