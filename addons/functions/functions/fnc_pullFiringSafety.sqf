#include "script_component.hpp"
/*
 * Author: Salbei
 * Pull the firing pin safety.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_pullFiringSafety
 *
 * Public: No
 */

params ["_target"];

_target setVariable [QGVAR(firingSaftyPulled), true, true];
