/*
	File: fn_veh_asset_bn_curator_force_recover_wrecked_vehicle.sqf
	Author: 'DJ' Dijksterhuis
	Public: No

	Description:
		Forcibily, but safely, respawns a vehicle.

	Parameter(s):
		_spawnPointId - Id of spawn point [String]

	Returns: nothing

	Example(s): none
*/

params ["_spawnPointId"];

private _spawnPoint = vn_mf_veh_asset_spawn_points get _spawnPointId;
private _respawnType = _spawnPoint get "settings" get "respawnType";
private _vehicle = _spawnPoint getOrDefault ["currentVehicle", objNull];

// double check -- function before should have checked the status already
// but let's be sure
if (_respawnType == "WRECK") then {
	deleteVehicle _vehicle;
	[_spawnPoint] call vn_mf_fnc_veh_asset_set_repairing;
};
