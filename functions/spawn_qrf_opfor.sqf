/*
Example:
[
	getMarkerPos "qrf_spawn_4",
	getMarkerPos "qrf_target_1",
	5,
	10,
	EAST
] call SU_fnc_spawnOPFOR;
__________________________________________________________________*/
params [
	["_location_start", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_location_end", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_amount", 10, [0]],
	["_delay", 90, [0]],
	["_side", EAST, []]
];

//Delay QRF
[_location_start, _location_end, _amount, _delay, _side] spawn {

	params ["_location_start", "_location_end", "_amount", "_delay", "_side"];

	sleep _delay;

	//Reset Variables
	_getIn_done = false;

	//Create Group
	private _qrf_group = createGroup [_side, false];

	//Spawn units
	if (_side == independent) then {
			//Spawn IND Units
			_amount = _amount - 3;

			//Spawn Vehicle
			if (_amount <= 5) then {
				vehicleSpawn = "I_G_Offroad_01_F" createVehicle _location_start;
				} else {
				vehicleSpawn = "I_G_Van_01_transport_F" createVehicle _location_start;
			};

			//Spawn Mandatory
			squad_lead = "I_G_Soldier_SL_F" createUnit [_location_start, _qrf_group];
			auto_rifle = "I_G_Soldier_AR_F" createUnit [_location_start, _qrf_group];
			grenadier = "I_G_Soldier_GL_F" createUnit [_location_start, _qrf_group];

			//Spawn Riflemen
			for "_i" from 1 to _amount step 1 do {
				rifle_man = "I_G_Soldier_F" createUnit [_location_start, _qrf_group];
			};

		} else {
			//Spawn CSAT Units
			_amount = _amount - 3;

			//Spawn Vehicle
			if (_amount <= 3) then {
				vehicleSpawn = "O_MRAP_02_hmg_F" createVehicle _location_start;
				} else {
				vehicleSpawn = "O_Truck_02_transport_F" createVehicle _location_start;
			};

			//Spawn Mandatory
			squad_lead = "O_Soldier_SL_F" createUnit [_location_start, _qrf_group];
			auto_rifle = "O_Soldier_AR_F" createUnit [_location_start, _qrf_group];
			grenadier = "O_Soldier_GL_F" createUnit [_location_start, _qrf_group];

			//Spawn Riflemen
			for "_i" from 1 to _amount step 1 do {
				rifle_man = "O_Soldier_F" createUnit [_location_start, _qrf_group];
			};
		};
	
	//Order to Target
	_wp_move_1 = _qrf_group addWaypoint [_location_end, 1];
		_wp_move_1 setWaypointType 'MOVE';
		_wp_move_1 setWaypointSpeed 'FULL';
		[_qrf_group, 1] setWaypointCompletionRadius 150;

	//Order Get Out
	_wp_getOut = _qrf_group addWaypoint [_location_end, 2];
		_wp_getOut setWaypointType 'GETOUT';
		_wp_getOut setWaypointSpeed 'FULL';

	//Order SAD
	_wp_sad = _qrf_group addWaypoint [_location_end, 3];
		_wp_sad setWaypointType 'SAD';
		_wp_sad setWaypointSpeed 'FULL';
		[_qrf_group, 1] setWaypointCompletionRadius 35;
};