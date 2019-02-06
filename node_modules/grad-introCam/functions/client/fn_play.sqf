// dont display for JIP
if (didJIP) exitWith {};

waitUntil {time > 0};

cutText ["INTRO DEMO MISSION", "BLACK IN", 10];

private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

private _count = count _shots;
{
  	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
} forEach _shots;


cutText [" ", "BLACK IN", 3];
_camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;