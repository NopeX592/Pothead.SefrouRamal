_run = true;
task_4_1_skip = false;
task_4_1_qrf = true;
task_4_1_fin = true;
publicVariableServer "task_4_1_skip";
publicVariableServer "task_4_1_qrf";
publicVariableServer "task_4_1_fin";

task_4_1 = player createSimpleTask ["Defend the town of Mhamid"];
	task_4_1 setSimpleTaskDescription ["Defend the town of Mhamid.","Defend the town of Mhamid",""];
	task_4_1 setSimpleTaskDestination (getMarkerPos "defend_Mhamid");
	task_4_1 setSimpleTaskType "defend";
	task_4_1 setTaskState "Assigned";
	["TaskAssigned",["","Defend the town of Mhamid"]] call BIS_fnc_showNotification;

while {_run} do {
	if ((triggerActivated defend_Mhamid) || (task_4_1_skip)) then {
		task_4_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Defend the town of Mhamid"]] call BIS_fnc_showNotification;
		_run = false;
		if (task_2_1_fin) then {
			[] execVM "main\pickup_POI.sqf";
		} else {
			if (task_3_1_fin) then {
				[] execVM "main\support_EOD.sqf";
			};
		};
		task_2_1_fin = false;
		task_3_1_fin = false;
		publicVariableServer "task_2_1_fin";
		publicVariableServer "task_3_1_fin";
	};
};