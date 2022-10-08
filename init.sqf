[]execVM "main_script.sqf";
[]execVM "briefing.sqf";

if (hasInterface) then {
	[] spawn {
		waitUntil {alive player};
		player setVariable ["loadout", getUnitLoadout player, false];
		player addEventHandler ["Respawn", {
			player setUnitLoadout (player getVariable "loadout");
		}];
	};
};

//Create Functions
AD_fnc_supplyDrop = compile preprocessFileLineNumbers "functions\supplydrop.sqf";
SU_fnc_spawnOPFOR = compile preprocessFileLineNumbers "functions\spawn_qrf_opfor.sqf";