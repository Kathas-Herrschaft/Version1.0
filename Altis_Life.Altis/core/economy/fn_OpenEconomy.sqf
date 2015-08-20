#include <macro.h>
/*
	File: fn_OpenEconomy.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type"];

disableSerialization;
createDialog "Market";
waitUntil {!isNull findDisplay 39000};
_display = findDisplay 39000;
_venteliste = _display displayCtrl 39002;
_achatliste = _display displayCtrl 39003;

lbClear _venteliste;
lbClear _achatliste;

[[0,player,"economy"],"TON_fnc_getprices",false,false] spawn life_fnc_MP;