params ["_cam", "_target", "_startingAngle", "_endAngle", "_duration", "_radius", ["_clockwise", true], ["_rise", 0]];

GRAD_introCam_camRotateFinisch = false;
_duration = _duration* 0.01;
private _angleDistance = (_endAngle - _startingAngle) mod 360;
private _steps = if (_clockwise) then {
    (_angleDistance / _duration)
}else{
    (0-(_angleDistance / _duration))
};

private _riseSteps = switch (true) do {
    case (_rise > 0) : {
        (_rise / _duration)
    };
    case (_rise < 0) : {
        (0-(_rise / _duration))
    };
    default {0};
};
GRAD_introCam_camAngle = _startingAngle;
private _pos = getPos _cam;
private _camAttachObj = "Land_InvisibleBarrier_F" createVehicleLocal _pos;
_camAttachObj setPos _pos;
_cam attachTo [_camAttachObj, [0, 0, 0]];

diag_log format ["Cam: %1, Target: %2, StartAng: %3, EndAng: %4, Duration: %5, Clockwise: %6, Rise: %7, Radius: %8", _cam, _target, _startingAngle, _endAngle, _duration, _clockwise, _rise, _radius];
diag_log format ["ANGDist: %1, Steps: %2, RiseSteps: %3", _angleDistance, _steps, _riseSteps];

[
    {
        params ["_args", "_handle"];
        _args params ["_camAttachObj", "_cam", "_target", "_steps", "_endAngle", "_duration", "_riseSteps", "_radius"];
        if (GRAD_introCam_camAngle == _endAngle || {time > _duration}) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            detach _cam;
            deleteVehicle _camAttachObj;
            GRAD_introCam_camRotateFinisch = true;
            GRAD_introCam_camAngle = nil;
            [{GRAD_introCam_camRotateFinisch = nil;},[],1] call CBA_fnc_waitAndExecute;
        };

        GRAD_introCam_camAngle = GRAD_introCam_camAngle + _steps;

        private _newPos = _target getPos [_radius, GRAD_introCam_camAngle];
        private _height = (getPosASL _camAttachObj) select 2;
        if (_riseSteps != 0) then {
            _newPos set [2, (_height + (_riseSteps))];
        }else{
            _newPos set [2, _height];
        };
        diag_log format ["NewPos: %1, Height: %2, Angle: %3", _newPos, _height, GRAD_introCam_camAngle];
        systemChat format ["NewPos: %1, Height: %2, Angle: %3", _newPos, _height, GRAD_introCam_camAngle];
        _camAttachObj setPosASL _newPos;

    },
    0.01,
    [_camAttachObj, _cam, _target, _steps, _endAngle, (time + (_duration * 100) + 0.1), _riseSteps, _radius]
]call CBA_fnc_addPerFrameHandler;
