#include "script_component.hpp"
/*
 * Author: Salbei
 * Pull the firing pin, triggering the firing process.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_pullFiringPin
 *
 * Public: No
 */

params ["_target"];

_target setVariable [QGVAR(firingPinPulled), true, true];

[QGVAR(fire), [_target]] call CBA_fnc_serverEvent;
