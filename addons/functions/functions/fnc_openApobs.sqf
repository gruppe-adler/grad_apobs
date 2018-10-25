#include "script_component.hpp"

params ["_target"];
/*
_target animate ["open", 1];
[{_this animationPhase "open" == 1},{_this setVariable [QGVAR(isClosed), false, true];},_target] call CBA_fnc_waitUntilAndExecute;
*/
[{_this setVariable [QGVAR(isClosed), false, true];},_target,1] call CBA_fnc_waitUntilAndExecute;
