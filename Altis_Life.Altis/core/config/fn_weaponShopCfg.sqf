#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_anwaerter":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			default
			{
				["Anwärter Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["hgun_P07_snds_F",Tazer-Pistole,10],
						["30Rnd_9x21_Mag",Taser-Pistole Munition,10],
						["SMG_01_F",Tazer-Gewehr,10],
						["30Rnd_45ACP_Mag_SMG_01"Tazer-Gewehr Munition,10],
						["muzzle_snds_acp",Tazer-Gewehr Schalldämpfer,10],
						["optic_Holosight_smg",nil,10],
						["optic_Aco_smg",nil,10],
						["optic_ACO_grn_smg,nil,10"]
					]
				];
			};
		};
	};

	case "cop_meister":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 1): {"Du kannst erst als Polizistmeister hier Zugreifen !"};
			default
			{
				["Meister Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["muzzle_snds_H",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10]
					]
				];
			};
		};
	};

	case "cop_omeister":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 2): {"Du kannst erst als Polizeiobermeister hier Zugreifen!"};
			default
			{
				["Obermeister Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["SmokeShellBlue",CE Gas,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["muzzle_snds_H",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_DMS",nil,10]
					]
				];
			};
		};
	};

	case "cop_hmeister":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 3): {"Du kannst erst als Polizeihauptmeister hier Zugreifen!"};
			default
			{
				["Hauptmeister Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["SmokeShellBlue",CE Gas,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["muzzle_snds_H",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10]
					]
				];
			};
		};
	};

	case "cop_kommissar":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 4): {"Du kannst erst als Polizeikommissar hier Zugreifen!"};
			default
			{
				["Kommissar Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_cased_Box",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["muzzle_snds_H",nil,10],
						["bipod_01_F_blk",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10]
					]
				];
			};
		};
	};

	case "cop_okommissar":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 5): {"Du kannst erst als Polizeioberkommissar hier Zugreifen!"};
			default
			{
				["Oberkommissar Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_cased_Box",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["LMG_Zafir_F",nil,10],
						["150Rnd_762x54_Box",nil,10],
						["muzzle_snds_H",nil,10],
						["bipod_01_F_blk",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10]
					]
				];
			};
		};
	};

	case "cop_hkommissar":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 6): {"Du kannst erst als Polizeihauptkommissar hier Zugreifen!"};
			default
			{
				["Hauptkommissar Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_cased_Box",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["LMG_Zafir_F",nil,10],
						["150Rnd_762x54_Box",nil,10],
						["MMG_02_black_F",nil,10],
						["130Rnd_338_Mag",nil,10],
						["muzzle_snds_H",nil,10],
						["bipod_01_F_blk",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_NVS",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10],
						["optic_SOS",nil,10]
					]
				];
			};
		};
	};

	case "cop_rat":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 7): {"Du kannst erst als Polizeirat hier Zugreifen!"};
			default
			{
				["Rat Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["Laserdesignator",nil,10],
						["Laserbatteries",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_cased_Box",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["srifle_DMR_05_blk_F",nil,10],
						["10Rnd_93x64_DMR_05_Mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["LMG_Zafir_F",nil,10],
						["150Rnd_762x54_Box",nil,10],
						["MMG_02_black_F",nil,10],
						["130Rnd_338_Mag",nil,10],
						["muzzle_snds_H",nil,10],
						["bipod_01_F_blk",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_NVS",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10],
						["optic_SOS",nil,10],
						["optic_LRPS",nil,10]
					]
				];
			};
		};
	};

	case "cop_orat":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 8): {"Du kannst erst als Polizeioberrat hier Zugreifen!"};
			default
			{
				["Oberrat Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["Laserdesignator",nil,10],
						["Laserbatteries",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_cased_Box",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["srifle_DMR_05_blk_F",nil,10],
						["10Rnd_93x64_DMR_05_Mag",nil,10],
						["srifle_LRR_F",nil,10],
						["7Rnd_408_Mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["LMG_Zafir_F",nil,10],
						["150Rnd_762x54_Box",nil,10],
						["MMG_02_black_F",nil,10],
						["130Rnd_338_Mag",nil,10],
						["muzzle_snds_H",nil,10],
						["bipod_01_F_blk",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_NVS",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10],
						["optic_SOS",nil,10],
						["optic_LRPS",nil,10]
					]
				];
			};
		};
	};
	
	case "cop_direktoren":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 9): {"Du kannst erst als Polizeidirektor hier Zugreifen!"};
			default
			{
				["Direktoren Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["Laserdesignator",nil,10],
						["Laserbatteries",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["arifle_Mk20_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MXM_F",nil,10],
						["arifle_MXM_Black_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_cased_Box",nil,10],
						["srifle_EBR_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["srifle_DMR_05_blk_F",nil,10],
						["10Rnd_93x64_DMR_05_Mag",nil,10],
						["srifle_LRR_F",nil,10],
						["7Rnd_408_Mag",nil,10],
						["srifle_GM6_F",nil,10],
						["5Rnd_127x108_Mag",nil,10],
						["5Rnd_127x108_APDS_Mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["LMG_Zafir_F",nil,10],
						["150Rnd_762x54_Box",nil,10],
						["MMG_02_black_F",nil,10],
						["130Rnd_338_Mag",nil,10],
						["muzzle_snds_H",nil,10],
						["bipod_01_F_blk",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_NVS",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10],
						["optic_SOS",nil,10],
						["optic_LRPS",nil,10],
						["optic_Nightstalker",nil,10],
						["optic_tws",nil,10],
						["optic_tws_mg",nil,10]
					]
				];
			};
		};
	};	
	
	case "cop_sek":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (!license_cop_sek): {"Du bist kein SEK-Beamter!"};
			default
			{
				["SEK Waffen Shop",
					[
						["Binocular",nil,10],
						["NVGoggles",nil,10],
						["NVGoggles_INDEP",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Medikit",nil,10],
						["ToolKit",nil,10],
						["Rangefinder",nil,10],
						["Laserdesignator",nil,10],
						["Laserbatteries",nil,10],
						["HandGrenade_Stone",Blendgranate,10],
						["SmokeShellBlue",CE Gas,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["SMG_02_F",nil,10],
						["30Rnd_9x21_Mag",nil,10],
						["arifle_Katiba_F",nil,10],
						["arifle_Katiba_GL_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MK20_F",nil,10],
						["arifle_MK20_GL_F",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["arifle_MXC_F",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MX_GL_F",nil,10],
						["30Rnd_65x39_caseless_mag",nil,10],
						["arifle_MX_SW_F",nil,10],
						["100Rnd_65x39_caseless_mag",nil,10],
						["LMG_MK200_LP_BI_F",nil,10],
						["200Rnd_65x39_cased_Box",nil,10],
						["MMG_01_hex_F",nil,10],
						["150Rnd_93x64_Mag",nil,10],
						["MMG_02_black_F",nil,10],
						["130Rnd_338_Mag",nil,10],
						["srifle_DMR_05_blk_F",nil,10],
						["10Rnd_93x64_DMR_05_Mag",nil,10],
						["srifle_DMR_03_F",nil,10],
						["20Rnd_762x51_Mag",nil,10],
						["srifle_DMR_02_F",nil,10],
						["10Rnd_338_Mag",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_grn",nil,10],
						["optic_MRCO",nil,10],
						["optic_Hamr",nil,10],
						["optic_NVS",nil,10],
						["optic_DMS",nil,10],
						["optic_AMS",nil,10],
						["optic_AMS_snd",nil,10],
						["optic_SOS",nil,10],
						["optic_LRPS",nil,10],
						["1Rnd_SmokeRed_Grenade_shell",nil,10],
						["1Rnd_SmokeGreen_Grenade_shell",nil,10],
						["1Rnd_SmokeBlue_Grenade_shell",nil,10],
						["3Rnd_SmokeRed_Grenade_shell",nil,10],
						["3Rnd_SmokeGreen_Grenade_shell",nil,10],
						["3Rnd_SmokeBlue_Grenade_shell",nil,10]
					]
				];
			};
		};
	};
		
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein ADAC"};
			case (__GETC__(life_mediclevel) < 2): {"Du kannst erst als ADAC hier Zugreifen !"}; 
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein MEDIC"};
			case (__GETC__(life_mediclevel) < 1): {"Du kannst erst als MEDIC hier Zugreifen !"}; 
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
		
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_rebel): {"Du besitz keine Rebellen Lizenz!"};
			default
			{
				["Mohammed's Waffen Laden",
					[
						["arifle_TRG20_F",nil,350000],
						["arifle_Katiba_F",nil,300000],
						["srifle_EBR_F",nil,375000],
						["SMG_01_F",nil,100000],
						["hgun_Pistol_heavy_01_MRD_F",nil,25000],
						["hgun_P07_F",nil,15000],
						["srifle_DMR_01_F",nil,300000],
						["arifle_SDAR_F",nil,75000],
						["acc_flashlight",nil,7500],
						["acc_pointer_IR",nil,15000],
						["optic_ACO_grn",nil,5000],
						["optic_Aco_smg",nil,5000],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,10500],
						["optic_NVS",nil,20000],
						["optic_DMS",nil,40000],
						["30Rnd_9x21_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,150],
						["SmokeShellGreen",nil,2500],
						["muzzle_snds_M",nil,10000],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["20Rnd_762x51_Mag","MK18 Magazin",500],
						["11Rnd_45ACP_Mag",nil,1000],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag","Rahim Magazin",500],
						["30Rnd_65x39_caseless_green",nil,275]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_P07_F",nil,15000],
						["hgun_Pistol_heavy_02_F",nil,20000],
						["hgun_ACPC2_F",nil,17500],
						["hgun_PDW2000_F",nil,30000],
						["optic_ACO_grn_smg",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Rang 1",
					[
						["hgun_P07_F",nil,1250],
						["hgun_PDW2000_F",nil,6500],
						["hgun_ACPC2_F",nil,11500],
						["optic_ACO_grn_smg",nil,750],
						["hgun_pistol_heavy_01_F",nil,6000],
						["optic_MRCO",nil,10000],
						["ToolKit",nil,50],
						["NVGoggles",nil,350],
						["Rangefinder",nil,5000],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Rang 2",
					[
						["hgun_P07_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,6000],
						["arifle_Mk20C_plain_F",nil,45000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,100],
						["itemGPS",nil,100],
						["FirstAidKit",nil,25],
						["Rangefinder",nil,5000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) == 3):
			{
				["Söldner Waffen Händler",
					[
						["hgun_P07_F",nil,5000],
						["hgun_PDW2000_F",nil,10000],
						["arifle_TRG21_F",nil,250000],
						["arifle_Mk20C_F",nil,100000],
						["arifle_Mk20_F",nil,125000],
						["arifle_Mk20_GL_F",nil,150000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_EBR_F",nil,225000],
						["arifle_Katiba_F",nil,25000],
						["hgun_pistol_heavy_01_F",nil,12500],
						["hgun_ACPC2_F",nil,13500],
						["optic_ACO_grn",nil,7500],
						["optic_MRCO",nil,10000],
						["optic_LRPS",nil,50000],
						["optic_DMS",nil,25000],
						["Rangefinder",nil,15000],
						["SmokeShellGreen",nil,2500],
						["1Rnd_SmokeGreen_Grenade_shell",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_acp",nil,10000],
						["muzzle_snds_M",nil,30000],
						["muzzle_snds_H",nil,20000],
						["NVGoggles_INDEP",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_65x39_caseless_green",nil,750],
						["10Rnd_762x51_Mag",nil,750],
						["20Rnd_762x51_Mag",nil,750],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["9Rnd_45ACP_Mag",nil,100],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
		    };
		};
	};
	
	case "genstore":
	{
		["Altis Elektro-Händler",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemWatch",nil,50],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,1500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "uranium":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Du bist kein Zivilist"};
            case (!license_civ_uranium): {"Du benötigst eine Uran-Lizenz"};
            default
            {
                ["Uran Verkäufer",
                    [
                        ["ToolKit",nil,200],
                        ["FirstAidKit",nil,100],
                        ["U_I_HeliPilotCoveralls","Anti-Strahlungs Anzug",50000]
                    ]
                ];
            };
        };
    }; 
};
