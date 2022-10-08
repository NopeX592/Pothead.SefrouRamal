_run_1 = true;
_run_2 = true;
task_0_1_skip = false;
task_O_3_start = false;
publicVariableServer "task_0_1_skip";
publicVariableServer "task_O_3_start";

task_0_1 = player createSimpleTask ["Get Briefing"];
	task_0_1 setSimpleTaskDescription ["Get your Briefing.","Get Briefing",""];
	task_0_1 setSimpleTaskDestination (getMarkerPos "first_brief");
	task_0_1 setSimpleTaskType "whiteboard";
	task_0_1 setTaskState "Assigned";
	["TaskAssigned",["","Get Briefing"]] call BIS_fnc_showNotification;

while {_run_1} do {
	if (task_0_1_skip) then {
		task_0_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Get Briefing"]] call BIS_fnc_showNotification;
		
		_run_1 = false;
		//Execute Missions
		[] execVM "main\find_member_1_2.sqf";
	};
};
while {_run_2} do { 
	if (task_O_3_start) then {
		_run_2 = false;
		[] execVM "optional\destroy_convoy.sqf";
		[] execVM "optional\seize_helicopter.sqf";
		convoy_grp setCurrentWaypoint [convoy_grp, 1];
	};
};