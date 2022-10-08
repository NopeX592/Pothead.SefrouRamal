_run = true;
task_2_1_skip = false;
task_2_1_wp_skip = false;
task_2_2_qrf = false;
publicVariableServer "task_2_1_skip";
publicVariableServer "task_2_1_wp_skip";
publicVariableServer "task_2_2_qrf";

task_2_1 = player createSimpleTask ["Clear M'Semrir"];
	task_2_1 setSimpleTaskDescription ["Clear the town of M'Semrir for the EOD team.","Clear M'Semrir",""];
	task_2_1 setSimpleTaskDestination (getMarkerPos "clear_EOD");
	task_2_1 setSimpleTaskType "attack";
	task_2_1 setTaskState "Assigned";
	["TaskAssigned",["","Clear M'Semrir"]] call BIS_fnc_showNotification;

_marker_clear_EOD = createMarker ["Clear M'Semrir", getMarkerPos "clear_EOD"];
	_marker_clear_EOD setMarkerShape "ELLIPSE";
	_marker_clear_EOD setMarkerSize [50, 50];

while {_run} do {
	if (task_2_1_skip) then {
		task_2_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Clear M'Semrir"]] call BIS_fnc_showNotification;
		deleteMarker _marker_clear_EOD;
		_run = false;
		[] execVM "main\defend_EOD.sqf";
		//Move EOD in to M'Semrir
		Hunter_EOD setPos hunter_teleport;
		task_2_1_wp_skip = true;
		task_2_2_qrf = true;
		publicVariableServer "task_2_1_wp_skip";
		publicVariableServer "task_2_2_qrf";
	};
};