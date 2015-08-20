/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_string = _x select 0;
	if(!isNil '_string')then
	{
		_arraystring = toArray _string;
		_state = call {
			if(_arraystring isEqualTo [])exitWith{true};
			if({_x isEqualTo 91} count _arraystring != 1)exitWith{false};
			if({_x isEqualTo 93} count _arraystring != 1)exitWith{false};
			if({_x isEqualTo 44} count _arraystring > 2)exitWith{false};
			if({_x isEqualTo 46} count _arraystring > 3)exitWith{false};
			_exitstate = true;
			{if!(_x in [91,93,44,46,49,50,51,52,53,54,55,56,57,48,32,9,34,39])exitWith{_exitstate=false;};} forEach _arraystring;
			if(!_exitstate)exitWith{false};
			_exitstate
		};
		if(!_state)exitWith{
			life_houses deleteAt forEachIndex;
		};
		
		_position = call compile format["%1",_string];
		_house = nearestBuilding _position;
		_house setVariable["uid",round(random 99999),true];
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		
		_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
		_marker setMarkerTextLocal _houseName;
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
	};
} foreach life_houses;
besitzt_Haus = 1;