/*
    File: fn_sites_load.sqf
    Author: Savage Game Design
    Public: No
    
    Description:
        Loads saved sites.
    
    Parameter(s):
        None
    
    Returns:
        Load successful [BOOL]
    
    Example(s):
        [] call vn_mf_fnc_sites_load;
*/

(["GET", "sites", []] call para_s_fnc_profile_db) params ["","_sitesData"];

if (_sitesData isEqualTo []) exitWith { false; };

private _sites = _sitesData apply {createHashMapFromArray _x};

private _siteCreationFunctions = createHashmapFromArray [
    ["aa", vn_mf_fnc_sites_create_site_aa],
    ["hq", vn_mf_fnc_sites_create_site_hq],
    ["factory", vn_mf_fnc_sites_create_site_factory],
    ["radar", vn_mf_fnc_sites_create_site_radar],
    ["artillery", vn_mf_fnc_sites_create_site_artillery],
    ["camp", vn_mf_fnc_sites_create_site_camp],
    ["tunnel", vn_mf_fnc_sites_create_site_tunnel],
    ["water_supply", vn_mf_fnc_sites_create_site_water_supply]
];

{
    private _site = _x;
    private _pos = _site get "pos";
    private _type = _site get "type";

    [_pos] call (_siteCreationFunctions get _type);
} forEach _sites;

true