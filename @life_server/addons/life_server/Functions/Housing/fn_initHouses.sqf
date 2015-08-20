/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count"];
waitUntil{!DB_Async_Active};
_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	waitUntil{!DB_Async_Active};
	_query = format["SELECT houses.id, houses.pid, houses.pos, spieler.name FROM houses INNER JOIN spieler ON houses.pid=spieler.playerid WHERE houses.owned='1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};
	
	{
		_string = _x select 2;
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
				_log = format['OBJECT POSITION BROKEN - %1 - OWNER [%2,%3] WITH ID %4',_string,_x select 1,_x select 3,_x select 0];
				'ARMA_LOG' callExtension format['fn_houseCleanup_LOG:%1',_log];
			};
			
			_pos = call compile format["%1",_string];
			_house = call {
				private '_house';
				for '_i' from 0 to 23 do
				{
					_house = nearestBuilding _pos;
					if(isNil'_house')then{_house=objNull;};
					if(!isNull _house)exitWith{_house};
				};
				_house
			};
			if(isNil'_house')then{_house=objNull;};
			if(isNull _house)then
			{
				_log = format['COULD NOT FIND OBJECT NEAR %1 FOR OWNER [%2,%3] WITH ID %4',_pos,_x select 1,_x select 3,_x select 0];
				'ARMA_LOG' callExtension format['fn_initHouses_SERVER_LOG:%1',_log];
			}
			else
			{
				_house setVariable["house_owner",[_x select 1,_x select 3],true];
				_house setVariable["house_id",_x select 0,true];
				_house setVariable["locked",true,true]; //Lock up all the stuff.
				_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
				for "_i" from 1 to _numOfDoors do {
					_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
				};
			};
		};
	} foreach _queryResult;
};