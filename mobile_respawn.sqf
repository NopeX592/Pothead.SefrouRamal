while {true} do {
	//Move markers to Hunters
	"respawn_west_1" setMarkerpos (respawn_mobile_1 modelToWorld [0,-3,0]);
	"respawn_west_2" setMarkerpos (respawn_mobile_2 modelToWorld [0,-3,0]);
	sleep 5;
};