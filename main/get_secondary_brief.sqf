_run = true;
task_1_2_skip = false;
publicVariableServer "task_1_2_skip";

task_1_2 = player createSimpleTask ["Get Briefing"];
	task_1_2 setSimpleTaskDescription ["Get your Briefing.","Get Briefing",""];
	task_1_2 setSimpleTaskDestination (getMarkerPos "secondary_brief");
	task_1_2 setSimpleTaskType "whiteboard";
	task_1_2 setTaskState "Assigned";
	["TaskAssigned",["","Get Briefing"]] call BIS_fnc_showNotification;

while {_run} do {
	if (task_1_2_skip) then {
		task_1_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Get Briefing"]] call BIS_fnc_showNotification;
		_run = false;
		[] execVM "main\support_EOD.sqf";
		[] execVM "main\call_airstrike.sqf";
		[] execVM "main\pickup_POI.sqf";
	};
};