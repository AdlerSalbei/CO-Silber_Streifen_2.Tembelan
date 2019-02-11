params ["_pos"];

if (!hasInterface) exitWith {};

private _helper = "Land_HelipadEmpty_F" createVehicleLocal _pos;
private _radius = 50;

// splash
private _splash = "#particlesource" createVehicleLocal _pos;
_splash setParticleCircle [0,[0,0,0]];
_splash setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,0,16,1], "", "Billboard", 1, 0.3, [0,0,10], [0,0,0],5,10,7,0.1, [100,80], [[1,1,1,1],[1,1,1,0]], [1], 1, 0, "", "",_helper];
_splash setDropInterval 0.1;
[{
    deleteVehicle _this;
},_splash, 0.5] call CBA_fnc_waitAndExecute;

// vapors
private _vapors = "#particlesource" createVehicleLocal _pos;
_vapors setParticleCircle [0, [0, 0, 0]];
_vapors setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_vapors setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,0.5,[0,0,0],[0,0,3],0,10,7.9, 0, [10,200], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 0, 0, "", "", _helper];
_vapors setDropInterval 500;
[{
    deleteVehicle _this;
},_vapors, 0.5] call CBA_fnc_waitAndExecute;

// light
private _light = "#lightpoint" createVehicle _pos;
_light lightAttachObject [_helper, [0,0,3]];
_light setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 0, /*quadratic*/ 0, /*hardlimitstart*/_radius,800];
_light setLightIntensity 1000;
_light setLightBrightness _radius;
_light setLightDayLight true;
_light setLightFlareSize 150;
_light setLightFlareMaxDistance 2000;
_light setLightAmbient[1,0.2,0.1];
_light setLightColor[1,0.2,0.1];

[{
    params ["_light","_helper", "_pos", "_radius"];
    // smoke
    private _smoke = "#particlesource" createVehicleLocal _pos;
    _smoke setParticleCircle [_radius/2, [10,10,0]];
    _smoke setParticleRandom [3,[0,0,30],[-60,-60,10],0,0.5,[0, 0, 0, 0.1],1,0];
    _smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,24,1], "", "Billboard", 1, 6, [0,0,25],[0,0,0],5,30,7,0.1, [30,40,50], [[0, 0, 0, 1],[0.349,0.231,0.122,0.5],[0.349,0.231,0.122,0]], [1], 1, 0, "", "",_helper];
    _smoke setDropInterval 0.0001;
    [{
        deleteVehicle _this;
    },_smoke, 2] call CBA_fnc_waitAndExecute;


    private _delaySound = linearConversion [0, 2000, ace_player distance _pos, 0, 1.5, false];
    [{
        _this say3d ["bombExplosion", 2000];
    },_pos, _delaySound] call CBA_fnc_waitAndExecute;

    if ((ace_player distance _pos < 2000) && ((getPosATL ace_player select 2) < 50)) then {
    	enableCamShake true;
    	private _power = linearConversion [0, 2000, ace_player distance _pos, 15, 0.1, true];
    	addCamShake [_power, 5, 50];
    };

    // sparks
    private _sparks = "#particlesource" createVehicleLocal _pos;
    _sparks setParticleCircle [_radius/2, [0, 0, 10]];
    _sparks setParticleRandom [4, [1,1,0], [30,20,80], 0, 0.25, [0, 0, 0,1], 0, 0];
    _sparks setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1,3,[0, 0, 0], [0,0,20],0,200,5,0, [1.5, 1.5, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _helper];
    _sparks setDropInterval 0.001;
    [{
        deleteVehicle _this;
    }, _sparks, 0.3] call CBA_fnc_waitAndExecute;

    [{
        params ["_light", "_helper"];

        _light setLightBrightness 10;

        [{
            GRAD_SS_explosionLightBrightness = 20;
            [
                {
                    params ["_args", "_handle"];
                    _args params ["_light", "_helper"];

                    _light setLightBrightness GRAD_SS_explosionLightBrightness;
                	_light lightAttachObject [_helper, [random 200,random 200,random 200]];
                    GRAD_SS_explosionLightBrightness = GRAD_SS_explosionLightBrightness - 0.1;

                    if (GRAD_SS_explosionLightBrightness <= 0) exitWith {
                        deleteVehicle _light;
                        [_handle] call CBA_fnc_removePerFrameHandler;
                    };
                },
                0.01,
                _this
            ] call CBA_fnc_addPerFrameHandler;
        }, [_light, _helper], 1] call CBA_fnc_waitAndExecute;

        private _delayEcho = linearConversion [0, 2000, ace_player distance _helper, 1, 6, true];
        [{
            playSound "bombExplosionEcho";
            enableCamShake false;

            [{
                deleteVehicle _this;
            }, _this, 20] call CBA_fnc_waitAndExecute;
        }, _helper, _delayEcho] call CBA_fnc_waitAndExecute;
    }, [_light, _helper], 0.5] call CBA_fnc_waitAndExecute;
}, [_light, _helper, _pos, _radius], 0.1] call CBA_fnc_waitAndExecute;
