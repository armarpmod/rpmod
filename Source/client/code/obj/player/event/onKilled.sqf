closeDialog 0;
rpLastDiedPlayerObject = player;
if !((vehicle player) isEqualTo player) then {
	unassignVehicle player;
	player action ['GetOut', vehicle player];
	player action ['Eject', vehicle player];
};