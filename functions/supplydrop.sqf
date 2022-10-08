/*
Author: HallyG
Modified by: Nope.X
Example:
[
	"B_supplyCrate_F",
	position squad_leader,
	125,
	500,
	1000,
	200,
	2,
	[0,0,-1.2]
	WEST,
] call AD_fnc_supplyDrop;
__________________________________________________________________*/
params [
	["_object", "B_supplyCrate_F", [""]],
	["_centre", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_drop_distance", 125, [0]],
	["_height", 300, [0]],
	["_distance", 750, [0]],
	["_direction_s", 35, [0]],
	["_repetitions", 2, [0]],
	["_attachTo", [0, 0, -1.2], [[]], [3]]
];

//Create Flyby
_direction_e = _direction_s + 180;

_flyby_start = squad_leader getRelPos [_distance, _direction_s];
_flyby_end = squad_leader getRelPos [_distance, _direction_e];

[_flyby_start, _flyby_end, _height, "NORMAL", "B_T_VTOL_01_vehicle_F", west] call BIS_fnc_ambientFlyby;


_centre = _centre call {
	if (_this isEqualType objNull) exitWith {getPosASL _this};
	if (_this isEqualType grpNull) exitWith {getPosASL (leader _this)};
	if (_this isEqualType "") exitWith {getMarkerPos _this};
	if (_this isEqualType locationNull) exitWith {locationPosition _this};
	if (_this isEqualType taskNull) exitWith {taskDestination  _this};
	if (_this isEqualType []) exitWith {_this};
	[0, 0, 0]
};

if (!(isClass (configfile >> "cfgVehicles" >> _object)) || _centre isEqualTo [0, 0, 0]) exitWith {
	objNull
};

//Delay drops
[_object, _centre, _drop_distance, _height, _distance, _direction_s, _repetitions, _attachTo, _direction_e] spawn {

	params ["_object", "_centre", "_drop_distance", "_height", "_distance", "_direction_s", "_repetitions", "_attachTo", "_direction_e"];

	sleep 9.75;

	//Space out drops
	_centre_distance = squad_leader getRelPos [_drop_distance, _direction_e];

	private _obj = createVehicle [_object, _centre_distance vectorAdd [0, 0, _height], [], 0, "NONE"]; 
	private _para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "FLY"];

	_para setDir getDir _obj;
	_para setPos getPos _obj;
	_obj lock false;
	_obj attachTo [_para, _attachTo];

	[_obj, _para] spawn {
		params ["_obj","_para"];
			
		waitUntil {
			sleep 0.01;
			((position _obj) select 2) < 2 
			|| 
			isNull _para 
			|| 
			(count (lineIntersectsWith [getPosASL _obj, (getPosASL _obj) vectorAdd [0, 0, -0.5], _obj, _para])) > 0
		};
			
		_para disableCollisionWith _obj;
		_obj setVectorUp [0,0,1];
		_obj setVelocity [0,0,0];
		detach _obj;
			
		if (!isNull _para) then {deleteVehicle _para};

		(format ["A supply drop has touched down, grid %1.", mapGridPosition getPosATL _obj]) remoteExec ["systemChat", 0, false]; 

		//Attach Smoke
		_smoke = "Green";
		_smoke = createVehicle ["SmokeShell"+_smoke, [0,0,0], [], 0 , ""];
		_smoke attachTo [_obj, [0,0,0]];

		//Add Arsenal
		[ _obj, ["class_1","class_2"], false, true ] remoteExec ["BIS_fnc_addVirtualMagazineCargo", 0, true]
	};
	_drop_distance = _drop_distance * 1.5
};

//Spawn QRF
for "_i" from 1 to _repetitions step 1 do {
	_randomRotation = selectRandom [15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345,360];
	_randomDelay = selectRandom [30,40,50];
	_randomUnits = selectRandom [5,6,7];
	_randomSide = selectRandom [EAST, independent];

	[
		squad_leader getRelPos [1000, _randomRotation],
		position squad_leader,
		_randomUnits,
		_randomDelay,
		_randomSide
	] call SU_fnc_spawnOPFOR;
};