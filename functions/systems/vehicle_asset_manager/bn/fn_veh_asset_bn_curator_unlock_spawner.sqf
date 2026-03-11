/*
	File: fn_veh_asset_bn_curator_force_reset_idle_vehicle.sqf
	Author: 'DJ' Dijksterhuis
	Public: No

	Description:
		Forcibily, but safely, returns a vehicle that is IDLE back to the spawn point
		This script needs to replicate what happens in: server/fn_veh_asset_respawn.sqf

	Parameter(s):
		_spawnPointId - Id of spawn point [String]

	Returns: nothing

	Example(s): none
*/

params ["_spawnPointId"];

private _spawnPoint = vn_mf_veh_asset_spawn_points get _spawnPointId;
private _respawnType = _spawnPoint get "settings" get "respawnType";

if (_respawnType == "WRECK") exitWith {
	[_spawnPoint] call vn_mf_fnc_veh_asset_set_wrecked;
};

if (_respawnType == "RESPAWN") exitWith {
	[_spawnPoint, _spawnPoint get "settings" get "time"] call vn_mf_fnc_veh_asset_set_respawning;
};
