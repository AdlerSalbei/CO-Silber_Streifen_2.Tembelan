params ["_cam", "_target", "_startingAngle", "_endAngle", "_duration", "_radius", ["_clockwise", true], ["_rise", 0]];

GRAD_introCam_camRotateFinisch = false;
private _angleDistance = (_endAngle - _startingAngle) mod 360;
private _steps = if (_clockwise) then {
    (_angleDistance / _duration)
}else{
    (0-(_angleDistance / _duration))
};

private _riseSteps = if (_rise != 0) then {
        (_rise / _duration)
};

_steps = _steps* 0.01;
_riseSteps = _riseSteps* 0.01;
_duration = _duration* 0.01;

GRAD_introCam_camAngle = _startingAngle;
private _pos = getPos _cam;
private _camAttachObj = "Land_InvisibleBarrier_F" createVehicleLocal _pos;
_camAttachObj setPos _pos;
_cam attachTo [_camAttachObj, [0, 0, 0]];

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

        _camAttachObj setPosASL _newPos;

    },
    0.01,
    [_camAttachObj, _cam, _target, _steps, _endAngle, (time + (_duration * 100) + 0.1), _riseSteps, _radius]
]call CBA_fnc_addPerFrameHandler;
