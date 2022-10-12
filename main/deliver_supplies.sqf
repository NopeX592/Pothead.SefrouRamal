_run = true;
task_1_1_skip = false;
task_1_1_fail = false;
publicVariableServer "task_1_1_skip";
publicVariableServer "task_1_1_fail";

task_1_1 = player createSimpleTask ["Deliver Supplies"];
	task_1_1 setSimpleTaskDescription ["Deliver the Supplies to Mhamid.","Deliver the Supplies to Mhamid",""];
	task_1_1 setSimpleTaskDestination (getMarkerPos "deliver_marker");
	task_1_1 setSimpleTaskType "navigate";
	task_1_1 setTaskState "Created";
	
_deliver_area = createMarker ["Deliver Area", getMarkerPos "deliver_marker"];
	_deliver_area setMarkerShape "RECTANGLE";
	_deliver_area setMarkerSize [15, 15];
	_deliver_area setMarkerDir 8.773;

while {_run} do {
	if (((!alive HEMTT_1) && (!alive HEMTT_2)) || (task_1_1_fail)) then {
		task_1_1 setTaskState "Failed";
		["TaskFailed",["","Deliver Supplies"]] call BIS_fnc_showNotification;
		_run = false;
		[] execVM "main\get_secondary_brief.sqf";
	} else {
		if (([HEMTT_1,HEMTT_2] inArea _deliver_area) || (task_1_1_skip)) then {
			task_1_1 setTaskState "Succeeded";
			["TaskSucceeded",["","Deliver Supplies"]] call BIS_fnc_showNotification;
			_run = false;
			[] execVM "main\get_secondary_brief.sqf";
		};
	};
};