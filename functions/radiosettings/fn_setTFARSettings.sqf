#include "component.hpp"

//default radios
if (!hasInterface) exitWith {};
[
    {
        (!isNull ace_player && {missionNamespace getVariable ["GRAD_loadoutFactionSet", false]})
    },
    GRAD_radiosettings_fnc_setDefaultRadios,
    []
 ] call CBA_fnc_waitUntilAndExecute;
