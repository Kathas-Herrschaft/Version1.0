enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

//Exec Scripts and more...
life_versionInfo = "Altis Life RPG";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf"; //Load the Server Strings
[] execVM "script\fastrope.sqf"; //Load Fastrope
[] execVM "script\welcome.sqf"; //Load Welcome Intro
[] execVM "core\civilian\fn_welcome.sqf"; //Load Willkommen
[] execVM "script\teargas.sqf"; //Load Teargas Script for Cops
[] execVM "script\savezone.sqf"; //Load the Savezones
[] execVM "script\fn_statusBar.sqf"; //Load the Statusbar
enableEnvironment false;

//Scheiß Nebel hau ab
[] spawn {
	while{true} do {
		sleep 10;
		200 setFog 0;
		sleep 590;
	};
};
//Scheiß Regen hau ab
[] spawn {
	while{true} do {
		sleep 10;
		200 setRain 0;
		sleep 590;
	};
};
//Performance
setTerrainGrid 45;
setViewDistance 1000;
setObjectViewDistance [800,50];

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};