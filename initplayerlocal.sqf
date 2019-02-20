if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

["CBA_loadingScreenDone", {
    if (isNull (getAssignedCuratorLogic ace_player)) then {
        if (!(didJIP) || {(didJIP && !(isNil "GRAD_SS_introOver"))}) then {
            STHud_UIMode = 0;
            [{time > (_this + 3)},{
                STHud_UIMode = 0;
                ["Mediterranean", "EventTrack01_F_Jets"] call GRAD_SS_fnc_intro;
            },time] call CBA_fnc_waitUntilAndExecute;
        };
    };
}] call CBA_fnc_addEventHandler;
