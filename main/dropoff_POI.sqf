_run = true;
task_3_2_skip = false;
publicVariableServer "task_3_2_skip";

task_3_2 = player createSimpleTask ["Dropoff POI"];
	task_3_2 setSimpleTaskDescription ["Dropoff the POI at our base in Mhamid.","Dropoff POI",""];
	task_3_2 setSimpleTaskDestination (getMarkerPos "poi_dropoff");
	task_3_2 setSimpleTaskType "run";
	task_3_2 setTaskState "Assigned";
	["TaskAssigned",["","Dropoff POI"]] call BIS_fnc_showNotification;

_marker_dropoff_POI = createMarker ["Dropoff POI", getMarkerPos "poi_dropoff"];
	_marker_dropoff_POI setMarkerShape "ELLIPSE";
	_marker_dropoff_POI setMarkerSize [10, 10];

while {_run} do {
	if ((triggerActivated poi_dropoff_trigger) || (task_3_2_skip)) then {
		task_3_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Dropoff POI"]] call BIS_fnc_showNotification;
		deleteMarker _marker_dropoff_POI;
		[POI] join grpNull;
		POI switchMove "AmovPercMstpSnonWnonDnon_Ease";
		_run = false;
	};
};