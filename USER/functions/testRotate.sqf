private _camera = "camera" camCreate (getPos camPos_5);
_camera camSetPos (getPos camPos_0);
_camera camCommand "inertia on";
_camera camSetTarget camTarget_0;
_camera cameraEffect ["internal","back"];
_camera camSetFov 1;
_camera camCommit 0;

private _dir = getDir _camera;
private _distance = _camera distance2D camTarget_0;
private _duration = 5;
private _clockwise = true;
private _rise = 0;

diag_log format ["Camera: %1, Target: %2, Dir: %3, EndDir: %4, Duration: %5, Distance: %6, Clockwise: %7, Rise: %8", _camera, camTarget_0, _dir, (_dir + 180), _duration, _distance, _clockwise, _rise];

[_camera, camTarget_0, _dir, (_dir + 180), _duration, _distance, _clockwise, _rise] call GRAD_SS_fnc_rotateCam;

waitUntil {GRAD_introCam_camRotateFinisch};
hint "Fin";
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
