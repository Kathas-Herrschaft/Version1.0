/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses"];
if(_this == "") exitWith {};

_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

_state = false;
_return = [];
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
			'ARMA_LOG' callExtension format['fn_fetchPlayerHouses_LOG:%1',_log];
			
			_trunk = [_x select 2] call DB_fnc_mresToArray;
			_log = format['Trunk: %1',_trunk];
			'ARMA_LOG' callExtension format['fn_fetchPlayerHouses_LOG:%1',_log];
			
			_containerData = [_x select 3] call DB_fnc_mresToArray;
			_log = format['ContainerData: %1',_containerData];
			'ARMA_LOG' callExtension format['fn_fetchPlayerHouses_LOG:%1',_log];
		}
		else
		{
			_house allowDamage false;
			_containers = [];
			_house setVariable["slots",[],true];
			if(!isNil {(_house getVariable "containers")}) then {
				{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
			};
			
			_trunk = [_x select 2] call DB_fnc_mresToArray;
			if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
			_containerData = [_x select 3] call DB_fnc_mresToArray;
			if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
			_house setVariable["Trunk",_trunk,true];
			
			{
				if(count _x == 0) exitWith {}; //No containers / items.
				_className = _x select 0;
				_weapons = (_x select 1) select 0;
				_magazines = (_x select 1) select 1;
				_items = (_x select 1) select 2;
				_backpacks = (_x select 1) select 3;
				
				//Setup the variables
				_positions = [_house] call life_fnc_getBuildingPositions;
				_pos = [0,0,0];
				
				{
					_slots = _house getVariable ["slots",[]];
					if(!(_forEachIndex in _slots)) exitWith {
						_slots pushBack _forEachIndex;
						_house setVariable["slots",_slots,true];
						_pos = _x;
					};
				} foreach _positions;
				
				if(_pos isEqualTo [0,0,0]) exitWith {};
				
				_container = createVehicle[_className,_pos,[],0,"NONE"];
				waitUntil{!isNil "_container"};
				_container setPosATL _pos;
				//_container enableSimulation false;
				
				_containers pushBack _container;
				clearWeaponCargoGlobal _container;
				clearItemCargoGlobal _container;
				clearMagazineCargoGlobal _container;
				clearBackpackCargoGlobal _container;
				//Add weapons to the crate.
				{
					_weaponCount = (_weapons select 1) select _forEachIndex;
					_container addWeaponCargoGlobal [_x,_weaponCount];
				} foreach (_weapons select 0);
				
				//Add magazines
				{
					_magazineCount = (_magazines select 1) select _forEachIndex;
					_container addMagazineCargoGlobal [_x,_magazineCount];
				} foreach (_magazines select 0);
					
				//Add items
				{
					_itemCount = (_items select 1) select _forEachIndex;
					_container addItemCargoGlobal [_x,_itemCount];
				} foreach (_items select 0);
				
				//Add backpacks
				{
					_backpackCount = (_backpacks select 1) select _forEachIndex;
					_container addBackpackCargoGlobal [_x,_backpackCount];
				} foreach (_backpacks select 0);
				
			} foreach _containerData;
			
			_house setVariable["containers",_containers,true];
			_return pushBack [_x select 1,_containers];
		};
	};
} foreach _houses;

missionNamespace setVariable[format["houses_%1",_this],_return];