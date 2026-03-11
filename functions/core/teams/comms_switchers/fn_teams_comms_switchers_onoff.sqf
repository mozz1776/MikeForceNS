/*
    File: fn_teams_comms_switchers_onoff.sqf
    Author: @dijksterhuis
    Public: No
    
    Description:
    	Switch on/off player's custom comms channel.

    	To be used with paradigm's keybinding menu, or buttons in the task roster.

    	Called by other functions in this folder, which are called by the keybind presses / menu clicks.
    
    Parameter(s):
		None
    
    Returns:
	   	Nothing
    
    Example(s):
		[3, "CFF"] call vn_mf_fnc_teams_comms_switchers_onoff;
*/

params ["_custom_channel_id", "_channel_name"];

// safety check
if (10 < _custom_channel_id || _custom_channel_id < 1) exitWith {
	diag_log format ["[ERROR] Custom channel ids must be between 1 and 10 (inclusive): channelId=%1", _custom_channel_id];
};

private _global_channel_id = 15 min (6 max (_custom_channel_id + 5));

// for dac cong -- toggle the ability to hear the channel, never allow them to broadcast
if (side player == east) exitWith {

	// **always** disable ability to broadcast on the channels
	_global_channel_id enableChannel [false, false];

	// is the dc player is in the channel list?
	if(player in ((radioChannelInfo _custom_channel_id) select 3)) then {
		_custom_channel_id radioChannelRemove [player];
		["CommsDisabled", [_channel_name]] call para_c_fnc_show_notification;

	} else {
		_custom_channel_id radioChannelAdd [player];
		["CommsEnabled", [_channel_name]] call para_c_fnc_show_notification;
	};
};

// standard blufor / independent

// for blufor/independent -- toggle the ability to hear the channel and to broadcast on the channel
if ((channelEnabled _global_channel_id) select 1) then {
	_custom_channel_id radioChannelRemove [player];
	_global_channel_id enableChannel [false, false];
	["CommsDisabled", [_channel_name]] call para_c_fnc_show_notification;
} else {
	_custom_channel_id radioChannelAdd [player];
	_global_channel_id enableChannel [true, true];
	setCurrentChannel _global_channel_id;
	["CommsEnabled", [_channel_name]] call para_c_fnc_show_notification;
};

