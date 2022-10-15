_run = true;
task_2_1_skip = false;
task_2_1_wp_skip = false;
task_2_1_qrf = false;
publicVariable "task_2_1_skip";
publicVariable "task_2_1_wp_skip";
publicVariable "task_2_1_qrf";

task_2_1 = player createSimpleTask ["Secure M'Semrir"];
	task_2_1 setSimpleTaskDescription ["Secure the town of M'Semrir for the EOD team.","Secure M'Semrir",""];
	task_2_1 setSimpleTaskDestination (getMarkerPos "clear_EOD");
	task_2_1 setSimpleTaskType "attack";
	task_2_1 setTaskState "Assigned";
	["TaskAssigned",["","Secure M'Semrir"]] call BIS_fnc_showNotification;

_marker_clear_EOD = createMarker ["Secure M'Semrir", getMarkerPos "clear_EOD"];
	_marker_clear_EOD setMarkerShape "ELLIPSE";
	_marker_clear_EOD setMarkerSize [200, 200];

while {_run} do {
	if ((triggerActivated clear_EOD) || (task_2_1_skip)) then {
		task_2_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Secure M'Semrir"]] call BIS_fnc_showNotification;
		deleteMarker _marker_clear_EOD;
		_run = false;
		[] execVM "main\defend_EOD.sqf";
		//Move EOD in to M'Semrir
		Hunter_EOD setPos (getMarkerPos "hunter_teleport");
		Hunter_EODA enableAI "PATH";
		Hunter_EODE enableAI "PATH";
		Hunter_EODD enableAI "PATH";
		task_2_1_skip = true;
		task_2_1_wp_skip = true;
		task_2_1_qrf = true;
		task_2_1_fin = true;
		publicVariable "task_2_1_wp_skip";
		publicVariable "task_2_1_qrf";
		publicVariable "task_2_1_fin";
		publicVariable "task_2_1_skip";
	};
	if (task_3_1_fin) then {
		_run = false;
		deleteMarker _marker_clear_EOD;
	};
};