/*
    File: fn_check_curator.sqf
    Author: Cerebral
    
    Description:
        Checks if player is curator.
    
    Parameter(s):
		_player - Player to check [UNIT]
    
    Returns:
	   	Is curator == true [BOOLEAN]
    
    Example(s):
		[_myPlayer] call para_g_fnc_db_check_curator
*/

params ["_player"];

private _curators = missionNamespace getVariable ["curatorUIDs", []];
private _playerIsCurator = _curators findIf { _x == getPlayerUID _player} > -1;

_playerIsCurator