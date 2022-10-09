_run = true;
task_2_3_skip = false;
task_2_3_fail = false;
publicVariableServer "task_2_3_skip";
publicVariableServer "task_2_3_fail";

task_2_3 = player createSimpleTask ["Return to the FOB"];
	task_2_3 setSimpleTaskDescription ["Return to the FOB.","Return to the FOB",""];
	task_2_3 setSimpleTaskDestination (getMarkerPos "rtb_mhamid");
	task_2_3 setSimpleTaskType "run";
	task_2_3 setTaskState "Created";

while {_run} do {
	if (triggerActivated rtb_mhamid_trigger || (task_2_3_skip)) then {
		task_2_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Return to the FOB"]] call BIS_fnc_showNotification;
		_run = false;
	};
};