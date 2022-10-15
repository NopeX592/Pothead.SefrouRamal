_run = true;
task_0_1_skip = false;
task_2_1_fin = false;
task_3_1_fin = false;
task_4_1_fin = false;
publicVariable "task_0_1_skip";
publicVariable "task_2_1_fin";
publicVariable "task_3_1_fin";
publicVariable "task_4_1_fin";

task_0_1 = player createSimpleTask ["Get Briefing"];
	task_0_1 setSimpleTaskDescription ["Get your Briefing.","Get Briefing",""];
	task_0_1 setSimpleTaskDestination (getMarkerPos "first_brief");
	task_0_1 setSimpleTaskType "whiteboard";
	task_0_1 setTaskState "Assigned";
	["TaskAssigned",["","Get Briefing"]] call BIS_fnc_showNotification;

while {_run} do {
	if (task_0_1_skip) then {
		task_0_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Get Briefing"]] call BIS_fnc_showNotification;
		
		_run = false;
		//Execute Missions
		[] execVM "main\deliver_supplies.sqf";
		[] execVM "task_manager.sqf";
	};
};