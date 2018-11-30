#include "script_component.hpp"

params ["_target"];

_target setVariable [QGVAR(firingPinPulled), true, true];

systemChat "Firing Apobs";

[_target] call FUNC(fire);
//[{[_this] call FUNC(fire);},_target,30] call CBA_fnc_waitAndExecute;
