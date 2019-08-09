class XM8_App07_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "xm8Apps\Scaner\icon_Scan.paa";
    text = "Player Scan";
    onButtonClick = "['GG_Scan'] spawn ExAd_XM8_Scan_fnc_ScanPlayer";
    resource = "";
};