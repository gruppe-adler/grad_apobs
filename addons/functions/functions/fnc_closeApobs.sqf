#include "script_component.hpp"

params ["_target"];

//_target animate ["open", 0];
_target setVariable [QGVAR(isClosed), true, true];
[_target, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
[_target, true, [0,1,0], 0] call ace_dragging_fnc_setDraggable;

/*
[{_this animationPhase "open" == 0},{
     _this setVariable [QGVAR(isClosed), true, true];
},_target] call CBA_fnc_waitUntilAndExecute;
*/
