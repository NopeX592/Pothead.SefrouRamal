_run = true;
task_3_1_skip = false;
publicVariable "task_3_1_skip";

task_3_1 = player createSimpleTask ["Pickup POI"];
	task_3_1 setSimpleTaskDescription ["Pickup the POI from comms Alpha.","Pickup POI",""];
	task_3_1 setSimpleTaskDestination (getMarkerPos "poi_pickup");
	task_3_1 setSimpleTaskType "meet";
	task_3_1 setTaskState "Assigned";
	["TaskAssigned",["","Pickup POI"]] call BIS_fnc_showNotification;

_poi_pickup_area = createMarker ["Pickup POI", getMarkerPos "poi_pickup"];
	_poi_pickup_area setMarkerShape "RECTANGLE";
	_poi_pickup_area setMarkerSize [15, 15];
	_poi_pickup_area setMarkerDir 29.481;

while {_run} do {
	if ((player inArea _poi_pickup_area) || (task_3_1_skip)) then {
		task_3_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Pickup POI"]] call BIS_fnc_showNotification;
		_poi_pickup_area setMarkerAlpha 0;
		[POI] join (group player);
		POI enableAI 'PATH';
		_run = false;
		[] execVM "main\dropoff_POI.sqf";
		task_3_1_fin = true;
		task_3_1_skip = true;
		publicVariable "task_3_1_fin";
		publicVariable "task_3_1_skip";
	};
	if (task_2_1_fin) then {
		_run = false;
		_poi_pickup_area setMarkerAlpha 0;
	};
};