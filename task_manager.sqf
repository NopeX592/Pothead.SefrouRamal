_run = true;

while {_run} do {
	if (task_2_1_fin) then {
		task_3_1 setTaskState "Canceled";
	} else {
		if (task_3_1_fin) then {
			task_2_1 setTaskState "Succeeded";
		};
	};
};