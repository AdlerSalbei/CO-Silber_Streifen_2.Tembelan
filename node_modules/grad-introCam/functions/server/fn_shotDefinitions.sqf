// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/


private _definitions = [
	["ROTATE", 1, 180, target1, 9, 0.3, 0.1, 150, false],
	["ATTACHED", cam2, cam3, target1, 3, 0.1, 0.1, [0,0,5]],
	["FREE", cam4, cam5, target1, 2, 0.1, 0.1, [0,0,10]],
	["FREE", cam5, cam5, target2, 5, 0.1, 0.3, [0,0,50]],
	["ATTACHED", cam5, cam5, target2, 3, 0.3, 0.3, [0,0,3]],
	["ATTACHED", cam5, cam5, target2, 5, 0.3, 0.3, [0,0,10]],
	["ROTATE", 1, 180, target1, 9, 0.3, 0.1, 150, false]
];





/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _definitions;