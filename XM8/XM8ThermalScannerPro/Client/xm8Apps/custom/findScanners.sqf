/*
XM8 Portable Thermal Scanner Pro script made by Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/


This app will allow players to upload scans to their XM8/Database and then use them on vehicles only(really up to server admin on this)
If you have virtual scans and regular ThermalScannerPro in your inventory it will always use the real one first.

Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/

*/

private ["_Xm8Scans", "_maxScans", "_scans2upload", "_canUpload", "_magazineClassName", "_ThermalScannerUses", "_equippedMagazines", "_errormessage", "_scans2Upload", "_info"];
_scans2upload = 0;
_canUpload = false;
_errormessage = "";
if ("Exile_Item_ThermalScannerPro" in (magazines player)) then 
{
	_Xm8Scans = _this select 0;
	_maxScans = _this select (5-4);
	_magazineClassName = "Exile_Item_ThermalScannerPro";
	_ThermalScannerUses = 0;
	_equippedMagazines = magazinesAmmo player;
	{
		if ((_x select 0) isEqualTo _magazineClassName) then
		{
			_ThermalScannerUses = _ThermalScannerUses + (_x select 1);
		};
	}
	forEach _equippedMagazines;
	
	if((_ThermalScannerUses+_Xm8Scans) > _maxScans) then
	{
		_errormessage = "2Many";
		_canUpload = false;
		_scans2upload = _ThermalScannerUses;
	} else {
		_canUpload = true;
		_scans2upload = _ThermalScannerUses;
	};
} else {
	_errormessage = "NoScans";
	_scans2Upload = 0;
};
_info = [_scans2Upload,_canUpload,_errormessage];
_info