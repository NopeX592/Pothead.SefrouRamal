_run = true;
task_4_1_skip = false;
task_4_1_qrf = true;
publicVariableServer "task_4_1_skip";
publicVariableServer "task_4_1_qrf";

task_4_1 = player createSimpleTask ["Defend the town of Mhamid"];
	task_4_1 setSimpleTaskDescription ["Defend the town of Mhamid.","Defend the town of Mhamid",""];
	task_4_1 setSimpleTaskDestination (getMarkerPos "defend_Mhamid");
	task_4_1 setSimpleTaskType "defend";
	task_4_1 setTaskState "Assigned";
	["TaskAssigned",["","Defend the town of Mhamid"]] call BIS_fnc_showNotification;

_marker_defend_Mhamid = createMarker ["Defend the town of Mhamid", getMarkerPos "defend_Mhamid"];
	_marker_defend_Mhamid setMarkerShape "ELLIPSE";
	_marker_defend_Mhamid setMarkerSize [50, 50];

while {_run} do {
	if ((triggerActivated defend_Mhamid) || (task_4_1_skip)) then {
		task_4_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Defend the town of Mhamid"]] call BIS_fnc_showNotification;
		deleteMarker _marker_defend_Mhamid;
		_run = false;
	};
};