#include "script_component.hpp"
/*
 * Author: Salbei
 * Open the APOBS pack.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_openApobs
 *
 * Public: No
 */

params ["_target"];

_target animate ["apobs_open", 1];

[
    {
        _this animationPhase "apobs_open" == 1
    }, {
        _this setVariable [QGVAR(isClosed), false, true];
    },
    _target
] call CBA_fnc_waitUntilAndExecute;

[_target, false, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
[_target, false, [0,1,1], 0] call ace_dragging_fnc_setDraggable;

[{_this setVariable [QGVAR(isClosed), false, true];}, _target, 1] call CBA_fnc_waitAndExecute;
