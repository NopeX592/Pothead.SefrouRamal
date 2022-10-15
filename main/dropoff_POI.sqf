_run = true;
task_3_2_skip = false;
publicVariable "task_3_2_skip";

task_3_2 = player createSimpleTask ["Dropoff POI"];
	task_3_2 setSimpleTaskDescription ["Dropoff the POI at our base in Mhamid.","Dropoff POI",""];
	task_3_2 setSimpleTaskDestination (getMarkerPos "poi_dropoff");
	task_3_2 setSimpleTaskType "run";
	task_3_2 setTaskState "Assigned";
	["TaskAssigned",["","Dropoff POI"]] call BIS_fnc_showNotification;

_poi_dropoff_area = createMarker ["Dropoff POI", getMarkerPos "poi_dropoff"];
	_poi_dropoff_area setMarkerShape "RECTANGLE";
	_poi_dropoff_area setMarkerSize [15, 15];
	_poi_dropoff_area setMarkerDir 99.176;

while {_run} do {
	if ((player inArea _poi_dropoff_area) || (task_3_2_skip)) then {
		task_3_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Dropoff POI"]] call BIS_fnc_showNotification;
		_poi_dropoff_area setMarkerAlpha 0;
		_run = false;

		//Move POI to Officer
		[POI] join grpNull;
		POI doMove (position connor);
		sleep 10;
		POI switchMove "AmovPercMstpSnonWnonDnon_Ease";
		task_3_2_skip = true;
		publicVariable "task_3_2_skip";
	};
};