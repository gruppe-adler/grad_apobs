#include "script_component.hpp"
/*
 * Author: Salbei
 * Check if the firing pin can be pulled.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can pull <BOOLEAN>
 *
 * Example:
 * [obj] call grad_apobs_functions_fnc_canPullFiringPin
 *
 * Public: No
 */

params ["_target"];

if !(_target getVariable [QGVAR(firingSaftyPulled), false]) exitWith { false };
if (_target getVariable [QGVAR(firingPinPulled), false]) exitWith { false };

true
