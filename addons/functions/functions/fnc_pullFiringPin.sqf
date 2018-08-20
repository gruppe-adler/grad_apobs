#include "script_component.hpp"

params ["_target"];

_target setVariable [QGVAR(firing), true, true];
[{[_this] call FUNC(fire);},_target,30] call CBA_fnc_waitAndExecute;
