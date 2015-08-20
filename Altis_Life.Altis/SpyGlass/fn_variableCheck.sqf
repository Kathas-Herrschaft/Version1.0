#include <macro.h>
#define DEBUG true
#define SPY_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "SpyGlass" >> SETTING)
/*
	File: fn_variableCheck.sqf
	
	Description:
	Checks against harmful variables, disable this if client-performance is 
	to bad in the fn_initSpy.sqf, the menuCheck should be good enough!
*/
private["_BIS_Functions","_LIFE_Functions","_SERVER_Functions","_SOCK_Functions","_DB_Functions","_allowedVariables","_checkFunction","_BIS_UI_Functions","_allowedVariables_UI","_profileCount"];
_BIS_Functions = SPY_SETTINGS(getArray,"BIS_Functions");
_BIS_UI_Functions = SPY_SETTINGS(getArray,"BIS_UI_Functions");
_LIFE_Functions = SPY_SETTINGS(getArray,"LIFE_Functions");
_SERVER_Functions = SPY_SETTINGS(getArray,"SERVER_Functions");
_SOCK_Functions = SPY_SETTINGS(getArray,"SOCK_Functions");
_allowedVariables = SPY_SETTINGS(getArray,"allowedVariables");
_allowedVariables_UI = SPY_SETTINGS(getArray,"allowedVariables_UI");
_profileCount = count allVariables profileNameSpace;

/* Build Player Slots because we name them and they are counted as variables */
for "_i" from 1 to 125 do {
	if(_i < SPY_SETTINGS(getNumber,"civSlotNumber")) then {_allowedVariables pushBack [format["civ_%1",_i],"OBJECT"]};
	if(_i < SPY_SETTINGS(getNumber,"copSlotNumber")) then {_allowedVariables pushBack [format["cop_%1",_i],"OBJECT"]};
	if(_i < SPY_SETTINGS(getNumber,"medSlotNumber")) then {_allowedVariables pushBack [format["medic_%2",_i],"OBJECT"]};
};

/* First lets clear out the memory of potentially bad variables */
{
	if(!(_x in _BIS_Functions)) then {
		if(!(_x in _LIFE_Functions)) then {
			if(!(_x in _SERVER_Functions)) then {
				if(!(_x in _SOCK_Functions)) then {
					if(!(_x in _BIS_UI_Functions)) then {
						_varType = typeName (GVAR_UINS _x);
						_find = _allowedVariables find [_x,_varType];
						if(EQUAL(_find,-1)) then {
							SVAR_UINS [_x,nil];
						};
					};
				};
			};
		};
	};
} foreach (allVariables uiNamespace);

/* Some people may be like WTF ALL DEM Checks... It was either this or lazy eval which could have a performance impact on the client. */
_checkFunction = {
	{
		if(!(_x in _BIS_Functions)) then {
			if(!(_x in _LIFE_Functions)) then {
				if(!(_x in _SERVER_Functions)) then {
					if(!(_x in _SOCK_Functions)) then {
						_varType = typeName (GVAR_MNS _x);
						_find = _allowedVariables find [_x,_varType];
						if(EQUAL(_find,-1)) then {
							diag_log format["Variable: %1 is not allowed TYPE: %2 NS: MN",_x,_varType];
							[[profileName,steamid,format["Non_whitelisted_variable:%1:TYPE:%2:NS:Mission",_x,_varType]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
							[[profileName,format["Non-whitelisted variable detected\nVariable: %1\nType: %2\nNamespace: Mission",_x,_varType]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
							uiSleep .5;
							failMission "SpyGlass";
						};
					};
				};
			};
		};
	} foreach allVariables missionNamespace;
};

_uiCheckFunction = {
	{
		if(!(_x in _BIS_Functions)) then {
			if(!(_x in _LIFE_Functions)) then {
				if(!(_x in _SERVER_Functions)) then {
					if(!(_x in _SOCK_Functions)) then {
						if(!(_x in _BIS_UI_Functions)) then {
							_varType = typeName (GVAR_UINS _x);
							_find = _allowedVariables_UI find [_x,_varType];
							if(EQUAL(_find,-1)) then {
								diag_log format["Variable: %1 is not allowed TYPE: %2 NS: UI",_x,_varType];
								[[profileName,steamid,format["Non_whitelisted_variable:%1:TYPE:%2:NS:UI",_x,_varType]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
								[[profileName,format["Non-whitelisted variable detected\nVariable: %1\nType: %2\nNamespace: UI",_x,_varType]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
								uiSleep .5;
								failMission "SpyGlass";
							};
						};
					};
				};
			};
		};
	} foreach allVariables uiNamespace;
};

while {true} do {
	systemChat "Calling check";
	objNull call _checkFunction;
	uiSleep 5; //Give a breather..
	objNull call _uiCheckFunction;
	if(!(EQUAL((count allVariables profileNameSpace),_profileCount)) OR ((count allVariables parsingNamespace) > 0)) then {
		diag_log "profileNamespace or parsingNamespace is a different size.";
		[[profileName,steamid,"profileNamespace or parsingNamespace has changed count sizes."],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
		[[profileName,"profileNamespace or parsingNamespace has changed count sizes."],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
		failMission "SpyGlass";
	};
	uiSleep (5 * 60); //Wait 5 minutes
};