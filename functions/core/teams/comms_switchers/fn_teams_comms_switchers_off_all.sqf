/*
    File: fn_teams_comms_switchers_off_all.sqf
    Author: @dijksterhuis
    Public: No

    Description:
        Switch **off** **all** player custom comms channel.

        To be used with paradigm's keybinding menu, or buttons in the task roster.

    Parameter(s):
        None

    Returns:
        Nothing

    Example(s):
        call vn_mf_fnc_teams_comms_switchers_off_all;
*/

// custom channel IDs
[1, 2, 3] apply {
    (_x + 5) enableChannel [false, false];
    _x radioChannelRemove [player];
};

// set channel to side
setCurrentChannel 1;

["CommsDisabled", ["Ground/Air/Call for Fire"]] call para_c_fnc_show_notification;
