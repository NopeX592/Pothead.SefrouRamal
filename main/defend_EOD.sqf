_run = true;
task_2_2_skip = false;
publicVariableServer "task_2_2_skip";

task_2_2 = player createSimpleTask ["Defend the EOD team"];
	task_2_2 setSimpleTaskDescription ["Defend the EOD team.","Defend the EOD team",""];
	task_2_2 setSimpleTaskDestination (getMarkerPos "defend_EOD");
	task_2_2 setSimpleTaskType "defend";
	task_2_2 setTaskState "Assigned";
	["TaskAssigned",["","Defend the EOD team"]] call BIS_fnc_showNotification;

_marker_defend_EOD = createMarker ["Defend the EOD team", getMarkerPos "defend_EOD"];
	_marker_defend_EOD setMarkerShape "ELLIPSE";
	_marker_defend_EOD setMarkerSize [50, 50];

while {_run} do {
	if ((triggerActivated defend_complete) || (task_2_2_skip)) then {
		task_2_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Defend the EOD team"]] call BIS_fnc_showNotification;
		deleteMarker _marker_defend_EOD;
		[] execVM "main\rtb_mhamid.sqf";
		_run = false;
	};
};