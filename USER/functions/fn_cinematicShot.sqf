//if !(isNull (getAssignedCuratorLogic ace_player)) exitWith {};
STHud_UIMode = 0;
cutText ["", "BLACK", 4];
playMusic "LeadTrack03_F_Mark";
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

        [_camera, rebelLeader01, (rebelLeader01 getDir _camera), (rebelLeader01 getDir _camera) + 160, 10, (rebelLeader01 distance2D _camera)] call grad_ss_fnc_rotateCam;
        [{(!(isNil "GRAD_introCam_camRotateFinish") && {GRAD_introCam_camRotateFinish})},{

            params ["_camera"];
            _camera camSetTarget snipercam_target_1;
            _camera camCommit 3;

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
                                        private _OUTLINE_H = (safezoneH / 0.69);
                                        private _OUTLINE_W = (pixelW * (_OUTLINE_H / pixelH));
                                        private _CROSSHAIR_W = (safezoneH / pixelH) * pixelW;


                                        "ody stinkt" cutrsc ["rscDynamicText","plain"];

                                        _display = uinamespace getvariable "BIS_dynamicText";
                                        _control = _display displayctrl 9999;
                                        _control ctrlsetfade 1;
                                        _control ctrlcommit 0;

                                        private _crosshair = _display ctrlCreate ["RscPicture", -1];
                                        private _outline = _display ctrlCreate ["RscPicture", -1];
                                        private _left = _display ctrlCreate ["RscText", -1];
                                        private _right = _display ctrlCreate ["RscText", -1];
                                        _crosshair ctrlSetText "\a3\weapons_f\acc\data\reticle_lrps_z_ca.paa";
                                        _crosshair ctrlSetPosition [safezoneX + (safezoneW - _CROSSHAIR_W) / 2,safezoneY, _CROSSHAIR_W, safezoneH];
                                        _crosshair ctrlCommit 0;

                                        _outline ctrlSetText "\a3\weapons_f\acc\data\scope_inside_sharp_ca.paa";
                                        _outline ctrlSetPosition [safezoneX + (safezoneW - _OUTLINE_W) / 2, safezoneY - (_OUTLINE_H - safezoneH) / 2, _OUTLINE_W, _OUTLINE_H];
                                        _outline ctrlCommit 0;

                                        _left ctrlSetPosition[safezoneX, safezoneY, (safezoneW - _OUTLINE_W) / 2, safezoneH];
                                        _left ctrlSetBackgroundColor [0,0,0,1];
                                        _left ctrlCommit 0;

                                        _right ctrlSetPosition[_OUTLINE_W + safezoneX + (safezoneW - _OUTLINE_W) / 2, safezoneY, (safezoneW - _OUTLINE_W) / 2, safezoneH];
                                        _right ctrlSetBackgroundColor [0,0,0,1];
                                        _right ctrlCommit 0;

                                        showCinemaBorder false;
                                        private _pos = getPos rebelLeader01;
                                        _pos set [2,1.7];
                                        _camera camSetPos getPos snipercam_6;
                                        _camera camSetTarget _pos;
                                        _camera camSetFov 1;
                                        _camera camCommit 0;

                                        [{
                                            params ["_camera", "", "_pos"];

                                            _camera camSetTarget (_pos vectorAdd [0.64,0.63,0.91]);
                                            _camera camCommit 2.5;

                                            [{
                                                params ["_camera", "", "_pos"];

                                                _camera camSetTarget (_pos vectorAdd [-0.04,0.29,-0.4]);
                                                _camera camCommit 2.5;

                                                [{
                                                    params ["_camera", "", "_pos"];

                                                    _camera camSetTarget (_pos vectorAdd [0.57,-0.9,0.7]);
                                                    _camera camCommit 2.5;

                                                    [{
                                                        params ["_camera", "", "_pos"];

                                                        _camera camSetTarget (_pos vectorAdd [0.32,-0.13,-0.66]);
                                                        _camera camCommit 2.5;

                                                        [{
                                                            params ["_camera", "", "_pos"];

                                                            _camera camSetTarget _pos;
                                                            _camera camCommit 2;

                                                            [{
                                                                "ody stinkt" cutText ["","plain"];
                                                                params ["_camera", "_filmgrain"];
                                                                showCinemaBorder true;
                                                                _camera camSetPos getPos snipercam_5;
                                                                _camera camSetTarget rebelLeader01;
                                                                _camera camCommit 0;

                                                                [{
                                                                    if (isServer) then {
                                                                        Sniper01 forceWeaponFire ["rhs_weap_M107_w", "Single"];
                                                                        GRAD_SS_sniperShot = true;
                                                                        publicVariable "GRAD_SS_sniperShot";
                                                                    };

                                                                    [{!isNil "GRAD_SS_sniperShot"}, {

                                                                    [{
                                                                        params ["_camera"];

                                                                        _camera camSetPos getPos snipercam_6;
                                                                        _camera camCommit 1.8;

                                                                        [{
                                                                            playSound "bulletCrack";
                                                                            //[rebelGuard_1] remoteExecCall ["GRAD_SS_fnc_headshot"];
                                                                            if (isServer) then {
                                                                                [{rebelGuard_1 setDamage 1}, []] call CBA_fnc_execNextFrame;
                                                                            };

                                                                            [{
                                                                                //if (isServer) then {rebelLeader01 playMoveNow "";};
                                                                                params ["_camera"];
                                                                                if (isServer) then {
                                                                                    RebelHMG_1 doTarget Sniper01;
                                                                                    RebelHMG_2 doTarget Sniper01;
                                                                                    RebelHMG_1 doWatch Sniper01;
                                                                                    RebelHMG_2 doWatch Sniper01;
                                                                                    {
                                                                                            ["ace_zeus_suppressiveFire", [_x, getPosASL Sniper01, ""], _x] call CBA_fnc_targetEvent;
                                                                                    } forEach [RebelHMG_1,RebelHMG_2];
                                                                                };
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
                                                                                            5 fadeMusic 0;

                                                                                                [{

                                                                                                    playMusic "";
                                                                                                    0 fadeMusic 1;
                                                                                                }, _this, 56] call CBA_fnc_waitAndExecute;
                                                                                        }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                                                                    }, [_camera, _filmgrain, _pos], 1] call CBA_fnc_waitAndExecute;
                                                                                }, _this, 2] call CBA_fnc_waitAndExecute;
                                                                            }, _this, 2] call CBA_fnc_waitAndExecute;
                                                                        }, _this, 2] call CBA_fnc_waitAndExecute;
                                                                    }, _this, 0.2] call CBA_fnc_waitAndExecute;
                                                                    }, _this, 60] call CBA_fnc_waitUntilAndExecute;
                                                                }, [_camera, _filmgrain], 5] call CBA_fnc_waitAndExecute;
                                                            }, _this, 3] call CBA_fnc_waitAndExecute;
                                                        }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                                    }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                                }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                            }, _this, 2.5] call CBA_fnc_waitAndExecute;
                                        }, [_camera, _filmgrain, _pos], 0.2] call CBA_fnc_waitAndExecute;
                                    }, _this, 5] call CBA_fnc_waitAndExecute;
                                }, _this, 5] call CBA_fnc_waitAndExecute;
                            }, _this, 3] call CBA_fnc_waitAndExecute;
                        }, _this, 8] call CBA_fnc_waitAndExecute;
                }, _this, 17] call CBA_fnc_waitAndExecute;
            }, _this, 3.5] call CBA_fnc_waitAndExecute;
        }, _this, 60] call CBA_fnc_waitUntilAndExecute;
    }, [_camera, _filmgrain], 5] call CBA_fnc_waitAndExecute;
}, _this, 4] call CBA_fnc_waitAndExecute;
