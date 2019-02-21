private _blood = "#particlesource" createVehicleLocal (getposATL rebelGuard_1);
_blood setParticleClass "gokoFX_Starter_SparksBurstLOW";

_blood setParticleParams [
    ["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 13, 1, 16],   //model name
    "",   //animation
    "billboard", //type
    0.1, 0.05, //period and lifecycle
    [0, 0, 0], //position

    [0.5 + random -1, 0.5 + random -1, 1], //movement vector
    1, 1, 0.3, 0, //rotation, weight, volume , rubbing
    [0.25, 0.45], //size transform
    [[0.1,0,0,0.001], [0.04,0,0,0.05], [1,1,1,0]],
    [0.00001],
    0.4,
    0.4,
    "",
    "",
    "",
    360, //angle
    false, //on surface
    0 //bounce on surface
];
_blood setdropinterval 0.001;
_blood attachTo [rebelGuard_1, [0,0,-0.1], "neck"];

[{
    { deleteVehicle _x } foreach _this;
}, [_blood], 0.2] call CBA_fnc_waitAndExecute;
