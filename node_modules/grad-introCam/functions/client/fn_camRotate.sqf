params ["_angleStart", "_angleEnd", "_target", "_duration", "_zoom1", "_zoom2", "_angle", "_radius", "_cclockwise"];

private _timeBegin = time;

private _targetPos = if (_target isEqualType []) then {_target} else {getPos _target};
private _coords = _targetPos getPos [_radius,_angle];

private _angleDelta = _angleEnd - _angleStart;
private _angleDistance = _duration / _angleDelta * 360 * 0.1;

// diag_log ["rotation: %1 + %2 + %3 + %4 + %5 + %6", _angleStart, _angleEnd, _angle, _radius, _angleDelta, _angleDistance];
// ["rotation: %1 + %2 + %3 + %4",150,100,89,scalar NaN]


private _camera = "camera" camCreate _coords;
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia off";
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom1;
_camera camCommitPrepared 0;

while {(time - _timeBegin) < _duration} do {
 	private _targetPos = if (_target isEqualType []) then {_target} else {getPos _target};

    private _coords = _targetPos getPos [_radius,_angle];

    _camera camPreparePos _coords;
    _camera camCommitPrepared 0.1;

    waitUntil {camCommitted _camera};

    _angle = if (_cclockwise) then {_angle - _angleDistance} else {_angle + _angleDistance};

    systemChat format ["angle: %1", _angle];
};