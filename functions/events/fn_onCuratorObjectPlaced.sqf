#include "component.hpp"

params ["", "_object"];

if (_object isKindOf "CAManBase") then {
    [_object] call GRAD_Loadout_fnc_doLoadoutForUnit;
} else {
    private _crew = fullCrew _object;
    if (count _crew > 0) then {
        {[_x] call GRAD_Loadout_fnc_doLoadoutForUnit} forEach _crew;
    };
};
