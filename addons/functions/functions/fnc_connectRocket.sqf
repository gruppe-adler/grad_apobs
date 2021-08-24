#include "script_component.hpp"
/*
 * Author: Salbei
 * Connect the rocket to the firing line.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canDisconnect
 *
 * Public: No
 */

params ["_target"];

_target setVariable [QGVAR(rocketConnected), true, true];
