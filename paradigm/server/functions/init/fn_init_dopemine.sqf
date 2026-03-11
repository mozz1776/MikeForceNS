{
	[[_x],"rank",2] call vn_mf_fnc_change_player_stat;
	[{systemChat "Thanks for playing at Bro-Nation!"}] remoteExec ["call", _x]; 
} forEach allPlayers;