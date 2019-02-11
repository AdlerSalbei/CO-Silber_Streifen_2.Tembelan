if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (!(didJIP) || {(didJIP && !(isNil "GRAD_SS_introOver"))}) then {
    ["CBA_loadingScreenDone", {
        STHud_UIMode = 0;
        private _waitCondition = {time > (_this + 3)};

        [_waitCondition,{
            STHud_UIMode = 0;
            ["Mediterranean", "EventTrack01_F_Jets"] execVM "USER\functions\fn_intro.sqf";
        },time] call CBA_fnc_waitUntilAndExecute;

    }] call CBA_fnc_addEventHandler;
};
