params ["_effect", "_music"];
[_effect, 0, false] call BIS_fnc_setPPeffectTemplate;

userTexture1 setObjectTexture [0, "data\intro1.paa"];
userTexture3 setObjectTexture [0, "data\intro3.paa"];

playMusic _music;


cutText ["", "BLACK IN", 8];

[ace_player, "amovpercmstpslowwrfldnon"] remoteExec ["switchMove", 0];

private _filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

private _camera = "camera" camCreate (getPos camPos_0);
_camera camSetPos (getPos camPos_0);
_camera camCommand "inertia on";
_camera camSetTarget camTarget_0;
_camera cameraEffect ["internal","back"];
_camera camSetFov 1;
_camera camCommit 0;
_camera camSetPos (getPos camPos_1);
_camera camSetTarget camTarget_0;
_camera camCommit 5;
sleep 5;
_camera camSetPos (getPos camPos_2);
_camera camSetTarget camTarget_0;
_camera camCommit 5;
sleep 4;
_camera camSetTarget camTarget_2;
_camera camCommit 5;
["Default", 20, false] call BIS_fnc_setPPeffectTemplate;
sleep 10;
_camera camSetPos (getPos camPos_4);
_camera camSetTarget camTarget_1;
_camera camCommit 5;
sleep 10;
_camera camSetPos (getPos camPos_5);
_camera camCommand "inertia on";
_camera camSetTarget ace_player;
_camera camCommit 3;
sleep 2;
_camera camSetPos [getPos ace_player select 0, getPos ace_player select 1, 1.7];
_camera camCommit 5;
sleep 3;
cutText ["", "BLACK OUT", 1];
sleep 1;
_filmgrain ppEffectEnable false;
ppEffectDestroy _filmgrain;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
sleep 1;
cutText ["", "BLACK IN", 1];

cutText ["","BLACK FADED",999];
sleep 2;

userTexture1 setObjectTexture [0, ""];
userTexture3 setObjectTexture [0, ""];

cutText ["", "BLACK IN", 10];

sleep 5;

5 fadeMusic 0;

STHud_UIMode = 1;
[ace_player, "amovpercmstpslowwrfldnon"] remoteExec ["switchMove", 0];

sleep 6;
playMusic "";
0 fadeMusic 1;
