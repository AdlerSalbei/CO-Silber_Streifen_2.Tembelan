params ["_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_offset"];
_offset params ["_offsetX", "_offsetY", "_offsetZ"];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPos _campos1;
};

_camera = "camera" camCreate _campos1;
_camera camSetFov _zoom1;
showCinemaBorder true;
_camera attachTo [_campos2, [_offsetX,_offsetY,_offsetZ]];		
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom2;
_camera camCommitPrepared _duration;
sleep _duration;