params ["_cam", "_target", "_startingAngle", "_endAngle", "_duration", "_radius", ["_clockwise", true], ["_rise", 0]];

private _angleDistance = (_endAngle - _startingAngle) mod 360;
private _steps = if (_clockwise) then {
    (_angleDistance / _duration * 0.01)
}else{
    (0-(_angleDistance / _duration * 0.01))
};

private _riseSteps = switch (true) do {
    case (_rise > 0) : {
        (_rise / _duration * 0.01)
    };
    case (_rise < 0) : {
        (0-(_rise / _duration * 0.01))
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
        if (GRAD_introCam_camAngle == _endAngle || {_duration > time}) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            detach _cam;
            deleteVehicle _camAttachObj;
            GRAD_introCam_camRotateFinisch = true;
            [{GRAD_introCam_camRotateFinisch = nil;},[],1] call CBA_fnc_waitAndExecute;
        };

        GRAD_introCam_camAngle = GRAD_introCam_camAngle + _steps

        private _newPos = _target getPos [_radius, GRAD_introCam_camAngle];
        if (_rise != 0) then {
            _newPos set [2, (((getPosASL _camAttachObj) select 2) + (_riseSteps))];
        };

        _camAttachObj setPosASL _newPos;

    },
    0.01,
    [_camAttachObj, _cam, _target, _steps, _endAngle, (time + _duration + 0.1), _riseSteps, _radius]
]call CBA_fnc_addPerFrameHandler;
