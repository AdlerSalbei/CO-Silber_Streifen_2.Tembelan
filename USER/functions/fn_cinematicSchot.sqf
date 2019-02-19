cutText ["", "BLACK", 4];
sleep 4;
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


_camera camSetPos getPos snipercam_2;
_camera camSetTarget rebelLeader01;
_camera camCommit 5;
sleep 5;

//_camera camSetTarget rebelLeader01;
//_camera camCommit 2;
//sleep 2;

//[_camera, rebelLeader01, (rebelLeader01 getDir _camera), (rebelLeader01 getDir _camera)+180, 3, (rebelLeader01 distance2D _camera)] call grad_ss_fnc_rotateCam;
//waitUntil {GRAD_introCam_camRotateFinish};

_camera camSetTarget snipercam_target_1;
_camera camCommit 0.5;
sleep 0.5;

_camera camSetPos getPos snipercam_3;
_camera camSetTarget snipercam_target_1;
_camera camCommit 8;
sleep 8;

//[_camera, snipercam_target_1, (snipercam_target_1 getDir _camera), (snipercam_target_1 getDir _camera)+180, 3, (snipercam_target_1 distance2D _camera)] call grad_ss_fnc_rotateCam;
//waitUntil {GRAD_introCam_camRotateFinish};

_camera camSetPos getPos snipercam_4;
_camera camSetTarget Sniper01;
_camera camCommit 4;
sleep 4;

_camera camSetFov 0.7;
_camera camCommit 3;
sleep 3;

_camera camSetPos getPos snipercam_5;
_camera camSetTarget rebelLeader01;
_camera camSetFov 0.5;
_camera camCommit 5;
sleep 5;

_camera camSetPos getPos snipercam_5;
_camera camSetTarget rebelLeader01;
_camera camSetFov 0.2;
_camera camCommit 3;
sleep 5;

showCinemaBorder false;
private _pos = getPos rebelLeader01;
_pos set [2,1.7];
_camera camSetPos getPos snipercam_6;
_camera camSetTarget _pos;
_camera camSetFov 1;
_camera camCommit 0;
sleep 0,2;

_camera camSetTarget (_pos vectorAdd [0,0,0.3]);
_camera camCommit 2.5;
sleep 3;


_camera camSetTarget (_pos vectorAdd [0,0,-0.3]);
_camera camCommit 2.5;
sleep 3;

_camera camSetTarget (_pos vectorAdd [0,0,0.3]);
_camera camCommit 2.5;
sleep 3;

_camera camSetTarget (_pos vectorAdd [0,0,-0.3]);
_camera camCommit 2.5;
sleep 3;

_camera camSetTarget _pos;
_camera camCommit 2;
sleep 4;

showCinemaBorder true;
_camera camSetPos getPos snipercam_5;
_camera camSetTarget rebelLeader01;
_camera camCommit 0;
sleep 5;

Sniper01 doFire rebelGuard_1;
sleep 0.2;

_camera camSetPos getPos snipercam_6;
_camera camCommit 1.8;
sleep 2;
