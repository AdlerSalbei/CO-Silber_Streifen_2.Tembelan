params ["_cam", "_target", "_startingAngle", "_endAngle", "_duration", ["_radius", 30], ["_clockwise", true], ["_rise", 0]];

GRAD_introCam_camRotateFinish = false;
_startingAngle = _startingAngle mod 360;
_endAngle = _endAngle mod 360;

private _angleDistance = _endAngle - _startingAngle;
if (_clockwise) then {
    if (_endAngle < _startingAngle) then {
        _angleDistance = 360 - _startingAngle + _endAngle;
    };
}else{
    if (_endAngle > _startingAngle) then {
       _angleDistance = (360 - _endAngle) + _startingAngle;
   };
};

private _steps = (_angleDistance / _duration) * 0.01;

private _riseSteps = if (_rise != 0) then {
    ((_rise / _duration) * 0.01)
}else{
    0
};

_duration = _duration* 0.01;

GRAD_introCam_camAngle = _startingAngle;
private _pos = getPosASL _cam;
private _camAttachObj = "HeliHEmpty" createVehicleLocal _pos;
_camAttachObj setPosASL _pos;
_cam attachTo [_camAttachObj, [0, 0, 0]];
_steps = _steps *3;
[
    {
        params ["_args", "_handle"];
        _args params ["_camAttachObj", "_cam", "_target", "_steps", "_endAngle", "_endTime", "_riseSteps", "_radius"];
        if (GRAD_introCam_camAngle == _endAngle || {time > _endTime}) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
			_cam camSetPos (getPos _camAttachObj);
            _cam camCommit 0;
            detach _cam;
            deleteVehicle _camAttachObj;
            GRAD_introCam_camRotateFinish = true;
            GRAD_introCam_camAngle = 0;
            [{GRAD_introCam_camRotateFinish = nil;},[],1] call CBA_fnc_waitAndExecute;
        };

        GRAD_introCam_camAngle = GRAD_introCam_camAngle + _steps;

        private _newPos = _target getPos [_radius, GRAD_introCam_camAngle];
        private _height = (getPosASL _camAttachObj) select 2;
        if (_riseSteps != 0) then {
            _height = _height + (_riseSteps);
        };

        _newPos set [2, _height];
        _camAttachObj setPosASL _newPos;
    },
    0.01,
    [_camAttachObj, _cam, _target, _steps, _endAngle, (time + (_duration * 100) + 0.1), _riseSteps, _radius]
]call CBA_fnc_addPerFrameHandler;
