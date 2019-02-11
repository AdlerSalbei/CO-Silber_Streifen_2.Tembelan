if (!hasInterface) exitWith {};

params ["_startPos", "_endPos", "_duration"];

private _pfhTime = 0.1;
_duration = _duration * _pfhTime;

private _objectOrb = "Sign_Sphere10cm_F" createVehiclelocal _startPos;
_objectOrb setObjectMaterial [0, "\a3\data_f\default.rvmat"];
_objectOrb setObjectTexture [0, "#(argb,8,8,3)color(1,1,1,0.5,ca)"];
_objectOrb setPosATL [_poz_ini select 0,_poz_ini select 1, round (2+random 7)];

private _elements = "#particlesource" createVehicleLocal _startPos;
_elements setParticleCircle [0, [0, 0, 0]];
_elements setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_elements setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.3, 11, 7.9, 0.075, [0.003, 0.003, 0.003], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _objectOrb];
_elements setDropInterval 0.01;

private _halo = "#particlesource" createVehicleLocal _startPos;
_halo setParticleCircle [0, [0, 0, 0]];
_halo setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_halo setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_sparks_01.p3d", 1, 0, 1], "", "SpaceObject", 1, 0.1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.5, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _objectOrb];
_halo setDropInterval 0.0033;

private _light = "#lightpoint" createVehiclelocal _startPos;
_light lightAttachObject [_objectOrb, [0,0,0]];
_light setLightColor [1,0,0];
_light setLightAmbient [0.5,0,0];
_light setLightIntensity 100;
_light setLightUseFlare true;
_light setLightFlareSize 2;
_light setLightFlareMaxDistance 500;
_light setLightAttenuation [0.1,0,100,1000,100,500];
_light setLightDayLight true;

private _steps = [0, 0, 0];
{
    _steps set [_forEachIndex, (((_endPos select _forEachIndex) - (_startPos select _forEachIndex)) /_duration)];
}forEach _steps;

[{
    params ["_args", "_handle"];
    _args params ["_objectOrb", "_steps", "_endPos", "_effects"];

    if (getPosATL _objectOrb isEqualTo _endPos) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        {
            deleteVehicle _x;
        }forEach (_effects + [_objectOrb]);
    };

    _objectOrb setPos ((getPos _objectOrb) vectorAdd _steps);

}, _pfhTime, [_objectOrb, _steps, _endPos, [_elements, _halo, _light]]]
