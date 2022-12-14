_run = true;
task_2_2_skip = false;
publicVariable "task_2_2_skip";

task_2_2 = player createSimpleTask ["Defend the EOD team"];
	task_2_2 setSimpleTaskDescription ["Defend the EOD team.","Defend the EOD team",""];
	task_2_2 setSimpleTaskDestination (getMarkerPos "defend_EOD");
	task_2_2 setSimpleTaskType "defend";
	task_2_2 setTaskState "Assigned";
	["TaskAssigned",["","Defend the EOD team"]] call BIS_fnc_showNotification;

_marker_defend_EOD = createMarker ["Defend the EOD team", getMarkerPos "defend_EOD"];
	_marker_defend_EOD setMarkerShape "ELLIPSE";
	_marker_defend_EOD setMarkerSize [50, 50];
	_marker_defend_EOD setMarkerAlpha 0.5;

while {_run} do {
	if ((Hunter_EODD inArea _marker_defend_EOD) || (task_2_2_skip)) then {
		task_2_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Defend the EOD team"]] call BIS_fnc_showNotification;
		_marker_defend_EOD setMarkerAlpha 0;
		_run = false;
		if !(task_4_1_fin) then {
			[] execVM "main\rtb_mhamid.sqf";
		} else {
			[] execVM "main\rtb_base.sqf";
		};
		task_2_2_skip = true;
		publicVariable "task_2_2_skip";
	};
};