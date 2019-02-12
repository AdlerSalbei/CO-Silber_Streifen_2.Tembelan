params ["_effect", "_music"];
[_effect, 0, false] call BIS_fnc_setPPeffectTemplate;

userTexture1 setObjectTexture [0, "data\intro1.paa"];
userTexture3 setObjectTexture [0, "data\intro3.paa"];

playMusic _music;

cutText ["", "BLACK IN", 8];

[ace_player, "amovpercmstpslowwrfldnon"] remoteExec ["switchMove", 0];

private _filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

private _camera = "camera" camCreate (getPos camPos_0);
_camera camSetPos (getPos camPos_0);
_camera camCommand "inertia on";
_camera camSetTarget camTarget_0;
_camera cameraEffect ["internal","back"];
_camera camSetFov 1;
_camera camCommit 0;
_camera camSetPos (getPos camPos_1);
_camera camSetTarget camTarget_0;
_camera camCommit 5;

[{
    params ["_camera"];
    _camera camSetPos (getPos camPos_2);
    _camera camSetTarget camTarget_0;
    _camera camCommit 5;

    [{
        params ["_camera"];
        _camera camSetTarget camTarget_2;
        _camera camCommit 5;
        ["Default", 20, false] call BIS_fnc_setPPeffectTemplate;

        [{
            params ["_camera"];
            _camera camSetPos (getPos camPos_4);
            _camera camSetTarget camTarget_1;
            _camera camCommit 5;

            [{
                params ["_camera"];
                _camera camSetPos (getPos camPos_5);
                _camera camCommand "inertia on";
                _camera camSetTarget ace_player;
                _camera camCommit 3;

                [{
                    params ["_camera"];
                    private _pos = getPos ace_player;
                    _pos set [2,1.7];
                    _camera camSetPos _pos;
                    _camera camCommit 5;

                    [{
                        cutText ["", "BLACK OUT", 1];

                        [{
                            params ["_camera", "_filmgrain"];
                            _filmgrain ppEffectEnable false;
                            ppEffectDestroy _filmgrain;
                            _camera cameraEffect ["terminate","back"];
                            camDestroy _camera;

                            [{
                                cutText ["", "BLACK IN", 1];

                                cutText ["","BLACK FADED",999];

                                [{
                                    userTexture1 setObjectTexture [0, ""];
                                    userTexture3 setObjectTexture [0, ""];

                                    cutText ["", "BLACK IN", 10];

                                    [{
                                        5 fadeMusic 0;

                                        STHud_UIMode = 1;
                                        [ace_player, "amovpercmstpslowwrfldnon", 1] call ace_common_fnc_doAnimation;

                                        [{
                                            playMusic "";
                                            0 fadeMusic 1;
                                        }, [], 6] call CBA_fnc_waitAndExecute;
                                    }, [], 5] call CBA_fnc_waitAndExecute;
                                }, [], 2] call CBA_fnc_waitAndExecute;
                            }, [], 1] call CBA_fnc_waitAndExecute;
                        }, _this, 1] call CBA_fnc_waitAndExecute;
                    }, _this, 3] call CBA_fnc_waitAndExecute;
                }, _this, 2] call CBA_fnc_waitAndExecute;
            }, _this, 10] call CBA_fnc_waitAndExecute;
        }, _this, 10] call CBA_fnc_waitAndExecute;
    }, _this, 4] call CBA_fnc_waitAndExecute;
}, [_camera, _filmgrain], 5] call CBA_fnc_waitAndExecute;
