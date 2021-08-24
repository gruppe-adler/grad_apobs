#include "script_component.hpp"
/*
 * Author: Salbei
 * Close APOBS.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_closeApobs
 *
 * Public: No
 */

params ["_target"];

_target animate ["apobs_open", 0];
[
    {
        _this animationPhase "apobs_open" == 0
    }, {
        _this setVariable [QGVAR(isClosed), true, true];
    },
    _target
] call CBA_fnc_waitUntilAndExecute;

_target setVariable [QGVAR(isClosed), true, true];
[_target, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
[_target, true, [0,1,0], 0] call ace_dragging_fnc_setDraggable;
