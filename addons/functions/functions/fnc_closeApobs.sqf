#include "script_component.hpp"

params ["_target"];

//_target animate ["open", 0];
_target setVariable [QGVAR(isClose), true, true];

/*
[{_this animationPhase "open" == 0},{
     _this setVariable [QGVAR(isClose), true, true];
},_target] call CBA_fnc_waitUntilAndExecute;
*/
