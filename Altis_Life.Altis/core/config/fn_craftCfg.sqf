#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Waffen herstellen",
					[
						["hgun_P07_F", ["life_inv_goldbar",1,"life_inv_copperr",1]],
						["SMG_01_F", ["life_inv_goldbar",3,"life_inv_copperr",5,"life_inv_ironr",6,"life_inv_diamondr",1]],
						["arifle_Mk20_F", ["life_inv_goldbar",6,"life_inv_copperr",10,"life_inv_ironr",8]]

					]
				];
			};
		};
	};
};