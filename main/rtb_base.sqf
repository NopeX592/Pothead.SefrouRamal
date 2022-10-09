_run = true;
task_5_1_skip = false;
task_5_1_fail = false;
publicVariableServer "task_5_1_skip";
publicVariableServer "task_5_1_fail";

task_5_1 = player createSimpleTask ["Return to the FOB"];
	task_5_1 setSimpleTaskDescription ["Return to the FOB.","Return to the FOB",""];
	task_5_1 setSimpleTaskDestination (getMarkerPos "rtb_base");
	task_5_1 setSimpleTaskType "run";
	task_5_1 setTaskState "Created";
	
while {_run} do {
	if (triggerActivated rtb_base_trigger || (task_5_1_skip)) then {
		task_5_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Return to the FOB"]] call BIS_fnc_showNotification;
		_run = false;
	};
};