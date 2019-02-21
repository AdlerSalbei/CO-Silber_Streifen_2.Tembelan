if (!hasInterface) exitWith {};
params ["_object"];
private _breath = "#particlesource" createVehicleLocal (getposATL _object);
_breath setParticleClass "fx_helmetparts";
_breath setParticleParams
[
["\a3\Data_f\ParticleEffects\Universal\meat_ca", 1, 0, 1], //shape name
"", //anim name
"spaceObject",
0.5, 6, //timer period & life time
[0, 0, 0], //pos
[5 + random -10, 6 + random -12, random 5], //moveVel
1,1.275,0.2,0, //rotation vel, weight, volume, rubbing
[1.6,0], //size transform
[[0.005,0,0,0.05], [0.006,0,0,0.06], [0.2,0,0,0]],
[1000], //animationPhase (speed in config)
1, //randomdirection period
0.1, //random direction intensity
"", //onTimer
"", //before destroy
"", //object
0, //angle
false, //on surface
0.0 //bounce on surface
];
_breath setParticleRandom [0.5, [0, 0, 0], [3.25, 0.25, 2.25], 1, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
_breath setDropInterval 0.01;
_breath attachTo [_object,[0,0,0.2], "head"];
[{
    { deleteVehicle _x } forEach _this;
},[_breath],0.2] call CBA_fnc_waitAndExecute;
};
