_run = true;
task_1_4_skip = false;
task_1_4_fail = false;
publicVariableServer "task_1_4_skip";
publicVariableServer "task_1_4_fail";

task_1_4 = player createSimpleTask ["Return to Base"];
	task_1_4 setSimpleTaskDescription ["Return to Base.","Return to Base",""];
	task_1_4 setSimpleTaskDestination (getMarkerPos "rtb_marker");
	task_1_4 setSimpleTaskType "run";
	task_1_4 setTaskState "Created";
	
_UNA_delivery = createMarker ["Return to Base", getMarkerPos "rtb_marker"];
	_UNA_delivery setMarkerShape "ELLIPSE";
	_UNA_delivery setMarkerSize [100, 100];

["TaskCreated",["","Return to Base"]] call BIS_fnc_showNotification;

while {_run} do {
	if (triggerActivated rtb_trigger || (task_1_4_skip)) then {
		task_1_4 setTaskState "Succeeded";
		["TaskSucceeded",["","Return to Base"]] call BIS_fnc_showNotification;
		deleteMarker _UNA_delivery;
		[UNA_member] join (group UNA_contact);
		_run = false;
	};
};