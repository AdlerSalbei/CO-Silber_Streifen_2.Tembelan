//if !(isNull (getAssignedCuratorLogic ace_player)) exitWith {};
STHud_UIMode = 0;
cutText ["", "BLACK", 4];
//if (isServer) then {rebelLeader01 playMoveNow "Acts_CivilTalking_1"};
[{
    cutText ["", "BLACK IN", 8];
    private _filmgrain = ppEffectCreate ["FilmGrain",2000];
    _filmgrain ppEffectEnable true;
    _filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
    _filmgrain ppEffectCommit 0;

    private _pos = getPos ace_player;
    _pos set [2,1.7];

    private _camera = "camera" camCreate _pos;
    _camera camSetPos _pos;
    _camera camCommand "inertia on";
    _camera camSetTarget rebelLeader01;
    _camera cameraEffect ["internal","back"];
    _camera camSetFov 1;
    _camera camCommit 0;
    showCinemaBorder true;

    _camera camSetPos getPos snipercam_2;
    _camera camSetTarget rebelLeader01;
    _camera camCommit 5;
    [{
        params ["_camera"];

        [_camera, rebelLeader01, (rebelLeader01 getDir _camera), (rebelLeader01 getDir _camera) + 160, 13, (rebelLeader01 distance2D _camera)] call grad_ss_fnc_rotateCam;
        [{(!(isNil "GRAD_introCam_camRotateFinish") && {GRAD_introCam_camRotateFinish})},{

            params ["_camera"];
            _camera camSetTarget snipercam_target_1;
            _camera camCommit 1.5;
            [{
                params ["_camera"];

                _camera camSetPos getPos snipercam_3;
                _camera camSetTarget snipercam_target_1;
                _camera camCommit 15;
                [{
                    params ["_camera"];

                        _camera camSetPos getPos snipercam_4;
                        _camera camSetTarget Sniper01;
                        _camera camCommit 8;
                        [{
                            params ["_camera"];

                            _camera camSetFov 0.7;
                            _camera camCommit 3;
                            [{
                                params ["_camera"];

                                _camera camSetPos getPos snipercam_5;
                                _camera camSetTarget rebelLeader01;
                                _camera camSetFov 0.5;
                                _camera camCommit 5;
                                [{
                                    params ["_camera"];

                                    _camera camSetPos getPos snipercam_5;
                                    _camera camSetTarget rebelLeader01;
                                    _camera camSetFov 0.2;
                                    _camera camCommit 3;
                                    //if (isServer) then {rebelLeader01 playMoveNow "Acts_CivilTalking_1"};
                                    [{
                                        params ["_camera", "_filmgrain"];

                                        showCinemaBorder false;
                                        private _pos = getPos rebelLeader01;
                                        _pos set [2,1.7];
                                        _camera camSetPos getPos snipercam_6;
                                        _camera camSetTarget _pos;
                                        _camera camSetFov 1;
                                        _camera camCommit 0;
                                        [{
                                            params ["_camera", "", "_pos"];

                                            _camera camSetTarget (_pos vectorAdd [0.14,0.16,0.21]);
                                            _camera camCommit 2.5;
                                            [{
                                                params ["_camera", "", "_pos"];

                                                _camera camSetTarget (_pos vectorAdd [-0.04,0.19,-0.3]);
                                                _camera camCommit 2.5;
                                                [{
                                                    params ["_camera", "", "_pos"];

                                                    _camera camSetTarget (_pos vectorAdd [0.17,0.09,0.07]);
                                                    _camera camCommit 2.5;
                                                    [{
                                                        params ["_camera", "", "_pos"];

                                                        _camera camSetTarget (_pos vectorAdd [0.12,-0.13,-0.06]);
                                                        _camera camCommit 2.5;
                                                        [{
                                                            params ["_camera", "", "_pos"];

                                                            _camera camSetTarget _pos;
                                                            _camera camCommit 2;
                                                            [{
                                                                params ["_camera", "_filmgrain"];

                                                                showCinemaBorder true;
                                                                _camera camSetPos getPos snipercam_5;
                                                                _camera camSetTarget rebelLeader01;
                                                                _camera camCommit 0;
                                                                [{
                                                                    if (isServer) then {
                                                                        Sniper01 forceWeaponFire ["rhs_weap_M107_w", "Single"];
                                                                        GRAD_SS_sniperShot = true;
                                                                    };
                                                                    [{!isNil "GRAD_SS_sniperShot"}, {
                                                                    [{
                                                                        params ["_camera"];

                                                                        _camera camSetPos getPos snipercam_6;
                                                                        _camera camCommit 1.8;
                                                                        [{
                                                                            if (isServer) then {rebelGuard_1 setDamage 1;};
                                                                            [{
                                                                                //if (isServer) then {rebelLeader01 playMoveNow "";};
                                                                                params ["_camera"];

                                                                                _camera camSetPos getPos snipercam_2;
                                                                                _camera camSetTarget rebelLeader01;
                                                                                _camera camCommit 2;
                                                                                [{
                                                                                    params ["_camera"];

                                                                                    private _pos = getPos ace_player;
                                                                                    _pos set [2,1.7];
                                                                                    _camera camSetTarget _pos;
                                                                                    _camera camCommit 1;
                                                                                    [{
                                                                                        params ["_camera", "", "_pos"];

                                                                                        _camera camSetPos _pos;
                                                                                        _camera camCommit 2.5;
                                                                                        [{
                                                                                            params ["_camera", "_filmgrain"];

                                                                                            cutText ["", "BLACK OUT", 1];

                                                                                            _filmgrain ppEffectEnable false;
                                                                                            ppEffectDestroy _filmgrain;
                                                                                            _camera cameraEffect ["terminate","back"];
                                                                                            camDestroy _camera;
                                                                                            STHud_UIMode = 1;

                                                                                            cutText ["", "BLACK IN", 1];
                                                                                        }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                                                                    }, [_camera, _filmgrain, _pos], 1] call CBA_fnc_waitAndExecute;
                                                                                }, _this, 2] call CBA_fnc_waitAndExecute;
                                                                            }, _this, 2] call CBA_fnc_waitAndExecute;
                                                                        }, _this, 2] call CBA_fnc_waitAndExecute;
                                                                    }, _this, 0.2] call CBA_fnc_waitAndExecute;
                                                                    }, _this, 60] call CBA_fnc_waitUntilAndExecute;
                                                                }, [_camera, _filmgrain], 5] call CBA_fnc_waitAndExecute;
                                                            }, _this, 4] call CBA_fnc_waitAndExecute;
                                                        }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                                    }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                                }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                            }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                        }, [_camera, _filmgrain, _pos], 0.2] call CBA_fnc_waitAndExecute;
                                    }, _this, 5] call CBA_fnc_waitAndExecute;
                                }, _this, 5] call CBA_fnc_waitAndExecute;
                            }, _this, 3] call CBA_fnc_waitAndExecute;
                        }, _this, 8] call CBA_fnc_waitAndExecute;
                }, _this, 20] call CBA_fnc_waitAndExecute;
            }, _this, 2] call CBA_fnc_waitAndExecute;
        }, _this, 60] call CBA_fnc_waitUntilAndExecute;
    }, [_camera, _filmgrain], 5] call CBA_fnc_waitAndExecute;
}, _this, 4] call CBA_fnc_waitAndExecute;
