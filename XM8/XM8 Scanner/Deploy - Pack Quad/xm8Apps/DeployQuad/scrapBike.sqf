// 2016 (c) 0x2AFF (exceptionptr)
// https://github.com/0x2aff/XM8CustomDeployBike

if !((vehicle player) isEqualTo player) exitWith {};

if (typeOf cursorTarget == "Exile_Bike_QuadBike_Black" || typeOf cursorTarget == "Exile_Bike_QuadBike_Black") then {
    deletevehicle cursorTarget;
    player playMove "Medic";
    player additem "Exile_Item_DuctTape";
    ["SuccessTitleAndText", ["Quad Packed!", "You received your Duct Tape in return."]] call ExileClient_gui_toaster_addTemplateToast;
};
