/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

if(count _houses == 0) exitWith {};
{
	_string = _x select 1;
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
			_log = format['OBJECT POSITION BROKEN - %1',_string];
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
			_log = format['COULD NOT FIND OBJECT NEAR %1',_pos];
			'ARMA_LOG' callExtension format['fn_houseCleanup_LOG:%1',_log];
		}
		else
		{
			if(!isNil {(_house getVariable "containers")}) then {
				{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
				_house setVariable["containers",nil,true];
			};
		};
	};
} foreach _houses;