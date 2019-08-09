/*
	Made By: Andrew_S90 http://www.exilemod.com/profile/14063-andrew_s90/

	Features: Allows player to paint their vehicles, choosing any RGB color combo they want with 3 sliders
			Allows players to save 4 custom paint colors to use later, shows the preview color and allows
			players to test on their vehicles. Does not save over restart currently.
			Allows players to reset the texture to default if desired.
			Allows admins to set custom textures if they want.
			
	Requires: XM8Apps http://www.exilemod.com/topic/9040-xm8-apps/
			 Enigma Exile Update Respect/Poptabs http://www.exilemod.com/topic/7577-enigma-exile-update-respectpoptabs-180316/
			 
	Credits: Halv - Original Paintshop, getting the textures and default texture was derived from his script, most was created fresh for the XM8 however
			Shix - created XM8Apps!
			Exile - yes +1
			Happydayz - Update Respect/Poptabs + is cool
			Taylor Swift (Mezo) - get rekt
			
	
	
	Change the Apply cost and presetTextures below!! Happy Editing!
*/


PaintApplyCost = 500;

PresetTextures =
[
//Saved Colors
	["Saved Color 1",format["#(argb,8,8,3)color(%1,%2,%3,%4)",PaintShopSaved1 select 0,PaintShopSaved1 select 1,PaintShopSaved1 select 2,PaintShopSaved1 select 3]],
	["Saved Color 2",format["#(argb,8,8,3)color(%1,%2,%3,%4)",PaintShopSaved2 select 0,PaintShopSaved2 select 1,PaintShopSaved2 select 2,PaintShopSaved2 select 3]],
	["Saved Color 3",format["#(argb,8,8,3)color(%1,%2,%3,%4)",PaintShopSaved3 select 0,PaintShopSaved3 select 1,PaintShopSaved3 select 2,PaintShopSaved3 select 3]],
	["Saved Color 4",format["#(argb,8,8,3)color(%1,%2,%3,%4)",PaintShopSaved4 select 0,PaintShopSaved4 select 1,PaintShopSaved4 select 2,PaintShopSaved4 select 3]],
//colors
	["Red","#(argb,8,8,3)color(1,0,0,1)"],
	["Green","#(argb,8,8,3)color(0,1,0,1)"],
	["Blue","#(argb,8,8,3)color(0,0,1,1)"],
	["Black","#(argb,8,8,3)color(0,0,0,0.6)"],
	["Pink","#(argb,8,8,3)color(1,0.75,0.84,0.2)"],
	["Tan","#(argb,8,8,3)color(0.8,0.7,0.5,0.2)"],
	//["Blue Tiger","xm8Apps\XM8Paintshop\extratextures\TextureBlueTiger.paa"], //example extra textures
//Flags/Countrys
	["RAINBRO","\exile_assets\texture\flag\flag_misc_rainbow_co.paa"],
	["Downunder","\exile_assets\texture\flag\flag_country_au_co.paa"],
	["Belgium","\exile_assets\texture\flag\flag_country_be_co.paa"],
	["Belarus","\exile_assets\texture\flag\flag_country_by_co.paa"],
	["Hocky Land","\exile_assets\texture\flag\flag_country_cn_co.paa"],
	["Czech This","\exile_assets\texture\flag\flag_country_cz_co.paa"],
	["MrWhite","\exile_assets\texture\flag\flag_country_de_co.paa"],
	["Suomi","\exile_assets\texture\flag\flag_country_fi_co.paa"],
	["Surrender!","\exile_assets\texture\flag\flag_country_fr_co.paa"],
	["Croatia","\exile_assets\texture\flag\flag_country_hr_co.paa"],
	["Potato Land","\exile_assets\texture\flag\flag_country_ir_co.paa"],
	["Nederland","\exile_assets\texture\flag\flag_country_nl_co.paa"],
	["Poland","\exile_assets\texture\flag\flag_country_pl_co.paa"],
	["Sweden","\exile_assets\texture\flag\flag_country_se_co.paa"],
	["RUSSIA!","\exile_assets\texture\flag\flag_country_ru_co.paa"],
	["Murica","\A3\Data_F\Flags\flag_us_co.paa"],
	["EXILE!","\exile_assets\texture\flag\flag_misc_exile_co.paa"],
	["GG Arma","\exile_assets\texture\flag\flag_mate_bis_co.paa"],
	["KITTY!","\exile_assets\texture\flag\flag_misc_dream_cat_co.paa"]
];