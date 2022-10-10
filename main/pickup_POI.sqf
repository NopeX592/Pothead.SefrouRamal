_run = true;
task_3_1_skip = false;
publicVariableServer "task_3_1_skip";

task_3_1 = player createSimpleTask ["Pickup POI"];
	task_3_1 setSimpleTaskDescription ["Pickup the POI from comms Alpha.","Pickup POI",""];
	task_3_1 setSimpleTaskDestination (getMarkerPos "poi_pickup");
	task_3_1 setSimpleTaskType "meet";
	task_3_1 setTaskState "Assigned";
	["TaskAssigned",["","Pickup POI"]] call BIS_fnc_showNotification;

_marker_pickup_POI = createMarker ["Pickup POI", getMarkerPos "poi_pickup"];
	_marker_pickup_POI setMarkerShape "ELLIPSE";
	_marker_pickup_POI setMarkerSize [10, 10];

while {_run} do {
	if ((triggerActivated poi_pickup_trigger) || (task_3_1_skip)) then {
		task_3_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Pickup POI"]] call BIS_fnc_showNotification;
		deleteMarker _marker_pickup_POI;
		[POI] join (group player);
		POI switchMove "ANIM";
		_run = false;
		[] execVM "main\dropoff_POI.sqf";
		task_3_1_fin = true;
		publicVariableServer "task_3_1_fin";
	};
	if (task_2_1_fin) then {
		_run = false;
		deleteMarker _marker_pickup_POI;
	};
};