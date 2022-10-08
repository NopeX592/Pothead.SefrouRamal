_run = true;
task_1_3_skip = false;
task_1_3_fail = false;
publicVariableServer "task_1_3_skip";
publicVariableServer "task_1_3_fail";

task_1_3 = player createSimpleTask ["Extract the UNA member"];
	task_1_3 setSimpleTaskDescription ["Extract the UNA member to the contact at the Airport.","Extract the UNA member",""];
	task_1_3 setSimpleTaskDestination (getMarkerPos "UNA_delivery");
	task_1_3 setSimpleTaskType "run";
	task_1_3 setTaskState "Created";

["TaskCreated",["","Extract the UNA member"]] call BIS_fnc_showNotification;

while {_run} do {
	if (((triggerActivated UNA_delivered) || (task_1_3_skip)) && !(task_1_3_fail)) then {
		task_1_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Extract the UNA member"]] call BIS_fnc_showNotification;
		deleteMarker _UNA_delivery;
		[UNA_member] join (group UNA_contact);
		[]execVM "main\rtb_1_4.sqf";
		_run = false;
	};
		if (!(alive UNA_member)) then {
		task_1_3 setTaskState "Failed";
		["TaskFailed",["","Extract the UNA member"]] call BIS_fnc_showNotification;
		deleteMarker _UNA_delivery;
		[]execVM "main\rtb_1_4.sqf";
		task_1_3_fail = true;
		_run = false;
	};
};