#include "script_component.hpp"
/*
 * Author: Salbei
 * Disconnect the rocket.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_disconnectRocket
 *
 * Public: No
 */

params ["_target"];

_target setVariable [QGVAR(rocketConnected), false, true];
